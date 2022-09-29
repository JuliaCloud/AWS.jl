# This file contains functions used in the high level service definitions
_merge(a::AbstractDict, b::AbstractDict) = merge(a, b)
_merge(a::AbstractString, b::AbstractString) = b

function _flatten_query(service::String, query::AbstractDict{String,<:Any})
    return _flatten_query!(Pair{String,String}[], service, query)
end

function _flatten_query!(
    result::Vector{Pair{String,String}},
    service::String,
    query::AbstractDict{String,<:Any},
    prefix::String="",
)
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
        ':' => "%3A",
        '=' => "%3D",
        '@' => "%40",
    )
    parsed_uri = URIs.URI(uri)
    cleaned_path = reduce(replace, chars_to_clean; init=parsed_uri.path)
    return string(URIs.URI(parsed_uri; path=cleaned_path))
end

function _extract_common_kw_args(service, args)
    return (
        service=service.signing_name,
        api_version=service.api_version,
        response_stream=_pop!(args, "response_stream", nothing),
        headers=LittleDict{String,String}(_pop!(args, "headers", [])),
        http_options=_pop!(args, "http_options", LittleDict{Symbol,String}()),
        backend=_pop!(args, "backend", DEFAULT_BACKEND[]),

        # Deprecated keywords
        return_stream=_pop!(args, "return_stream", nothing),
        return_raw=_pop!(args, "return_raw", nothing),
        response_dict_type=_pop!(args, "response_dict_type", nothing),
    )
end

function _delete_legacy_response_kw_args!(args)
    used_kw_args = intersect(
        keys(args), ("return_headers", "return_stream", "return_raw", "response_dict_type")
    )

    if !isempty(used_kw_args)
        Base.depwarn(
            "The parameter(s) \"$(join(used_kw_args, "\", \""))\" are no longer " *
            "supported when the feature `use_response_type` is enabled.",
            :_delete_legacy_response_kw_args!,
        )
    end

    delete!(args, "return_headers")
    delete!(args, "return_stream")
    delete!(args, "return_raw")
    delete!(args, "response_dict_type")
    return args
end

# Use this until the three arg pop! is available for LittleDict
# https://github.com/JuliaCollections/OrderedCollections.jl/pull/59
function _pop!(dict::AbstractDict{String,<:Any}, kw, default)
    if haskey(dict, kw)
        val = dict[kw]
        delete!(dict, kw)

        return val
    else
        return default
    end
end

function _generate_rest_resource(request_uri::String, args::AbstractDict{String,<:Any})
    # There maybe a time where both $k and $k+ are in the request_uri, in which case this needs to be updated
    # From looking around, I have not seen an example yet, however that doesn't mean it doesn't exist

    for (k, v) in args
        if occursin("{$k}", request_uri)
            request_uri = replace(request_uri, "{$k}" => v)
        elseif occursin("{$k+}", request_uri)
            request_uri = replace(request_uri, "{$k+}" => HTTP.escapepath(v))
        end
    end

    return request_uri
end

function _assignment_to_kw!(expr::Expr)
    if expr.head === :(=)
        expr.head = :kw
    else
        throw(ArgumentError("Expected assignment expression, instead found: `$expr`"))
    end

    return expr
end

function _assignment_to_kw!(x)
    return throw(ArgumentError("Expected assignment expression, instead found: `$x`"))
end

# https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html
# Default values for AWS's `standard` retry mode. Note: these can be overridden elsewhere.
Base.@kwdef struct AWSExponentialBackoff
    max_attempts::Int = 3
    max_backoff::Float64 = 20.0
    rng::AbstractRNG = Random.GLOBAL_RNG
end

# We make one more attempt than the number of delays
Base.length(exp::AWSExponentialBackoff) = exp.max_attempts - 1

function Base.iterate(exp::AWSExponentialBackoff, i=1)
    i >= exp.max_attempts && return nothing
    # rand() has values in [0, 1), so we use 1.0 - rand() which has values in (0, 1] required.
    b = 1.0 - rand(exp.rng)
    r = 2.0
    delay = min(b * r^i, exp.max_backoff)
    return delay, i + 1
end

function _generate_path_url(service, reg, resource)
    return string(
        "https://", service, ".", isempty(reg) ? "" : "$reg.", SERVICE_HOST[], resource
    )
end