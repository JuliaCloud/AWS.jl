# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: braket
using AWS.Compat
using AWS.UUIDs

"""
    cancel_quantum_task(client_token, quantum_task_arn)
    cancel_quantum_task(client_token, quantum_task_arn, params::Dict{String,<:Any})

Cancels the specified task.

# Arguments
- `client_token`: The client token associated with the request.
- `quantum_task_arn`: The ARN of the task to cancel.

"""
cancel_quantum_task(clientToken, quantumTaskArn; aws_config::AbstractAWSConfig=global_aws_config()) = braket("PUT", "/quantum-task/$(quantumTaskArn)/cancel", Dict{String, Any}("clientToken"=>clientToken); aws_config=aws_config)
cancel_quantum_task(clientToken, quantumTaskArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("PUT", "/quantum-task/$(quantumTaskArn)/cancel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>clientToken), params)); aws_config=aws_config)

"""
    create_quantum_task(action, client_token, device_arn, output_s3_bucket, output_s3_key_prefix, shots)
    create_quantum_task(action, client_token, device_arn, output_s3_bucket, output_s3_key_prefix, shots, params::Dict{String,<:Any})

Creates a quantum task.

# Arguments
- `action`: The action associated with the task.
- `client_token`: The client token associated with the request.
- `device_arn`: The ARN of the device to run the task on.
- `output_s3_bucket`: The S3 bucket to store task result files in.
- `output_s3_key_prefix`: The key prefix for the location in the S3 bucket to store task
  results in.
- `shots`: The number of shots to use for the task.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"deviceParameters"`: The parameters for the device to run the task on.
- `"tags"`: Tags to be added to the quantum task you're creating.
"""
create_quantum_task(action, clientToken, deviceArn, outputS3Bucket, outputS3KeyPrefix, shots; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/quantum-task", Dict{String, Any}("action"=>action, "clientToken"=>clientToken, "deviceArn"=>deviceArn, "outputS3Bucket"=>outputS3Bucket, "outputS3KeyPrefix"=>outputS3KeyPrefix, "shots"=>shots); aws_config=aws_config)
create_quantum_task(action, clientToken, deviceArn, outputS3Bucket, outputS3KeyPrefix, shots, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/quantum-task", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("action"=>action, "clientToken"=>clientToken, "deviceArn"=>deviceArn, "outputS3Bucket"=>outputS3Bucket, "outputS3KeyPrefix"=>outputS3KeyPrefix, "shots"=>shots), params)); aws_config=aws_config)

"""
    get_device(device_arn)
    get_device(device_arn, params::Dict{String,<:Any})

Retrieves the devices available in Amazon Braket.

# Arguments
- `device_arn`: The ARN of the device to retrieve.

"""
get_device(deviceArn; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/device/$(deviceArn)"; aws_config=aws_config)
get_device(deviceArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/device/$(deviceArn)", params; aws_config=aws_config)

"""
    get_quantum_task(quantum_task_arn)
    get_quantum_task(quantum_task_arn, params::Dict{String,<:Any})

Retrieves the specified quantum task.

# Arguments
- `quantum_task_arn`: the ARN of the task to retrieve.

"""
get_quantum_task(quantumTaskArn; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/quantum-task/$(quantumTaskArn)"; aws_config=aws_config)
get_quantum_task(quantumTaskArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/quantum-task/$(quantumTaskArn)", params; aws_config=aws_config)

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Shows the tags associated with this resource.

# Arguments
- `resource_arn`: Specify the resourceArn for the resource whose tags to display.

"""
list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
list_tags_for_resource(resourceArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("GET", "/tags/$(resourceArn)", params; aws_config=aws_config)

"""
    search_devices(filters)
    search_devices(filters, params::Dict{String,<:Any})

Searches for devices using the specified filters.

# Arguments
- `filters`: The filter values to use to search for a device.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned in the response. Use the
  token returned from the previous request continue results where the previous request ended.
"""
search_devices(filters; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/devices", Dict{String, Any}("filters"=>filters); aws_config=aws_config)
search_devices(filters, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/devices", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filters"=>filters), params)); aws_config=aws_config)

"""
    search_quantum_tasks(filters)
    search_quantum_tasks(filters, params::Dict{String,<:Any})

Searches for tasks that match the specified filter values.

# Arguments
- `filters`: Array of SearchQuantumTasksFilter objects.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned in the response. Use the
  token returned from the previous request continue results where the previous request ended.
"""
search_quantum_tasks(filters; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/quantum-tasks", Dict{String, Any}("filters"=>filters); aws_config=aws_config)
search_quantum_tasks(filters, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/quantum-tasks", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filters"=>filters), params)); aws_config=aws_config)

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Add a tag to the specified resource.

# Arguments
- `resource_arn`: Specify the resourceArn of the resource to which a tag will be added.
- `tags`: Specify the tags to add to the resource.

"""
tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
tag_resource(resourceArn, tags, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config)

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Remove tags from a resource.

# Arguments
- `resource_arn`: Specify the resourceArn for the resource from which to remove the tags.
- `tag_keys`: pecify the keys for the tags to remove from the resource.

"""
untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()) = braket("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(resourceArn, tagKeys, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = braket("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config)
