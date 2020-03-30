include("../AWSServices.jl")
using .AWSServices: elasticache

"""
    CreateReplicationGroup()

Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group. This API can be used to create a standalone regional replication group or a secondary replication group associated with a Global Datastore. A Redis (cluster mode disabled) replication group is a collection of clusters, where one of the clusters is a read/write primary and the others are read-only replicas. Writes to the primary are asynchronously propagated to the replicas. A Redis (cluster mode enabled) replication group is a collection of 1 to 90 node groups (shards). Each node group (shard) has one read/write primary node and up to 5 read-only replica nodes. Writes to the primary are asynchronously propagated to the replicas. Redis (cluster mode enabled) replication groups partition the data across node groups (shards). When a Redis (cluster mode disabled) replication group has been successfully created, you can add one or more read replicas to it, up to a total of 5 read replicas. You cannot alter a Redis (cluster mode enabled) replication group after it has been created. However, if you need to increase or decrease the number of node groups (console: shards), you can avail yourself of ElastiCache for Redis' enhanced backup and restore. For more information, see Restoring From a Backup with Cluster Resizing in the ElastiCache User Guide.  This operation is valid for Redis only. 

Required Parameters
{
  "ReplicationGroupId": "The replication group identifier. This parameter is stored as a lowercase string. Constraints:   A name must contain from 1 to 40 alphanumeric characters or hyphens.   The first character must be a letter.   A name cannot end with a hyphen or contain two consecutive hyphens.  ",
  "ReplicationGroupDescription": "A user-created description for the replication group."
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are: Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are:    sun     mon     tue     wed     thu     fri     sat    Example: sun:23:00-mon:01:30 ",
  "AutoMinorVersionUpgrade": "This parameter is currently disabled.",
  "NumCacheClusters": "The number of clusters this replication group initially has. This parameter is not used if there is more than one node group (shard). You should use ReplicasPerNodeGroup instead. If AutomaticFailoverEnabled is true, the value of this parameter must be at least 2. If AutomaticFailoverEnabled is false you can omit this parameter (it will default to 1), or you can explicitly set it to a value between 2 and 6. The maximum permitted value for NumCacheClusters is 6 (1 primary plus 5 replicas).",
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "CacheSecurityGroupNames": "A list of cache security group names to associate with this replication group.",
  "Tags": "A list of cost allocation tags to be added to this resource. Tags are comma-separated key,value pairs (e.g. Key=myKey, Value=myKeyValue. You can include multiple tags as shown following: Key=myKey, Value=myKeyValue Key=mySecondKey, Value=mySecondKeyValue.",
  "NotificationTopicArn": "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.  The Amazon SNS topic owner must be the same as the cluster owner. ",
  "CacheParameterGroupName": "The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used.  If you are restoring to an engine version that is different than the original, you must specify the default version of that version. For example, CacheParameterGroupName=default.redis4.0.  If you are running Redis version 3.2.4 or later, only one node group (shard), and want to use a default parameter group, we recommend that you specify the parameter group by name.    To create a Redis (cluster mode disabled) replication group, use CacheParameterGroupName=default.redis3.2.   To create a Redis (cluster mode enabled) replication group, use CacheParameterGroupName=default.redis3.2.cluster.on.  ",
  "Engine": "The name of the cache engine to be used for the clusters in this replication group.",
  "CacheSubnetGroupName": "The name of the cache subnet group to be used for the replication group.  If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see Subnets and Subnet Groups. ",
  "SnapshotWindow": "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard). Example: 05:00-09:00  If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.",
  "SecurityGroupIds": "One or more Amazon VPC security groups associated with this replication group. Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud (Amazon VPC).",
  "CacheNodeType": "The compute and memory capacity of the nodes in the node group (shard). The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.   General purpose:   Current generation:   M5 node types: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge   M4 node types: cache.m4.large, cache.m4.xlarge, cache.m4.2xlarge, cache.m4.4xlarge, cache.m4.10xlarge   T3 node types: cache.t3.micro, cache.t3.small, cache.t3.medium   T2 node types: cache.t2.micro, cache.t2.small, cache.t2.medium    Previous generation: (not recommended)  T1 node types: cache.t1.micro   M1 node types: cache.m1.small, cache.m1.medium, cache.m1.large, cache.m1.xlarge   M3 node types: cache.m3.medium, cache.m3.large, cache.m3.xlarge, cache.m3.2xlarge      Compute optimized:   Previous generation: (not recommended)  C1 node types: cache.c1.xlarge      Memory optimized:   Current generation:   R5 node types: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge   R4 node types: cache.r4.large, cache.r4.xlarge, cache.r4.2xlarge, cache.r4.4xlarge, cache.r4.8xlarge, cache.r4.16xlarge    Previous generation: (not recommended)  M2 node types: cache.m2.xlarge, cache.m2.2xlarge, cache.m2.4xlarge   R3 node types: cache.r3.large, cache.r3.xlarge, cache.r3.2xlarge, cache.r3.4xlarge, cache.r3.8xlarge       Additional node type info    All current generation instance types are created in Amazon VPC by default.   Redis append-only files (AOF) are not supported for T1 or T2 instances.   Redis Multi-AZ with automatic failover is not supported on T1 instances.   Redis configuration variables appendonly and appendfsync are not supported on Redis version 2.8.22 and later.  ",
  "EngineVersion": "The version number of the cache engine to be used for the clusters in this replication group. To view the supported cache engine versions, use the DescribeCacheEngineVersions operation.  Important: You can upgrade to a newer engine version (see Selecting a Cache Engine and Version) in the ElastiCache User Guide, but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. ",
  "Port": "The port number on which each member of the replication group accepts connections.",
  "SnapshotRetentionLimit": "The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5 days before being deleted. Default: 0 (i.e., automatic backups are disabled for this cluster).",
  "NodeGroupConfiguration": "A list of node group (shard) configuration options. Each node group (shard) configuration has the following members: PrimaryAvailabilityZone, ReplicaAvailabilityZones, ReplicaCount, and Slots. If you're creating a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group, you can use this parameter to individually configure each node group (shard), or you can omit this parameter. However, when seeding a Redis (cluster mode enabled) cluster from a S3 rdb file, you must configure each node group (shard) using this parameter because you must specify the slots for each node group.",
  "SnapshotName": "The name of a snapshot from which to restore data into the new replication group. The snapshot status changes to restoring while the new replication group is being created.",
  "SnapshotArns": "A list of Amazon Resource Names (ARN) that uniquely identify the Redis RDB snapshot files stored in Amazon S3. The snapshot files are used to populate the new replication group. The Amazon S3 object name in the ARN cannot contain any commas. The new replication group will have the number of node groups (console: shards) specified by the parameter NumNodeGroups or the number of node groups configured by NodeGroupConfiguration regardless of the number of ARNs specified here. Example of an Amazon S3 ARN: arn:aws:s3:::my_bucket/snapshot1.rdb ",
  "PrimaryClusterId": "The identifier of the cluster that serves as the primary for this replication group. This cluster must already exist and have a status of available. This parameter is not required if NumCacheClusters, NumNodeGroups, or ReplicasPerNodeGroup is specified.",
  "TransitEncryptionEnabled": "A flag that enables in-transit encryption when set to true. You cannot modify the value of TransitEncryptionEnabled after the cluster is created. To enable in-transit encryption on a cluster you must set TransitEncryptionEnabled to true when you create a cluster. This parameter is valid only if the Engine parameter is redis, the EngineVersion parameter is 3.2.6, 4.x or later, and the cluster is being created in an Amazon VPC. If you enable in-transit encryption, you must also specify a value for CacheSubnetGroup.  Required: Only available when creating a replication group in an Amazon VPC using redis version 3.2.6, 4.x or later. Default: false   For HIPAA compliance, you must specify TransitEncryptionEnabled as true, an AuthToken, and a CacheSubnetGroup. ",
  "ReplicasPerNodeGroup": "An optional parameter that specifies the number of replica nodes in each node group (shard). Valid values are 0 to 5.",
  "PreferredCacheClusterAZs": "A list of EC2 Availability Zones in which the replication group's clusters are created. The order of the Availability Zones in the list is the order in which clusters are allocated. The primary cluster is created in the first AZ in the list. This parameter is not used if there is more than one node group (shard). You should use NodeGroupConfiguration instead.  If you are creating your replication group in an Amazon VPC (recommended), you can only locate clusters in Availability Zones associated with the subnets in the selected subnet group. The number of Availability Zones listed must equal the value of NumCacheClusters.  Default: system chosen Availability Zones.",
  "AuthToken": " Reserved parameter. The password used to access a password protected server.  AuthToken can be specified only on replication groups where TransitEncryptionEnabled is true.  For HIPAA compliance, you must specify TransitEncryptionEnabled as true, an AuthToken, and a CacheSubnetGroup.  Password constraints:   Must be only printable ASCII characters.   Must be at least 16 characters and no more than 128 characters in length.   The only permitted printable special characters are !, &amp;, #,  , ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.   For more information, see AUTH password at http://redis.io/commands/AUTH.",
  "AtRestEncryptionEnabled": "A flag that enables encryption at rest when set to true. You cannot modify the value of AtRestEncryptionEnabled after the replication group is created. To enable encryption at rest on a replication group you must set AtRestEncryptionEnabled to true when you create the replication group.   Required: Only available when creating a replication group in an Amazon VPC using redis version 3.2.6, 4.x or later. Default: false ",
  "KmsKeyId": "The ID of the KMS key used to encrypt the disk in the cluster.",
  "AutomaticFailoverEnabled": "Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails. If true, Multi-AZ is enabled for this replication group. If false, Multi-AZ is disabled for this replication group.  AutomaticFailoverEnabled must be enabled for Redis (cluster mode enabled) replication groups. Default: false Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:   Redis versions earlier than 2.8.6.   Redis (cluster mode disabled): T1 node types.   Redis (cluster mode enabled): T1 node types.  ",
  "NumNodeGroups": "An optional parameter that specifies the number of node groups (shards) for this Redis (cluster mode enabled) replication group. For Redis (cluster mode disabled) either omit this parameter or set it to 1. Default: 1"
}
"""
CreateReplicationGroup(args) = elasticache("CreateReplicationGroup", args)

