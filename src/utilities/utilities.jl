# This file contains functions used in the high level service definitions
_merge(a::AbstractDict, b::AbstractDict) = merge(a, b)
_merge(a::AbstractString, b::AbstractString) = b

function _flatten_query(service::String, query::AbstractDict{String, <: Any})
    return _flatten_query!(Pair{String, String}[], service, query)
end

function _flatten_query!(result::Vector{Pair{String, String}}, service::String, query::AbstractDict{String, <:Any}, prefix::String="")
    for (k, v) in query
        if v isa AbstractDict
            _flatten_query!(result, service, v, string(prefix, k, "."))
        elseif v isa AbstractArray
            for (i, j) in enumerate(v)
                suffix = service in ("ec2", "sqs") ? "" : ".member"
                prefix_key = string(prefix, k, suffix, ".", i)

                if j isa AbstractDict
                    _flatten_query!(result, service, j, string(prefix_key, "."))
                else
                    push!(result, Pair(prefix_key, string(j)))
                end
            end
        else
            push!(result, Pair(string(prefix, k), string(v)))
        end
    end

    return result
end


"""
Escape special AWS S3 characters in the path of the uri properly.

AWS S3 allows for various special characters in file names, these characters are not being
properly escaped before we make the requests.

We cannot call `HTTP.escapeuri(request.uri)` because this will escape `/` characters which
are used in the filepathing for sub-directories.
"""
function _clean_s3_uri(uri::AbstractString)
    chars_to_clean = (
        ' ' => "%20",
        '!' => "%21",
        ''' => "%27",
        '(' => "%28",
        ')' => "%29",
        '*' => "%2A",
        '+' => "%2B",
        ',' => "%2C",
        '=' => "%3D",
        '@' => "%40",
    )
    parsed_uri = URIs.URI(uri)
    cleaned_path = reduce(replace, chars_to_clean, init=parsed_uri.path)
    return string(URIs.URI(parsed_uri; path=cleaned_path))
end


function _extract_common_kw_args(service, args)
    return (
        service=service.name,
        api_version=service.api_version,
        return_stream=_pop!(args, "return_stream", false),
        return_raw=_pop!(args, "return_raw", false),
        response_stream=_pop!(args, "response_stream", nothing),
        headers=LittleDict{String, String}(_pop!(args, "headers", [])),
        http_options=_pop!(args, "http_options", LittleDict{Symbol, String}()),
        response_dict_type=_pop!(args, "response_dict_type", LittleDict),
        backend=_pop!(args, "backend", DEFAULT_BACKEND[]),
    )
end


# Use this until the three arg pop! is available for LittleDict
# https://github.com/JuliaCollections/OrderedCollections.jl/pull/59
function _pop!(dict::AbstractDict{String, <: Any}, kw, default)
    if haskey(dict,kw)
        val = dict[kw]
        delete!(dict, kw)

        return val
    else
        return default
    end
end


function _generate_rest_resource(request_uri::String, args::AbstractDict{String, <:Any})
    # There maybe a time where both $k and $k+ are in the request_uri, in which case this needs to be updated
    # From looking around, I have not seen an example yet, however that doesn't mean it doesn't exist

    for (k,v) in args
        if occursin("{$k}", request_uri)
            request_uri = replace(request_uri, "{$k}" => v)
        elseif occursin("{$k+}", request_uri)
            request_uri = replace(request_uri, "{$k+}" => HTTP.escapepath(v))
        end
    end

    return request_uri
end
