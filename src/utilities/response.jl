struct Response{S<:IO}
    response::HTTP.Response
    io::S  # I/O type must support `seek`
    dict::Ref{AbstractDict}  # Caches the parsed dict response
end

Response(response::HTTP.Response, io::IO) = Response(response, io, Ref{AbstractDict}())

function Base.getproperty(r::Response, f::Symbol)
    if f === :io || f === :response || f === :dict
        # Direct access to the fields stored in `Response`
        return getfield(r, f)
    elseif f === :body
        # As we're streaming the requests we'll fake the `HTTP.Response` body field
        return _rewind(read, r.io)::Vector{UInt8}
    else
        # Pretend like we're an `HTTP.Response` type for any other field access
        return getproperty(r.response, f)
    end
end

function mime_type(r::Response)
    # Parse response data according to mimetype...
    # Using "application/octet-stream" as the fallback MIME type as recommended by:
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
    mime = HTTP.header(r.response, "Content-Type", "application/octet-stream")

    # When the MIME type is not specified attempt to determine type from first bytes of the
    # stream.
    magic_bytes = if isempty(HTTP.header(r.response, "Content-Type", ""))
        _rewind(r.io) do io
            read(io, 5)
        end
    else
        UInt8[]
    end

    T = if occursin(r"/xml", mime) || magic_bytes == b"<?xml"
        MIME"application/xml"
    elseif occursin(r"/x-amz-json-1.[01]$", mime) || endswith(mime, "json")
        MIME"application/json"
    elseif startswith(mime, "text/")
        MIME"text/plain"
    else
        MIME{Symbol(mime)}  # Unhandled MIME type
    end

    return T
end

function Base.parse(f::Function, r::Response, mime::MIME=mime_type(r)())
    result = _rewind(r.io) do io
        f(io, mime)
    end
    return result
end

Base.parse(r::Response, mime::MIME=mime_type(r)()) = parse(_read, r, mime)

function _read(io::IO, ::MIME"application/xml")
    xml = parse_xml(read(io, String))
    root = XMLDict.root(xml.x)  # Drop XML declaration
    return xml_dict(root, LittleDict{Union{String,Symbol},Any})
end

function _read(io::IO, ::MIME"application/json")
    # Note: Using JSON instead of JSON3 since it does not support OrderedDict/LittleDict
    return JSON.parse(io; dicttype=LittleDict{String,Any})
end

_read(io::IO, ::MIME"text/plain") = read(io, String)
_read(io::IO, ::MIME) = read(io)

# Dict-like access
function _dict(r::Response)
    if !isassigned(r.dict)
        dict = parse(r)::AbstractDict
        r.dict[] = dict
    end

    return r.dict[]
end

Base.getindex(r::Response, key::Union{AbstractString,Symbol}) = getindex(_dict(r), key)
Base.haskey(r::Response, key::Union{AbstractString,Symbol}) = haskey(_dict(r), key)
Base.keys(r::Response) = keys(_dict(r))
Base.values(r::Response) = values(_dict(r))

function Base.iterate(r::Response)
    iter = parse(r)
    x = iterate(iter)
    x === nothing && return nothing
    el, s = x
    return (el, (iter, s))
end

function Base.iterate(r::Response, state)
    iter, s = state
    x = iterate(iter, s)
    x === nothing && return nothing
    el, s = x
    return (el, (iter, s))
end

Base.String(r::Response) = _rewind(io -> read(io, String), r.io)

function Base.show(io::IO, m::MIME"text/plain", r::Response)
    println(io, "$(Response): $(mime_type(r)()) interpreted as:")

    content = parse(r)
    show(io, m, content)

    return nothing
end

function _rewind(f::Function, io::IO)
    pos = position(io)
    seekstart(io)
    result = try
        f(io)
    finally
        seek(io, pos)
    end
    return result
end
