include("../AWSServices.jl")
using .AWSServices: kinesis_analytics_v2

"""
    ListTagsForResource()

Retrieves the list of key-value tags assigned to the application. For more information, see Using Tagging.

Required Parameters
{
  "ResourceARN": "The ARN of the application for which to retrieve tags."
}
"""
ListTagsForResource(args) = kinesis_analytics_v2("ListTagsForResource", args)

"""
    DeleteApplicationSnapshot()

Deletes a snapshot of application state.

Required Parameters
{
  "SnapshotName": "The identifier for the snapshot delete.",
  "ApplicationName": "The name of an existing application.",
  "SnapshotCreationTimestamp": "The creation timestamp of the application snapshot to delete. You can retrieve this value using or ."
}
"""
DeleteApplicationSnapshot(args) = kinesis_analytics_v2("DeleteApplicationSnapshot", args)

"""
    AddApplicationCloudWatchLoggingOption()

Adds an Amazon CloudWatch log stream to monitor application configuration errors.

Required Parameters
{
  "CurrentApplicationVersionId": "The version ID of the Kinesis Data Analytics application. You can retrieve the application version ID using DescribeApplication.",
  "ApplicationName": "The Kinesis Data Analytics application name.",
  "CloudWatchLoggingOption": "Provides the Amazon CloudWatch log stream Amazon Resource Name (ARN). "
}
"""
AddApplicationCloudWatchLoggingOption(args) = kinesis_analytics_v2("AddApplicationCloudWatchLoggingOption", args)

"""
    StopApplication()

Stops the application from processing data. You can stop an application only if it is in the running state. You can use the DescribeApplication operation to find the application state. 

Required Parameters
{
  "ApplicationName": "The name of the running application to stop."
}
"""
StopApplication(args) = kinesis_analytics_v2("StopApplication", args)

"""
    DeleteApplication()

Deletes the specified application. Kinesis Data Analytics halts application execution and deletes the application.

Required Parameters
{
  "CreateTimestamp": "Use the DescribeApplication operation to get this value.",
  "ApplicationName": "The name of the application to delete."
}
"""
DeleteApplication(args) = kinesis_analytics_v2("DeleteApplication", args)

"""
    AddApplicationOutput()

Adds an external destination to your SQL-based Amazon Kinesis Data Analytics application. If you want Kinesis Data Analytics to deliver data from an in-application stream within your application to an external destination (such as an Kinesis data stream, a Kinesis Data Firehose delivery stream, or an AWS Lambda function), you add the relevant configuration to your application using this operation. You can configure one or more outputs for your application. Each output configuration maps an in-application stream and an external destination.  You can use one of the output configurations to deliver data from your in-application error stream to an external destination so that you can analyze the errors.   Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the DescribeApplication operation to find the current application version.

Required Parameters
{
  "CurrentApplicationVersionId": "The version of the application to which you want to add the output configuration. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned. ",
  "Output": "An array of objects, each describing one output configuration. In the output configuration, you specify the name of an in-application stream, a destination (that is, a Kinesis data stream, a Kinesis Data Firehose delivery stream, or an AWS Lambda function), and record the formation to use when writing to the destination.",
  "ApplicationName": "The name of the application to which you want to add the output configuration."
}
"""
AddApplicationOutput(args) = kinesis_analytics_v2("AddApplicationOutput", args)

"""
    DeleteApplicationInputProcessingConfiguration()

Deletes an InputProcessingConfiguration from an input.

Required Parameters
{
  "CurrentApplicationVersionId": "The application version. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned. ",
  "ApplicationName": "The name of the application.",
  "InputId": "The ID of the input configuration from which to delete the input processing configuration. You can get a list of the input IDs for an application by using the DescribeApplication operation."
}
"""
DeleteApplicationInputProcessingConfiguration(args) = kinesis_analytics_v2("DeleteApplicationInputProcessingConfiguration", args)

