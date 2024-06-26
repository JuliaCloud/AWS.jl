# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: migrationhub_config
using AWS.Compat
using AWS.UUIDs

"""
    create_home_region_control(home_region, target)
    create_home_region_control(home_region, target, params::Dict{String,<:Any})

This API sets up the home region for the calling account only.

# Arguments
- `home_region`: The name of the home region of the calling account.
- `target`: The account for which this command sets up a home region control. The Target is
  always of type ACCOUNT.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DryRun"`: Optional Boolean flag to indicate whether any effect should take place. It
  tests whether the caller has permission to make the call.
"""
function create_home_region_control(
    HomeRegion, Target; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhub_config(
        "CreateHomeRegionControl",
        Dict{String,Any}("HomeRegion" => HomeRegion, "Target" => Target);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_home_region_control(
    HomeRegion,
    Target,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhub_config(
        "CreateHomeRegionControl",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("HomeRegion" => HomeRegion, "Target" => Target),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_home_region_control(control_id)
    delete_home_region_control(control_id, params::Dict{String,<:Any})

This operation deletes the home region configuration for the calling account. The operation
does not delete discovery or migration tracking data in the home region.

# Arguments
- `control_id`: A unique identifier that's generated for each home region control. It's
  always a string that begins with \"hrc-\" followed by 12 lowercase letters and numbers.

"""
function delete_home_region_control(
    ControlId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhub_config(
        "DeleteHomeRegionControl",
        Dict{String,Any}("ControlId" => ControlId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_home_region_control(
    ControlId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhub_config(
        "DeleteHomeRegionControl",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ControlId" => ControlId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_home_region_controls()
    describe_home_region_controls(params::Dict{String,<:Any})

This API permits filtering on the ControlId and HomeRegion fields.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ControlId"`: The ControlID is a unique identifier string of your HomeRegionControl
  object.
- `"HomeRegion"`: The name of the home region you'd like to view.
- `"MaxResults"`: The maximum number of filtering results to display per page.
- `"NextToken"`: If a NextToken was returned by a previous call, more results are
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
- `"Target"`: The target parameter specifies the identifier to which the home region is
  applied, which is always of type ACCOUNT. It applies the home region to the current ACCOUNT.
"""
function describe_home_region_controls(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhub_config(
        "DescribeHomeRegionControls"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function describe_home_region_controls(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhub_config(
        "DescribeHomeRegionControls",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_home_region()
    get_home_region(params::Dict{String,<:Any})

Returns the calling account’s home region, if configured. This API is used by other AWS
services to determine the regional endpoint for calling AWS Application Discovery Service
and Migration Hub. You must call GetHomeRegion at least once before you call any other AWS
Application Discovery Service and AWS Migration Hub APIs, to obtain the account's Migration
Hub home region.

"""
function get_home_region(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhub_config(
        "GetHomeRegion"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_home_region(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhub_config(
        "GetHomeRegion", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
