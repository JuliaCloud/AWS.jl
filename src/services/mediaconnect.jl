# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mediaconnect
using AWS.Compat
using AWS.UUIDs
"""
    AddFlowOutputs()

Adds outputs to an existing flow. You can create up to 50 outputs per flow.

# Required Parameters
- `flowArn`: The flow that you want to add outputs to.
- `outputs`: A list of outputs that you want to add.

"""

add_flow_outputs(flowArn, outputs; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/outputs", Dict{String, Any}("outputs"=>outputs); aws_config=aws_config)
add_flow_outputs(flowArn, outputs, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/outputs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("outputs"=>outputs), args)); aws_config=aws_config)

"""
    AddFlowSources()

Adds Sources to flow

# Required Parameters
- `flowArn`: The flow that you want to mutate.
- `sources`: A list of sources that you want to add.

"""

add_flow_sources(flowArn, sources; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/source", Dict{String, Any}("sources"=>sources); aws_config=aws_config)
add_flow_sources(flowArn, sources, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/source", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("sources"=>sources), args)); aws_config=aws_config)

"""
    AddFlowVpcInterfaces()

Adds VPC interfaces to flow

# Required Parameters
- `flowArn`: The flow that you want to mutate.
- `vpcInterfaces`: A list of VPC interfaces that you want to add.

"""

add_flow_vpc_interfaces(flowArn, vpcInterfaces; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/vpcInterfaces", Dict{String, Any}("vpcInterfaces"=>vpcInterfaces); aws_config=aws_config)
add_flow_vpc_interfaces(flowArn, vpcInterfaces, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/vpcInterfaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("vpcInterfaces"=>vpcInterfaces), args)); aws_config=aws_config)

"""
    CreateFlow()

Creates a new flow. The request must include one source. The request optionally can include outputs (up to 50) and entitlements (up to 50).

# Required Parameters
- `name`: The name of the flow.

# Optional Parameters
- `availabilityZone`: The Availability Zone that you want to create the flow in. These options are limited to the Availability Zones within the current AWS Region.
- `entitlements`: The entitlements that you want to grant on a flow.
- `outputs`: The outputs that you want to add to this flow.
- `source`: 
- `sourceFailoverConfig`: 
- `sources`: 
- `vpcInterfaces`: The VPC interfaces you want on the flow.
"""

create_flow(name; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows", Dict{String, Any}("name"=>name); aws_config=aws_config)
create_flow(name, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("name"=>name), args)); aws_config=aws_config)

"""
    DeleteFlow()

Deletes a flow. Before you can delete a flow, you must stop the flow.

# Required Parameters
- `flowArn`: The ARN of the flow that you want to delete.

"""

delete_flow(flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)"; aws_config=aws_config)
delete_flow(flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)", args; aws_config=aws_config)

"""
    DescribeFlow()

Displays the details of a flow. The response includes the flow ARN, name, and Availability Zone, as well as details about the source, outputs, and entitlements.

# Required Parameters
- `flowArn`: The ARN of the flow that you want to describe.

"""

