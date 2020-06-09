module AWSExceptions

using HTTP
using JSON
using XMLDict

export AWSException, ProtocolNotDefined, InvalidFileName

struct ProtocolNotDefined <: Exception
    message::String
end
show(io::IO, e::ProtocolNotDefined) = println(io, e.message)

struct InvalidFileName <: Exception
    message::String
end
show(io::IO, e::InvalidFileName) = println(io, e.message)


struct AWSException <: Exception
    code::String
    message::String
    info
    cause::HTTP.StatusError
end
show(io::IO, e::AWSException) = println(
    io,
    string(e.code, isempty(e.message) ? "" : (" -- " * e.message), "\n", e.cause)
)

http_message(e::HTTP.StatusError) = String(copy(e.response.body))
http_status(e::HTTP.StatusError) = e.status
content_type(e::HTTP.StatusError) = HTTP.header(e.response, "Content-Type")

function AWSException(e::HTTP.StatusError)
    code = string(http_status(e))
    message = "AWSException"
    info = Dict{String, Dict}()

    # Extract API error code from Lambda-style JSON error message...
    if occursin(r"json$", content_type(e))
        info = JSON.parse(http_message(e))
    end

    # Extract API error code from JSON error message...
    if occursin(r"^application/x-amz-json-1\.[01]$", content_type(e))
        info = JSON.parse(http_message(e))
        if haskey(info, "__type")
            code = split(info["__type"], "#")[end]
        end
    end

    # Extract API error code from XML error message...
    error_content_types = ["", "application/xml", "text/xml"]
    if content_type(e) in error_content_types && length(http_message(e)) > 0
        info = parse_xml(http_message(e))
    end

    info = get(info, "Errors", info)
    info = get(info, "Error", info)
    code = get(info, "Code", code)
    message = get(info, "Message", message)
    message = get(info, "message", message)

    return AWSException(code, message, info, e)
end

end
