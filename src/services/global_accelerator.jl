include("../AWSServices.jl")
using .AWSServices: global_accelerator

"""
    ListTagsForResource()

List all tags for an accelerator. To see an AWS CLI example of listing tags for an accelerator, scroll down to Example. For more information, see Tagging in AWS Global Accelerator in the AWS Global Accelerator Developer Guide. 

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the accelerator to list tags for. An ARN uniquely identifies an accelerator."
}
"""
ListTagsForResource(args) = global_accelerator("ListTagsForResource", args)

"""
    DeleteListener()

Delete a listener from an accelerator.

Required Parameters
{
  "ListenerArn": "The Amazon Resource Name (ARN) of the listener."
}
"""
DeleteListener(args) = global_accelerator("DeleteListener", args)

"""
    AdvertiseByoipCidr()

Advertises an IPv4 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP). It can take a few minutes before traffic to the specified addresses starts routing to AWS because of propagation delays. To see an AWS CLI example of advertising an address range, scroll down to Example. To stop advertising the BYOIP address range, use  WithdrawByoipCidr. For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS Global Accelerator Developer Guide.

Required Parameters
{
  "Cidr": "The address range, in CIDR notation. This must be the exact range that you provisioned. You can't advertise only a portion of the provisioned range."
}
"""
AdvertiseByoipCidr(args) = global_accelerator("AdvertiseByoipCidr", args)

"""
    DeprovisionByoipCidr()

Releases the specified address range that you provisioned to use with your AWS resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool. To see an AWS CLI example of deprovisioning an address range, scroll down to Example. Before you can release an address range, you must stop advertising it by using WithdrawByoipCidr and you must not have any accelerators that are using static IP addresses allocated from its address range.  For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS Global Accelerator Developer Guide.

Required Parameters
{
  "Cidr": "The address range, in CIDR notation. The prefix must be the same prefix that you specified when you provisioned the address range."
}
"""
DeprovisionByoipCidr(args) = global_accelerator("DeprovisionByoipCidr", args)

"""
    DescribeAccelerator()

Describe an accelerator. To see an AWS CLI example of describing an accelerator, scroll down to Example.

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of the accelerator to describe."
}
"""
DescribeAccelerator(args) = global_accelerator("DescribeAccelerator", args)

"""
    ProvisionByoipCidr()

Provisions an IP address range to use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using  AdvertiseByoipCidr. To see an AWS CLI example of provisioning an address range for BYOIP, scroll down to Example. For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS Global Accelerator Developer Guide.

Required Parameters
{
  "Cidr": "The public IPv4 address range, in CIDR notation. The most specific IP prefix that you can specify is /24. The address range cannot overlap with another address range that you've brought to this or another Region.",
  "CidrAuthorizationContext": "A signed document that proves that you are authorized to bring the specified IP address range to Amazon using BYOIP. "
}
"""
ProvisionByoipCidr(args) = global_accelerator("ProvisionByoipCidr", args)

"""
    ListByoipCidrs()

Lists the IP address ranges that were specified in calls to ProvisionByoipCidr, including the current state and a history of state changes. To see an AWS CLI example of listing BYOIP CIDR addresses, scroll down to Example.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned nextToken value.",
  "NextToken": "The token for the next page of results."
}
"""
ListByoipCidrs() = global_accelerator("ListByoipCidrs")
ListByoipCidrs(args) = global_accelerator("ListByoipCidrs", args)

"""
    UpdateAccelerator()

Update an accelerator. To see an AWS CLI example of updating an accelerator, scroll down to Example.  You must specify the US West (Oregon) Region to create or update accelerators. 

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of the accelerator to update."
}

Optional Parameters
{
  "IpAddressType": "The value for the address type must be IPv4. ",
  "Name": "The name of the accelerator. The name can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens (-), and must not begin or end with a hyphen.",
  "Enabled": "Indicates whether an accelerator is enabled. The value is true or false. The default value is true.  If the value is set to true, the accelerator cannot be deleted. If set to false, the accelerator can be deleted."
}
"""
UpdateAccelerator(args) = global_accelerator("UpdateAccelerator", args)

"""
    DescribeListener()

Describe a listener. To see an AWS CLI example of describing a listener, scroll down to Example.

Required Parameters
{
  "ListenerArn": "The Amazon Resource Name (ARN) of the listener to describe."
}
"""
DescribeListener(args) = global_accelerator("DescribeListener", args)

