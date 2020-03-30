include("../AWSServices.jl")
using .AWSServices: sms

"""
    LaunchApp()

Launches an application stack.

Optional Parameters
{
  "appId": "ID of the application to launch."
}
"""
LaunchApp() = sms("LaunchApp")
LaunchApp(args) = sms("LaunchApp", args)

"""
    GetServers()

Describes the servers in your server catalog. Before you can describe your servers, you must import them using ImportServerCatalog.

Optional Parameters
{
  "vmServerAddressList": "List of VmServerAddress objects",
  "maxResults": "The maximum number of results to return in a single call. The default value is 50. To retrieve the remaining results, make another call with the returned NextToken value.",
  "nextToken": "The token for the next set of results."
}
"""
GetServers() = sms("GetServers")
GetServers(args) = sms("GetServers", args)

"""
    GetAppLaunchConfiguration()

Retrieves the application launch configuration associated with an application.

Optional Parameters
{
  "appId": "ID of the application launch configuration."
}
"""
GetAppLaunchConfiguration() = sms("GetAppLaunchConfiguration")
GetAppLaunchConfiguration(args) = sms("GetAppLaunchConfiguration", args)

"""
    GetReplicationJobs()

Describes the specified replication job or all of your replication jobs.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call. The default value is 50. To retrieve the remaining results, make another call with the returned NextToken value.",
  "nextToken": "The token for the next set of results.",
  "replicationJobId": "The identifier of the replication job."
}
"""
GetReplicationJobs() = sms("GetReplicationJobs")
GetReplicationJobs(args) = sms("GetReplicationJobs", args)

"""
    PutAppReplicationConfiguration()

Creates or updates a replication configuration for an application.

Optional Parameters
{
  "appId": "ID of the application tassociated with the replication configuration.",
  "serverGroupReplicationConfigurations": "Replication configurations for server groups in the application."
}
"""
PutAppReplicationConfiguration() = sms("PutAppReplicationConfiguration")
PutAppReplicationConfiguration(args) = sms("PutAppReplicationConfiguration", args)

"""
    DeleteServerCatalog()

Deletes all servers from your server catalog.
"""
DeleteServerCatalog() = sms("DeleteServerCatalog")
DeleteServerCatalog(args) = sms("DeleteServerCatalog", args)

"""
    ImportServerCatalog()

Gathers a complete list of on-premises servers. Connectors must be installed and monitoring all servers that you want to import. This call returns immediately, but might take additional time to retrieve all the servers.
"""
ImportServerCatalog() = sms("ImportServerCatalog")
ImportServerCatalog(args) = sms("ImportServerCatalog", args)

"""
    StartOnDemandReplicationRun()

Starts an on-demand replication run for the specified replication job. This replication run starts immediately. This replication run is in addition to the ones already scheduled. There is a limit on the number of on-demand replications runs you can request in a 24-hour period.

Required Parameters
{
  "replicationJobId": "The identifier of the replication job."
}

Optional Parameters
{
  "description": "The description of the replication run."
}
"""
StartOnDemandReplicationRun(args) = sms("StartOnDemandReplicationRun", args)

"""
    DeleteApp()

Deletes an existing application. Optionally deletes the launched stack associated with the application and all AWS SMS replication jobs for servers in the application.

Optional Parameters
{
  "appId": "ID of the application to delete.",
  "forceTerminateApp": "While deleting the application, terminate the stack corresponding to the application.",
  "forceStopAppReplication": "While deleting the application, stop all replication jobs corresponding to the servers in the application."
}
"""
DeleteApp() = sms("DeleteApp")
DeleteApp(args) = sms("DeleteApp", args)

"""
    StartAppReplication()

Starts replicating an application.

Optional Parameters
{
  "appId": "ID of the application to replicate."
}
"""
StartAppReplication() = sms("StartAppReplication")
StartAppReplication(args) = sms("StartAppReplication", args)

"""
    ListApps()

Returns a list of summaries for all applications.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call. The default value is 50. To retrieve the remaining results, make another call with the returned NextToken value. ",
  "nextToken": "The token for the next set of results.",
  "appIds": ""
}
"""
ListApps() = sms("ListApps")
ListApps(args) = sms("ListApps", args)

