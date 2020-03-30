include("../AWSServices.jl")
using .AWSServices: database_migration_service

"""
    CreateEndpoint()

Creates an endpoint using the provided settings.

Required Parameters
{
  "EngineName": "The type of engine for the endpoint. Valid values, depending on the EndpointType value, include \"mysql\", \"oracle\", \"postgres\", \"mariadb\", \"aurora\", \"aurora-postgresql\", \"redshift\", \"s3\", \"db2\", \"azuredb\", \"sybase\", \"dynamodb\", \"mongodb\", \"kinesis\", \"kafka\", \"elasticsearch\", \"documentdb\", and \"sqlserver\".",
  "EndpointType": "The type of endpoint. Valid values are source and target.",
  "EndpointIdentifier": "The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens."
}

Optional Parameters
{
  "Password": "The password to be used to log in to the endpoint database.",
  "DatabaseName": "The name of the endpoint database.",
  "ServiceAccessRoleArn": " The Amazon Resource Name (ARN) for the service access role that you want to use to create the endpoint. ",
  "DmsTransferSettings": "The settings in JSON format for the DMS transfer type of source endpoint.  Possible settings include the following:    ServiceAccessRoleArn - The IAM role that has permission to access the Amazon S3 bucket.    BucketName - The name of the S3 bucket to use.    CompressionType - An optional parameter to use GZIP to compress the target files. To use GZIP, set this value to NONE (the default). To keep the files uncompressed, don't use this value.   Shorthand syntax for these settings is as follows: ServiceAccessRoleArn=string,BucketName=string,CompressionType=string  JSON syntax for these settings is as follows: { \"ServiceAccessRoleArn\": \"string\", \"BucketName\": \"string\", \"CompressionType\": \"none\"|\"gzip\" }  ",
  "CertificateArn": "The Amazon Resource Name (ARN) for the certificate.",
  "KinesisSettings": "Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For information about other available settings, see Using Object Mapping to Migrate Data to a Kinesis Data Stream in the AWS Database Migration User Guide. ",
  "SslMode": "The Secure Sockets Layer (SSL) mode to use for the SSL connection. The default is none ",
  "Username": "The user name to be used to log in to the endpoint database.",
  "Tags": "One or more tags to be assigned to the endpoint.",
  "MongoDbSettings": "Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see the configuration properties section in Using MongoDB as a Target for AWS Database Migration Service in the AWS Database Migration Service User Guide. ",
  "RedshiftSettings": "",
  "S3Settings": "Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS in the AWS Database Migration Service User Guide. ",
  "ElasticsearchSettings": "Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS in the AWS Database Migration User Guide. ",
  "Port": "The port used by the endpoint database.",
  "ExternalTableDefinition": "The external table definition. ",
  "DynamoDbSettings": "Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other available settings, see Using Object Mapping to Migrate Data to DynamoDB in the AWS Database Migration Service User Guide. ",
  "ExtraConnectionAttributes": "Additional attributes associated with the connection. Each attribute is specified as a name-value pair associated by an equal sign (=). Multiple attributes are separated by a semicolon (;) with no additional white space. For information on the attributes available for connecting your source or target endpoint, see Working with AWS DMS Endpoints in the AWS Database Migration Service User Guide. ",
  "KmsKeyId": "An AWS KMS key identifier that is used to encrypt the connection parameters for the endpoint. If you don't specify a value for the KmsKeyId parameter, then AWS DMS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "ServerName": "The name of the server where the endpoint database resides.",
  "KafkaSettings": "Settings in JSON format for the target Apache Kafka endpoint. For information about other available settings, see Using Object Mapping to Migrate Data to Apache Kafka in the AWS Database Migration User Guide. "
}
"""
CreateEndpoint(args) = database_migration_service("CreateEndpoint", args)

