# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: drs
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "default_large_staging_disk_type" => "defaultLargeStagingDiskType",
    "ebs_encryption_key_arn" => "ebsEncryptionKeyArn",
    "data_plane_routing" => "dataPlaneRouting",
    "staging_area_tags" => "stagingAreaTags",
    "next_token" => "nextToken",
    "licensing" => "licensing",
    "name" => "name",
    "pit_policy" => "pitPolicy",
    "staging_area_subnet_id" => "stagingAreaSubnetId",
    "launch_disposition" => "launchDisposition",
    "bandwidth_throttling" => "bandwidthThrottling",
    "associate_default_security_group" => "associateDefaultSecurityGroup",
    "ebs_encryption" => "ebsEncryption",
    "copy_tags" => "copyTags",
    "max_results" => "maxResults",
    "replication_servers_security_groups_ids" => "replicationServersSecurityGroupsIDs",
    "arn" => "arn",
    "replication_server_instance_type" => "replicationServerInstanceType",
    "copy_private_ip" => "copyPrivateIp",
    "replicated_disks" => "replicatedDisks",
    "filters" => "filters",
    "is_drill" => "isDrill",
    "use_private_ip" => "usePrivateIP",
    "use_dedicated_replication_server" => "useDedicatedReplicationServer",
    "order" => "order",
    "target_instance_type_right_sizing_method" => "targetInstanceTypeRightSizingMethod",
    "create_public_ip" => "createPublicIP",
    "tags" => "tags",
)

