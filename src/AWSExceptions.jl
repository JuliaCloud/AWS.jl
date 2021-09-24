module AWSExceptions

using HTTP
using JSON
using XMLDict
using XMLDict: XMLDictElement

const BODY_STREAMED_PLACEHOLDER = b"[Message Body was streamed]"

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

function Base.show(io::IO, e::AWSException)
    print(io, AWSException, ": ", e.code)
    !isempty(e.message) && print(io, " -- ", e.message)
    print(io, "\n\n", e.cause)

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

http_status(e::HTTP.StatusError) = e.status
content_type(e::HTTP.StatusError) = HTTP.header(e.response, "Content-Type")
is_valid_xml_string(str) = startswith(str, '<')

AWSException(e::HTTP.StatusError) = AWSException(e, String(copy(e.response.body)))

function AWSException(e::HTTP.StatusError, stream::IO)
    seekstart(stream)
    body = read(stream, String)
    return AWSException(e, body)
end

function AWSException(e::HTTP.StatusError, body::AbstractString)
    code = string(http_status(e))
    message = "AWSException"
    info = Dict{String,Dict}()

    if !isempty(body)
        # Extract API error code from Lambda-style JSON error message...
        if endswith(content_type(e), "json")
            info = JSON.parse(body)
        end

        # Extract API error code from JSON error message...
        if occursin(r"^application/x-amz-json-1\.[01]$", content_type(e))
            info = JSON.parse(body)
            if haskey(info, "__type")
                code = rsplit(info["__type"], '#'; limit=2)[end]
            end
        end

        # Extract API error code from XML error message...
        error_content_types = ["", "application/xml", "text/xml"]
        if content_type(e) in error_content_types && is_valid_xml_string(body)
            info = parse_xml(body)
        end
    elseif parse(Int, HTTP.header(e.response, "Content-Length", "0")) > 0
        @error "Internal Error: provided body is empty while the reported content-length is non-zero"
    end

    # There are times when Errors or Error are returned back
    info = get(info, "Errors", info)
    info = get(info, "Error", info)

    code = get(info, "Code", code)

    # There are also times when the response back is (M|m)essage
    message = get(info, "Message", message)
    message = get(info, "message", message)

    streamed_body = e.response.body == BODY_STREAMED_PLACEHOLDER ? body : nothing

    return AWSException(code, message, info, e, streamed_body)
end

end
