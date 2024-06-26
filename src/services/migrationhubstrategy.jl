# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: migrationhubstrategy
using AWS.Compat
using AWS.UUIDs

"""
    get_application_component_details(application_component_id)
    get_application_component_details(application_component_id, params::Dict{String,<:Any})

 Retrieves details about an application component.

# Arguments
- `application_component_id`:  The ID of the application component. The ID is unique within
  an AWS account.

"""
function get_application_component_details(
    applicationComponentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-applicationcomponent-details/$(applicationComponentId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_application_component_details(
    applicationComponentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "GET",
        "/get-applicationcomponent-details/$(applicationComponentId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_application_component_strategies(application_component_id)
    get_application_component_strategies(application_component_id, params::Dict{String,<:Any})

 Retrieves a list of all the recommended strategies and tools for an application component
running on a server.

# Arguments
- `application_component_id`:  The ID of the application component. The ID is unique within
  an AWS account.

"""
function get_application_component_strategies(
    applicationComponentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-applicationcomponent-strategies/$(applicationComponentId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_application_component_strategies(
    applicationComponentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "GET",
        "/get-applicationcomponent-strategies/$(applicationComponentId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_assessment(id)
    get_assessment(id, params::Dict{String,<:Any})

 Retrieves the status of an on-going assessment.

# Arguments
- `id`:  The assessmentid returned by StartAssessment.

"""
function get_assessment(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-assessment/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_assessment(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-assessment/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_import_file_task(id)
    get_import_file_task(id, params::Dict{String,<:Any})

 Retrieves the details about a specific import task.

# Arguments
- `id`:  The ID of the import file task. This ID is returned in the response of
  StartImportFileTask.

"""
function get_import_file_task(id; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-import-file-task/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_import_file_task(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-import-file-task/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_latest_assessment_id()
    get_latest_assessment_id(params::Dict{String,<:Any})

Retrieve the latest ID of a specific assessment task.

"""
function get_latest_assessment_id(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-latest-assessment-id";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_latest_assessment_id(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-latest-assessment-id",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_portfolio_preferences()
    get_portfolio_preferences(params::Dict{String,<:Any})

 Retrieves your migration and modernization preferences.

"""
function get_portfolio_preferences(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-portfolio-preferences";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_portfolio_preferences(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-portfolio-preferences",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_portfolio_summary()
    get_portfolio_summary(params::Dict{String,<:Any})

 Retrieves overall summary including the number of servers to rehost and the overall number
of anti-patterns.

"""
function get_portfolio_summary(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-portfolio-summary";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_portfolio_summary(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-portfolio-summary",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_recommendation_report_details(id)
    get_recommendation_report_details(id, params::Dict{String,<:Any})

 Retrieves detailed information about the specified recommendation report.

# Arguments
- `id`:  The recommendation report generation task id returned by
  StartRecommendationReportGeneration.

"""
function get_recommendation_report_details(
    id; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-recommendation-report-details/$(id)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_recommendation_report_details(
    id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/get-recommendation-report-details/$(id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_server_details(server_id)
    get_server_details(server_id, params::Dict{String,<:Any})

 Retrieves detailed information about a specified server.

# Arguments
- `server_id`:  The ID of the server.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`:  The maximum number of items to include in the response. The maximum
  value is 100.
- `"nextToken"`:  The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
"""
function get_server_details(serverId; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-server-details/$(serverId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_server_details(
    serverId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "GET",
        "/get-server-details/$(serverId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_server_strategies(server_id)
    get_server_strategies(server_id, params::Dict{String,<:Any})

 Retrieves recommended strategies and tools for the specified server.

# Arguments
- `server_id`:  The ID of the server.

"""
function get_server_strategies(serverId; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/get-server-strategies/$(serverId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_server_strategies(
    serverId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "GET",
        "/get-server-strategies/$(serverId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_analyzable_servers()
    list_analyzable_servers(params::Dict{String,<:Any})

Retrieves a list of all the servers fetched from customer vCenter using Strategy
Recommendation Collector.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of items to include in the response. The maximum value
  is 100.
- `"nextToken"`: The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
- `"sort"`: Specifies whether to sort by ascending (ASC) or descending (DESC) order.
"""
function list_analyzable_servers(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST",
        "/list-analyzable-servers";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_analyzable_servers(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/list-analyzable-servers",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_application_components()
    list_application_components(params::Dict{String,<:Any})

 Retrieves a list of all the application components (processes).

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"applicationComponentCriteria"`:  Criteria for filtering the list of application
  components.
- `"filterValue"`:  Specify the value based on the application component criteria type. For
  example, if applicationComponentCriteria is set to SERVER_ID and filterValue is set to
  server1, then ListApplicationComponents returns all the application components running on
  server1.
- `"groupIdFilter"`:  The group ID specified in to filter on.
- `"maxResults"`:  The maximum number of items to include in the response. The maximum
  value is 100.
- `"nextToken"`:  The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
- `"sort"`:  Specifies whether to sort by ascending (ASC) or descending (DESC) order.
"""
function list_application_components(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST",
        "/list-applicationcomponents";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_application_components(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/list-applicationcomponents",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_collectors()
    list_collectors(params::Dict{String,<:Any})

 Retrieves a list of all the installed collectors.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`:  The maximum number of items to include in the response. The maximum
  value is 100.
- `"nextToken"`:  The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
"""
function list_collectors(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET", "/list-collectors"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_collectors(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/list-collectors",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_import_file_task()
    list_import_file_task(params::Dict{String,<:Any})

 Retrieves a list of all the imports performed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`:  The total number of items to return. The maximum value is 100.
- `"nextToken"`:  The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
"""
function list_import_file_task(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "GET",
        "/list-import-file-task";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_import_file_task(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "GET",
        "/list-import-file-task",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_servers()
    list_servers(params::Dict{String,<:Any})

 Returns a list of all the servers.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filterValue"`:  Specifies the filter value, which is based on the type of server
  criteria. For example, if serverCriteria is OS_NAME, and the filterValue is equal to
  WindowsServer, then ListServers returns all of the servers matching the OS name
  WindowsServer.
- `"groupIdFilter"`:  Specifies the group ID to filter on.
- `"maxResults"`:  The maximum number of items to include in the response. The maximum
  value is 100.
- `"nextToken"`:  The token from a previous call that you use to retrieve the next set of
  results. For example, if a previous call to this action returned 100 items, but you set
  maxResults to 10. You'll receive a set of 10 results along with a token. You then use the
  returned token to retrieve the next set of 10.
- `"serverCriteria"`:  Criteria for filtering servers.
- `"sort"`:  Specifies whether to sort by ascending (ASC) or descending (DESC) order.
"""
function list_servers(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST", "/list-servers"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_servers(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/list-servers",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_portfolio_preferences()
    put_portfolio_preferences(params::Dict{String,<:Any})

 Saves the specified migration and modernization preferences.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"applicationMode"`: The classification for application component types.
- `"applicationPreferences"`:  The transformation preferences for non-database
  applications.
- `"databasePreferences"`:  The transformation preferences for database applications.
- `"prioritizeBusinessGoals"`:  The rank of the business goals based on priority.
"""
function put_portfolio_preferences(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST",
        "/put-portfolio-preferences";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_portfolio_preferences(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/put-portfolio-preferences",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_assessment()
    start_assessment(params::Dict{String,<:Any})

 Starts the assessment of an on-premises environment.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"assessmentDataSourceType"`: The data source type of an assessment to be started.
- `"assessmentTargets"`: List of criteria for assessment.
- `"s3bucketForAnalysisData"`:  The S3 bucket used by the collectors to send analysis data
  to the service. The bucket name must begin with migrationhub-strategy-.
- `"s3bucketForReportData"`:  The S3 bucket where all the reports generated by the service
  are stored. The bucket name must begin with migrationhub-strategy-.
"""
function start_assessment(; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST", "/start-assessment"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function start_assessment(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/start-assessment",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_import_file_task(s3_bucket, name, s3key)
    start_import_file_task(s3_bucket, name, s3key, params::Dict{String,<:Any})

 Starts a file import.

# Arguments
- `s3_bucket`:  The S3 bucket where the import file is located. The bucket name is required
  to begin with migrationhub-strategy-.
- `name`:  A descriptive name for the request.
- `s3key`:  The Amazon S3 key name of the import file.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"dataSourceType"`: Specifies the source that the servers are coming from. By default,
  Strategy Recommendations assumes that the servers specified in the import file are
  available in AWS Application Discovery Service.
- `"groupId"`: Groups the resources in the import file together with a unique name. This ID
  can be as filter in ListApplicationComponents and ListServers.
- `"s3bucketForReportData"`:  The S3 bucket where Strategy Recommendations uploads import
  results. The bucket name is required to begin with migrationhub-strategy-.
"""
function start_import_file_task(
    S3Bucket, name, s3key; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/start-import-file-task",
        Dict{String,Any}("S3Bucket" => S3Bucket, "name" => name, "s3key" => s3key);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_import_file_task(
    S3Bucket,
    name,
    s3key,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "POST",
        "/start-import-file-task",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("S3Bucket" => S3Bucket, "name" => name, "s3key" => s3key),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_recommendation_report_generation()
    start_recommendation_report_generation(params::Dict{String,<:Any})

 Starts generating a recommendation report.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"groupIdFilter"`:  Groups the resources in the recommendation report with a unique name.
- `"outputFormat"`:  The output format for the recommendation report file. The default
  format is Microsoft Excel.
"""
function start_recommendation_report_generation(;
    aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/start-recommendation-report-generation";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_recommendation_report_generation(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/start-recommendation-report-generation",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_assessment(assessment_id)
    stop_assessment(assessment_id, params::Dict{String,<:Any})

 Stops the assessment of an on-premises environment.

# Arguments
- `assessment_id`:  The assessmentId returned by StartAssessment.

"""
function stop_assessment(assessmentId; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST",
        "/stop-assessment",
        Dict{String,Any}("assessmentId" => assessmentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function stop_assessment(
    assessmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "POST",
        "/stop-assessment",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("assessmentId" => assessmentId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_application_component_config(application_component_id)
    update_application_component_config(application_component_id, params::Dict{String,<:Any})

 Updates the configuration of an application component.

# Arguments
- `application_component_id`:  The ID of the application component. The ID is unique within
  an AWS account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"appType"`: The type of known component.
- `"configureOnly"`: Update the configuration request of an application component. If it is
  set to true, the source code and/or database credentials are updated. If it is set to
  false, the source code and/or database credentials are updated and an analysis is initiated.
- `"inclusionStatus"`:  Indicates whether the application component has been included for
  server recommendation or not.
- `"secretsManagerKey"`:  Database credentials.
- `"sourceCodeList"`:  The list of source code configurations to update for the application
  component.
- `"strategyOption"`:  The preferred strategy options for the application component. Use
  values from the GetApplicationComponentStrategies response.
"""
function update_application_component_config(
    applicationComponentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return migrationhubstrategy(
        "POST",
        "/update-applicationcomponent-config/",
        Dict{String,Any}("applicationComponentId" => applicationComponentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_application_component_config(
    applicationComponentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "POST",
        "/update-applicationcomponent-config/",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("applicationComponentId" => applicationComponentId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_server_config(server_id)
    update_server_config(server_id, params::Dict{String,<:Any})

 Updates the configuration of the specified server.

# Arguments
- `server_id`:  The ID of the server.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"strategyOption"`:  The preferred strategy options for the application component. See
  the response from GetServerStrategies.
"""
function update_server_config(serverId; aws_config::AbstractAWSConfig=global_aws_config())
    return migrationhubstrategy(
        "POST",
        "/update-server-config/",
        Dict{String,Any}("serverId" => serverId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_server_config(
    serverId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return migrationhubstrategy(
        "POST",
        "/update-server-config/",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("serverId" => serverId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
