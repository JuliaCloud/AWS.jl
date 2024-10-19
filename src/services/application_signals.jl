# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: application_signals
using AWS.Compat
using AWS.UUIDs

"""
    batch_get_service_level_objective_budget_report(slo_ids, timestamp)
    batch_get_service_level_objective_budget_report(slo_ids, timestamp, params::Dict{String,<:Any})

Use this operation to retrieve one or more service level objective (SLO) budget reports. An
error budget is the amount of time or requests in an unhealthy state that your service can
accumulate during an interval before your overall SLO budget health is breached and the SLO
is considered to be unmet. For example, an SLO with a threshold of 99.95% and a monthly
interval translates to an error budget of 21.9 minutes of downtime in a 30-day month.
Budget reports include a health indicator, the attainment value, and remaining budget. For
more information about SLO error budgets, see  SLO concepts.

# Arguments
- `slo_ids`: An array containing the IDs of the service level objectives that you want to
  include in the report.
- `timestamp`: The date and time that you want the report to be for. It is expressed as the
  number of milliseconds since Jan 1, 1970 00:00:00 UTC.

"""
function batch_get_service_level_objective_budget_report(
    SloIds, Timestamp; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/budget-report",
        Dict{String,Any}("SloIds" => SloIds, "Timestamp" => Timestamp);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function batch_get_service_level_objective_budget_report(
    SloIds,
    Timestamp,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/budget-report",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("SloIds" => SloIds, "Timestamp" => Timestamp),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_service_level_objective(name)
    create_service_level_objective(name, params::Dict{String,<:Any})

Creates a service level objective (SLO), which can help you ensure that your critical
business operations are meeting customer expectations. Use SLOs to set and track specific
target levels for the reliability and availability of your applications and services. SLOs
use service level indicators (SLIs) to calculate whether the application is performing at
the level that you want. Create an SLO to set a target for a service or operation’s
availability or latency. CloudWatch measures this target frequently you can find whether it
has been breached.  The target performance quality that is defined for an SLO is the
attainment goal. You can set SLO targets for your applications that are discovered by
Application Signals, using critical metrics such as latency and availability. You can also
set SLOs against any CloudWatch metric or math expression that produces a time series. When
you create an SLO, you specify whether it is a period-based SLO or a request-based SLO.
Each type of SLO has a different way of evaluating your application's performance against
its attainment goal.   A period-based SLO uses defined periods of time within a specified
total time interval. For each period of time, Application Signals determines whether the
application met its goal. The attainment rate is calculated as the number of good
periods/number of total periods. For example, for a period-based SLO, meeting an attainment
goal of 99.9% means that within your interval, your application must meet its performance
goal during at least 99.9% of the time periods.   A request-based SLO doesn't use
pre-defined periods of time. Instead, the SLO measures number of good requests/number of
total requests during the interval. At any time, you can find the ratio of good requests to
total requests for the interval up to the time stamp that you specify, and measure that
ratio against the goal set in your SLO.   After you have created an SLO, you can retrieve
error budget reports for it. An error budget is the amount of time or amount of requests
that your application can be non-compliant with the SLO's goal, and still have your
application meet the goal.   For a period-based SLO, the error budget starts at a number
defined by the highest number of periods that can fail to meet the threshold, while still
meeting the overall goal. The remaining error budget decreases with every failed period
that is recorded. The error budget within one interval can never increase. For example, an
SLO with a threshold that 99.95% of requests must be completed under 2000ms every month
translates to an error budget of 21.9 minutes of downtime per month.   For a request-based
SLO, the remaining error budget is dynamic and can increase or decrease, depending on the
ratio of good requests to total requests.   For more information about SLOs, see  Service
level objectives (SLOs).  When you perform a CreateServiceLevelObjective operation,
Application Signals creates the AWSServiceRoleForCloudWatchApplicationSignals
service-linked role, if it doesn't already exist in your account. This service- linked role
has the following permissions:    xray:GetServiceGraph     logs:StartQuery
logs:GetQueryResults     cloudwatch:GetMetricData     cloudwatch:ListMetrics
tag:GetResources     autoscaling:DescribeAutoScalingGroups

# Arguments
- `name`: A name for this SLO.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: An optional description for this SLO.
- `"Goal"`: This structure contains the attributes that determine the goal of the SLO.
- `"RequestBasedSliConfig"`: If this SLO is a request-based SLO, this structure defines the
  information about what performance metric this SLO will monitor. You can't specify both
  RequestBasedSliConfig and SliConfig in the same operation.
- `"SliConfig"`: If this SLO is a period-based SLO, this structure defines the information
  about what performance metric this SLO will monitor. You can't specify both
  RequestBasedSliConfig and SliConfig in the same operation.
- `"Tags"`: A list of key-value pairs to associate with the SLO. You can associate as many
  as 50 tags with an SLO. To be able to associate tags with the SLO when you create the SLO,
  you must have the cloudwatch:TagResource permission. Tags can help you organize and
  categorize your resources. You can also use them to scope user permissions by granting a
  user permission to access or change only resources with certain tag values.
"""
function create_service_level_objective(
    Name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/slo",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_service_level_objective(
    Name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/slo",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_service_level_objective(id)
    delete_service_level_objective(id, params::Dict{String,<:Any})

Deletes the specified service level objective.

# Arguments
- `id`: The ARN or name of the service level objective to delete.

"""
function delete_service_level_objective(
    Id; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "DELETE", "/slo/$(Id)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function delete_service_level_objective(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "DELETE",
        "/slo/$(Id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_service(end_time, key_attributes, start_time)
    get_service(end_time, key_attributes, start_time, params::Dict{String,<:Any})

Returns information about a service discovered by Application Signals.

# Arguments
- `end_time`: The end of the time period to retrieve information about. When used in a raw
  HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057  Your
  requested start time will be rounded to the nearest hour.
- `key_attributes`: Use this field to specify which service you want to retrieve
  information for. You must specify at least the Type, Name, and Environment attributes. This
  is a string-to-string map. It can include the following fields.    Type designates the type
  of object this is.    ResourceType specifies the type of the resource. This field is used
  only when the value of the Type field is Resource or AWS::Resource.    Name specifies the
  name of the object. This is used only if the value of the Type field is Service,
  RemoteService, or AWS::Service.    Identifier identifies the resource objects of this
  resource. This is used only if the value of the Type field is Resource or AWS::Resource.
  Environment specifies the location where this object is hosted, or what it belongs to.
- `start_time`: The start of the time period to retrieve information about. When used in a
  raw HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057
  Your requested start time will be rounded to the nearest hour.

"""
function get_service(
    EndTime, KeyAttributes, StartTime; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/service",
        Dict{String,Any}(
            "EndTime" => EndTime, "KeyAttributes" => KeyAttributes, "StartTime" => StartTime
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_service(
    EndTime,
    KeyAttributes,
    StartTime,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/service",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "EndTime" => EndTime,
                    "KeyAttributes" => KeyAttributes,
                    "StartTime" => StartTime,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_service_level_objective(id)
    get_service_level_objective(id, params::Dict{String,<:Any})

Returns information about one SLO created in the account.

# Arguments
- `id`: The ARN or name of the SLO that you want to retrieve information about. You can
  find the ARNs of SLOs by using the ListServiceLevelObjectives operation.

"""
function get_service_level_objective(Id; aws_config::AbstractAWSConfig=global_aws_config())
    return application_signals(
        "GET", "/slo/$(Id)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_service_level_objective(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "GET", "/slo/$(Id)", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_service_dependencies(end_time, key_attributes, start_time)
    list_service_dependencies(end_time, key_attributes, start_time, params::Dict{String,<:Any})

Returns a list of service dependencies of the service that you specify. A dependency is an
infrastructure component that an operation of this service connects with. Dependencies can
include Amazon Web Services services, Amazon Web Services resources, and third-party
services.

# Arguments
- `end_time`: The end of the time period to retrieve information about. When used in a raw
  HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057  Your
  requested end time will be rounded to the nearest hour.
- `key_attributes`: Use this field to specify which service you want to retrieve
  information for. You must specify at least the Type, Name, and Environment attributes. This
  is a string-to-string map. It can include the following fields.    Type designates the type
  of object this is.    ResourceType specifies the type of the resource. This field is used
  only when the value of the Type field is Resource or AWS::Resource.    Name specifies the
  name of the object. This is used only if the value of the Type field is Service,
  RemoteService, or AWS::Service.    Identifier identifies the resource objects of this
  resource. This is used only if the value of the Type field is Resource or AWS::Resource.
  Environment specifies the location where this object is hosted, or what it belongs to.
- `start_time`: The start of the time period to retrieve information about. When used in a
  raw HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057
  Your requested start time will be rounded to the nearest hour.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return in one operation. If you omit
  this parameter, the default of 50 is used.
- `"NextToken"`: Include this value, if it was returned by the previous operation, to get
  the next set of service dependencies.
"""
function list_service_dependencies(
    EndTime, KeyAttributes, StartTime; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/service-dependencies",
        Dict{String,Any}(
            "EndTime" => EndTime, "KeyAttributes" => KeyAttributes, "StartTime" => StartTime
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_service_dependencies(
    EndTime,
    KeyAttributes,
    StartTime,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/service-dependencies",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "EndTime" => EndTime,
                    "KeyAttributes" => KeyAttributes,
                    "StartTime" => StartTime,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_service_dependents(end_time, key_attributes, start_time)
    list_service_dependents(end_time, key_attributes, start_time, params::Dict{String,<:Any})

Returns the list of dependents that invoked the specified service during the provided time
range. Dependents include other services, CloudWatch Synthetics canaries, and clients that
are instrumented with CloudWatch RUM app monitors.

# Arguments
- `end_time`: The end of the time period to retrieve information about. When used in a raw
  HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057  Your
  requested start time will be rounded to the nearest hour.
- `key_attributes`: Use this field to specify which service you want to retrieve
  information for. You must specify at least the Type, Name, and Environment attributes. This
  is a string-to-string map. It can include the following fields.    Type designates the type
  of object this is.    ResourceType specifies the type of the resource. This field is used
  only when the value of the Type field is Resource or AWS::Resource.    Name specifies the
  name of the object. This is used only if the value of the Type field is Service,
  RemoteService, or AWS::Service.    Identifier identifies the resource objects of this
  resource. This is used only if the value of the Type field is Resource or AWS::Resource.
  Environment specifies the location where this object is hosted, or what it belongs to.
- `start_time`: The start of the time period to retrieve information about. When used in a
  raw HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057
  Your requested start time will be rounded to the nearest hour.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return in one operation. If you omit
  this parameter, the default of 50 is used.
- `"NextToken"`: Include this value, if it was returned by the previous operation, to get
  the next set of service dependents.
"""
function list_service_dependents(
    EndTime, KeyAttributes, StartTime; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/service-dependents",
        Dict{String,Any}(
            "EndTime" => EndTime, "KeyAttributes" => KeyAttributes, "StartTime" => StartTime
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_service_dependents(
    EndTime,
    KeyAttributes,
    StartTime,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/service-dependents",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "EndTime" => EndTime,
                    "KeyAttributes" => KeyAttributes,
                    "StartTime" => StartTime,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_service_level_objectives()
    list_service_level_objectives(params::Dict{String,<:Any})

Returns a list of SLOs created in this account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"KeyAttributes"`: You can use this optional field to specify which services you want to
  retrieve SLO information for. This is a string-to-string map. It can include the following
  fields.    Type designates the type of object this is.    ResourceType specifies the type
  of the resource. This field is used only when the value of the Type field is Resource or
  AWS::Resource.    Name specifies the name of the object. This is used only if the value of
  the Type field is Service, RemoteService, or AWS::Service.    Identifier identifies the
  resource objects of this resource. This is used only if the value of the Type field is
  Resource or AWS::Resource.    Environment specifies the location where this object is
  hosted, or what it belongs to.
- `"MaxResults"`: The maximum number of results to return in one operation. If you omit
  this parameter, the default of 50 is used.
- `"NextToken"`: Include this value, if it was returned by the previous operation, to get
  the next set of service level objectives.
- `"OperationName"`: The name of the operation that this SLO is associated with.
"""
function list_service_level_objectives(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_signals(
        "POST", "/slos"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_service_level_objectives(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST", "/slos", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_service_operations(end_time, key_attributes, start_time)
    list_service_operations(end_time, key_attributes, start_time, params::Dict{String,<:Any})

Returns a list of the operations of this service that have been discovered by Application
Signals. Only the operations that were invoked during the specified time range are returned.

# Arguments
- `end_time`: The end of the time period to retrieve information about. When used in a raw
  HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057  Your
  requested end time will be rounded to the nearest hour.
- `key_attributes`: Use this field to specify which service you want to retrieve
  information for. You must specify at least the Type, Name, and Environment attributes. This
  is a string-to-string map. It can include the following fields.    Type designates the type
  of object this is.    ResourceType specifies the type of the resource. This field is used
  only when the value of the Type field is Resource or AWS::Resource.    Name specifies the
  name of the object. This is used only if the value of the Type field is Service,
  RemoteService, or AWS::Service.    Identifier identifies the resource objects of this
  resource. This is used only if the value of the Type field is Resource or AWS::Resource.
  Environment specifies the location where this object is hosted, or what it belongs to.
- `start_time`: The start of the time period to retrieve information about. When used in a
  raw HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057
  Your requested start time will be rounded to the nearest hour.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return in one operation. If you omit
  this parameter, the default of 50 is used.
- `"NextToken"`: Include this value, if it was returned by the previous operation, to get
  the next set of service operations.
"""
function list_service_operations(
    EndTime, KeyAttributes, StartTime; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/service-operations",
        Dict{String,Any}(
            "EndTime" => EndTime, "KeyAttributes" => KeyAttributes, "StartTime" => StartTime
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_service_operations(
    EndTime,
    KeyAttributes,
    StartTime,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/service-operations",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "EndTime" => EndTime,
                    "KeyAttributes" => KeyAttributes,
                    "StartTime" => StartTime,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_services(end_time, start_time)
    list_services(end_time, start_time, params::Dict{String,<:Any})

Returns a list of services that have been discovered by Application Signals. A service
represents a minimum logical and transactional unit that completes a business function.
Services are discovered through Application Signals instrumentation.

# Arguments
- `end_time`: The end of the time period to retrieve information about. When used in a raw
  HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057  Your
  requested start time will be rounded to the nearest hour.
- `start_time`: The start of the time period to retrieve information about. When used in a
  raw HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057
  Your requested start time will be rounded to the nearest hour.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`:  The maximum number of results to return in one operation. If you omit
  this parameter, the default of 50 is used.
- `"NextToken"`: Include this value, if it was returned by the previous operation, to get
  the next set of services.
"""
function list_services(
    EndTime, StartTime; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "GET",
        "/services",
        Dict{String,Any}("EndTime" => EndTime, "StartTime" => StartTime);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_services(
    EndTime,
    StartTime,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "GET",
        "/services",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("EndTime" => EndTime, "StartTime" => StartTime),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Displays the tags associated with a CloudWatch resource. Tags can be assigned to service
level objectives.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the CloudWatch resource that you want
  to view tags for. The ARN format of an Application Signals SLO is
  arn:aws:cloudwatch:Region:account-id:slo:slo-name   For more information about ARN format,
  see  Resource Types Defined by Amazon CloudWatch in the Amazon Web Services General
  Reference.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "GET",
        "/tags",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "GET",
        "/tags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_discovery()
    start_discovery(params::Dict{String,<:Any})

Enables this Amazon Web Services account to be able to use CloudWatch Application Signals
by creating the AWSServiceRoleForCloudWatchApplicationSignals service-linked role. This
service- linked role has the following permissions:    xray:GetServiceGraph
logs:StartQuery     logs:GetQueryResults     cloudwatch:GetMetricData
cloudwatch:ListMetrics     tag:GetResources     autoscaling:DescribeAutoScalingGroups
After completing this step, you still need to instrument your Java and Python applications
to send data to Application Signals. For more information, see  Enabling Application
Signals.

"""
function start_discovery(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_signals(
        "POST", "/start-discovery"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function start_discovery(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/start-discovery",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Assigns one or more tags (key-value pairs) to the specified CloudWatch resource, such as a
service level objective. Tags can help you organize and categorize your resources. You can
also use them to scope user permissions by granting a user permission to access or change
only resources with certain tag values. Tags don't have any semantic meaning to Amazon Web
Services and are interpreted strictly as strings of characters. You can use the TagResource
action with an alarm that already has tags. If you specify a new tag key for the alarm,
this tag is appended to the list of tags associated with the alarm. If you specify a tag
key that is already associated with the alarm, the new tag value that you specify replaces
the previous value for that tag. You can associate as many as 50 tags with a CloudWatch
resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the CloudWatch resource that you want
  to set tags for. The ARN format of an Application Signals SLO is
  arn:aws:cloudwatch:Region:account-id:slo:slo-name   For more information about ARN format,
  see  Resource Types Defined by Amazon CloudWatch in the Amazon Web Services General
  Reference.
- `tags`: The list of key-value pairs to associate with the alarm.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return application_signals(
        "POST",
        "/tag-resource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceArn,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/tag-resource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes one or more tags from the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the CloudWatch resource that you want
  to delete tags from. The ARN format of an Application Signals SLO is
  arn:aws:cloudwatch:Region:account-id:slo:slo-name   For more information about ARN format,
  see  Resource Types Defined by Amazon CloudWatch in the Amazon Web Services General
  Reference.
- `tag_keys`: The list of tag keys to remove from the resource.

"""
function untag_resource(
    ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "POST",
        "/untag-resource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceArn,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_signals(
        "POST",
        "/untag-resource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_service_level_objective(id)
    update_service_level_objective(id, params::Dict{String,<:Any})

Updates an existing service level objective (SLO). If you omit parameters, the previous
values of those parameters are retained.  You cannot change from a period-based SLO to a
request-based SLO, or change from a request-based SLO to a period-based SLO.

# Arguments
- `id`: The Amazon Resource Name (ARN) or name of the service level objective that you want
  to update.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: An optional description for the SLO.
- `"Goal"`: A structure that contains the attributes that determine the goal of the SLO.
  This includes the time period for evaluation and the attainment threshold.
- `"RequestBasedSliConfig"`: If this SLO is a request-based SLO, this structure defines the
  information about what performance metric this SLO will monitor. You can't specify both
  SliConfig and RequestBasedSliConfig in the same operation.
- `"SliConfig"`: If this SLO is a period-based SLO, this structure defines the information
  about what performance metric this SLO will monitor.
"""
function update_service_level_objective(
    Id; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "PATCH", "/slo/$(Id)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function update_service_level_objective(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_signals(
        "PATCH",
        "/slo/$(Id)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
