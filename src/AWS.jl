module AWS

using Compat: Compat
using Base64
using Dates
using HTTP
using MbedTLS
using Mocking
using OrderedCollections: LittleDict, OrderedDict
using Retry
using Sockets
using UUIDs: UUIDs
using XMLDict

export @service
export _merge, AWSConfig, AWSExceptions, AWSServices, Request, global_aws_config, set_user_agent
export JSONService, RestJSONService, RestXMLService, QueryService, AbstractAWSConfig

include("utilities.jl")
include("AWSExceptions.jl")
include("AWSCredentials.jl")
include("AWSConfig.jl")
include("AWSMetadataUtilities.jl")
include("AWSMetadata.jl")

using ..AWSExceptions
using ..AWSExceptions: AWSException

user_agent = Ref("AWS.jl/1.0.0")
aws_config = Ref{AbstractAWSConfig}()

"""
    global_aws_config()

Retrieve the global AWS configuration.
If one is not set, create one with default configuration options.

# Keywords
- `kwargs...`: AWSConfig kwargs to be passed along if the global configuration is not already set

# Returns
- `AWSConfig`: The global AWS configuration
"""
function global_aws_config(; kwargs...)
    if !isassigned(aws_config) || !isempty(kwargs)
        aws_config[] = AWSConfig(; kwargs...)
    end

    return aws_config[]
end


"""
    global_aws_config(config::AbstractAWSConfig)

Set the global AWSConfig.

# Arguments
- `config::AWSConfig`: The AWSConfig to set in the global state

# Returns
- `AWSConfig`: Global AWSConfig
"""
function global_aws_config(config::AbstractAWSConfig)
    return aws_config[] = config
end


"""
    set_user_agent(new_user_agent::String)

Set the global user agent when making HTTP requests.

# Arguments
- `new_user_agent::String`: User agent to set when making HTTP requests

# Return
- `String`: The global user agent
"""
set_user_agent(new_user_agent::String) = return user_agent[] = new_user_agent


"""
    macro service(module_name::Symbol)

Include a high-level service wrapper based off of the module_name parameter.

When calling the macro you cannot match the predefined constant for the lowl level API.
The low level API constants are named in all lowercase, and spaces replaced with underscores.

Examples:
```julia
using AWS.AWSServices: secrets_manager
using AWS: @service

# This matches the constant and will error!
@service secrets_manager
> ERROR: cannot assign a value to variable AWSServices.secrets_manager from module Main

# This does NOT match the filename structure and will error!
@service secretsmanager
> ERROR: could not open file /.julia/dev/AWS.jl/src/services/secretsmanager.jl

# All of the examples below are valid!
@service Secrets_Manager
@service SECRETS_MANAGER
@service sECRETS_MANAGER
```

# Arguments
- `module_name::Symbol`: Name of the service to include high-level API wrappers in your namespace

# Return
- `Expression`: Base.include() call to introduce the high-level service API wrapper functions in your namespace
"""
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
    content::Union{String, Vector{UInt8}}=""
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

_http_status(e::HTTP.StatusError) = e.status
_header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)

function _sign!(aws::AbstractAWSConfig, request::Request; time::DateTime=now(Dates.UTC))
    if request.service in ("sdb", "importexport")
        _sign_aws2!(aws, request, time)
    else
        _sign_aws4!(aws, request, time)
    end
end

