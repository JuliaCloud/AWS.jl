# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: migration_hub
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "resource_name" => "ResourceName",
    "dry_run" => "DryRun",
    "application_ids" => "ApplicationIds",
    "next_token" => "NextToken",
    "update_date_time" => "UpdateDateTime",
    "max_results" => "MaxResults",
)

"""
    associate_created_artifact(created_artifact, migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates a created artifact of an AWS cloud resource, the target receiving the migration,
with the migration task performed by a migration tool. This API has the following traits:
Migration tools can call the AssociateCreatedArtifact operation to indicate which AWS
artifact is associated with a migration task.   The created artifact name must be provided
in ARN (Amazon Resource Name) format which will contain information about type and region;
for example: arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b.   Examples of the AWS
resource behind the created artifact are, AMI's, EC2 instance, or DMS endpoint, etc.

# Arguments
- `created_artifact`: An ARN of the AWS resource related to the migration (e.g., AMI, EC2
  instance, RDS instance, etc.)
- `migration_task_name`: Unique identifier that references the migration task. Do not store
  personal data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function associate_created_artifact(
    CreatedArtifact,
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "AssociateCreatedArtifact",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "CreatedArtifact" => CreatedArtifact,
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    associate_discovered_resource(discovered_resource, migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates a discovered resource ID from Application Discovery Service with a migration
task.

# Arguments
- `discovered_resource`: Object representing a Resource.
- `migration_task_name`: The identifier given to the MigrationTask. Do not store personal
  data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function associate_discovered_resource(
    DiscoveredResource,
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "AssociateDiscoveredResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "DiscoveredResource" => DiscoveredResource,
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_progress_update_stream(progress_update_stream_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a progress update stream which is an AWS resource used for access control as well
as a namespace for migration task names that is implicitly linked to your AWS account. It
must uniquely identify the migration tool as it is used for all updates made by the tool;
however, it does not need to be unique for each AWS account because it is scoped to the AWS
account.

# Arguments
- `progress_update_stream_name`: The name of the ProgressUpdateStream. Do not store
  personal data in this field.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function create_progress_update_stream(
    ProgressUpdateStreamName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "CreateProgressUpdateStream",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ProgressUpdateStreamName" => ProgressUpdateStreamName),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_progress_update_stream(progress_update_stream_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a progress update stream, including all of its tasks, which was previously created
as an AWS resource used for access control. This API has the following traits:   The only
parameter needed for DeleteProgressUpdateStream is the stream name (same as a
CreateProgressUpdateStream call).   The call will return, and a background process will
asynchronously delete the stream and all of its resources (tasks, associated resources,
resource attributes, created artifacts).   If the stream takes time to be deleted, it might
still show up on a ListProgressUpdateStreams call.    CreateProgressUpdateStream,
ImportMigrationTask, NotifyMigrationTaskState, and all Associate[*] APIs related to the
tasks belonging to the stream will throw \"InvalidInputException\" if the stream of the
same name is in the process of being deleted.   Once the stream and all of its resources
are deleted, CreateProgressUpdateStream for a stream of the same name will succeed, and
that stream will be an entirely new logical resource (without any resources associated with
the old stream).

# Arguments
- `progress_update_stream_name`: The name of the ProgressUpdateStream. Do not store
  personal data in this field.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function delete_progress_update_stream(
    ProgressUpdateStreamName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "DeleteProgressUpdateStream",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ProgressUpdateStreamName" => ProgressUpdateStreamName),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_application_state(application_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets the migration status of an application.

# Arguments
- `application_id`: The configurationId in Application Discovery Service that uniquely
  identifies the grouped application.

"""
function describe_application_state(
    ApplicationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "DescribeApplicationState",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ApplicationId" => ApplicationId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_migration_task(migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of all attributes associated with a specific migration task.

# Arguments
- `migration_task_name`: The identifier given to the MigrationTask. Do not store personal
  data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

"""
function describe_migration_task(
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "DescribeMigrationTask",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_created_artifact(created_artifact_name, migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates a created artifact of an AWS resource with a migration task performed by a
migration tool that was previously associated. This API has the following traits:   A
migration user can call the DisassociateCreatedArtifacts operation to disassociate a
created AWS Artifact from a migration task.   The created artifact name must be provided in
ARN (Amazon Resource Name) format which will contain information about type and region; for
example: arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b.   Examples of the AWS
resource behind the created artifact are, AMI's, EC2 instance, or RDS instance, etc.

# Arguments
- `created_artifact_name`: An ARN of the AWS resource related to the migration (e.g., AMI,
  EC2 instance, RDS instance, etc.)
- `migration_task_name`: Unique identifier that references the migration task to be
  disassociated with the artifact. Do not store personal data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function disassociate_created_artifact(
    CreatedArtifactName,
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "DisassociateCreatedArtifact",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "CreatedArtifactName" => CreatedArtifactName,
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_discovered_resource(configuration_id, migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociate an Application Discovery Service discovered resource from a migration task.

# Arguments
- `configuration_id`: ConfigurationId of the Application Discovery Service resource to be
  disassociated.
- `migration_task_name`: The identifier given to the MigrationTask. Do not store personal
  data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function disassociate_discovered_resource(
    ConfigurationId,
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "DisassociateDiscoveredResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ConfigurationId" => ConfigurationId,
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    import_migration_task(migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Registers a new migration task which represents a server, database, etc., being migrated to
AWS by a migration tool. This API is a prerequisite to calling the NotifyMigrationTaskState
API as the migration tool must first register the migration task with Migration Hub.

# Arguments
- `migration_task_name`: Unique identifier that references the migration task. Do not store
  personal data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream. &gt;

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function import_migration_task(
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ImportMigrationTask",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_application_states(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all the migration statuses for your applications. If you use the optional
ApplicationIds parameter, only the migration statuses for those applications will be
returned.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"application_ids"`: The configurationIds from the Application Discovery Service that
  uniquely identifies your applications.
- `"max_results"`: Maximum number of results to be returned per page.
- `"next_token"`: If a NextToken was returned by a previous call, there are more results
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
"""
function list_application_states(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ListApplicationStates",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_created_artifacts(migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the created artifacts attached to a given migration task in an update stream. This
API has the following traits:   Gets the list of the created artifacts while migration is
taking place.   Shows the artifacts created by the migration tool that was associated by
the AssociateCreatedArtifact API.    Lists created artifacts in a paginated interface.

# Arguments
- `migration_task_name`: Unique identifier that references the migration task. Do not store
  personal data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of results to be returned per page.
- `"next_token"`: If a NextToken was returned by a previous call, there are more results
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
"""
function list_created_artifacts(
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ListCreatedArtifacts",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_discovered_resources(migration_task_name, progress_update_stream; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists discovered resources associated with the given MigrationTask.

# Arguments
- `migration_task_name`: The name of the MigrationTask. Do not store personal data in this
  field.
- `progress_update_stream`: The name of the ProgressUpdateStream.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results returned per page.
- `"next_token"`: If a NextToken was returned by a previous call, there are more results
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
"""
function list_discovered_resources(
    MigrationTaskName,
    ProgressUpdateStream;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ListDiscoveredResources",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_migration_tasks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all, or filtered by resource name, migration tasks associated with the user account
making this call. This API has the following traits:   Can show a summary list of the most
recent migration tasks.   Can show a summary list of migration tasks associated with a
given discovered resource.   Lists migration tasks in a paginated interface.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Value to specify how many results are returned per page.
- `"next_token"`: If a NextToken was returned by a previous call, there are more results
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
- `"resource_name"`: Filter migration tasks by discovered resource name.
"""
function list_migration_tasks(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ListMigrationTasks", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_progress_update_streams(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists progress update streams associated with the user account making this call.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Filter to limit the maximum number of results to list per page.
- `"next_token"`: If a NextToken was returned by a previous call, there are more results
  available. To retrieve the next page of results, make the call again using the returned
  token in NextToken.
"""
function list_progress_update_streams(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "ListProgressUpdateStreams",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    notify_application_state(application_id, status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sets the migration state of an application. For a given application identified by the value
passed to ApplicationId, its status is set or updated by passing one of three values to
Status: NOT_STARTED | IN_PROGRESS | COMPLETED.

# Arguments
- `application_id`: The configurationId in Application Discovery Service that uniquely
  identifies the grouped application.
- `status`: Status of the application - Not Started, In-Progress, Complete.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
- `"update_date_time"`: The timestamp when the application state changed.
"""
function notify_application_state(
    ApplicationId, Status; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "NotifyApplicationState",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ApplicationId" => ApplicationId, "Status" => Status),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    notify_migration_task_state(migration_task_name, next_update_seconds, progress_update_stream, task, update_date_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Notifies Migration Hub of the current status, progress, or other detail regarding a
migration task. This API has the following traits:   Migration tools will call the
NotifyMigrationTaskState API to share the latest progress and status.    MigrationTaskName
is used for addressing updates to the correct target.    ProgressUpdateStream is used for
access control and to provide a namespace for each migration tool.

# Arguments
- `migration_task_name`: Unique identifier that references the migration task. Do not store
  personal data in this field.
- `next_update_seconds`: Number of seconds after the UpdateDateTime within which the
  Migration Hub can expect an update. If Migration Hub does not receive an update within the
  specified interval, then the migration task will be considered stale.
- `progress_update_stream`: The name of the ProgressUpdateStream.
- `task`: Information about the task's progress and status.
- `update_date_time`: The timestamp when the task was gathered.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function notify_migration_task_state(
    MigrationTaskName,
    NextUpdateSeconds,
    ProgressUpdateStream,
    Task,
    UpdateDateTime;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "NotifyMigrationTaskState",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "NextUpdateSeconds" => NextUpdateSeconds,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                    "Task" => Task,
                    "UpdateDateTime" => UpdateDateTime,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_resource_attributes(migration_task_name, progress_update_stream, resource_attribute_list; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides identifying details of the resource being migrated so that it can be associated in
the Application Discovery Service repository. This association occurs asynchronously after
PutResourceAttributes returns.    Keep in mind that subsequent calls to
PutResourceAttributes will override previously stored attributes. For example, if it is
first called with a MAC address, but later, it is desired to add an IP address, it will
then be required to call it with both the IP and MAC addresses to prevent overriding the
MAC address.   Note the instructions regarding the special use case of the
ResourceAttributeList  parameter when specifying any \"VM\" related value.     Because this
is an asynchronous call, it will always return 200, whether an association occurs or not.
To confirm if an association was found based on the provided details, call
ListDiscoveredResources.

# Arguments
- `migration_task_name`: Unique identifier that references the migration task. Do not store
  personal data in this field.
- `progress_update_stream`: The name of the ProgressUpdateStream.
- `resource_attribute_list`: Information about the resource that is being migrated. This
  data will be used to map the task to a resource in the Application Discovery Service
  repository.  Takes the object array of ResourceAttribute where the Type field is reserved
  for the following values: IPV4_ADDRESS | IPV6_ADDRESS | MAC_ADDRESS | FQDN | VM_MANAGER_ID
  | VM_MANAGED_OBJECT_REFERENCE | VM_NAME | VM_PATH | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER
  where the identifying value can be a string up to 256 characters.     If any \"VM\" related
  value is set for a ResourceAttribute object, it is required that VM_MANAGER_ID, as a
  minimum, is always set. If VM_MANAGER_ID is not set, then all \"VM\" fields will be
  discarded and \"VM\" fields will not be used for matching the migration task to a server in
  Application Discovery Service repository. See the Example section below for a use case of
  specifying \"VM\" related values.    If a server you are trying to match has multiple IP or
  MAC addresses, you should provide as many as you know in separate type/value pairs passed
  to the ResourceAttributeList parameter to maximize the chances of matching.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"dry_run"`: Optional boolean flag to indicate whether any effect should take place. Used
  to test if the caller has permission to make the call.
"""
function put_resource_attributes(
    MigrationTaskName,
    ProgressUpdateStream,
    ResourceAttributeList;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return migration_hub(
        "PutResourceAttributes",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MigrationTaskName" => MigrationTaskName,
                    "ProgressUpdateStream" => ProgressUpdateStream,
                    "ResourceAttributeList" => ResourceAttributeList,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
