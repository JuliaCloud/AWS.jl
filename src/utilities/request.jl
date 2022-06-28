# Used to allow custom dispatches to `_http_request`
"""
    AWS.AbstractBackend

An abstract type representing a "backend" to use as an HTTP client
to connect to the AWS REST API.
"""
abstract type AbstractBackend end

"""
    AWS.HTTPBackend <: AWS.AbstractBackend

This backend uses HTTP.jl as an HTTP client to connect to the AWS
REST API, and has one field:

- `http_options::AbstractDict{Symbol,<:Any}`

which defaults to an empty dictionary. This field provides
default options to use, which can be any of the keyword
arguments to [`HTTP.request`](https://juliaweb.github.io/HTTP.jl/stable/public_interface/#HTTP.request). These options are overwritten by any per-request options.

This is the default backend, and the only option until AWS.jl v1.57.0. Therefore, it has
been used more often in practice, and may be more mature. Note, however, HTTP.jl currently
(March 2022) has issues with concurrency (see [HTTP.jl#517](https://github.com/JuliaWeb/HTTP.jl/issues/517)). Therefore, it may be advisable to switch to the [`DownloadsBackend`](@ref) if you
are using concurrency.
"""
struct HTTPBackend <: AbstractBackend
    http_options::AbstractDict{Symbol,<:Any}
end

function statuserror(status, resp)
    return HTTP.StatusError(status, resp.request.method, resp.request.target, resp)
end

function HTTPBackend(; kwargs...)
    return if isempty(kwargs)
        HTTPBackend(LittleDict{Symbol,Any}())
    else
        HTTPBackend(LittleDict(kwargs))
    end
end
# populated in `__init__`
"""
    AWS.DEFAULT_BACKEND = Ref{AbstractBackend}()

This specifies the default backend to use. This can be modified
to change the default backend used by AWS.jl:

```julia
using AWS
AWS.DEFAULT_BACKEND[] = AWS.DownloadsBackend()
```

As an alternative, the `backend` can be specified on a per-request basis, by
adding a pair `"backend" => AWS.DownloadsBackend()` to the `params` argument of
AWS.jl functions.

!!! warning
    Setting the `AWS.DEFAULT_BACKEND` is a global change that affects all packages in your Julia session using AWS.jl. Therefore, it is not recommended for library code to change the default backend, and instead set the backend on a per-request basis if needed (or ask the user to set a default backend). If you do wish to change the default backend inside package code which is precompiled, then it must be changed from within the `__init__` method. See the [Julia manual](https://docs.julialang.org/en/v1/manual/modules/#Module-initialization-and-precompilation) for more on module initialization.
"""
const DEFAULT_BACKEND = Ref{AbstractBackend}()

Base.@kwdef mutable struct Request
    service::String
    api_version::String
    request_method::String

    headers::AbstractDict{String,String} = LittleDict{String,String}()
    content::Union{String,Vector{UInt8}} = ""
    resource::String = ""
    url::String = ""

    # Note: User provided `IO` should support seeking in order to support API error handling
    response_stream::Union{IO,Nothing} = nothing

    http_options::AbstractDict{Symbol,<:Any} = LittleDict{Symbol,String}()
    backend::AbstractBackend = DEFAULT_BACKEND[]

    # Deprecated fields
    use_response_type::Bool = false
    return_stream::Union{Bool,Nothing} = nothing
    return_raw::Union{Bool,Nothing} = nothing
    response_dict_type::Union{Type{<:AbstractDict},Nothing} = nothing
end

