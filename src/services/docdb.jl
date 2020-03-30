include("../AWSServices.jl")
using .AWSServices: docdb

"""
    ListTagsForResource()

Lists all tags on an Amazon DocumentDB resource.

Required Parameters
{
  "ResourceName": "The Amazon DocumentDB resource with tags to be listed. This value is an Amazon Resource Name (ARN)."
}

Optional Parameters
{
  "Filters": "This parameter is not currently supported."
}
"""
ListTagsForResource(args) = docdb("ListTagsForResource", args)

"""
    DeleteDBSubnetGroup()

Deletes a subnet group.  The specified database subnet group must not be associated with any DB instances. 

Required Parameters
{
  "DBSubnetGroupName": "The name of the database subnet group to delete.  You can't delete the default subnet group.  Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup "
}
"""
DeleteDBSubnetGroup(args) = docdb("DeleteDBSubnetGroup", args)

"""
    DescribeDBEngineVersions()

Returns a list of the available engines.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "ListSupportedTimezones": "If this parameter is specified and the requested engine supports the TimeZone parameter for CreateDBInstance, the response includes a list of supported time zones for each engine version. ",
  "EngineVersion": "The database engine version to return. Example: 5.1.49 ",
  "Engine": "The database engine to return.",
  "Filters": "This parameter is not currently supported.",
  "ListSupportedCharacterSets": "If this parameter is specified and the requested engine supports the CharacterSetName parameter for CreateDBInstance, the response includes a list of supported character sets for each engine version. ",
  "DefaultOnly": "Indicates that only the default version of the specified engine or engine and major version combination is returned.",
  "DBParameterGroupFamily": "The name of a specific parameter group family to return details for. Constraints:   If provided, must match an existing DBParameterGroupFamily.  "
}
"""
DescribeDBEngineVersions() = docdb("DescribeDBEngineVersions")
DescribeDBEngineVersions(args) = docdb("DescribeDBEngineVersions", args)

"""
    DeleteDBClusterParameterGroup()

Deletes a specified cluster parameter group. The cluster parameter group to be deleted can't be associated with any clusters.

Required Parameters
{
  "DBClusterParameterGroupName": "The name of the cluster parameter group. Constraints:   Must be the name of an existing cluster parameter group.   You can't delete a default cluster parameter group.   Cannot be associated with any clusters.  "
}
"""
DeleteDBClusterParameterGroup(args) = docdb("DeleteDBClusterParameterGroup", args)

"""
    DescribeDBInstances()

Returns information about provisioned Amazon DocumentDB instances. This API supports pagination.

Optional Parameters
{
  "DBInstanceIdentifier": "The user-provided instance identifier. If this parameter is specified, information from only the specific instance is returned. This parameter isn't case sensitive. Constraints:   If provided, must match the identifier of an existing DBInstance.  ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Filters": "A filter that specifies one or more instances to describe. Supported filters:    db-cluster-id - Accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The results list includes only the information about the instances that are associated with the clusters that are identified by these ARNs.    db-instance-id - Accepts instance identifiers and instance ARNs. The results list includes only the information about the instances that are identified by these ARNs.  "
}
"""
DescribeDBInstances() = docdb("DescribeDBInstances")
DescribeDBInstances(args) = docdb("DescribeDBInstances", args)

"""
    DescribeOrderableDBInstanceOptions()

Returns a list of orderable instance options for the specified engine.

Required Parameters
{
  "Engine": "The name of the engine to retrieve instance options for."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "EngineVersion": "The engine version filter value. Specify this parameter to show only the available offerings that match the specified engine version.",
  "LicenseModel": "The license model filter value. Specify this parameter to show only the available offerings that match the specified license model.",
  "Vpc": "The virtual private cloud (VPC) filter value. Specify this parameter to show only the available VPC or non-VPC offerings.",
  "DBInstanceClass": "The instance class filter value. Specify this parameter to show only the available offerings that match the specified instance class.",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeOrderableDBInstanceOptions(args) = docdb("DescribeOrderableDBInstanceOptions", args)

"""
    DescribeDBClusterParameters()

Returns the detailed parameter list for a particular cluster parameter group.

