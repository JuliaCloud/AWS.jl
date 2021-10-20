# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: amp
using AWS.Compat
using AWS.UUIDs

"""
    create_alert_manager_definition(data, workspace_id)
    create_alert_manager_definition(data, workspace_id, params::Dict{String,<:Any})

Create an alert manager definition.

# Arguments
- `data`: The alert manager definition data.
- `workspace_id`: The ID of the workspace in which to create the alert manager definition.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function create_alert_manager_definition(
    data, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}("data" => data, "clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_alert_manager_definition(
    data,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("data" => data, "clientToken" => string(uuid4())),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_rule_groups_namespace(data, name, workspace_id)
    create_rule_groups_namespace(data, name, workspace_id, params::Dict{String,<:Any})

Create a rule group namespace.

# Arguments
- `data`: The namespace data that define the rule groups.
- `name`: The rule groups namespace name.
- `workspace_id`: The ID of the workspace in which to create the rule group namespace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
- `"tags"`: Optional, user-provided tags for this rule groups namespace.
"""
function create_rule_groups_namespace(
    data, name, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces",
        Dict{String,Any}("data" => data, "name" => name, "clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_rule_groups_namespace(
    data,
    name,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "data" => data, "name" => name, "clientToken" => string(uuid4())
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_workspace()
    create_workspace(params::Dict{String,<:Any})

Creates a new AMP workspace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: An optional user-assigned alias for this workspace. This alias is for user
  reference and does not need to be unique.
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
- `"tags"`: Optional, user-provided tags for this workspace.
"""
function create_workspace(; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "POST",
        "/workspaces",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workspace(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_alert_manager_definition(workspace_id)
    delete_alert_manager_definition(workspace_id, params::Dict{String,<:Any})

Deletes an alert manager definition.

# Arguments
- `workspace_id`: The ID of the workspace in which to delete the alert manager definition.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function delete_alert_manager_definition(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_alert_manager_definition(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_rule_groups_namespace(name, workspace_id)
    delete_rule_groups_namespace(name, workspace_id, params::Dict{String,<:Any})

Delete a rule groups namespace.

# Arguments
- `name`: The rule groups namespace name.
- `workspace_id`: The ID of the workspace to delete rule group definition.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function delete_rule_groups_namespace(
    name, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_rule_groups_namespace(
    name,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workspace(workspace_id)
    delete_workspace(workspace_id, params::Dict{String,<:Any})

Deletes an AMP workspace.

# Arguments
- `workspace_id`: The ID of the workspace to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function delete_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_alert_manager_definition(workspace_id)
    describe_alert_manager_definition(workspace_id, params::Dict{String,<:Any})

Describes an alert manager definition.

# Arguments
- `workspace_id`: The ID of the workspace to describe.

"""
function describe_alert_manager_definition(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/alertmanager/definition";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_alert_manager_definition(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_rule_groups_namespace(name, workspace_id)
    describe_rule_groups_namespace(name, workspace_id, params::Dict{String,<:Any})

Describe a rule groups namespace.

# Arguments
- `name`: The rule groups namespace.
- `workspace_id`: The ID of the workspace to describe.

"""
function describe_rule_groups_namespace(
    name, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_rule_groups_namespace(
    name,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_workspace(workspace_id)
    describe_workspace(workspace_id, params::Dict{String,<:Any})

Describes an existing AMP workspace.

# Arguments
- `workspace_id`: The ID of the workspace to describe.

"""
function describe_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
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
    return amp(
        "GET",
        "/workspaces/$(workspaceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_rule_groups_namespaces(workspace_id)
    list_rule_groups_namespaces(workspace_id, params::Dict{String,<:Any})

Lists rule groups namespaces.

# Arguments
- `workspace_id`: The ID of the workspace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum results to return in response (default=100, maximum=1000).
- `"name"`: Optional filter for rule groups namespace name. Only the rule groups namespace
  that begin with this value will be returned.
- `"nextToken"`: Pagination token to request the next page in a paginated list. This token
  is obtained from the output of the previous ListRuleGroupsNamespaces request.
"""
function list_rule_groups_namespaces(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_rule_groups_namespaces(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists the tags you have assigned to the resource.

# Arguments
- `resource_arn`: The ARN of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
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
    return amp(
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

Lists all AMP workspaces, including workspaces being created or deleted.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: Optional filter for workspace alias. Only the workspaces with aliases that
  begin with this value will be returned.
- `"maxResults"`: Maximum results to return in response (default=100, maximum=1000).
- `"nextToken"`: Pagination token to request the next page in a paginated list. This token
  is obtained from the output of the previous ListWorkspaces request.
"""
function list_workspaces(; aws_config::AbstractAWSConfig=global_aws_config())
    return amp("GET", "/workspaces"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
function list_workspaces(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET", "/workspaces", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    put_alert_manager_definition(data, workspace_id)
    put_alert_manager_definition(data, workspace_id, params::Dict{String,<:Any})

Update an alert manager definition.

# Arguments
- `data`: The alert manager definition data.
- `workspace_id`: The ID of the workspace in which to update the alert manager definition.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function put_alert_manager_definition(
    data, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "PUT",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}("data" => data, "clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_alert_manager_definition(
    data,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "PUT",
        "/workspaces/$(workspaceId)/alertmanager/definition",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("data" => data, "clientToken" => string(uuid4())),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_rule_groups_namespace(data, name, workspace_id)
    put_rule_groups_namespace(data, name, workspace_id, params::Dict{String,<:Any})

Update a rule groups namespace.

# Arguments
- `data`: The namespace data that define the rule groups.
- `name`: The rule groups namespace name.
- `workspace_id`: The ID of the workspace in which to update the rule group namespace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function put_rule_groups_namespace(
    data, name, workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "PUT",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)",
        Dict{String,Any}("data" => data, "clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_rule_groups_namespace(
    data,
    name,
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "PUT",
        "/workspaces/$(workspaceId)/rulegroupsnamespaces/$(name)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("data" => data, "clientToken" => string(uuid4())),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Creates tags for the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tags`:

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
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
    return amp(
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

Deletes tags from the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tag_keys`: One or more tag keys

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
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
    return amp(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workspace_alias(workspace_id)
    update_workspace_alias(workspace_id, params::Dict{String,<:Any})

Updates an AMP workspace alias.

# Arguments
- `workspace_id`: The ID of the workspace being updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: The new alias of the workspace.
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function update_workspace_alias(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alias",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workspace_alias(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alias",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