"""
    submit_request(aws::AbstractAWSConfig, request::Request; return_headers::Bool=false)

Submit the request to AWS.

# Arguments
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `request::Request`: All the information about making a request to AWS

# Keywords
- `return_headers::Bool=false`: Set to `true` if you want the headers from the response returned back. Only
  used if `request.use_response_type = false`.

# Returns
- `AWS.Response`: A struct containing the response details
"""
function submit_request(aws::AbstractAWSConfig, request::Request; return_headers=nothing)
    aws_response = nothing
    TOO_MANY_REQUESTS = 429
    EXPIRED_ERROR_CODES = ["ExpiredToken", "ExpiredTokenException", "RequestExpired"]
    REDIRECT_ERROR_CODES = [301, 302, 303, 304, 305, 307, 308]
    THROTTLING_ERROR_CODES = [
        "Throttling",
        "ThrottlingException",
        "ThrottledException",
        "RequestThrottledException",
        "TooManyRequestsException",
        "ProvisionedThroughputExceededException",
        "LimitExceededException",
        "RequestThrottled",
        "PriorRequestNotComplete",
    ]

    request.headers["User-Agent"] = user_agent[]
    request.headers["Host"] = HTTP.URI(request.url).host
    stream = @something request.response_stream IOBuffer()

    local aws_response
    local response

    get_response = function ()
        credentials(aws) === nothing || sign!(aws, request)

        aws_response = @mock _http_request(request.backend, request, stream)
        response = aws_response.response

        if response.status in REDIRECT_ERROR_CODES
            if HTTP.header(response, "Location") != ""
                request.url = HTTP.header(response, "Location")
            else
                e = statuserror(response.status, response)
                throw(AWSException(e, stream))
            end
        end
    end

    function upgrade_error(f)
        return () -> try
            return f()
        catch e
            if e isa HTTP.StatusError
                e = AWSException(e, stream)
                rethrow(e)
            end
            rethrow()
        end
    end

    check = function (s, e)
        # Pass on non-AWS exceptions.
        if !(e isa AWSException)
            return false
        end

        occursin("Signature expired", e.message) && return true

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        if e isa AWSException && e.code in EXPIRED_ERROR_CODES
            check_credentials(credentials(aws); force_refresh=true)
            return true
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        if _http_status(e.cause) == TOO_MANY_REQUESTS || e.code in THROTTLING_ERROR_CODES
            return true
        end

        # Handle BadDigest error and CRC32 check sum failure
        if _header(e.cause, "crc32body") == "x-amz-crc32" ||
            e.code in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
            return true
        end

        if occursin("Missing Authentication Token", e.message) &&
            aws.credentials === nothing
            return throw(
                NoCredentials(
                    "You're attempting to perform a request without credentials set."
                ),
            )
        end
        return false
    end

    delays = AWSExponentialBackoff(; max_attempts=3)

    retry(upgrade_error(get_response); check=check, delays=delays)()

    if request.use_response_type
        return aws_response
    else
        return legacy_response(request, aws_response; return_headers=return_headers)
    end
end

function _http_request(http_backend::HTTPBackend, request::Request, response_stream::IO)
    http_options = merge(http_backend.http_options, request.http_options)

    local buffer
    local response

    get_response = function ()
        # Use a sacrificial I/O stream so that we only write to the `response_stream`
        # once even with multiple attempted requests. Additionally this works around the
        # HTTP.jl issue (https://github.com/JuliaWeb/HTTP.jl/issues/543) where the
        # `response_stream` is closed automatically. Effectively, this works as if we're
        # not using streaming I/O at all, as we write all data at once, but only
        # returning data via I/O ensures we aren't relying on response's body being
        # populated.
        buffer = Base.BufferStream()

        response = @mock HTTP.request(
            request.request_method,
            HTTP.URI(request.url),
            HTTP.mkheaders(request.headers),
            request.content;
            redirect=false,
            retry=false,
            response_stream=buffer,
            http_options...,
        )

        # We'll rely on lexical scoping; `buffer` and `response`
        # are bindings in the outer scope, so we don't need to return here.
        return nothing
    end

    check = function (s, e)
        return isa(e, HTTP.ConnectError) ||
               isa(e, HTTP.RequestError) ||
               (isa(e, HTTP.StatusError) && _http_status(e) >= 500)
    end

    delays = AWSExponentialBackoff(; max_attempts=4)

    try
        retry(get_response; check=check, delays=delays)()
    finally
        # We're unable to read from the `Base.BufferStream` until it has been closed.
        # HTTP.jl will close passed in `response_stream` keyword. This ensures that it
        # is always closed (e.g. HTTP.jl 0.9.15)
        close(buffer)

        # Transfer the contents of the `BufferStream` into `response_stream` variable.
        write(response_stream, buffer)
    end

    return @mock Response(response, response_stream)
end

_http_status(e::HTTP.StatusError) = e.status
_header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)
