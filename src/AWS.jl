module AWS

using Base64
using HTTP
using MbedTLS
using Mocking
using OrderedCollections: LittleDict, OrderedDict
using Retry
using Sockets
using XMLDict

export @service
export AWSConfig, AWSExceptions, AWSServices, Request, set_user_agent, _merge
export JSONService, RestJSONService, RestXMLService, QueryService

include("_utilities.jl")
include("AWSCredentials.jl")
include("AWSConfig.jl")
include("AWSExceptions.jl")
include("AWSMetadataUtilities.jl")

using ..AWSExceptions
using ..AWSExceptions: AWSException

global user_agent = "AWS.jl/1.0.0"

set_user_agent(new_user_agent::String) = return global user_agent = new_user_agent

macro service(module_name::Symbol)
    service_name = joinpath(@__DIR__, "services", lowercase(string(module_name)) * ".jl")

    return Expr(:toplevel,
    :(module($(esc(module_name)))
        Base.include($(esc(module_name)), $(esc(service_name)))
     end))
end

struct RestXMLService
    name::String
    api_version::String
end

struct QueryService
    name::String
    api_version::String
end

struct JSONService
    name::String
    api_version::String

    json_version::String
    target::String
end

struct RestJSONService
    name::String
    api_version::String

    service_specific_headers::LittleDict{String, String}
end

RestJSONService(name::String, api_version::String) = RestJSONService(name, api_version, LittleDict{String, String}())

Base.@kwdef mutable struct Request
    service::String
    api_version::String
    request_method::String

    headers::AbstractDict{String, String}=LittleDict{String, String}()
    content::String=""
    resource::String=""
    url::String=""

    return_stream::Bool=false
    response_stream::Union{Base.BufferStream, Nothing}=nothing
    http_options::Array{String}=[]
    return_raw::Bool=false
    response_dict_type::Type{<:AbstractDict}=LittleDict
end

# Needs to be included after the definition of struct otherwise it cannot find them
include("AWSServices.jl")

http_status(e::HTTP.StatusError) = e.status
header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)

function _sign!(aws::AWSConfig, request::Request; time::DateTime=now(Dates.UTC))
    if request.service in ("sdb", "importexport")
        _sign_aws2!(aws, request, time)
    else
        _sign_aws4!(aws, request, time)
    end
end