"""
    ListApplicationSnapshots()

Lists information about the current application snapshots.

Required Parameters
{
  "ApplicationName": "The name of an existing application."
}

Optional Parameters
{
  "NextToken": "Use this parameter if you receive a NextToken response in a previous request that indicates that there is more output available. Set it to the value of the previous call's NextToken response to indicate where the output should continue from. ",
  "Limit": "The maximum number of application snapshots to list."
}
"""
ListApplicationSnapshots(args) = kinesis_analytics_v2("ListApplicationSnapshots", args)

"""
    StartApplication()

Starts the specified Amazon Kinesis Data Analytics application. After creating an application, you must exclusively call this operation to start your application.

Required Parameters
{
  "ApplicationName": "The name of the application.",
  "RunConfiguration": "Identifies the run configuration (start parameters) of a Kinesis Data Analytics application."
}
"""
StartApplication(args) = kinesis_analytics_v2("StartApplication", args)

"""
    CreateApplication()

Creates an Amazon Kinesis Data Analytics application. For information about creating a Kinesis Data Analytics application, see Creating an Application. 

Required Parameters
{
  "RuntimeEnvironment": "The runtime environment for the application (SQL-1.0 or FLINK-1_6).",
  "ApplicationName": "The name of your application (for example, sample-app).",
  "ServiceExecutionRole": "The IAM role used by the application to access Kinesis data streams, Kinesis Data Firehose delivery streams, Amazon S3 objects, and other external resources."
}

Optional Parameters
{
  "CloudWatchLoggingOptions": "Use this parameter to configure an Amazon CloudWatch log stream to monitor application configuration errors. ",
  "ApplicationConfiguration": "Use this parameter to configure the application.",
  "Tags": "A list of one or more tags to assign to the application. A tag is a key-value pair that identifies an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see Using Tagging.",
  "ApplicationDescription": "A summary description of the application."
}
"""
CreateApplication(args) = kinesis_analytics_v2("CreateApplication", args)

"""
    UpdateApplication()

Updates an existing Amazon Kinesis Data Analytics application. Using this operation, you can update application code, input configuration, and output configuration.  Kinesis Data Analytics updates the ApplicationVersionId each time you update your application. 

Required Parameters
{
  "CurrentApplicationVersionId": "The current application version ID. You can retrieve the application version ID using DescribeApplication.",
  "ApplicationName": "The name of the application to update."
}

Optional Parameters
{
  "ApplicationConfigurationUpdate": "Describes application configuration updates.",
  "CloudWatchLoggingOptionUpdates": "Describes application Amazon CloudWatch logging option updates. You can only update existing CloudWatch logging options with this action. To add a new CloudWatch logging option, use AddApplicationCloudWatchLoggingOption.",
  "ServiceExecutionRoleUpdate": "Describes updates to the service execution role.",
  "RunConfigurationUpdate": "Describes updates to the application's starting parameters."
}
"""
UpdateApplication(args) = kinesis_analytics_v2("UpdateApplication", args)

"""
    DeleteApplicationReferenceDataSource()

Deletes a reference data source configuration from the specified SQL-based Amazon Kinesis Data Analytics application's configuration. If the application is running, Kinesis Data Analytics immediately removes the in-application table that you created using the AddApplicationReferenceDataSource operation. 

Required Parameters
{
  "CurrentApplicationVersionId": "The current application version. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned.",
  "ReferenceId": "The ID of the reference data source. When you add a reference data source to your application using the AddApplicationReferenceDataSource, Kinesis Data Analytics assigns an ID. You can use the DescribeApplication operation to get the reference ID. ",
  "ApplicationName": "The name of an existing application."
}
"""
DeleteApplicationReferenceDataSource(args) = kinesis_analytics_v2("DeleteApplicationReferenceDataSource", args)

"""
    TagResource()

Adds one or more key-value tags to a Kinesis Analytics application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see Using Tagging.

Required Parameters
{
  "ResourceARN": "The ARN of the application to assign the tags.",
  "Tags": "The key-value tags to assign to the application."
}
"""
TagResource(args) = kinesis_analytics_v2("TagResource", args)

