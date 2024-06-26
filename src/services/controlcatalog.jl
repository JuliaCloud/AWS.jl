# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: controlcatalog
using AWS.Compat
using AWS.UUIDs

"""
    list_common_controls()
    list_common_controls(params::Dict{String,<:Any})

Returns a paginated list of common controls from the Amazon Web Services Control Catalog.
You can apply an optional filter to see common controls that have a specific objective. If
you don’t provide a filter, the operation returns all common controls.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CommonControlFilter"`: An optional filter that narrows the results to a specific
  objective. This filter allows you to specify one objective ARN at a time. Passing multiple
  ARNs in the CommonControlFilter isn’t currently supported.
- `"maxResults"`: The maximum number of results on a page or for an API request call.
- `"nextToken"`: The pagination token that's used to fetch the next set of results.
"""
function list_common_controls(; aws_config::AbstractAWSConfig=global_aws_config())
    return controlcatalog(
        "POST", "/common-controls"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_common_controls(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return controlcatalog(
        "POST",
        "/common-controls",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_domains()
    list_domains(params::Dict{String,<:Any})

Returns a paginated list of domains from the Amazon Web Services Control Catalog.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results on a page or for an API request call.
- `"nextToken"`: The pagination token that's used to fetch the next set of results.
"""
function list_domains(; aws_config::AbstractAWSConfig=global_aws_config())
    return controlcatalog(
        "POST", "/domains"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_domains(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return controlcatalog(
        "POST", "/domains", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_objectives()
    list_objectives(params::Dict{String,<:Any})

Returns a paginated list of objectives from the Amazon Web Services Control Catalog. You
can apply an optional filter to see the objectives that belong to a specific domain. If you
don’t provide a filter, the operation returns all objectives.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ObjectiveFilter"`: An optional filter that narrows the results to a specific domain.
  This filter allows you to specify one domain ARN at a time. Passing multiple ARNs in the
  ObjectiveFilter isn’t currently supported.
- `"maxResults"`: The maximum number of results on a page or for an API request call.
- `"nextToken"`: The pagination token that's used to fetch the next set of results.
"""
function list_objectives(; aws_config::AbstractAWSConfig=global_aws_config())
    return controlcatalog(
        "POST", "/objectives"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_objectives(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return controlcatalog(
        "POST",
        "/objectives",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