function _sign_aws2!(aws::AWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 2 Authentication query parameters.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html

    query = Dict{String, String}()
    for elem in split(request.content, '&', keepempty=false)
        (n, v) = split(elem, "=")
        query[n] = HTTP.unescapeuri(v)
    end

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    creds = check_credentials(aws.credentials)
    query["AWSAccessKeyId"] = creds.access_key_id
    query["Expires"] = Dates.format(time + Dates.Second(120), dateformat"yyyy-mm-dd\THH:MM:SS\Z")
    query["SignatureVersion"] = "2"
    query["SignatureMethod"] = "HmacSHA256"

    if !isempty(creds.token)
        query["SecurityToken"] = creds.token
    end

    query = Pair[k => query[k] for k in sort(collect(keys(query)))]
    uri = HTTP.URI(request.url)
    to_sign = "POST\n$(uri.host)\n$(uri.path)\n$(HTTP.escapeuri(query))"
    push!(query, "Signature" => digest(MD_SHA256, to_sign, creds.secret_key) |> base64encode |> strip)

    request.content = HTTP.escapeuri(query)

    return request
end

function _sign_aws4!(aws::AWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 4 Authentication Headers.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html

    date = Dates.format(time,"yyyymmdd")
    datetime = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

    # Authentication scope...
    authentication_scope = [date, aws.region, request.service, "aws4_request"]

    creds = check_credentials(aws.credentials)
    signing_key = "AWS4$(creds.secret_key)"

    for scope in authentication_scope
        signing_key = digest(MD_SHA256, scope, signing_key)
    end

    # Authentication scope string...
    authentication_scope = join(authentication_scope, "/")

    # SHA256 hash of content...
    content_hash = bytes2hex(digest(MD_SHA256, request.content))

    # HTTP headers...
    delete!(request.headers, "Authorization")

    merge!(request.headers, Dict(
        "x-amz-content-sha256" => content_hash,
        "x-amz-date" => datetime,
        "Content-MD5" => base64encode(digest(MD_MD5, request.content))
    ))

    if !isempty(creds.token)
        request.headers["x-amz-security-token"] = creds.token
    end

    # Sort and lowercase() Headers to produce canonical form...
    canonical_headers = join(sort(["$(lowercase(k)):$(strip(v))" for (k,v) in request.headers]), "\n")
    signed_headers = join(sort([lowercase(k) for k in keys(request.headers)]), ";")

    # Sort Query String...
    uri = HTTP.URI(request.url)
    query = HTTP.URIs.queryparams(uri.query)
    query = Pair[k => query[k] for k in sort(collect(keys(query)))]

    # Create hash of canonical request...
    canonical_form = string(
        request.request_method, "\n",
        request.service == "s3" ? uri.path : HTTP.escapepath(uri.path), "\n",
        HTTP.escapeuri(query), "\n",
        canonical_headers, "\n\n",
        signed_headers, "\n",
        content_hash
    )

    canonical_hash = bytes2hex(digest(MD_SHA256, canonical_form))

    # Create and sign "String to Sign"...
    string_to_sign = "AWS4-HMAC-SHA256\n$datetime\n$authentication_scope\n$canonical_hash"
    signature = bytes2hex(digest(MD_SHA256, string_to_sign, signing_key))

    # Append Authorization header...
    request.headers["Authorization"] = string(
        "AWS4-HMAC-SHA256 ",
        "Credential=$(creds.access_key_id)/$authentication_scope, ",
        "SignedHeaders=$signed_headers, ",
        "Signature=$signature"
    )

    return request
end

function _http_request(aws::AWSConfig, request::Request)
    @repeat 4 try
        http_stack = HTTP.stack(redirect=false, retry=false, aws_authorization=false)

        return HTTP.request(
            http_stack,
            request.request_method,
            HTTP.URI(request.url),
            HTTP.mkheaders(request.headers),
            request.content;
            require_ssl_verification=false,
            response_stream=request.response_stream,
            request.http_options...
        )
    catch e
        # Base.IOError is needed because HTTP.jl can often have errors that aren't
        # caught and wrapped in an HTTP.IOError
        # https://github.com/JuliaWeb/HTTP.jl/issues/382
        @delay_retry if isa(e, Sockets.DNSError) ||
                        isa(e, HTTP.ParseError) ||
                        isa(e, HTTP.IOError) ||
                        isa(e, Base.IOError) ||
                        (isa(e, HTTP.StatusError) && http_status(e) >= 500)
        end
    end
end

function do_request(aws::AWSConfig, request::Request; return_headers::Bool=false)
    response = nothing
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
        "PriorRequestNotComplete"
    ]

    request.headers["User-Agent"] = user_agent
    request.headers["Host"] = HTTP.URI(request.url).host

    @repeat 3 try
        aws.credentials === nothing || _sign!(aws, request)
        response = @mock _http_request(aws, request)

        if response.status in REDIRECT_ERROR_CODES && HTTP.header(response, "Location") != ""
            request.url = HTTP.header(response, "Location")
            continue
        end
    catch e
        if e isa HTTP.StatusError
            e = AWSException(e)
        end

        @retry if :message in fieldnames(typeof(e)) && occursin("Signature expired", e.message) end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        @retry if ecode(e) in EXPIRED_ERROR_CODES
            check_credentials(aws.credentials, force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        @delay_retry if e isa AWSException &&
            (http_status(e.cause) == TOO_MANY_REQUESTS || ecode(e) in THROTTLING_ERROR_CODES)
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if e isa AWSException && (
            header(e.cause, "crc32body") == "x-amz-crc32" ||
            ecode(e) in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        )
        end
    end

    response_dict_type = request.response_dict_type

    # For HEAD request, return headers...
    if request.request_method == "HEAD"
        return response_dict_type(response.headers)
    end

    # Return response stream if requested...
    if request.return_stream
        return request.response_stream
    end

    # Return raw data if requested...
    if request.return_raw
        return (return_headers ? (response.body, response.headers) : response.body)
    end

    # Parse response data according to mimetype...
    mime = HTTP.header(response, "Content-Type", "")

    if isempty(mime)
        if length(response.body) > 5 && String(response.body[1:5]) == "<?xml"
            mime = "text/xml"
        end
    end

    body = String(copy(response.body))

    if occursin(r"/xml", mime)
        xml_dict_type = response_dict_type{Union{Symbol, String}, Any}
        return (return_headers ? (xml_dict(body, xml_dict_type), response_dict_type(response.headers)) : xml_dict(body, xml_dict_type))
    elseif occursin(r"/x-amz-json-1.[01]$", mime) || endswith(mime, "json")
        info = isempty(response.body) ? nothing : JSON.parse(body, dicttype=response_dict_type)
        return (return_headers ? (info, response_dict_type(response.headers)) : info)
    elseif startswith(mime, "text/")
        return (return_headers ? (body, response_dict_type(response.headers)) : body)
    else
        return (return_headers ? (response.body, response.headers) : response.body)
    end
end

function _generate_rest_resource(request_uri::String, args::AbstractDict{String, <:Any})
    for (k,v) in args
        if occursin("{$k}", request_uri)
            request_uri = replace(request_uri, "{$k}" => v)
        elseif occursin("{$k+}", request_uri)
            request_uri = replace(request_uri, "{$k+}" => HTTP.escapepath(v))
        end
    end

    return request_uri
end

function _generate_service_url(region::String, service::String, resource::String)
    SERVICE_HOST = "amazonaws.com"
    regionless_services = ("iam", "route53")

    if service in regionless_services || (service == "sdb" && region == "us-east-1")
        region = ""
    end

    return string("https://", service, ".", isempty(region) ? "" : "$region.", SERVICE_HOST, resource)
end

function _return_headers(args::AbstractDict{String, <:Any})
    return_headers = get(args, "return_headers", false)

    if return_headers
        delete!(args, "return_headers")
    end

    return return_headers
end

function _flatten_query(service::String, query::AbstractDict{String, <: Any})
    return _flatten_query!(Pair{String, String}[], service, query)
end

function _flatten_query!(result::Vector{Pair{String, String}}, service::String, query::AbstractDict{String, <:Any}, prefix::String="")
    for (k, v) in query
        if typeof(v) <: AbstractDict
            _flatten_query!(result, service, v, string(prefix, k, "."))
        elseif typeof(v) <: AbstractArray
            for (i, j) in enumerate(v)
                suffix = service in ("ec2", "sqs") ? "" : ".member"
                prefix_key = string(prefix, k, suffix, ".", i)

                if typeof(j) <: AbstractDict
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
    (service::RestXMLService)(
        aws::AWSConfig, request_method::String, request_uri::String, args=[];
        return_headers=false,
    )

Perform a RestXML request to AWS

# Arguments
- aws::AWSConfig: AWSConfig containing credentials and other information for fulfilling the request
- request_method::String: RESTful request type, e.g.: `GET`, `HEAD`, `PUT`, etc.
- request_uri::String: AWS URI for the endpoint
- args::Array: Additional arguments to be included in the request

# Keywords
- return_headers::Bool=false: Return the AWS response headers or not

# Returns
- The response from AWS
"""
function (service::RestXMLService)(
    request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}(); 
    aws::AWSConfig=AWSConfig()
)
    request = Request(
        service=service.name,
        api_version=service.api_version,
        request_method=request_method,
        content=get(args, "body", ""),
        headers=LittleDict{String, String}(get(args, "headers", [])),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    if haskey(args, "response_dict_type")
        request.response_dict_type = args["response_dict_type"]
    end

    delete!(args, "headers")
    delete!(args, "body")
    return_headers = _return_headers(args)

    request.resource = _generate_rest_resource(request_uri, args)
    query_str = HTTP.escapeuri(args)

    if !isempty(query_str)
        if occursin("?", request.resource)
            request.resource *= "&$query_str"
        else
            request.resource *= "?$query_str"
        end
    end

    request.url = _generate_service_url(aws.region, request.service, request.resource)

    return do_request(aws, request; return_headers=return_headers)
end

function (service::QueryService)(
    operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}(); 
    aws::AWS.AWSConfig=AWSConfig()
)
    POST_RESOURCE = "/"
    return_headers = _return_headers(args)

    request = Request(
        service=service.name,
        api_version=service.api_version,
        resource=POST_RESOURCE,
        request_method="POST",
        headers=LittleDict{String, String}(get(args, "headers", [])),
        url=_generate_service_url(aws.region, service.name, POST_RESOURCE),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    args["Action"] = operation
    args["Version"] = service.api_version
    request.content = HTTP.escapeuri(_flatten_query(service.name, args))

    do_request(aws, request; return_headers=return_headers)
end

function (service::JSONService)(
    operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}();
    aws::AWS.AWSConfig=AWSConfig()
)
    POST_RESOURCE = "/"
    return_headers = _return_headers(args)

    request = Request(
        service=service.name,
        api_version=service.api_version,
        resource=POST_RESOURCE,
        request_method="POST",
        headers=LittleDict{String, String}(get(args, "headers", [])),
        content=json(args),
        url=_generate_service_url(aws.region, service.name, POST_RESOURCE),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    request.headers["Content-Type"] = "application/x-amz-json-$(service.json_version)"
    request.headers["X-Amz-Target"] = "$(service.target).$(operation)"

    do_request(aws, request; return_headers=return_headers)
end

function (service::RestJSONService)(
    request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}();
    aws::AWS.AWSConfig=AWSConfig()
)
    return_headers = _return_headers(args)

    request = Request(
        service=service.name,
        api_version=service.api_version,
        request_method=request_method,
        headers=LittleDict{String, String}(get(args, "headers", [])),
        resource=_generate_rest_resource(request_uri, args),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    if haskey(args, "response_dict_type")
        request.response_dict_type = args["response_dict_type"]
    end

    request.url = _generate_service_url(aws.region, request.service, request.resource)

    if !isempty(service.service_specific_headers)
        merge!(request.headers, service.service_specific_headers)
    end

    request.headers["Content-Type"] = "application/json"
    delete!(args, "headers")
    request.content = json(args)

    do_request(aws, request; return_headers=return_headers)
end

end  # module AWS