function _sign_aws2!(aws::AbstractAWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 2 Authentication query parameters.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html

    query = Dict{String, String}()
    for elem in split(request.content, '&', keepempty=false)
        (n, v) = split(elem, "=")
        query[n] = HTTP.unescapeuri(v)
    end

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    creds = check_credentials(credentials(aws))
    query["AWSAccessKeyId"] = creds.access_key_id
    query["Expires"] = Dates.format(time + Dates.Minute(2), dateformat"yyyy-mm-dd\THH:MM:SS\Z")
    query["SignatureVersion"] = "2"
    query["SignatureMethod"] = "HmacSHA256"

    if !isempty(creds.token)
        query["SecurityToken"] = creds.token
    end

    query = [k => query[k] for k in sort!(collect(keys(query)))]
    uri = HTTP.URI(request.url)
    to_sign = "POST\n$(uri.host)\n$(uri.path)\n$(HTTP.escapeuri(query))"
    push!(query, "Signature" => digest(MD_SHA256, to_sign, creds.secret_key) |> base64encode |> strip)

    request.content = HTTP.escapeuri(query)

    return request
end

function _sign_aws4!(aws::AbstractAWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 4 Authentication Headers.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html

    date = Dates.format(time, dateformat"yyyymmdd")
    datetime = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

    # Authentication scope...
    authentication_scope = [date, region(aws), request.service, "aws4_request"]

    creds = check_credentials(credentials(aws))
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
    canonical_headers = join(sort!(["$(lowercase(k)):$(strip(v))" for (k,v) in request.headers]), "\n")
    signed_headers = join(sort!([lowercase(k) for k in keys(request.headers)]), ";")

    # Sort Query String...
    uri = HTTP.URI(request.url)
    query = HTTP.URIs.queryparams(uri.query)
    query = [k => query[k] for k in sort!(collect(keys(query)))]

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
    request.headers["Authorization"] = join([
            "AWS4-HMAC-SHA256 Credential=$(creds.access_key_id)/$authentication_scope",
            "SignedHeaders=$signed_headers",
            "Signature=$signature",
        ],
        ", ",
    )

    return request
end

function _http_request(request::Request)
    @repeat 4 try
        http_stack = HTTP.stack(redirect=false, retry=false, aws_authorization=false)

        if request.return_stream && request.response_stream === nothing
            request.response_stream = Base.BufferStream()
        end

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
                        (isa(e, HTTP.StatusError) && _http_status(e) >= 500)
        end
    end
end

"""
    submit_request(aws::AbstractAWSConfig, request::Request; return_headers::Bool=false)

Submit the request to AWS.

# Arguments
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `request::Request`: All the information about making a request to AWS

# Keywords
- `return_headers::Bool=false`: True if you want the headers from the response returned back

# Returns
- `Tuple or Dict`: Tuple if returning_headers, otherwise just return a Dict of the response body
"""
function submit_request(aws::AbstractAWSConfig, request::Request; return_headers::Bool=false)
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

    request.headers["User-Agent"] = user_agent[]
    request.headers["Host"] = HTTP.URI(request.url).host
    request.url = replace(request.url, " " => "%20")

    @repeat 3 try
        credentials(aws) === nothing || _sign!(aws, request)
        response = @mock _http_request(request)

        if response.status in REDIRECT_ERROR_CODES && HTTP.header(response, "Location") != ""
            request.url = HTTP.header(response, "Location")
        end
    catch e
        if e isa HTTP.StatusError
            e = AWSException(e)
        end

        @retry if :message in fieldnames(typeof(e)) && occursin("Signature expired", e.message) end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        @retry if ecode(e) in EXPIRED_ERROR_CODES
            check_credentials(credentials(aws), force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        @delay_retry if e isa AWSException &&
            (_http_status(e.cause) == TOO_MANY_REQUESTS || ecode(e) in THROTTLING_ERROR_CODES)
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if e isa AWSException && (
            _header(e.cause, "crc32body") == "x-amz-crc32" ||
            ecode(e) in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        )
        end

        if e isa AWSException && occursin("Missing Authentication Token", e.message) && aws.credentials === nothing
            return throw(NoCredentials("You're attempting to perform a request without credentials set."))
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
        if length(response.body) > 5 && response.body[1:5] == b"<?xml"
            mime = "text/xml"
        end
    end

    body = String(copy(response.body))

    if occursin(r"/xml", mime)
        xml_dict_type = response_dict_type{Union{Symbol, String}, Any}
        body = parse_xml(body)
        root = XMLDict.root(body.x)

        return (return_headers ? (xml_dict(root, xml_dict_type), response_dict_type(response.headers)) : xml_dict(root, xml_dict_type))
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

function _generate_service_url(aws::AbstractAWSConfig, service::String, resource::String)
    SERVICE_HOST = "amazonaws.com"
    
    reg = region(aws)

    regionless_services = ("iam", "route53")

    if service in regionless_services || (service == "sdb" && reg == "us-east-1")
        reg = ""
    end

    return string("https://", service, ".", isempty(reg) ? "" : "$reg.", SERVICE_HOST, resource)
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
    (service::RestXMLService)(
        request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}(); 
        aws::AbstractAWSConfig=aws_config
    )

Perform a RestXML request to AWS.

# Arguments
- `request_method::String`: RESTful request type, e.g.: `GET`, `HEAD`, `PUT`, etc.
- `request_uri::String`: AWS URI for the endpoint
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration

# Returns
- `Tuple or Dict`: If `return_headers` is passed in through `args` a Tuple containing the Headers and Response will be returned, otherwise just a Dict
"""
function (service::RestXMLService)(
    request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, Any}(); 
    aws_config::AbstractAWSConfig=global_aws_config(),
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
        request.response_dict_type = pop!(args, "response_dict_type")
    end

    delete!(args, "headers")
    delete!(args, "body")
    return_headers = _return_headers(args)

    request.resource = _generate_rest_resource(request_uri, args)
    query_str = HTTP.escapeuri(args)

    if !isempty(query_str)
        if occursin('?', request.resource)
            request.resource *= "&$query_str"
        else
            request.resource *= "?$query_str"
        end
    end

    request.url = _generate_service_url(aws_config, request.service, request.resource)

    return submit_request(aws_config, request; return_headers=return_headers)
end


"""
    (service::QueryService)(
        operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}(); 
        aws::AbstractAWSConfig=aws_config
    )

Perform a Query request to AWS.

# Arguments
- `operation::String`:
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration

# Returns
- `Tuple or Dict`: If `return_headers` is passed in through `args` a Tuple containing the Headers and Response will be returned, otherwise just a Dict
"""
function (service::QueryService)(
    operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}(); 
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    POST_RESOURCE = "/"
    return_headers = _return_headers(args)

    request = Request(
        service=service.name,
        api_version=service.api_version,
        resource=POST_RESOURCE,
        request_method="POST",
        headers=LittleDict{String, String}(get(args, "headers", [])),
        url=_generate_service_url(aws_config, service.name, POST_RESOURCE),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    if haskey(args, "response_dict_type")
        request.response_dict_type = pop!(args, "response_dict_type")
    end

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    args["Action"] = operation
    args["Version"] = service.api_version
    request.content = HTTP.escapeuri(_flatten_query(service.name, args))

    return submit_request(aws_config, request; return_headers=return_headers)
end

"""
    (service::JSONService)(
        operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}();
        aws::AbstractAWSConfig=aws_config
    )