"""
    ModifyGlobalReplicationGroup()

Modifies the settings for a Global Datastore.

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "ApplyImmediately": "If true, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the PreferredMaintenanceWindow setting for the replication group. If false, changes to the nodes in the replication group are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first. "
}

Optional Parameters
{
  "CacheNodeType": "A valid cache node type that you want to scale this Global Datastore to.",
  "EngineVersion": "The upgraded version of the cache engine to be run on the clusters in the Global Datastore. ",
  "GlobalReplicationGroupDescription": "A description of the Global Datastore",
  "AutomaticFailoverEnabled": "Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure. "
}
"""
ModifyGlobalReplicationGroup(args) = elasticache("ModifyGlobalReplicationGroup", args)

"""
    ModifyReplicationGroup()

Modifies the settings for a replication group. For Redis (cluster mode enabled) clusters, this operation cannot be used to change a cluster's node type or engine version. For more information, see:    Scaling for Amazon ElastiCache for Redis (cluster mode enabled) in the ElastiCache User Guide    ModifyReplicationGroupShardConfiguration in the ElastiCache API Reference    This operation is valid for Redis only. 

Required Parameters
{
  "ReplicationGroupId": "The identifier of the replication group to modify."
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are:    sun     mon     tue     wed     thu     fri     sat    Example: sun:23:00-mon:01:30 ",
  "AutoMinorVersionUpgrade": "This parameter is currently disabled.",
  "CacheSecurityGroupNames": "A list of cache security group names to authorize for the clusters in this replication group. This change is asynchronously applied as soon as possible. This parameter can be used only with replication group containing clusters running outside of an Amazon Virtual Private Cloud (Amazon VPC). Constraints: Must contain no more than 255 alphanumeric characters. Must not be Default.",
  "NotificationTopicArn": "The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.  The Amazon SNS topic owner must be same as the replication group owner.  ",
  "CacheParameterGroupName": "The name of the cache parameter group to apply to all of the clusters in this replication group. This change is asynchronously applied as soon as possible for parameters when the ApplyImmediately parameter is specified as true for this request.",
  "ReplicationGroupDescription": "A description for the replication group. Maximum length is 255 characters.",
  "SnapshotWindow": "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of the node group (shard) specified by SnapshottingClusterId. Example: 05:00-09:00  If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.",
  "SecurityGroupIds": "Specifies the VPC Security Groups associated with the clusters in the replication group. This parameter can be used only with replication group containing clusters running in an Amazon Virtual Private Cloud (Amazon VPC).",
  "CacheNodeType": "A valid cache node type that you want to scale this replication group to.",
  "EngineVersion": "The upgraded version of the cache engine to be run on the clusters in the replication group.  Important: You can upgrade to a newer engine version (see Selecting a Cache Engine and Version), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing replication group and create it anew with the earlier engine version. ",
  "SnapshottingClusterId": "The cluster ID that is used as the daily snapshot source for the replication group. This parameter cannot be set for Redis (cluster mode enabled) replication groups.",
  "NodeGroupId": "Deprecated. This parameter is not used.",
  "SnapshotRetentionLimit": "The number of days for which ElastiCache retains automatic node group (shard) snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5 days before being deleted.  Important If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.",
  "PrimaryClusterId": "For replication groups with a single primary, if this parameter is specified, ElastiCache promotes the specified cluster in the specified replication group to the primary role. The nodes of all other clusters in the replication group are read replicas.",
  "ApplyImmediately": "If true, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the PreferredMaintenanceWindow setting for the replication group. If false, changes to the nodes in the replication group are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first. Valid values: true | false  Default: false ",
  "AuthToken": "Reserved parameter. The password used to access a password protected server. This parameter must be specified with the auth-token-update-strategy  parameter. Password constraints:   Must be only printable ASCII characters   Must be at least 16 characters and no more than 128 characters in length   Cannot contain any of the following characters: '/', '\"', or '@', '%'    For more information, see AUTH password at AUTH.",
  "AutomaticFailoverEnabled": "Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure. Valid values: true | false  Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:   Redis versions earlier than 2.8.6.   Redis (cluster mode disabled): T1 node types.   Redis (cluster mode enabled): T1 node types.  ",
  "NotificationTopicStatus": "The status of the Amazon SNS notification topic for the replication group. Notifications are sent only if the status is active. Valid values: active | inactive ",
  "AuthTokenUpdateStrategy": "Specifies the strategy to use to update the AUTH token. This parameter must be specified with the auth-token parameter. Possible values:   Rotate   Set    For more information, see Authenticating Users with Redis AUTH "
}
"""
ModifyReplicationGroup(args) = elasticache("ModifyReplicationGroup", args)

"""
    BatchApplyUpdateAction()

Apply the service update. For more information on service updates and applying them, see Applying Service Updates.

Required Parameters
{
  "ServiceUpdateName": "The unique ID of the service update"
}

Optional Parameters
{
  "CacheClusterIds": "The cache cluster IDs",
  "ReplicationGroupIds": "The replication group IDs"
}
"""
BatchApplyUpdateAction(args) = elasticache("BatchApplyUpdateAction", args)

"""
    CreateCacheSubnetGroup()

Creates a new cache subnet group. Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).

Required Parameters
{
  "CacheSubnetGroupDescription": "A description for the cache subnet group.",
  "SubnetIds": "A list of VPC subnet IDs for the cache subnet group.",
  "CacheSubnetGroupName": "A name for the cache subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 alphanumeric characters or hyphens. Example: mysubnetgroup "
}
"""
CreateCacheSubnetGroup(args) = elasticache("CreateCacheSubnetGroup", args)

"""
    CreateCacheSecurityGroup()

Creates a new cache security group. Use a cache security group to control access to one or more clusters. Cache security groups are only used when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache subnet group instead. For more information, see CreateCacheSubnetGroup.

Required Parameters
{
  "Description": "A description for the cache security group.",
  "CacheSecurityGroupName": "A name for the cache security group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 alphanumeric characters. Cannot be the word \"Default\". Example: mysecuritygroup "
}
"""
CreateCacheSecurityGroup(args) = elasticache("CreateCacheSecurityGroup", args)

"""
    DeleteCacheSecurityGroup()

Deletes a cache security group.  You cannot delete a cache security group if it is associated with any clusters. 

Required Parameters
{
  "CacheSecurityGroupName": "The name of the cache security group to delete.  You cannot delete the default security group. "
}
"""
DeleteCacheSecurityGroup(args) = elasticache("DeleteCacheSecurityGroup", args)

"""
    ModifyCacheSubnetGroup()

Modifies an existing cache subnet group.

Required Parameters
{
  "CacheSubnetGroupName": "The name for the cache subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 alphanumeric characters or hyphens. Example: mysubnetgroup "
}

Optional Parameters
{
  "CacheSubnetGroupDescription": "A description of the cache subnet group.",
  "SubnetIds": "The EC2 subnet IDs for the cache subnet group."
}
"""
ModifyCacheSubnetGroup(args) = elasticache("ModifyCacheSubnetGroup", args)