"""
    StartReplicationTaskAssessment()

 Starts the replication task assessment for unsupported data types in the source database. 

Required Parameters
{
  "ReplicationTaskArn": " The Amazon Resource Name (ARN) of the replication task. "
}
"""
StartReplicationTaskAssessment(args) = database_migration_service("StartReplicationTaskAssessment", args)

"""
    DeleteReplicationTask()

Deletes the specified replication task.

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) of the replication task to be deleted."
}
"""
DeleteReplicationTask(args) = database_migration_service("DeleteReplicationTask", args)

"""
    TestConnection()

Tests the connection between the replication instance and the endpoint.

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance.",
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}
"""
TestConnection(args) = database_migration_service("TestConnection", args)

"""
    CreateReplicationTask()

Creates a replication task using the specified parameters.

Required Parameters
{
  "TableMappings": "The table mappings for the task, in JSON format. For more information, see Table Mapping in the AWS Database Migration User Guide. ",
  "TargetEndpointArn": "An Amazon Resource Name (ARN) that uniquely identifies the target endpoint.",
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of a replication instance.",
  "SourceEndpointArn": "An Amazon Resource Name (ARN) that uniquely identifies the source endpoint.",
  "MigrationType": "The migration type. Valid values: full-load | cdc | full-load-and-cdc ",
  "ReplicationTaskIdentifier": "An identifier for the replication task. Constraints:   Must contain from 1 to 255 alphanumeric characters or hyphens.   First character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.  "
}

Optional Parameters
{
  "Tags": "One or more tags to be assigned to the replication task.",
  "CdcStopPosition": "Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time. Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12” Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “",
  "ReplicationTaskSettings": "Overall settings for the task, in JSON format. For more information, see Task Settings in the AWS Database Migration User Guide. ",
  "CdcStartTime": "Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”",
  "CdcStartPosition": "Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.  The value can be in date, checkpoint, or LSN/SCN format. Date Example: --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\" LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”  When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the slotName extra connection attribute to the name of this logical replication slot. For more information, see Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS. "
}
"""
CreateReplicationTask(args) = database_migration_service("CreateReplicationTask", args)

"""
    DeleteReplicationSubnetGroup()

Deletes a subnet group.

Required Parameters
{
  "ReplicationSubnetGroupIdentifier": "The subnet group name of the replication instance."
}
"""
DeleteReplicationSubnetGroup(args) = database_migration_service("DeleteReplicationSubnetGroup", args)

"""
    DescribeEventCategories()

Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in Working with Events and Notifications in the AWS Database Migration Service User Guide. 

Optional Parameters
{
  "SourceType": " The type of AWS DMS resource that generates events.  Valid values: replication-instance | replication-task",
  "Filters": "Filters applied to the action."
}
"""
DescribeEventCategories() = database_migration_service("DescribeEventCategories")
DescribeEventCategories(args) = database_migration_service("DescribeEventCategories", args)

"""
    DeleteReplicationInstance()

Deletes the specified replication instance.  You must delete any migration tasks that are associated with the replication instance before you can delete it.  

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance to be deleted."
}
"""
DeleteReplicationInstance(args) = database_migration_service("DeleteReplicationInstance", args)

"""
    RefreshSchemas()

Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance.",
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}
"""
RefreshSchemas(args) = database_migration_service("RefreshSchemas", args)

"""
    DescribeEndpoints()

Returns information about the endpoints for your account in the current region.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the describe action. Valid filter names: endpoint-arn | endpoint-type | endpoint-id | engine-name"
}
"""
DescribeEndpoints() = database_migration_service("DescribeEndpoints")
DescribeEndpoints(args) = database_migration_service("DescribeEndpoints", args)

"""
    DeleteEventSubscription()

 Deletes an AWS DMS event subscription. 

Required Parameters
{
  "SubscriptionName": "The name of the DMS event notification subscription to be deleted."
}
"""
DeleteEventSubscription(args) = database_migration_service("DeleteEventSubscription", args)