"""
    CreateListener()

Create a listener to process inbound connections from clients to an accelerator. Connections arrive to assigned static IP addresses on a port, port range, or list of port ranges that you specify. To see an AWS CLI example of creating a listener, scroll down to Example.

Required Parameters
{
  "IdempotencyToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the uniqueness—of the request.",
  "PortRanges": "The list of port ranges to support for connections from clients to your accelerator.",
  "AcceleratorArn": "The Amazon Resource Name (ARN) of your accelerator.",
  "Protocol": "The protocol for connections from clients to your accelerator."
}

Optional Parameters
{
  "ClientAffinity": "Client affinity lets you direct all requests from a user to the same endpoint, if you have stateful applications, regardless of the port and protocol of the client request. Clienty affinity gives you control over whether to always route each client to the same specific endpoint. AWS Global Accelerator uses a consistent-flow hashing algorithm to choose the optimal endpoint for a connection. If client affinity is NONE, Global Accelerator uses the \"five-tuple\" (5-tuple) properties—source IP address, source port, destination IP address, destination port, and protocol—to select the hash value, and then chooses the best endpoint. However, with this setting, if someone uses different ports to connect to Global Accelerator, their connections might not be always routed to the same endpoint because the hash value changes.  If you want a given client to always be routed to the same endpoint, set client affinity to SOURCE_IP instead. When you use the SOURCE_IP setting, Global Accelerator uses the \"two-tuple\" (2-tuple) properties— source (client) IP address and destination IP address—to select the hash value. The default value is NONE."
}
"""
CreateListener(args) = global_accelerator("CreateListener", args)

"""
    TagResource()

Add tags to an accelerator resource. To see an AWS CLI example of adding tags to an accelerator, scroll down to Example. For more information, see Tagging in AWS Global Accelerator in the AWS Global Accelerator Developer Guide. 

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the Global Accelerator resource to add tags to. An ARN uniquely identifies a resource.",
  "Tags": "The tags to add to a resource. A tag consists of a key and a value that you define."
}
"""
TagResource(args) = global_accelerator("TagResource", args)

"""
    UntagResource()

Remove tags from a Global Accelerator resource. When you specify a tag key, the action removes both that key and its associated value. To see an AWS CLI example of removing tags from an accelerator, scroll down to Example. The operation succeeds even if you attempt to remove tags from an accelerator that was already removed. For more information, see Tagging in AWS Global Accelerator in the AWS Global Accelerator Developer Guide.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the Global Accelerator resource to remove tags from. An ARN uniquely identifies a resource.",
  "TagKeys": "The tag key pairs that you want to remove from the specified resources."
}
"""
UntagResource(args) = global_accelerator("UntagResource", args)

"""
    DeleteAccelerator()

Delete an accelerator. Before you can delete an accelerator, you must disable it and remove all dependent resources (listeners and endpoint groups). To disable the accelerator, update the accelerator to set Enabled to false.  When you create an accelerator, by default, Global Accelerator provides you with a set of two static IP addresses. Alternatively, you can bring your own IP address ranges to Global Accelerator and assign IP addresses from those ranges.  The IP addresses are assigned to your accelerator for as long as it exists, even if you disable the accelerator and it no longer accepts or routes traffic. However, when you delete an accelerator, you lose the static IP addresses that are assigned to the accelerator, so you can no longer route traffic by using them. As a best practice, ensure that you have permissions in place to avoid inadvertently deleting accelerators. You can use IAM policies with Global Accelerator to limit the users who have permissions to delete an accelerator. For more information, see Authentication and Access Control in the AWS Global Accelerator Developer Guide. 

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of an accelerator."
}
"""
DeleteAccelerator(args) = global_accelerator("DeleteAccelerator", args)

"""
    CreateEndpointGroup()

Create an endpoint group for the specified listener. An endpoint group is a collection of endpoints in one AWS Region. To see an AWS CLI example of creating an endpoint group, scroll down to Example.

Required Parameters
{
  "ListenerArn": "The Amazon Resource Name (ARN) of the listener.",
  "IdempotencyToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the uniqueness—of the request.",
  "EndpointGroupRegion": "The name of the AWS Region where the endpoint group is located. A listener can have only one endpoint group in a specific Region."
}

Optional Parameters
{
  "HealthCheckPort": "The port that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. The default port is the listener port that this endpoint group is associated with. If listener port is a list of ports, Global Accelerator uses the first port in the list.",
  "ThresholdCount": "The number of consecutive health checks required to set the state of a healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.",
  "TrafficDialPercentage": "The percentage of traffic to send to an AWS Region. Additional traffic is distributed to other endpoint groups for this listener.  Use this action to increase (dial up) or decrease (dial down) traffic to a specific Region. The percentage is applied to the traffic that would otherwise have been routed to the Region based on optimal routing. The default value is 100.",
  "HealthCheckProtocol": "The protocol that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. The default value is TCP.",
  "HealthCheckPath": "If the protocol is HTTP/S, then this specifies the path that is the destination for health check targets. The default value is slash (/).",
  "EndpointConfigurations": "The list of endpoint objects.",
  "HealthCheckIntervalSeconds": "The time—10 seconds or 30 seconds—between each health check for an endpoint. The default value is 30."
}
"""
CreateEndpointGroup(args) = global_accelerator("CreateEndpointGroup", args)