"""
    IncreaseNodeGroupsInGlobalReplicationGroup()

Increase the number of node groups in the Global Datastore

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "NodeGroupCount": "The number of node groups you wish to add",
  "ApplyImmediately": "Indicates that the process begins immediately. At present, the only permitted value for this parameter is true."
}

Optional Parameters
{
  "RegionalConfigurations": "Describes the replication group IDs, the AWS regions where they are stored and the shard configuration for each that comprise the Global Datastore"
}
"""
IncreaseNodeGroupsInGlobalReplicationGroup(args) = elasticache("IncreaseNodeGroupsInGlobalReplicationGroup", args)

"""
    DeleteReplicationGroup()

Deletes an existing replication group. By default, this operation deletes the entire replication group, including the primary/primaries and all of the read replicas. If the replication group has only one primary, you can optionally delete only the read replicas, while retaining the primary by setting RetainPrimaryCluster=true. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.  This operation is valid for Redis only. 

Required Parameters
{
  "ReplicationGroupId": "The identifier for the cluster to be deleted. This parameter is not case sensitive."
}

Optional Parameters
{
  "FinalSnapshotIdentifier": "The name of a final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster, rather than one of the replicas; this is to ensure that it captures the freshest data. After the final snapshot is taken, the replication group is immediately deleted.",
  "RetainPrimaryCluster": "If set to true, all of the read replicas are deleted, but the primary node is retained."
}
"""
DeleteReplicationGroup(args) = elasticache("DeleteReplicationGroup", args)

"""
    DescribeCacheSubnetGroups()

Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "CacheSubnetGroupName": "The name of the cache subnet group to return details for."
}
"""
DescribeCacheSubnetGroups() = elasticache("DescribeCacheSubnetGroups")
DescribeCacheSubnetGroups(args) = elasticache("DescribeCacheSubnetGroups", args)

"""
    DisassociateGlobalReplicationGroup()

Remove a secondary cluster from the Global Datastore using the Global Datastore name. The secondary cluster will no longer receive updates from the primary cluster, but will remain as a standalone cluster in that AWS region.

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "ReplicationGroupId": "The name of the secondary cluster you wish to remove from the Global Datastore",
  "ReplicationGroupRegion": "The AWS region of secondary cluster you wish to remove from the Global Datastore"
}
"""
DisassociateGlobalReplicationGroup(args) = elasticache("DisassociateGlobalReplicationGroup", args)

"""
    DescribeReplicationGroups()

Returns information about a particular replication group. If no identifier is specified, DescribeReplicationGroups returns information about all replication groups.  This operation is valid for Redis only. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ReplicationGroupId": "The identifier for the replication group to be described. This parameter is not case sensitive. If you do not specify this parameter, information about all replication groups is returned."
}
"""
DescribeReplicationGroups() = elasticache("DescribeReplicationGroups")
DescribeReplicationGroups(args) = elasticache("DescribeReplicationGroups", args)

"""
    ModifyCacheCluster()

Modifies the settings for a cluster. You can use this operation to change one or more cluster configuration parameters by specifying the parameters and the new values.

Required Parameters
{
  "CacheClusterId": "The cluster identifier. This value is stored as a lowercase string."
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are:    sun     mon     tue     wed     thu     fri     sat    Example: sun:23:00-mon:01:30 ",
  "AutoMinorVersionUpgrade": "This parameter is currently disabled.",
  "CacheSecurityGroupNames": "A list of cache security group names to authorize on this cluster. This change is asynchronously applied as soon as possible. You can use this parameter only with clusters that are created outside of an Amazon Virtual Private Cloud (Amazon VPC). Constraints: Must contain no more than 255 alphanumeric characters. Must not be \"Default\".",
  "NotificationTopicArn": "The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.  The Amazon SNS topic owner must be same as the cluster owner. ",
  "CacheParameterGroupName": "The name of the cache parameter group to apply to this cluster. This change is asynchronously applied as soon as possible for parameters when the ApplyImmediately parameter is specified as true for this request.",
  "NewAvailabilityZones": "The list of Availability Zones where the new Memcached cache nodes are created. This parameter is only valid when NumCacheNodes in the request is greater than the sum of the number of active cache nodes and the number of cache nodes pending creation (which may be zero). The number of Availability Zones supplied in this list must match the cache nodes being added in this request. This option is only supported on Memcached clusters. Scenarios:    Scenario 1: You have 3 active nodes and wish to add 2 nodes. Specify NumCacheNodes=5 (3 + 2) and optionally specify two Availability Zones for the two new nodes.    Scenario 2: You have 3 active nodes and 2 nodes pending creation (from the scenario 1 call) and want to add 1 more node. Specify NumCacheNodes=6 ((3 + 2) + 1) and optionally specify an Availability Zone for the new node.    Scenario 3: You want to cancel all pending operations. Specify NumCacheNodes=3 to cancel all pending operations.   The Availability Zone placement of nodes pending creation cannot be modified. If you wish to cancel any nodes pending creation, add 0 nodes by setting NumCacheNodes to the number of current nodes. If cross-az is specified, existing Memcached nodes remain in their current Availability Zone. Only newly created nodes can be located in different Availability Zones. For guidance on how to move existing Memcached nodes to different Availability Zones, see the Availability Zone Considerations section of Cache Node Considerations for Memcached.  Impact of new add/remove requests upon pending requests    Scenario-1   Pending Action: Delete   New Request: Delete   Result: The new delete, pending or immediate, replaces the pending delete.     Scenario-2   Pending Action: Delete   New Request: Create   Result: The new create, pending or immediate, replaces the pending delete.     Scenario-3   Pending Action: Create   New Request: Delete   Result: The new delete, pending or immediate, replaces the pending create.     Scenario-4   Pending Action: Create   New Request: Create   Result: The new create is added to the pending create.   Important: If the new create request is Apply Immediately - Yes, all creates are performed immediately. If the new create request is Apply Immediately - No, all creates are pending.     ",
  "AZMode": "Specifies whether the new nodes in this Memcached cluster are all created in a single Availability Zone or created across multiple Availability Zones. Valid values: single-az | cross-az. This option is only supported for Memcached clusters.  You cannot specify single-az if the Memcached cluster already has cache nodes in different Availability Zones. If cross-az is specified, existing Memcached nodes remain in their current Availability Zone. Only newly created nodes are located in different Availability Zones.  ",
  "SnapshotWindow": "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your cluster. ",
  "SecurityGroupIds": "Specifies the VPC Security Groups associated with the cluster. This parameter can be used only with clusters that are created in an Amazon Virtual Private Cloud (Amazon VPC).",
  "CacheNodeType": "A valid cache node type that you want to scale this cluster up to.",
  "EngineVersion": "The upgraded version of the cache engine to be run on the cache nodes.  Important: You can upgrade to a newer engine version (see Selecting a Cache Engine and Version), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster and create it anew with the earlier engine version. ",
  "SnapshotRetentionLimit": "The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5 days before being deleted.  If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. ",
  "ApplyImmediately": "If true, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the PreferredMaintenanceWindow setting for the cluster. If false, changes to the cluster are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first.  If you perform a ModifyCacheCluster before a pending modification is applied, the pending modification is replaced by the newer modification.  Valid values: true | false  Default: false ",
  "NumCacheNodes": "The number of cache nodes that the cluster should have. If the value for NumCacheNodes is greater than the sum of the number of current cache nodes and the number of cache nodes pending creation (which may be zero), more nodes are added. If the value is less than the number of existing cache nodes, nodes are removed. If the value is equal to the number of current cache nodes, any pending add or remove requests are canceled. If you are removing cache nodes, you must use the CacheNodeIdsToRemove parameter to provide the IDs of the specific cache nodes to remove. For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.  Adding or removing Memcached cache nodes can be applied immediately or as a pending operation (see ApplyImmediately). A pending operation to modify the number of cache nodes in a cluster during its maintenance window, whether by adding or removing nodes in accordance with the scale out architecture, is not queued. The customer's latest request to add or remove nodes to the cluster overrides any previous pending operations to modify the number of cache nodes in the cluster. For example, a request to remove 2 nodes would override a previous pending operation to remove 3 nodes. Similarly, a request to add 2 nodes would override a previous pending operation to remove 3 nodes and vice versa. As Memcached cache nodes may now be provisioned in different Availability Zones with flexible cache node placement, a request to add nodes does not automatically override a previous pending operation to add nodes. The customer can modify the previous pending operation to add more nodes or explicitly cancel the pending request and retry the new request. To cancel pending operations to modify the number of cache nodes in a cluster, use the ModifyCacheCluster request and set NumCacheNodes equal to the number of cache nodes currently in the cluster. ",
  "AuthToken": "Reserved parameter. The password used to access a password protected server. This parameter must be specified with the auth-token-update parameter. Password constraints:   Must be only printable ASCII characters   Must be at least 16 characters and no more than 128 characters in length   Cannot contain any of the following characters: '/', '\"', or '@', '%'    For more information, see AUTH password at AUTH.",
  "CacheNodeIdsToRemove": "A list of cache node IDs to be removed. A node ID is a numeric identifier (0001, 0002, etc.). This parameter is only valid when NumCacheNodes is less than the existing number of cache nodes. The number of cache node IDs supplied in this parameter must match the difference between the existing number of cache nodes in the cluster or pending cache nodes, whichever is greater, and the value of NumCacheNodes in the request. For example: If you have 3 active cache nodes, 7 pending cache nodes, and the number of cache nodes in this ModifyCacheCluster call is 5, you must list 2 (7 - 5) cache node IDs to remove.",
  "NotificationTopicStatus": "The status of the Amazon SNS notification topic. Notifications are sent only if the status is active. Valid values: active | inactive ",
  "AuthTokenUpdateStrategy": "Specifies the strategy to use to update the AUTH token. This parameter must be specified with the auth-token parameter. Possible values:   Rotate   Set    For more information, see Authenticating Users with Redis AUTH "
}
"""
ModifyCacheCluster(args) = elasticache("ModifyCacheCluster", args)