"""
    ModifyEventSubscription()

Modifies an existing AWS DMS event notification subscription. 

Required Parameters
{
  "SubscriptionName": "The name of the AWS DMS event notification subscription to be modified."
}

Optional Parameters
{
  "SourceType": " The type of AWS DMS resource that generates the events you want to subscribe to.  Valid values: replication-instance | replication-task",
  "SnsTopicArn": " The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it.",
  "EventCategories": " A list of event categories for a source type that you want to subscribe to. Use the DescribeEventCategories action to see a list of event categories. ",
  "Enabled": " A Boolean value; set to true to activate the subscription. "
}
"""
ModifyEventSubscription(args) = database_migration_service("ModifyEventSubscription", args)

"""
    ModifyReplicationInstance()

Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request. Some settings are applied during the maintenance window. 

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance."
}

Optional Parameters
{
  "AllowMajorVersionUpgrade": "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage, and the change is asynchronously applied as soon as possible. This parameter must be set to true when specifying a value for the EngineVersion parameter that is a different major version than the replication instance's current version.",
  "ReplicationInstanceIdentifier": "The replication instance identifier. This parameter is stored as a lowercase string.",
  "EngineVersion": "The engine version number of the replication instance.",
  "PreferredMaintenanceWindow": "The weekly time range (in UTC) during which system maintenance can occur, which might result in an outage. Changing this parameter does not result in an outage, except in the following situation, and the change is asynchronously applied as soon as possible. If moving this window to the current time, there must be at least 30 minutes between the current time and end of the window to ensure pending changes are applied. Default: Uses existing setting Format: ddd:hh24:mi-ddd:hh24:mi Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun Constraints: Must be at least 30 minutes",
  "ApplyImmediately": "Indicates whether the changes should be applied immediately or during the next maintenance window.",
  "VpcSecurityGroupIds": " Specifies the VPC security group to be used with the replication instance. The VPC security group must work with the VPC containing the replication instance. ",
  "AutoMinorVersionUpgrade": "A value that indicates that minor version upgrades are applied automatically to the replication instance during the maintenance window. Changing this parameter doesn't result in an outage, except in the case dsecribed following. The change is asynchronously applied as soon as possible.  An outage does result if these factors apply:    This parameter is set to true during the maintenance window.   A newer minor version is available.    AWS DMS has enabled automatic patching for the given engine version.   ",
  "ReplicationInstanceClass": "The compute and memory capacity of the replication instance.  Valid Values: dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge  ",
  "MultiAZ": " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the AvailabilityZone parameter if the Multi-AZ parameter is set to true. ",
  "AllocatedStorage": "The amount of storage (in gigabytes) to be allocated for the replication instance."
}
"""
ModifyReplicationInstance(args) = database_migration_service("ModifyReplicationInstance", args)

"""
    DescribeReplicationInstanceTaskLogs()

Returns information about the task logs for the specified task.

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords."
}
"""
DescribeReplicationInstanceTaskLogs(args) = database_migration_service("DescribeReplicationInstanceTaskLogs", args)

"""
    ModifyReplicationTask()

Modifies the specified replication task. You can't modify the task endpoints. The task must be stopped before you can modify it.  For more information about AWS DMS tasks, see Working with Migration Tasks in the AWS Database Migration Service User Guide.

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) of the replication task."
}

Optional Parameters
{
  "TableMappings": "When using the AWS CLI or boto3, provide the path of the JSON file that contains the table mappings. Precede the path with file://. When working with the DMS API, provide the JSON as the parameter value, for example: --table-mappings file://mappingfile.json ",
  "CdcStopPosition": "Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time. Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12” Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “",
  "MigrationType": "The migration type. Valid values: full-load | cdc | full-load-and-cdc ",
  "ReplicationTaskSettings": "JSON file that contains settings for the task, such as target metadata settings.",
  "CdcStartTime": "Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”",
  "ReplicationTaskIdentifier": "The replication task identifier. Constraints:   Must contain from 1 to 255 alphanumeric characters or hyphens.   First character must be a letter.   Cannot end with a hyphen or contain two consecutive hyphens.  ",
  "CdcStartPosition": "Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.  The value can be in date, checkpoint, or LSN/SCN format. Date Example: --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\" LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”  When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the slotName extra connection attribute to the name of this logical replication slot. For more information, see Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS. "
}
"""
ModifyReplicationTask(args) = database_migration_service("ModifyReplicationTask", args)

