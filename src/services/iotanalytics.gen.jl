# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: iotanalytics
using AWS.Compat
using AWS.UUIDs

"""
    batch_put_message(channel_name, messages)
    batch_put_message(channel_name, messages, params::Dict{String,<:Any})

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
    channelName, messages; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "POST",
        "/messages/batch",
        Dict{String,Any}("channelName" => channelName, "messages" => messages);
        aws_config=aws_config,
    )
end
function batch_put_message(
    channelName,
    messages,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    cancel_pipeline_reprocessing(pipeline_name, reprocessing_id)
    cancel_pipeline_reprocessing(pipeline_name, reprocessing_id, params::Dict{String,<:Any})

Cancels the reprocessing of data through the pipeline.

# Arguments
- `pipeline_name`: The name of pipeline for which data reprocessing is canceled.
- `reprocessing_id`: The ID of the reprocessing task (returned by
  StartPipelineReprocessing).

"""
function cancel_pipeline_reprocessing(
    pipelineName, reprocessingId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "DELETE",
        "/pipelines/$(pipelineName)/reprocessing/$(reprocessingId)";
        aws_config=aws_config,
    )
end
function cancel_pipeline_reprocessing(
    pipelineName,
    reprocessingId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "DELETE",
        "/pipelines/$(pipelineName)/reprocessing/$(reprocessingId)",
        params;
        aws_config=aws_config,
    )
end

"""
    create_channel(channel_name)
    create_channel(channel_name, params::Dict{String,<:Any})

Used to create a channel. A channel collects data from an MQTT topic and archives the raw,
unprocessed messages before publishing the data to a pipeline.

# Arguments
- `channel_name`: The name of the channel.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"channelStorage"`: Where channel data is stored. You can choose one of serviceManagedS3
  or customerManagedS3 storage. If not specified, the default is serviceManagedS3. You can't
  change this storage option after the channel is created.
- `"retentionPeriod"`: How long, in days, message data is kept for the channel. When
  customerManagedS3 storage is selected, this parameter is ignored.
- `"tags"`: Metadata which can be used to manage the channel.
"""
function create_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics(
        "POST",
        "/channels",
        Dict{String,Any}("channelName" => channelName);
        aws_config=aws_config,
    )
end
function create_channel(
    channelName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "POST",
        "/channels",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelName" => channelName), params)
        );
        aws_config=aws_config,
    )
end

"""
    create_dataset(actions, dataset_name)
    create_dataset(actions, dataset_name, params::Dict{String,<:Any})

Used to create a dataset. A dataset stores data retrieved from a data store by applying a
queryAction (a SQL query) or a containerAction (executing a containerized application).
This operation creates the skeleton of a dataset. The dataset can be populated manually by
calling CreateDatasetContent or automatically according to a trigger you specify.

# Arguments
- `actions`: A list of actions that create the dataset contents.
- `dataset_name`: The name of the dataset.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"contentDeliveryRules"`: When dataset contents are created, they are delivered to
  destinations specified here.
- `"lateDataRules"`: A list of data rules that send notifications to CloudWatch, when data
  arrives late. To specify lateDataRules, the dataset must use a DeltaTimer filter.
- `"retentionPeriod"`: Optional. How long, in days, versions of dataset contents are kept
  for the dataset. If not specified or set to null, versions of dataset contents are retained
  for at most 90 days. The number of versions of dataset contents retained is determined by
  the versioningConfiguration parameter. For more information, see  Keeping Multiple Versions
  of IoT Analytics datasets in the IoT Analytics User Guide.
- `"tags"`: Metadata which can be used to manage the dataset.
- `"triggers"`: A list of triggers. A trigger causes dataset contents to be populated at a
  specified time interval or when another dataset's contents are created. The list of
  triggers can be empty or contain up to five DataSetTrigger objects.
- `"versioningConfiguration"`: Optional. How many versions of dataset contents are kept. If
  not specified or set to null, only the latest version plus the latest succeeded version (if
  they are different) are kept for the time period specified by the retentionPeriod
  parameter. For more information, see Keeping Multiple Versions of IoT Analytics datasets in
  the IoT Analytics User Guide.
"""
function create_dataset(
    actions, datasetName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "POST",
        "/datasets",
        Dict{String,Any}("actions" => actions, "datasetName" => datasetName);
        aws_config=aws_config,
    )