"""
    ResetCacheParameterGroup()

Modifies the parameters of a cache parameter group to the engine or system default value. You can reset specific parameters by submitting a list of parameter names. To reset the entire cache parameter group, specify the ResetAllParameters and CacheParameterGroupName parameters.

Required Parameters
{
  "CacheParameterGroupName": "The name of the cache parameter group to reset."
}

Optional Parameters
{
  "ResetAllParameters": "If true, all parameters in the cache parameter group are reset to their default values. If false, only the parameters listed by ParameterNameValues are reset to their default values. Valid values: true | false ",
  "ParameterNameValues": "An array of parameter names to reset to their default values. If ResetAllParameters is true, do not use ParameterNameValues. If ResetAllParameters is false, you must specify the name of at least one parameter to reset."
}
"""
ResetCacheParameterGroup(args) = elasticache("ResetCacheParameterGroup", args)

"""
    CreateGlobalReplicationGroup()

Global Datastore for Redis offers fully managed, fast, reliable and secure cross-region replication. Using Global Datastore for Redis, you can create cross-region read replica clusters for ElastiCache for Redis to enable low-latency reads and disaster recovery across regions. For more information, see Replication Across Regions Using Global Datastore.    The GlobalReplicationGroupId is the name of the Global Datastore.   The PrimaryReplicationGroupId represents the name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.  

Required Parameters
{
  "GlobalReplicationGroupIdSuffix": "The suffix for name of a Global Datastore. The suffix guarantees uniqueness of the Global Datastore name across multiple regions.",
  "PrimaryReplicationGroupId": "The name of the primary cluster that accepts writes and will replicate updates to the secondary cluster."
}

Optional Parameters
{
  "GlobalReplicationGroupDescription": "Provides details of the Global Datastore"
}
"""
CreateGlobalReplicationGroup(args) = elasticache("CreateGlobalReplicationGroup", args)

"""
    ModifyCacheParameterGroup()

Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.

Required Parameters
{
  "CacheParameterGroupName": "The name of the cache parameter group to modify.",
  "ParameterNameValues": "An array of parameter names and values for the parameter update. You must supply at least one parameter name and value; subsequent arguments are optional. A maximum of 20 parameters may be modified per request."
}
"""
ModifyCacheParameterGroup(args) = elasticache("ModifyCacheParameterGroup", args)

"""
    DeleteCacheSubnetGroup()

Deletes a cache subnet group.  You cannot delete a cache subnet group if it is associated with any clusters. 

Required Parameters
{
  "CacheSubnetGroupName": "The name of the cache subnet group to delete. Constraints: Must contain no more than 255 alphanumeric characters or hyphens."
}
"""
DeleteCacheSubnetGroup(args) = elasticache("DeleteCacheSubnetGroup", args)

"""
    DescribeCacheParameterGroups()

Returns a list of cache parameter group descriptions. If a cache parameter group name is specified, the list contains only the descriptions for that group.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "CacheParameterGroupName": "The name of a specific cache parameter group to return details for."
}
"""
DescribeCacheParameterGroups() = elasticache("DescribeCacheParameterGroups")
DescribeCacheParameterGroups(args) = elasticache("DescribeCacheParameterGroups", args)

"""
    RebalanceSlotsInGlobalReplicationGroup()

Redistribute slots to ensure unifirom distribution across existing shards in the cluster.

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "ApplyImmediately": "If True, redistribution is applied immediately."
}
"""
RebalanceSlotsInGlobalReplicationGroup(args) = elasticache("RebalanceSlotsInGlobalReplicationGroup", args)

"""
    DescribeSnapshots()

Returns information about cluster or replication group snapshots. By default, DescribeSnapshots lists all of your snapshots; it can optionally describe a single snapshot, or just the snapshots associated with a particular cache cluster.  This operation is valid for Redis only. 

Optional Parameters
{
  "ShowNodeGroupConfig": "A Boolean value which if true, the node group (shard) configuration is included in the snapshot description.",
  "SnapshotName": "A user-supplied name of the snapshot. If this parameter is specified, only this snapshot are described.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 50 Constraints: minimum 20; maximum 50.",
  "CacheClusterId": "A user-supplied cluster identifier. If this parameter is specified, only snapshots associated with that specific cluster are described.",
  "ReplicationGroupId": "A user-supplied replication group identifier. If this parameter is specified, only snapshots associated with that specific replication group are described.",
  "SnapshotSource": "If set to system, the output shows snapshots that were automatically created by ElastiCache. If set to user the output shows snapshots that were manually created. If omitted, the output shows both automatically and manually created snapshots."
}
"""
DescribeSnapshots() = elasticache("DescribeSnapshots")
DescribeSnapshots(args) = elasticache("DescribeSnapshots", args)

"""
    DescribeCacheEngineVersions()

Returns a list of the available cache engines and their versions.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "EngineVersion": "The cache engine version to return. Example: 1.4.14 ",
  "Engine": "The cache engine to return. Valid values: memcached | redis ",
  "CacheParameterGroupFamily": "The name of a specific cache parameter group family to return details for. Valid values are: memcached1.4 | memcached1.5 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 |  Constraints:   Must be 1 to 255 alphanumeric characters   First character must be a letter   Cannot end with a hyphen or contain two consecutive hyphens  ",
  "DefaultOnly": "If true, specifies that only the default version of the specified engine or engine and major version combination is to be returned."
}
"""
DescribeCacheEngineVersions() = elasticache("DescribeCacheEngineVersions")
DescribeCacheEngineVersions(args) = elasticache("DescribeCacheEngineVersions", args)

"""
    DescribeServiceUpdates()

Returns details of the service updates

Optional Parameters
{
  "ServiceUpdateName": "The unique ID of the service update",
  "MaxRecords": "The maximum number of records to include in the response",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ServiceUpdateStatus": "The status of the service update"
}
"""
DescribeServiceUpdates() = elasticache("DescribeServiceUpdates")
DescribeServiceUpdates(args) = elasticache("DescribeServiceUpdates", args)

"""
    DescribeGlobalReplicationGroups()

Returns information about a particular global replication group. If no identifier is specified, returns information about all Global Datastores. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. ",
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "ShowMemberInfo": "Returns the list of members that comprise the Global Datastore."
}
"""
DescribeGlobalReplicationGroups() = elasticache("DescribeGlobalReplicationGroups")
DescribeGlobalReplicationGroups(args) = elasticache("DescribeGlobalReplicationGroups", args)

"""
    CreateCacheParameterGroup()

Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is a collection of parameters and their values that are applied to all of the nodes in any cluster or replication group using the CacheParameterGroup. A newly created CacheParameterGroup is an exact duplicate of the default parameter group for the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can change the values of specific parameters. For more information, see:    ModifyCacheParameterGroup in the ElastiCache API Reference.    Parameters and Parameter Groups in the ElastiCache User Guide.  

Required Parameters
{
  "Description": "A user-specified description for the cache parameter group.",
  "CacheParameterGroupName": "A user-specified name for the cache parameter group.",
  "CacheParameterGroupFamily": "The name of the cache parameter group family that the cache parameter group can be used with. Valid values are: memcached1.4 | memcached1.5 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 | "
}
"""
CreateCacheParameterGroup(args) = elasticache("CreateCacheParameterGroup", args)