"""
    CreateEventSubscription()

 Creates an AWS DMS event notification subscription.  You can specify the type of source (SourceType) you want to be notified of, provide a list of AWS DMS source IDs (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. If you specify both the SourceType and SourceIds, such as SourceType = replication-instance and SourceIdentifier = my-replinstance, you will be notified of all the replication instance events for the specified source. If you specify a SourceType but don't specify a SourceIdentifier, you receive notice of the events for that source type for all your AWS DMS sources. If you don't specify either SourceType nor SourceIdentifier, you will be notified of events generated from all AWS DMS sources belonging to your customer account. For more information about AWS DMS events, see Working with Events and Notifications in the AWS Database Migration Service User Guide. 

Required Parameters
{
  "SubscriptionName": "The name of the AWS DMS event notification subscription. This name must be less than 255 characters.",
  "SnsTopicArn": " The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it. "
}

Optional Parameters
{
  "SourceIds": "A list of identifiers for which AWS DMS provides notification events. If you don't specify a value, notifications are provided for all sources. If you specify multiple values, they must be of the same type. For example, if you specify a database instance ID, then all of the other values must be database instance IDs.",
  "Tags": "One or more tags to be assigned to the event subscription.",
  "SourceType": " The type of AWS DMS resource that generates the events. For example, if you want to be notified of events generated by a replication instance, you set this parameter to replication-instance. If this value isn't specified, all events are returned.  Valid values: replication-instance | replication-task ",
  "EventCategories": "A list of event categories for a source type that you want to subscribe to. For more information, see Working with Events and Notifications in the AWS Database Migration Service User Guide. ",
  "Enabled": " A Boolean value; set to true to activate the subscription, or set to false to create the subscription but not activate it. "
}
"""
CreateEventSubscription(args) = database_migration_service("CreateEventSubscription", args)

"""
    DescribeReplicationInstances()

Returns information about replication instances for your account in the current region.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the describe action. Valid filter names: replication-instance-arn | replication-instance-id | replication-instance-class | engine-version"
}
"""
DescribeReplicationInstances() = database_migration_service("DescribeReplicationInstances")
DescribeReplicationInstances(args) = database_migration_service("DescribeReplicationInstances", args)

"""
    StartReplicationTask()

Starts the replication task. For more information about AWS DMS tasks, see Working with Migration Tasks  in the AWS Database Migration Service User Guide. 

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) of the replication task to be started.",
  "StartReplicationTaskType": "The type of replication task."
}

Optional Parameters
{
  "CdcStopPosition": "Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time. Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12” Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “",
  "CdcStartTime": "Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error. Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”",
  "CdcStartPosition": "Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.  The value can be in date, checkpoint, or LSN/SCN format. Date Example: --cdc-start-position “2018-03-08T12:12:12” Checkpoint Example: --cdc-start-position \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\" LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”  When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the slotName extra connection attribute to the name of this logical replication slot. For more information, see Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS. "
}
"""
StartReplicationTask(args) = database_migration_service("StartReplicationTask", args)

"""
    StopReplicationTask()

Stops the replication task. 

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name(ARN) of the replication task to be stopped."
}
"""
StopReplicationTask(args) = database_migration_service("StopReplicationTask", args)

