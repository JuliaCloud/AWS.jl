# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iotanalytics
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "end_time" => "endTime",
    "next_token" => "nextToken",
    "file_format_configuration" => "fileFormatConfiguration",
    "channel_storage" => "channelStorage",
    "start_time" => "startTime",
    "versioning_configuration" => "versioningConfiguration",
    "datastore_storage" => "datastoreStorage",
    "max_results" => "maxResults",
    "max_messages" => "maxMessages",
    "include_statistics" => "includeStatistics",
    "content_delivery_rules" => "contentDeliveryRules",
    "version_id" => "versionId",
    "late_data_rules" => "lateDataRules",
    "triggers" => "triggers",
    "scheduled_before" => "scheduledBefore",
    "datastore_partitions" => "datastorePartitions",
    "channel_messages" => "channelMessages",
    "retention_period" => "retentionPeriod",
    "tags" => "tags",
    "scheduled_on_or_after" => "scheduledOnOrAfter",
)

"""
    batch_put_message(channel_name, messages; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sends messages to a channel.

# Arguments
- `channel_name`: The name of the channel where the messages are sent.
- `messages`: The list of messages to be sent. Each message has the format: {
  \"messageId\": \"string\", \"payload\": \"string\"}. The field names of message payloads
  (data) that you send to IoT Analytics:   Must contain only alphanumeric characters and
  undescores (_). No other special characters are allowed.   Must begin with an alphabetic
  character or single underscore (_).   Cannot contain hyphens (-).   In regular expression
  terms: \"^[A-Za-z_]([A-Za-z0-9]*|[A-Za-z0-9][A-Za-z0-9_]*)\".    Cannot be more than 255
  characters.   Are case insensitive. (Fields named foo and FOO in the same payload are
  considered duplicates.)   For example, {\"temp_01\": 29} or {\"_temp_01\": 29} are valid,
  but {\"temp-01\": 29}, {\"01_temp\": 29} or {\"__temp_01\": 29} are invalid in message
  payloads.

"""
function batch_put_message(
    channelName, messages; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/messages/batch",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("channelName" => channelName, "messages" => messages),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    cancel_pipeline_reprocessing(pipeline_name, reprocessing_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Cancels the reprocessing of data through the pipeline.

# Arguments
- `pipeline_name`: The name of pipeline for which data reprocessing is canceled.
- `reprocessing_id`: The ID of the reprocessing task (returned by
  StartPipelineReprocessing).

"""
function cancel_pipeline_reprocessing(
    pipelineName,
    reprocessingId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/pipelines/$(pipelineName)/reprocessing/$(reprocessingId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_channel(channel_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Used to create a channel. A channel collects data from an MQTT topic and archives the raw,
unprocessed messages before publishing the data to a pipeline.

# Arguments
- `channel_name`: The name of the channel.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"channel_storage"`: Where channel data is stored. You can choose one of serviceManagedS3
  or customerManagedS3 storage. If not specified, the default is serviceManagedS3. You can't
  change this storage option after the channel is created.
- `"retention_period"`: How long, in days, message data is kept for the channel. When
  customerManagedS3 storage is selected, this parameter is ignored.
- `"tags"`: Metadata which can be used to manage the channel.
"""
function create_channel(
    channelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/channels",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelName" => channelName), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_dataset(actions, dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Used to create a dataset. A dataset stores data retrieved from a data store by applying a
queryAction (a SQL query) or a containerAction (executing a containerized application).
This operation creates the skeleton of a dataset. The dataset can be populated manually by
calling CreateDatasetContent or automatically according to a trigger you specify.

# Arguments
- `actions`: A list of actions that create the dataset contents.
- `dataset_name`: The name of the dataset.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"content_delivery_rules"`: When dataset contents are created, they are delivered to
  destinations specified here.
- `"late_data_rules"`: A list of data rules that send notifications to CloudWatch, when
  data arrives late. To specify lateDataRules, the dataset must use a DeltaTimer filter.
- `"retention_period"`: Optional. How long, in days, versions of dataset contents are kept
  for the dataset. If not specified or set to null, versions of dataset contents are retained
  for at most 90 days. The number of versions of dataset contents retained is determined by
  the versioningConfiguration parameter. For more information, see  Keeping Multiple Versions
  of IoT Analytics datasets in the IoT Analytics User Guide.
- `"tags"`: Metadata which can be used to manage the dataset.
- `"triggers"`: A list of triggers. A trigger causes dataset contents to be populated at a
  specified time interval or when another dataset's contents are created. The list of
  triggers can be empty or contain up to five DataSetTrigger objects.
- `"versioning_configuration"`: Optional. How many versions of dataset contents are kept.
  If not specified or set to null, only the latest version plus the latest succeeded version
  (if they are different) are kept for the time period specified by the retentionPeriod
  parameter. For more information, see Keeping Multiple Versions of IoT Analytics datasets in
  the IoT Analytics User Guide.
"""
function create_dataset(
    actions, datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/datasets",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("actions" => actions, "datasetName" => datasetName),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_dataset_content(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates the content of a dataset by applying a queryAction (a SQL query) or a
containerAction (executing a containerized application).

# Arguments
- `dataset_name`: The name of the dataset.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"version_id"`: The version ID of the dataset content. To specify versionId for a dataset
  content, the dataset must use a DeltaTimer filter.
"""
function create_dataset_content(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/datasets/$(datasetName)/content",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_datastore(datastore_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a data store, which is a repository for messages.

# Arguments
- `datastore_name`: The name of the data store.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"datastore_partitions"`:  Contains information about the partition dimensions in a data
  store.
- `"datastore_storage"`: Where data in a data store is stored.. You can choose
  serviceManagedS3 storage, customerManagedS3 storage, or iotSiteWiseMultiLayerStorage
  storage. The default is serviceManagedS3. You can't change the choice of Amazon S3 storage
  after your data store is created.
- `"file_format_configuration"`: Contains the configuration information of file formats.
  IoT Analytics data stores support JSON and Parquet. The default file format is JSON. You
  can specify only one format. You can't change the file format after you create the data
  store.
- `"retention_period"`: How long, in days, message data is kept for the data store. When
  customerManagedS3 storage is selected, this parameter is ignored.
- `"tags"`: Metadata which can be used to manage the data store.
"""
function create_datastore(
    datastoreName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/datastores",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("datastoreName" => datastoreName), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_pipeline(pipeline_activities, pipeline_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a pipeline. A pipeline consumes messages from a channel and allows you to process
the messages before storing them in a data store. You must specify both a channel and a
datastore activity and, optionally, as many as 23 additional activities in the
pipelineActivities array.

# Arguments
- `pipeline_activities`: A list of PipelineActivity objects. Activities perform
  transformations on your messages, such as removing, renaming or adding message attributes;
  filtering messages based on attribute values; invoking your Lambda unctions on messages for
  advanced processing; or performing mathematical transformations to normalize device data.
  The list can be 2-25 PipelineActivity objects and must contain both a channel and a
  datastore activity. Each entry in the list must contain only one activity. For example:
  pipelineActivities = [ { \"channel\": { ... } }, { \"lambda\": { ... } }, ... ]
- `pipeline_name`: The name of the pipeline.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tags"`: Metadata which can be used to manage the pipeline.
"""
function create_pipeline(
    pipelineActivities,
    pipelineName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/pipelines",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "pipelineActivities" => pipelineActivities,
                    "pipelineName" => pipelineName,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_channel(channel_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified channel.

# Arguments
- `channel_name`: The name of the channel to delete.

"""
function delete_channel(
    channelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/channels/$(channelName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_dataset(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified dataset. You do not have to delete the content of the dataset before
you perform this operation.

# Arguments
- `dataset_name`: The name of the dataset to delete.

"""
function delete_dataset(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/datasets/$(datasetName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_dataset_content(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the content of the specified dataset.

# Arguments
- `dataset_name`: The name of the dataset whose content is deleted.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"version_id"`: The version of the dataset whose content is deleted. You can also use the
  strings \"LATEST\" or \"LATEST_SUCCEEDED\" to delete the latest or latest successfully
  completed data set. If not specified, \"LATEST_SUCCEEDED\" is the default.
"""
function delete_dataset_content(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/datasets/$(datasetName)/content",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_datastore(datastore_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified data store.

# Arguments
- `datastore_name`: The name of the data store to delete.

"""
function delete_datastore(
    datastoreName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/datastores/$(datastoreName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_pipeline(pipeline_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline to delete.

"""
function delete_pipeline(
    pipelineName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/pipelines/$(pipelineName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_channel(channel_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a channel.

# Arguments
- `channel_name`: The name of the channel whose information is retrieved.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"include_statistics"`: If true, additional statistical information about the channel is
  included in the response. This feature can't be used with a channel whose S3 storage is
  customer-managed.
"""
function describe_channel(
    channelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/channels/$(channelName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_dataset(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a dataset.

# Arguments
- `dataset_name`: The name of the dataset whose information is retrieved.

"""
function describe_dataset(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/datasets/$(datasetName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_datastore(datastore_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a data store.

# Arguments
- `datastore_name`: The name of the data store

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"include_statistics"`: If true, additional statistical information about the data store
  is included in the response. This feature can't be used with a data store whose S3 storage
  is customer-managed.
"""
function describe_datastore(
    datastoreName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/datastores/$(datastoreName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_logging_options(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the current settings of the IoT Analytics logging options.

"""
function describe_logging_options(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET", "/logging", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_pipeline(pipeline_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about a pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline whose information is retrieved.

"""
function describe_pipeline(
    pipelineName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/pipelines/$(pipelineName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_dataset_content(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the contents of a dataset as presigned URIs.

# Arguments
- `dataset_name`: The name of the dataset whose contents are retrieved.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"version_id"`: The version of the dataset whose contents are retrieved. You can also use
  the strings \"LATEST\" or \"LATEST_SUCCEEDED\" to retrieve the contents of the latest or
  latest successfully completed dataset. If not specified, \"LATEST_SUCCEEDED\" is the
  default.
"""
function get_dataset_content(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/datasets/$(datasetName)/content",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_channels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of channels.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return in this request. The default
  value is 100.
- `"next_token"`: The token for the next set of results.
"""
function list_channels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET", "/channels", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_dataset_contents(dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists information about dataset contents that have been created.

# Arguments
- `dataset_name`: The name of the dataset whose contents information you want to list.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return in this request.
- `"next_token"`: The token for the next set of results.
- `"scheduled_before"`: A filter to limit results to those dataset contents whose creation
  is scheduled before the given time. See the field triggers.schedule in the CreateDataset
  request. (timestamp)
- `"scheduled_on_or_after"`: A filter to limit results to those dataset contents whose
  creation is scheduled on or after the given time. See the field triggers.schedule in the
  CreateDataset request. (timestamp)
"""
function list_dataset_contents(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/datasets/$(datasetName)/contents",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_datasets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves information about datasets.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return in this request. The default
  value is 100.
- `"next_token"`: The token for the next set of results.
"""
function list_datasets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET", "/datasets", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_datastores(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of data stores.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return in this request. The default
  value is 100.
- `"next_token"`: The token for the next set of results.
"""
function list_datastores(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET", "/datastores", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of pipelines.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return in this request. The default
  value is 100.
- `"next_token"`: The token for the next set of results.
"""
function list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET", "/pipelines", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the tags (metadata) that you have assigned to the resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to list.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/tags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("resourceArn" => resourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_logging_options(logging_options; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sets or updates the IoT Analytics logging options. If you update the value of any
loggingOptions field, it takes up to one minute for the change to take effect. Also, if you
change the policy attached to the role you specified in the roleArn field (for example, to
correct an invalid policy), it takes up to five minutes for that change to take effect.

# Arguments
- `logging_options`: The new values of the IoT Analytics logging options.

"""
function put_logging_options(
    loggingOptions; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "PUT",
        "/logging",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("loggingOptions" => loggingOptions), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    run_pipeline_activity(payloads, pipeline_activity; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Simulates the results of running a pipeline activity on a message payload.

# Arguments
- `payloads`: The sample message payloads on which the pipeline activity is run.
- `pipeline_activity`: The pipeline activity that is run. This must not be a channel
  activity or a data store activity because these activities are used in a pipeline only to
  load the original message and to store the (possibly) transformed message. If a Lambda
  activity is specified, only short-running Lambda functions (those with a timeout of less
  than 30 seconds or less) can be used.

"""
function run_pipeline_activity(
    payloads, pipelineActivity; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/pipelineactivities/run",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "payloads" => payloads, "pipelineActivity" => pipelineActivity
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    sample_channel_data(channel_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a sample of messages from the specified channel ingested during the specified
timeframe. Up to 10 messages can be retrieved.

# Arguments
- `channel_name`: The name of the channel whose message samples are retrieved.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"end_time"`: The end of the time window from which sample messages are retrieved.
- `"max_messages"`: The number of sample messages to be retrieved. The limit is 10. The
  default is also 10.
- `"start_time"`: The start of the time window from which sample messages are retrieved.
"""
function sample_channel_data(
    channelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "GET",
        "/channels/$(channelName)/sample",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_pipeline_reprocessing(pipeline_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts the reprocessing of raw message data through the pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline on which to start reprocessing.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"channel_messages"`: Specifies one or more sets of channel messages that you want to
  reprocess. If you use the channelMessages object, you must not specify a value for
  startTime and endTime.
- `"end_time"`: The end time (exclusive) of raw message data that is reprocessed. If you
  specify a value for the endTime parameter, you must not use the channelMessages object.
- `"start_time"`: The start time (inclusive) of raw message data that is reprocessed. If
  you specify a value for the startTime parameter, you must not use the channelMessages
  object.
"""
function start_pipeline_reprocessing(
    pipelineName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/pipelines/$(pipelineName)/reprocessing",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to
manage a resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to modify.
- `tags`: The new or modified tags for the resource.

"""
function tag_resource(
    resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "POST",
        "/tags",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("resourceArn" => resourceArn, "tags" => tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the given tags (metadata) from the resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to remove.
- `tag_keys`: The keys of those tags which you want to remove.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "DELETE",
        "/tags",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("resourceArn" => resourceArn, "tagKeys" => tagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_channel(channel_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Used to update the settings of a channel.

# Arguments
- `channel_name`: The name of the channel to be updated.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"channel_storage"`: Where channel data is stored. You can choose one of serviceManagedS3
  or customerManagedS3 storage. If not specified, the default is serviceManagedS3. You can't
  change this storage option after the channel is created.
- `"retention_period"`: How long, in days, message data is kept for the channel. The
  retention period can't be updated if the channel's Amazon S3 storage is customer-managed.
"""
function update_channel(
    channelName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "PUT",
        "/channels/$(channelName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_dataset(actions, dataset_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the settings of a dataset.

# Arguments
- `actions`: A list of DatasetAction objects.
- `dataset_name`: The name of the dataset to update.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"content_delivery_rules"`: When dataset contents are created, they are delivered to
  destinations specified here.
- `"late_data_rules"`: A list of data rules that send notifications to CloudWatch, when
  data arrives late. To specify lateDataRules, the dataset must use a DeltaTimer filter.
- `"retention_period"`: How long, in days, dataset contents are kept for the dataset.
- `"triggers"`: A list of DatasetTrigger objects. The list can be empty or can contain up
  to five DatasetTrigger objects.
- `"versioning_configuration"`: Optional. How many versions of dataset contents are kept.
  If not specified or set to null, only the latest version plus the latest succeeded version
  (if they are different) are kept for the time period specified by the retentionPeriod
  parameter. For more information, see Keeping Multiple Versions of IoT Analytics datasets in
  the IoT Analytics User Guide.
"""
function update_dataset(
    actions, datasetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "PUT",
        "/datasets/$(datasetName)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("actions" => actions), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_datastore(datastore_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Used to update the settings of a data store.

# Arguments
- `datastore_name`: The name of the data store to be updated.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"datastore_storage"`: Where data in a data store is stored.. You can choose
  serviceManagedS3 storage, customerManagedS3 storage, or iotSiteWiseMultiLayerStorage
  storage. The default is serviceManagedS3. You can't change the choice of Amazon S3 storage
  after your data store is created.
- `"file_format_configuration"`: Contains the configuration information of file formats.
  IoT Analytics data stores support JSON and Parquet. The default file format is JSON. You
  can specify only one format. You can't change the file format after you create the data
  store.
- `"retention_period"`: How long, in days, message data is kept for the data store. The
  retention period can't be updated if the data store's Amazon S3 storage is customer-managed.
"""
function update_datastore(
    datastoreName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "PUT",
        "/datastores/$(datastoreName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_pipeline(pipeline_activities, pipeline_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the settings of a pipeline. You must specify both a channel and a datastore
activity and, optionally, as many as 23 additional activities in the pipelineActivities
array.

# Arguments
- `pipeline_activities`: A list of PipelineActivity objects. Activities perform
  transformations on your messages, such as removing, renaming or adding message attributes;
  filtering messages based on attribute values; invoking your Lambda functions on messages
  for advanced processing; or performing mathematical transformations to normalize device
  data. The list can be 2-25 PipelineActivity objects and must contain both a channel and a
  datastore activity. Each entry in the list must contain only one activity. For example:
  pipelineActivities = [ { \"channel\": { ... } }, { \"lambda\": { ... } }, ... ]
- `pipeline_name`: The name of the pipeline to update.

"""
function update_pipeline(
    pipelineActivities,
    pipelineName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return iotanalytics(
        "PUT",
        "/pipelines/$(pipelineName)",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("pipelineActivities" => pipelineActivities), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
