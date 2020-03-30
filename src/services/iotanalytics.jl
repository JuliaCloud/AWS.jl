include("../AWSServices.jl")
using .AWSServices: iotanalytics

"""
    DescribeDataset()

Retrieves information about a data set.

Required Parameters
{
  "datasetName": "The name of the data set whose information is retrieved."
}
"""
DescribeDataset(args) = iotanalytics("GET", "/datasets/{datasetName}", args)

"""
    ListTagsForResource()

Lists the tags (metadata) which you have assigned to the resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource whose tags you want to list."
}
"""
ListTagsForResource(args) = iotanalytics("GET", "/tags", args)

"""
    BatchPutMessage()

Sends messages to a channel.

Required Parameters
{
  "channelName": "The name of the channel where the messages are sent.",
  "messages": "The list of messages to be sent. Each message has format: '{ \"messageId\": \"string\", \"payload\": \"string\"}'. Note that the field names of message payloads (data) that you send to AWS IoT Analytics:   Must contain only alphanumeric characters and undescores (_); no other special characters are allowed.   Must begin with an alphabetic character or single underscore (_).   Cannot contain hyphens (-).   In regular expression terms: \"^[A-Za-z_]([A-Za-z0-9]*|[A-Za-z0-9][A-Za-z0-9_]*) \".    Cannot be greater than 255 characters.   Are case-insensitive. (Fields named \"foo\" and \"FOO\" in the same payload are considered duplicates.)   For example, {\"temp_01\": 29} or {\"_temp_01\": 29} are valid, but {\"temp-01\": 29}, {\"01_temp\": 29} or {\"__temp_01\": 29} are invalid in message payloads. "
}
"""
BatchPutMessage(args) = iotanalytics("POST", "/messages/batch", args)

"""
    CreateDatastore()

Creates a data store, which is a repository for messages.

Required Parameters
{
  "datastoreName": "The name of the data store."
}

Optional Parameters
{
  "datastoreStorage": "Where data store data is stored. You may choose one of \"serviceManagedS3\" or \"customerManagedS3\" storage. If not specified, the default is \"serviceManagedS3\". This cannot be changed after the data store is created.",
  "retentionPeriod": "How long, in days, message data is kept for the data store. When \"customerManagedS3\" storage is selected, this parameter is ignored.",
  "tags": "Metadata which can be used to manage the data store."
}
"""
CreateDatastore(args) = iotanalytics("POST", "/datastores", args)

"""
    DeleteDatastore()

Deletes the specified data store.

Required Parameters
{
  "datastoreName": "The name of the data store to delete."
}
"""
DeleteDatastore(args) = iotanalytics("DELETE", "/datastores/{datastoreName}", args)

"""
    SampleChannelData()

Retrieves a sample of messages from the specified channel ingested during the specified timeframe. Up to 10 messages can be retrieved.

Required Parameters
{
  "channelName": "The name of the channel whose message samples are retrieved."
}

Optional Parameters
{
  "maxMessages": "The number of sample messages to be retrieved. The limit is 10, the default is also 10.",
  "startTime": "The start of the time window from which sample messages are retrieved.",
  "endTime": "The end of the time window from which sample messages are retrieved."
}
"""
SampleChannelData(args) = iotanalytics("GET", "/channels/{channelName}/sample", args)

"""
    ListChannels()

Retrieves a list of channels.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in this request. The default value is 100.",
  "nextToken": "The token for the next set of results."
}
"""
ListChannels() = iotanalytics("GET", "/channels")
ListChannels(args) = iotanalytics("GET", "/channels", args)

"""
    ListDatastores()

Retrieves a list of data stores.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in this request. The default value is 100.",
  "nextToken": "The token for the next set of results."
}
"""
ListDatastores() = iotanalytics("GET", "/datastores")
ListDatastores(args) = iotanalytics("GET", "/datastores", args)

"""
    CreatePipeline()

Creates a pipeline. A pipeline consumes messages from a channel and allows you to process the messages before storing them in a data store. You must specify both a channel and a datastore activity and, optionally, as many as 23 additional activities in the pipelineActivities array.

Required Parameters
{
  "pipelineActivities": "A list of \"PipelineActivity\" objects. Activities perform transformations on your messages, such as removing, renaming or adding message attributes; filtering messages based on attribute values; invoking your Lambda functions on messages for advanced processing; or performing mathematical transformations to normalize device data. The list can be 2-25 PipelineActivity objects and must contain both a channel and a datastore activity. Each entry in the list must contain only one activity, for example:  pipelineActivities = [ { \"channel\": { ... } }, { \"lambda\": { ... } }, ... ] ",
  "pipelineName": "The name of the pipeline."
}

Optional Parameters
{
  "tags": "Metadata which can be used to manage the pipeline."
}
"""
CreatePipeline(args) = iotanalytics("POST", "/pipelines", args)