"""
    DeleteApplicationOutput()

Deletes the output destination configuration from your SQL-based Amazon Kinesis Data Analytics application's configuration. Kinesis Data Analytics will no longer write data from the corresponding in-application stream to the external output destination.

Required Parameters
{
  "CurrentApplicationVersionId": "The application version. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned. ",
  "OutputId": "The ID of the configuration to delete. Each output configuration that is added to the application (either when the application is created or later) using the AddApplicationOutput operation has a unique ID. You need to provide the ID to uniquely identify the output configuration that you want to delete from the application configuration. You can use the DescribeApplication operation to get the specific OutputId. ",
  "ApplicationName": "The application name."
}
"""
DeleteApplicationOutput(args) = kinesis_analytics_v2("DeleteApplicationOutput", args)

"""
    UntagResource()

Removes one or more tags from a Kinesis Analytics application. For more information, see Using Tagging.

Required Parameters
{
  "ResourceARN": "The ARN of the Kinesis Analytics application from which to remove the tags.",
  "TagKeys": "A list of keys of tags to remove from the specified application."
}
"""
UntagResource(args) = kinesis_analytics_v2("UntagResource", args)

"""
    ListApplications()

Returns a list of Amazon Kinesis Data Analytics applications in your account. For each application, the response includes the application name, Amazon Resource Name (ARN), and status.  If you want detailed information about a specific application, use DescribeApplication.

Optional Parameters
{
  "NextToken": "If a previous command returned a pagination token, pass it into this value to retrieve the next set of results. For more information about pagination, see Using the AWS Command Line Interface's Pagination Options.",
  "Limit": "The maximum number of applications to list."
}
"""
ListApplications() = kinesis_analytics_v2("ListApplications")
ListApplications(args) = kinesis_analytics_v2("ListApplications", args)

"""
    DescribeApplicationSnapshot()

Returns information about a snapshot of application state data.

Required Parameters
{
  "SnapshotName": "The identifier of an application snapshot. You can retrieve this value using .",
  "ApplicationName": "The name of an existing application."
}
"""
DescribeApplicationSnapshot(args) = kinesis_analytics_v2("DescribeApplicationSnapshot", args)

"""
    AddApplicationVpcConfiguration()

Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs to store and access resources securely. Note the following about VPC configurations for Kinesis Data Analytics applications:   VPC configurations are not supported for SQL applications.   When a VPC is added to a Kinesis Data Analytics application, the application can no longer be accessed from the Internet directly. To enable Internet access to the application, add an Internet gateway to your VPC.  

Required Parameters
{
  "CurrentApplicationVersionId": "The version of the application to which you want to add the input processing configuration. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned.",
  "ApplicationName": "The name of an existing application.",
  "VpcConfiguration": "Description of the VPC to add to the application."
}
"""
AddApplicationVpcConfiguration(args) = kinesis_analytics_v2("AddApplicationVpcConfiguration", args)

"""
    AddApplicationInputProcessingConfiguration()

Adds an InputProcessingConfiguration to an SQL-based Kinesis Data Analytics application. An input processor pre-processes records on the input stream before the application's SQL code executes. Currently, the only input processor available is AWS Lambda.

Required Parameters
{
  "CurrentApplicationVersionId": "The version of the application to which you want to add the input processing configuration. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned.",
  "ApplicationName": "The name of the application to which you want to add the input processing configuration.",
  "InputId": "The ID of the input configuration to add the input processing configuration to. You can get a list of the input IDs for an application using the DescribeApplication operation.",
  "InputProcessingConfiguration": "The InputProcessingConfiguration to add to the application."
}
"""
AddApplicationInputProcessingConfiguration(args) = kinesis_analytics_v2("AddApplicationInputProcessingConfiguration", args)

"""
    AddApplicationReferenceDataSource()

Adds a reference data source to an existing SQL-based Amazon Kinesis Data Analytics application. Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an in-application table within your application. In the request, you provide the source (S3 bucket name and object key name), name of the in-application table to create, and the necessary mapping information that describes how data in an Amazon S3 object maps to columns in the resulting in-application table.

Required Parameters
{
  "CurrentApplicationVersionId": "The version of the application for which you are adding the reference data source. You can use the DescribeApplication operation to get the current application version. If the version specified is not the current version, the ConcurrentModificationException is returned.",
  "ApplicationName": "The name of an existing application.",
  "ReferenceDataSource": "The reference data source can be an object in your Amazon S3 bucket. Kinesis Data Analytics reads the object and copies the data into the in-application table that is created. You provide an S3 bucket, object key name, and the resulting in-application table that is created. "
}
"""
AddApplicationReferenceDataSource(args) = kinesis_analytics_v2("AddApplicationReferenceDataSource", args)