"""
    CreateReplicationInstance()

Creates the replication instance using the specified parameters. AWS DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see Creating the IAM Roles to Use With the AWS CLI and AWS DMS API. For information on the required permissions, see IAM Permissions Needed to Use AWS DMS.

Required Parameters
{
  "ReplicationInstanceIdentifier": "The replication instance identifier. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 alphanumeric characters or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: myrepinstance ",
  "ReplicationInstanceClass": "The compute and memory capacity of the replication instance as specified by the replication instance class.  Valid Values: dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge  "
}

Optional Parameters
{
  "PubliclyAccessible": " Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address. The default value is true. ",
  "ReplicationSubnetGroupIdentifier": "A subnet group to associate with the replication instance.",
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).  Format: ddd:hh24:mi-ddd:hh24:mi  Default: A 30-minute window selected at random from an 8-hour block of time per AWS Region, occurring on a random day of the week. Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor engine upgrades are applied automatically to the replication instance during the maintenance window. This parameter defaults to true. Default: true ",
  "DnsNameServers": "A list of DNS name servers supported for the replication instance.",
  "AllocatedStorage": "The amount of storage (in gigabytes) to be initially allocated for the replication instance.",
  "Tags": "One or more tags to be assigned to the replication instance.",
  "EngineVersion": "The engine version number of the replication instance.",
  "AvailabilityZone": "The Availability Zone where the replication instance will be created. The default value is a random, system-chosen Availability Zone in the endpoint's AWS Region, for example: us-east-1d ",
  "VpcSecurityGroupIds": " Specifies the VPC security group to be used with the replication instance. The VPC security group must work with the VPC containing the replication instance. ",
  "KmsKeyId": "An AWS KMS key identifier that is used to encrypt the data on the replication instance. If you don't specify a value for the KmsKeyId parameter, then AWS DMS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "MultiAZ": " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the AvailabilityZone parameter if the Multi-AZ parameter is set to true. "
}
"""
CreateReplicationInstance(args) = database_migration_service("CreateReplicationInstance", args)

"""
    ListTagsForResource()

Lists all tags for an AWS DMS resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) string that uniquely identifies the AWS DMS resource."
}
"""
ListTagsForResource(args) = database_migration_service("ListTagsForResource", args)

"""
    DeleteCertificate()

Deletes the specified certificate. 

Required Parameters
{
  "CertificateArn": "The Amazon Resource Name (ARN) of the deleted certificate."
}
"""
DeleteCertificate(args) = database_migration_service("DeleteCertificate", args)

"""
    DescribeOrderableReplicationInstances()

Returns information about the replication instance types that can be created in the specified region.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. "
}
"""
DescribeOrderableReplicationInstances() = database_migration_service("DescribeOrderableReplicationInstances")
DescribeOrderableReplicationInstances(args) = database_migration_service("DescribeOrderableReplicationInstances", args)

"""
    AddTagsToResource()

Adds metadata tags to an AWS DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS.

Required Parameters
{
  "ResourceArn": "Identifies the AWS DMS resource to which tags should be added. The value for this parameter is an Amazon Resource Name (ARN). For AWS DMS, you can tag a replication instance, an endpoint, or a replication task.",
  "Tags": "One or more tags to be assigned to the resource."
}
"""
AddTagsToResource(args) = database_migration_service("AddTagsToResource", args)

"""
    CreateReplicationSubnetGroup()

Creates a replication subnet group given a list of the subnet IDs in a VPC.

Required Parameters
{
  "ReplicationSubnetGroupDescription": "The description for the subnet group.",
  "ReplicationSubnetGroupIdentifier": "The name for the replication subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens. Must not be \"default\". Example: mySubnetgroup ",
  "SubnetIds": "One or more subnet IDs to be assigned to the subnet group."
}

Optional Parameters
{
  "Tags": "One or more tags to be assigned to the subnet group."
}
"""
CreateReplicationSubnetGroup(args) = database_migration_service("CreateReplicationSubnetGroup", args)

"""
    DescribeReplicationSubnetGroups()

Returns information about the replication subnet groups.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the describe action."
}
"""
DescribeReplicationSubnetGroups() = database_migration_service("DescribeReplicationSubnetGroups")
DescribeReplicationSubnetGroups(args) = database_migration_service("DescribeReplicationSubnetGroups", args)

