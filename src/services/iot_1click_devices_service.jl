include("../AWSServices.jl")
using .AWSServices: iot_1click_devices_service

"""
    ListTagsForResource()

Lists the tags associated with the specified resource ARN.

Required Parameters
{
  "ResourceArn": "The ARN of the resource."
}
"""
ListTagsForResource(args) = iot_1click_devices_service("GET", "/tags/{resource-arn}", args)

"""
    ListDevices()

Lists the 1-Click compatible devices associated with your AWS account.

Optional Parameters
{
  "DeviceType": "The type of the device, such as \"button\".",
  "MaxResults": "The maximum number of results to return per request. If not set, a default value of\n 100 is used.",
  "NextToken": "The token to retrieve the next set of results."
}
"""
ListDevices() = iot_1click_devices_service("GET", "/devices")
ListDevices(args) = iot_1click_devices_service("GET", "/devices", args)

"""
    InvokeDeviceMethod()

Given a device ID, issues a request to invoke a named device method (with possible
 parameters). See the "Example POST" code snippet below.

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}

Optional Parameters
{
  "DeviceMethodParameters": "A JSON encoded string containing the device method request parameters.",
  "DeviceMethod": "The device method to invoke."
}
"""
InvokeDeviceMethod(args) = iot_1click_devices_service("POST", "/devices/{deviceId}/methods", args)

"""
    TagResource()

Adds or updates the tags associated with the resource ARN. See AWS IoT 1-Click Service Limits for the maximum number of tags allowed per
 resource.

Required Parameters
{
  "ResourceArn": "The ARN of the resource.",
  "Tags": "A collection of key/value pairs defining the resource tags. For example, {\n \"tags\": {\"key1\": \"value1\", \"key2\": \"value2\"} }. For more information, see AWS\n Tagging Strategies.\n \n "
}
"""
TagResource(args) = iot_1click_devices_service("POST", "/tags/{resource-arn}", args)

"""
    UntagResource()

Using tag keys, deletes the tags (key/value pairs) associated with the specified
 resource ARN.

Required Parameters
{
  "ResourceArn": "The ARN of the resource.",
  "TagKeys": "A collections of tag keys. For example, {\"key1\",\"key2\"}"
}
"""
UntagResource(args) = iot_1click_devices_service("DELETE", "/tags/{resource-arn}", args)

"""
    ListDeviceEvents()

Using a device ID, returns a DeviceEventsResponse object containing an
 array of events for the device.

Required Parameters
{
  "FromTimeStamp": "The start date for the device event query, in ISO8061 format. For example,\n 2018-03-28T15:45:12.880Z\n ",
  "ToTimeStamp": "The end date for the device event query, in ISO8061 format. For example,\n 2018-03-28T15:45:12.880Z\n ",
  "DeviceId": "The unique identifier of the device."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return per request. If not set, a default value of\n 100 is used.",
  "NextToken": "The token to retrieve the next set of results."
}
"""
ListDeviceEvents(args) = iot_1click_devices_service("GET", "/devices/{deviceId}/events", args)

"""
    FinalizeDeviceClaim()

Given a device ID, finalizes the claim request for the associated device.
 Claiming a device consists of initiating a claim, then publishing a device event,
 and finalizing the claim. For a device of type button, a device event can
 be published by simply clicking the device.
 

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}

Optional Parameters
{
  "Tags": "A collection of key/value pairs defining the resource tags. For example, {\n \"tags\": {\"key1\": \"value1\", \"key2\": \"value2\"} }. For more information, see AWS\n Tagging Strategies.\n \n "
}
"""
FinalizeDeviceClaim(args) = iot_1click_devices_service("PUT", "/devices/{deviceId}/finalize-claim", args)

"""
    ClaimDevicesByClaimCode()

Adds device(s) to your account (i.e., claim one or more devices) if and only if you
 received a claim code with the device(s).

Required Parameters
{
  "ClaimCode": "The claim code, starting with \"C-\", as provided by the device manufacturer."
}
"""
ClaimDevicesByClaimCode(args) = iot_1click_devices_service("PUT", "/claims/{claimCode}", args)

"""
    DescribeDevice()

Given a device ID, returns a DescribeDeviceResponse object describing the
 details of the device.

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}
"""
DescribeDevice(args) = iot_1click_devices_service("GET", "/devices/{deviceId}", args)

"""
    UnclaimDevice()

Disassociates a device from your AWS account using its device ID.

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}
"""
UnclaimDevice(args) = iot_1click_devices_service("PUT", "/devices/{deviceId}/unclaim", args)

"""
    InitiateDeviceClaim()

Given a device ID, initiates a claim request for the associated device.
 Claiming a device consists of initiating a claim, then publishing a device event,
 and finalizing the claim. For a device of type button, a device event can
 be published by simply clicking the device.
 

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}
"""
InitiateDeviceClaim(args) = iot_1click_devices_service("PUT", "/devices/{deviceId}/initiate-claim", args)

"""
    GetDeviceMethods()

Given a device ID, returns the invokable methods associated with the device.

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}
"""
GetDeviceMethods(args) = iot_1click_devices_service("GET", "/devices/{deviceId}/methods", args)

"""
    UpdateDeviceState()

Using a Boolean value (true or false), this operation
 enables or disables the device given a device ID.

Required Parameters
{
  "DeviceId": "The unique identifier of the device."
}

Optional Parameters
{
  "Enabled": "If true, the device is enabled. If false, the device is\n disabled."
}
"""
UpdateDeviceState(args) = iot_1click_devices_service("PUT", "/devices/{deviceId}/state", args)
