# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ssm_sap
using AWS.Compat
using AWS.UUIDs

"""
    delete_resource_permission(resource_arn)
    delete_resource_permission(resource_arn, params::Dict{String,<:Any})

Removes permissions associated with the target database.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ActionType"`: Delete or restore the permissions on the target database.
- `"SourceResourceArn"`: The Amazon Resource Name (ARN) of the source resource.
"""
function delete_resource_permission(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/delete-resource-permission",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_resource_permission(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/delete-resource-permission",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    deregister_application(application_id)
    deregister_application(application_id, params::Dict{String,<:Any})

Deregister an SAP application with AWS Systems Manager for SAP. This action does not
aﬀect the existing setup of your SAP workloads on Amazon EC2.

# Arguments
- `application_id`: The ID of the application.

"""
function deregister_application(
    ApplicationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/deregister-application",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function deregister_application(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/deregister-application",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_application()
    get_application(params::Dict{String,<:Any})

Gets an application registered with AWS Systems Manager for SAP. It also returns the
components of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AppRegistryArn"`: The Amazon Resource Name (ARN) of the application registry.
- `"ApplicationArn"`: The Amazon Resource Name (ARN) of the application.
- `"ApplicationId"`: The ID of the application.
"""
function get_application(; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST", "/get-application"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_application(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/get-application",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_component(application_id, component_id)
    get_component(application_id, component_id, params::Dict{String,<:Any})

Gets the component of an application registered with AWS Systems Manager for SAP.

# Arguments
- `application_id`: The ID of the application.
- `component_id`: The ID of the component.

"""
function get_component(
    ApplicationId, ComponentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/get-component",
        Dict{String,Any}("ApplicationId" => ApplicationId, "ComponentId" => ComponentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_component(
    ApplicationId,
    ComponentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/get-component",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ApplicationId" => ApplicationId, "ComponentId" => ComponentId
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_database()
    get_database(params::Dict{String,<:Any})

Gets the SAP HANA database of an application registered with AWS Systems Manager for SAP.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ApplicationId"`: The ID of the application.
- `"ComponentId"`: The ID of the component.
- `"DatabaseArn"`: The Amazon Resource Name (ARN) of the database.
- `"DatabaseId"`: The ID of the database.
"""
function get_database(; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST", "/get-database"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_database(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/get-database",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_operation(operation_id)
    get_operation(operation_id, params::Dict{String,<:Any})

Gets the details of an operation by specifying the operation ID.

# Arguments
- `operation_id`: The ID of the operation.

"""
function get_operation(OperationId; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST",
        "/get-operation",
        Dict{String,Any}("OperationId" => OperationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_operation(
    OperationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/get-operation",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("OperationId" => OperationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_resource_permission(resource_arn)
    get_resource_permission(resource_arn, params::Dict{String,<:Any})

Gets permissions associated with the target database.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ActionType"`:
"""
function get_resource_permission(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/get-resource-permission",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_resource_permission(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/get-resource-permission",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_applications()
    list_applications(params::Dict{String,<:Any})

Lists all the applications registered with AWS Systems Manager for SAP.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Filters"`: The filter of name, value, and operator.
- `"MaxResults"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"NextToken"`: The token for the next page of results.
"""
function list_applications(; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST", "/list-applications"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_applications(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/list-applications",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_components()
    list_components(params::Dict{String,<:Any})

Lists all the components registered with AWS Systems Manager for SAP.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ApplicationId"`: The ID of the application.
- `"MaxResults"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value. If you do not
  specify a value for MaxResults, the request returns 50 items per page by default.
- `"NextToken"`: The token for the next page of results.
"""
function list_components(; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST", "/list-components"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_components(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/list-components",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_databases()
    list_databases(params::Dict{String,<:Any})

Lists the SAP HANA databases of an application registered with AWS Systems Manager for SAP.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ApplicationId"`: The ID of the application.
- `"ComponentId"`: The ID of the component.
- `"MaxResults"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value. If you do not
  specify a value for MaxResults, the request returns 50 items per page by default.
- `"NextToken"`: The token for the next page of results.
"""
function list_databases(; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST", "/list-databases"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_databases(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/list-databases",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_operation_events(operation_id)
    list_operation_events(operation_id, params::Dict{String,<:Any})

Returns a list of operations events. Available parameters include OperationID, as well as
optional parameters MaxResults, NextToken, and Filters.

# Arguments
- `operation_id`: The ID of the operation.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Filters"`: Optionally specify filters to narrow the returned operation event items.
  Valid filter names include status, resourceID, and resourceType. The valid operator for all
  three filters is Equals.
- `"MaxResults"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value. If you do not
  specify a value for MaxResults, the request returns 50 items per page by default.
- `"NextToken"`: The token to use to retrieve the next page of results. This value is null
  when there are no more results to return.
"""
function list_operation_events(
    OperationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/list-operation-events",
        Dict{String,Any}("OperationId" => OperationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_operation_events(
    OperationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/list-operation-events",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("OperationId" => OperationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_operations(application_id)
    list_operations(application_id, params::Dict{String,<:Any})

Lists the operations performed by AWS Systems Manager for SAP.

# Arguments
- `application_id`: The ID of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Filters"`: The filters of an operation.
- `"MaxResults"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value. If you do not
  specify a value for MaxResults, the request returns 50 items per page by default.
- `"NextToken"`: The token for the next page of results.
"""
function list_operations(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST",
        "/list-operations",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_operations(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/list-operations",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists all tags on an SAP HANA application and/or database registered with AWS Systems
Manager for SAP.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
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
    return ssm_sap(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_resource_permission(action_type, resource_arn, source_resource_arn)
    put_resource_permission(action_type, resource_arn, source_resource_arn, params::Dict{String,<:Any})

Adds permissions to the target database.

# Arguments
- `action_type`:
- `resource_arn`:
- `source_resource_arn`:

"""
function put_resource_permission(
    ActionType,
    ResourceArn,
    SourceResourceArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/put-resource-permission",
        Dict{String,Any}(
            "ActionType" => ActionType,
            "ResourceArn" => ResourceArn,
            "SourceResourceArn" => SourceResourceArn,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_resource_permission(
    ActionType,
    ResourceArn,
    SourceResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/put-resource-permission",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ActionType" => ActionType,
                    "ResourceArn" => ResourceArn,
                    "SourceResourceArn" => SourceResourceArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    register_application(application_id, application_type, instances)
    register_application(application_id, application_type, instances, params::Dict{String,<:Any})

Register an SAP application with AWS Systems Manager for SAP. You must meet the following
requirements before registering.  The SAP application you want to register with AWS Systems
Manager for SAP is running on Amazon EC2. AWS Systems Manager Agent must be setup on an
Amazon EC2 instance along with the required IAM permissions. Amazon EC2 instance(s) must
have access to the secrets created in AWS Secrets Manager to manage SAP applications and
components.

# Arguments
- `application_id`: The ID of the application.
- `application_type`: The type of the application.
- `instances`: The Amazon EC2 instances on which your SAP application is running.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Credentials"`: The credentials of the SAP application.
- `"DatabaseArn"`: The Amazon Resource Name of the SAP HANA database.
- `"SapInstanceNumber"`: The SAP instance number of the application.
- `"Sid"`: The System ID of the application.
- `"Tags"`: The tags to be attached to the SAP application.
"""
function register_application(
    ApplicationId,
    ApplicationType,
    Instances;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/register-application",
        Dict{String,Any}(
            "ApplicationId" => ApplicationId,
            "ApplicationType" => ApplicationType,
            "Instances" => Instances,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function register_application(
    ApplicationId,
    ApplicationType,
    Instances,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/register-application",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ApplicationId" => ApplicationId,
                    "ApplicationType" => ApplicationType,
                    "Instances" => Instances,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_application(application_id)
    start_application(application_id, params::Dict{String,<:Any})

Request is an operation which starts an application. Parameter ApplicationId is required.

# Arguments
- `application_id`: The ID of the application.

"""
function start_application(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST",
        "/start-application",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_application(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/start-application",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_application_refresh(application_id)
    start_application_refresh(application_id, params::Dict{String,<:Any})

Refreshes a registered application.

# Arguments
- `application_id`: The ID of the application.

"""
function start_application_refresh(
    ApplicationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/start-application-refresh",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_application_refresh(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/start-application-refresh",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_application(application_id)
    stop_application(application_id, params::Dict{String,<:Any})

Request is an operation to stop an application. Parameter ApplicationId is required.
Parameters StopConnectedEntity and IncludeEc2InstanceShutdown are optional.

# Arguments
- `application_id`: The ID of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"IncludeEc2InstanceShutdown"`: Boolean. If included and if set to True, the
  StopApplication operation will shut down the associated Amazon EC2 instance in addition to
  the application.
- `"StopConnectedEntity"`: Specify the ConnectedEntityType. Accepted type is DBMS. If this
  parameter is included, the connected DBMS (Database Management System) will be stopped.
"""
function stop_application(ApplicationId; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
        "POST",
        "/stop-application",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function stop_application(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/stop-application",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Creates tag for a resource by specifying the ARN.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tags`: The tags on a resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return ssm_sap(
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
    return ssm_sap(
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

Delete the tags for a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tag_keys`: Adds/updates or removes credentials for applications registered with AWS
  Systems Manager for SAP.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
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
    return ssm_sap(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_application_settings(application_id)
    update_application_settings(application_id, params::Dict{String,<:Any})

Updates the settings of an application registered with AWS Systems Manager for SAP.

# Arguments
- `application_id`: The ID of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Backint"`: Installation of AWS Backint Agent for SAP HANA.
- `"CredentialsToAddOrUpdate"`: The credentials to be added or updated.
- `"CredentialsToRemove"`: The credentials to be removed.
- `"DatabaseArn"`: The Amazon Resource Name of the SAP HANA database that replaces the
  current SAP HANA connection with the SAP_ABAP application.
"""
function update_application_settings(
    ApplicationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ssm_sap(
        "POST",
        "/update-application-settings",
        Dict{String,Any}("ApplicationId" => ApplicationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_application_settings(
    ApplicationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ssm_sap(
        "POST",
        "/update-application-settings",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