"""
    DeleteCacheCluster()

Deletes a previously provisioned cluster. DeleteCacheCluster deletes all associated cache nodes, node endpoints and the cluster itself. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert this operation. This operation is not valid for:   Redis (cluster mode enabled) clusters   A cluster that is the last read replica of a replication group   A node group (shard) that has Multi-AZ mode enabled   A cluster from a Redis (cluster mode enabled) replication group   A cluster that is not in the available state  

Required Parameters
{
  "CacheClusterId": "The cluster identifier for the cluster to be deleted. This parameter is not case sensitive."
}

Optional Parameters
{
  "FinalSnapshotIdentifier": "The user-supplied name of a final cluster snapshot. This is the unique name that identifies the snapshot. ElastiCache creates the snapshot, and then deletes the cluster immediately afterward."
}
"""
DeleteCacheCluster(args) = elasticache("DeleteCacheCluster", args)

"""
    FailoverGlobalReplicationGroup()

Used to failover the primary region to a selected secondary region.

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "PrimaryRegion": "The AWS region of the primary cluster of the Global Datastore",
  "PrimaryReplicationGroupId": "The name of the primary replication group"
}
"""
FailoverGlobalReplicationGroup(args) = elasticache("FailoverGlobalReplicationGroup", args)

"""
    StartMigration()

Start the migration of data.

Required Parameters
{
  "ReplicationGroupId": "The ID of the replication group to which data should be migrated.",
  "CustomerNodeEndpointList": "List of endpoints from which data should be migrated. For Redis (cluster mode disabled), list should have only one element."
}
"""
StartMigration(args) = elasticache("StartMigration", args)

"""
    DescribeCacheSecurityGroups()

Returns a list of cache security group descriptions. If a cache security group name is specified, the list contains only the description of that group. This applicable only when you have ElastiCache in Classic setup 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "CacheSecurityGroupName": "The name of the cache security group to return details for."
}
"""
DescribeCacheSecurityGroups() = elasticache("DescribeCacheSecurityGroups")
DescribeCacheSecurityGroups(args) = elasticache("DescribeCacheSecurityGroups", args)

"""
    DecreaseReplicaCount()

Dynamically decreases the number of replicas in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.

Required Parameters
{
  "ApplyImmediately": "If True, the number of replica nodes is decreased immediately. ApplyImmediately=False is not currently supported.",
  "ReplicationGroupId": "The id of the replication group from which you want to remove replica nodes."
}

Optional Parameters
{
  "NewReplicaCount": "The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups. The minimum number of replicas in a shard or replication group is:   Redis (cluster mode disabled)   If Multi-AZ with Automatic Failover is enabled: 1   If Multi-AZ with Automatic Failover is not enabled: 0     Redis (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node fails)  ",
  "ReplicaConfiguration": "A list of ConfigureShard objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The ConfigureShard has three members: NewReplicaCount, NodeGroupId, and PreferredAvailabilityZones.",
  "ReplicasToRemove": "A list of the node ids to remove from the replication group or node group (shard)."
}
"""
DecreaseReplicaCount(args) = elasticache("DecreaseReplicaCount", args)

"""
    DeleteCacheParameterGroup()

Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is associated with any cache clusters.

Required Parameters
{
  "CacheParameterGroupName": "The name of the cache parameter group to delete.  The specified cache security group must not be associated with any clusters. "
}
"""
DeleteCacheParameterGroup(args) = elasticache("DeleteCacheParameterGroup", args)

"""
    DescribeReservedCacheNodes()

Returns information about reserved cache nodes for this account, or about a specified reserved cache node.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ProductDescription": "The product description filter value. Use this parameter to show only those reservations matching the specified product description.",
  "CacheNodeType": "The cache node type filter value. Use this parameter to show only those reservations matching the specified cache node type. The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.   General purpose:   Current generation:   M5 node types: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge   M4 node types: cache.m4.large, cache.m4.xlarge, cache.m4.2xlarge, cache.m4.4xlarge, cache.m4.10xlarge   T3 node types: cache.t3.micro, cache.t3.small, cache.t3.medium   T2 node types: cache.t2.micro, cache.t2.small, cache.t2.medium    Previous generation: (not recommended)  T1 node types: cache.t1.micro   M1 node types: cache.m1.small, cache.m1.medium, cache.m1.large, cache.m1.xlarge   M3 node types: cache.m3.medium, cache.m3.large, cache.m3.xlarge, cache.m3.2xlarge      Compute optimized:   Previous generation: (not recommended)  C1 node types: cache.c1.xlarge      Memory optimized:   Current generation:   R5 node types: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge   R4 node types: cache.r4.large, cache.r4.xlarge, cache.r4.2xlarge, cache.r4.4xlarge, cache.r4.8xlarge, cache.r4.16xlarge    Previous generation: (not recommended)  M2 node types: cache.m2.xlarge, cache.m2.2xlarge, cache.m2.4xlarge   R3 node types: cache.r3.large, cache.r3.xlarge, cache.r3.2xlarge, cache.r3.4xlarge, cache.r3.8xlarge       Additional node type info    All current generation instance types are created in Amazon VPC by default.   Redis append-only files (AOF) are not supported for T1 or T2 instances.   Redis Multi-AZ with automatic failover is not supported on T1 instances.   Redis configuration variables appendonly and appendfsync are not supported on Redis version 2.8.22 and later.  ",
  "ReservedCacheNodeId": "The reserved cache node identifier filter value. Use this parameter to show only the reservation that matches the specified reservation ID.",
  "ReservedCacheNodesOfferingId": "The offering identifier filter value. Use this parameter to show only purchased reservations matching the specified offering identifier.",
  "Duration": "The duration filter value, specified in years or seconds. Use this parameter to show only reservations for this duration. Valid Values: 1 | 3 | 31536000 | 94608000 ",
  "OfferingType": "The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type. Valid values: \"Light Utilization\"|\"Medium Utilization\"|\"Heavy Utilization\" "
}
"""
DescribeReservedCacheNodes() = elasticache("DescribeReservedCacheNodes")
DescribeReservedCacheNodes(args) = elasticache("DescribeReservedCacheNodes", args)

"""
    ListTagsForResource()

Lists all cost allocation tags currently on the named resource. A cost allocation tag is a key-value pair where the key is case-sensitive and the value is optional. You can use cost allocation tags to categorize and track your AWS costs. If the cluster is not in the available state, ListTagsForResource returns an error. You can have a maximum of 50 cost allocation tags on an ElastiCache resource. For more information, see Monitoring Costs with Tags.

Required Parameters
{
  "ResourceName": "The Amazon Resource Name (ARN) of the resource for which you want the list of tags, for example arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot. For more information about ARNs, see Amazon Resource Names (ARNs) and AWS Service Namespaces."
}
"""
ListTagsForResource(args) = elasticache("ListTagsForResource", args)

