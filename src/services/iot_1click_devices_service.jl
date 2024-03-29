# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iot_1click_devices_service
using AWS.Compat
using AWS.UUIDs

"""
    claim_devices_by_claim_code(claim_code)
    claim_devices_by_claim_code(claim_code, params::Dict{String,<:Any})

Adds device(s) to your account (i.e., claim one or more devices) if and only if you
received a claim code with the device(s).

# Arguments
- `claim_code`: The claim code, starting with \"C-\", as provided by the device
  manufacturer.

"""
function claim_devices_by_claim_code(
    claimCode; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iot_1click_devices_service(
        "PUT",
        "/claims/$(claimCode)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function claim_devices_by_claim_code(
    claimCode,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "PUT",
        "/claims/$(claimCode)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_device(device_id)
    describe_device(device_id, params::Dict{String,<:Any})

Given a device ID, returns a DescribeDeviceResponse object describing the
 details of the
device.

# Arguments
- `device_id`: The unique identifier of the device.

"""
function describe_device(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_device(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    finalize_device_claim(device_id)
    finalize_device_claim(device_id, params::Dict{String,<:Any})

Given a device ID, finalizes the claim request for the associated device.
 Claiming a
device consists of initiating a claim, then publishing a device event,
 and finalizing the
claim. For a device of type button, a device event can
 be published by simply clicking the
device.

# Arguments
- `device_id`: The unique identifier of the device.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: A collection of key/value pairs defining the resource tags. For example, {
  \"tags\": {\"key1\": \"value1\", \"key2\": \"value2\"} }. For more information, see AWS
  Tagging Strategies.
"""
function finalize_device_claim(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/finalize-claim";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function finalize_device_claim(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/finalize-claim",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_device_methods(device_id)
    get_device_methods(device_id, params::Dict{String,<:Any})

Given a device ID, returns the invokable methods associated with the device.

# Arguments
- `device_id`: The unique identifier of the device.

"""
function get_device_methods(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)/methods";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_device_methods(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)/methods",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    initiate_device_claim(device_id)
    initiate_device_claim(device_id, params::Dict{String,<:Any})

Given a device ID, initiates a claim request for the associated device.
 Claiming a device
consists of initiating a claim, then publishing a device event,
 and finalizing the claim.
For a device of type button, a device event can
 be published by simply clicking the
device.

# Arguments
- `device_id`: The unique identifier of the device.

"""
function initiate_device_claim(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/initiate-claim";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function initiate_device_claim(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/initiate-claim",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    invoke_device_method(device_id)
    invoke_device_method(device_id, params::Dict{String,<:Any})

Given a device ID, issues a request to invoke a named device method (with possible
parameters). See the \"Example POST\" code snippet below.

# Arguments
- `device_id`: The unique identifier of the device.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"deviceMethod"`: The device method to invoke.
- `"deviceMethodParameters"`: A JSON encoded string containing the device method request
  parameters.
"""
function invoke_device_method(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "POST",
        "/devices/$(deviceId)/methods";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function invoke_device_method(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "POST",
        "/devices/$(deviceId)/methods",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_device_events(device_id, from_time_stamp, to_time_stamp)
    list_device_events(device_id, from_time_stamp, to_time_stamp, params::Dict{String,<:Any})

Using a device ID, returns a DeviceEventsResponse object containing an
 array of events for
the device.

# Arguments
- `device_id`: The unique identifier of the device.
- `from_time_stamp`: The start date for the device event query, in ISO8061 format. For
  example,
 2018-03-28T15:45:12.880Z
- `to_time_stamp`: The end date for the device event query, in ISO8061 format. For
  example,
 2018-03-28T15:45:12.880Z

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return per request. If not set, a
  default value of
 100 is used.
- `"nextToken"`: The token to retrieve the next set of results.
"""
function list_device_events(
    deviceId, fromTimeStamp, toTimeStamp; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)/events",
        Dict{String,Any}("fromTimeStamp" => fromTimeStamp, "toTimeStamp" => toTimeStamp);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_device_events(
    deviceId,
    fromTimeStamp,
    toTimeStamp,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "GET",
        "/devices/$(deviceId)/events",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "fromTimeStamp" => fromTimeStamp, "toTimeStamp" => toTimeStamp
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_devices()
    list_devices(params::Dict{String,<:Any})

Lists the 1-Click compatible devices associated with your AWS account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"deviceType"`: The type of the device, such as \"button\".
- `"maxResults"`: The maximum number of results to return per request. If not set, a
  default value of
 100 is used.
- `"nextToken"`: The token to retrieve the next set of results.
"""
function list_devices(; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "GET", "/devices"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_devices(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iot_1click_devices_service(
        "GET", "/devices", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource-arn)
    list_tags_for_resource(resource-arn, params::Dict{String,<:Any})

Lists the tags associated with the specified resource ARN.

# Arguments
- `resource-arn`: The ARN of the resource.

"""
function list_tags_for_resource(
    resource_arn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iot_1click_devices_service(
        "GET",
        "/tags/$(resource-arn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    resource_arn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "GET",
        "/tags/$(resource-arn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource-arn, tags)
    tag_resource(resource-arn, tags, params::Dict{String,<:Any})

Adds or updates the tags associated with the resource ARN. See AWS IoT 1-Click Service
Limits for the maximum number of tags allowed per
 resource.

# Arguments
- `resource-arn`: The ARN of the resource.
- `tags`: A collection of key/value pairs defining the resource tags. For example, {
  \"tags\": {\"key1\": \"value1\", \"key2\": \"value2\"} }. For more information, see AWS
  Tagging Strategies.

"""
function tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "POST",
        "/tags/$(resource-arn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    resource_arn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "POST",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    unclaim_device(device_id)
    unclaim_device(device_id, params::Dict{String,<:Any})

Disassociates a device from your AWS account using its device ID.

# Arguments
- `device_id`: The unique identifier of the device.

"""
function unclaim_device(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/unclaim";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function unclaim_device(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/unclaim",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource-arn, tag_keys)
    untag_resource(resource-arn, tag_keys, params::Dict{String,<:Any})

Using tag keys, deletes the tags (key/value pairs) associated with the specified
 resource
ARN.

# Arguments
- `resource-arn`: The ARN of the resource.
- `tag_keys`: A collections of tag keys. For example, {\"key1\",\"key2\"}

"""
function untag_resource(
    resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iot_1click_devices_service(
        "DELETE",
        "/tags/$(resource-arn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    resource_arn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "DELETE",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_device_state(device_id)
    update_device_state(device_id, params::Dict{String,<:Any})

Using a Boolean value (true or false), this operation
 enables or disables the device given
a device ID.

# Arguments
- `device_id`: The unique identifier of the device.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"enabled"`: If true, the device is enabled. If false, the device is
 disabled.
"""
function update_device_state(deviceId; aws_config::AbstractAWSConfig=global_aws_config())
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/state";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_device_state(
    deviceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iot_1click_devices_service(
        "PUT",
        "/devices/$(deviceId)/state",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
