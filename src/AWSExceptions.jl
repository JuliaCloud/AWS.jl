module AWSExceptions

using HTTP
using JSON
using XMLDict
using XMLDict: XMLDictElement

export AWSException, ProtocolNotDefined, InvalidFileName, NoCredentials

struct ProtocolNotDefined <: Exception
    message::String
end
Base.show(io::IO, e::ProtocolNotDefined) = println(io, e.message)

struct InvalidFileName <: Exception
    message::String
end
Base.show(io::IO, e::InvalidFileName) = println(io, e.message)

struct NoCredentials <: Exception
    message::String
end
Base.show(io::IO, e::NoCredentials) = println(io, e.message)

struct AWSException <: Exception
    code::String
    message::String
    info::Union{XMLDictElement,Dict,String,Nothing}
    cause::HTTP.StatusError
    streamed_body::Union{String,Nothing}
end

function AWSException(code, message, info, cause)
    return AWSException(code, message, info, cause, nothing)
end

function Base.show(io::IO, e::AWSException)
    print(io, AWSException, ": ", e.code)
    !isempty(e.message) && print(io, " -- ", e.message)
    print(io, "\n\n", e.cause)

    # When the response is streamed then `e.cause` will not show the response body
    if e.streamed_body !== nothing
        print(io, "\n\n")
        if isempty(e.streamed_body)
            printstyled(io, "(empty body)"; bold=true)
        else
            print(io, e.streamed_body)
        end
    end

    println(io)
    return nothing
end

AWSException(e::HTTP.StatusError) = AWSException(e, String(copy(e.response.body)))
AWSException(e::HTTP.StatusError, io::IOBuffer) = AWSException(e, String(take!(io)))

function AWSException(e::HTTP.StatusError, stream::IO)
    seekstart(stream)
    body = read(stream, String)
    return AWSException(e, body)
end

function AWSException(e::HTTP.StatusError, body::AbstractString)
    content_type = HTTP.header(e.response, "Content-Type")
    code = string(e.status)
    message = "AWSException"
    info = Dict{String,Dict}()

    try
        if !isempty(body)
            # Extract API error code from Lambda-style JSON error message...
            if endswith(content_type, "json")
                info = JSON.parse(body)
            end

            # Extract API error code from JSON error message...
            if occursin(r"^application/x-amz-json-1\.[01]$", content_type)
                info = JSON.parse(body)
                if haskey(info, "__type")
                    code = rsplit(info["__type"], '#'; limit=2)[end]
                end
            end

            # Extract API error code from XML error message...
            if endswith(content_type, "/xml") || startswith(body, "<?xml")
                info = parse_xml(body)
            end
        elseif parse(Int, HTTP.header(e.response, "Content-Length", "0")) > 0
            # Should only occur streaming a response and error handling is improperly configured
            @error "Internal Error: provided body is empty while the reported content-length " *
                "is non-zero"
        end
    catch err
        # Avoid throwing internal exceptions when parsing the error as this will result
        # in the streamed content being hidden from the user.
        @error sprint() do io
            println(io, "Internal error: Failed to extract API error code:")
            Base.showerror(io, err)
            Base.show_backtrace(io, catch_backtrace())
            println(io)
        end
    end

    # There are times when Errors or Error are returned back
    info = get(info, "Errors", info)
    info = get(info, "Error", info)

    code = get(info, "Code", code)

    # There are also times when the response back is (M|m)essage
    message = get(info, "Message", message)
    message = get(info, "message", message)

    streamed_body = !HTTP.isbytes(e.response.body) ? body : nothing

    return AWSException(code, message, info, e, streamed_body)
end

end
