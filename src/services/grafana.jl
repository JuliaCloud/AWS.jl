# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: grafana
using AWS.Compat
using AWS.UUIDs

"""
    associate_license(license_type, workspace_id)
    associate_license(license_type, workspace_id, params::Dict{String,<:Any})

Assigns a Grafana Enterprise license to a workspace. Upgrading to Grafana Enterprise incurs
additional fees. For more information, see Upgrade a workspace to Grafana Enterprise.

# Arguments
- `license_type`: The type of license to associate with the workspace.
- `workspace_id`: The ID of the workspace to associate the license with.

"""
function associate_license(
    licenseType, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/licenses/$(licenseType)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function associate_license(
    licenseType,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/licenses/$(licenseType)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_workspace(account_access_type, authentication_providers, permission_type)
    create_workspace(account_access_type, authentication_providers, permission_type, params::Dict{String,<:Any})

Creates a workspace. In a workspace, you can create Grafana dashboards and visualizations
to analyze your metrics, logs, and traces. You don't have to build, package, or deploy any
hardware to run the Grafana server. Don't use CreateWorkspace to modify an existing
workspace. Instead, use UpdateWorkspace.

# Arguments
- `account_access_type`: Specifies whether the workspace can access Amazon Web Services
  resources in this Amazon Web Services account only, or whether it can also access Amazon
  Web Services resources in other accounts in the same organization. If you specify
  ORGANIZATION, you must specify which organizational units the workspace can access in the
  workspaceOrganizationalUnits parameter.
- `authentication_providers`: Specifies whether this workspace uses SAML 2.0, Amazon Web
  Services Single Sign On, or both to authenticate users for using the Grafana console within
  a workspace. For more information, see User authentication in Amazon Managed Grafana.
- `permission_type`: If you specify SERVICE_MANAGED on AWS Grafana console, Amazon Managed
  Grafana automatically creates the IAM roles and provisions the permissions that the
  workspace needs to use Amazon Web Services data sources and notification channels. In CLI
  mode, the permissionType SERVICE_MANAGED will not create the IAM role for you. If you
  specify CUSTOMER_MANAGED, you will manage those roles and permissions yourself. If you are
  creating this workspace in a member account of an organization that is not a delegated
  administrator account, and you want the workspace to access data sources in other Amazon
  Web Services accounts in the organization, you must choose CUSTOMER_MANAGED. For more
  information, see Amazon Managed Grafana permissions and policies for Amazon Web Services
  data sources and notification channels.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
- `"organizationRoleName"`: The name of an IAM role that already exists to use with
  Organizations to access Amazon Web Services data sources and notification channels in other
  accounts in an organization.
- `"stackSetName"`: The name of the CloudFormation stack set to use to generate IAM roles
  to be used for this workspace.
- `"tags"`: The list of tags associated with the workspace.
- `"workspaceDataSources"`: Specify the Amazon Web Services data sources that you want to
  be queried in this workspace. Specifying these data sources here enables Amazon Managed
  Grafana to create IAM roles and permissions that allow Amazon Managed Grafana to read data
  from these sources. You must still add them as data sources in the Grafana console in the
  workspace. If you don't specify a data source here, you can still add it as a data source
  in the workspace console later. However, you will then have to manually configure
  permissions for it.
- `"workspaceDescription"`: A description for the workspace. This is used only to help you
  identify this workspace. Pattern: ^[p{L}p{Z}p{N}p{P}]{0,2048}
- `"workspaceName"`: The name for the workspace. It does not have to be unique.
- `"workspaceNotificationDestinations"`: Specify the Amazon Web Services notification
  channels that you plan to use in this workspace. Specifying these data sources here enables
  Amazon Managed Grafana to create IAM roles and permissions that allow Amazon Managed
  Grafana to use these channels.
- `"workspaceOrganizationalUnits"`: Specifies the organizational units that this workspace
  is allowed to use data sources from, if this workspace is in an account that is part of an
  organization.
- `"workspaceRoleArn"`: The workspace needs an IAM role that grants permissions to the
  Amazon Web Services resources that the workspace will view data from. If you already have a
  role that you want to use, specify it here. The permission type should be set to
  CUSTOMER_MANAGED.
"""
function create_workspace(
    accountAccessType,
    authenticationProviders,
    permissionType;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces",
        Dict{String,Any}(
            "accountAccessType" => accountAccessType,
            "authenticationProviders" => authenticationProviders,
            "permissionType" => permissionType,
            "clientToken" => string(uuid4()),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workspace(
    accountAccessType,
    authenticationProviders,
    permissionType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "accountAccessType" => accountAccessType,
                    "authenticationProviders" => authenticationProviders,
                    "permissionType" => permissionType,
                    "clientToken" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_workspace_api_key(key_name, key_role, seconds_to_live, workspace_id)
    create_workspace_api_key(key_name, key_role, seconds_to_live, workspace_id, params::Dict{String,<:Any})

Creates an API key for the workspace. This key can be used to authenticate requests sent to
the workspace's HTTP API. See
https://docs.aws.amazon.com/grafana/latest/userguide/Using-Grafana-APIs.html for available
APIs and example requests.

# Arguments
- `key_name`: Specifies the name of the key to create. Key names must be unique to the
  workspace.
- `key_role`: Specifies the permission level of the key. Valid Values: VIEWER | EDITOR |
  ADMIN
- `seconds_to_live`: Specifies the time in seconds until the key expires. Keys can be valid
  for up to 30 days.
- `workspace_id`: The ID of the workspace in which to create an API key.

"""
function create_workspace_api_key(
    keyName,
    keyRole,
    secondsToLive,
    workspaceId;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/apikeys",
        Dict{String,Any}(
            "keyName" => keyName, "keyRole" => keyRole, "secondsToLive" => secondsToLive
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workspace_api_key(
    keyName,
    keyRole,
    secondsToLive,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/apikeys",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "keyName" => keyName,
                    "keyRole" => keyRole,
                    "secondsToLive" => secondsToLive,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workspace(workspace_id)
    delete_workspace(workspace_id, params::Dict{String,<:Any})

Deletes an Amazon Managed Grafana workspace.

# Arguments
- `workspace_id`: The ID of the workspace to delete.

"""
function delete_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workspace_api_key(key_name, workspace_id)
    delete_workspace_api_key(key_name, workspace_id, params::Dict{String,<:Any})

Deletes an API key for a workspace.

# Arguments
- `key_name`: The name of the API key to delete.
- `workspace_id`: The ID of the workspace to delete.

"""
function delete_workspace_api_key(
    keyName, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)/apikeys/$(keyName)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workspace_api_key(
    keyName,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)/apikeys/$(keyName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_workspace(workspace_id)
    describe_workspace(workspace_id, params::Dict{String,<:Any})

Displays information about one Amazon Managed Grafana workspace.

# Arguments
- `workspace_id`: The ID of the workspace to display information about.

"""
function describe_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_workspace_authentication(workspace_id)
    describe_workspace_authentication(workspace_id, params::Dict{String,<:Any})

Displays information about the authentication methods used in one Amazon Managed Grafana
workspace.

# Arguments
- `workspace_id`: The ID of the workspace to return authentication information about.

"""
function describe_workspace_authentication(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)/authentication";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_workspace_authentication(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)/authentication",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_license(license_type, workspace_id)
    disassociate_license(license_type, workspace_id, params::Dict{String,<:Any})

Removes the Grafana Enterprise license from a workspace.

# Arguments
- `license_type`: The type of license to remove from the workspace.
- `workspace_id`: The ID of the workspace to remove the Grafana Enterprise license from.

"""
function disassociate_license(
    licenseType, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)/licenses/$(licenseType)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function disassociate_license(
    licenseType,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "DELETE",
        "/workspaces/$(workspaceId)/licenses/$(licenseType)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_permissions(workspace_id)
    list_permissions(workspace_id, params::Dict{String,<:Any})

Lists the users and groups who have the Grafana Admin and Editor roles in this workspace.
If you use this operation without specifying userId or groupId, the operation returns the
roles of all users and groups. If you specify a userId or a groupId, only the roles for
that user or group are returned. If you do this, you can specify only one userId or one
groupId.

# Arguments
- `workspace_id`: The ID of the workspace to list permissions for. This parameter is
  required.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"groupId"`: (Optional) Limits the results to only the group that matches this ID.
- `"maxResults"`: The maximum number of results to include in the response.
- `"nextToken"`: The token to use when requesting the next set of results. You received
  this token from a previous ListPermissions operation.
- `"userId"`: (Optional) Limits the results to only the user that matches this ID.
- `"userType"`: (Optional) If you specify SSO_USER, then only the permissions of Amazon Web
  Services SSO users are returned. If you specify SSO_GROUP, only the permissions of Amazon
  Web Services SSO groups are returned.
"""
function list_permissions(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)/permissions";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_permissions(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "GET",
        "/workspaces/$(workspaceId)/permissions",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

The ListTagsForResource operation returns the tags that are associated with the Amazon
Managed Service for Grafana resource specified by the resourceArn. Currently, the only
resource that can be tagged is a workspace.

# Arguments
- `resource_arn`: The ARN of the resource the list of tags are associated with.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "GET",
        "/tags/$(resourceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_workspaces()
    list_workspaces(params::Dict{String,<:Any})

Returns a list of Amazon Managed Grafana workspaces in the account, with some information
about each workspace. For more complete information about one workspace, use
DescribeWorkspace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of workspaces to include in the results.
- `"nextToken"`: The token for the next set of workspaces to return. (You receive this
  token from a previous ListWorkspaces operation.)
"""
function list_workspaces(; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "GET", "/workspaces"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_workspaces(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "GET", "/workspaces", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

The TagResource operation associates tags with an Amazon Managed Grafana resource.
Currently, the only resource that can be tagged is workspaces.  If you specify a new tag
key for the resource, this tag is appended to the list of tags associated with the
resource. If you specify a tag key that is already associated with the resource, the new
tag value that you specify replaces the previous value for that tag.

# Arguments
- `resource_arn`: The ARN of the resource the tag is associated with.
- `tags`: The list of tag keys and values to associate with the resource. You can associate
  tag keys only, tags (key and values) only or a combination of tag keys and tags.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

The UntagResource operation removes the association of the tag with the Amazon Managed
Grafana resource.

# Arguments
- `resource_arn`: The ARN of the resource the tag association is removed from.
- `tag_keys`: The key values of the tag to be removed from the resource.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_permissions(update_instruction_batch, workspace_id)
    update_permissions(update_instruction_batch, workspace_id, params::Dict{String,<:Any})

Updates which users in a workspace have the Grafana Admin or Editor roles.

# Arguments
- `update_instruction_batch`: An array of structures that contain the permission updates to
  make.
- `workspace_id`: The ID of the workspace to update.

"""
function update_permissions(
    updateInstructionBatch, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "PATCH",
        "/workspaces/$(workspaceId)/permissions",
        Dict{String,Any}("updateInstructionBatch" => updateInstructionBatch);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_permissions(
    updateInstructionBatch,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "PATCH",
        "/workspaces/$(workspaceId)/permissions",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("updateInstructionBatch" => updateInstructionBatch),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workspace(workspace_id)
    update_workspace(workspace_id, params::Dict{String,<:Any})

Modifies an existing Amazon Managed Grafana workspace. If you use this operation and omit
any optional parameters, the existing values of those parameters are not changed. To modify
the user authentication methods that the workspace uses, such as SAML or Amazon Web
Services SSO, use UpdateWorkspaceAuthentication. To modify which users in the workspace
have the Admin and Editor Grafana roles, use UpdatePermissions.

# Arguments
- `workspace_id`: The ID of the workspace to update.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"accountAccessType"`: Specifies whether the workspace can access Amazon Web Services
  resources in this Amazon Web Services account only, or whether it can also access Amazon
  Web Services resources in other accounts in the same organization. If you specify
  ORGANIZATION, you must specify which organizational units the workspace can access in the
  workspaceOrganizationalUnits parameter.
- `"organizationRoleName"`: The name of an IAM role that already exists to use to access
  resources through Organizations.
- `"permissionType"`: If you specify Service Managed, Amazon Managed Grafana automatically
  creates the IAM roles and provisions the permissions that the workspace needs to use Amazon
  Web Services data sources and notification channels. If you specify CUSTOMER_MANAGED, you
  will manage those roles and permissions yourself. If you are creating this workspace in a
  member account of an organization and that account is not a delegated administrator
  account, and you want the workspace to access data sources in other Amazon Web Services
  accounts in the organization, you must choose CUSTOMER_MANAGED. For more information, see
  Amazon Managed Grafana permissions and policies for Amazon Web Services data sources and
  notification channels
- `"stackSetName"`: The name of the CloudFormation stack set to use to generate IAM roles
  to be used for this workspace.
- `"workspaceDataSources"`: Specify the Amazon Web Services data sources that you want to
  be queried in this workspace. Specifying these data sources here enables Amazon Managed
  Grafana to create IAM roles and permissions that allow Amazon Managed Grafana to read data
  from these sources. You must still add them as data sources in the Grafana console in the
  workspace. If you don't specify a data source here, you can still add it as a data source
  later in the workspace console. However, you will then have to manually configure
  permissions for it.
- `"workspaceDescription"`: A description for the workspace. This is used only to help you
  identify this workspace.
- `"workspaceName"`: A new name for the workspace to update.
- `"workspaceNotificationDestinations"`: Specify the Amazon Web Services notification
  channels that you plan to use in this workspace. Specifying these data sources here enables
  Amazon Managed Grafana to create IAM roles and permissions that allow Amazon Managed
  Grafana to use these channels.
- `"workspaceOrganizationalUnits"`: Specifies the organizational units that this workspace
  is allowed to use data sources from, if this workspace is in an account that is part of an
  organization.
- `"workspaceRoleArn"`: The workspace needs an IAM role that grants permissions to the
  Amazon Web Services resources that the workspace will view data from. If you already have a
  role that you want to use, specify it here. If you omit this field and you specify some
  Amazon Web Services resources in workspaceDataSources or workspaceNotificationDestinations,
  a new IAM role with the necessary permissions is automatically created.
"""
function update_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return grafana(
        "PUT",
        "/workspaces/$(workspaceId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "PUT",
        "/workspaces/$(workspaceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workspace_authentication(authentication_providers, workspace_id)
    update_workspace_authentication(authentication_providers, workspace_id, params::Dict{String,<:Any})

Use this operation to define the identity provider (IdP) that this workspace authenticates
users from, using SAML. You can also map SAML assertion attributes to workspace user
information and define which groups in the assertion attribute are to have the Admin and
Editor roles in the workspace.

# Arguments
- `authentication_providers`: Specifies whether this workspace uses SAML 2.0, Amazon Web
  Services Single Sign On, or both to authenticate users for using the Grafana console within
  a workspace. For more information, see User authentication in Amazon Managed Grafana.
- `workspace_id`: The ID of the workspace to update the authentication for.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"samlConfiguration"`: If the workspace uses SAML, use this structure to map SAML
  assertion attributes to workspace user information and define which groups in the assertion
  attribute are to have the Admin and Editor roles in the workspace.
"""
function update_workspace_authentication(
    authenticationProviders, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/authentication",
        Dict{String,Any}("authenticationProviders" => authenticationProviders);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workspace_authentication(
    authenticationProviders,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return grafana(
        "POST",
        "/workspaces/$(workspaceId)/authentication",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("authenticationProviders" => authenticationProviders),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