"""
    ListDatasetContents()

Lists information about data set contents that have been created.

Required Parameters
{
  "datasetName": "The name of the data set whose contents information you want to list."
}

Optional Parameters
{
  "scheduledBefore": "A filter to limit results to those data set contents whose creation is scheduled before the given time. See the field triggers.schedule in the CreateDataset request. (timestamp)",
  "maxResults": "The maximum number of results to return in this request.",
  "nextToken": "The token for the next set of results.",
  "scheduledOnOrAfter": "A filter to limit results to those data set contents whose creation is scheduled on or after the given time. See the field triggers.schedule in the CreateDataset request. (timestamp)"
}
"""
ListDatasetContents(args) = iotanalytics("GET", "/datasets/{datasetName}/contents", args)

"""
    UpdateChannel()

Updates the settings of a channel.

Required Parameters
{
  "channelName": "The name of the channel to be updated."
}

Optional Parameters
{
  "retentionPeriod": "How long, in days, message data is kept for the channel. The retention period cannot be updated if the channel's S3 storage is customer-managed.",
  "channelStorage": "Where channel data is stored. You may choose one of \"serviceManagedS3\" or \"customerManagedS3\" storage. If not specified, the default is \"serviceManagedS3\". This cannot be changed after creation of the channel."
}
"""
UpdateChannel(args) = iotanalytics("PUT", "/channels/{channelName}", args)

"""
    ListDatasets()

Retrieves information about data sets.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in this request. The default value is 100.",
  "nextToken": "The token for the next set of results."
}
"""
ListDatasets() = iotanalytics("GET", "/datasets")
ListDatasets(args) = iotanalytics("GET", "/datasets", args)

"""
    CreateChannel()

Creates a channel. A channel collects data from an MQTT topic and archives the raw, unprocessed messages before publishing the data to a pipeline.

Required Parameters
{
  "channelName": "The name of the channel."
}

Optional Parameters
{
  "retentionPeriod": "How long, in days, message data is kept for the channel. When \"customerManagedS3\" storage is selected, this parameter is ignored.",
  "tags": "Metadata which can be used to manage the channel.",
  "channelStorage": "Where channel data is stored. You may choose one of \"serviceManagedS3\" or \"customerManagedS3\" storage. If not specified, the default is \"serviceManagedS3\". This cannot be changed after creation of the channel."
}
"""
CreateChannel(args) = iotanalytics("POST", "/channels", args)

"""
    CreateDatasetContent()

Creates the content of a data set by applying a "queryAction" (a SQL query) or a "containerAction" (executing a containerized application).

Required Parameters
{
  "datasetName": "The name of the data set."
}
"""
CreateDatasetContent(args) = iotanalytics("POST", "/datasets/{datasetName}/content", args)

"""
    DescribePipeline()

Retrieves information about a pipeline.

Required Parameters
{
  "pipelineName": "The name of the pipeline whose information is retrieved."
}
"""
DescribePipeline(args) = iotanalytics("GET", "/pipelines/{pipelineName}", args)

"""
    UpdatePipeline()

Updates the settings of a pipeline. You must specify both a channel and a datastore activity and, optionally, as many as 23 additional activities in the pipelineActivities array.

Required Parameters
{
  "pipelineActivities": "A list of \"PipelineActivity\" objects. Activities perform transformations on your messages, such as removing, renaming or adding message attributes; filtering messages based on attribute values; invoking your Lambda functions on messages for advanced processing; or performing mathematical transformations to normalize device data. The list can be 2-25 PipelineActivity objects and must contain both a channel and a datastore activity. Each entry in the list must contain only one activity, for example:  pipelineActivities = [ { \"channel\": { ... } }, { \"lambda\": { ... } }, ... ] ",
  "pipelineName": "The name of the pipeline to update."
}
"""
UpdatePipeline(args) = iotanalytics("PUT", "/pipelines/{pipelineName}", args)

