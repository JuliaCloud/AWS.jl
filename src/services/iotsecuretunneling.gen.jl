# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iotsecuretunneling
using AWS.Compat
using AWS.UUIDs

"""
    close_tunnel(tunnel_id)
    close_tunnel(tunnel_id, params::Dict{String,<:Any})

Closes a tunnel identified by the unique tunnel id. When a CloseTunnel request is received,
we close the WebSocket connections between the client and proxy server so no data can be
transmitted.

# Arguments
- `tunnel_id`: The ID of the tunnel to close.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"delete"`: When set to true, AWS IoT Secure Tunneling deletes the tunnel data
  immediately.
"""
function close_tunnel(tunnelId; aws_config::AbstractAWSConfig=global_aws_config())
    return iotsecuretunneling(
        "CloseTunnel", Dict{String,Any}("tunnelId" => tunnelId); aws_config=aws_config
    )
end
function close_tunnel(
    tunnelId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotsecuretunneling(
        "CloseTunnel",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("tunnelId" => tunnelId), params)
        );
        aws_config=aws_config,
    )
end

"""
    describe_tunnel(tunnel_id)
    describe_tunnel(tunnel_id, params::Dict{String,<:Any})

Gets information about a tunnel identified by the unique tunnel id.

# Arguments
- `tunnel_id`: The tunnel to describe.

"""
function describe_tunnel(tunnelId; aws_config::AbstractAWSConfig=global_aws_config())
    return iotsecuretunneling(
        "DescribeTunnel", Dict{String,Any}("tunnelId" => tunnelId); aws_config=aws_config
    )
end
function describe_tunnel(
    tunnelId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotsecuretunneling(
        "DescribeTunnel",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("tunnelId" => tunnelId), params)
        );
        aws_config=aws_config,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists the tags for the specified resource.

# Arguments
- `resource_arn`: The resource ARN.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotsecuretunneling(
        "ListTagsForResource",
        Dict{String,Any}("resourceArn" => resourceArn);
        aws_config=aws_config,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotsecuretunneling(
        "ListTagsForResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("resourceArn" => resourceArn), params)
        );
        aws_config=aws_config,
    )
end

"""
    list_tunnels()
    list_tunnels(params::Dict{String,<:Any})

List all tunnels for an AWS account. Tunnels are listed by creation time in descending
order, newer tunnels will be listed before older tunnels.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return at once.
- `"nextToken"`: A token to retrieve the next set of results.
- `"thingName"`: The name of the IoT thing associated with the destination device.
"""
function list_tunnels(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotsecuretunneling("ListTunnels"; aws_config=aws_config)
end
function list_tunnels(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotsecuretunneling("ListTunnels", params; aws_config=aws_config)
end

"""
    open_tunnel()
    open_tunnel(params::Dict{String,<:Any})

Creates a new tunnel, and returns two client access tokens for clients to use to connect to
the AWS IoT Secure Tunneling proxy server.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: A short text description of the tunnel.
- `"destinationConfig"`: The destination configuration for the OpenTunnel request.
- `"tags"`: A collection of tag metadata.
- `"timeoutConfig"`: Timeout configuration for a tunnel.
"""
function open_tunnel(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotsecuretunneling("OpenTunnel"; aws_config=aws_config)
end
function open_tunnel(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotsecuretunneling("OpenTunnel", params; aws_config=aws_config)
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

A resource tag.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tags`: The tags for the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return iotsecuretunneling(
        "TagResource",
        Dict{String,Any}("resourceArn" => resourceArn, "tags" => tags);
        aws_config=aws_config,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotsecuretunneling(
        "TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("resourceArn" => resourceArn, "tags" => tags),
                params,
            ),
        );
        aws_config=aws_config,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes a tag from a resource.

# Arguments
- `resource_arn`: The resource ARN.
- `tag_keys`: The keys of the tags to remove.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotsecuretunneling(
        "UntagResource",
        Dict{String,Any}("resourceArn" => resourceArn, "tagKeys" => tagKeys);
        aws_config=aws_config,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotsecuretunneling(
        "UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("resourceArn" => resourceArn, "tagKeys" => tagKeys),
                params,
            ),
        );
        aws_config=aws_config,
    )
end