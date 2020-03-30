include("../AWSServices.jl")
using .AWSServices: mediaconnect

"""
    ListTagsForResource()

List all tags on an AWS Elemental MediaConnect resource

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource for which to list the tags."
}
"""
ListTagsForResource(args) = mediaconnect("GET", "/tags/{resourceArn}", args)

"""
    DescribeFlow()

Displays the details of a flow. The response includes the flow ARN, name, and Availability Zone, as well as details about the source, outputs, and entitlements.

Required Parameters
{
  "FlowArn": "The ARN of the flow that you want to describe."
}
"""
DescribeFlow(args) = mediaconnect("GET", "/v1/flows/{flowArn}", args)

"""
    AddFlowOutputs()

Adds outputs to an existing flow. You can create up to 50 outputs per flow.

Required Parameters
{
  "FlowArn": "The flow that you want to add outputs to.",
  "Outputs": "A list of outputs that you want to add."
}
"""
AddFlowOutputs(args) = mediaconnect("POST", "/v1/flows/{flowArn}/outputs", args)

"""
    UpdateFlowOutput()

Updates an existing flow output.

Required Parameters
{
  "OutputArn": "The ARN of the output that you want to update.",
  "FlowArn": "The flow that is associated with the output that you want to update."
}

Optional Parameters
{
  "Encryption": "The type of key used for the encryption. If no keyType is provided, the service will use the default setting (static-key).",
  "Description": "A description of the output. This description appears only on the AWS Elemental MediaConnect console and will not be seen by the end user.",
  "MaxLatency": "The maximum latency in milliseconds for Zixi-based streams.",
  "RemoteId": "The remote ID for the Zixi-pull stream.",
  "CidrAllowList": "The range of IP addresses that should be allowed to initiate output requests to this flow. These IP addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.",
  "SmoothingLatency": "The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.",
  "StreamId": "The stream ID that you want to use for this transport. This parameter applies only to Zixi-based streams.",
  "Protocol": "The protocol to use for the output.",
  "Port": "The port to use when content is distributed to this output.",
  "Destination": "The IP address where you want to send the output."
}
"""
UpdateFlowOutput(args) = mediaconnect("PUT", "/v1/flows/{flowArn}/outputs/{outputArn}", args)

"""
    AddFlowSources()

Adds Sources to flow

Required Parameters
{
  "Sources": "A list of sources that you want to add.",
  "FlowArn": "The flow that you want to mutate."
}
"""
AddFlowSources(args) = mediaconnect("POST", "/v1/flows/{flowArn}/source", args)

"""
    UpdateFlowEntitlement()

You can change an entitlement's description, subscribers, and encryption. If you change the subscribers, the service will remove the outputs that are are used by the subscribers that are removed.

Required Parameters
{
  "EntitlementArn": "The ARN of the entitlement that you want to update.",
  "FlowArn": "The flow that is associated with the entitlement that you want to update."
}

Optional Parameters
{
  "Encryption": "The type of encryption that will be used on the output associated with this entitlement.",
  "Description": "A description of the entitlement. This description appears only on the AWS Elemental MediaConnect console and will not be seen by the subscriber or end user.",
  "Subscribers": "The AWS account IDs that you want to share your content with. The receiving accounts (subscribers) will be allowed to create their own flow using your content as the source."
}
"""
UpdateFlowEntitlement(args) = mediaconnect("PUT", "/v1/flows/{flowArn}/entitlements/{entitlementArn}", args)

"""
    ListFlows()

Displays a list of flows that are associated with this account. This request returns a paginated result.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return per API request. For example, you submit a ListFlows request with MaxResults set at 5. Although 20 items match your request, the service returns no more than the first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch of results.) The service might return fewer results than the MaxResults value. If MaxResults is not included in the request, the service defaults to pagination with a maximum of 10 results per page.",
  "NextToken": "The token that identifies which batch of results that you want to see. For example, you submit a ListFlows request with MaxResults set at 5. The service returns the first batch of results (up to 5) and a NextToken value. To see the next batch of results, you can submit the ListFlows request a second time and specify the NextToken value."
}
"""
ListFlows() = mediaconnect("GET", "/v1/flows")
ListFlows(args) = mediaconnect("GET", "/v1/flows", args)

"""
    TagResource()

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are deleted as well.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource to which to add tags.",
  "Tags": "A map from tag keys to values. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters."
}
"""
TagResource(args) = mediaconnect("POST", "/tags/{resourceArn}", args)

"""
    UntagResource()

Deletes specified tags from a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource from which to delete tags.",
  "TagKeys": "The keys of the tags to be removed."
}
"""
UntagResource(args) = mediaconnect("DELETE", "/tags/{resourceArn}", args)

"""
    UpdateFlow()

Updates flow

Required Parameters
{
  "FlowArn": "The flow that you want to update."
}

Optional Parameters
{
  "SourceFailoverConfig": ""
}
"""
UpdateFlow(args) = mediaconnect("PUT", "/v1/flows/{flowArn}", args)

"""
    StopFlow()

Stops a flow.

Required Parameters
{
  "FlowArn": "The ARN of the flow that you want to stop."
}
"""
StopFlow(args) = mediaconnect("POST", "/v1/flows/stop/{flowArn}", args)