"""
    DeleteDataset()

Deletes the specified data set. You do not have to delete the content of the data set before you perform this operation.

Required Parameters
{
  "datasetName": "The name of the data set to delete."
}
"""
DeleteDataset(args) = iotanalytics("DELETE", "/datasets/{datasetName}", args)

"""
    DeleteChannel()

Deletes the specified channel.

Required Parameters
{
  "channelName": "The name of the channel to delete."
}
"""
DeleteChannel(args) = iotanalytics("DELETE", "/channels/{channelName}", args)

"""
    DescribeChannel()

Retrieves information about a channel.

Required Parameters
{
  "channelName": "The name of the channel whose information is retrieved."
}

Optional Parameters
{
  "includeStatistics": "If true, additional statistical information about the channel is included in the response. This feature cannot be used with a channel whose S3 storage is customer-managed."
}
"""
DescribeChannel(args) = iotanalytics("GET", "/channels/{channelName}", args)

"""
    PutLoggingOptions()

Sets or updates the AWS IoT Analytics logging options. Note that if you update the value of any loggingOptions field, it takes up to one minute for the change to take effect. Also, if you change the policy attached to the role you specified in the roleArn field (for example, to correct an invalid policy) it takes up to 5 minutes for that change to take effect. 

Required Parameters
{
  "loggingOptions": "The new values of the AWS IoT Analytics logging options."
}
"""
PutLoggingOptions(args) = iotanalytics("PUT", "/logging", args)

"""
    TagResource()

Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource whose tags you want to modify.",
  "tags": "The new or modified tags for the resource."
}
"""
TagResource(args) = iotanalytics("POST", "/tags", args)

"""
    UntagResource()

Removes the given tags (metadata) from the resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource whose tags you want to remove.",
  "tagKeys": "The keys of those tags which you want to remove."
}
"""
UntagResource(args) = iotanalytics("DELETE", "/tags", args)

"""
    UpdateDataset()

Updates the settings of a data set.

Required Parameters
{
  "actions": "A list of \"DatasetAction\" objects.",
  "datasetName": "The name of the data set to update."
}

Optional Parameters
{
  "versioningConfiguration": "[Optional] How many versions of data set contents are kept. If not specified or set to null, only the latest version plus the latest succeeded version (if they are different) are kept for the time period specified by the \"retentionPeriod\" parameter. (For more information, see https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)",
  "triggers": "A list of \"DatasetTrigger\" objects. The list can be empty or can contain up to five DataSetTrigger objects.",
  "retentionPeriod": "How long, in days, data set contents are kept for the data set.",
  "contentDeliveryRules": "When data set contents are created they are delivered to destinations specified here."
}
"""
UpdateDataset(args) = iotanalytics("PUT", "/datasets/{datasetName}", args)

"""
    UpdateDatastore()

Updates the settings of a data store.

Required Parameters
{
  "datastoreName": "The name of the data store to be updated."
}

Optional Parameters
{
  "datastoreStorage": "Where data store data is stored. You may choose one of \"serviceManagedS3\" or \"customerManagedS3\" storage. If not specified, the default is \"serviceManagedS3\". This cannot be changed after the data store is created.",
  "retentionPeriod": "How long, in days, message data is kept for the data store. The retention period cannot be updated if the data store's S3 storage is customer-managed."
}
"""
UpdateDatastore(args) = iotanalytics("PUT", "/datastores/{datastoreName}", args)

"""
    StartPipelineReprocessing()

Starts the reprocessing of raw message data through the pipeline.

Required Parameters
{
  "pipelineName": "The name of the pipeline on which to start reprocessing."
}

Optional Parameters
{
  "startTime": "The start time (inclusive) of raw message data that is reprocessed.",
  "endTime": "The end time (exclusive) of raw message data that is reprocessed."
}
"""
StartPipelineReprocessing(args) = iotanalytics("POST", "/pipelines/{pipelineName}/reprocessing", args)

"""
    CancelPipelineReprocessing()

Cancels the reprocessing of data through the pipeline.

Required Parameters
{
  "reprocessingId": "The ID of the reprocessing task (returned by \"StartPipelineReprocessing\").",
  "pipelineName": "The name of pipeline for which data reprocessing is canceled."
}
"""
CancelPipelineReprocessing(args) = iotanalytics("DELETE", "/pipelines/{pipelineName}/reprocessing/{reprocessingId}", args)

