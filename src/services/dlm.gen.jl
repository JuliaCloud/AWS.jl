# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dlm
using AWS.Compat
using AWS.UUIDs

"""
    create_lifecycle_policy(description, execution_role_arn, policy_details, state)
    create_lifecycle_policy(description, execution_role_arn, policy_details, state, params::Dict{String,<:Any})

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
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Tags"`: The tags to apply to the lifecycle policy during creation.
"""
function create_lifecycle_policy(
    Description,
    ExecutionRoleArn,
    PolicyDetails,
    State;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm(
        "POST",
        "/policies",
        Dict{String,Any}(
            "Description" => Description,
            "ExecutionRoleArn" => ExecutionRoleArn,
            "PolicyDetails" => PolicyDetails,
            "State" => State,
        );
        aws_config=aws_config,
    )
end
function create_lifecycle_policy(
    Description,
    ExecutionRoleArn,
    PolicyDetails,
    State,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    delete_lifecycle_policy(policy_id)
    delete_lifecycle_policy(policy_id, params::Dict{String,<:Any})

Deletes the specified lifecycle policy and halts the automated operations that the policy
specified.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

"""
function delete_lifecycle_policy(
    policyId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dlm("DELETE", "/policies/$(policyId)/"; aws_config=aws_config)
end
function delete_lifecycle_policy(
    policyId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm("DELETE", "/policies/$(policyId)/", params; aws_config=aws_config)
end

"""
    get_lifecycle_policies()
    get_lifecycle_policies(params::Dict{String,<:Any})

Gets summary information about all or the specified data lifecycle policies. To get
complete information about a policy, use GetLifecyclePolicy.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"policyIds"`: The identifiers of the data lifecycle policies.
- `"resourceTypes"`: The resource type.
- `"state"`: The activation state.
- `"tagsToAdd"`: The tags to add to objects created by the policy. Tags are strings in the
  format key=value. These user-defined tags are added in addition to the Amazon Web
  Services-added lifecycle tags.
- `"targetTags"`: The target tag for a policy. Tags are strings in the format key=value.
"""
function get_lifecycle_policies(; aws_config::AbstractAWSConfig=global_aws_config())
    return dlm("GET", "/policies"; aws_config=aws_config)
end
function get_lifecycle_policies(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dlm("GET", "/policies", params; aws_config=aws_config)
end

"""
    get_lifecycle_policy(policy_id)
    get_lifecycle_policy(policy_id, params::Dict{String,<:Any})

Gets detailed information about the specified lifecycle policy.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

"""
function get_lifecycle_policy(policyId; aws_config::AbstractAWSConfig=global_aws_config())
    return dlm("GET", "/policies/$(policyId)/"; aws_config=aws_config)
end
function get_lifecycle_policy(
    policyId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm("GET", "/policies/$(policyId)/", params; aws_config=aws_config)
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists the tags for the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dlm("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm("GET", "/tags/$(resourceArn)", params; aws_config=aws_config)
end

"""
    tag_resource(tags, resource_arn)
    tag_resource(tags, resource_arn, params::Dict{String,<:Any})

Adds the specified tags to the specified resource.

# Arguments
- `tags`: One or more tags.
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function tag_resource(Tags, resourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return dlm(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("Tags" => Tags);
        aws_config=aws_config,
    )
end
function tag_resource(
    Tags,
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes the specified tags from the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tag_keys`: The tag keys.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dlm(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
    )
end

"""
    update_lifecycle_policy(policy_id)
    update_lifecycle_policy(policy_id, params::Dict{String,<:Any})

Updates the specified lifecycle policy.

# Arguments
- `policy_id`: The identifier of the lifecycle policy.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: A description of the lifecycle policy.
- `"ExecutionRoleArn"`: The Amazon Resource Name (ARN) of the IAM role used to run the
  operations specified by the lifecycle policy.
- `"PolicyDetails"`: The configuration of the lifecycle policy. You cannot update the
  policy type or the resource type.
- `"State"`: The desired activation state of the lifecycle policy after creation.
"""
function update_lifecycle_policy(
    policyId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dlm("PATCH", "/policies/$(policyId)"; aws_config=aws_config)
end
function update_lifecycle_policy(
    policyId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dlm("PATCH", "/policies/$(policyId)", params; aws_config=aws_config)
end