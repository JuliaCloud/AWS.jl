struct DownloadsBackend <: AWS.AbstractBackend
    downloader::Union{Nothing, Downloads.Downloader}
end

DownloadsBackend() = DownloadsBackend(nothing)

const AWS_DOWNLOADER = Ref{Union{Nothing, Downloader}}(nothing)
const AWS_DOWNLOAD_LOCK = ReentrantLock()

# Here we mimic Download.jl's own setup for using a global downloader.
# We do this to have our own downloader (separate from Downloads.jl's global downloader)
# because we add a hook to avoid redirects in order to try to match the HTTPBackend's
# implementation, and we don't want to mutate the global downloader from Downloads.jl.
# https://github.com/JuliaLang/Downloads.jl/blob/84e948c02b8a0625552a764bf90f7d2ee97c949c/src/Downloads.jl#L293-L301
function get_downloader(downloader=nothing)
    lock(AWS_DOWNLOAD_LOCK) do
        yield() # let other downloads finish
        downloader isa Downloader && return
        while true
            downloader = AWS_DOWNLOADER[]
            downloader isa Downloader && return
            D = Downloader()
            D.easy_hook = (easy, info) -> Curl.setopt(easy, Curl.CURLOPT_FOLLOWLOCATION, false)
            AWS_DOWNLOADER[] = D
        end
    end
    return downloader
end

# https://github.com/JuliaWeb/HTTP.jl/blob/2a03ca76376162ffc3423ba7f15bd6d966edff9b/src/MessageRequest.jl#L84-L85
body_length(x::Vector{UInt8}) = length(x)
body_length(x::String) = sizeof(x)


function AWS._http_request(backend::DownloadsBackend, request)
    # If we pass `output`, Downloads.jl will expect a message
    # body in the response. Specifically, it sets
    # <https://curl.se/libcurl/c/CURLOPT_NOBODY.html>
    # only when we do not pass the `output` argument.
    #
    # When the method is `HEAD`, the response may have a Content-Length
    # but not send any content back (which appears to be correct,
    # <https://stackoverflow.com/a/18925736/12486544>).
    #
    # Thus, if we did not set `CURLOPT_NOBODY`, and it gets a Content-Length
    # back, it will hang waiting for that body.
    #
    # Therefore, we do not pass an `output` when the `request_method` is `HEAD`.
    if request.return_stream && request.response_stream === nothing
        request.response_stream === IOBuffer()
    end
    output = @something(request.response_stream, IOBuffer())
    output_arg, body_arg = if request.request_method != "HEAD"
        (; output=output), () -> (; body = take!(output))
    else
        NamedTuple(), () -> NamedTuple()
    end

    # HTTP.jl sets this header automatically.
    request.headers["Content-Length"] = string(body_length(request.content))

    # We pass an `input` only when we have content we wish to send.
    input = IOBuffer()
    input_arg = if !isempty(request.content)
        write(input, request.content)
        (; input=input)
    else
        NamedTuple()
    end

    @repeat 4 try
        downloader = @something(backend.downloader, get_downloader())
        # set the hook so that we don't follow redirects. Only
        # need to do this on per-request downloaders, because we
        # set our global one with this hook already.
        if backend.downloader !== nothing
            downloader.easy_hook = (easy, info) -> Curl.setopt(easy, Curl.CURLOPT_FOLLOWLOCATION, false)
        end

        # We seekstart on every attempt, otherwise every attempt
        # but the first will send an empty payload.
        seekstart(input)

        response = Downloads.request(request.url; input_arg..., output_arg...,
                                    method = request.request_method,
                                    headers = request.headers, verbose=false, throw=true,
                                    downloader=downloader)

        http_response = HTTP.Response(response.status, response.headers; body_arg()..., request=nothing)

        if HTTP.iserror(http_response)
            target = HTTP.resource(HTTP.URI(request.url))
            throw(HTTP.StatusError(http_response.status, request.request_method, target, http_response))
        end
        return http_response
    catch e
        @delay_retry if ((isa(e, HTTP.StatusError) && AWS._http_status(e) >= 500) || isa(e, Downloads.RequestError)) end
    end
end