"""
    ListAccelerators()

List the accelerators for an AWS account. To see an AWS CLI example of listing the accelerators for an AWS account, scroll down to Example.

Optional Parameters
{
  "MaxResults": "The number of Global Accelerator objects that you want to return with this call. The default value is 10.",
  "NextToken": "The token for the next set of results. You receive this token from a previous call."
}
"""
ListAccelerators() = global_accelerator("ListAccelerators")
ListAccelerators(args) = global_accelerator("ListAccelerators", args)

"""
    DeleteEndpointGroup()

Delete an endpoint group from a listener.

Required Parameters
{
  "EndpointGroupArn": "The Amazon Resource Name (ARN) of the endpoint group to delete."
}
"""
DeleteEndpointGroup(args) = global_accelerator("DeleteEndpointGroup", args)

"""
    UpdateListener()

Update a listener. To see an AWS CLI example of updating listener, scroll down to Example.

Required Parameters
{
  "ListenerArn": "The Amazon Resource Name (ARN) of the listener to update."
}

Optional Parameters
{
  "ClientAffinity": "Client affinity lets you direct all requests from a user to the same endpoint, if you have stateful applications, regardless of the port and protocol of the client request. Clienty affinity gives you control over whether to always route each client to the same specific endpoint. AWS Global Accelerator uses a consistent-flow hashing algorithm to choose the optimal endpoint for a connection. If client affinity is NONE, Global Accelerator uses the \"five-tuple\" (5-tuple) properties—source IP address, source port, destination IP address, destination port, and protocol—to select the hash value, and then chooses the best endpoint. However, with this setting, if someone uses different ports to connect to Global Accelerator, their connections might not be always routed to the same endpoint because the hash value changes.  If you want a given client to always be routed to the same endpoint, set client affinity to SOURCE_IP instead. When you use the SOURCE_IP setting, Global Accelerator uses the \"two-tuple\" (2-tuple) properties— source (client) IP address and destination IP address—to select the hash value. The default value is NONE.",
  "PortRanges": "The updated list of port ranges for the connections from clients to the accelerator.",
  "Protocol": "The updated protocol for the connections from clients to the accelerator."
}
"""
UpdateListener(args) = global_accelerator("UpdateListener", args)

"""
    ListEndpointGroups()

List the endpoint groups that are associated with a listener. To see an AWS CLI example of listing the endpoint groups for listener, scroll down to Example.

Required Parameters
{
  "ListenerArn": "The Amazon Resource Name (ARN) of the listener."
}

Optional Parameters
{
  "MaxResults": "The number of endpoint group objects that you want to return with this call. The default value is 10.",
  "NextToken": "The token for the next set of results. You receive this token from a previous call."
}
"""
ListEndpointGroups(args) = global_accelerator("ListEndpointGroups", args)

"""
    DescribeAcceleratorAttributes()

Describe the attributes of an accelerator. To see an AWS CLI example of describing the attributes of an accelerator, scroll down to Example.

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of the accelerator with the attributes that you want to describe."
}
"""
DescribeAcceleratorAttributes(args) = global_accelerator("DescribeAcceleratorAttributes", args)

"""
    CreateAccelerator()

Create an accelerator. An accelerator includes one or more listeners that process inbound connections and direct traffic to one or more endpoint groups, each of which includes endpoints, such as Network Load Balancers. To see an AWS CLI example of creating an accelerator, scroll down to Example. If you bring your own IP address ranges to AWS Global Accelerator (BYOIP), you can assign IP addresses from your own pool to your accelerator as the static IP address entry points. Only one IP address from each of your IP address ranges can be used for each accelerator.  You must specify the US West (Oregon) Region to create or update accelerators. 

Required Parameters
{
  "IdempotencyToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the uniqueness—of an accelerator.",
  "Name": "The name of an accelerator. The name can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens (-), and must not begin or end with a hyphen."
}

Optional Parameters
{
  "IpAddressType": "The value for the address type must be IPv4. ",
  "IpAddresses": "Optionally, if you've added your own IP address pool to Global Accelerator, you can choose IP addresses from your own pool to use for the accelerator's static IP addresses. You can specify one or two addresses, separated by a comma. Do not include the /32 suffix. If you specify only one IP address from your IP address range, Global Accelerator assigns a second static IP address for the accelerator from the AWS IP address pool. For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS Global Accelerator Developer Guide.",
  "Tags": "Create tags for an accelerator. For more information, see Tagging in AWS Global Accelerator in the AWS Global Accelerator Developer Guide.",
  "Enabled": "Indicates whether an accelerator is enabled. The value is true or false. The default value is true.  If the value is set to true, an accelerator cannot be deleted. If set to false, the accelerator can be deleted."
}
"""
CreateAccelerator(args) = global_accelerator("CreateAccelerator", args)