"""
    RemoveTagsFromResource()

Removes metadata tags from a DMS resource.

Required Parameters
{
  "ResourceArn": "An AWS DMS resource from which you want to remove tag(s). The value for this parameter is an Amazon Resource Name (ARN).",
  "TagKeys": "The tag key (name) of the tag to be removed."
}
"""
RemoveTagsFromResource(args) = database_migration_service("RemoveTagsFromResource", args)

"""
    DescribeSchemas()

Returns information about the schema for the specified endpoint. 

Required Parameters
{
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. "
}
"""
DescribeSchemas(args) = database_migration_service("DescribeSchemas", args)

"""
    ModifyEndpoint()

Modifies the specified endpoint.

Required Parameters
{
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}

Optional Parameters
{
  "Password": "The password to be used to login to the endpoint database.",
  "DatabaseName": "The name of the endpoint database.",
  "ServiceAccessRoleArn": " The Amazon Resource Name (ARN) for the service access role you want to use to modify the endpoint. ",
  "DmsTransferSettings": "The settings in JSON format for the DMS transfer type of source endpoint.  Attributes include the following:   serviceAccessRoleArn - The AWS Identity and Access Management (IAM) role that has permission to access the Amazon S3 bucket.   BucketName - The name of the S3 bucket to use.   compressionType - An optional parameter to use GZIP to compress the target files. Either set this parameter to NONE (the default) or don't use it to leave the files uncompressed.   Shorthand syntax for these settings is as follows: ServiceAccessRoleArn=string ,BucketName=string,CompressionType=string  JSON syntax for these settings is as follows: { \"ServiceAccessRoleArn\": \"string\", \"BucketName\": \"string\", \"CompressionType\": \"none\"|\"gzip\" }  ",
  "CertificateArn": "The Amazon Resource Name (ARN) of the certificate used for SSL connection.",
  "KinesisSettings": "Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For information about other available settings, see Using Object Mapping to Migrate Data to a Kinesis Data Stream in the AWS Database Migration User Guide. ",
  "SslMode": "The SSL mode used to connect to the endpoint. The default value is none.",
  "Username": "The user name to be used to login to the endpoint database.",
  "EngineName": "The type of engine for the endpoint. Valid values, depending on the EndpointType, include \"mysql\", \"oracle\", \"postgres\", \"mariadb\", \"aurora\", \"aurora-postgresql\", \"redshift\", \"s3\", \"db2\", \"azuredb\", \"sybase\", \"dynamodb\", \"mongodb\", \"kinesis\", \"kafka\", \"elasticsearch\", \"documentdb\", and \"sqlserver\".",
  "MongoDbSettings": "Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see the configuration properties section in  Using MongoDB as a Target for AWS Database Migration Service in the AWS Database Migration Service User Guide. ",
  "RedshiftSettings": "",
  "EndpointType": "The type of endpoint. Valid values are source and target.",
  "EndpointIdentifier": "The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.",
  "S3Settings": "Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS in the AWS Database Migration Service User Guide. ",
  "ElasticsearchSettings": "Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS in the AWS Database Migration User Guide. ",
  "Port": "The port used by the endpoint database.",
  "ExternalTableDefinition": "The external table definition.",
  "DynamoDbSettings": "Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other available settings, see Using Object Mapping to Migrate Data to DynamoDB in the AWS Database Migration Service User Guide. ",
  "ExtraConnectionAttributes": "Additional attributes associated with the connection. To reset this parameter, pass the empty string (\"\") as an argument.",
  "KafkaSettings": "Settings in JSON format for the target Apache Kafka endpoint. For information about other available settings, see Using Object Mapping to Migrate Data to Apache Kafka in the AWS Database Migration User Guide. ",
  "ServerName": "The name of the server where the endpoint database resides."
}
"""
ModifyEndpoint(args) = database_migration_service("ModifyEndpoint", args)

