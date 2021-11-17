# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: cloudhsm_v2
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "eni_id" => "EniId",
    "next_token" => "NextToken",
    "source_backup_id" => "SourceBackupId",
    "max_results" => "MaxResults",
    "eni_ip" => "EniIp",
    "tag_list" => "TagList",
    "filters" => "Filters",
    "sort_ascending" => "SortAscending",
    "ip_address" => "IpAddress",
    "backup_retention_policy" => "BackupRetentionPolicy",
    "hsm_id" => "HsmId",
)

"""
    copy_backup_to_region(backup_id, destination_region; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Copy an AWS CloudHSM cluster backup to a different region.

# Arguments
- `backup_id`: The ID of the backup that will be copied to the destination region.
- `destination_region`: The AWS region that will contain your copied CloudHSM cluster
  backup.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tag_list"`: Tags to apply to the destination backup during creation. If you specify
  tags, only these tags will be applied to the destination backup. If you do not specify
  tags, the service copies tags from the source backup to the destination backup.
"""
function copy_backup_to_region(
    BackupId,
    DestinationRegion;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "CopyBackupToRegion",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "BackupId" => BackupId, "DestinationRegion" => DestinationRegion
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_cluster(hsm_type, subnet_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new AWS CloudHSM cluster.

# Arguments
- `hsm_type`: The type of HSM to use in the cluster. Currently the only allowed value is
  hsm1.medium.
- `subnet_ids`: The identifiers (IDs) of the subnets where you are creating the cluster.
  You must specify at least one subnet. If you specify multiple subnets, they must meet the
  following criteria:   All subnets must be in the same virtual private cloud (VPC).   You
  can specify only one subnet per Availability Zone.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"backup_retention_policy"`: A policy that defines how the service retains backups.
- `"source_backup_id"`: The identifier (ID) of the cluster backup to restore. Use this
  value to restore the cluster from a backup instead of creating a new cluster. To find the
  backup ID, use DescribeBackups.
- `"tag_list"`: Tags to apply to the CloudHSM cluster during creation.
"""
function create_cluster(
    HsmType, SubnetIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "CreateCluster",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("HsmType" => HsmType, "SubnetIds" => SubnetIds),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_hsm(availability_zone, cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new hardware security module (HSM) in the specified AWS CloudHSM cluster.

# Arguments
- `availability_zone`: The Availability Zone where you are creating the HSM. To find the
  cluster's Availability Zones, use DescribeClusters.
- `cluster_id`: The identifier (ID) of the HSM's cluster. To find the cluster ID, use
  DescribeClusters.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"ip_address"`: The HSM's IP address. If you specify an IP address, use an available
  address from the subnet that maps to the Availability Zone where you are creating the HSM.
  If you don't specify an IP address, one is chosen for you from that subnet.
"""
function create_hsm(
    AvailabilityZone,
    ClusterId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "CreateHsm",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AvailabilityZone" => AvailabilityZone, "ClusterId" => ClusterId
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_backup(backup_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7 days after the
DeleteBackup request is made. For more information on restoring a backup, see RestoreBackup.

# Arguments
- `backup_id`: The ID of the backup to be deleted. To find the ID of a backup, use the
  DescribeBackups operation.

"""
function delete_backup(
    BackupId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "DeleteBackup",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("BackupId" => BackupId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_cluster(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified AWS CloudHSM cluster. Before you can delete a cluster, you must
delete all HSMs in the cluster. To see if the cluster contains any HSMs, use
DescribeClusters. To delete an HSM, use DeleteHsm.

# Arguments
- `cluster_id`: The identifier (ID) of the cluster that you are deleting. To find the
  cluster ID, use DescribeClusters.

"""
function delete_cluster(
    ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "DeleteCluster",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_hsm(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP
address of the HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need
to specify only one of these values. To find these values, use DescribeClusters.

# Arguments
- `cluster_id`: The identifier (ID) of the cluster that contains the HSM that you are
  deleting.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"eni_id"`: The identifier (ID) of the elastic network interface (ENI) of the HSM that
  you are deleting.
- `"eni_ip"`: The IP address of the elastic network interface (ENI) of the HSM that you are
  deleting.
- `"hsm_id"`: The identifier (ID) of the HSM that you are deleting.
"""
function delete_hsm(ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "DeleteHsm",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_backups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about backups of AWS CloudHSM clusters. This is a paginated operation,
which means that each response might contain only a subset of all the backups. When the
response contains only a subset of backups, it includes a NextToken value. Use this value
in a subsequent DescribeBackups request to get more backups. When you receive a response
with no NextToken (or an empty or null value), that means there are no more backups to get.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: One or more filters to limit the items returned in the response. Use the
  backupIds filter to return only the specified backups. Specify backups by their backup
  identifier (ID). Use the sourceBackupIds filter to return only the backups created from a
  source backup. The sourceBackupID of a source backup is returned by the CopyBackupToRegion
  operation. Use the clusterIds filter to return only the backups for the specified clusters.
  Specify clusters by their cluster identifier (ID). Use the states filter to return only
  backups that match the specified state. Use the neverExpires filter to return backups
  filtered by the value in the neverExpires parameter. True returns all backups exempt from
  the backup retention policy. False returns all backups with a backup retention policy
  defined at the cluster.
- `"max_results"`: The maximum number of backups to return in the response. When there are
  more backups than the number you specify, the response contains a NextToken value.
- `"next_token"`: The NextToken value that you received in the previous response. Use this
  value to get more backups.
- `"sort_ascending"`: Designates whether or not to sort the return backups by ascending
  chronological order of generation.
"""
function describe_backups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "DescribeBackups", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_clusters(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets information about AWS CloudHSM clusters. This is a paginated operation, which means
that each response might contain only a subset of all the clusters. When the response
contains only a subset of clusters, it includes a NextToken value. Use this value in a
subsequent DescribeClusters request to get more clusters. When you receive a response with
no NextToken (or an empty or null value), that means there are no more clusters to get.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: One or more filters to limit the items returned in the response. Use the
  clusterIds filter to return only the specified clusters. Specify clusters by their cluster
  identifier (ID). Use the vpcIds filter to return only the clusters in the specified virtual
  private clouds (VPCs). Specify VPCs by their VPC identifier (ID). Use the states filter to
  return only clusters that match the specified state.
- `"max_results"`: The maximum number of clusters to return in the response. When there are
  more clusters than the number you specify, the response contains a NextToken value.
- `"next_token"`: The NextToken value that you received in the previous response. Use this
  value to get more clusters.
"""
function describe_clusters(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "DescribeClusters", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    initialize_cluster(cluster_id, signed_cert, trust_anchor; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Claims an AWS CloudHSM cluster by submitting the cluster certificate issued by your issuing
certificate authority (CA) and the CA's root certificate. Before you can claim a cluster,
you must sign the cluster's certificate signing request (CSR) with your issuing CA. To get
the cluster's CSR, use DescribeClusters.

# Arguments
- `cluster_id`: The identifier (ID) of the cluster that you are claiming. To find the
  cluster ID, use DescribeClusters.
- `signed_cert`: The cluster certificate issued (signed) by your issuing certificate
  authority (CA). The certificate must be in PEM format and can contain a maximum of 5000
  characters.
- `trust_anchor`: The issuing certificate of the issuing certificate authority (CA) that
  issued (signed) the cluster certificate. You must use a self-signed certificate. The
  certificate used to sign the HSM CSR must be directly available, and thus must be the root
  certificate. The certificate must be in PEM format and can contain a maximum of 5000
  characters.

"""
function initialize_cluster(
    ClusterId,
    SignedCert,
    TrustAnchor;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "InitializeCluster",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClusterId" => ClusterId,
                    "SignedCert" => SignedCert,
                    "TrustAnchor" => TrustAnchor,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags(resource_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Gets a list of tags for the specified AWS CloudHSM cluster. This is a paginated operation,
which means that each response might contain only a subset of all the tags. When the
response contains only a subset of tags, it includes a NextToken value. Use this value in a
subsequent ListTags request to get more tags. When you receive a response with no NextToken
(or an empty or null value), that means there are no more tags to get.

# Arguments
- `resource_id`: The cluster identifier (ID) for the cluster whose tags you are getting. To
  find the cluster ID, use DescribeClusters.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of tags to return in the response. When there are
  more tags than the number you specify, the response contains a NextToken value.
- `"next_token"`: The NextToken value that you received in the previous response. Use this
  value to get more tags.
"""
function list_tags(ResourceId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "ListTags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceId" => ResourceId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    modify_backup_attributes(backup_id, never_expires; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Modifies attributes for AWS CloudHSM backup.

# Arguments
- `backup_id`: The identifier (ID) of the backup to modify. To find the ID of a backup, use
  the DescribeBackups operation.
- `never_expires`: Specifies whether the service should exempt a backup from the retention
  policy for the cluster. True exempts a backup from the retention policy. False means the
  service applies the backup retention policy defined at the cluster.

"""
function modify_backup_attributes(
    BackupId, NeverExpires; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "ModifyBackupAttributes",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("BackupId" => BackupId, "NeverExpires" => NeverExpires),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    modify_cluster(backup_retention_policy, cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Modifies AWS CloudHSM cluster.

# Arguments
- `backup_retention_policy`: A policy that defines how the service retains backups.
- `cluster_id`: The identifier (ID) of the cluster that you want to modify. To find the
  cluster ID, use DescribeClusters.

"""
function modify_cluster(
    BackupRetentionPolicy,
    ClusterId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "ModifyCluster",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "BackupRetentionPolicy" => BackupRetentionPolicy,
                    "ClusterId" => ClusterId,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    restore_backup(backup_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Restores a specified AWS CloudHSM backup that is in the PENDING_DELETION state. For mor
information on deleting a backup, see DeleteBackup.

# Arguments
- `backup_id`: The ID of the backup to be restored. To find the ID of a backup, use the
  DescribeBackups operation.

"""
function restore_backup(
    BackupId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "RestoreBackup",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("BackupId" => BackupId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_id, tag_list; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds or overwrites one or more tags for the specified AWS CloudHSM cluster.

# Arguments
- `resource_id`: The cluster identifier (ID) for the cluster that you are tagging. To find
  the cluster ID, use DescribeClusters.
- `tag_list`: A list of one or more tags.

"""
function tag_resource(
    ResourceId, TagList; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceId" => ResourceId, "TagList" => TagList),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_id, tag_key_list; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified tag or tags from the specified AWS CloudHSM cluster.

# Arguments
- `resource_id`: The cluster identifier (ID) for the cluster whose tags you are removing.
  To find the cluster ID, use DescribeClusters.
- `tag_key_list`: A list of one or more tag keys for the tags that you are removing.
  Specify only the tag keys, not the tag values.

"""
function untag_resource(
    ResourceId, TagKeyList; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return cloudhsm_v2(
        "UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceId" => ResourceId, "TagKeyList" => TagKeyList),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
