# Emulates the legacy `use_response_type=false` response behavior using the `AWS.Response`
function legacy_response(
    request::AWS.Request, response::AWS.Response; return_headers=nothing
)
    response_dict_type = something(request.response_dict_type, LittleDict)
    return_headers = something(return_headers, false)

    # When a user defined I/O stream is passed in use the actual `HTTP.Response` body
    # instead of the `AWS.Response` body which requires the I/O stream to be seekable.
    body = if request.response_stream !== nothing
        b"[Message Body was streamed]"
    else
        response.body
    end

    # The stored service name is always lowercase and may not match the module name
    # specified by the user. We'll assume that the typical casing used is titlecase.
    alt_service = "@service $(titlecase(request.service)) use_response_type=true"

    # When a user specifies a `response_dict_type` we'll update the deprecations to show how
    # to use this type.
    # Note: Using overly terse function name to stick within line length. A more descriptive
    # function name would be `response_dict_type_str`.
    tstr = if request.response_dict_type !== nothing
        str -> "$(request.response_dict_type)($str)"
    else
        identity
    end

    # For HEAD request, return headers...
    if request.request_method == "HEAD"
        Base.depwarn(
            "Using \"HEAD\" in AWS requests to return headers is deprecated, " *
            "use `$alt_service` to return an `AWS.Response` allowing for " *
            "header access via " *
            "`$(tstr("response.headers"))`.",
            :legacy_response,
        )

        return response_dict_type(response.headers)
    end

    # Return response stream if requested...
    if something(request.return_stream, false)
        Base.depwarn(
            "The keyword `return_stream` is deprecated, " *
            "use `$alt_service` instead to return an `AWS.Response` allowing for " *
            "streaming access via `response.io`.",
            :legacy_response,
        )

        # When `return_stream` was `true` the backends would create different I/O types to
        # use. We'll replicate that behavior.
        if request.response_stream === nothing
            io = if request.backend isa HTTPBackend
                Base.BufferStream()
            else
                IOBuffer()
            end

            write(io, _rewind(read, response.io))
            request.response_stream = io
        end

        # Emulate HTTP 0.9.14 behavior of always closing the passed in stream. Doing this is
        # particularly important for `Base.BufferStream`.
        if request.backend isa HTTPBackend
            close(request.response_stream)
        end

        return request.response_stream
    elseif request.response_stream !== nothing
        # Emulate HTTP 0.9.14 behavior of always closing the passed in stream and the
        # `read_body` behavior of closing all non-`IOBuffer` streams when `return_stream` is
        # not `true`. Doing this is particularly important for `Base.BufferStream`.
        if request.backend isa HTTPBackend || !(request.response_stream isa IOBuffer)
            close(request.response_stream)
        end
    end

    # Return raw data if requested...
    if something(request.return_raw, false)
        if return_headers
            Base.depwarn(
                "The keywords `return_raw` and `return_headers` are deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw data and header access via " *
                "`response.body`/`response.header`.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "The keyword `return_raw` is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw data access via " *
                "`response.body`.",
                :legacy_response,
            )
        end

        return (return_headers ? (body, response.headers) : body)
    end

    # Parse response data according to mimetype...
    mime = HTTP.header(response.response, "Content-Type", "")

    if isempty(mime)
        if length(body) > 5 && body[1:5] == b"<?xml"
            mime = "text/xml"
        end
    end

    body_str = String(copy(body))

    if occursin(r"/xml", mime)
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "parsed XML and header access via " *
                "`$(tstr("parse(response)"))`/`$(tstr("response.header"))` respectively",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the parsed AWS response is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "parsed XML access via " *
                "`$(tstr("parse(response.body)"))`.",
                :legacy_response,
            )
        end

        xml_dict_type = response_dict_type{Union{Symbol,String},Any}
        xml = parse_xml(body_str)
        root = XMLDict.root(xml.x)

        return (
            if return_headers
                (xml_dict(root, xml_dict_type), response_dict_type(response.headers))
            else
                xml_dict(root, xml_dict_type)
            end
        )
    elseif occursin(r"/x-amz-json-1.[01]$", mime) || endswith(mime, "json")
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "parsed JSON and header access via " *
                "`$(tstr("parse(response)"))`/`$(tstr("response.header"))` respectively",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the parsed AWS response is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "parsed JSON access via " *
                "`$(tstr("parse(response.body)"))`.",
                :legacy_response,
            )
        end

        info = isempty(body) ? nothing : JSON.parse(body_str; dicttype=response_dict_type)
        return (return_headers ? (info, response_dict_type(response.headers)) : info)
    elseif startswith(mime, "text/")
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw string data and header access via " *
                "`String(response.body)`/`$(tstr("response.header"))` respectively.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the raw AWS response body is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw string data access via " *
                "`String(response.body)`.",
                :legacy_response,
            )
        end

        return (
            return_headers ? (body_str, response_dict_type(response.headers)) : body_str
        )
    else
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw data and header access via " *
                "`response.body`/`response.header` respectively.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the raw AWS response body is deprecated, " *
                "use `$alt_service` instead to return an `AWS.Response` allowing for " *
                "raw data access via " *
                "`response.body`.",
                :legacy_response,
            )
        end

        return (return_headers ? (body, response.headers) : body)
    end
end