"""
    ReloadTables()

Reloads the target database table with the source data. 

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) of the replication task. ",
  "TablesToReload": "The name and schema of the table to be reloaded. "
}

Optional Parameters
{
  "ReloadOption": "Options for reload. Specify data-reload to reload the data and re-validate it if validation is enabled. Specify validate-only to re-validate the table. This option applies only when validation is enabled for the task.  Valid values: data-reload, validate-only Default value is data-reload."
}
"""
ReloadTables(args) = database_migration_service("ReloadTables", args)

"""
    DeleteConnection()

Deletes the connection between a replication instance and an endpoint.

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance.",
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}
"""
DeleteConnection(args) = database_migration_service("DeleteConnection", args)

"""
    ImportCertificate()

Uploads the specified certificate.

Required Parameters
{
  "CertificateIdentifier": "A customer-assigned name for the certificate. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens."
}

Optional Parameters
{
  "CertificateWallet": "The location of an imported Oracle Wallet certificate for use with SSL.",
  "Tags": "The tags associated with the certificate.",
  "CertificatePem": "The contents of a .pem file, which contains an X.509 certificate."
}
"""
ImportCertificate(args) = database_migration_service("ImportCertificate", args)

"""
    RebootReplicationInstance()

Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.

Required Parameters
{
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance."
}

Optional Parameters
{
  "ForceFailover": "If this parameter is true, the reboot is conducted through a Multi-AZ failover. (If the instance isn't configured for Multi-AZ, then you can't specify true.)"
}
"""
RebootReplicationInstance(args) = database_migration_service("RebootReplicationInstance", args)

"""
    DeleteEndpoint()

Deletes the specified endpoint.  All tasks associated with the endpoint must be deleted before you can delete the endpoint.  

Required Parameters
{
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}
"""
DeleteEndpoint(args) = database_migration_service("DeleteEndpoint", args)

"""
    DescribeReplicationTaskAssessmentResults()

Returns the task assessment results from Amazon S3. This action always returns the latest results.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) string that uniquely identifies the task. When this input parameter is specified, the API returns only one result and ignore the values of the MaxRecords and Marker parameters. "
}
"""
DescribeReplicationTaskAssessmentResults() = database_migration_service("DescribeReplicationTaskAssessmentResults")
DescribeReplicationTaskAssessmentResults(args) = database_migration_service("DescribeReplicationTaskAssessmentResults", args)

"""
    ApplyPendingMaintenanceAction()

Applies a pending maintenance action to a resource (for example, to a replication instance).

Required Parameters
{
  "ApplyAction": "The pending maintenance action to apply to this resource.",
  "OptInType": "A value that specifies the type of opt-in request, or undoes an opt-in request. You can't undo an opt-in request of type immediate. Valid values:    immediate - Apply the maintenance action immediately.    next-maintenance - Apply the maintenance action during the next maintenance window for the resource.    undo-opt-in - Cancel any existing next-maintenance opt-in requests.  ",
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the AWS DMS resource that the pending maintenance action applies to."
}
"""
ApplyPendingMaintenanceAction(args) = database_migration_service("ApplyPendingMaintenanceAction", args)

"""
    DescribeTableStatistics()

Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted. Note that the "last updated" column the DMS console only indicates the time that AWS DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.

Required Parameters
{
  "ReplicationTaskArn": "The Amazon Resource Name (ARN) of the replication task."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 500.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the describe table statistics action. Valid filter names: schema-name | table-name | table-state A combination of filters creates an AND condition where each record matches all specified filters."
}
"""
DescribeTableStatistics(args) = database_migration_service("DescribeTableStatistics", args)

