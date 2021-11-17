# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dlm
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "target_tags" => "targetTags",
    "description" => "Description",
    "execution_role_arn" => "ExecutionRoleArn",
    "policy_details" => "PolicyDetails",
    "tags" => "Tags",
    "policy_ids" => "policyIds",
    "resource_types" => "resourceTypes",
    "tags_to_add" => "tagsToAdd",
    "state" => "State",
)

"""
    create_lifecycle_policy(description, execution_role_arn, policy_details, state; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a policy to manage the lifecycle of the specified Amazon Web Services resources.
You can create up to 100 lifecycle policies.

# Arguments
- `description`: A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+ are
  supported.
- `execution_role_arn`: The Amazon Resource Name (ARN) of the IAM role used to run the
  operations specified by the lifecycle policy.
- `policy_details`: The configuration details of the lifecycle policy.
- `state`: The desired activation state of the lifecycle policy after creation.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tags"`: The tags to apply to the lifecycle policy during creation.
"""
function create_lifecycle_policy(
    Description,
    ExecutionRoleArn,
    PolicyDetails,
    State;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "POST",
        "/policies",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Description" => Description,
                    "ExecutionRoleArn" => ExecutionRoleArn,
                    "PolicyDetails" => PolicyDetails,
                    "State" => State,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_lifecycle_policy(policy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified lifecycle policy and halts the automated operations that the policy
specified.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

"""
function delete_lifecycle_policy(
    policyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "DELETE",
        "/policies/$(policyId)/",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_lifecycle_policies(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets summary information about all or the specified data lifecycle policies. To get
complete information about a policy, use GetLifecyclePolicy.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"policy_ids"`: The identifiers of the data lifecycle policies.
- `"resource_types"`: The resource type.
- `"state"`: The activation state.
- `"tags_to_add"`: The tags to add to objects created by the policy. Tags are strings in
  the format key=value. These user-defined tags are added in addition to the Amazon Web
  Services-added lifecycle tags.
- `"target_tags"`: The target tag for a policy. Tags are strings in the format key=value.
"""
function get_lifecycle_policies(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "GET", "/policies", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    get_lifecycle_policy(policy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets detailed information about the specified lifecycle policy.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

"""
function get_lifecycle_policy(
    policyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "GET",
        "/policies/$(policyId)/",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the tags for the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(tags, resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified tags to the specified resource.

# Arguments
- `tags`: One or more tags.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function tag_resource(
    Tags, resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified tags from the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tag_keys`: The tag keys.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_lifecycle_policy(policy_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the specified lifecycle policy.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: A description of the lifecycle policy.
- `"execution_role_arn"`: The Amazon Resource Name (ARN) of the IAM role used to run the
  operations specified by the lifecycle policy.
- `"policy_details"`: The configuration of the lifecycle policy. You cannot update the
  policy type or the resource type.
- `"state"`: The desired activation state of the lifecycle policy after creation.
"""
function update_lifecycle_policy(
    policyId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dlm(
        "PATCH",
        "/policies/$(policyId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