"""
    create_replication_configuration_template(associate_default_security_group, bandwidth_throttling, create_public_ip, data_plane_routing, default_large_staging_disk_type, ebs_encryption, pit_policy, replication_server_instance_type, replication_servers_security_groups_ids, staging_area_subnet_id, staging_area_tags, use_dedicated_replication_server; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new ReplicationConfigurationTemplate.

# Arguments
- `associate_default_security_group`: Whether to associate the default Elastic Disaster
  Recovery Security group with the Replication Configuration Template.
- `bandwidth_throttling`: Configure bandwidth throttling for the outbound data transfer
  rate of the Source Server in Mbps.
- `create_public_ip`: Whether to create a Public IP for the Recovery Instance by default.
- `data_plane_routing`: The data plane routing mechanism that will be used for replication.
- `default_large_staging_disk_type`: The Staging Disk EBS volume type to be used during
  replication.
- `ebs_encryption`: The type of EBS encryption to be used during replication.
- `pit_policy`: The Point in time (PIT) policy to manage snapshots taken during replication.
- `replication_server_instance_type`: The instance type to be used for the replication
  server.
- `replication_servers_security_groups_ids`: The security group IDs that will be used by
  the replication server.
- `staging_area_subnet_id`: The subnet to be used by the replication staging area.
- `staging_area_tags`: A set of tags to be associated with all resources created in the
  replication staging area: EC2 replication server, EBS volumes, EBS snapshots, etc.
- `use_dedicated_replication_server`: Whether to use a dedicated Replication Server in the
  replication staging area.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"ebs_encryption_key_arn"`: The ARN of the EBS encryption key to be used during
  replication.
- `"tags"`: A set of tags to be associated with the Replication Configuration Template
  resource.
"""
function create_replication_configuration_template(
    associateDefaultSecurityGroup,
    bandwidthThrottling,
    createPublicIP,
    dataPlaneRouting,
    defaultLargeStagingDiskType,
    ebsEncryption,
    pitPolicy,
    replicationServerInstanceType,
    replicationServersSecurityGroupsIDs,
    stagingAreaSubnetId,
    stagingAreaTags,
    useDedicatedReplicationServer;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/CreateReplicationConfigurationTemplate",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "associateDefaultSecurityGroup" => associateDefaultSecurityGroup,
                    "bandwidthThrottling" => bandwidthThrottling,
                    "createPublicIP" => createPublicIP,
                    "dataPlaneRouting" => dataPlaneRouting,
                    "defaultLargeStagingDiskType" => defaultLargeStagingDiskType,
                    "ebsEncryption" => ebsEncryption,
                    "pitPolicy" => pitPolicy,
                    "replicationServerInstanceType" => replicationServerInstanceType,
                    "replicationServersSecurityGroupsIDs" =>
                        replicationServersSecurityGroupsIDs,
                    "stagingAreaSubnetId" => stagingAreaSubnetId,
                    "stagingAreaTags" => stagingAreaTags,
                    "useDedicatedReplicationServer" => useDedicatedReplicationServer,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a single Job by ID.

# Arguments
- `job_id`: The ID of the Job to be deleted.

"""
function delete_job(jobID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DeleteJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("jobID" => jobID), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_recovery_instance(recovery_instance_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a single Recovery Instance by ID. This deletes the Recovery Instance resource from
Elastic Disaster Recovery. The Recovery Instance must be disconnected first in order to
delete it.

# Arguments
- `recovery_instance_id`: RThe ID of the Recovery Instance to be deleted.

"""
function delete_recovery_instance(
    recoveryInstanceID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DeleteRecoveryInstance",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recoveryInstanceID" => recoveryInstanceID), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_replication_configuration_template(replication_configuration_template_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a single Replication Configuration Template by ID

# Arguments
- `replication_configuration_template_id`: The ID of the Replication Configuration Template
  to be deleted.

"""
function delete_replication_configuration_template(
    replicationConfigurationTemplateID;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DeleteReplicationConfigurationTemplate",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "replicationConfigurationTemplateID" =>
                        replicationConfigurationTemplateID,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_source_server(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a single Source Server by ID. The Source Server must be disconnected first.

# Arguments
- `source_server_id`: The ID of the Source Server to be deleted.

"""
function delete_source_server(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DeleteSourceServer",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_job_log_items(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a detailed Job log with pagination.

# Arguments
- `job_id`: The ID of the Job for which Job log items will be retrieved.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of Job log items to retrieve.
- `"next_token"`: The token of the next Job log items to retrieve.
"""
function describe_job_log_items(
    jobID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeJobLogItems",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("jobID" => jobID), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_jobs(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of Jobs. Use the JobsID and fromDate and toDate filters to limit which jobs
are returned. The response is sorted by creationDataTime - latest date first. Jobs are
created by the StartRecovery, TerminateRecoveryInstances and StartFailbackLaunch APIs. Jobs
are also created by DiagnosticLaunch and TerminateDiagnosticInstances, which are APIs
available only to *Support* and only used in response to relevant support tickets.

# Arguments
- `filters`: A set of filters by which to return Jobs.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of Jobs to retrieve.
- `"next_token"`: The token of the next Job to retrieve.
"""
function describe_jobs(
    filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeJobs",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("filters" => filters), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_recovery_instances(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all Recovery Instances or multiple Recovery Instances by ID.

# Arguments
- `filters`: A set of filters by which to return Recovery Instances.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of Recovery Instances to retrieve.
- `"next_token"`: The token of the next Recovery Instance to retrieve.
"""
function describe_recovery_instances(
    filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeRecoveryInstances",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("filters" => filters), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_recovery_snapshots(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all Recovery Snapshots for a single Source Server.

# Arguments
- `source_server_id`: Filter Recovery Snapshots by Source Server ID.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: A set of filters by which to return Recovery Snapshots.
- `"max_results"`: Maximum number of Recovery Snapshots to retrieve.
- `"next_token"`: The token of the next Recovery Snapshot to retrieve.
- `"order"`: The sorted ordering by which to return Recovery Snapshots.
"""
function describe_recovery_snapshots(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeRecoverySnapshots",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_replication_configuration_templates(replication_configuration_template_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all ReplicationConfigurationTemplates, filtered by Source Server IDs.

# Arguments
- `replication_configuration_template_ids`: The IDs of the Replication Configuration
  Templates to retrieve. An empty list means all Replication Configuration Templates.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of Replication Configuration Templates to retrieve.
- `"next_token"`: The token of the next Replication Configuration Template to retrieve.
"""
function describe_replication_configuration_templates(
    replicationConfigurationTemplateIDs;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeReplicationConfigurationTemplates",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "replicationConfigurationTemplateIDs" =>
                        replicationConfigurationTemplateIDs,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_source_servers(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all Source Servers or multiple Source Servers filtered by ID.

# Arguments
- `filters`: A set of filters by which to return Source Servers.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of Source Servers to retrieve.
- `"next_token"`: The token of the next Source Server to retrieve.
"""
function describe_source_servers(
    filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DescribeSourceServers",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("filters" => filters), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disconnect_recovery_instance(recovery_instance_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disconnect a Recovery Instance from Elastic Disaster Recovery. Data replication is stopped
immediately. All AWS resources created by Elastic Disaster Recovery for enabling the
replication of the Recovery Instance will be terminated / deleted within 90 minutes. If the
agent on the Recovery Instance has not been prevented from communicating with the Elastic
Disaster Recovery service, then it will receive a command to uninstall itself (within
approximately 10 minutes). The following properties of the Recovery Instance will be
changed immediately: dataReplicationInfo.dataReplicationState will be set to DISCONNECTED;
The totalStorageBytes property for each of dataReplicationInfo.replicatedDisks will be set
to zero; dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will be
nullified.

# Arguments
- `recovery_instance_id`: The ID of the Recovery Instance to disconnect.

"""
function disconnect_recovery_instance(
    recoveryInstanceID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DisconnectRecoveryInstance",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recoveryInstanceID" => recoveryInstanceID), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disconnect_source_server(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disconnects a specific Source Server from Elastic Disaster Recovery. Data replication is
stopped immediately. All AWS resources created by Elastic Disaster Recovery for enabling
the replication of the Source Server will be terminated / deleted within 90 minutes. You
cannot disconnect a Source Server if it has a Recovery Instance. If the agent on the Source
Server has not been prevented from communicating with the Elastic Disaster Recovery
service, then it will receive a command to uninstall itself (within approximately 10
minutes). The following properties of the SourceServer will be changed immediately:
dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The totalStorageBytes
property for each of dataReplicationInfo.replicatedDisks will be set to zero;
dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will be nullified.

# Arguments
- `source_server_id`: The ID of the Source Server to disconnect.

"""
function disconnect_source_server(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/DisconnectSourceServer",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_failback_replication_configuration(recovery_instance_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all Failback ReplicationConfigurations, filtered by Recovery Instance ID.

# Arguments
- `recovery_instance_id`: The ID of the Recovery Instance whose failback replication
  configuration should be returned.

"""
function get_failback_replication_configuration(
    recoveryInstanceID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/GetFailbackReplicationConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recoveryInstanceID" => recoveryInstanceID), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_launch_configuration(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a LaunchConfiguration, filtered by Source Server IDs.

# Arguments
- `source_server_id`: The ID of the Source Server that we want to retrieve a Launch
  Configuration for.

"""
function get_launch_configuration(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/GetLaunchConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_replication_configuration(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a ReplicationConfiguration, filtered by Source Server ID.

# Arguments
- `source_server_id`: The ID of the Source Serve for this Replication Configuration.r

"""
function get_replication_configuration(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/GetReplicationConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    initialize_service(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Initialize Elastic Disaster Recovery.

"""
function initialize_service(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/InitializeService",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List all tags for your Elastic Disaster Recovery resources.

# Arguments
- `resource_arn`: The ARN of the resource whose tags should be returned.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    retry_data_replication(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Causes the data replication initiation sequence to begin immediately upon next Handshake
for the specified Source Server ID, regardless of when the previous initiation started.
This command will work only if the Source Server is stalled or is in a DISCONNECTED or
STOPPED state.

# Arguments
- `source_server_id`: The ID of the Source Server whose data replication should be retried.

"""
function retry_data_replication(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/RetryDataReplication",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_failback_launch(recovery_instance_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Initiates a Job for launching the machine that is being failed back to from the specified
Recovery Instance. This will run conversion on the failback client and will reboot your
machine, thus completing the failback process.

# Arguments
- `recovery_instance_ids`: The IDs of the Recovery Instance whose failback launch we want
  to request.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tags"`: The tags to be associated with the failback launch Job.
"""
function start_failback_launch(
    recoveryInstanceIDs; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/StartFailbackLaunch",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("recoveryInstanceIDs" => recoveryInstanceIDs),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_recovery(source_servers; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Launches Recovery Instances for the specified Source Servers. For each Source Server you
may choose a point in time snapshot to launch from, or use an on demand snapshot.

# Arguments
- `source_servers`: The Source Servers that we want to start a Recovery Job for.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"is_drill"`: Whether this Source Server Recovery operation is a drill or not.
- `"tags"`: The tags to be associated with the Recovery Job.
"""
function start_recovery(
    sourceServers; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/StartRecovery",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServers" => sourceServers), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_failback(recovery_instance_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stops the failback process for a specified Recovery Instance. This changes the Failback
State of the Recovery Instance back to FAILBACK_NOT_STARTED.

# Arguments
- `recovery_instance_id`: The ID of the Recovery Instance we want to stop failback for.

"""
function stop_failback(
    recoveryInstanceID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/StopFailback",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recoveryInstanceID" => recoveryInstanceID), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds or overwrites only the specified tags for the specified Elastic Disaster Recovery
resource or resources. When you specify an existing tag key, the value is overwritten with
the new value. Each resource can have a maximum of 50 tags. Each tag consists of a key and
optional value.

# Arguments
- `resource_arn`: ARN of the resource for which tags are to be added or updated.
- `tags`: Array of tags to be added or updated.

"""
function tag_resource(
    resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    terminate_recovery_instances(recovery_instance_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Initiates a Job for terminating the EC2 resources associated with the specified Recovery
Instances, and then will delete the Recovery Instances from the Elastic Disaster Recovery
service.

# Arguments
- `recovery_instance_ids`: The IDs of the Recovery Instances that should be terminated.

"""
function terminate_recovery_instances(
    recoveryInstanceIDs; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/TerminateRecoveryInstances",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("recoveryInstanceIDs" => recoveryInstanceIDs),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified set of tags from the specified set of Elastic Disaster Recovery
resources.

# Arguments
- `resource_arn`: ARN of the resource for which tags are to be removed.
- `tag_keys`: Array of tags to be removed.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_failback_replication_configuration(recovery_instance_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Allows you to update the failback replication configuration of a Recovery Instance by ID.

# Arguments
- `recovery_instance_id`: The ID of the Recovery Instance.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"bandwidth_throttling"`: Configure bandwidth throttling for the outbound data transfer
  rate of the Recovery Instance in Mbps.
- `"name"`: The name of the Failback Replication Configuration.
- `"use_private_ip"`: Whether to use Private IP for the failback replication of the
  Recovery Instance.
"""
function update_failback_replication_configuration(
    recoveryInstanceID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/UpdateFailbackReplicationConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recoveryInstanceID" => recoveryInstanceID), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_launch_configuration(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a LaunchConfiguration by Source Server ID.

# Arguments
- `source_server_id`: The ID of the Source Server that we want to retrieve a Launch
  Configuration for.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"copy_private_ip"`: Whether we should copy the Private IP of the Source Server to the
  Recovery Instance.
- `"copy_tags"`: Whether we want to copy the tags of the Source Server to the EC2 machine
  of the Recovery Instance.
- `"launch_disposition"`: The state of the Recovery Instance in EC2 after the recovery
  operation.
- `"licensing"`: The licensing configuration to be used for this launch configuration.
- `"name"`: The name of the launch configuration.
- `"target_instance_type_right_sizing_method"`: Whether Elastic Disaster Recovery should
  try to automatically choose the instance type that best matches the OS, CPU, and RAM of
  your Source Server.
"""
function update_launch_configuration(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/UpdateLaunchConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_replication_configuration(source_server_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Allows you to update a ReplicationConfiguration by Source Server ID.

# Arguments
- `source_server_id`: The ID of the Source Server for this Replication Configuration.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"associate_default_security_group"`: Whether to associate the default Elastic Disaster
  Recovery Security group with the Replication Configuration.
- `"bandwidth_throttling"`: Configure bandwidth throttling for the outbound data transfer
  rate of the Source Server in Mbps.
- `"create_public_ip"`: Whether to create a Public IP for the Recovery Instance by default.
- `"data_plane_routing"`: The data plane routing mechanism that will be used for
  replication.
- `"default_large_staging_disk_type"`: The Staging Disk EBS volume type to be used during
  replication.
- `"ebs_encryption"`: The type of EBS encryption to be used during replication.
- `"ebs_encryption_key_arn"`: The ARN of the EBS encryption key to be used during
  replication.
- `"name"`: The name of the Replication Configuration.
- `"pit_policy"`: The Point in time (PIT) policy to manage snapshots taken during
  replication.
- `"replicated_disks"`: The configuration of the disks of the Source Server to be
  replicated.
- `"replication_server_instance_type"`: The instance type to be used for the replication
  server.
- `"replication_servers_security_groups_ids"`: The security group IDs that will be used by
  the replication server.
- `"staging_area_subnet_id"`: The subnet to be used by the replication staging area.
- `"staging_area_tags"`: A set of tags to be associated with all resources created in the
  replication staging area: EC2 replication server, EBS volumes, EBS snapshots, etc.
- `"use_dedicated_replication_server"`: Whether to use a dedicated Replication Server in
  the replication staging area.
"""
function update_replication_configuration(
    sourceServerID; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/UpdateReplicationConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("sourceServerID" => sourceServerID), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_replication_configuration_template(replication_configuration_template_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a ReplicationConfigurationTemplate by ID.

# Arguments
- `replication_configuration_template_id`: The Replication Configuration Template ID.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"arn"`: The Replication Configuration Template ARN.
- `"associate_default_security_group"`: Whether to associate the default Elastic Disaster
  Recovery Security group with the Replication Configuration Template.
- `"bandwidth_throttling"`: Configure bandwidth throttling for the outbound data transfer
  rate of the Source Server in Mbps.
- `"create_public_ip"`: Whether to create a Public IP for the Recovery Instance by default.
- `"data_plane_routing"`: The data plane routing mechanism that will be used for
  replication.
- `"default_large_staging_disk_type"`: The Staging Disk EBS volume type to be used during
  replication.
- `"ebs_encryption"`: The type of EBS encryption to be used during replication.
- `"ebs_encryption_key_arn"`: The ARN of the EBS encryption key to be used during
  replication.
- `"pit_policy"`: The Point in time (PIT) policy to manage snapshots taken during
  replication.
- `"replication_server_instance_type"`: The instance type to be used for the replication
  server.
- `"replication_servers_security_groups_ids"`: The security group IDs that will be used by
  the replication server.
- `"staging_area_subnet_id"`: The subnet to be used by the replication staging area.
- `"staging_area_tags"`: A set of tags to be associated with all resources created in the
  replication staging area: EC2 replication server, EBS volumes, EBS snapshots, etc.
- `"use_dedicated_replication_server"`: Whether to use a dedicated Replication Server in
  the replication staging area.
"""
function update_replication_configuration_template(
    replicationConfigurationTemplateID;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return drs(
        "POST",
        "/UpdateReplicationConfigurationTemplate",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "replicationConfigurationTemplateID" =>
                        replicationConfigurationTemplateID,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
