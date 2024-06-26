# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: codeconnections
using AWS.Compat
using AWS.UUIDs

"""
    create_connection(connection_name)
    create_connection(connection_name, params::Dict{String,<:Any})

Creates a connection that can then be given to other Amazon Web Services services like
CodePipeline so that it can access third-party code repositories. The connection is in
pending status until the third-party connection handshake is completed from the console.

# Arguments
- `connection_name`: The name of the connection to be created.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"HostArn"`: The Amazon Resource Name (ARN) of the host associated with the connection to
  be created.
- `"ProviderType"`: The name of the external provider where your third-party code
  repository is configured.
- `"Tags"`: The key-value pair to use when tagging the resource.
"""
function create_connection(
    ConnectionName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "CreateConnection",
        Dict{String,Any}("ConnectionName" => ConnectionName);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_connection(
    ConnectionName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateConnection",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ConnectionName" => ConnectionName), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_host(name, provider_endpoint, provider_type)
    create_host(name, provider_endpoint, provider_type, params::Dict{String,<:Any})

Creates a resource that represents the infrastructure where a third-party provider is
installed. The host is used when you create connections to an installed third-party
provider type, such as GitHub Enterprise Server. You create one host for all connections to
that provider.  A host created through the CLI or the SDK is in `PENDING` status by
default. You can make its status `AVAILABLE` by setting up the host in the console.

# Arguments
- `name`: The name of the host to be created.
- `provider_endpoint`: The endpoint of the infrastructure to be represented by the host
  after it is created.
- `provider_type`: The name of the installed provider to be associated with your
  connection. The host resource represents the infrastructure where your provider type is
  installed. The valid provider type is GitHub Enterprise Server.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Tags"`: Tags for the host to be created.
- `"VpcConfiguration"`: The VPC configuration to be provisioned for the host. A VPC must be
  configured and the infrastructure to be represented by the host must already be connected
  to the VPC.
"""
function create_host(
    Name, ProviderEndpoint, ProviderType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "CreateHost",
        Dict{String,Any}(
            "Name" => Name,
            "ProviderEndpoint" => ProviderEndpoint,
            "ProviderType" => ProviderType,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_host(
    Name,
    ProviderEndpoint,
    ProviderType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateHost",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Name" => Name,
                    "ProviderEndpoint" => ProviderEndpoint,
                    "ProviderType" => ProviderType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_repository_link(connection_arn, owner_id, repository_name)
    create_repository_link(connection_arn, owner_id, repository_name, params::Dict{String,<:Any})

Creates a link to a specified external Git repository. A repository link allows Git sync to
monitor and sync changes to files in a specified Git repository.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of the connection to be associated with
  the repository link.
- `owner_id`: The owner ID for the repository associated with a specific sync
  configuration, such as the owner ID in GitHub.
- `repository_name`: The name of the repository to be associated with the repository link.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"EncryptionKeyArn"`: The Amazon Resource Name (ARN) encryption key for the repository to
  be associated with the repository link.
- `"Tags"`: The tags for the repository to be associated with the repository link.
"""
function create_repository_link(
    ConnectionArn,
    OwnerId,
    RepositoryName;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateRepositoryLink",
        Dict{String,Any}(
            "ConnectionArn" => ConnectionArn,
            "OwnerId" => OwnerId,
            "RepositoryName" => RepositoryName,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_repository_link(
    ConnectionArn,
    OwnerId,
    RepositoryName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateRepositoryLink",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ConnectionArn" => ConnectionArn,
                    "OwnerId" => OwnerId,
                    "RepositoryName" => RepositoryName,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_sync_configuration(branch, config_file, repository_link_id, resource_name, role_arn, sync_type)
    create_sync_configuration(branch, config_file, repository_link_id, resource_name, role_arn, sync_type, params::Dict{String,<:Any})

Creates a sync configuration which allows Amazon Web Services to sync content from a Git
repository to update a specified Amazon Web Services resource. Parameters for the sync
configuration are determined by the sync type.

# Arguments
- `branch`: The branch in the repository from which changes will be synced.
- `config_file`: The file name of the configuration file that manages syncing between the
  connection and the repository. This configuration file is stored in the repository.
- `repository_link_id`: The ID of the repository link created for the connection. A
  repository link allows Git sync to monitor and sync changes to files in a specified Git
  repository.
- `resource_name`: The name of the Amazon Web Services resource (for example, a
  CloudFormation stack in the case of CFN_STACK_SYNC) that will be synchronized from the
  linked repository.
- `role_arn`: The ARN of the IAM role that grants permission for Amazon Web Services to use
  Git sync to update a given Amazon Web Services resource on your behalf.
- `sync_type`: The type of sync configuration.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"PublishDeploymentStatus"`: Whether to enable or disable publishing of deployment status
  to source providers.
- `"TriggerResourceUpdateOn"`: When to trigger Git sync to begin the stack update.
"""
function create_sync_configuration(
    Branch,
    ConfigFile,
    RepositoryLinkId,
    ResourceName,
    RoleArn,
    SyncType;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateSyncConfiguration",
        Dict{String,Any}(
            "Branch" => Branch,
            "ConfigFile" => ConfigFile,
            "RepositoryLinkId" => RepositoryLinkId,
            "ResourceName" => ResourceName,
            "RoleArn" => RoleArn,
            "SyncType" => SyncType,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_sync_configuration(
    Branch,
    ConfigFile,
    RepositoryLinkId,
    ResourceName,
    RoleArn,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "CreateSyncConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Branch" => Branch,
                    "ConfigFile" => ConfigFile,
                    "RepositoryLinkId" => RepositoryLinkId,
                    "ResourceName" => ResourceName,
                    "RoleArn" => RoleArn,
                    "SyncType" => SyncType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_connection(connection_arn)
    delete_connection(connection_arn, params::Dict{String,<:Any})

The connection to be deleted.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of the connection to be deleted.  The
  ARN is never reused if the connection is deleted.

"""
function delete_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "DeleteConnection",
        Dict{String,Any}("ConnectionArn" => ConnectionArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_connection(
    ConnectionArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "DeleteConnection",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ConnectionArn" => ConnectionArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_host(host_arn)
    delete_host(host_arn, params::Dict{String,<:Any})

The host to be deleted. Before you delete a host, all connections associated to the host
must be deleted.  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or
VPC_CONFIG_DELETING state.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the host to be deleted.

"""
function delete_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "DeleteHost",
        Dict{String,Any}("HostArn" => HostArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_host(
    HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "DeleteHost",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("HostArn" => HostArn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_repository_link(repository_link_id)
    delete_repository_link(repository_link_id, params::Dict{String,<:Any})

Deletes the association between your connection and a specified external Git repository.

# Arguments
- `repository_link_id`: The ID of the repository link to be deleted.

"""
function delete_repository_link(
    RepositoryLinkId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "DeleteRepositoryLink",
        Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_repository_link(
    RepositoryLinkId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "DeleteRepositoryLink",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_sync_configuration(resource_name, sync_type)
    delete_sync_configuration(resource_name, sync_type, params::Dict{String,<:Any})

Deletes the sync configuration for a specified repository and connection.

# Arguments
- `resource_name`: The name of the Amazon Web Services resource associated with the sync
  configuration to be deleted.
- `sync_type`: The type of sync configuration to be deleted.

"""
function delete_sync_configuration(
    ResourceName, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "DeleteSyncConfiguration",
        Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_sync_configuration(
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "DeleteSyncConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_connection(connection_arn)
    get_connection(connection_arn, params::Dict{String,<:Any})

Returns the connection ARN and details such as status, owner, and provider type.

# Arguments
- `connection_arn`: The Amazon Resource Name (ARN) of a connection.

"""
function get_connection(ConnectionArn; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "GetConnection",
        Dict{String,Any}("ConnectionArn" => ConnectionArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_connection(
    ConnectionArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetConnection",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ConnectionArn" => ConnectionArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_host(host_arn)
    get_host(host_arn, params::Dict{String,<:Any})

Returns the host ARN and details such as status, provider type, endpoint, and, if
applicable, the VPC configuration.

# Arguments
- `host_arn`: The Amazon Resource Name (ARN) of the requested host.

"""
function get_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "GetHost",
        Dict{String,Any}("HostArn" => HostArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_host(
    HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetHost",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("HostArn" => HostArn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_repository_link(repository_link_id)
    get_repository_link(repository_link_id, params::Dict{String,<:Any})

Returns details about a repository link. A repository link allows Git sync to monitor and
sync changes from files in a specified Git repository.

# Arguments
- `repository_link_id`: The ID of the repository link to get.

"""
function get_repository_link(
    RepositoryLinkId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetRepositoryLink",
        Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_repository_link(
    RepositoryLinkId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetRepositoryLink",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_repository_sync_status(branch, repository_link_id, sync_type)
    get_repository_sync_status(branch, repository_link_id, sync_type, params::Dict{String,<:Any})

Returns details about the sync status for a repository. A repository sync uses Git sync to
push and pull changes from your remote repository.

# Arguments
- `branch`: The branch of the repository link for the requested repository sync status.
- `repository_link_id`: The repository link ID for the requested repository sync status.
- `sync_type`: The sync type of the requested sync status.

"""
function get_repository_sync_status(
    Branch, RepositoryLinkId, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetRepositorySyncStatus",
        Dict{String,Any}(
            "Branch" => Branch,
            "RepositoryLinkId" => RepositoryLinkId,
            "SyncType" => SyncType,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_repository_sync_status(
    Branch,
    RepositoryLinkId,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetRepositorySyncStatus",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Branch" => Branch,
                    "RepositoryLinkId" => RepositoryLinkId,
                    "SyncType" => SyncType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_resource_sync_status(resource_name, sync_type)
    get_resource_sync_status(resource_name, sync_type, params::Dict{String,<:Any})

Returns the status of the sync with the Git repository for a specific Amazon Web Services
resource.

# Arguments
- `resource_name`: The name of the Amazon Web Services resource for the sync status with
  the Git repository.
- `sync_type`: The sync type for the sync status with the Git repository.

"""
function get_resource_sync_status(
    ResourceName, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetResourceSyncStatus",
        Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_resource_sync_status(
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetResourceSyncStatus",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_sync_blocker_summary(resource_name, sync_type)
    get_sync_blocker_summary(resource_name, sync_type, params::Dict{String,<:Any})

Returns a list of the most recent sync blockers.

# Arguments
- `resource_name`: The name of the Amazon Web Services resource currently blocked from
  automatically being synced from a Git repository.
- `sync_type`: The sync type for the sync blocker summary.

"""
function get_sync_blocker_summary(
    ResourceName, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetSyncBlockerSummary",
        Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_sync_blocker_summary(
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetSyncBlockerSummary",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_sync_configuration(resource_name, sync_type)
    get_sync_configuration(resource_name, sync_type, params::Dict{String,<:Any})

Returns details about a sync configuration, including the sync type and resource name. A
sync configuration allows the configuration to sync (push and pull) changes from the remote
repository for a specified branch in a Git repository.

# Arguments
- `resource_name`: The name of the Amazon Web Services resource for the sync configuration
  for which you want to retrieve information.
- `sync_type`: The sync type for the sync configuration for which you want to retrieve
  information.

"""
function get_sync_configuration(
    ResourceName, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "GetSyncConfiguration",
        Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_sync_configuration(
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "GetSyncConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

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
function list_connections(; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "ListConnections"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_connections(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListConnections", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

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
function list_hosts(; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "ListHosts"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_hosts(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListHosts", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_repository_links()
    list_repository_links(params::Dict{String,<:Any})

Lists the repository links created for connections in your account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`:  A non-zero, non-negative integer used to limit the number of returned
  results.
- `"NextToken"`:  An enumeration token that, when provided in a request, returns the next
  batch of the results.
"""
function list_repository_links(; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "ListRepositoryLinks"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_repository_links(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListRepositoryLinks",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_repository_sync_definitions(repository_link_id, sync_type)
    list_repository_sync_definitions(repository_link_id, sync_type, params::Dict{String,<:Any})

Lists the repository sync definitions for repository links in your account.

# Arguments
- `repository_link_id`: The ID of the repository link for the sync definition for which you
  want to retrieve information.
- `sync_type`: The sync type of the repository link for the the sync definition for which
  you want to retrieve information.

"""
function list_repository_sync_definitions(
    RepositoryLinkId, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListRepositorySyncDefinitions",
        Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_repository_sync_definitions(
    RepositoryLinkId,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "ListRepositorySyncDefinitions",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "RepositoryLinkId" => RepositoryLinkId, "SyncType" => SyncType
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_sync_configurations(repository_link_id, sync_type)
    list_sync_configurations(repository_link_id, sync_type, params::Dict{String,<:Any})

Returns a list of sync configurations for a specified repository.

# Arguments
- `repository_link_id`: The ID of the repository link for the requested list of sync
  configurations.
- `sync_type`: The sync type for the requested list of sync configurations.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: A non-zero, non-negative integer used to limit the number of returned
  results.
- `"NextToken"`: An enumeration token that allows the operation to batch the results of the
  operation.
"""
function list_sync_configurations(
    RepositoryLinkId, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListSyncConfigurations",
        Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_sync_configurations(
    RepositoryLinkId,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "ListSyncConfigurations",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "RepositoryLinkId" => RepositoryLinkId, "SyncType" => SyncType
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Gets the set of key-value pairs (metadata) that are used to manage the resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource for which you want to get
  information about tags, if any.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "ListTagsForResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "ListTagsForResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

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
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "TagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceArn,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from an Amazon Web Services resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to remove tags from.
- `tag_keys`: The list of keys for the tags to be removed from the resource.

"""
function untag_resource(
    ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "UntagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceArn,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

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
function update_host(HostArn; aws_config::AbstractAWSConfig=global_aws_config())
    return codeconnections(
        "UpdateHost",
        Dict{String,Any}("HostArn" => HostArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_host(
    HostArn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "UpdateHost",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("HostArn" => HostArn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_repository_link(repository_link_id)
    update_repository_link(repository_link_id, params::Dict{String,<:Any})

Updates the association between your connection and a specified external Git repository. A
repository link allows Git sync to monitor and sync changes to files in a specified Git
repository.

# Arguments
- `repository_link_id`: The ID of the repository link to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ConnectionArn"`: The Amazon Resource Name (ARN) of the connection for the repository
  link to be updated. The updated connection ARN must have the same providerType (such as
  GitHub) as the original connection ARN for the repo link.
- `"EncryptionKeyArn"`: The Amazon Resource Name (ARN) of the encryption key for the
  repository link to be updated.
"""
function update_repository_link(
    RepositoryLinkId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "UpdateRepositoryLink",
        Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_repository_link(
    RepositoryLinkId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "UpdateRepositoryLink",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("RepositoryLinkId" => RepositoryLinkId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_sync_blocker(id, resolved_reason, resource_name, sync_type)
    update_sync_blocker(id, resolved_reason, resource_name, sync_type, params::Dict{String,<:Any})

Allows you to update the status of a sync blocker, resolving the blocker and allowing
syncing to continue.

# Arguments
- `id`: The ID of the sync blocker to be updated.
- `resolved_reason`: The reason for resolving the sync blocker.
- `resource_name`: The name of the resource for the sync blocker to be updated.
- `sync_type`: The sync type of the sync blocker to be updated.

"""
function update_sync_blocker(
    Id,
    ResolvedReason,
    ResourceName,
    SyncType;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "UpdateSyncBlocker",
        Dict{String,Any}(
            "Id" => Id,
            "ResolvedReason" => ResolvedReason,
            "ResourceName" => ResourceName,
            "SyncType" => SyncType,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_sync_blocker(
    Id,
    ResolvedReason,
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "UpdateSyncBlocker",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Id" => Id,
                    "ResolvedReason" => ResolvedReason,
                    "ResourceName" => ResourceName,
                    "SyncType" => SyncType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_sync_configuration(resource_name, sync_type)
    update_sync_configuration(resource_name, sync_type, params::Dict{String,<:Any})

Updates the sync configuration for your connection and a specified external Git repository.

# Arguments
- `resource_name`: The name of the Amazon Web Services resource for the sync configuration
  to be updated.
- `sync_type`: The sync type for the sync configuration to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Branch"`: The branch for the sync configuration to be updated.
- `"ConfigFile"`: The configuration file for the sync configuration to be updated.
- `"PublishDeploymentStatus"`: Whether to enable or disable publishing of deployment status
  to source providers.
- `"RepositoryLinkId"`: The ID of the repository link for the sync configuration to be
  updated.
- `"RoleArn"`: The ARN of the IAM role for the sync configuration to be updated.
- `"TriggerResourceUpdateOn"`: When to trigger Git sync to begin the stack update.
"""
function update_sync_configuration(
    ResourceName, SyncType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return codeconnections(
        "UpdateSyncConfiguration",
        Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_sync_configuration(
    ResourceName,
    SyncType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return codeconnections(
        "UpdateSyncConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceName" => ResourceName, "SyncType" => SyncType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