"""
    CreateCacheCluster()

Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine software, either Memcached or Redis. This operation is not supported for Redis (cluster mode enabled) clusters.

Required Parameters
{
  "CacheClusterId": "The node group (shard) identifier. This parameter is stored as a lowercase string.  Constraints:    A name must contain from 1 to 50 alphanumeric characters or hyphens.   The first character must be a letter.   A name cannot end with a hyphen or contain two consecutive hyphens.  "
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are: Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are:    sun     mon     tue     wed     thu     fri     sat    Example: sun:23:00-mon:01:30 ",
  "AutoMinorVersionUpgrade": "This parameter is currently disabled.",
  "PreferredAvailabilityZones": "A list of the Availability Zones in which cache nodes are created. The order of the zones in the list is not important. This option is only supported on Memcached.  If you are creating your cluster in an Amazon VPC (recommended) you can only locate nodes in Availability Zones that are associated with the subnets in the selected subnet group. The number of Availability Zones listed must equal the value of NumCacheNodes.  If you want all the nodes in the same Availability Zone, use PreferredAvailabilityZone instead, or repeat the Availability Zone multiple times in the list. Default: System chosen Availability Zones.",
  "CacheSecurityGroupNames": "A list of security group names to associate with this cluster. Use this parameter only when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC).",
  "Tags": "A list of cost allocation tags to be added to this resource.",
  "NotificationTopicArn": "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.  The Amazon SNS topic owner must be the same as the cluster owner. ",
  "CacheParameterGroupName": "The name of the parameter group to associate with this cluster. If this argument is omitted, the default parameter group for the specified engine is used. You cannot use any parameter group which has cluster-enabled='yes' when creating a cluster.",
  "AZMode": "Specifies whether the nodes in this Memcached cluster are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. This parameter is only supported for Memcached clusters. If the AZMode and PreferredAvailabilityZones are not specified, ElastiCache assumes single-az mode.",
  "Engine": "The name of the cache engine to be used for this cluster. Valid values for this parameter are: memcached | redis ",
  "CacheSubnetGroupName": "The name of the subnet group to be used for the cluster. Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).  If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see Subnets and Subnet Groups. ",
  "SnapshotWindow": "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard). Example: 05:00-09:00  If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.  This parameter is only valid if the Engine parameter is redis. ",
  "SecurityGroupIds": "One or more VPC security groups associated with the cluster. Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).",
  "CacheNodeType": "The compute and memory capacity of the nodes in the node group (shard). The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.   General purpose:   Current generation:   M5 node types: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge   M4 node types: cache.m4.large, cache.m4.xlarge, cache.m4.2xlarge, cache.m4.4xlarge, cache.m4.10xlarge   T3 node types: cache.t3.micro, cache.t3.small, cache.t3.medium   T2 node types: cache.t2.micro, cache.t2.small, cache.t2.medium    Previous generation: (not recommended)  T1 node types: cache.t1.micro   M1 node types: cache.m1.small, cache.m1.medium, cache.m1.large, cache.m1.xlarge   M3 node types: cache.m3.medium, cache.m3.large, cache.m3.xlarge, cache.m3.2xlarge      Compute optimized:   Previous generation: (not recommended)  C1 node types: cache.c1.xlarge      Memory optimized:   Current generation:   R5 node types: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge   R4 node types: cache.r4.large, cache.r4.xlarge, cache.r4.2xlarge, cache.r4.4xlarge, cache.r4.8xlarge, cache.r4.16xlarge    Previous generation: (not recommended)  M2 node types: cache.m2.xlarge, cache.m2.2xlarge, cache.m2.4xlarge   R3 node types: cache.r3.large, cache.r3.xlarge, cache.r3.2xlarge, cache.r3.4xlarge, cache.r3.8xlarge       Additional node type info    All current generation instance types are created in Amazon VPC by default.   Redis append-only files (AOF) are not supported for T1 or T2 instances.   Redis Multi-AZ with automatic failover is not supported on T1 instances.   Redis configuration variables appendonly and appendfsync are not supported on Redis version 2.8.22 and later.  ",
  "EngineVersion": "The version number of the cache engine to be used for this cluster. To view the supported cache engine versions, use the DescribeCacheEngineVersions operation.  Important: You can upgrade to a newer engine version (see Selecting a Cache Engine and Version), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. ",
  "Port": "The port number on which each of the cache nodes accepts connections.",
  "PreferredAvailabilityZone": "The EC2 Availability Zone in which the cluster is created. All nodes belonging to this Memcached cluster are placed in the preferred Availability Zone. If you want to create your nodes across multiple Availability Zones, use PreferredAvailabilityZones. Default: System chosen Availability Zone.",
  "SnapshotRetentionLimit": "The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, a snapshot taken today is retained for 5 days before being deleted.  This parameter is only valid if the Engine parameter is redis.  Default: 0 (i.e., automatic backups are disabled for this cache cluster).",
  "SnapshotName": "The name of a Redis snapshot from which to restore data into the new node group (shard). The snapshot status changes to restoring while the new node group (shard) is being created.  This parameter is only valid if the Engine parameter is redis. ",
  "SnapshotArns": "A single-element string list containing an Amazon Resource Name (ARN) that uniquely identifies a Redis RDB snapshot file stored in Amazon S3. The snapshot file is used to populate the node group (shard). The Amazon S3 object name in the ARN cannot contain any commas.  This parameter is only valid if the Engine parameter is redis.  Example of an Amazon S3 ARN: arn:aws:s3:::my_bucket/snapshot1.rdb ",
  "NumCacheNodes": "The initial number of cache nodes that the cluster has. For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20. If you need more than 20 nodes for your Memcached cluster, please fill out the ElastiCache Limit Increase Request form at http://aws.amazon.com/contact-us/elasticache-node-limit-request/.",
  "ReplicationGroupId": "The ID of the replication group to which this cluster should belong. If this parameter is specified, the cluster is added to the specified replication group as a read replica; otherwise, the cluster is a standalone primary that is not part of any replication group. If the specified replication group is Multi-AZ enabled and the Availability Zone is not specified, the cluster is created in Availability Zones that provide the best spread of read replicas across Availability Zones.  This parameter is only valid if the Engine parameter is redis. ",
  "AuthToken": " Reserved parameter. The password used to access a password protected server. Password constraints:   Must be only printable ASCII characters.   Must be at least 16 characters and no more than 128 characters in length.   The only permitted printable special characters are !, &amp;, #,  , ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.   For more information, see AUTH password at http://redis.io/commands/AUTH."
}
"""
CreateCacheCluster(args) = elasticache("CreateCacheCluster", args)

"""
    DescribeCacheParameters()

Returns the detailed parameter list for a particular cache parameter group.

Required Parameters
{
  "CacheParameterGroupName": "The name of a specific cache parameter group to return details for."
}

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Source": "The parameter types to return. Valid values: user | system | engine-default "
}
"""
DescribeCacheParameters(args) = elasticache("DescribeCacheParameters", args)

"""
    AddTagsToResource()

Adds up to 50 cost allocation tags to the named resource. A cost allocation tag is a key-value pair where the key and value are case-sensitive. You can use cost allocation tags to categorize and track your AWS costs.  When you apply tags to your ElastiCache resources, AWS generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by your tags. You can apply tags that represent business categories (such as cost centers, application names, or owners) to organize your costs across multiple services. For more information, see Using Cost Allocation Tags in Amazon ElastiCache in the ElastiCache User Guide.

Required Parameters
{
  "Tags": "A list of cost allocation tags to be added to this resource. A tag is a key-value pair. A tag key must be accompanied by a tag value.",
  "ResourceName": "The Amazon Resource Name (ARN) of the resource to which the tags are to be added, for example arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot. ElastiCache resources are cluster and snapshot. For more information about ARNs, see Amazon Resource Names (ARNs) and AWS Service Namespaces."
}
"""
AddTagsToResource(args) = elasticache("AddTagsToResource", args)

"""
    RemoveTagsFromResource()

Removes the tags identified by the TagKeys list from the named resource.

Required Parameters
{
  "ResourceName": "The Amazon Resource Name (ARN) of the resource from which you want the tags removed, for example arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot. For more information about ARNs, see Amazon Resource Names (ARNs) and AWS Service Namespaces.",
  "TagKeys": "A list of TagKeys identifying the tags you want removed from the named resource."
}
"""
RemoveTagsFromResource(args) = elasticache("RemoveTagsFromResource", args)

"""
    PurchaseReservedCacheNodesOffering()

Allows you to purchase a reserved cache node offering.

Required Parameters
{
  "ReservedCacheNodesOfferingId": "The ID of the reserved cache node offering to purchase. Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706 "
}

Optional Parameters
{
  "CacheNodeCount": "The number of cache node instances to reserve. Default: 1 ",
  "ReservedCacheNodeId": "A customer-specified identifier to track this reservation.  The Reserved Cache Node ID is an unique customer-specified identifier to track this reservation. If this parameter is not specified, ElastiCache automatically generates an identifier for the reservation.  Example: myreservationID"
}
"""
PurchaseReservedCacheNodesOffering(args) = elasticache("PurchaseReservedCacheNodesOffering", args)

"""
    BatchStopUpdateAction()

Stop the service update. For more information on service updates and stopping them, see Stopping Service Updates.

Required Parameters
{
  "ServiceUpdateName": "The unique ID of the service update"
}

Optional Parameters
{
  "CacheClusterIds": "The cache cluster IDs",
  "ReplicationGroupIds": "The replication group IDs"
}
"""
BatchStopUpdateAction(args) = elasticache("BatchStopUpdateAction", args)

