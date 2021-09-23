function legacy_response(
    request::AWS.Request, response::AWS.Response; return_headers=nothing
)
    response_dict_type = something(request.response_dict_type, LittleDict)
    return_headers = something(return_headers, false)

    # if response_dict_type !== nothing
    #     Base.depwarn(
    #         "The keyword `response_dict_type` is deprecated,
    #         "use `legacy=false` instead to return an `AWS.Response` allowing for " *
    #         "direct access and app)

    # For HEAD request, return headers...
    if request.request_method == "HEAD"
        Base.depwarn(
            "Using \"HEAD\" in AWS requests to return headers is deprecated, " *
            "use `legacy=false` to return an `AWS.Response` allowing for " *
            "header access via " *
            "`$(response_dict_type)(response.headers)`.",
            :legacy_response,
        )

        return response_dict_type(response.headers)
    end

    # Return response stream if requested...
    if something(request.return_stream, false)
        Base.depwarn(
            "The keyword `return_stream` is deprecated, " *
            "use `legacy=false` instead to return an `AWS.Response` allowing for " *
            "streaming access via `response.io`.",
            :legacy_response,
        )

        return request.response_stream
    end

    # Return raw data if requested...
    if something(request.return_raw, false)
        if return_headers
            Base.depwarn(
                "The keywords `return_raw` and `return_headers` are deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw data and header access via " *
                "`response.body`/`response.header`.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "The keyword `return_raw` is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw data access via " *
                "`response.body`.",
                :legacy_response,
            )
        end

        return (return_headers ? (response.body, response.headers) : response.body)
    end

    # Parse response data according to mimetype...
    mime = HTTP.header(response.response, "Content-Type", "")

    if isempty(mime)
        if length(response.body) > 5 && response.body[1:5] == b"<?xml"
            mime = "text/xml"
        end
    end

    body = String(copy(response.body))

    if occursin(r"/xml", mime)
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "parsed XML and header access via " *
                "`parse(response)`/`$(response_dict_type)(response.header)` respectively",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the parsed AWS response is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "parsed XML access via " *
                "`parse(response.body)`.",
                :legacy_response,
            )
        end

        xml_dict_type = response_dict_type{Union{Symbol,String},Any}
        body = parse_xml(body)
        root = XMLDict.root(body.x)

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
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "parsed JSON and header access via " *
                "`parse(response)`/`$(response_dict_type)(response.header)` respectively",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the parsed AWS response is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "parsed JSON access via " *
                "`parse(response.body)`.",
                :legacy_response,
            )
        end

        info =
            isempty(response.body) ? nothing : JSON.parse(body; dicttype=response_dict_type)
        return (return_headers ? (info, response_dict_type(response.headers)) : info)
    elseif startswith(mime, "text/")
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw string data and header access via " *
                "`String(response.body)`/`$(response_dict_type)(response.header)` respectively.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the AWS response body is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw string data access via " *
                "`String(response.body)`.",
                :legacy_response,
            )
        end

        return (return_headers ? (body, response_dict_type(response.headers)) : body)
    else
        if return_headers
            Base.depwarn(
                "The keyword `return_headers` is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw data and header access via " *
                "`response.body`/`response.header` respectively.",
                :legacy_response,
            )
        else
            Base.depwarn(
                "Returning the AWS response body is deprecated, " *
                "use `legacy=false` instead to return an `AWS.Response` allowing for " *
                "raw data access via " *
                "`response.body`.",
                :legacy_response,
            )
        end

        return (return_headers ? (response.body, response.headers) : response.body)
    end
end