describe_flow(flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/flows/$(flowArn)"; aws_config=aws_config)
describe_flow(flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/flows/$(flowArn)", args; aws_config=aws_config)

"""
    GrantFlowEntitlements()

Grants entitlements to an existing flow.

# Required Parameters
- `entitlements`: The list of entitlements that you want to grant.
- `flowArn`: The flow that you want to grant entitlements on.

"""

grant_flow_entitlements(entitlements, flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/entitlements", Dict{String, Any}("entitlements"=>entitlements); aws_config=aws_config)
grant_flow_entitlements(entitlements, flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/$(flowArn)/entitlements", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("entitlements"=>entitlements), args)); aws_config=aws_config)

"""
    ListEntitlements()

Displays a list of all entitlements that have been granted to this account. This request returns 20 results per page.

# Optional Parameters
- `maxResults`: The maximum number of results to return per API request. For example, you submit a ListEntitlements request with MaxResults set at 5. Although 20 items match your request, the service returns no more than the first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch of results.) The service might return fewer results than the MaxResults value. If MaxResults is not included in the request, the service defaults to pagination with a maximum of 20 results per page.
- `nextToken`: The token that identifies which batch of results that you want to see. For example, you submit a ListEntitlements request with MaxResults set at 5. The service returns the first batch of results (up to 5) and a NextToken value. To see the next batch of results, you can submit the ListEntitlements request a second time and specify the NextToken value.
"""

list_entitlements(; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/entitlements"; aws_config=aws_config)
list_entitlements(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/entitlements", args; aws_config=aws_config)

"""
    ListFlows()

Displays a list of flows that are associated with this account. This request returns a paginated result.

# Optional Parameters
- `maxResults`: The maximum number of results to return per API request. For example, you submit a ListFlows request with MaxResults set at 5. Although 20 items match your request, the service returns no more than the first 5 items. (The service also returns a NextToken value that you can use to fetch the next batch of results.) The service might return fewer results than the MaxResults value. If MaxResults is not included in the request, the service defaults to pagination with a maximum of 10 results per page.
- `nextToken`: The token that identifies which batch of results that you want to see. For example, you submit a ListFlows request with MaxResults set at 5. The service returns the first batch of results (up to 5) and a NextToken value. To see the next batch of results, you can submit the ListFlows request a second time and specify the NextToken value.
"""

list_flows(; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/flows"; aws_config=aws_config)
list_flows(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/v1/flows", args; aws_config=aws_config)

"""
    ListTagsForResource()

List all tags on an AWS Elemental MediaConnect resource

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource for which to list the tags.

"""

list_tags_for_resource(resourceArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
list_tags_for_resource(resourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("GET", "/tags/$(resourceArn)", args; aws_config=aws_config)

"""
    RemoveFlowOutput()

Removes an output from an existing flow. This request can be made only on an output that does not have an entitlement associated with it. If the output has an entitlement, you must revoke the entitlement instead. When an entitlement is revoked from a flow, the service automatically removes the associated output.

# Required Parameters
- `flowArn`: The flow that you want to remove an output from.
- `outputArn`: The ARN of the output that you want to remove.

"""

remove_flow_output(flowArn, outputArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/outputs/$(outputArn)"; aws_config=aws_config)
remove_flow_output(flowArn, outputArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/outputs/$(outputArn)", args; aws_config=aws_config)

"""
    RemoveFlowSource()

Removes a source from an existing flow. This request can be made only if there is more than one source on the flow.

# Required Parameters
- `flowArn`: The flow that you want to remove a source from.
- `sourceArn`: The ARN of the source that you want to remove.

"""

remove_flow_source(flowArn, sourceArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/source/$(sourceArn)"; aws_config=aws_config)
remove_flow_source(flowArn, sourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/source/$(sourceArn)", args; aws_config=aws_config)

"""
    RemoveFlowVpcInterface()

Removes a VPC Interface from an existing flow. This request can be made only on a VPC interface that does not have a Source or Output associated with it. If the VPC interface is referenced by a Source or Output, you must first delete or update the Source or Output to no longer reference the VPC interface.

# Required Parameters
- `flowArn`: The flow that you want to remove a VPC interface from.
- `vpcInterfaceName`: The name of the VPC interface that you want to remove.

"""

remove_flow_vpc_interface(flowArn, vpcInterfaceName; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/vpcInterfaces/$(vpcInterfaceName)"; aws_config=aws_config)
remove_flow_vpc_interface(flowArn, vpcInterfaceName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/vpcInterfaces/$(vpcInterfaceName)", args; aws_config=aws_config)

"""
    RevokeFlowEntitlement()

Revokes an entitlement from a flow. Once an entitlement is revoked, the content becomes unavailable to the subscriber and the associated output is removed.

# Required Parameters
- `entitlementArn`: The ARN of the entitlement that you want to revoke.
- `flowArn`: The flow that you want to revoke an entitlement from.

"""

revoke_flow_entitlement(entitlementArn, flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)"; aws_config=aws_config)
revoke_flow_entitlement(entitlementArn, flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)", args; aws_config=aws_config)

"""
    StartFlow()

Starts a flow.

# Required Parameters
- `flowArn`: The ARN of the flow that you want to start.

"""

start_flow(flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/start/$(flowArn)"; aws_config=aws_config)
start_flow(flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/start/$(flowArn)", args; aws_config=aws_config)

"""
    StopFlow()

Stops a flow.

# Required Parameters
- `flowArn`: The ARN of the flow that you want to stop.

"""

stop_flow(flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/stop/$(flowArn)"; aws_config=aws_config)
stop_flow(flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/v1/flows/stop/$(flowArn)", args; aws_config=aws_config)

"""
    TagResource()

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are deleted as well.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource to which to add tags.
- `tags`: A map from tag keys to values. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.

"""

tag_resource(resourceArn, tags; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
tag_resource(resourceArn, tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), args)); aws_config=aws_config)

"""
    UntagResource()

Deletes specified tags from a resource.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) that identifies the AWS Elemental MediaConnect resource from which to delete tags.
- `tagKeys`: The keys of the tags to be removed.

"""

untag_resource(resourceArn, tagKeys; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    UpdateFlow()

Updates flow

# Required Parameters
- `flowArn`: The flow that you want to update.

# Optional Parameters
- `sourceFailoverConfig`: 
"""

update_flow(flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)"; aws_config=aws_config)
update_flow(flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)", args; aws_config=aws_config)

"""
    UpdateFlowEntitlement()

You can change an entitlement's description, subscribers, and encryption. If you change the subscribers, the service will remove the outputs that are are used by the subscribers that are removed.

# Required Parameters
- `entitlementArn`: The ARN of the entitlement that you want to update.
- `flowArn`: The flow that is associated with the entitlement that you want to update.

# Optional Parameters
- `description`: A description of the entitlement. This description appears only on the AWS Elemental MediaConnect console and will not be seen by the subscriber or end user.
- `encryption`: The type of encryption that will be used on the output associated with this entitlement.
- `entitlementStatus`: An indication of whether you want to enable the entitlement to allow access, or disable it to stop streaming content to the subscriber’s flow temporarily. If you don’t specify the entitlementStatus field in your request, MediaConnect leaves the value unchanged.
- `subscribers`: The AWS account IDs that you want to share your content with. The receiving accounts (subscribers) will be allowed to create their own flow using your content as the source.
"""

update_flow_entitlement(entitlementArn, flowArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)"; aws_config=aws_config)
update_flow_entitlement(entitlementArn, flowArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/entitlements/$(entitlementArn)", args; aws_config=aws_config)

"""
    UpdateFlowOutput()

Updates an existing flow output.

# Required Parameters
- `flowArn`: The flow that is associated with the output that you want to update.
- `outputArn`: The ARN of the output that you want to update.

# Optional Parameters
- `cidrAllowList`: The range of IP addresses that should be allowed to initiate output requests to this flow. These IP addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
- `description`: A description of the output. This description appears only on the AWS Elemental MediaConnect console and will not be seen by the end user.
- `destination`: The IP address where you want to send the output.
- `encryption`: The type of key used for the encryption. If no keyType is provided, the service will use the default setting (static-key).
- `maxLatency`: The maximum latency in milliseconds for Zixi-based streams.
- `port`: The port to use when content is distributed to this output.
- `protocol`: The protocol to use for the output.
- `remoteId`: The remote ID for the Zixi-pull stream.
- `smoothingLatency`: The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
- `streamId`: The stream ID that you want to use for this transport. This parameter applies only to Zixi-based streams.
- `vpcInterfaceAttachment`: The name of the VPC interface attachment to use for this output.
"""

update_flow_output(flowArn, outputArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/outputs/$(outputArn)"; aws_config=aws_config)
update_flow_output(flowArn, outputArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/outputs/$(outputArn)", args; aws_config=aws_config)

"""
    UpdateFlowSource()

Updates the source of a flow.

# Required Parameters
- `flowArn`: The flow that is associated with the source that you want to update.
- `sourceArn`: The ARN of the source that you want to update.

# Optional Parameters
- `decryption`: The type of encryption used on the content ingested from this source.
- `description`: A description for the source. This value is not used or seen outside of the current AWS Elemental MediaConnect account.
- `entitlementArn`: The ARN of the entitlement that allows you to subscribe to this flow. The entitlement is set by the flow originator, and the ARN is generated as part of the originator's flow.
- `ingestPort`: The port that the flow will be listening on for incoming content.
- `maxBitrate`: The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
- `maxLatency`: The maximum latency in milliseconds. This parameter applies only to RIST-based and Zixi-based streams.
- `protocol`: The protocol that is used by the source.
- `streamId`: The stream ID that you want to use for this transport. This parameter applies only to Zixi-based streams.
- `vpcInterfaceName`: The name of the VPC Interface to configure this Source with.
- `whitelistCidr`: The range of IP addresses that should be allowed to contribute content to your source. These IP addresses should be in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
"""

update_flow_source(flowArn, sourceArn; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/source/$(sourceArn)"; aws_config=aws_config)
update_flow_source(flowArn, sourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mediaconnect("PUT", "/v1/flows/$(flowArn)/source/$(sourceArn)", args; aws_config=aws_config)