"""
    GetReplicationRuns()

Describes the replication runs for the specified replication job.

Required Parameters
{
  "replicationJobId": "The identifier of the replication job."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call. The default value is 50. To retrieve the remaining results, make another call with the returned NextToken value.",
  "nextToken": "The token for the next set of results."
}
"""
GetReplicationRuns(args) = sms("GetReplicationRuns", args)

"""
    PutAppLaunchConfiguration()

Creates a launch configuration for an application.

Optional Parameters
{
  "appId": "ID of the application associated with the launch configuration.",
  "serverGroupLaunchConfigurations": "Launch configurations for server groups in the application.",
  "roleName": "Name of service role in the customer's account that Amazon CloudFormation uses to launch the application."
}
"""
PutAppLaunchConfiguration() = sms("PutAppLaunchConfiguration")
PutAppLaunchConfiguration(args) = sms("PutAppLaunchConfiguration", args)

"""
    DeleteAppReplicationConfiguration()

Deletes existing replication configuration for an application.

Optional Parameters
{
  "appId": "ID of the application associated with the replication configuration."
}
"""
DeleteAppReplicationConfiguration() = sms("DeleteAppReplicationConfiguration")
DeleteAppReplicationConfiguration(args) = sms("DeleteAppReplicationConfiguration", args)

"""
    CreateReplicationJob()

Creates a replication job. The replication job schedules periodic replication runs to replicate your server to AWS. Each replication run creates an Amazon Machine Image (AMI).

Required Parameters
{
  "seedReplicationTime": "The seed replication time.",
  "serverId": "The identifier of the server."
}

Optional Parameters
{
  "encrypted": "When true, the replication job produces encrypted AMIs. See also KmsKeyId below.",
  "roleName": "The name of the IAM role to be used by the AWS SMS.",
  "numberOfRecentAmisToKeep": "The maximum number of SMS-created AMIs to retain. The oldest will be deleted once the maximum number is reached and a new AMI is created.",
  "licenseType": "The license type to be used for the AMI created by a successful replication run.",
  "frequency": "The time between consecutive replication runs, in hours.",
  "kmsKeyId": "KMS key ID for replication jobs that produce encrypted AMIs. Can be any of the following:    KMS key ID   KMS key alias   ARN referring to KMS key ID   ARN referring to KMS key alias    If encrypted is true but a KMS key id is not specified, the customer's default KMS key for EBS is used. ",
  "description": "The description of the replication job.",
  "runOnce": ""
}
"""
CreateReplicationJob(args) = sms("CreateReplicationJob", args)

"""
    UpdateApp()

Updates an application.

Optional Parameters
{
  "appId": "ID of the application to update.",
  "name": "New name of the application.",
  "roleName": "Name of the service role in the customer's account used by AWS SMS.",
  "serverGroups": "List of server groups in the application to update.",
  "tags": "List of tags to associate with the application.",
  "description": "New description of the application."
}
"""
UpdateApp() = sms("UpdateApp")
UpdateApp(args) = sms("UpdateApp", args)

"""
    DeleteReplicationJob()

Deletes the specified replication job. After you delete a replication job, there are no further replication runs. AWS deletes the contents of the Amazon S3 bucket used to store AWS SMS artifacts. The AMIs created by the replication runs are not deleted.

Required Parameters
{
  "replicationJobId": "The identifier of the replication job."
}
"""
DeleteReplicationJob(args) = sms("DeleteReplicationJob", args)

"""
    DisassociateConnector()

Disassociates the specified connector from AWS SMS. After you disassociate a connector, it is no longer available to support replication jobs.

Required Parameters
{
  "connectorId": "The identifier of the connector."
}
"""
DisassociateConnector(args) = sms("DisassociateConnector", args)

"""
    GetAppReplicationConfiguration()

Retrieves an application replication configuration associatd with an application.

Optional Parameters
{
  "appId": "ID of the application associated with the replication configuration."
}
"""
GetAppReplicationConfiguration() = sms("GetAppReplicationConfiguration")
GetAppReplicationConfiguration(args) = sms("GetAppReplicationConfiguration", args)