end
function create_dataset(
    actions,
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    create_dataset_content(dataset_name)
    create_dataset_content(dataset_name, params::Dict{String,<:Any})

Creates the content of a dataset by applying a queryAction (a SQL query) or a
containerAction (executing a containerized application).

# Arguments
- `dataset_name`: The name of the dataset.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"versionId"`: The version ID of the dataset content. To specify versionId for a dataset
  content, the dataset must use a DeltaTimer filter.
"""
function create_dataset_content(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("POST", "/datasets/$(datasetName)/content"; aws_config=aws_config)
end
function create_dataset_content(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "POST", "/datasets/$(datasetName)/content", params; aws_config=aws_config
    )
end

"""
    create_datastore(datastore_name)
    create_datastore(datastore_name, params::Dict{String,<:Any})

Creates a data store, which is a repository for messages.

# Arguments
- `datastore_name`: The name of the data store.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"datastorePartitions"`:  Contains information about the partition dimensions in a data
  store.
- `"datastoreStorage"`: Where data in a data store is stored.. You can choose
  serviceManagedS3 storage, customerManagedS3 storage, or iotSiteWiseMultiLayerStorage
  storage. The default is serviceManagedS3. You can't change the choice of Amazon S3 storage
  after your data store is created.
- `"fileFormatConfiguration"`: Contains the configuration information of file formats. IoT
  Analytics data stores support JSON and Parquet. The default file format is JSON. You can
  specify only one format. You can't change the file format after you create the data store.
- `"retentionPeriod"`: How long, in days, message data is kept for the data store. When
  customerManagedS3 storage is selected, this parameter is ignored.
- `"tags"`: Metadata which can be used to manage the data store.
"""
function create_datastore(datastoreName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics(
        "POST",
        "/datastores",
        Dict{String,Any}("datastoreName" => datastoreName);
        aws_config=aws_config,
    )
end
function create_datastore(
    datastoreName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "POST",
        "/datastores",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("datastoreName" => datastoreName), params)
        );
        aws_config=aws_config,
    )
end

"""
    create_pipeline(pipeline_activities, pipeline_name)
    create_pipeline(pipeline_activities, pipeline_name, params::Dict{String,<:Any})

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
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: Metadata which can be used to manage the pipeline.
"""
function create_pipeline(
    pipelineActivities, pipelineName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "POST",
        "/pipelines",
        Dict{String,Any}(
            "pipelineActivities" => pipelineActivities, "pipelineName" => pipelineName
        );
        aws_config=aws_config,
    )
end
function create_pipeline(
    pipelineActivities,
    pipelineName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    delete_channel(channel_name)
    delete_channel(channel_name, params::Dict{String,<:Any})

Deletes the specified channel.

# Arguments
- `channel_name`: The name of the channel to delete.

"""
function delete_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("DELETE", "/channels/$(channelName)"; aws_config=aws_config)
end
function delete_channel(
    channelName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("DELETE", "/channels/$(channelName)", params; aws_config=aws_config)
end

"""
    delete_dataset(dataset_name)
    delete_dataset(dataset_name, params::Dict{String,<:Any})

Deletes the specified dataset. You do not have to delete the content of the dataset before
you perform this operation.

# Arguments
- `dataset_name`: The name of the dataset to delete.

"""
function delete_dataset(datasetName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("DELETE", "/datasets/$(datasetName)"; aws_config=aws_config)
end
function delete_dataset(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("DELETE", "/datasets/$(datasetName)", params; aws_config=aws_config)
end

"""
    delete_dataset_content(dataset_name)
    delete_dataset_content(dataset_name, params::Dict{String,<:Any})

Deletes the content of the specified dataset.

# Arguments
- `dataset_name`: The name of the dataset whose content is deleted.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"versionId"`: The version of the dataset whose content is deleted. You can also use the
  strings \"LATEST\" or \"LATEST_SUCCEEDED\" to delete the latest or latest successfully
  completed data set. If not specified, \"LATEST_SUCCEEDED\" is the default.
"""
function delete_dataset_content(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("DELETE", "/datasets/$(datasetName)/content"; aws_config=aws_config)
end
function delete_dataset_content(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "DELETE", "/datasets/$(datasetName)/content", params; aws_config=aws_config
    )
end

"""
    delete_datastore(datastore_name)
    delete_datastore(datastore_name, params::Dict{String,<:Any})

Deletes the specified data store.

# Arguments
- `datastore_name`: The name of the data store to delete.

"""
function delete_datastore(datastoreName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("DELETE", "/datastores/$(datastoreName)"; aws_config=aws_config)
end
function delete_datastore(
    datastoreName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "DELETE", "/datastores/$(datastoreName)", params; aws_config=aws_config
    )
end

"""
    delete_pipeline(pipeline_name)
    delete_pipeline(pipeline_name, params::Dict{String,<:Any})

Deletes the specified pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline to delete.

"""
function delete_pipeline(pipelineName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("DELETE", "/pipelines/$(pipelineName)"; aws_config=aws_config)
end
function delete_pipeline(
    pipelineName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "DELETE", "/pipelines/$(pipelineName)", params; aws_config=aws_config
    )
end

"""
    describe_channel(channel_name)
    describe_channel(channel_name, params::Dict{String,<:Any})

Retrieves information about a channel.

# Arguments
- `channel_name`: The name of the channel whose information is retrieved.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"includeStatistics"`: If true, additional statistical information about the channel is
  included in the response. This feature can't be used with a channel whose S3 storage is
  customer-managed.
"""
function describe_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/channels/$(channelName)"; aws_config=aws_config)
end
function describe_channel(
    channelName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("GET", "/channels/$(channelName)", params; aws_config=aws_config)
end

"""
    describe_dataset(dataset_name)
    describe_dataset(dataset_name, params::Dict{String,<:Any})

Retrieves information about a dataset.

# Arguments
- `dataset_name`: The name of the dataset whose information is retrieved.

"""
function describe_dataset(datasetName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/datasets/$(datasetName)"; aws_config=aws_config)
end
function describe_dataset(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("GET", "/datasets/$(datasetName)", params; aws_config=aws_config)
end

"""
    describe_datastore(datastore_name)
    describe_datastore(datastore_name, params::Dict{String,<:Any})

Retrieves information about a data store.

# Arguments
- `datastore_name`: The name of the data store

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"includeStatistics"`: If true, additional statistical information about the data store
  is included in the response. This feature can't be used with a data store whose S3 storage
  is customer-managed.
"""
function describe_datastore(
    datastoreName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/datastores/$(datastoreName)"; aws_config=aws_config)
end
function describe_datastore(
    datastoreName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "GET", "/datastores/$(datastoreName)", params; aws_config=aws_config
    )
end

"""
    describe_logging_options()
    describe_logging_options(params::Dict{String,<:Any})

Retrieves the current settings of the IoT Analytics logging options.

"""
function describe_logging_options(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/logging"; aws_config=aws_config)
end
function describe_logging_options(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/logging", params; aws_config=aws_config)
end

"""
    describe_pipeline(pipeline_name)
    describe_pipeline(pipeline_name, params::Dict{String,<:Any})

Retrieves information about a pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline whose information is retrieved.

"""
function describe_pipeline(pipelineName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/pipelines/$(pipelineName)"; aws_config=aws_config)
end
function describe_pipeline(
    pipelineName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("GET", "/pipelines/$(pipelineName)", params; aws_config=aws_config)
end

"""
    get_dataset_content(dataset_name)
    get_dataset_content(dataset_name, params::Dict{String,<:Any})

Retrieves the contents of a dataset as presigned URIs.

# Arguments
- `dataset_name`: The name of the dataset whose contents are retrieved.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"versionId"`: The version of the dataset whose contents are retrieved. You can also use
  the strings \"LATEST\" or \"LATEST_SUCCEEDED\" to retrieve the contents of the latest or
  latest successfully completed dataset. If not specified, \"LATEST_SUCCEEDED\" is the
  default.
"""
function get_dataset_content(datasetName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/datasets/$(datasetName)/content"; aws_config=aws_config)
end
function get_dataset_content(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "GET", "/datasets/$(datasetName)/content", params; aws_config=aws_config
    )
end

"""
    list_channels()
    list_channels(params::Dict{String,<:Any})

Retrieves a list of channels.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request. The default
  value is 100.
- `"nextToken"`: The token for the next set of results.
"""
function list_channels(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/channels"; aws_config=aws_config)
end
function list_channels(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/channels", params; aws_config=aws_config)
end

"""
    list_dataset_contents(dataset_name)
    list_dataset_contents(dataset_name, params::Dict{String,<:Any})

Lists information about dataset contents that have been created.

# Arguments
- `dataset_name`: The name of the dataset whose contents information you want to list.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request.
- `"nextToken"`: The token for the next set of results.
- `"scheduledBefore"`: A filter to limit results to those dataset contents whose creation
  is scheduled before the given time. See the field triggers.schedule in the CreateDataset
  request. (timestamp)
- `"scheduledOnOrAfter"`: A filter to limit results to those dataset contents whose
  creation is scheduled on or after the given time. See the field triggers.schedule in the
  CreateDataset request. (timestamp)
"""
function list_dataset_contents(
    datasetName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/datasets/$(datasetName)/contents"; aws_config=aws_config)
end
function list_dataset_contents(
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "GET", "/datasets/$(datasetName)/contents", params; aws_config=aws_config
    )
end

"""
    list_datasets()
    list_datasets(params::Dict{String,<:Any})

Retrieves information about datasets.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request. The default
  value is 100.
- `"nextToken"`: The token for the next set of results.
"""
function list_datasets(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/datasets"; aws_config=aws_config)
end
function list_datasets(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/datasets", params; aws_config=aws_config)
end

"""
    list_datastores()
    list_datastores(params::Dict{String,<:Any})

Retrieves a list of data stores.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request. The default
  value is 100.
- `"nextToken"`: The token for the next set of results.
"""
function list_datastores(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/datastores"; aws_config=aws_config)
end
function list_datastores(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/datastores", params; aws_config=aws_config)
end

"""
    list_pipelines()
    list_pipelines(params::Dict{String,<:Any})

Retrieves a list of pipelines.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in this request. The default
  value is 100.
- `"nextToken"`: The token for the next set of results.
"""
function list_pipelines(; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/pipelines"; aws_config=aws_config)
end
function list_pipelines(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics("GET", "/pipelines", params; aws_config=aws_config)
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists the tags (metadata) that you have assigned to the resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to list.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "GET",
        "/tags",
        Dict{String,Any}("resourceArn" => resourceArn);
        aws_config=aws_config,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "GET",
        "/tags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("resourceArn" => resourceArn), params)
        );
        aws_config=aws_config,
    )
end

"""
    put_logging_options(logging_options)
    put_logging_options(logging_options, params::Dict{String,<:Any})

Sets or updates the IoT Analytics logging options. If you update the value of any
loggingOptions field, it takes up to one minute for the change to take effect. Also, if you
change the policy attached to the role you specified in the roleArn field (for example, to
correct an invalid policy), it takes up to five minutes for that change to take effect.

# Arguments
- `logging_options`: The new values of the IoT Analytics logging options.

"""
function put_logging_options(
    loggingOptions; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "PUT",
        "/logging",
        Dict{String,Any}("loggingOptions" => loggingOptions);
        aws_config=aws_config,
    )
end
function put_logging_options(
    loggingOptions,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "PUT",
        "/logging",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("loggingOptions" => loggingOptions), params)
        );
        aws_config=aws_config,
    )
end

"""
    run_pipeline_activity(payloads, pipeline_activity)
    run_pipeline_activity(payloads, pipeline_activity, params::Dict{String,<:Any})

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
    payloads, pipelineActivity; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "POST",
        "/pipelineactivities/run",
        Dict{String,Any}("payloads" => payloads, "pipelineActivity" => pipelineActivity);
        aws_config=aws_config,
    )
end
function run_pipeline_activity(
    payloads,
    pipelineActivity,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    sample_channel_data(channel_name)
    sample_channel_data(channel_name, params::Dict{String,<:Any})

Retrieves a sample of messages from the specified channel ingested during the specified
timeframe. Up to 10 messages can be retrieved.

# Arguments
- `channel_name`: The name of the channel whose message samples are retrieved.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"endTime"`: The end of the time window from which sample messages are retrieved.
- `"maxMessages"`: The number of sample messages to be retrieved. The limit is 10. The
  default is also 10.
- `"startTime"`: The start of the time window from which sample messages are retrieved.
"""
function sample_channel_data(channelName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("GET", "/channels/$(channelName)/sample"; aws_config=aws_config)
end
function sample_channel_data(
    channelName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "GET", "/channels/$(channelName)/sample", params; aws_config=aws_config
    )
end

"""
    start_pipeline_reprocessing(pipeline_name)
    start_pipeline_reprocessing(pipeline_name, params::Dict{String,<:Any})

Starts the reprocessing of raw message data through the pipeline.

# Arguments
- `pipeline_name`: The name of the pipeline on which to start reprocessing.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"channelMessages"`: Specifies one or more sets of channel messages that you want to
  reprocess. If you use the channelMessages object, you must not specify a value for
  startTime and endTime.
- `"endTime"`: The end time (exclusive) of raw message data that is reprocessed. If you
  specify a value for the endTime parameter, you must not use the channelMessages object.
- `"startTime"`: The start time (inclusive) of raw message data that is reprocessed. If you
  specify a value for the startTime parameter, you must not use the channelMessages object.
"""
function start_pipeline_reprocessing(
    pipelineName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "POST", "/pipelines/$(pipelineName)/reprocessing"; aws_config=aws_config
    )
end
function start_pipeline_reprocessing(
    pipelineName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "POST", "/pipelines/$(pipelineName)/reprocessing", params; aws_config=aws_config
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to
manage a resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to modify.
- `tags`: The new or modified tags for the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics(
        "POST",
        "/tags",
        Dict{String,Any}("resourceArn" => resourceArn, "tags" => tags);
        aws_config=aws_config,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes the given tags (metadata) from the resource.

# Arguments
- `resource_arn`: The ARN of the resource whose tags you want to remove.
- `tag_keys`: The keys of those tags which you want to remove.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "DELETE",
        "/tags",
        Dict{String,Any}("resourceArn" => resourceArn, "tagKeys" => tagKeys);
        aws_config=aws_config,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    update_channel(channel_name)
    update_channel(channel_name, params::Dict{String,<:Any})

Used to update the settings of a channel.

# Arguments
- `channel_name`: The name of the channel to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"channelStorage"`: Where channel data is stored. You can choose one of serviceManagedS3
  or customerManagedS3 storage. If not specified, the default is serviceManagedS3. You can't
  change this storage option after the channel is created.
- `"retentionPeriod"`: How long, in days, message data is kept for the channel. The
  retention period can't be updated if the channel's Amazon S3 storage is customer-managed.
"""
function update_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("PUT", "/channels/$(channelName)"; aws_config=aws_config)
end
function update_channel(
    channelName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics("PUT", "/channels/$(channelName)", params; aws_config=aws_config)
end

"""
    update_dataset(actions, dataset_name)
    update_dataset(actions, dataset_name, params::Dict{String,<:Any})

Updates the settings of a dataset.

# Arguments
- `actions`: A list of DatasetAction objects.
- `dataset_name`: The name of the dataset to update.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"contentDeliveryRules"`: When dataset contents are created, they are delivered to
  destinations specified here.
- `"lateDataRules"`: A list of data rules that send notifications to CloudWatch, when data
  arrives late. To specify lateDataRules, the dataset must use a DeltaTimer filter.
- `"retentionPeriod"`: How long, in days, dataset contents are kept for the dataset.
- `"triggers"`: A list of DatasetTrigger objects. The list can be empty or can contain up
  to five DatasetTrigger objects.
- `"versioningConfiguration"`: Optional. How many versions of dataset contents are kept. If
  not specified or set to null, only the latest version plus the latest succeeded version (if
  they are different) are kept for the time period specified by the retentionPeriod
  parameter. For more information, see Keeping Multiple Versions of IoT Analytics datasets in
  the IoT Analytics User Guide.
"""
function update_dataset(
    actions, datasetName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "PUT",
        "/datasets/$(datasetName)",
        Dict{String,Any}("actions" => actions);
        aws_config=aws_config,
    )
end
function update_dataset(
    actions,
    datasetName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "PUT",
        "/datasets/$(datasetName)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("actions" => actions), params));
        aws_config=aws_config,
    )
end

"""
    update_datastore(datastore_name)
    update_datastore(datastore_name, params::Dict{String,<:Any})

Used to update the settings of a data store.

# Arguments
- `datastore_name`: The name of the data store to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"datastoreStorage"`: Where data in a data store is stored.. You can choose
  serviceManagedS3 storage, customerManagedS3 storage, or iotSiteWiseMultiLayerStorage
  storage. The default is serviceManagedS3. You can't change the choice of Amazon S3 storage
  after your data store is created.
- `"fileFormatConfiguration"`: Contains the configuration information of file formats. IoT
  Analytics data stores support JSON and Parquet. The default file format is JSON. You can
  specify only one format. You can't change the file format after you create the data store.
- `"retentionPeriod"`: How long, in days, message data is kept for the data store. The
  retention period can't be updated if the data store's Amazon S3 storage is customer-managed.
"""
function update_datastore(datastoreName; aws_config::AbstractAWSConfig=global_aws_config())
    return iotanalytics("PUT", "/datastores/$(datastoreName)"; aws_config=aws_config)
end
function update_datastore(
    datastoreName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "PUT", "/datastores/$(datastoreName)", params; aws_config=aws_config
    )
end

"""
    update_pipeline(pipeline_activities, pipeline_name)
    update_pipeline(pipeline_activities, pipeline_name, params::Dict{String,<:Any})

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
    pipelineActivities, pipelineName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return iotanalytics(
        "PUT",
        "/pipelines/$(pipelineName)",
        Dict{String,Any}("pipelineActivities" => pipelineActivities);
        aws_config=aws_config,
    )
end
function update_pipeline(
    pipelineActivities,
    pipelineName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return iotanalytics(
        "PUT",
        "/pipelines/$(pipelineName)",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("pipelineActivities" => pipelineActivities), params
            ),
        );
        aws_config=aws_config,
    )
end