"""
    DeleteApplicationVpcConfiguration()

Removes a VPC configuration from a Kinesis Data Analytics application.

Required Parameters
{
  "CurrentApplicationVersionId": "The current application version ID. You can retrieve the application version ID using DescribeApplication.",
  "ApplicationName": "The name of an existing application.",
  "VpcConfigurationId": "The ID of the VPC configuration to delete."
}
"""
DeleteApplicationVpcConfiguration(args) = kinesis_analytics_v2("DeleteApplicationVpcConfiguration", args)

"""
    DiscoverInputSchema()

Infers a schema for an SQL-based Amazon Kinesis Data Analytics application by evaluating sample records on the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery stream) or Amazon S3 object. In the response, the operation returns the inferred schema and also the sample records that the operation used to infer the schema.  You can use the inferred schema when configuring a streaming source for your application. When you create an application using the Kinesis Data Analytics console, the console uses this operation to infer a schema and show it in the console user interface. 

Required Parameters
{
  "ServiceExecutionRole": "The ARN of the role that is used to access the streaming source."
}

Optional Parameters
{
  "S3Configuration": "Specify this parameter to discover a schema from data in an Amazon S3 object.",
  "ResourceARN": "The Amazon Resource Name (ARN) of the streaming source.",
  "InputStartingPositionConfiguration": "The point at which you want Kinesis Data Analytics to start reading records from the specified streaming source discovery purposes.",
  "InputProcessingConfiguration": "The InputProcessingConfiguration to use to preprocess the records before discovering the schema of the records."
}
"""
DiscoverInputSchema(args) = kinesis_analytics_v2("DiscoverInputSchema", args)

"""
    AddApplicationInput()

 Adds a streaming source to your SQL-based Amazon Kinesis Data Analytics application.  You can add a streaming source when you create an application, or you can use this operation to add a streaming source after you create an application. For more information, see CreateApplication. Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the DescribeApplication operation to find the current application version. 

Required Parameters
{
  "CurrentApplicationVersionId": "The current version of your application. You can use the DescribeApplication operation to find the current application version.",
  "ApplicationName": "The name of your existing application to which you want to add the streaming source.",
  "Input": "The Input to add."
}
"""
AddApplicationInput(args) = kinesis_analytics_v2("AddApplicationInput", args)

"""
    DescribeApplication()

Returns information about a specific Amazon Kinesis Data Analytics application. If you want to retrieve a list of all applications in your account, use the ListApplications operation.

Required Parameters
{
  "ApplicationName": "The name of the application."
}

Optional Parameters
{
  "IncludeAdditionalDetails": "Displays verbose information about a Kinesis Data Analytics application, including the application's job plan."
}
"""
DescribeApplication(args) = kinesis_analytics_v2("DescribeApplication", args)

"""
    CreateApplicationSnapshot()

Creates a snapshot of the application's state data.

Required Parameters
{
  "SnapshotName": "An identifier for the application snapshot.",
  "ApplicationName": "The name of an existing application"
}
"""
CreateApplicationSnapshot(args) = kinesis_analytics_v2("CreateApplicationSnapshot", args)

"""
    DeleteApplicationCloudWatchLoggingOption()

Deletes an Amazon CloudWatch log stream from an Amazon Kinesis Data Analytics application. 

Required Parameters
{
  "CurrentApplicationVersionId": "The version ID of the application. You can retrieve the application version ID using DescribeApplication.",
  "ApplicationName": "The application name.",
  "CloudWatchLoggingOptionId": "The CloudWatchLoggingOptionId of the Amazon CloudWatch logging option to delete. You can get the CloudWatchLoggingOptionId by using the DescribeApplication operation. "
}
"""
DeleteApplicationCloudWatchLoggingOption(args) = kinesis_analytics_v2("DeleteApplicationCloudWatchLoggingOption", args)