"""
    UpdateFlowSource()

Updates the source of a flow.

Required Parameters
{
  "SourceArn": "The ARN of the source that you want to update.",
  "FlowArn": "The flow that is associated with the source that you want to update."
}

Optional Parameters
{
  "EntitlementArn": "The ARN of the entitlement that allows you to subscribe to this flow. The entitlement is set by the flow originator, and the ARN is generated as part of the originator's flow.",
  "Description": "A description for the source. This value is not used or seen outside of the current AWS Elemental MediaConnect account.",
  "MaxLatency": "The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based streams.",
  "MaxBitrate": "The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.",
  "WhitelistCidr": "The range of IP addresses that should be allowed to contribute content to your source. These IP addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.",
  "Decryption": "The type of encryption used on the content ingested from this source.",
  "IngestPort": "The port that the flow will be listening on for incoming content.",
  "Protocol": "The protocol that is used by the source.",
  "StreamId": "The stream ID that you want to use for this transport. This parameter applies only to Zixi-based streams."
}
"""
UpdateFlowSource(args) = mediaconnect("PUT", "/v1/flows/{flowArn}/source/{sourceArn}", args)

"""
    DeleteFlow()

Deletes a flow. Before you can delete a flow, you must stop the flow.

Required Parameters
{
  "FlowArn": "The ARN of the flow that you want to delete."
}
"""
DeleteFlow(args) = mediaconnect("DELETE", "/v1/flows/{flowArn}", args)

"""
    StartFlow()

Starts a flow.

Required Parameters
{
  "FlowArn": "The ARN of the flow that you want to start."
}
"""
StartFlow(args) = mediaconnect("POST", "/v1/flows/start/{flowArn}", args)

"""
    RevokeFlowEntitlement()

Revokes an entitlement from a flow. Once an entitlement is revoked, the content becomes unavailable to the subscriber and the associated output is removed.

Required Parameters
{
  "EntitlementArn": "The ARN of the entitlement that you want to revoke.",
  "FlowArn": "The flow that you want to revoke an entitlement from."
}
"""
RevokeFlowEntitlement(args) = mediaconnect("DELETE", "/v1/flows/{flowArn}/entitlements/{entitlementArn}", args)

"""
    RemoveFlowSource()

Removes a source from an existing flow. This request can be made only if there is more than one source on the flow.

Required Parameters
{
  "SourceArn": "The ARN of the source that you want to remove.",
  "FlowArn": "The flow that you want to remove a source from."
}
"""
RemoveFlowSource(args) = mediaconnect("DELETE", "/v1/flows/{flowArn}/source/{sourceArn}", args)

"""
    ListEntitlements()

Displays a list of all entitlements that have been granted to this account. This request returns 20 results per page.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return per API request. For example, you submit a ListEntitlements request with MaxResults set at 5. Although 20 items match your request, the service returns no more than the first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch of results.) The service might return fewer results than the MaxResults value. If MaxResults is not included in the request, the service defaults to pagination with a maximum of 20 results per page.",
  "NextToken": "The token that identifies which batch of results that you want to see. For example, you submit a ListEntitlements request with MaxResults set at 5. The service returns the first batch of results (up to 5) and a NextToken value. To see the next batch of results, you can submit the ListEntitlements request a second time and specify the NextToken value."
}
"""
ListEntitlements() = mediaconnect("GET", "/v1/entitlements")
ListEntitlements(args) = mediaconnect("GET", "/v1/entitlements", args)

"""
    CreateFlow()

Creates a new flow. The request must include one source. The request optionally can include outputs (up to 50) and entitlements (up to 50).

Required Parameters
{
  "Name": "The name of the flow."
}

Optional Parameters
{
  "Source": "",
  "SourceFailoverConfig": "",
  "AvailabilityZone": "The Availability Zone that you want to create the flow in. These options are limited to the Availability Zones within the current AWS Region.",
  "Sources": "",
  "Entitlements": "The entitlements that you want to grant on a flow.",
  "Outputs": "The outputs that you want to add to this flow."
}
"""
CreateFlow(args) = mediaconnect("POST", "/v1/flows", args)

"""
    RemoveFlowOutput()

Removes an output from an existing flow. This request can be made only on an output that does not have an entitlement associated with it. If the output has an entitlement, you must revoke the entitlement instead. When an entitlement is revoked from a flow, the service automatically removes the associated output.

Required Parameters
{
  "OutputArn": "The ARN of the output that you want to remove.",
  "FlowArn": "The flow that you want to remove an output from."
}
"""
RemoveFlowOutput(args) = mediaconnect("DELETE", "/v1/flows/{flowArn}/outputs/{outputArn}", args)

"""
    GrantFlowEntitlements()

Grants entitlements to an existing flow.

Required Parameters
{
  "FlowArn": "The flow that you want to grant entitlements on.",
  "Entitlements": "The list of entitlements that you want to grant."
}
"""
GrantFlowEntitlements(args) = mediaconnect("POST", "/v1/flows/{flowArn}/entitlements", args)