"""
    DescribeEvents()

 Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on AWS DMS events, see Working with Events and Notifications in the AWS Database Migration User Guide. 

Optional Parameters
{
  "StartTime": "The start time for the events to be listed.",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "SourceIdentifier": " The identifier of an event source.",
  "EndTime": "The end time for the events to be listed.",
  "SourceType": "The type of AWS DMS resource that generates events. Valid values: replication-instance | replication-task",
  "Duration": "The duration of the events to be listed.",
  "Filters": "Filters applied to the action.",
  "EventCategories": "A list of event categories for the source type that you've chosen."
}
"""
DescribeEvents() = database_migration_service("DescribeEvents")
DescribeEvents(args) = database_migration_service("DescribeEvents", args)

"""
    DescribeAccountAttributes()

Lists all of the AWS DMS attributes for a customer account. These attributes include AWS DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region. This command does not take any parameters.
"""
DescribeAccountAttributes() = database_migration_service("DescribeAccountAttributes")
DescribeAccountAttributes(args) = database_migration_service("DescribeAccountAttributes", args)

"""
    DescribeRefreshSchemasStatus()

Returns the status of the RefreshSchemas operation.

Required Parameters
{
  "EndpointArn": "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint."
}
"""
DescribeRefreshSchemasStatus(args) = database_migration_service("DescribeRefreshSchemasStatus", args)

"""
    DescribeEventSubscriptions()

Lists all the event subscriptions for a customer account. The description of a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.  If you specify SubscriptionName, this action lists the description for that subscription.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "SubscriptionName": "The name of the AWS DMS event subscription to be described.",
  "Filters": "Filters applied to the action."
}
"""
DescribeEventSubscriptions() = database_migration_service("DescribeEventSubscriptions")
DescribeEventSubscriptions(args) = database_migration_service("DescribeEventSubscriptions", args)

"""
    ModifyReplicationSubnetGroup()

Modifies the settings for the specified replication subnet group.

Required Parameters
{
  "SubnetIds": "A list of subnet IDs.",
  "ReplicationSubnetGroupIdentifier": "The name of the replication instance subnet group."
}

Optional Parameters
{
  "ReplicationSubnetGroupDescription": "A description for the replication instance subnet group."
}
"""
ModifyReplicationSubnetGroup(args) = database_migration_service("ModifyReplicationSubnetGroup", args)

"""
    DescribeConnections()

Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "The filters applied to the connection. Valid filter names: endpoint-arn | replication-instance-arn"
}
"""
DescribeConnections() = database_migration_service("DescribeConnections")
DescribeConnections(args) = database_migration_service("DescribeConnections", args)

"""
    DescribeReplicationTasks()

Returns information about replication tasks for your account in the current region.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "WithoutSettings": "An option to set to avoid returning information about settings. Use this to reduce overhead when setting information is too large. To use this option, choose true; otherwise, choose false (the default).",
  "Filters": "Filters applied to the describe action. Valid filter names: replication-task-arn | replication-task-id | migration-type | endpoint-arn | replication-instance-arn"
}
"""
DescribeReplicationTasks() = database_migration_service("DescribeReplicationTasks")
DescribeReplicationTasks(args) = database_migration_service("DescribeReplicationTasks", args)

"""
    DescribeCertificates()

Provides a description of the certificate.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 10",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the certificate described in the form of key-value pairs."
}
"""
DescribeCertificates() = database_migration_service("DescribeCertificates")
DescribeCertificates(args) = database_migration_service("DescribeCertificates", args)

"""
    DescribeEndpointTypes()

Returns information about the type of endpoints available.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "Filters applied to the describe action. Valid filter names: engine-name | endpoint-type"
}
"""
DescribeEndpointTypes() = database_migration_service("DescribeEndpointTypes")
DescribeEndpointTypes(args) = database_migration_service("DescribeEndpointTypes", args)

"""
    DescribePendingMaintenanceActions()

For internal use only

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "ReplicationInstanceArn": "The Amazon Resource Name (ARN) of the replication instance.",
  "Filters": ""
}
"""
DescribePendingMaintenanceActions() = database_migration_service("DescribePendingMaintenanceActions")
DescribePendingMaintenanceActions(args) = database_migration_service("DescribePendingMaintenanceActions", args)
