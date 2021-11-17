# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: elastic_inference
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "filters" => "filters",
    "accelerator_ids" => "acceleratorIds",
    "accelerator_types" => "acceleratorTypes",
    "next_token" => "nextToken",
    "max_results" => "maxResults",
)

"""
    describe_accelerator_offerings(location_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Describes the locations in which a given accelerator type or set of types is present in a
given region.

# Arguments
- `location_type`:  The location type that you want to describe accelerator type offerings
  for. It can assume the following values: region: will return the accelerator type offering
  at the regional level. availability-zone: will return the accelerator type offering at the
  availability zone level. availability-zone-id: will return the accelerator type offering at
  the availability zone level returning the availability zone id.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"accelerator_types"`:  The list of accelerator types to describe.
"""
function describe_accelerator_offerings(
    locationType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "POST",
        "/describe-accelerator-offerings",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("locationType" => locationType), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_accelerator_types(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Describes the accelerator types available in a given region, as well as their
characteristics, such as memory and throughput.

"""
function describe_accelerator_types(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "GET",
        "/describe-accelerator-types",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_accelerators(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Describes information over a provided set of accelerators belonging to an account.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"accelerator_ids"`:  The IDs of the accelerators to describe.
- `"filters"`:  One or more filters. Filter names and values are case-sensitive. Valid
  filter names are: accelerator-types: can provide a list of accelerator type names to filter
  for. instance-id: can provide a list of EC2 instance ids to filter for.
- `"max_results"`:  The total number of items to return in the command's output. If the
  total number of items available is more than the value specified, a NextToken is provided
  in the command's output. To resume pagination, provide the NextToken value in the
  starting-token argument of a subsequent command. Do not use the NextToken response element
  directly outside of the AWS CLI.
- `"next_token"`:  A token to specify where to start paginating. This is the NextToken from
  a previously truncated response.
"""
function describe_accelerators(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "POST",
        "/describe-accelerators",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns all tags of an Elastic Inference Accelerator.

# Arguments
- `resource_arn`:  The ARN of the Elastic Inference Accelerator to list the tags for.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Adds the specified tags to an Elastic Inference Accelerator.

# Arguments
- `resource_arn`:  The ARN of the Elastic Inference Accelerator to tag.
- `tags`:  The tags to add to the Elastic Inference Accelerator.

"""
function tag_resource(
    resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Removes the specified tags from an Elastic Inference Accelerator.

# Arguments
- `resource_arn`:  The ARN of the Elastic Inference Accelerator to untag.
- `tag_keys`:  The list of tags to remove from the Elastic Inference Accelerator.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return elastic_inference(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
