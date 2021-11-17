# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: devops_guru
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "insight_feedback" => "InsightFeedback",
    "to_time" => "ToTime",
    "next_token" => "NextToken",
    "organizational_unit_ids" => "OrganizationalUnitIds",
    "account_id" => "AccountId",
    "start_time_range" => "StartTimeRange",
    "account_ids" => "AccountIds",
    "max_results" => "MaxResults",
    "client_token" => "ClientToken",
    "filters" => "Filters",
    "insight_id" => "InsightId",
    "locale" => "Locale",
)

"""
    add_notification_channel(config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Adds a notification channel to DevOps Guru. A notification channel is used to notify you
about important DevOps Guru events, such as when an insight is generated.  If you use an
Amazon SNS topic in another account, you must attach a policy to it that grants DevOps Guru
permission to it notifications. DevOps Guru adds the required policy on your behalf to send
notifications using Amazon SNS in your account. For more information, see Permissions for
cross account Amazon SNS topics. If you use an Amazon SNS topic that is encrypted by an
Amazon Web Services Key Management Service customer-managed key (CMK), then you must add
permissions to the CMK. For more information, see Permissions for Amazon Web Services
KMS–encrypted Amazon SNS topics.

# Arguments
- `config`:  A NotificationChannelConfig object that specifies what type of notification
  channel to add. The one supported notification channel is Amazon Simple Notification
  Service (Amazon SNS).

"""
function add_notification_channel(
    Config; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "PUT",
        "/channels",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Config" => Config), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_account_health(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the number of open reactive insights, the number of open proactive insights, and
the number of metrics analyzed in your Amazon Web Services account. Use these numbers to
gauge the health of operations in your Amazon Web Services account.

"""
function describe_account_health(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/accounts/health",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_account_overview(from_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 For the time range passed in, returns the number of open reactive insight that were
created, the number of open proactive insights that were created, and the Mean Time to
Recover (MTTR) for all closed reactive insights.

# Arguments
- `from_time`:  The start of the time range passed in. The start time granularity is at the
  day level. The floor of the start time is used. Returned information occurred after this
  day.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"to_time"`:  The end of the time range passed in. The start time granularity is at the
  day level. The floor of the start time is used. Returned information occurred before this
  day. If this is not specified, then the current day is used.
"""
function describe_account_overview(
    FromTime; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/accounts/overview",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FromTime" => FromTime), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_anomaly(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns details about an anomaly that you specify using its ID.

# Arguments
- `id`:  The ID of the anomaly.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_id"`: The ID of the member account.
"""
function describe_anomaly(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/anomalies/$(Id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_feedback(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the most recent feedback submitted in the current Amazon Web Services account and
Region.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"insight_id"`:  The ID of the insight for which the feedback was provided.
"""
function describe_feedback(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST", "/feedback", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_insight(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns details about an insight that you specify using its ID.

# Arguments
- `id`:  The ID of the insight.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_id"`: The ID of the member account in the organization.
"""
function describe_insight(Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/insights/$(Id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_organization_health(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns active insights, predictive insights, and resource hours analyzed in last hour.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_ids"`: The ID of the Amazon Web Services account.
- `"organizational_unit_ids"`: The ID of the organizational unit.
"""
function describe_organization_health(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/organization/health",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_organization_overview(from_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an overview of your organization's history based on the specified time range. The
overview includes the total reactive and proactive insights.

# Arguments
- `from_time`:  The start of the time range passed in. The start time granularity is at the
  day level. The floor of the start time is used. Returned information occurred after this
  day.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_ids"`: The ID of the Amazon Web Services account.
- `"organizational_unit_ids"`: The ID of the organizational unit.
- `"to_time"`:  The end of the time range passed in. The start time granularity is at the
  day level. The floor of the start time is used. Returned information occurred before this
  day. If this is not specified, then the current day is used.
"""
function describe_organization_overview(
    FromTime; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/organization/overview",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FromTime" => FromTime), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_organization_resource_collection_health(organization_resource_collection_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides an overview of your system's health. If additional member accounts are part of
your organization, you can filter those accounts using the AccountIds field.

# Arguments
- `organization_resource_collection_type`:  An Amazon Web Services resource collection
  type. This type specifies how analyzed Amazon Web Services resources are defined. The one
  type of Amazon Web Services resource collection supported is Amazon Web Services
  CloudFormation stacks. DevOps Guru can be configured to analyze only the Amazon Web
  Services resources that are defined in the stacks. You can specify up to 500 Amazon Web
  Services CloudFormation stacks.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_ids"`: The ID of the Amazon Web Services account.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
- `"organizational_unit_ids"`: The ID of the organizational unit.
"""
function describe_organization_resource_collection_health(
    OrganizationResourceCollectionType;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/organization/health/resource-collection/",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "OrganizationResourceCollectionType" =>
                        OrganizationResourceCollectionType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_resource_collection_health(resource_collection_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the number of open proactive insights, open reactive insights, and the Mean Time
to Recover (MTTR) for all closed insights in resource collections in your account. You
specify the type of Amazon Web Services resources collection. The one type of Amazon Web
Services resource collection supported is Amazon Web Services CloudFormation stacks. DevOps
Guru can be configured to analyze only the Amazon Web Services resources that are defined
in the stacks. You can specify up to 500 Amazon Web Services CloudFormation stacks.

# Arguments
- `resource_collection_type`:  An Amazon Web Services resource collection type. This type
  specifies how analyzed Amazon Web Services resources are defined. The one type of Amazon
  Web Services resource collection supported is Amazon Web Services CloudFormation stacks.
  DevOps Guru can be configured to analyze only the Amazon Web Services resources that are
  defined in the stacks. You can specify up to 500 Amazon Web Services CloudFormation stacks.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function describe_resource_collection_health(
    ResourceCollectionType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/accounts/health/resource-collection/$(ResourceCollectionType)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_service_integration(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the integration status of services that are integrated with DevOps Guru. The one
service that can be integrated with DevOps Guru is Amazon Web Services Systems Manager,
which can be used to create an OpsItem for each generated insight.

"""
function describe_service_integration(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/service-integrations",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_cost_estimation(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an estimate of the monthly cost for DevOps Guru to analyze your Amazon Web Services
resources. For more information, see Estimate your Amazon DevOps Guru costs and Amazon
DevOps Guru pricing.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function get_cost_estimation(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/cost-estimation",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_resource_collection(resource_collection_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns lists Amazon Web Services resources that are of the specified resource collection
type. The one type of Amazon Web Services resource collection supported is Amazon Web
Services CloudFormation stacks. DevOps Guru can be configured to analyze only the Amazon
Web Services resources that are defined in the stacks. You can specify up to 500 Amazon Web
Services CloudFormation stacks.

# Arguments
- `resource_collection_type`:  The type of Amazon Web Services resource collections to
  return. The one valid value is CLOUD_FORMATION for Amazon Web Services CloudFormation
  stacks.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function get_resource_collection(
    ResourceCollectionType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "GET",
        "/resource-collections/$(ResourceCollectionType)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_anomalies_for_insight(insight_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of the anomalies that belong to an insight that you specify using its ID.

# Arguments
- `insight_id`:  The ID of the insight. The returned anomalies belong to this insight.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_id"`: The ID of the Amazon Web Services account.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
- `"start_time_range"`:  A time range used to specify when the requested anomalies started.
  All returned anomalies started during this time range.
"""
function list_anomalies_for_insight(
    InsightId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/anomalies/insight/$(InsightId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_events(filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of the events emitted by the resources that are evaluated by DevOps Guru.
You can use filters to specify which events are returned.

# Arguments
- `filters`:  A ListEventsFilters object used to specify which events to return.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_id"`: The ID of the Amazon Web Services account.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_events(Filters; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/events",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Filters" => Filters), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_insights(status_filter; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of insights in your Amazon Web Services account. You can specify which
insights are returned by their start time and status (ONGOING, CLOSED, or ANY).

# Arguments
- `status_filter`:  A filter used to filter the returned insights by their status. You can
  specify one status filter.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_insights(
    StatusFilter; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/insights",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("StatusFilter" => StatusFilter), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_notification_channels(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of notification channels configured for DevOps Guru. Each notification
channel is used to notify you when DevOps Guru generates an insight that contains
information about how to improve your operations. The one supported notification channel is
Amazon Simple Notification Service (Amazon SNS).

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_notification_channels(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST", "/channels", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_organization_insights(status_filter; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of insights associated with the account or OU Id.

# Arguments
- `status_filter`:

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_ids"`: The ID of the Amazon Web Services account.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
- `"organizational_unit_ids"`: The ID of the organizational unit.
"""
function list_organization_insights(
    StatusFilter; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/organization/insights",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("StatusFilter" => StatusFilter), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_recommendations(insight_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of a specified insight's recommendations. Each recommendation includes a
list of related metrics and a list of related events.

# Arguments
- `insight_id`:  The ID of the requested insight.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"account_id"`: The ID of the Amazon Web Services account.
- `"locale"`: A locale that specifies the language to use for recommendations.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_recommendations(
    InsightId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/recommendations",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("InsightId" => InsightId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_feedback(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Collects customer feedback about the specified insight.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"insight_feedback"`:  The feedback from customers is about the recommendations in this
  insight.
"""
function put_feedback(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "PUT", "/feedback", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    remove_notification_channel(id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Removes a notification channel from DevOps Guru. A notification channel is used to notify
you when DevOps Guru generates an insight that contains information about how to improve
your operations.

# Arguments
- `id`:  The ID of the notification channel to be removed.

"""
function remove_notification_channel(
    Id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "DELETE",
        "/channels/$(Id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    search_insights(start_time_range, type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of insights in your Amazon Web Services account. You can specify which
insights are returned by their start time, one or more statuses (ONGOING, CLOSED, and
CLOSED), one or more severities (LOW, MEDIUM, and HIGH), and type (REACTIVE or PROACTIVE).
 Use the Filters parameter to specify status and severity search parameters. Use the Type
parameter to specify REACTIVE or PROACTIVE in your search.

# Arguments
- `start_time_range`:  The start of the time range passed in. Returned insights occurred
  after this time.
- `type`:  The type of insights you are searching for (REACTIVE or PROACTIVE).

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`:  A SearchInsightsFilters object that is used to set the severity and status
  filters on your insight search.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function search_insights(
    StartTimeRange, Type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/insights/search",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("StartTimeRange" => StartTimeRange, "Type" => Type),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    search_organization_insights(account_ids, start_time_range, type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of insights in your organization. You can specify which insights are
returned by their start time, one or more statuses (ONGOING, CLOSED, and CLOSED), one or
more severities (LOW, MEDIUM, and HIGH), and type (REACTIVE or PROACTIVE).   Use the
Filters parameter to specify status and severity search parameters. Use the Type parameter
to specify REACTIVE or PROACTIVE in your search.

# Arguments
- `account_ids`: The ID of the Amazon Web Services account.
- `start_time_range`:
- `type`:  The type of insights you are searching for (REACTIVE or PROACTIVE).

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`:  A SearchOrganizationInsightsFilters object that is used to set the severity
  and status filters on your insight search.
- `"max_results"`: The maximum number of results to return with a single call. To retrieve
  the remaining results, make another call with the returned nextToken value.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function search_organization_insights(
    AccountIds,
    StartTimeRange,
    Type;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "POST",
        "/organization/insights/search",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AccountIds" => AccountIds,
                    "StartTimeRange" => StartTimeRange,
                    "Type" => Type,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_cost_estimation(resource_collection; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Starts the creation of an estimate of the monthly cost to analyze your Amazon Web Services
resources.

# Arguments
- `resource_collection`: The collection of Amazon Web Services resources used to create a
  monthly DevOps Guru cost estimate.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"client_token"`: The idempotency token used to identify each cost estimate request.
"""
function start_cost_estimation(
    ResourceCollection; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "PUT",
        "/cost-estimation",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ResourceCollection" => ResourceCollection,
                    "client_token" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_resource_collection(action, resource_collection; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Updates the collection of resources that DevOps Guru analyzes. The one type of Amazon Web
Services resource collection supported is Amazon Web Services CloudFormation stacks. DevOps
Guru can be configured to analyze only the Amazon Web Services resources that are defined
in the stacks. You can specify up to 500 Amazon Web Services CloudFormation stacks. This
method also creates the IAM role required for you to use DevOps Guru.

# Arguments
- `action`:  Specifies if the resource collection in the request is added or deleted to the
  resource collection.
- `resource_collection`:

"""
function update_resource_collection(
    Action, ResourceCollection; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "PUT",
        "/resource-collections",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Action" => Action, "ResourceCollection" => ResourceCollection
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_service_integration(service_integration; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Enables or disables integration with a service that can be integrated with DevOps Guru.
The one service that can be integrated with DevOps Guru is Amazon Web Services Systems
Manager, which can be used to create an OpsItem for each generated insight.

# Arguments
- `service_integration`:  An IntegratedServiceConfig object used to specify the integrated
  service you want to update, and whether you want to update it to enabled or disabled.

"""
function update_service_integration(
    ServiceIntegration; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return devops_guru(
        "PUT",
        "/service-integrations",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("ServiceIntegration" => ServiceIntegration), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
