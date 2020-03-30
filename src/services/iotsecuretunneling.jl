include("../AWSServices.jl")
using .AWSServices: iotsecuretunneling

"""
    ListTagsForResource()

Lists the tags for the specified resource.

Required Parameters
{
  "resourceArn": "The resource ARN."
}
"""
ListTagsForResource(args) = iotsecuretunneling("ListTagsForResource", args)

"""
    OpenTunnel()

Creates a new tunnel, and returns two client access tokens for clients to use to connect to the AWS IoT Secure Tunneling proxy server. .

Optional Parameters
{
  "destinationConfig": "The destination configuration for the OpenTunnel request.",
  "timeoutConfig": "Timeout configuration for a tunnel.",
  "tags": "A collection of tag metadata.",
  "description": "A short text description of the tunnel. "
}
"""
OpenTunnel() = iotsecuretunneling("OpenTunnel")
OpenTunnel(args) = iotsecuretunneling("OpenTunnel", args)

"""
    DescribeTunnel()

Gets information about a tunnel identified by the unique tunnel id.

Required Parameters
{
  "tunnelId": "The tunnel to describe."
}
"""
DescribeTunnel(args) = iotsecuretunneling("DescribeTunnel", args)

"""
    ListTunnels()

List all tunnels for an AWS account. Tunnels are listed by creation time in descending order, newer tunnels will be listed before older tunnels.

Optional Parameters
{
  "thingName": "The name of the IoT thing associated with the destination device.",
  "maxResults": "The maximum number of results to return at once.",
  "nextToken": "A token to retrieve the next set of results."
}
"""
ListTunnels() = iotsecuretunneling("ListTunnels")
ListTunnels(args) = iotsecuretunneling("ListTunnels", args)

"""
    CloseTunnel()

Closes a tunnel identified by the unique tunnel id. When a CloseTunnel request is received, we close the WebSocket connections between the client and proxy server so no data can be transmitted.

Required Parameters
{
  "tunnelId": "The ID of the tunnel to close."
}

Optional Parameters
{
  "delete": "When set to true, AWS IoT Secure Tunneling deletes the tunnel data immediately."
}
"""
CloseTunnel(args) = iotsecuretunneling("CloseTunnel", args)

"""
    TagResource()

A resource tag.

Required Parameters
{
  "resourceArn": "The ARN of the resource.",
  "tags": "The tags for the resource."
}
"""
TagResource(args) = iotsecuretunneling("TagResource", args)

"""
    UntagResource()

Removes a tag from a resource.

Required Parameters
{
  "resourceArn": "The resource ARN.",
  "tagKeys": "The keys of the tags to remove."
}
"""
UntagResource(args) = iotsecuretunneling("UntagResource", args)