Perform a JSON request to AWS.

# Arguments
- `operation::String`: Name of the operation to perform
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration

# Returns
- `Tuple or Dict`: If `return_headers` is passed in through `args` a Tuple containing the Headers and Response will be returned, otherwise just a Dict
"""
function (service::JSONService)(
    operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}();
    aws_config::AbstractAWSConfig=global_aws_config(),
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
        url=_generate_service_url(aws_config, service.name, POST_RESOURCE),
        return_stream=get(args, "return_stream", false),
        http_options=get(args, "http_options", []),
        response_stream=get(args, "response_stream", nothing),
        return_raw=get(args, "return_raw", false),
    )

    if haskey(args, "response_dict_type")
        request.response_dict_type = pop!(args, "response_dict_type")
    end

    request.headers["Content-Type"] = "application/x-amz-json-$(service.json_version)"
    request.headers["X-Amz-Target"] = "$(service.target).$(operation)"

    return submit_request(aws_config, request; return_headers=return_headers)
end

"""
    (service::RestJSONService)(
        request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}();
        aws::AbstractAWSConfig=aws_config
    )

Perform a RestJSON request to AWS.

# Arguments
- `request_method::String`: RESTful request type, e.g.: `GET`, `HEAD`, `PUT`, etc.
- `request_uri::String`: AWS URI for the endpoint
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration

# Returns
- `Tuple or Dict`: If `return_headers` is passed in through `args` a Tuple containing the Headers and Response will be returned, otherwise just a Dict
"""
function (service::RestJSONService)(
    request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}();
    aws_config::AbstractAWSConfig=global_aws_config(),
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
        request.response_dict_type = pop!(args, "response_dict_type")
    end

    request.url = _generate_service_url(aws_config, request.service, request.resource)

    if !isempty(service.service_specific_headers)
        merge!(request.headers, service.service_specific_headers)
    end

    request.headers["Content-Type"] = "application/json"
    delete!(args, "headers")
    request.content = json(args)

    return submit_request(aws_config, request; return_headers=return_headers)
end

end  # module AWS
