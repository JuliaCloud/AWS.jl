module AWS

using Compat: Compat, @compat, @something, pkgversion
using Base64
using Dates
using Downloads: Downloads, Downloader, Curl
using HTTP
using MbedTLS
using Mocking
using OrderedCollections: LittleDict, OrderedDict
using Random
using SHA
using ScopedValues: ScopedValues, ScopedValue, @with
using Sockets
using URIs
using UUIDs: UUIDs
using XMLDict

export @service
export _merge
export AbstractAWSConfig, AWSConfig, AWSExceptions, AWSServices, Request
export IMDS
export current_aws_config, default_aws_config, with_aws_config
export assume_role, generate_service_url, set_user_agent
export sign!, sign_aws2!, sign_aws4!
export JSONService, RestJSONService, RestXMLService, QueryService, set_features

const DEFAULT_REGION = "us-east-1"

include(joinpath("utilities", "utilities.jl"))

include("AWSExceptions.jl")
include("AWSCredentials.jl")
include("AWSConfig.jl")
include("AWSMetadata.jl")
include("IMDS.jl")

include(joinpath("utilities", "request.jl"))
include(joinpath("utilities", "response.jl"))
include(joinpath("utilities", "sign.jl"))
include(joinpath("utilities", "downloads_backend.jl"))
include(joinpath("utilities", "role.jl"))

include("deprecated.jl")

using ..AWSExceptions
using ..AWSExceptions: AWSException

const user_agent = Ref{String}()
const aws_config = Ref{AbstractAWSConfig}()

"""
    FeatureSet

Allows end users to opt-in to new breaking behaviors prior before a major/breaking package
release. Each field of this struct contains a default which specifies uses the original
non-breaking behavior.

# Features

- `use_response_type::Bool=false`: When enabled, service calls will return an `AWS.Response`
  which provides streaming/raw/parsed access to the response. When disabled, the service
  call response typically be parsed but will vary depending on the following parameters:
  "return_headers", "return_stream", "return_raw", "response_dict_type".
"""
Base.@kwdef struct FeatureSet
    use_response_type::Bool = false
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
    @service service_id feature=val...
    @service service_id as module_name feature=val...

Include the high-level service wrapper for `service_id` in a module. The module name will
match the `service_id` or can be specified using the `as` syntax.

An optional list of features can be specified for this service include. See
[`FeatureSet`](@ref) for a list of available features.

The module name cannot match the binding name used for the low-level API. The low-level API
binding name is equivalent to the lowercase `service_id` where spaces are replace with
underscores (e.g. the service ID `Secrets_Manager` can be used but `secrets_manager`
cannot).

# Extended Help

## Arguments

- `service_id::Symbol`: The high-level API wrappers service ID to include in the current
  module. Note the service ID is case insensitive.
- `module_name::Symbol`: The name of the module containing the high-level API wrappers.
  Useful to avoiding name conflicts. Defaults to using `service_id`.
- `features=val...`: A list of features to enable/disable for this high-level API include.
  See `FeatureSet` for a list of available features.

## Returns

- `Module`: The module containging the high-level service API wrapper functions.

## Examples

```julia
julia> using AWS: @service

julia> @service STS
STS

julia> STS.get_caller_identity()
OrderedCollections.LittleDict{Union{String, Symbol}, Any, Vector{Union{String, Symbol}}, Vector{Any}} with 2 entries:
  "GetCallerIdentityResult" => LittleDict{Union{String, Symbol}, Any, Vector{Un…
  "ResponseMetadata"        => LittleDict{Union{String, Symbol}, Any, Vector{Un…
```

Specify the module name and use a feature:

```julia
julia> @service STS as SecurityTokenService use_response_type = true
SecurityTokenService

julia> SecurityTokenService.get_caller_identity()
AWS.Response: application/xml interpreted as:
OrderedCollections.LittleDict{Union{String, Symbol}, Any, Vector{Union{String, Symbol}}, Vector{Any}} with 2 entries:
  "GetCallerIdentityResult" => LittleDict{Union{String, Symbol}, Any, Vector{Un…
  "ResponseMetadata"        => LittleDict{Union{String, Symbol}, Any, Vector{Un…
```

Service IDs are case insensitive:

```jldoctest; setup = :(using AWS: @service)
julia> @service Secrets_Manager
Secrets_Manager

julia> @service SECRETS_MANAGER
SECRETS_MANAGER

julia> @service sECRETS_MANAGER
sECRETS_MANAGER
```

Using an all lowercase service ID does not work as it conflicts with the low-level API
binding name:

```julia
julia> @service sts
WARNING: import of AWSServices.sts into sts conflicts with an existing identifier; ignored.
sts

julia> sts.get_caller_identity()
ERROR: MethodError: objects of type Module are not callable
[...]
```
"""
macro service(exprs...)
    if length(exprs) >= 3 && exprs[2] === :as
        # e.g. `@service Secrets_Manager as SM ...`. Note the expression structure here differs
        # from what is used by `import` and `using`.
        exprs[1] isa Symbol || throw(_expected_symbol_exception(:service_id, exprs[1]))
        exprs[3] isa Symbol || throw(_expected_symbol_exception(:module_name, exprs[3]))

        service_name = exprs[1]
        module_name = exprs[3]
        features = exprs[4:end]
    elseif length(exprs) >= 1
        # e.g. `@service Secrets_Manager ...`
        exprs[1] isa Symbol || throw(_expected_symbol_exception(:service_id, exprs[1]))

        service_name = exprs[1]
        module_name = exprs[1]
        features = exprs[2:end]
    else
        throw(MethodError(var"@service", (__source__, __module__)))
    end

    service_file = joinpath(@__DIR__, "services", lowercase(string(service_name)) * ".jl")
    map(_assignment_to_kw!, features)

    module_block = quote
        using AWS: FeatureSet
        const SERVICE_FEATURE_SET = FeatureSet(; $(features...))
        include($service_file)
    end

    return Expr(:toplevel, Expr(:module, true, esc(module_name), esc(module_block)))
end

abstract type Service end

struct RestXMLService <: Service
    signing_name::String
    endpoint_prefix::String
    api_version::String
end

struct QueryService <: Service
    signing_name::String
    endpoint_prefix::String
    api_version::String
end

struct JSONService <: Service
    signing_name::String
    endpoint_prefix::String
    api_version::String

    json_version::String
    target::String
end

struct RestJSONService <: Service
    signing_name::String
    endpoint_prefix::String
    api_version::String

    service_specific_headers::LittleDict{String,String}
end

function RestJSONService(signing_name::String, endpoint_prefix::String, api_version::String)
    return RestJSONService(
        signing_name, endpoint_prefix, api_version, LittleDict{String,String}()
    )
end

struct ServiceWrapper{S<:Service}
    service::S
    feature_set::FeatureSet
end

function set_features(service::Service; features...)
    return ServiceWrapper(service, FeatureSet(; features...))
end

# Needs to be included after the definition of struct otherwise it cannot find them
include("AWSServices.jl")

function generate_service_url(aws::AbstractAWSConfig, service::String, resource::String)
    SERVICE_HOST = "amazonaws.com"
    reg = region(aws)

    regionless_services = ("iam", "route53")

    if service in regionless_services || (service == "sdb" && reg == DEFAULT_REGION)
        reg = ""
    end

    return string(
        "https://", service, ".", isempty(reg) ? "" : "$reg.", SERVICE_HOST, resource
    )
end

"""
    (service::RestXMLService)(
        request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}();
        aws_config::AbstractAWSConfig=aws_config
    )

Perform a RestXML request to AWS.

# Arguments
- `request_method::String`: RESTful request type, e.g.: `GET`, `HEAD`, `PUT`, etc.
- `request_uri::String`: AWS URI for the endpoint
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws_config::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `feature_set::FeatureSet`: Specifies opt-in functionality for this specific API call.

# Returns
- `Tuple` or `Dict`: If `return_headers` is passed in through `args` a Tuple containing the headers and response will be returned, otherwise just a `Dict`
"""
function (service::RestXMLService)(
    request_method::String,
    request_uri::String,
    args::AbstractDict{String,<:Any}=Dict{String,Any}();
    aws_config::AbstractAWSConfig=current_aws_config(),
    feature_set::FeatureSet=FeatureSet(),
)
    feature_set.use_response_type && _delete_legacy_response_kw_args!(args)

    return_headers = _pop!(args, "return_headers", nothing)

    request = Request(;
        _extract_common_kw_args(service, args)...,
        use_response_type=feature_set.use_response_type,
        request_method=request_method,
        content=_pop!(args, "body", ""),
    )

    if request.service == "s3"
        request_uri = _clean_s3_uri(request_uri)
    end
    request.resource = _generate_rest_resource(request_uri, args)
    query_str = HTTP.escapeuri(args)

    if !isempty(query_str)
        if occursin('?', request.resource)
            request.resource *= "&$query_str"
        else
            request.resource *= "?$query_str"
        end
    end

    request.url = generate_service_url(
        aws_config, service.endpoint_prefix, request.resource
    )

    return submit_request(aws_config, request; return_headers=return_headers)
end

"""
    (service::QueryService)(
        operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}();
        aws_config::AbstractAWSConfig=aws_config
    )

Perform a Query request to AWS.

# Arguments
- `operation::String`:
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws_config::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `feature_set::FeatureSet`: Specifies opt-in functionality for this specific API call.