"""
    CreateApp()

Creates an application. An application consists of one or more server groups. Each server group contain one or more servers.

Optional Parameters
{
  "name": "Name of the new application.",
  "roleName": "Name of service role in customer's account to be used by AWS SMS.",
  "clientToken": "A unique, case-sensitive identifier you provide to ensure idempotency of application creation.",
  "serverGroups": "List of server groups to include in the application.",
  "tags": "List of tags to be associated with the application.",
  "description": "Description of the new application"
}
"""
CreateApp() = sms("CreateApp")
CreateApp(args) = sms("CreateApp", args)

"""
    GenerateChangeSet()

Generates a target change set for a currently launched stack and writes it to an Amazon S3 object in the customer’s Amazon S3 bucket.

Optional Parameters
{
  "appId": "ID of the application associated with the change set.",
  "changesetFormat": "Format for the change set."
}
"""
GenerateChangeSet() = sms("GenerateChangeSet")
GenerateChangeSet(args) = sms("GenerateChangeSet", args)

"""
    StopAppReplication()

Stops replicating an application.

Optional Parameters
{
  "appId": "ID of the application to stop replicating."
}
"""
StopAppReplication() = sms("StopAppReplication")
StopAppReplication(args) = sms("StopAppReplication", args)

"""
    DeleteAppLaunchConfiguration()

Deletes existing launch configuration for an application.

Optional Parameters
{
  "appId": "ID of the application associated with the launch configuration."
}
"""
DeleteAppLaunchConfiguration() = sms("DeleteAppLaunchConfiguration")
DeleteAppLaunchConfiguration(args) = sms("DeleteAppLaunchConfiguration", args)

"""
    GenerateTemplate()

Generates an Amazon CloudFormation template based on the current launch configuration and writes it to an Amazon S3 object in the customer’s Amazon S3 bucket.

Optional Parameters
{
  "appId": "ID of the application associated with the Amazon CloudFormation template.",
  "templateFormat": "Format for generating the Amazon CloudFormation template."
}
"""
GenerateTemplate() = sms("GenerateTemplate")
GenerateTemplate(args) = sms("GenerateTemplate", args)

"""
    TerminateApp()

Terminates the stack for an application.

Optional Parameters
{
  "appId": "ID of the application to terminate."
}
"""
TerminateApp() = sms("TerminateApp")
TerminateApp(args) = sms("TerminateApp", args)

"""
    GetApp()

Retrieve information about an application.

Optional Parameters
{
  "appId": "ID of the application whose information is being retrieved."
}
"""
GetApp() = sms("GetApp")
GetApp(args) = sms("GetApp", args)

"""
    GetConnectors()

Describes the connectors registered with the AWS SMS.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call. The default value is 50. To retrieve the remaining results, make another call with the returned NextToken value.",
  "nextToken": "The token for the next set of results."
}
"""
GetConnectors() = sms("GetConnectors")
GetConnectors(args) = sms("GetConnectors", args)

"""
    UpdateReplicationJob()

Updates the specified settings for the specified replication job.

Required Parameters
{
  "replicationJobId": "The identifier of the replication job."
}

Optional Parameters
{
  "nextReplicationRunStartTime": "The start time of the next replication run.",
  "roleName": "The name of the IAM role to be used by AWS SMS.",
  "numberOfRecentAmisToKeep": "The maximum number of SMS-created AMIs to retain. The oldest will be deleted once the maximum number is reached and a new AMI is created.",
  "licenseType": "The license type to be used for the AMI created by a successful replication run.",
  "frequency": "The time between consecutive replication runs, in hours.",
  "encrypted": "When true, the replication job produces encrypted AMIs . See also KmsKeyId below.",
  "kmsKeyId": " KMS key ID for replication jobs that produce encrypted AMIs. Can be any of the following:    KMS key ID   KMS key alias   ARN referring to KMS key ID   ARN referring to KMS key alias    If encrypted is true but a KMS key id is not specified, the customer's default KMS key for EBS is used. ",
  "description": "The description of the replication job."
}
"""
UpdateReplicationJob(args) = sms("UpdateReplicationJob", args)
