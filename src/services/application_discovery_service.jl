# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: application_discovery_service
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "end_time" => "endTime",
    "agent_ids" => "agentIds",
    "next_token" => "nextToken",
    "client_request_token" => "clientRequestToken",
    "start_time" => "startTime",
    "name" => "name",
    "export_ids" => "exportIds",
    "description" => "description",
    "max_results" => "maxResults",
    "neighbor_configuration_ids" => "neighborConfigurationIds",
    "order_by" => "orderBy",
    "port_information_needed" => "portInformationNeeded",
    "filters" => "filters",
    "export_data_format" => "exportDataFormat",
    "tags" => "tags",
)

"""
    associate_configuration_items_to_application(application_configuration_id, configuration_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates one or more configuration items with an application.

# Arguments
- `application_configuration_id`: The configuration ID of an application with which items
  are to be associated.
- `configuration_ids`: The ID of each configuration item to be associated with an
  application.

"""
function associate_configuration_items_to_application(
    applicationConfigurationId,
    configurationIds;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "AssociateConfigurationItemsToApplication",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "applicationConfigurationId" => applicationConfigurationId,
                    "configurationIds" => configurationIds,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    batch_delete_import_data(import_task_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes one or more import tasks, each identified by their import ID. Each import task has
a number of records that can identify servers or applications.  AWS Application Discovery
Service has built-in matching logic that will identify when discovered servers match
existing entries that you've previously discovered, the information for the
already-existing discovered server is updated. When you delete an import task that contains
records that were used to match, the information in those matched records that comes from
the deleted records will also be deleted.

# Arguments
- `import_task_ids`: The IDs for the import tasks that you want to delete.

"""
function batch_delete_import_data(
    importTaskIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "BatchDeleteImportData",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("importTaskIds" => importTaskIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_application(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an application with the given name and description.

# Arguments
- `name`: Name of the application to be created.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: Description of the application to be created.
"""
function create_application(
    name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "CreateApplication",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("name" => name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_tags(configuration_ids, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates one or more tags for configuration items. Tags are metadata that help you
categorize IT assets. This API accepts a list of multiple configuration items.

# Arguments
- `configuration_ids`: A list of configuration items that you want to tag.
- `tags`: Tags that you want to associate with one or more configuration items. Specify the
  tags that you want to create in a key-value format. For example:  {\"key\": \"serverType\",
  \"value\": \"webServer\"}

"""
function create_tags(
    configurationIds, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "CreateTags",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("configurationIds" => configurationIds, "tags" => tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_applications(configuration_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a list of applications and their associations with configuration items.

# Arguments
- `configuration_ids`: Configuration ID of an application to be deleted.

"""
function delete_applications(
    configurationIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DeleteApplications",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_tags(configuration_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the association between configuration items and one or more tags. This API accepts
a list of multiple configuration items.

# Arguments
- `configuration_ids`: A list of configuration items with tags that you want to delete.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tags"`: Tags that you want to delete from one or more configuration items. Specify the
  tags that you want to delete in a key-value format. For example:  {\"key\": \"serverType\",
  \"value\": \"webServer\"}
"""
function delete_tags(
    configurationIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DeleteTags",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_agents(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists agents or connectors as specified by ID or other filters. All agents/connectors
associated with your user account can be listed if you call DescribeAgents as is without
passing any parameters.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"agent_ids"`: The agent or the Connector IDs for which you want information. If you
  specify no IDs, the system returns information about all agents/Connectors associated with
  your AWS user account.
- `"filters"`: You can filter the request using various logical operators and a key-value
  format. For example:   {\"key\": \"collectionStatus\", \"value\": \"STARTED\"}
- `"max_results"`: The total number of agents/Connectors to return in a single page of
  output. The maximum value is 100.
- `"next_token"`: Token to retrieve the next set of results. For example, if you previously
  specified 100 IDs for DescribeAgentsRequestagentIds but set DescribeAgentsRequestmaxResults
  to 10, you received a set of 10 results along with a token. Use that token in this query to
  get the next set of 10.
"""
function describe_agents(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeAgents", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_configurations(configuration_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves attributes for a list of configuration item IDs.  All of the supplied IDs must be
for the same asset type from one of the following:   server   application   process
connection   Output fields are specific to the asset type specified. For example, the
output for a server configuration item includes a list of attributes about the server, such
as host name, operating system, number of network cards, etc. For a complete list of
outputs for each asset type, see Using the DescribeConfigurations Action in the AWS
Application Discovery Service User Guide.

# Arguments
- `configuration_ids`: One or more configuration IDs.

"""
function describe_configurations(
    configurationIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeConfigurations",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_continuous_exports(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists exports as specified by ID. All continuous exports associated with your user account
can be listed if you call DescribeContinuousExports as is without passing any parameters.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"export_ids"`: The unique IDs assigned to the exports.
- `"max_results"`: A number between 1 and 100 specifying the maximum number of continuous
  export descriptions returned.
- `"next_token"`: The token from the previous call to DescribeExportTasks.
"""
function describe_continuous_exports(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeContinuousExports",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_export_configurations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 DescribeExportConfigurations is deprecated. Use DescribeImportTasks, instead.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"export_ids"`: A list of continuous export IDs to search for.
- `"max_results"`: A number between 1 and 100 specifying the maximum number of continuous
  export descriptions returned.
- `"next_token"`: The token from the previous call to describe-export-tasks.
"""
function describe_export_configurations(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeExportConfigurations",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_export_tasks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieve status of one or more export tasks. You can retrieve the status of up to 100
export tasks.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"export_ids"`: One or more unique identifiers used to query the status of an export
  request.
- `"filters"`: One or more filters.    AgentId - ID of the agent whose collected data will
  be exported
- `"max_results"`: The maximum number of volume results returned by DescribeExportTasks in
  paginated output. When this parameter is used, DescribeExportTasks only returns maxResults
  results in a single page along with a nextToken response element.
- `"next_token"`: The nextToken value returned from a previous paginated
  DescribeExportTasks request where maxResults was used and the results exceeded the value of
  that parameter. Pagination continues from the end of the previous results that returned the
  nextToken value. This value is null when there are no more results to return.
"""
function describe_export_tasks(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeExportTasks",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_import_tasks(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an array of import tasks for your account, including status information, times,
IDs, the Amazon S3 Object URL for the import file, and more.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: An array of name-value pairs that you provide to filter the results for the
  DescribeImportTask request to a specific subset of results. Currently, wildcard values
  aren't supported for filters.
- `"max_results"`: The maximum number of results that you want this request to return, up
  to 100.
- `"next_token"`: The token to request a specific page of results.
"""
function describe_import_tasks(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeImportTasks",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_tags(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of configuration items that have tags as specified by the key-value pairs,
name and value, passed to the optional parameter filters. There are three valid tag filter
names:   tagKey   tagValue   configurationId   Also, all configuration items associated
with your user account that have tags can be listed if you call DescribeTags as is without
passing any parameters.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: You can filter the list using a key-value format. You can separate these
  items by using logical operators. Allowed filters include tagKey, tagValue, and
  configurationId.
- `"max_results"`: The total number of items to return in a single page of output. The
  maximum value is 100.
- `"next_token"`: A token to start the list. Use this token to get the next set of results.
"""
function describe_tags(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DescribeTags", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    disassociate_configuration_items_from_application(application_configuration_id, configuration_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates one or more configuration items from an application.

# Arguments
- `application_configuration_id`: Configuration ID of an application from which each item
  is disassociated.
- `configuration_ids`: Configuration ID of each item to be disassociated from an
  application.

"""
function disassociate_configuration_items_from_application(
    applicationConfigurationId,
    configurationIds;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "DisassociateConfigurationItemsFromApplication",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "applicationConfigurationId" => applicationConfigurationId,
                    "configurationIds" => configurationIds,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    export_configurations(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deprecated. Use StartExportTask instead. Exports all discovered configuration data to an
Amazon S3 bucket or an application that enables you to view and evaluate the data. Data
includes tags and tag associations, processes, connections, servers, and system
performance. This API returns an export ID that you can query using the
DescribeExportConfigurations API. The system imposes a limit of two configuration exports
in six hours.

"""
function export_configurations(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "ExportConfigurations",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_discovery_summary(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a short summary of discovered assets. This API operation takes no request
parameters and is called as is at the command prompt as shown in the example.

"""
function get_discovery_summary(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "GetDiscoverySummary",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_configurations(configuration_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of configuration items as specified by the value passed to the required
parameter configurationType. Optional filtering may be applied to refine search results.

# Arguments
- `configuration_type`: A valid configuration identified by Application Discovery Service.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: You can filter the request using various logical operators and a key-value
  format. For example:   {\"key\": \"serverType\", \"value\": \"webServer\"}  For a complete
  list of filter options and guidance about using them with this action, see Using the
  ListConfigurations Action in the AWS Application Discovery Service User Guide.
- `"max_results"`: The total number of items to return. The maximum value is 100.
- `"next_token"`: Token to retrieve the next set of results. For example, if a previous
  call to ListConfigurations returned 100 items, but you set
  ListConfigurationsRequestmaxResults to 10, you received a set of 10 results along with a
  token. Use that token in this query to get the next set of 10.
- `"order_by"`: Certain filter criteria return output that can be sorted in ascending or
  descending order. For a list of output characteristics for each filter, see Using the
  ListConfigurations Action in the AWS Application Discovery Service User Guide.
"""
function list_configurations(
    configurationType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "ListConfigurations",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationType" => configurationType), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_server_neighbors(configuration_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of servers that are one network hop away from a specified server.

# Arguments
- `configuration_id`: Configuration ID of the server for which neighbors are being listed.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: Maximum number of results to return in a single page of output.
- `"neighbor_configuration_ids"`: List of configuration IDs to test for one-hop-away.
- `"next_token"`: Token to retrieve the next set of results. For example, if you previously
  specified 100 IDs for ListServerNeighborsRequestneighborConfigurationIds but set
  ListServerNeighborsRequestmaxResults to 10, you received a set of 10 results along with a
  token. Use that token in this query to get the next set of 10.
- `"port_information_needed"`: Flag to indicate if port and protocol information is needed
  as part of the response.
"""
function list_server_neighbors(
    configurationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "ListServerNeighbors",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationId" => configurationId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_continuous_export(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Start the continuous flow of agent's discovered data into Amazon Athena.

"""
function start_continuous_export(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StartContinuousExport",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_data_collection_by_agent_ids(agent_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Instructs the specified agents or connectors to start collecting data.

# Arguments
- `agent_ids`: The IDs of the agents or connectors from which to start collecting data. If
  you send a request to an agent/connector ID that you do not have permission to contact,
  according to your AWS account, the service does not throw an exception. Instead, it returns
  the error in the Description field. If you send a request to multiple agents/connectors and
  you do not have permission to contact some of those agents/connectors, the system does not
  throw an exception. Instead, the system shows Failed in the Description field.

"""
function start_data_collection_by_agent_ids(
    agentIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StartDataCollectionByAgentIds",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("agentIds" => agentIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_export_task(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Begins the export of discovered data to an S3 bucket.  If you specify agentIds in a
filter, the task exports up to 72 hours of detailed data collected by the identified
Application Discovery Agent, including network, process, and performance details. A time
range for exported agent data may be set by using startTime and endTime. Export of detailed
agent data is limited to five concurrently running exports.   If you do not include an
agentIds filter, summary data is exported that includes both AWS Agentless Discovery
Connector data and summary data from AWS Discovery Agents. Export of summary data is
limited to two exports per day.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"end_time"`: The end timestamp for exported data from the single Application Discovery
  Agent selected in the filters. If no value is specified, exported data includes the most
  recent data collected by the agent.
- `"export_data_format"`: The file format for the returned export data. Default value is
  CSV. Note: The GRAPHML option has been deprecated.
- `"filters"`: If a filter is present, it selects the single agentId of the Application
  Discovery Agent for which data is exported. The agentId can be found in the results of the
  DescribeAgents API or CLI. If no filter is present, startTime and endTime are ignored and
  exported data includes both Agentless Discovery Connector data and summary data from
  Application Discovery agents.
- `"start_time"`: The start timestamp for exported data from the single Application
  Discovery Agent selected in the filters. If no value is specified, data is exported
  starting from the first data collected by the agent.
"""
function start_export_task(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StartExportTask", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    start_import_task(import_url, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts an import task, which allows you to import details of your on-premises environment
directly into AWS Migration Hub without having to use the Application Discovery Service
(ADS) tools such as the Discovery Connector or Discovery Agent. This gives you the option
to perform migration assessment and planning directly from your imported data, including
the ability to group your devices as applications and track their migration status. To
start an import request, do this:   Download the specially formatted comma separated value
(CSV) import template, which you can find here:
https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_tem
plate.csv.   Fill out the template with your server and application data.   Upload your
import file to an Amazon S3 bucket, and make a note of it's Object URL. Your import file
must be in the CSV format.   Use the console or the StartImportTask command with the AWS
CLI or one of the AWS SDKs to import the records from your file.   For more information,
including step-by-step procedures, see Migration Hub Import in the AWS Application
Discovery Service User Guide.  There are limits to the number of import tasks you can
create (and delete) in an AWS account. For more information, see AWS Application Discovery
Service Limits in the AWS Application Discovery Service User Guide.

# Arguments
- `import_url`: The URL for your import file that you've uploaded to Amazon S3.  If you're
  using the AWS CLI, this URL is structured as follows: s3://BucketName/ImportFileName.CSV
- `name`: A descriptive name for this request. You can use this name to filter future
  requests related to this import task, such as identifying applications and servers that
  were included in this import task. We recommend that you use a meaningful name for each
  import task.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"client_request_token"`: Optional. A unique token that you can provide to prevent the
  same import request from occurring more than once. If you don't provide a token, a token is
  automatically generated. Sending more than one StartImportTask request with the same client
  request token will return information about the original import task with that client
  request token.
"""
function start_import_task(
    importUrl, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StartImportTask",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "importUrl" => importUrl,
                    "name" => name,
                    "client_request_token" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_continuous_export(export_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Stop the continuous flow of agent's discovered data into Amazon Athena.

# Arguments
- `export_id`: The unique ID assigned to this export.

"""
function stop_continuous_export(
    exportId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StopContinuousExport",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("exportId" => exportId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_data_collection_by_agent_ids(agent_ids; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Instructs the specified agents or connectors to stop collecting data.

# Arguments
- `agent_ids`: The IDs of the agents or connectors from which to stop collecting data.

"""
function stop_data_collection_by_agent_ids(
    agentIds; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "StopDataCollectionByAgentIds",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("agentIds" => agentIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_application(configuration_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates metadata about an application.

# Arguments
- `configuration_id`: Configuration ID of the application to be updated.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: New description of the application to be updated.
- `"name"`: New name of the application to be updated.
"""
function update_application(
    configurationId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return application_discovery_service(
        "UpdateApplication",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationId" => configurationId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
