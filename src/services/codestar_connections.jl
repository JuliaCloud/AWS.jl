# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: codestar_connections
using AWS.Compat
using AWS.UUIDs

"""
    create_connection(connection_name)
    create_connection(connection_name, params::Dict{String,<:Any})

Creates a connection that can then be given to other AWS services like CodePipeline so that
it can access third-party code repositories. The connection is in pending status until the
third-party connection handshake is completed from the console.

# Arguments
- `connection_name`: The name of the connection to be created. The name must be unique in
  the calling AWS account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"HostArn"`: The Amazon Resource Name (ARN) of the host associated with the connection to
  be created.
- `"ProviderType"`: The name of the external provider where your third-party code
  repository is configured.
- `"Tags"`: The key-value pair to use when tagging the resource.
"""
create_connection(ConnectionName; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("CreateConnection", Dict{String, Any}("ConnectionName"=>ConnectionName); aws_config=aws_config)
create_connection(ConnectionName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("CreateConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionName"=>ConnectionName), params)); aws_config=aws_config)

"""
    create_host(name, provider_endpoint, provider_type)
    create_host(name, provider_endpoint, provider_type, params::Dict{String,<:Any})

Creates a resource that represents the infrastructure where a third-party provider is
installed. The host is used when you create connections to an installed third-party
provider type, such as GitHub Enterprise Server. You create one host for all connections to
that provider.  A host created through the CLI or the SDK is in `PENDING` status by
default. You can make its status `AVAILABLE` by setting up the host in the console.

# Arguments
- `name`: The name of the host to be created. The name must be unique in the calling AWS
  account.
- `provider_endpoint`: The endpoint of the infrastructure to be represented by the host
  after it is created.
- `provider_type`: The name of the installed provider to be associated with your
  connection. The host resource represents the infrastructure where your provider type is
  installed. The valid provider type is GitHub Enterprise Server.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Tags"`:
- `"VpcConfiguration"`: The VPC configuration to be provisioned for the host. A VPC must be
  configured and the infrastructure to be represented by the host must already be connected
  to the VPC.
"""
create_host(Name, ProviderEndpoint, ProviderType; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("CreateHost", Dict{String, Any}("Name"=>Name, "ProviderEndpoint"=>ProviderEndpoint, "ProviderType"=>ProviderType); aws_config=aws_config)
create_host(Name, ProviderEndpoint, ProviderType, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("CreateHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name, "ProviderEndpoint"=>ProviderEndpoint, "ProviderType"=>ProviderType), params)); aws_config=aws_config)

"""
    delete_connection(connection_arn)
    delete_connection(connection_arn, params::Dict{String,<:Any})

The connection to be deleted.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of the connection to be deleted.  The
  ARN is never reused if the connection is deleted.

"""
delete_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("DeleteConnection", Dict{String, Any}("ConnectionArn"=>ConnectionArn); aws_config=aws_config)
delete_connection(ConnectionArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("DeleteConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionArn"=>ConnectionArn), params)); aws_config=aws_config)

"""
    delete_host(host_arn)
    delete_host(host_arn, params::Dict{String,<:Any})

The host to be deleted. Before you delete a host, all connections associated to the host
must be deleted.  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or
VPC_CONFIG_DELETING state.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the host to be deleted.

"""
delete_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("DeleteHost", Dict{String, Any}("HostArn"=>HostArn); aws_config=aws_config)
delete_host(HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("DeleteHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config)

"""
    get_connection(connection_arn)
    get_connection(connection_arn, params::Dict{String,<:Any})

Returns the connection ARN and details such as status, owner, and provider type.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of a connection.

"""
get_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("GetConnection", Dict{String, Any}("ConnectionArn"=>ConnectionArn); aws_config=aws_config)
get_connection(ConnectionArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("GetConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionArn"=>ConnectionArn), params)); aws_config=aws_config)

"""
    get_host(host_arn)
    get_host(host_arn, params::Dict{String,<:Any})

Returns the host ARN and details such as status, provider type, endpoint, and, if
applicable, the VPC configuration.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the requested host.

"""
get_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("GetHost", Dict{String, Any}("HostArn"=>HostArn); aws_config=aws_config)
get_host(HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("GetHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config)

"""
    list_connections()
    list_connections(params::Dict{String,<:Any})

Lists the connections associated with your account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"HostArnFilter"`: Filters the list of connections to those associated with a specified
  host.
- `"MaxResults"`: The maximum number of results to return in a single call. To retrieve the
  remaining results, make another call with the returned nextToken value.
- `"NextToken"`: The token that was returned from the previous ListConnections call, which
  can be used to return the next set of connections in the list.
- `"ProviderTypeFilter"`: Filters the list of connections to those associated with a
  specified provider, such as Bitbucket.
"""
list_connections(; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListConnections"; aws_config=aws_config)
list_connections(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListConnections", params; aws_config=aws_config)

"""
    list_hosts()
    list_hosts(params::Dict{String,<:Any})

Lists the hosts associated with your account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return in a single call. To retrieve the
  remaining results, make another call with the returned nextToken value.
- `"NextToken"`: The token that was returned from the previous ListHosts call, which can be
  used to return the next set of hosts in the list.
"""
list_hosts(; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListHosts"; aws_config=aws_config)
list_hosts(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListHosts", params; aws_config=aws_config)

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Gets the set of key-value pairs (metadata) that are used to manage the resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource for which you want to get
  information about tags, if any.

"""
list_tags_for_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListTagsForResource", Dict{String, Any}("ResourceArn"=>ResourceArn); aws_config=aws_config)
list_tags_for_resource(ResourceArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn), params)); aws_config=aws_config)

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to
manage a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to which you want to add
  or update tags.
- `tags`: The tags you want to modify or add to the resource.

"""
tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("TagResource", Dict{String, Any}("ResourceArn"=>ResourceArn, "Tags"=>Tags); aws_config=aws_config)
tag_resource(ResourceArn, Tags, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "Tags"=>Tags), params)); aws_config=aws_config)

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from an AWS resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to remove tags from.
- `tag_keys`: The list of keys for the tags to be removed from the resource.

"""
untag_resource(ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("UntagResource", Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys); aws_config=aws_config)
untag_resource(ResourceArn, TagKeys, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys), params)); aws_config=aws_config)

"""
    update_host(host_arn)
    update_host(host_arn, params::Dict{String,<:Any})

Updates a specified host with the provided configurations.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the host to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ProviderEndpoint"`: The URL or endpoint of the host to be updated.
- `"VpcConfiguration"`: The VPC configuration of the host to be updated. A VPC must be
  configured and the infrastructure to be represented by the host must already be connected
  to the VPC.
"""
update_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("UpdateHost", Dict{String, Any}("HostArn"=>HostArn); aws_config=aws_config)
update_host(HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = codestar_connections("UpdateHost", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HostArn"=>HostArn), params)); aws_config=aws_config)