"""
    GetDatasetContent()

Retrieves the contents of a data set as pre-signed URIs.

Required Parameters
{
  "datasetName": "The name of the data set whose contents are retrieved."
}

Optional Parameters
{
  "versionId": "The version of the data set whose contents are retrieved. You can also use the strings \" LATEST\" or \" LATEST_SUCCEEDED\" to retrieve the contents of the latest or latest successfully completed data set. If not specified, \" LATEST_SUCCEEDED\" is the default."
}
"""
GetDatasetContent(args) = iotanalytics("GET", "/datasets/{datasetName}/content", args)

"""
    DescribeDatastore()

Retrieves information about a data store.

Required Parameters
{
  "datastoreName": "The name of the data store"
}

Optional Parameters
{
  "includeStatistics": "If true, additional statistical information about the data store is included in the response. This feature cannot be used with a data store whose S3 storage is customer-managed."
}
"""
DescribeDatastore(args) = iotanalytics("GET", "/datastores/{datastoreName}", args)

"""
    DescribeLoggingOptions()

Retrieves the current settings of the AWS IoT Analytics logging options.
"""
DescribeLoggingOptions() = iotanalytics("GET", "/logging")
DescribeLoggingOptions(args) = iotanalytics("GET", "/logging", args)

"""
    DeleteDatasetContent()

Deletes the content of the specified data set.

Required Parameters
{
  "datasetName": "The name of the data set whose content is deleted."
}

Optional Parameters
{
  "versionId": "The version of the data set whose content is deleted. You can also use the strings \" LATEST\" or \" LATEST_SUCCEEDED\" to delete the latest or latest successfully completed data set. If not specified, \" LATEST_SUCCEEDED\" is the default."
}
"""
DeleteDatasetContent(args) = iotanalytics("DELETE", "/datasets/{datasetName}/content", args)

"""
    CreateDataset()

Creates a data set. A data set stores data retrieved from a data store by applying a "queryAction" (a SQL query) or a "containerAction" (executing a containerized application). This operation creates the skeleton of a data set. The data set can be populated manually by calling "CreateDatasetContent" or automatically according to a "trigger" you specify.

Required Parameters
{
  "actions": "A list of actions that create the data set contents.",
  "datasetName": "The name of the data set."
}

Optional Parameters
{
  "versioningConfiguration": "[Optional] How many versions of data set contents are kept. If not specified or set to null, only the latest version plus the latest succeeded version (if they are different) are kept for the time period specified by the \"retentionPeriod\" parameter. (For more information, see https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)",
  "triggers": "A list of triggers. A trigger causes data set contents to be populated at a specified time interval or when another data set's contents are created. The list of triggers can be empty or contain up to five DataSetTrigger objects.",
  "retentionPeriod": "[Optional] How long, in days, versions of data set contents are kept for the data set. If not specified or set to null, versions of data set contents are retained for at most 90 days. The number of versions of data set contents retained is determined by the versioningConfiguration parameter. (For more information, see https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)",
  "tags": "Metadata which can be used to manage the data set.",
  "contentDeliveryRules": "When data set contents are created they are delivered to destinations specified here."
}
"""
CreateDataset(args) = iotanalytics("POST", "/datasets", args)

"""
    DeletePipeline()

Deletes the specified pipeline.

Required Parameters
{
  "pipelineName": "The name of the pipeline to delete."
}
"""
DeletePipeline(args) = iotanalytics("DELETE", "/pipelines/{pipelineName}", args)

"""
    ListPipelines()

Retrieves a list of pipelines.

Optional Parameters
{
  "maxResults": "The maximum number of results to return in this request. The default value is 100.",
  "nextToken": "The token for the next set of results."
}
"""
ListPipelines() = iotanalytics("GET", "/pipelines")
ListPipelines(args) = iotanalytics("GET", "/pipelines", args)

"""
    RunPipelineActivity()

Simulates the results of running a pipeline activity on a message payload.

Required Parameters
{
  "pipelineActivity": "The pipeline activity that is run. This must not be a 'channel' activity or a 'datastore' activity because these activities are used in a pipeline only to load the original message and to store the (possibly) transformed message. If a 'lambda' activity is specified, only short-running Lambda functions (those with a timeout of less than 30 seconds or less) can be used.",
  "payloads": "The sample message payloads on which the pipeline activity is run."
}
"""
RunPipelineActivity(args) = iotanalytics("POST", "/pipelineactivities/run", args)
