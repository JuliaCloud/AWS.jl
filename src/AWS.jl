module AWS

include("AWSMetadataUtilities.jl")

export @service, AWSServices, RestJSONService, JSONService, RestXMLService, QueryService

using AWSCore
using SymDict

macro service(module_name::Symbol)
    service_name = "services/" * lowercase(string(module_name)) * ".jl"
    service_name = joinpath(@__DIR__, service_name)

    return Expr(:toplevel,
    :(module ($(esc(module_name)))
        Base.include($(esc(module_name)), $(esc(service_name)))
     end))
end

mutable struct RestXMLService
    name::String
    api_version::String
end

mutable struct QueryService
    name::String
    api_version::String
end

mutable struct JSONService
    name::String
    api_version::String

    json_version::String
    target::String
end

mutable struct RestJSONService
    name::String
    api_version::String
end

function (service::RestXMLService)(aws::AWSConfig, request_method::String, request_uri::String, args=[])
    return AWSCore.service_rest_xml(
        aws;
        service=service.name,
        version=service.api_version,
        verb=request_method,
        resource=request_uri,
        args=args
    )
end
(service::RestXMLService)(request_method::String, request_uri::String, args=[]) = service(default_aws_config(), request_method, request_uri, args)
(service::RestXMLService)(a...; b...) = service(a..., b)

function (service::QueryService)(aws::AWSConfig, operation, args=[])
    return AWSCore.service_query(
        aws;
        service=service.name,
        version=service.api_version,
        operation=operation,
        args=args
    )
end
(service::QueryService)(operation, args=[]) = service(default_aws_config(), operation, args)
(service::QueryService)(a...; b...) = service(a..., b)

function (service::JSONService)(aws::AWSConfig, operation, args=[])
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
(service::JSONService)(operation, args=[]) = service(default_aws_config(), operation, args)
(service::JSONService)(a...; b...) = service(a..., b)

function (service::RestJSONService)(aws::AWSConfig, request_method::String, request_uri::String, args=[])
    return AWSCore.service_rest_json(
        aws;
        service=service.name,
        version=service.api_version,
        verb=request_method,
        resource=request_uri,
        args=args
    )
end
(service::RestJSONService)(request_method::String, request_uri::String, args=[]) = service(default_aws_config(), request_method, request_uri, args)
(service::RestJSONService)(a...; b...) = service(a..., b)

end  # module AWS