"""
    ModifyReplicationGroupShardConfiguration()

Modifies a replication group's shards (node groups) by allowing you to add shards, remove shards, or rebalance the keyspaces among exisiting shards.

Required Parameters
{
  "NodeGroupCount": "The number of node groups (shards) that results from the modification of the shard configuration.",
  "ApplyImmediately": "Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is true. Value: true",
  "ReplicationGroupId": "The name of the Redis (cluster mode enabled) cluster (replication group) on which the shards are to be configured."
}

Optional Parameters
{
  "ReshardingConfiguration": "Specifies the preferred availability zones for each node group in the cluster. If the value of NodeGroupCount is greater than the current number of node groups (shards), you can use this parameter to specify the preferred availability zones of the cluster's shards. If you omit this parameter ElastiCache selects availability zones for you. You can specify this parameter only if the value of NodeGroupCount is greater than the current number of node groups (shards).",
  "NodeGroupsToRemove": "If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster.",
  "NodeGroupsToRetain": "If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRetain is a list of NodeGroupIds to retain in the cluster. ElastiCache for Redis will attempt to remove all node groups except those listed by NodeGroupsToRetain from the cluster."
}
"""
ModifyReplicationGroupShardConfiguration(args) = elasticache("ModifyReplicationGroupShardConfiguration", args)

"""
    DeleteSnapshot()

Deletes an existing snapshot. When you receive a successful response from this operation, ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this operation.  This operation is valid for Redis only. 

Required Parameters
{
  "SnapshotName": "The name of the snapshot to be deleted."
}
"""
DeleteSnapshot(args) = elasticache("DeleteSnapshot", args)

"""
    DescribeReservedCacheNodesOfferings()

Lists available reserved cache node offerings.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ProductDescription": "The product description filter value. Use this parameter to show only the available offerings matching the specified product description.",
  "CacheNodeType": "The cache node type filter value. Use this parameter to show only the available offerings matching the specified cache node type. The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.   General purpose:   Current generation:   M5 node types: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge   M4 node types: cache.m4.large, cache.m4.xlarge, cache.m4.2xlarge, cache.m4.4xlarge, cache.m4.10xlarge   T3 node types: cache.t3.micro, cache.t3.small, cache.t3.medium   T2 node types: cache.t2.micro, cache.t2.small, cache.t2.medium    Previous generation: (not recommended)  T1 node types: cache.t1.micro   M1 node types: cache.m1.small, cache.m1.medium, cache.m1.large, cache.m1.xlarge   M3 node types: cache.m3.medium, cache.m3.large, cache.m3.xlarge, cache.m3.2xlarge      Compute optimized:   Previous generation: (not recommended)  C1 node types: cache.c1.xlarge      Memory optimized:   Current generation:   R5 node types: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge   R4 node types: cache.r4.large, cache.r4.xlarge, cache.r4.2xlarge, cache.r4.4xlarge, cache.r4.8xlarge, cache.r4.16xlarge    Previous generation: (not recommended)  M2 node types: cache.m2.xlarge, cache.m2.2xlarge, cache.m2.4xlarge   R3 node types: cache.r3.large, cache.r3.xlarge, cache.r3.2xlarge, cache.r3.4xlarge, cache.r3.8xlarge       Additional node type info    All current generation instance types are created in Amazon VPC by default.   Redis append-only files (AOF) are not supported for T1 or T2 instances.   Redis Multi-AZ with automatic failover is not supported on T1 instances.   Redis configuration variables appendonly and appendfsync are not supported on Redis version 2.8.22 and later.  ",
  "ReservedCacheNodesOfferingId": "The offering identifier filter value. Use this parameter to show only the available offering that matches the specified reservation identifier. Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706 ",
  "Duration": "Duration filter value, specified in years or seconds. Use this parameter to show only reservations for a given duration. Valid Values: 1 | 3 | 31536000 | 94608000 ",
  "OfferingType": "The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type. Valid Values: \"Light Utilization\"|\"Medium Utilization\"|\"Heavy Utilization\" "
}
"""
DescribeReservedCacheNodesOfferings() = elasticache("DescribeReservedCacheNodesOfferings")
DescribeReservedCacheNodesOfferings(args) = elasticache("DescribeReservedCacheNodesOfferings", args)

"""
    RebootCacheCluster()

Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any modified cache parameter groups to the cluster. The reboot operation takes place as soon as possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is set to REBOOTING. The reboot causes the contents of the cache (for each cache node being rebooted) to be lost. When the reboot is complete, a cluster event is created. Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled) clusters. If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied, see Rebooting a Cluster for an alternate process.

Required Parameters
{
  "CacheClusterId": "The cluster identifier. This parameter is stored as a lowercase string.",
  "CacheNodeIdsToReboot": "A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache node IDs."
}
"""
RebootCacheCluster(args) = elasticache("RebootCacheCluster", args)

"""
    AuthorizeCacheSecurityGroupIngress()

Allows network ingress to a cache security group. Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism.  You cannot authorize ingress from an Amazon EC2 security group in one region to an ElastiCache cluster in another region. 

Required Parameters
{
  "EC2SecurityGroupOwnerId": "The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.",
  "CacheSecurityGroupName": "The cache security group that allows network ingress.",
  "EC2SecurityGroupName": "The Amazon EC2 security group to be authorized for ingress to the cache security group."
}
"""
AuthorizeCacheSecurityGroupIngress(args) = elasticache("AuthorizeCacheSecurityGroupIngress", args)

"""
    DecreaseNodeGroupsInGlobalReplicationGroup()

Decreases the number of node groups in a Global Datastore

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "NodeGroupCount": "The number of node groups (shards) that results from the modification of the shard configuration",
  "ApplyImmediately": "Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is true. "
}

Optional Parameters
{
  "GlobalNodeGroupsToRetain": "If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. ",
  "GlobalNodeGroupsToRemove": "If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. "
}
"""
DecreaseNodeGroupsInGlobalReplicationGroup(args) = elasticache("DecreaseNodeGroupsInGlobalReplicationGroup", args)

"""
    DescribeEvents()

Returns events related to clusters, cache security groups, and cache parameter groups. You can obtain events specific to a particular cluster, cache security group, or cache parameter group by providing the name as a parameter. By default, only the events occurring within the last hour are returned; however, you can retrieve up to 14 days' worth of events if necessary.

Optional Parameters
{
  "StartTime": "The beginning of the time interval to retrieve events for, specified in ISO 8601 format.  Example: 2017-03-30T07:03:49.555Z",
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "SourceIdentifier": "The identifier of the event source for which events are returned. If not specified, all sources are included in the response.",
  "EndTime": "The end of the time interval for which to retrieve events, specified in ISO 8601 format.  Example: 2017-03-30T07:03:49.555Z",
  "SourceType": "The event source to retrieve events for. If no value is specified, all events are returned.",
  "Duration": "The number of minutes worth of events to retrieve."
}
"""
DescribeEvents() = elasticache("DescribeEvents")
DescribeEvents(args) = elasticache("DescribeEvents", args)

"""
    DescribeEngineDefaultParameters()

Returns the default engine and system parameter information for the specified cache engine.

Required Parameters
{
  "CacheParameterGroupFamily": "The name of the cache parameter group family. Valid values are: memcached1.4 | memcached1.5 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 | "
}

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords."
}
"""
DescribeEngineDefaultParameters(args) = elasticache("DescribeEngineDefaultParameters", args)

"""
    CompleteMigration()

Complete the migration of data.

Required Parameters
{
  "ReplicationGroupId": "The ID of the replication group to which data is being migrated."
}

Optional Parameters
{
  "Force": "Forces the migration to stop without ensuring that data is in sync. It is recommended to use this option only to abort the migration and not recommended when application wants to continue migration to ElastiCache."
}
"""
CompleteMigration(args) = elasticache("CompleteMigration", args)

"""
    CreateSnapshot()

Creates a copy of an entire cluster or replication group at a specific moment in time.  This operation is valid for Redis only. 

Required Parameters
{
  "SnapshotName": "A name for the snapshot being created."
}

Optional Parameters
{
  "CacheClusterId": "The identifier of an existing cluster. The snapshot is created from this cluster.",
  "ReplicationGroupId": "The identifier of an existing replication group. The snapshot is created from this replication group.",
  "KmsKeyId": "The ID of the KMS key used to encrypt the snapshot."
}
"""
CreateSnapshot(args) = elasticache("CreateSnapshot", args)