# Returns
- `Tuple` or `Dict`: If `return_headers` is passed in through `args` a Tuple containing the headers and response will be returned, otherwise just a `Dict`
"""
function (service::QueryService)(
    operation::String,
    args::AbstractDict{String,<:Any}=Dict{String,Any}();
    aws_config::AbstractAWSConfig=current_aws_config(),
    feature_set::FeatureSet=FeatureSet(),
)
    feature_set.use_response_type && _delete_legacy_response_kw_args!(args)

    POST_RESOURCE = "/"
    return_headers = _pop!(args, "return_headers", nothing)

    request = Request(;
        _extract_common_kw_args(service, args)...,
        use_response_type=feature_set.use_response_type,
        resource=POST_RESOURCE,
        request_method="POST",
        url=generate_service_url(aws_config, service.endpoint_prefix, POST_RESOURCE),
    )

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    args["Action"] = operation
    args["Version"] = service.api_version
    request.content = HTTP.escapeuri(_flatten_query(service.signing_name, args))

    return submit_request(aws_config, request; return_headers=return_headers)
end

"""
    (service::JSONService)(
        operation::String, args::AbstractDict{String, <:Any}=Dict{String, Any}();
        aws_config::AbstractAWSConfig=aws_config
    )

Perform a JSON request to AWS.

# Arguments
- `operation::String`: Name of the operation to perform
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws_config::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `feature_set::FeatureSet`: Specifies opt-in functionality for this specific API call.

# Returns
- `Tuple` or `Dict`: If `return_headers` is passed in through `args` a Tuple containing the headers and response will be returned, otherwise just a `Dict`
"""
function (service::JSONService)(
    operation::String,
    args::AbstractDict{String,<:Any}=Dict{String,Any}();
    aws_config::AbstractAWSConfig=current_aws_config(),
    feature_set::FeatureSet=FeatureSet(),
)
    feature_set.use_response_type && _delete_legacy_response_kw_args!(args)

    POST_RESOURCE = "/"
    return_headers = _pop!(args, "return_headers", nothing)

    request = Request(;
        _extract_common_kw_args(service, args)...,
        use_response_type=feature_set.use_response_type,
        resource=POST_RESOURCE,
        request_method="POST",
        content=json(args),
        url=generate_service_url(aws_config, service.endpoint_prefix, POST_RESOURCE),
    )

    request.headers["Content-Type"] = "application/x-amz-json-$(service.json_version)"
    request.headers["X-Amz-Target"] = "$(service.target).$(operation)"

    return submit_request(aws_config, request; return_headers=return_headers)
end

"""
    (service::RestJSONService)(
        request_method::String, request_uri::String, args::AbstractDict{String, <:Any}=Dict{String, String}();
        aws_config::AbstractAWSConfig=aws_config
    )

Perform a RestJSON request to AWS.

# Arguments
- `request_method::String`: RESTful request type, e.g.: `GET`, `HEAD`, `PUT`, etc.
- `request_uri::String`: AWS URI for the endpoint
- `args::AbstractDict{String, <:Any}`: Additional arguments to be included in the request

# Keywords
- `aws_config::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `feature_set::FeatureSet`: Specifies opt-in functionality for this specific API call.

# Returns
- `Tuple` or `Dict`: If `return_headers` is passed in through `args` a Tuple containing the headers and response will be returned, otherwise just a `Dict`
"""
function (service::RestJSONService)(
    request_method::String,
    request_uri::String,
    args::AbstractDict{String,<:Any}=Dict{String,String}();
    aws_config::AbstractAWSConfig=current_aws_config(),
    feature_set::FeatureSet=FeatureSet(),
)
    feature_set.use_response_type && _delete_legacy_response_kw_args!(args)

    return_headers = _pop!(args, "return_headers", nothing)

    request = Request(;
        _extract_common_kw_args(service, args)...,
        use_response_type=feature_set.use_response_type,
        request_method=request_method,
        resource=_generate_rest_resource(request_uri, args),
    )

    request.url = generate_service_url(
        aws_config, service.endpoint_prefix, request.resource
    )

    if !isempty(service.service_specific_headers)
        merge!(request.headers, service.service_specific_headers)
    end

    request.headers["Content-Type"] = "application/json"
    request.content = json(args)

    return submit_request(aws_config, request; return_headers=return_headers)
end

function (service::ServiceWrapper)(args...; feature_set=nothing, kwargs...)
    feature_set = something(feature_set, service.feature_set)
    return service.service(args...; feature_set=feature_set, kwargs...)
end

function __init__()
    pkg_module = @__MODULE__()
    pkg_version = pkgversion(pkg_module)
    user_agent[] = "$(nameof(pkg_module)).jl/$(pkg_version)"

    DEFAULT_BACKEND[] = HTTPBackend()
    return nothing
end

end  # module AWS