"""
    DescribeEndpointGroup()

Describe an endpoint group. To see an AWS CLI example of describing an endpoint group, scroll down to Example.

Required Parameters
{
  "EndpointGroupArn": "The Amazon Resource Name (ARN) of the endpoint group to describe."
}
"""
DescribeEndpointGroup(args) = global_accelerator("DescribeEndpointGroup", args)

"""
    ListListeners()

List the listeners for an accelerator. To see an AWS CLI example of listing the listeners for an accelerator, scroll down to Example.

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of the accelerator for which you want to list listener objects."
}

Optional Parameters
{
  "MaxResults": "The number of listener objects that you want to return with this call. The default value is 10.",
  "NextToken": "The token for the next set of results. You receive this token from a previous call."
}
"""
ListListeners(args) = global_accelerator("ListListeners", args)

"""
    UpdateEndpointGroup()

Update an endpoint group. To see an AWS CLI example of updating an endpoint group, scroll down to Example.

Required Parameters
{
  "EndpointGroupArn": "The Amazon Resource Name (ARN) of the endpoint group."
}

Optional Parameters
{
  "HealthCheckPort": "The port that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. The default port is the listener port that this endpoint group is associated with. If the listener port is a list of ports, Global Accelerator uses the first port in the list.",
  "ThresholdCount": "The number of consecutive health checks required to set the state of a healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.",
  "TrafficDialPercentage": "The percentage of traffic to send to an AWS Region. Additional traffic is distributed to other endpoint groups for this listener.  Use this action to increase (dial up) or decrease (dial down) traffic to a specific Region. The percentage is applied to the traffic that would otherwise have been routed to the Region based on optimal routing. The default value is 100.",
  "HealthCheckProtocol": "The protocol that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. The default value is TCP.",
  "HealthCheckPath": "If the protocol is HTTP/S, then this specifies the path that is the destination for health check targets. The default value is slash (/).",
  "EndpointConfigurations": "The list of endpoint objects.",
  "HealthCheckIntervalSeconds": "The time—10 seconds or 30 seconds—between each health check for an endpoint. The default value is 30."
}
"""
UpdateEndpointGroup(args) = global_accelerator("UpdateEndpointGroup", args)

"""
    WithdrawByoipCidr()

Stops advertising an address range that is provisioned as an address pool. You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time. To see an AWS CLI example of withdrawing an address range for BYOIP so it will no longer be advertised by AWS, scroll down to Example. It can take a few minutes before traffic to the specified addresses stops routing to AWS because of propagation delays. For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS Global Accelerator Developer Guide.

Required Parameters
{
  "Cidr": "The address range, in CIDR notation."
}
"""
WithdrawByoipCidr(args) = global_accelerator("WithdrawByoipCidr", args)

"""
    UpdateAcceleratorAttributes()

Update the attributes for an accelerator. To see an AWS CLI example of updating an accelerator to enable flow logs, scroll down to Example.

Required Parameters
{
  "AcceleratorArn": "The Amazon Resource Name (ARN) of the accelerator that you want to update."
}

Optional Parameters
{
  "FlowLogsEnabled": "Update whether flow logs are enabled. The default value is false. If the value is true, FlowLogsS3Bucket and FlowLogsS3Prefix must be specified. For more information, see Flow Logs in the AWS Global Accelerator Developer Guide.",
  "FlowLogsS3Bucket": "The name of the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true. The bucket must exist and have a bucket policy that grants AWS Global Accelerator permission to write to the bucket.",
  "FlowLogsS3Prefix": "Update the prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true.  If you don’t specify a prefix, the flow logs are stored in the root of the bucket. If you specify slash (/) for the S3 bucket prefix, the log file bucket folder structure will include a double slash (//), like the following: s3-bucket_name//AWSLogs/aws_account_id"
}
"""
UpdateAcceleratorAttributes(args) = global_accelerator("UpdateAcceleratorAttributes", args)