"""
    CopySnapshot()

Makes a copy of an existing snapshot.  This operation is valid for Redis only.   Users or groups that have permissions to use the CopySnapshot operation can create their own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control who has the ability to use the CopySnapshot operation. For more information about using IAM to control the use of ElastiCache operations, see Exporting Snapshots and Authentication &amp; Access Control.  You could receive the following error messages.  Error Messages     Error Message: The S3 bucket %s is outside of the region.  Solution: Create an Amazon S3 bucket in the same region as your snapshot. For more information, see Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.    Error Message: The S3 bucket %s does not exist.  Solution: Create an Amazon S3 bucket in the same region as your snapshot. For more information, see Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.    Error Message: The S3 bucket %s is not owned by the authenticated user.  Solution: Create an Amazon S3 bucket in the same region as your snapshot. For more information, see Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.    Error Message: The authenticated user does not have sufficient permissions to perform the desired activity.  Solution: Contact your system administrator to get the needed permissions.    Error Message: The S3 bucket %s already contains an object with key %s.  Solution: Give the TargetSnapshotName a new and unique value. If exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for TargetSnapshotName.    Error Message:  ElastiCache has not been granted READ permissions %s on the S3 Bucket.  Solution: Add List and Read permissions on the bucket. For more information, see Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.    Error Message:  ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.  Solution: Add Upload/Delete permissions on the bucket. For more information, see Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.    Error Message:  ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.  Solution: Add View Permissions on the bucket. For more information, see Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.  

Required Parameters
{
  "TargetSnapshotName": "A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, therefore this name must be unique within its context - ElastiCache or an Amazon S3 bucket if exporting.",
  "SourceSnapshotName": "The name of an existing snapshot from which to make a copy."
}

Optional Parameters
{
  "TargetBucket": "The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when exporting a snapshot for external access. When using this parameter to export a snapshot, be sure Amazon ElastiCache has the needed permissions to this S3 bucket. For more information, see Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the Amazon ElastiCache User Guide. For more information, see Exporting a Snapshot in the Amazon ElastiCache User Guide.",
  "KmsKeyId": "The ID of the KMS key used to encrypt the target snapshot."
}
"""
CopySnapshot(args) = elasticache("CopySnapshot", args)

"""
    DescribeUpdateActions()

Returns details of the update actions 

Optional Parameters
{
  "ServiceUpdateName": "The unique ID of the service update",
  "MaxRecords": "The maximum number of records to include in the response",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ServiceUpdateTimeRange": "The range of time specified to search for service updates that are in available status",
  "ShowNodeLevelUpdateStatus": "Dictates whether to include node level update status in the response ",
  "UpdateActionStatus": "The status of the update action.",
  "Engine": "The Elasticache engine to which the update applies. Either Redis or Memcached ",
  "CacheClusterIds": "The cache cluster IDs",
  "ReplicationGroupIds": "The replication group IDs",
  "ServiceUpdateStatus": "The status of the service update"
}
"""
DescribeUpdateActions() = elasticache("DescribeUpdateActions")
DescribeUpdateActions(args) = elasticache("DescribeUpdateActions", args)

"""
    IncreaseReplicaCount()

Dynamically increases the number of replics in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.

Required Parameters
{
  "ApplyImmediately": "If True, the number of replica nodes is increased immediately. ApplyImmediately=False is not currently supported.",
  "ReplicationGroupId": "The id of the replication group to which you want to add replica nodes."
}

Optional Parameters
{
  "NewReplicaCount": "The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups.",
  "ReplicaConfiguration": "A list of ConfigureShard objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The ConfigureShard has three members: NewReplicaCount, NodeGroupId, and PreferredAvailabilityZones."
}
"""
IncreaseReplicaCount(args) = elasticache("IncreaseReplicaCount", args)

"""
    DescribeCacheClusters()

Returns information about all provisioned clusters if no cluster identifier is specified, or about a specific cache cluster if a cluster identifier is supplied. By default, abbreviated information about the clusters is returned. You can use the optional ShowCacheNodeInfo flag to retrieve detailed information about the cache nodes associated with the clusters. These details include the DNS address and port for the cache node endpoint. If the cluster is in the creating state, only cluster-level information is displayed until all of the nodes are successfully provisioned. If the cluster is in the deleting state, only cluster-level information is displayed. If cache nodes are currently being added to the cluster, node endpoint information and creation time for the additional nodes are not displayed until they are completely provisioned. When the cluster state is available, the cluster is ready for use. If cache nodes are currently being removed from the cluster, no endpoint information for the removed nodes is displayed.

Optional Parameters
{
  "ShowCacheNodeInfo": "An optional flag that can be included in the DescribeCacheCluster request to retrieve information about the individual cache nodes.",
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: minimum 20; maximum 100.",
  "Marker": "An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ShowCacheClustersNotInReplicationGroups": "An optional flag that can be included in the DescribeCacheCluster request to show only nodes (API/CLI: clusters) that are not members of a replication group. In practice, this mean Memcached and single node Redis clusters.",
  "CacheClusterId": "The user-supplied cluster identifier. If this parameter is specified, only information about that specific cluster is returned. This parameter isn't case sensitive."
}
"""
DescribeCacheClusters() = elasticache("DescribeCacheClusters")
DescribeCacheClusters(args) = elasticache("DescribeCacheClusters", args)

"""
    DeleteGlobalReplicationGroup()

Deleting a Global Datastore is a two-step process:    First, you must DisassociateGlobalReplicationGroup to remove the secondary clusters in the Global Datastore.   Once the Global Datastore contains only the primary cluster, you can use DeleteGlobalReplicationGroup API to delete the Global Datastore while retainining the primary cluster using Retain…= true.   Since the Global Datastore has only a primary cluster, you can delete the Global Datastore while retaining the primary by setting RetainPrimaryCluster=true. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.  This operation is valid for Redis only. 

Required Parameters
{
  "GlobalReplicationGroupId": "The name of the Global Datastore",
  "RetainPrimaryReplicationGroup": "If set to true, the primary replication is retained as a standalone replication group. "
}
"""
DeleteGlobalReplicationGroup(args) = elasticache("DeleteGlobalReplicationGroup", args)

"""
    RevokeCacheSecurityGroupIngress()

Revokes ingress from a cache security group. Use this operation to disallow access from an Amazon EC2 security group that had been previously authorized.

Required Parameters
{
  "EC2SecurityGroupOwnerId": "The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.",
  "CacheSecurityGroupName": "The name of the cache security group to revoke ingress from.",
  "EC2SecurityGroupName": "The name of the Amazon EC2 security group to revoke access from."
}
"""
RevokeCacheSecurityGroupIngress(args) = elasticache("RevokeCacheSecurityGroupIngress", args)

"""
    ListAllowedNodeTypeModifications()

Lists all available node types that you can scale your Redis cluster's or replication group's current node type. When you use the ModifyCacheCluster or ModifyReplicationGroup operations to scale your cluster or replication group, the value of the CacheNodeType parameter must be one of the node types returned by this operation.

Optional Parameters
{
  "CacheClusterId": "The name of the cluster you want to scale up to a larger node instanced type. ElastiCache uses the cluster id to identify the current node type of this cluster and from that to create a list of node types you can scale up to.  You must provide a value for either the CacheClusterId or the ReplicationGroupId. ",
  "ReplicationGroupId": "The name of the replication group want to scale up to a larger node type. ElastiCache uses the replication group id to identify the current node type being used by this replication group, and from that to create a list of node types you can scale up to.  You must provide a value for either the CacheClusterId or the ReplicationGroupId. "
}
"""
ListAllowedNodeTypeModifications() = elasticache("ListAllowedNodeTypeModifications")
ListAllowedNodeTypeModifications(args) = elasticache("ListAllowedNodeTypeModifications", args)

"""
    TestFailover()

Represents the input of a TestFailover operation which test automatic failover on a specified node group (called shard in the console) in a replication group (called cluster in the console).  Note the following    A customer can use this operation to test automatic failover on up to 5 shards (called node groups in the ElastiCache API and AWS CLI) in any rolling 24-hour period.   If calling this operation on shards in different clusters (called replication groups in the API and CLI), the calls can be made concurrently.     If calling this operation multiple times on different shards in the same Redis (cluster mode enabled) replication group, the first node replacement must complete before a subsequent call can be made.   To determine whether the node replacement is complete you can check Events using the Amazon ElastiCache console, the AWS CLI, or the ElastiCache API. Look for the following automatic failover related events, listed here in order of occurrance:   Replication group message: Test Failover API called for node group &lt;node-group-id&gt;    Cache cluster message: Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed    Replication group message: Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed    Cache cluster message: Recovering cache nodes &lt;node-id&gt;    Cache cluster message: Finished recovery for cache nodes &lt;node-id&gt;    For more information see:    Viewing ElastiCache Events in the ElastiCache User Guide     DescribeEvents in the ElastiCache API Reference     Also see, Testing Multi-AZ with Automatic Failover in the ElastiCache User Guide.

Required Parameters
{
  "ReplicationGroupId": "The name of the replication group (console: cluster) whose automatic failover is being tested by this operation.",
  "NodeGroupId": "The name of the node group (called shard in the console) in this replication group on which automatic failover is to be tested. You may test automatic failover on up to 5 node groups in any rolling 24-hour period."
}
"""
TestFailover(args) = elasticache("TestFailover", args)
