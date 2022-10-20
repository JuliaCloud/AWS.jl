# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: migrationhuborchestrator
using AWS.Compat
using AWS.UUIDs

"""
    create_workflow(application_configuration_id, input_parameters, name, template_id)
    create_workflow(application_configuration_id, input_parameters, name, template_id, params::Dict{String,<:Any})

Create a workflow to orchestrate your migrations.

# Arguments
- `application_configuration_id`: The configuration ID of the application configured in
  Application Discovery Service.
- `input_parameters`: The input parameters required to create a migration workflow.
- `name`: The name of the migration workflow.
- `template_id`: The ID of the template.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the migration workflow.
- `"stepTargets"`: The servers on which a step will be run.
- `"tags"`: The tags to add on a migration workflow.
"""
function create_workflow(
    applicationConfigurationId,
    inputParameters,
    name,
    templateId;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/",
        Dict{String,Any}(
            "applicationConfigurationId" => applicationConfigurationId,
            "inputParameters" => inputParameters,
            "name" => name,
            "templateId" => templateId,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workflow(
    applicationConfigurationId,
    inputParameters,
    name,
    templateId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "applicationConfigurationId" => applicationConfigurationId,
                    "inputParameters" => inputParameters,
                    "name" => name,
                    "templateId" => templateId,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_workflow_step(name, step_action_type, step_group_id, workflow_id)
    create_workflow_step(name, step_action_type, step_group_id, workflow_id, params::Dict{String,<:Any})

Create a step in the migration workflow.

# Arguments
- `name`: The name of the step.
- `step_action_type`: The action type of the step. You must run and update the status of a
  manual step for the workflow to continue after the completion of the step.
- `step_group_id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the step.
- `"next"`: The next step.
- `"outputs"`: The key value pairs added for the expected output.
- `"previous"`: The previous step.
- `"stepTarget"`: The servers on which a step will be run.
- `"workflowStepAutomationConfiguration"`: The custom script to run tests on source or
  target environments.
"""
function create_workflow_step(
    name,
    stepActionType,
    stepGroupId,
    workflowId;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstep",
        Dict{String,Any}(
            "name" => name,
            "stepActionType" => stepActionType,
            "stepGroupId" => stepGroupId,
            "workflowId" => workflowId,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workflow_step(
    name,
    stepActionType,
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstep",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "name" => name,
                    "stepActionType" => stepActionType,
                    "stepGroupId" => stepGroupId,
                    "workflowId" => workflowId,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_workflow_step_group(name, workflow_id)
    create_workflow_step_group(name, workflow_id, params::Dict{String,<:Any})

Create a step group in a migration workflow.

# Arguments
- `name`: The name of the step group.
- `workflow_id`: The ID of the migration workflow that will contain the step group.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the step group.
- `"next"`: The next step group.
- `"previous"`: The previous step group.
"""
function create_workflow_step_group(
    name, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstepgroups",
        Dict{String,Any}("name" => name, "workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workflow_step_group(
    name,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstepgroups",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("name" => name, "workflowId" => workflowId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workflow(id)
    delete_workflow(id, params::Dict{String,<:Any})

Delete a migration workflow. You must pause a running workflow in Migration Hub
Orchestrator console to delete it.

# Arguments
- `id`: The ID of the migration workflow you want to delete.

"""
function delete_workflow(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "DELETE",
        "/migrationworkflow/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workflow(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "DELETE",
        "/migrationworkflow/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workflow_step(id, step_group_id, workflow_id)
    delete_workflow_step(id, step_group_id, workflow_id, params::Dict{String,<:Any})

Delete a step in a migration workflow. Pause the workflow to delete a running step.

# Arguments
- `id`: The ID of the step you want to delete.
- `step_group_id`: The ID of the step group that contains the step you want to delete.
- `workflow_id`: The ID of the migration workflow.

"""
function delete_workflow_step(
    id, stepGroupId, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "DELETE",
        "/workflowstep/$(id)",
        Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workflow_step(
    id,
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "DELETE",
        "/workflowstep/$(id)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workflow_step_group(id, workflow_id)
    delete_workflow_step_group(id, workflow_id, params::Dict{String,<:Any})

Delete a step group in a migration workflow.

# Arguments
- `id`: The ID of the step group you want to delete.
- `workflow_id`: The ID of the migration workflow.

"""
function delete_workflow_step_group(
    id, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "DELETE",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}("workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workflow_step_group(
    id,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "DELETE",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("workflowId" => workflowId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_template(id)
    get_template(id, params::Dict{String,<:Any})

Get the template you want to use for creating a migration workflow.

# Arguments
- `id`: The ID of the template.

"""
function get_template(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflowtemplate/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_template(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflowtemplate/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_template_step(id, step_group_id, template_id)
    get_template_step(id, step_group_id, template_id, params::Dict{String,<:Any})

Get a specific step in a template.

# Arguments
- `id`: The ID of the step.
- `step_group_id`: The ID of the step group.
- `template_id`: The ID of the template.

"""
function get_template_step(
    id, stepGroupId, templateId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/templatestep/$(id)",
        Dict{String,Any}("stepGroupId" => stepGroupId, "templateId" => templateId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_template_step(
    id,
    stepGroupId,
    templateId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/templatestep/$(id)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "templateId" => templateId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_template_step_group(id, template_id)
    get_template_step_group(id, template_id, params::Dict{String,<:Any})

Get a step group in a template.

# Arguments
- `id`: The ID of the step group.
- `template_id`: The ID of the template.

"""
function get_template_step_group(
    id, templateId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/templates/$(templateId)/stepgroups/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_template_step_group(
    id,
    templateId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/templates/$(templateId)/stepgroups/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_workflow(id)
    get_workflow(id, params::Dict{String,<:Any})

Get migration workflow.

# Arguments
- `id`: The ID of the migration workflow.

"""
function get_workflow(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflow/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_workflow(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflow/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_workflow_step(id, step_group_id, workflow_id)
    get_workflow_step(id, step_group_id, workflow_id, params::Dict{String,<:Any})

Get a step in the migration workflow.

# Arguments
- `id`: The ID of the step.
- `step_group_id`: desThe ID of the step group.
- `workflow_id`: The ID of the migration workflow.

"""
function get_workflow_step(
    id, stepGroupId, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstep/$(id)",
        Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_workflow_step(
    id,
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstep/$(id)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_workflow_step_group(id, workflow_id)
    get_workflow_step_group(id, workflow_id, params::Dict{String,<:Any})

Get the step group of a migration workflow.

# Arguments
- `id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

"""
function get_workflow_step_group(
    id, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}("workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_workflow_step_group(
    id,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("workflowId" => workflowId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_plugins()
    list_plugins(params::Dict{String,<:Any})

List AWS Migration Hub Orchestrator plugins.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of plugins that can be returned.
- `"nextToken"`: The pagination token.
"""
function list_plugins(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "GET", "/plugins"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_plugins(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET", "/plugins", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

List the tags added to a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
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
    return migrationhuborchestrator(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_template_step_groups(template_id)
    list_template_step_groups(template_id, params::Dict{String,<:Any})

List the step groups in a template.

# Arguments
- `template_id`: The ID of the template.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results that can be returned.
- `"nextToken"`: The pagination token.
"""
function list_template_step_groups(
    templateId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/templatestepgroups/$(templateId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_template_step_groups(
    templateId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/templatestepgroups/$(templateId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_template_steps(step_group_id, template_id)
    list_template_steps(step_group_id, template_id, params::Dict{String,<:Any})

List the steps in a template.

# Arguments
- `step_group_id`: The ID of the step group.
- `template_id`: The ID of the template.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results that can be returned.
- `"nextToken"`: The pagination token.
"""
function list_template_steps(
    stepGroupId, templateId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/templatesteps",
        Dict{String,Any}("stepGroupId" => stepGroupId, "templateId" => templateId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_template_steps(
    stepGroupId,
    templateId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/templatesteps",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "templateId" => templateId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_templates()
    list_templates(params::Dict{String,<:Any})

List the templates available in Migration Hub Orchestrator to create a migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results that can be returned.
- `"name"`: The name of the template.
- `"nextToken"`: The pagination token.
"""
function list_templates(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflowtemplates";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_templates(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflowtemplates",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_workflow_step_groups(workflow_id)
    list_workflow_step_groups(workflow_id, params::Dict{String,<:Any})

List the step groups in a migration workflow.

# Arguments
- `workflow_id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results that can be returned.
- `"nextToken"`: The pagination token.
"""
function list_workflow_step_groups(
    workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstepgroups",
        Dict{String,Any}("workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_workflow_step_groups(
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/workflowstepgroups",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("workflowId" => workflowId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_workflow_steps(step_group_id, workflow_id)
    list_workflow_steps(step_group_id, workflow_id, params::Dict{String,<:Any})

List the steps in a workflow.

# Arguments
- `step_group_id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results that can be returned.
- `"nextToken"`: The pagination token.
"""
function list_workflow_steps(
    stepGroupId, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/workflow/$(workflowId)/workflowstepgroups/$(stepGroupId)/workflowsteps";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_workflow_steps(
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "GET",
        "/workflow/$(workflowId)/workflowstepgroups/$(stepGroupId)/workflowsteps",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_workflows()
    list_workflows(params::Dict{String,<:Any})

List the migration workflows.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"adsApplicationConfigurationName"`: The name of the application configured in
  Application Discovery Service.
- `"maxResults"`: The maximum number of results that can be returned.
- `"name"`: The name of the migration workflow.
- `"nextToken"`: The pagination token.
- `"status"`: The status of the migration workflow.
- `"templateId"`: The ID of the template.
"""
function list_workflows(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "GET", "/migrationworkflows"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_workflows(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "GET",
        "/migrationworkflows",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    retry_workflow_step(id, step_group_id, workflow_id)
    retry_workflow_step(id, step_group_id, workflow_id, params::Dict{String,<:Any})

Retry a failed step in a migration workflow.

# Arguments
- `id`: The ID of the step.
- `step_group_id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

"""
function retry_workflow_step(
    id, stepGroupId, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/retryworkflowstep/$(id)",
        Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function retry_workflow_step(
    id,
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/retryworkflowstep/$(id)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_workflow(id)
    start_workflow(id, params::Dict{String,<:Any})

Start a migration workflow.

# Arguments
- `id`: The ID of the migration workflow.

"""
function start_workflow(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)/start";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_workflow(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)/start",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_workflow(id)
    stop_workflow(id, params::Dict{String,<:Any})

Stop an ongoing migration workflow.

# Arguments
- `id`: The ID of the migration workflow.

"""
function stop_workflow(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)/stop";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function stop_workflow(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)/stop",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Tag a resource by specifying its Amazon Resource Name (ARN).

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource to which you want to add
  tags.
- `tags`: A collection of labels, in the form of key:value pairs, that apply to this
  resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
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
    return migrationhuborchestrator(
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

Deletes the tags for a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource from which you want to
  remove tags.
- `tag_keys`: One or more tag keys. Specify only the tag keys, not the tag values.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
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
    return migrationhuborchestrator(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workflow(id)
    update_workflow(id, params::Dict{String,<:Any})

Update a migration workflow.

# Arguments
- `id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the migration workflow.
- `"inputParameters"`: The input parameters required to update a migration workflow.
- `"name"`: The name of the migration workflow.
- `"stepTargets"`: The servers on which a step will be run.
"""
function update_workflow(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workflow(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/migrationworkflow/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workflow_step(id, step_group_id, workflow_id)
    update_workflow_step(id, step_group_id, workflow_id, params::Dict{String,<:Any})

Update a step in a migration workflow.

# Arguments
- `id`: The ID of the step.
- `step_group_id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the step.
- `"name"`: The name of the step.
- `"next"`: The next step.
- `"outputs"`: The outputs of a step.
- `"previous"`: The previous step.
- `"status"`: The status of the step.
- `"stepActionType"`: The action type of the step. You must run and update the status of a
  manual step for the workflow to continue after the completion of the step.
- `"stepTarget"`: The servers on which a step will be run.
- `"workflowStepAutomationConfiguration"`: The custom script to run tests on the source and
  target environments.
"""
function update_workflow_step(
    id, stepGroupId, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstep/$(id)",
        Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workflow_step(
    id,
    stepGroupId,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstep/$(id)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("stepGroupId" => stepGroupId, "workflowId" => workflowId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workflow_step_group(id, workflow_id)
    update_workflow_step_group(id, workflow_id, params::Dict{String,<:Any})

Update the step group in a migration workflow.

# Arguments
- `id`: The ID of the step group.
- `workflow_id`: The ID of the migration workflow.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the step group.
- `"name"`: The name of the step group.
- `"next"`: The next step group.
- `"previous"`: The previous step group.
"""
function update_workflow_step_group(
    id, workflowId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}("workflowId" => workflowId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workflow_step_group(
    id,
    workflowId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhuborchestrator(
        "POST",
        "/workflowstepgroup/$(id)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("workflowId" => workflowId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
