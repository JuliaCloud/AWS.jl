# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dlm

using Compat
using UUIDs
"""
    CreateLifecyclePolicy()

Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.

# Required Parameters
- `Description`: A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+  are supported.
- `ExecutionRoleArn`: The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.
- `PolicyDetails`: The configuration details of the lifecycle policy.
- `State`: The desired activation state of the lifecycle policy after creation.

# Optional Parameters
- `Tags`: The tags to apply to the lifecycle policy during creation.
"""

CreateLifecyclePolicy(Description, ExecutionRoleArn, PolicyDetails, State; aws_config::AWSConfig=global_aws_config()) = dlm("POST", "/policies", Dict{String, Any}("Description"=>Description, "ExecutionRoleArn"=>ExecutionRoleArn, "PolicyDetails"=>PolicyDetails, "State"=>State); aws_config=aws_config)
CreateLifecyclePolicy(Description, ExecutionRoleArn, PolicyDetails, State, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("POST", "/policies", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Description"=>Description, "ExecutionRoleArn"=>ExecutionRoleArn, "PolicyDetails"=>PolicyDetails, "State"=>State), args)); aws_config=aws_config)

"""
    DeleteLifecyclePolicy()

Deletes the specified lifecycle policy and halts the automated operations that the policy specified.

# Required Parameters
- `policyId`: The identifier of the lifecycle policy.

"""

DeleteLifecyclePolicy(policyId; aws_config::AWSConfig=global_aws_config()) = dlm("DELETE", "/policies/$(policyId)/"; aws_config=aws_config)
DeleteLifecyclePolicy(policyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("DELETE", "/policies/$(policyId)/", args; aws_config=aws_config)

"""
    GetLifecyclePolicies()

Gets summary information about all or the specified data lifecycle policies. To get complete information about a policy, use GetLifecyclePolicy.

# Optional Parameters
- `policyIds`: The identifiers of the data lifecycle policies.
- `resourceTypes`: The resource type.
- `state`: The activation state.
- `tagsToAdd`: The tags to add to objects created by the policy. Tags are strings in the format key=value. These user-defined tags are added in addition to the AWS-added lifecycle tags.
- `targetTags`: The target tag for a policy. Tags are strings in the format key=value.
"""

GetLifecyclePolicies(; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/policies"; aws_config=aws_config)
GetLifecyclePolicies(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/policies", args; aws_config=aws_config)

"""
    GetLifecyclePolicy()

Gets detailed information about the specified lifecycle policy.

# Required Parameters
- `policyId`: The identifier of the lifecycle policy.

"""

GetLifecyclePolicy(policyId; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/policies/$(policyId)/"; aws_config=aws_config)
GetLifecyclePolicy(policyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/policies/$(policyId)/", args; aws_config=aws_config)

"""
    ListTagsForResource()

Lists the tags for the specified resource.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) of the resource.

"""

ListTagsForResource(resourceArn; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
ListTagsForResource(resourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("GET", "/tags/$(resourceArn)", args; aws_config=aws_config)

"""
    TagResource()

Adds the specified tags to the specified resource.

# Required Parameters
- `Tags`: One or more tags.
- `resourceArn`: The Amazon Resource Name (ARN) of the resource.

"""

TagResource(Tags, resourceArn; aws_config::AWSConfig=global_aws_config()) = dlm("POST", "/tags/$(resourceArn)", Dict{String, Any}("Tags"=>Tags); aws_config=aws_config)
TagResource(Tags, resourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), args)); aws_config=aws_config)

"""
    UntagResource()

Removes the specified tags from the specified resource.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) of the resource.
- `tagKeys`: The tag keys.

"""

UntagResource(resourceArn, tagKeys; aws_config::AWSConfig=global_aws_config()) = dlm("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
UntagResource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    UpdateLifecyclePolicy()

Updates the specified lifecycle policy.

# Required Parameters
- `policyId`: The identifier of the lifecycle policy.

# Optional Parameters
- `Description`: A description of the lifecycle policy.
- `ExecutionRoleArn`: The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.
- `PolicyDetails`: The configuration of the lifecycle policy. You cannot update the policy type or the resource type.
- `State`: The desired activation state of the lifecycle policy after creation.
"""

UpdateLifecyclePolicy(policyId; aws_config::AWSConfig=global_aws_config()) = dlm("PATCH", "/policies/$(policyId)"; aws_config=aws_config)
UpdateLifecyclePolicy(policyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dlm("PATCH", "/policies/$(policyId)", args; aws_config=aws_config)