Required Parameters
{
  "DBClusterParameterGroupName": "The name of a specific cluster parameter group to return parameter details for. Constraints:   If provided, must match the name of an existing DBClusterParameterGroup.  "
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Source": " A value that indicates to return only parameters for a specific source. Parameter sources can be engine, service, or customer. ",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeDBClusterParameters(args) = docdb("DescribeDBClusterParameters", args)

"""
    DescribeDBClusterSnapshotAttributes()

Returns a list of cluster snapshot attribute names and values for a manual DB cluster snapshot. When you share snapshots with other AWS accounts, DescribeDBClusterSnapshotAttributes returns the restore attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual cluster snapshot. If all is included in the list of values for the restore attribute, then the manual cluster snapshot is public and can be copied or restored by all AWS accounts.

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier for the cluster snapshot to describe the attributes for."
}
"""
DescribeDBClusterSnapshotAttributes(args) = docdb("DescribeDBClusterSnapshotAttributes", args)

"""
    DescribeEvents()

Returns events related to instances, security groups, snapshots, and DB parameter groups for the past 14 days. You can obtain events specific to a particular DB instance, security group, snapshot, or parameter group by providing the name as a parameter. By default, the events of the past hour are returned.

Optional Parameters
{
  "StartTime": " The beginning of the time interval to retrieve events for, specified in ISO 8601 format.  Example: 2009-07-08T18:00Z",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "SourceIdentifier": "The identifier of the event source for which events are returned. If not specified, then all sources are included in the response. Constraints:   If SourceIdentifier is provided, SourceType must also be provided.   If the source type is DBInstance, a DBInstanceIdentifier must be provided.   If the source type is DBSecurityGroup, a DBSecurityGroupName must be provided.   If the source type is DBParameterGroup, a DBParameterGroupName must be provided.   If the source type is DBSnapshot, a DBSnapshotIdentifier must be provided.   Cannot end with a hyphen or contain two consecutive hyphens.  ",
  "EndTime": " The end of the time interval for which to retrieve events, specified in ISO 8601 format.  Example: 2009-07-08T18:00Z",
  "SourceType": "The event source to retrieve events for. If no value is specified, all events are returned.",
  "Duration": "The number of minutes to retrieve events for. Default: 60",
  "Filters": "This parameter is not currently supported.",
  "EventCategories": "A list of event categories that trigger notifications for an event notification subscription."
}
"""
DescribeEvents() = docdb("DescribeEvents")
DescribeEvents(args) = docdb("DescribeEvents", args)

"""
    FailoverDBCluster()

Forces a failover for a cluster. A failover for a cluster promotes one of the Amazon DocumentDB replicas (read-only instances) in the cluster to be the primary instance (the cluster writer). If the primary instance fails, Amazon DocumentDB automatically fails over to an Amazon DocumentDB replica, if one exists. You can force a failover when you want to simulate a failure of a primary instance for testing.

Optional Parameters
{
  "DBClusterIdentifier": "A cluster identifier to force a failover for. This parameter is not case sensitive. Constraints:   Must match the identifier of an existing DBCluster.  ",
  "TargetDBInstanceIdentifier": "The name of the instance to promote to the primary instance. You must specify the instance identifier for an Amazon DocumentDB replica in the cluster. For example, mydbcluster-replica1."
}
"""
FailoverDBCluster() = docdb("FailoverDBCluster")
FailoverDBCluster(args) = docdb("FailoverDBCluster", args)

"""
    ModifyDBClusterSnapshotAttribute()

Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot. To share a manual cluster snapshot with other AWS accounts, specify restore as the AttributeName, and use the ValuesToAdd parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual cluster snapshot. Use the value all to make the manual cluster snapshot public, which means that it can be copied or restored by all AWS accounts. Do not add the all value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts. If a manual cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter in this case.

Required Parameters
{
  "AttributeName": "The name of the cluster snapshot attribute to modify. To manage authorization for other AWS accounts to copy or restore a manual cluster snapshot, set this value to restore.",
  "DBClusterSnapshotIdentifier": "The identifier for the cluster snapshot to modify the attributes for."
}

Optional Parameters
{
  "ValuesToAdd": "A list of cluster snapshot attributes to add to the attribute specified by AttributeName. To authorize other AWS accounts to copy or restore a manual cluster snapshot, set this list to include one or more AWS account IDs. To make the manual cluster snapshot restorable by any AWS account, set it to all. Do not add the all value for any manual cluster snapshots that contain private information that you don't want to be available to all AWS accounts.",
  "ValuesToRemove": "A list of cluster snapshot attributes to remove from the attribute specified by AttributeName. To remove authorization for other AWS accounts to copy or restore a manual cluster snapshot, set this list to include one or more AWS account identifiers. To remove authorization for any AWS account to copy or restore the cluster snapshot, set it to all . If you specify all, an AWS account whose account ID is explicitly added to the restore attribute can still copy or restore a manual cluster snapshot."
}
"""
ModifyDBClusterSnapshotAttribute(args) = docdb("ModifyDBClusterSnapshotAttribute", args)

"""
    ModifyDBInstance()

Modifies settings for an instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request.

Required Parameters
{
  "DBInstanceIdentifier": "The instance identifier. This value is stored as a lowercase string. Constraints:   Must match the identifier of an existing DBInstance.  "
}

Optional Parameters
{
  "PromotionTier": "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary instance after a failure of the existing primary instance. Default: 1 Valid values: 0-15",
  "NewDBInstanceIdentifier": " The new instance identifier for the instance when renaming an instance. When you change the instance identifier, an instance reboot occurs immediately if you set Apply Immediately to true. It occurs during the next maintenance window if you set Apply Immediately to false. This value is stored as a lowercase string.  Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: mydbinstance ",
  "CACertificateIdentifier": "Indicates the certificate that needs to be associated with the instance.",
  "ApplyImmediately": "Specifies whether the modifications in this request and any pending modifications are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the instance.   If this parameter is set to false, changes to the instance are applied during the next maintenance window. Some parameter changes can cause an outage and are applied on the next reboot. Default: false ",
  "PreferredMaintenanceWindow": "The weekly time range (in UTC) during which system maintenance can occur, which might result in an outage. Changing this parameter doesn't result in an outage except in the following situation, and the change is asynchronously applied as soon as possible. If there are pending actions that cause a reboot, and the maintenance window is changed to include the current time, changing this parameter causes a reboot of the instance. If you are moving this window to the current time, there must be at least 30 minutes between the current time and end of the window to ensure that pending changes are applied. Default: Uses existing setting. Format: ddd:hh24:mi-ddd:hh24:mi  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Must be at least 30 minutes.",
  "AutoMinorVersionUpgrade": "Indicates that minor version upgrades are applied automatically to the instance during the maintenance window. Changing this parameter doesn't result in an outage except in the following case, and the change is asynchronously applied as soon as possible. An outage results if this parameter is set to true during the maintenance window, and a newer minor version is available, and Amazon DocumentDB has enabled automatic patching for that engine version. ",
  "DBInstanceClass": "The new compute and memory capacity of the instance; for example, db.r5.large. Not all instance classes are available in all AWS Regions.  If you modify the instance class, an outage occurs during the change. The change is applied during the next maintenance window, unless ApplyImmediately is specified as true for this request.  Default: Uses existing setting."
}
"""
ModifyDBInstance(args) = docdb("ModifyDBInstance", args)

"""
    StartDBCluster()

Restarts the stopped cluster that is specified by DBClusterIdentifier. For more information, see Stopping and Starting an Amazon DocumentDB Cluster.

Required Parameters
{
  "DBClusterIdentifier": "The identifier of the cluster to restart. Example: docdb-2019-05-28-15-24-52 "
}
"""
StartDBCluster(args) = docdb("StartDBCluster", args)

"""
    AddTagsToResource()

Adds metadata tags to an Amazon DocumentDB resource. You can use these tags with cost allocation reporting to track costs that are associated with Amazon DocumentDB resources. or in a Condition statement in an AWS Identity and Access Management (IAM) policy for Amazon DocumentDB.

Required Parameters
{
  "Tags": "The tags to be assigned to the Amazon DocumentDB resource. ",
  "ResourceName": "The Amazon DocumentDB resource that the tags are added to. This value is an Amazon Resource Name (ARN)."
}
"""
AddTagsToResource(args) = docdb("AddTagsToResource", args)

"""
    StopDBCluster()

Stops the running cluster that is specified by DBClusterIdentifier. The cluster must be in the available state. For more information, see Stopping and Starting an Amazon DocumentDB Cluster.

Required Parameters
{
  "DBClusterIdentifier": "The identifier of the cluster to stop. Example: docdb-2019-05-28-15-24-52 "
}
"""
StopDBCluster(args) = docdb("StopDBCluster", args)

"""
    RemoveTagsFromResource()

Removes metadata tags from an Amazon DocumentDB resource.

Required Parameters
{
  "ResourceName": "The Amazon DocumentDB resource that the tags are removed from. This value is an Amazon Resource Name (ARN).",
  "TagKeys": "The tag key (name) of the tag to be removed."
}
"""
RemoveTagsFromResource(args) = docdb("RemoveTagsFromResource", args)

"""
    CreateDBClusterSnapshot()

Creates a snapshot of a cluster. 

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier of the cluster snapshot. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-cluster-snapshot1 ",
  "DBClusterIdentifier": "The identifier of the cluster to create a snapshot for. This parameter is not case sensitive. Constraints:   Must match the identifier of an existing DBCluster.   Example: my-cluster "
}

Optional Parameters
{
  "Tags": "The tags to be assigned to the cluster snapshot."
}
"""
CreateDBClusterSnapshot(args) = docdb("CreateDBClusterSnapshot", args)

"""
    DescribeEngineDefaultClusterParameters()

Returns the default engine and system parameter information for the cluster database engine.

Required Parameters
{
  "DBParameterGroupFamily": "The name of the cluster parameter group family to return the engine parameter information for."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeEngineDefaultClusterParameters(args) = docdb("DescribeEngineDefaultClusterParameters", args)

"""
    CreateDBCluster()

Creates a new Amazon DocumentDB cluster.

Required Parameters
{
  "DBClusterIdentifier": "The cluster identifier. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-cluster ",
  "Engine": "The name of the database engine to be used for this cluster. Valid values: docdb ",
  "MasterUserPassword": "The password for the master database user. This password can contain any printable ASCII character except forward slash (/), double quote (\"), or the \"at\" symbol (@). Constraints: Must contain from 8 to 100 characters.",
  "MasterUsername": "The name of the master user for the cluster. Constraints:   Must be from 1 to 63 letters or numbers.   The first character must be a letter.   Cannot be a reserved word for the chosen database engine.  "
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.",
  "AvailabilityZones": "A list of Amazon EC2 Availability Zones that instances in the cluster can be created in.",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. You must specify a minimum value of 1. Default: 1 Constraints:   Must be a value from 1 to 35.  ",
  "DBSubnetGroupName": "A subnet group to associate with this cluster. Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup ",
  "Tags": "The tags to be assigned to the cluster.",
  "StorageEncrypted": "Specifies whether the cluster is encrypted.",
  "PreferredBackupWindow": "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "EngineVersion": "The version number of the database engine to use.",
  "DBClusterParameterGroupName": " The name of the cluster parameter group to associate with this cluster.",
  "Port": "The port number on which the instances in the cluster accept connections.",
  "EnableCloudwatchLogsExports": "A list of log types that need to be enabled for exporting to Amazon CloudWatch Logs.",
  "DeletionProtection": "Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects clusters from being accidentally deleted.",
  "VpcSecurityGroupIds": "A list of EC2 VPC security groups to associate with this cluster.",
  "KmsKeyId": "The AWS KMS key identifier for an encrypted cluster. The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS KMS encryption key. If you are creating a cluster using the same AWS account that owns the AWS KMS encryption key that is used to encrypt the new cluster, you can use the AWS KMS key alias instead of the ARN for the AWS KMS encryption key. If an encryption key is not specified in KmsKeyId:   If ReplicationSourceIdentifier identifies an encrypted source, then Amazon DocumentDB uses the encryption key that is used to encrypt the source. Otherwise, Amazon DocumentDB uses your default encryption key.    If the StorageEncrypted parameter is true and ReplicationSourceIdentifier is not specified, Amazon DocumentDB uses your default encryption key.   AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region. If you create a replica of an encrypted cluster in another AWS Region, you must set KmsKeyId to a KMS key ID that is valid in the destination AWS Region. This key is used to encrypt the replica in that AWS Region."
}
"""
CreateDBCluster(args) = docdb("CreateDBCluster", args)

"""
    ResetDBClusterParameterGroup()

 Modifies the parameters of a cluster parameter group to the default value. To reset specific parameters, submit a list of the following: ParameterName and ApplyMethod. To reset the entire cluster parameter group, specify the DBClusterParameterGroupName and ResetAllParameters parameters.   When you reset the entire group, dynamic parameters are updated immediately and static parameters are set to pending-reboot to take effect on the next DB instance reboot.

Required Parameters
{
  "DBClusterParameterGroupName": "The name of the cluster parameter group to reset."
}

Optional Parameters
{
  "Parameters": "A list of parameter names in the cluster parameter group to reset to the default values. You can't use this parameter if the ResetAllParameters parameter is set to true.",
  "ResetAllParameters": "A value that is set to true to reset all parameters in the cluster parameter group to their default values, and false otherwise. You can't use this parameter if there is a list of parameter names specified for the Parameters parameter."
}
"""
ResetDBClusterParameterGroup(args) = docdb("ResetDBClusterParameterGroup", args)

"""
    CreateDBSubnetGroup()

Creates a new subnet group. subnet groups must contain at least one subnet in at least two Availability Zones in the AWS Region.

Required Parameters
{
  "DBSubnetGroupName": "The name for the subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default. Example: mySubnetgroup ",
  "SubnetIds": "The Amazon EC2 subnet IDs for the subnet group.",
  "DBSubnetGroupDescription": "The description for the subnet group."
}

Optional Parameters
{
  "Tags": "The tags to be assigned to the subnet group."
}
"""
CreateDBSubnetGroup(args) = docdb("CreateDBSubnetGroup", args)

"""
    RebootDBInstance()

You might need to reboot your instance, usually for maintenance reasons. For example, if you make certain changes, or if you change the cluster parameter group that is associated with the instance, you must reboot the instance for the changes to take effect.  Rebooting an instance restarts the database engine service. Rebooting an instance results in a momentary outage, during which the instance status is set to rebooting. 

Required Parameters
{
  "DBInstanceIdentifier": "The instance identifier. This parameter is stored as a lowercase string. Constraints:   Must match the identifier of an existing DBInstance.  "
}

Optional Parameters
{
  "ForceFailover": " When true, the reboot is conducted through a Multi-AZ failover.  Constraint: You can't specify true if the instance is not configured for Multi-AZ."
}
"""
RebootDBInstance(args) = docdb("RebootDBInstance", args)

"""
    CreateDBClusterParameterGroup()

Creates a new cluster parameter group. Parameters in a cluster parameter group apply to all of the instances in a DB cluster. A cluster parameter group is initially created with the default parameters for the database engine used by instances in the cluster. To provide custom values for any of the parameters, you must modify the group after you create it. After you create a DB cluster parameter group, you must associate it with your cluster. For the new DB cluster parameter group and associated settings to take effect, you must then reboot the instances in the cluster without failover.  After you create a cluster parameter group, you should wait at least 5 minutes before creating your first cluster that uses that cluster parameter group as the default parameter group. This allows Amazon DocumentDB to fully complete the create action before the cluster parameter group is used as the default for a new cluster. This step is especially important for parameters that are critical when creating the default database for a cluster, such as the character set for the default database defined by the character_set_database parameter. 

Required Parameters
{
  "Description": "The description for the cluster parameter group.",
  "DBClusterParameterGroupName": "The name of the cluster parameter group. Constraints:   Must not match the name of an existing DBClusterParameterGroup.    This value is stored as a lowercase string. ",
  "DBParameterGroupFamily": "The cluster parameter group family name."
}

Optional Parameters
{
  "Tags": "The tags to be assigned to the cluster parameter group."
}
"""
CreateDBClusterParameterGroup(args) = docdb("CreateDBClusterParameterGroup", args)

"""
    DeleteDBInstance()

Deletes a previously provisioned instance. 

Required Parameters
{
  "DBInstanceIdentifier": "The instance identifier for the instance to be deleted. This parameter isn't case sensitive. Constraints:   Must match the name of an existing instance.  "
}
"""
DeleteDBInstance(args) = docdb("DeleteDBInstance", args)

"""
    DescribeEventCategories()

Displays a list of categories for all event source types, or, if specified, for a specified source type. 

Optional Parameters
{
  "SourceType": "The type of source that is generating the events. Valid values: db-instance, db-parameter-group, db-security-group, db-snapshot ",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeEventCategories() = docdb("DescribeEventCategories")
DescribeEventCategories(args) = docdb("DescribeEventCategories", args)

"""
    CopyDBClusterSnapshot()

Copies a snapshot of a cluster. To copy a cluster snapshot from a shared manual cluster snapshot, SourceDBClusterSnapshotIdentifier must be the Amazon Resource Name (ARN) of the shared cluster snapshot. To cancel the copy operation after it is in progress, delete the target cluster snapshot identified by TargetDBClusterSnapshotIdentifier while that DB cluster snapshot is in the copying status.

Required Parameters
{
  "TargetDBClusterSnapshotIdentifier": "The identifier of the new cluster snapshot to create from the source cluster snapshot. This parameter is not case sensitive. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-cluster-snapshot2 ",
  "SourceDBClusterSnapshotIdentifier": "The identifier of the cluster snapshot to copy. This parameter is not case sensitive. You can't copy an encrypted, shared cluster snapshot from one AWS Region to another. Constraints:   Must specify a valid system snapshot in the \"available\" state.   If the source snapshot is in the same AWS Region as the copy, specify a valid snapshot identifier.   If the source snapshot is in a different AWS Region than the copy, specify a valid cluster snapshot ARN.   Example: my-cluster-snapshot1 "
}

Optional Parameters
{
  "Tags": "The tags to be assigned to the cluster snapshot.",
  "PreSignedUrl": "The URL that contains a Signature Version 4 signed request for the CopyDBClusterSnapshot API action in the AWS Region that contains the source cluster snapshot to copy. You must use the PreSignedUrl parameter when copying an encrypted cluster snapshot from another AWS Region. The presigned URL must be a valid request for the CopyDBSClusterSnapshot API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied. The presigned URL request must contain the following parameter values:    KmsKeyId - The AWS KMS key identifier for the key to use to encrypt the copy of the cluster snapshot in the destination AWS Region. This is the same identifier for both the CopyDBClusterSnapshot action that is called in the destination AWS Region, and the action contained in the presigned URL.    DestinationRegion - The name of the AWS Region that the DB cluster snapshot will be created in.    SourceDBClusterSnapshotIdentifier - The cluster snapshot identifier for the encrypted cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted cluster snapshot from the us-west-2 AWS Region, then your SourceDBClusterSnapshotIdentifier looks like the following example: arn:aws:rds:us-west-2:123456789012:cluster-snapshot:my-cluster-snapshot-20161115.  ",
  "CopyTags": "Set to true to copy all tags from the source cluster snapshot to the target cluster snapshot, and otherwise false. The default is false.",
  "KmsKeyId": "The AWS KMS key ID for an encrypted cluster snapshot. The AWS KMS key ID is the Amazon Resource Name (ARN), AWS KMS key identifier, or the AWS KMS key alias for the AWS KMS encryption key.  If you copy an encrypted cluster snapshot from your AWS account, you can specify a value for KmsKeyId to encrypt the copy with a new AWS KMS encryption key. If you don't specify a value for KmsKeyId, then the copy of the cluster snapshot is encrypted with the same AWS KMS key as the source cluster snapshot.  If you copy an encrypted cluster snapshot that is shared from another AWS account, then you must specify a value for KmsKeyId.  To copy an encrypted cluster snapshot to another AWS Region, set KmsKeyId to the AWS KMS key ID that you want to use to encrypt the copy of the cluster snapshot in the destination Region. AWS KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one Region in another Region. If you copy an unencrypted cluster snapshot and specify a value for the KmsKeyId parameter, an error is returned."
}
"""
CopyDBClusterSnapshot(args) = docdb("CopyDBClusterSnapshot", args)

"""
    ModifyDBCluster()

Modifies a setting for an Amazon DocumentDB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. 

Required Parameters
{
  "DBClusterIdentifier": "The cluster identifier for the cluster that is being modified. This parameter is not case sensitive. Constraints:   Must match the identifier of an existing DBCluster.  "
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. You must specify a minimum value of 1. Default: 1 Constraints:   Must be a value from 1 to 35.  ",
  "PreferredBackupWindow": "The daily time range during which automated backups are created if automated backups are enabled, using the BackupRetentionPeriod parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "EngineVersion": "The version number of the database engine to which you want to upgrade. Changing this parameter results in an outage. The change is applied during the next maintenance window unless the ApplyImmediately parameter is set to true.",
  "DBClusterParameterGroupName": "The name of the cluster parameter group to use for the cluster.",
  "MasterUserPassword": "The password for the master database user. This password can contain any printable ASCII character except forward slash (/), double quote (\"), or the \"at\" symbol (@). Constraints: Must contain from 8 to 100 characters.",
  "Port": "The port number on which the cluster accepts connections. Constraints: Must be a value from 1150 to 65535.  Default: The same port as the original cluster.",
  "NewDBClusterIdentifier": "The new cluster identifier for the cluster when renaming a cluster. This value is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-cluster2 ",
  "CloudwatchLogsExportConfiguration": "The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs for a specific instance or cluster. The EnableLogTypes and DisableLogTypes arrays determine which logs are exported (or not exported) to CloudWatch Logs.",
  "ApplyImmediately": "A value that specifies whether the changes in this request and any pending changes are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the cluster. If this parameter is set to false, changes to the cluster are applied during the next maintenance window. The ApplyImmediately parameter affects only the NewDBClusterIdentifier and MasterUserPassword values. If you set this parameter value to false, the changes to the NewDBClusterIdentifier and MasterUserPassword values are applied during the next maintenance window. All other changes are applied immediately, regardless of the value of the ApplyImmediately parameter. Default: false ",
  "VpcSecurityGroupIds": "A list of virtual private cloud (VPC) security groups that the cluster will belong to.",
  "DeletionProtection": "Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects clusters from being accidentally deleted."
}
"""
ModifyDBCluster(args) = docdb("ModifyDBCluster", args)

"""
    DescribeCertificates()

Returns a list of certificate authority (CA) certificates provided by Amazon DocumentDB for this AWS account.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. Default: 100 Constraints:   Minimum: 20   Maximum: 100  ",
  "Marker": "An optional pagination token provided by a previous DescribeCertificates request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Filters": "This parameter is not currently supported.",
  "CertificateIdentifier": "The user-supplied certificate identifier. If this parameter is specified, information for only the specified certificate is returned. If this parameter is omitted, a list of up to MaxRecords certificates is returned. This parameter is not case sensitive. Constraints   Must match an existing CertificateIdentifier.  "
}
"""
DescribeCertificates() = docdb("DescribeCertificates")
DescribeCertificates(args) = docdb("DescribeCertificates", args)

"""
    DescribeDBClusters()

Returns information about provisioned Amazon DocumentDB clusters. This API operation supports pagination. For certain management features such as cluster and instance lifecycle management, Amazon DocumentDB leverages operational technology that is shared with Amazon RDS and Amazon Neptune. Use the filterName=engine,Values=docdb filter parameter to return only Amazon DocumentDB clusters.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "DBClusterIdentifier": "The user-provided cluster identifier. If this parameter is specified, information from only the specific cluster is returned. This parameter isn't case sensitive. Constraints:   If provided, must match an existing DBClusterIdentifier.  ",
  "Filters": "A filter that specifies one or more clusters to describe. Supported filters:    db-cluster-id - Accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The results list only includes information about the clusters identified by these ARNs.  "
}
"""
DescribeDBClusters() = docdb("DescribeDBClusters")
DescribeDBClusters(args) = docdb("DescribeDBClusters", args)

"""
    DeleteDBClusterSnapshot()

Deletes a cluster snapshot. If the snapshot is being copied, the copy operation is terminated.  The cluster snapshot must be in the available state to be deleted. 

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier of the cluster snapshot to delete. Constraints: Must be the name of an existing cluster snapshot in the available state."
}
"""
DeleteDBClusterSnapshot(args) = docdb("DeleteDBClusterSnapshot", args)

"""
    DescribeDBClusterSnapshots()

Returns information about cluster snapshots. This API operation supports pagination.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "IncludeShared": "Set to true to include shared manual cluster snapshots from other AWS accounts that this AWS account has been given permission to copy or restore, and otherwise false. The default is false.",
  "DBClusterSnapshotIdentifier": "A specific cluster snapshot identifier to describe. This parameter can't be used with the DBClusterIdentifier parameter. This value is stored as a lowercase string.  Constraints:   If provided, must match the identifier of an existing DBClusterSnapshot.   If this identifier is for an automated snapshot, the SnapshotType parameter must also be specified.  ",
  "DBClusterIdentifier": "The ID of the cluster to retrieve the list of cluster snapshots for. This parameter can't be used with the DBClusterSnapshotIdentifier parameter. This parameter is not case sensitive.  Constraints:   If provided, must match the identifier of an existing DBCluster.  ",
  "SnapshotType": "The type of cluster snapshots to be returned. You can specify one of the following values:    automated - Return all cluster snapshots that Amazon DocumentDB has automatically created for your AWS account.    manual - Return all cluster snapshots that you have manually created for your AWS account.    shared - Return all manual cluster snapshots that have been shared to your AWS account.    public - Return all cluster snapshots that have been marked as public.   If you don't specify a SnapshotType value, then both automated and manual cluster snapshots are returned. You can include shared cluster snapshots with these results by setting the IncludeShared parameter to true. You can include public cluster snapshots with these results by setting the IncludePublic parameter to true. The IncludeShared and IncludePublic parameters don't apply for SnapshotType values of manual or automated. The IncludePublic parameter doesn't apply when SnapshotType is set to shared. The IncludeShared parameter doesn't apply when SnapshotType is set to public.",
  "Filters": "This parameter is not currently supported.",
  "IncludePublic": "Set to true to include manual cluster snapshots that are public and can be copied or restored by any AWS account, and otherwise false. The default is false."
}
"""
DescribeDBClusterSnapshots() = docdb("DescribeDBClusterSnapshots")
DescribeDBClusterSnapshots(args) = docdb("DescribeDBClusterSnapshots", args)

"""
    DescribeDBSubnetGroups()

Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "DBSubnetGroupName": "The name of the subnet group to return details for.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeDBSubnetGroups() = docdb("DescribeDBSubnetGroups")
DescribeDBSubnetGroups(args) = docdb("DescribeDBSubnetGroups", args)

"""
    ModifyDBClusterParameterGroup()

 Modifies the parameters of a cluster parameter group. To modify more than one parameter, submit a list of the following: ParameterName, ParameterValue, and ApplyMethod. A maximum of 20 parameters can be modified in a single request.   Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot or maintenance window before the change can take effect.   After you create a cluster parameter group, you should wait at least 5 minutes before creating your first cluster that uses that cluster parameter group as the default parameter group. This allows Amazon DocumentDB to fully complete the create action before the parameter group is used as the default for a new cluster. This step is especially important for parameters that are critical when creating the default database for a cluster, such as the character set for the default database defined by the character_set_database parameter. 

Required Parameters
{
  "Parameters": "A list of parameters in the cluster parameter group to modify.",
  "DBClusterParameterGroupName": "The name of the cluster parameter group to modify."
}
"""
ModifyDBClusterParameterGroup(args) = docdb("ModifyDBClusterParameterGroup", args)

"""
    RestoreDBClusterFromSnapshot()

Creates a new cluster from a snapshot or cluster snapshot. If a snapshot is specified, the target cluster is created from the source DB snapshot with a default configuration and default security group. If a cluster snapshot is specified, the target cluster is created from the source cluster restore point with the same configuration as the original source DB cluster, except that the new cluster is created with the default security group.

Required Parameters
{
  "DBClusterIdentifier": "The name of the cluster to create from the snapshot or cluster snapshot. This parameter isn't case sensitive. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-snapshot-id ",
  "Engine": "The database engine to use for the new cluster. Default: The same as source. Constraint: Must be compatible with the engine of the source.",
  "SnapshotIdentifier": "The identifier for the snapshot or cluster snapshot to restore from. You can use either the name or the Amazon Resource Name (ARN) to specify a cluster snapshot. However, you can use only the ARN to specify a snapshot. Constraints:   Must match the identifier of an existing snapshot.  "
}

Optional Parameters
{
  "DBSubnetGroupName": "The name of the subnet group to use for the new cluster. Constraints: If provided, must match the name of an existing DBSubnetGroup. Example: mySubnetgroup ",
  "EnableCloudwatchLogsExports": "A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.",
  "Tags": "The tags to be assigned to the restored cluster.",
  "DeletionProtection": "Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects clusters from being accidentally deleted.",
  "EngineVersion": "The version of the database engine to use for the new cluster.",
  "VpcSecurityGroupIds": "A list of virtual private cloud (VPC) security groups that the new cluster will belong to.",
  "KmsKeyId": "The AWS KMS key identifier to use when restoring an encrypted cluster from a DB snapshot or cluster snapshot. The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS KMS encryption key. If you are restoring a cluster with the same AWS account that owns the AWS KMS encryption key used to encrypt the new cluster, then you can use the AWS KMS key alias instead of the ARN for the AWS KMS encryption key. If you do not specify a value for the KmsKeyId parameter, then the following occurs:   If the snapshot or cluster snapshot in SnapshotIdentifier is encrypted, then the restored cluster is encrypted using the AWS KMS key that was used to encrypt the snapshot or the cluster snapshot.   If the snapshot or the cluster snapshot in SnapshotIdentifier is not encrypted, then the restored DB cluster is not encrypted.  ",
  "AvailabilityZones": "Provides the list of Amazon EC2 Availability Zones that instances in the restored DB cluster can be created in.",
  "Port": "The port number on which the new cluster accepts connections. Constraints: Must be a value from 1150 to 65535. Default: The same port as the original cluster."
}
"""
RestoreDBClusterFromSnapshot(args) = docdb("RestoreDBClusterFromSnapshot", args)

"""
    RestoreDBClusterToPointInTime()

Restores a cluster to an arbitrary point in time. Users can restore to any point in time before LatestRestorableTime for up to BackupRetentionPeriod days. The target cluster is created from the source cluster with the same configuration as the original cluster, except that the new cluster is created with the default security group. 

Required Parameters
{
  "DBClusterIdentifier": "The name of the new cluster to be created. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.  ",
  "SourceDBClusterIdentifier": "The identifier of the source cluster from which to restore. Constraints:   Must match the identifier of an existing DBCluster.  "
}

Optional Parameters
{
  "DBSubnetGroupName": "The subnet group name to use for the new cluster. Constraints: If provided, must match the name of an existing DBSubnetGroup. Example: mySubnetgroup ",
  "EnableCloudwatchLogsExports": "A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.",
  "UseLatestRestorableTime": "A value that is set to true to restore the cluster to the latest restorable backup time, and false otherwise.  Default: false  Constraints: Cannot be specified if the RestoreToTime parameter is provided.",
  "Tags": "The tags to be assigned to the restored cluster.",
  "DeletionProtection": "Specifies whether this cluster can be deleted. If DeletionProtection is enabled, the cluster cannot be deleted unless it is modified and DeletionProtection is disabled. DeletionProtection protects clusters from being accidentally deleted.",
  "VpcSecurityGroupIds": "A list of VPC security groups that the new cluster belongs to.",
  "KmsKeyId": "The AWS KMS key identifier to use when restoring an encrypted cluster from an encrypted cluster. The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS KMS encryption key. If you are restoring a cluster with the same AWS account that owns the AWS KMS encryption key used to encrypt the new cluster, then you can use the AWS KMS key alias instead of the ARN for the AWS KMS encryption key. You can restore to a new cluster and encrypt the new cluster with an AWS KMS key that is different from the AWS KMS key used to encrypt the source cluster. The new DB cluster is encrypted with the AWS KMS key identified by the KmsKeyId parameter. If you do not specify a value for the KmsKeyId parameter, then the following occurs:   If the cluster is encrypted, then the restored cluster is encrypted using the AWS KMS key that was used to encrypt the source cluster.   If the cluster is not encrypted, then the restored cluster is not encrypted.   If DBClusterIdentifier refers to a cluster that is not encrypted, then the restore request is rejected.",
  "Port": "The port number on which the new cluster accepts connections. Constraints: Must be a value from 1150 to 65535.  Default: The default port for the engine.",
  "RestoreToTime": "The date and time to restore the cluster to. Valid values: A time in Universal Coordinated Time (UTC) format. Constraints:   Must be before the latest restorable time for the instance.   Must be specified if the UseLatestRestorableTime parameter is not provided.   Cannot be specified if the UseLatestRestorableTime parameter is true.   Cannot be specified if the RestoreType parameter is copy-on-write.   Example: 2015-03-07T23:45:00Z "
}
"""
RestoreDBClusterToPointInTime(args) = docdb("RestoreDBClusterToPointInTime", args)

"""
    DeleteDBCluster()

Deletes a previously provisioned cluster. When you delete a cluster, all automated backups for that cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified cluster are not deleted. 

Required Parameters
{
  "DBClusterIdentifier": "The cluster identifier for the cluster to be deleted. This parameter isn't case sensitive. Constraints:   Must match an existing DBClusterIdentifier.  "
}

Optional Parameters
{
  "SkipFinalSnapshot": " Determines whether a final cluster snapshot is created before the cluster is deleted. If true is specified, no cluster snapshot is created. If false is specified, a cluster snapshot is created before the DB cluster is deleted.   If SkipFinalSnapshot is false, you must specify a FinalDBSnapshotIdentifier parameter.  Default: false ",
  "FinalDBSnapshotIdentifier": " The cluster snapshot identifier of the new cluster snapshot created when SkipFinalSnapshot is set to false.    Specifying this parameter and also setting the SkipFinalShapshot parameter to true results in an error.   Constraints:   Must be from 1 to 255 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.  "
}
"""
DeleteDBCluster(args) = docdb("DeleteDBCluster", args)

"""
    CreateDBInstance()

Creates a new instance.

Required Parameters
{
  "DBInstanceIdentifier": "The instance identifier. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: mydbinstance ",
  "Engine": "The name of the database engine to be used for this instance. Valid value: docdb ",
  "DBClusterIdentifier": "The identifier of the cluster that the instance will belong to.",
  "DBInstanceClass": "The compute and memory capacity of the instance; for example, db.r5.large. "
}

Optional Parameters
{
  "PromotionTier": "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the primary instance after a failure of the existing primary instance. Default: 1 Valid values: 0-15",
  "Tags": "The tags to be assigned to the instance. You can assign up to 10 tags to an instance.",
  "AvailabilityZone": " The Amazon EC2 Availability Zone that the instance is created in. Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.  Example: us-east-1d   Constraint: The AvailabilityZone parameter can't be specified if the MultiAZ parameter is set to true. The specified Availability Zone must be in the same AWS Region as the current endpoint. ",
  "PreferredMaintenanceWindow": "The time range each week during which system maintenance can occur, in Universal Coordinated Time (UTC).  Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.",
  "AutoMinorVersionUpgrade": "Indicates that minor engine upgrades are applied automatically to the instance during the maintenance window. Default: true "
}
"""
CreateDBInstance(args) = docdb("CreateDBInstance", args)

"""
    DescribeDBClusterParameterGroups()

Returns a list of DBClusterParameterGroup descriptions. If a DBClusterParameterGroupName parameter is specified, the list contains only the description of the specified cluster parameter group. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "DBClusterParameterGroupName": "The name of a specific cluster parameter group to return details for. Constraints:   If provided, must match the name of an existing DBClusterParameterGroup.  ",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeDBClusterParameterGroups() = docdb("DescribeDBClusterParameterGroups")
DescribeDBClusterParameterGroups(args) = docdb("DescribeDBClusterParameterGroups", args)

"""
    ApplyPendingMaintenanceAction()

Applies a pending maintenance action to a resource (for example, to a DB instance).

Required Parameters
{
  "ApplyAction": "The pending maintenance action to apply to this resource. Valid values: system-update, db-upgrade ",
  "OptInType": "A value that specifies the type of opt-in request or undoes an opt-in request. An opt-in request of type immediate can't be undone. Valid values:    immediate - Apply the maintenance action immediately.    next-maintenance - Apply the maintenance action during the next maintenance window for the resource.    undo-opt-in - Cancel any existing next-maintenance opt-in requests.  ",
  "ResourceIdentifier": "The Amazon Resource Name (ARN) of the resource that the pending maintenance action applies to."
}
"""
ApplyPendingMaintenanceAction(args) = docdb("ApplyPendingMaintenanceAction", args)

"""
    CopyDBClusterParameterGroup()

Copies the specified cluster parameter group.

Required Parameters
{
  "SourceDBClusterParameterGroupIdentifier": "The identifier or Amazon Resource Name (ARN) for the source cluster parameter group. Constraints:   Must specify a valid cluster parameter group.   If the source cluster parameter group is in the same AWS Region as the copy, specify a valid parameter group identifier; for example, my-db-cluster-param-group, or a valid ARN.   If the source parameter group is in a different AWS Region than the copy, specify a valid cluster parameter group ARN; for example, arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1.  ",
  "TargetDBClusterParameterGroupDescription": "A description for the copied cluster parameter group.",
  "TargetDBClusterParameterGroupIdentifier": "The identifier for the copied cluster parameter group. Constraints:   Cannot be null, empty, or blank.   Must contain from 1 to 255 letters, numbers, or hyphens.   The first character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.   Example: my-cluster-param-group1 "
}

Optional Parameters
{
  "Tags": "The tags that are to be assigned to the parameter group."
}
"""
CopyDBClusterParameterGroup(args) = docdb("CopyDBClusterParameterGroup", args)

"""
    ModifyDBSubnetGroup()

Modifies an existing subnet group. subnet groups must contain at least one subnet in at least two Availability Zones in the AWS Region.

Required Parameters
{
  "DBSubnetGroupName": "The name for the subnet group. This value is stored as a lowercase string. You can't modify the default subnet group.  Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup ",
  "SubnetIds": "The Amazon EC2 subnet IDs for the subnet group."
}

Optional Parameters
{
  "DBSubnetGroupDescription": "The description for the subnet group."
}
"""
ModifyDBSubnetGroup(args) = docdb("ModifyDBSubnetGroup", args)

"""
    DescribePendingMaintenanceActions()

Returns a list of resources (for example, instances) that have at least one pending maintenance action.

Optional Parameters
{
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token (marker) is included in the response so that the remaining results can be retrieved. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Filters": "A filter that specifies one or more resources to return pending maintenance actions for. Supported filters:    db-cluster-id - Accepts cluster identifiers and cluster Amazon Resource Names (ARNs). The results list includes only pending maintenance actions for the clusters identified by these ARNs.    db-instance-id - Accepts instance identifiers and instance ARNs. The results list includes only pending maintenance actions for the DB instances identified by these ARNs.  ",
  "ResourceIdentifier": "The ARN of a resource to return pending maintenance actions for."
}
"""
DescribePendingMaintenanceActions() = docdb("DescribePendingMaintenanceActions")
DescribePendingMaintenanceActions(args) = docdb("DescribePendingMaintenanceActions", args)