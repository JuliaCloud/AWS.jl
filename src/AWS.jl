module AWS

using AWSCore
using Base64
using HTTP
using MbedTLS
using OrderedCollections: LittleDict, OrderedDict
using Retry
using Sockets
using SymDict
using XMLDict

export @service, AWSServices, RestJSONService, JSONService, RestXMLService, QueryService, AWSConfig, AWSExceptions, set_user_agent

const AWSRequest = SymbolDict

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
end

# Needs to be included after the definition of struct otherwise it cannot find them
include("AWSServices.jl")

http_status(e::HTTP.StatusError) = e.status
header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)

function _sign!(aws::AWSConfig, request::LittleDict; time::DateTime=now(Dates.UTC))
    if request[:service] in ["sdb", "importexport"]
        _sign_aws2!(aws, request, time)
    else
        _sign_aws4!(aws, request, time)
    end
end

function _sign_aws2!(aws::AWSConfig, request::LittleDict, time::DateTime)
    # Create AWS Signature Version 2 Authentication query parameters.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html

    query = Dict{AbstractString,AbstractString}()
    for elem in split(request[:content], '&', keepempty=false)
        (n, v) = split(elem, "=")
        query[n] = HTTP.unescapeuri(v)
    end

    request[:headers]["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    creds = check_credentials(aws.credentials)
    query["AWSAccessKeyId"] = creds.access_key_id
    query["Expires"] = Dates.format(time + Dates.Second(120), dateformat"yyyy-mm-dd\THH:MM:SS\Z")
    query["SignatureVersion"] = "2"
    query["SignatureMethod"] = "HmacSHA256"

    if !isempty(creds.token)
        query["SecurityToken"] = creds.token
    end

    query = Pair[k => query[k] for k in sort(collect(keys(query)))]
    uri = HTTP.URI(request[:url])
    to_sign = "POST\n$(uri.host)\n$(uri.path)\n$(HTTP.escapeuri(query))"
    secret = creds.secret_key
    push!(query, "Signature" => digest(MD_SHA256, to_sign, secret) |> base64encode |> strip)

    request[:content] = HTTP.escapeuri(query)
end

function _sign_aws4!(aws::AWSConfig, request::LittleDict, time::DateTime)
    # Create AWS Signature Version 4 Authentication Headers.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html

    date = Dates.format(time,"yyyymmdd")
    datetime = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

    # Authentication scope...
    authentication_scope = [date, aws.region, request[:service], "aws4_request"]

    creds = check_credentials(aws.credentials)
    signing_key = string("AWS4", creds.secret_key)

    for scope in authentication_scope
        signing_key = digest(MD_SHA256, scope, signing_key)
    end

    # Authentication scope string...
    authentication_scope = join(authentication_scope, "/")

    # SHA256 hash of content...
    content_hash = bytes2hex(digest(MD_SHA256, request[:content]))

    # HTTP headers...
    delete!(request[:headers], "Authorization")
    merge!(request[:headers], Dict(
        "x-amz-content-sha256" => content_hash,
        "x-amz-date"           => datetime,
        "Content-MD5"          => base64encode(digest(MD_MD5, request[:content]))
    ))

    if creds.token != ""
        request[:headers]["x-amz-security-token"] = creds.token
    end

    # Sort and lowercase() Headers to produce canonical form...
    canonical_headers = ["$(lowercase(k)):$(strip(v))" for (k,v) in request[:headers]]
    signed_headers = join(sort([lowercase(k) for k in keys(request[:headers])]), ";")

    # Sort Query String...
    uri = HTTP.URI(request[:url])
    query = HTTP.URIs.queryparams(uri.query)
    query = Pair[k => query[k] for k in sort(collect(keys(query)))]

    # Create hash of canonical request...
    canonical_form = string(request[:request_method], "\n",
                            request[:service] == "s3" ? uri.path : HTTP.escapepath(uri.path), "\n",
                            HTTP.escapeuri(query), "\n",
                            join(sort(canonical_headers), "\n"), "\n\n",
                            signed_headers, "\n",
                            content_hash
    )

    canonical_hash = bytes2hex(digest(MD_SHA256, canonical_form))

    # Create and sign "String to Sign"...
    string_to_sign = "AWS4-HMAC-SHA256\n$datetime\n$authentication_scope\n$canonical_hash"
    signature = bytes2hex(digest(MD_SHA256, string_to_sign, signing_key))

    # Append Authorization header...
    request[:headers]["Authorization"] = string(
        "AWS4-HMAC-SHA256 ",
        "Credential=$(creds.access_key_id)/$authentication_scope, ",
        "SignedHeaders=$signed_headers, ",
        "Signature=$signature"
    )
end

function _http_request(aws::AWSConfig, request::LittleDict)
    options = []

    if get(request, :return_stream, false)
        io = Base.BufferStream()
        request[:response_stream] = io
        push!(options, (:response_stream, io))
    end

    if haskey(request, :http_options)
        for option in request[:http_options]
            push!(options, option)
        end
    end

    @repeat 4 try
        http_stack = HTTP.stack(redirect=false, retry=false, aws_authorization=false)

        return HTTP.request(http_stack,
                            request[:request_method],
                            HTTP.URI(request[:url]),
                            HTTP.mkheaders(request[:headers]),
                            request[:content];
                            require_ssl_verification=false,
                            options...)
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

"""

"""
function do_request(aws::AWSConfig, request::LittleDict; return_headers=false)
    TOO_MANY_REQUESTS = 429
    redirect_codes = [301, 302, 303, 304, 305, 307, 308]
    response = nothing

    if !haskey(request, :headers)
        request[:headers] = Dict{String, String}()
    end

    request[:headers]["User-Agent"] = user_agent
    request[:headers]["Host"] = HTTP.URI(request[:url]).host

    @repeat 3 try
        aws.credentials === nothing || _sign!(aws, request)
        response = _http_request(aws, request)

        if response.status in redirect_codes && HTTP.header(response, "Location") != ""
            request[:url] = HTTP.header(response, "Location")
            continue
        end
    catch e
        if e isa HTTP.StatusError
            e = AWSException(e)
        end

        @retry if :message in fieldnames(typeof(e)) && occursin("Signature expired", e.message) end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        expired_error_codes = ["ExpiredToken", "ExpiredTokenException", "RequestExpired"]
        @retry if ecode(e) in expired_error_codes
            check_credentials(aws.credentials, force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        throttling_error_codes = [
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
        @delay_retry if e isa AWSException &&
            (http_status(e.cause) == TOO_MANY_REQUESTS || ecode(e) in throttling_error_codes)
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if e isa AWSException && (
            header(e.cause, "crc32body") == "x-amz-crc32" ||
            ecode(e) in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        )
        end
    end

    # For HEAD request, return headers...
    if request[:request_method] == "HEAD"
        return Dict(response.headers)
    end

    # Return response stream if requested...
    if get(request, :return_stream, false)
        return request[:response_stream]
    end

    # Return raw data if requested...
    if get(request, :return_raw, false)
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
        xml_dict_type = OrderedDict{Union{Symbol, String}, Any}

        return (return_headers ? (xml_dict(body, xml_dict_type), Dict(response.headers)) : xml_dict(body, xml_dict_type))
    end

    if occursin(r"/x-amz-json-1.[01]$", mime)
        if isempty(response.body)
            return nothing
        end

        if get(r, :ordered_json_dict, true)
            return (return_headers ? (JSON.parse(body, dicttype=OrderedDict), Dict(response.headers)) : JSON.parse(body, dicttype=OrderedDict))
        else
            return (return_headers ? (JSON.parse(body), Dict(response.headers)) : JSON.parse(body))
        end
    end

    if occursin(r"json$", mime)
        if isempty(response.body)
            return nothing
        end

        if get(request, :ordered_json_dict, true)
            info = JSON.parse(body, dicttype=OrderedDict)
        else
            info = JSON.parse(body)
        end

        @protected try
            action = request[:query]["Action"]
            info = info[action * "Response"]
            info = info[action * "Result"]
        catch e
            @ignore if typeof(e) == KeyError end
        end

        return (return_headers ? (info, Dict(response.headers)) : info)
    end

    if occursin(r"^text/", mime)
        return (return_headers ? (body, Dict(response.headers)) : body)
    end

    # Return raw data by default...
    return (return_headers ? (response.body, response.headers) : response.body)
end

function _generate_rest_resource(request_uri::String, args::Dict{String, Any})
    for (k,v) in args
        if occursin("{$k}", request_uri)
            request_uri = replace(request_uri, "{$k}" => v)
        elseif occursin("{$k+}", request_uri)
            request_uri = replace(request_uri, "{$k+}" => HTTP.escapepath(v))
        end
    end

    return request_uri
end

function _generate_service_url(aws::AWSConfig, request::LittleDict)
    endpoint = get(request, :endpoint, request[:service])
    region = aws.region
    regionless_endpoints = ("iam", "route53")
    service_host = "amazonaws.com"

    if endpoint in regionless_endpoints || (endpoint == "sdb" && region == "us-east-1")
        region = ""
    end

    if !isempty(region)
        return string("https://", endpoint, ".", region, ".", service_host, request[:resource])
    else
        return string("https://", endpoint, ".", service_host, request[:resource])
    end
end


"""
    (service::RestXMLService)(aws::AWSConfig, request_method::String, request_uri::String, args=[])
"""
function (service::RestXMLService)(aws::AWSConfig, request_method::String, request_uri::String, args=[])
    request = LittleDict()
    args = stringdict(args)
    request[:service] = service.name
    request[:version] = service.api_version
    request[:request_method] = request_method

    request[:headers] = Dict{String, String}(get(args, "headers", []))
    request[:content] = get(args, "Body", "")

    delete!(args, "headers")
    delete!(args, "Body")

    request[:resource] = _generate_rest_resource(request_uri, args)

    query_str = HTTP.escapeuri(args)
    query_str = replace(query_str, "_"=>"-")  # Convert out arg name to match the AWS hyphen style

    if !isempty(query_str)
        if occursin("?", request[:resource])
            request[:resource] *= "&$query_str"
        else
            request[:resource] *= "?$query_str"
        end
    end

    request[:url] = _generate_service_url(aws, request)

    do_request(aws, request)
end
(service::RestXMLService)(request_method::String, request_uri::String, args=[]) = service(AWSConfig(), request_method, request_uri, args)
(service::RestXMLService)(a...; b...) = service(a..., b)

function (service::QueryService)(aws, operation, args=[])
    return AWSCore.service_query(
        aws;
        service=service.name,
        version=service.api_version,
        operation=operation,
        args=args
    )
end
# (service::QueryService)(operation, args=[]) = service(aws_config(), operation, args)
# (service::QueryService)(a...; b...) = service(a..., b)
#
function (service::JSONService)(aws, operation, args=[])
    return AWSCore.service_json(
        aws;
        service=service.name,
        version=service.api_version,
        json_version=service.json_version,
        target=service.target,
        operation=operation,
        args=args
    )
end
# (service::JSONService)(operation, args=[]) = service(aws_config(), operation, args)
# (service::JSONService)(a...; b...) = service(a..., b)
#
function (service::RestJSONService)(aws, request_method::String, request_uri::String, args=[])
    return AWSCore.service_rest_json(
        aws;
        service=service.name,
        version=service.api_version,
        verb=request_method,
        resource=request_uri,
        args=args
    )
end
# (service::RestJSONService)(request_method::String, request_uri::String, args=[]) = service(aws_config(), request_method, request_uri, args)
# (service::RestJSONService)(a...; b...) = service(a..., b)

end  # module AWS
