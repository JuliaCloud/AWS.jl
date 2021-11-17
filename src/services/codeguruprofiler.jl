# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: codeguruprofiler
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "end_time" => "endTime",
    "frame_metrics" => "frameMetrics",
    "next_token" => "nextToken",
    "target_resolution" => "targetResolution",
    "start_time" => "startTime",
    "daily_reports_only" => "dailyReportsOnly",
    "max_depth" => "maxDepth",
    "period" => "period",
    "max_results" => "maxResults",
    "compute_platform" => "computePlatform",
    "comment" => "comment",
    "agent_orchestration_config" => "agentOrchestrationConfig",
    "order_by" => "orderBy",
    "include_description" => "includeDescription",
    "accept" => "Accept",
    "fleet_instance_id" => "fleetInstanceId",
    "locale" => "locale",
    "revision_id" => "revisionId",
    "tags" => "tags",
    "profile_token" => "profileToken",
    "metadata" => "metadata",
)

"""
    add_notification_channels(channels, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Add up to 2 anomaly notifications channels for a profiling group.

# Arguments
- `channels`: One or 2 channels to report to when anomalies are detected.
- `profiling_group_name`: The name of the profiling group that we are setting up
  notifications for.

"""
function add_notification_channels(
    channels,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/profilingGroups/$(profilingGroupName)/notificationConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channels" => channels), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    batch_get_frame_metric_data(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the time series of values for a requested list of frame metrics from a time period.

# Arguments
- `profiling_group_name`:  The name of the profiling group associated with the the frame
  metrics used to return the time series values.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"end_time"`:  The end time of the time period for the returned time series values. This
  is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  millisecond past June 1, 2020 1:15:02 PM UTC.
- `"frame_metrics"`:  The details of the metrics that are used to request a time series of
  values. The metric includes the name of the frame, the aggregation type to calculate the
  metric value for the frame, and the thread states to use to get the count for the metric
  value of the frame.
- `"period"`:  The duration of the frame metrics used to return the time series values.
  Specify using the ISO 8601 format. The maximum period duration is one day (PT24H or P1D).
- `"start_time"`:  The start time of the time period for the frame metrics used to return
  the time series values. This is specified using the ISO 8601 format. For example,
  2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
- `"target_resolution"`: The requested resolution of time steps for the returned time
  series of values. If the requested target resolution is not available due to data not being
  retained we provide a best effort result by falling back to the most granular available
  resolution after the target resolution. There are 3 valid values.     P1D — 1 day
  PT1H — 1 hour     PT5M — 5 minutes
"""
function batch_get_frame_metric_data(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/profilingGroups/$(profilingGroupName)/frames/-/metrics",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    configure_agent(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Used by profiler agents to report their current state and to receive remote configuration
updates. For example, ConfigureAgent can be used to tell an agent whether to profile or not
and for how long to return profiling data.

# Arguments
- `profiling_group_name`:  The name of the profiling group for which the configured agent
  is collecting profiling data.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"fleet_instance_id"`:  A universally unique identifier (UUID) for a profiling instance.
  For example, if the profiling instance is an Amazon EC2 instance, it is the instance ID. If
  it is an AWS Fargate container, it is the container's task ID.
- `"metadata"`:  Metadata captured about the compute platform the agent is running on. It
  includes information about sampling and reporting. The valid fields are:
  COMPUTE_PLATFORM - The compute platform on which the agent is running     AGENT_ID - The ID
  for an agent instance.     AWS_REQUEST_ID - The AWS request ID of a Lambda invocation.
  EXECUTION_ENVIRONMENT - The execution environment a Lambda function is running on.
  LAMBDA_FUNCTION_ARN - The Amazon Resource Name (ARN) that is used to invoke a Lambda
  function.     LAMBDA_MEMORY_LIMIT_IN_MB - The memory allocated to a Lambda function.
  LAMBDA_REMAINING_TIME_IN_MILLISECONDS - The time in milliseconds before execution of a
  Lambda function times out.     LAMBDA_TIME_GAP_BETWEEN_INVOKES_IN_MILLISECONDS - The time
  in milliseconds between two invocations of a Lambda function.
  LAMBDA_PREVIOUS_EXECUTION_TIME_IN_MILLISECONDS - The time in milliseconds for the previous
  Lambda invocation.
"""
function configure_agent(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/profilingGroups/$(profilingGroupName)/configureAgent",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_profiling_group(client_token, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a profiling group.

# Arguments
- `client_token`:  Amazon CodeGuru Profiler uses this universally unique identifier (UUID)
  to prevent the accidental creation of duplicate profiling groups if there are failures and
  retries.
- `profiling_group_name`: The name of the profiling group to create.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"agent_orchestration_config"`:  Specifies whether profiling is enabled or disabled for
  the created profiling group.
- `"compute_platform"`:  The compute platform of the profiling group. Use AWSLambda if your
  application runs on AWS Lambda. Use Default if your application runs on a compute platform
  that is not AWS Lambda, such an Amazon EC2 instance, an on-premises server, or a different
  platform. If not specified, Default is used.
- `"tags"`:  A list of tags to add to the created profiling group.
"""
function create_profiling_group(
    clientToken,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/profilingGroups",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "clientToken" => clientToken, "profilingGroupName" => profilingGroupName
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_profiling_group(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a profiling group.

# Arguments
- `profiling_group_name`: The name of the profiling group to delete.

"""
function delete_profiling_group(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "DELETE",
        "/profilingGroups/$(profilingGroupName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_profiling_group(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a  ProfilingGroupDescription  object that contains information about the requested
profiling group.

# Arguments
- `profiling_group_name`:  The name of the profiling group to get information about.

"""
function describe_profiling_group(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups/$(profilingGroupName)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_findings_report_account_summary(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of  FindingsReportSummary  objects that contain analysis results for all
profiling groups in your AWS account.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"daily_reports_only"`: A Boolean value indicating whether to only return reports from
  daily profiles. If set to True, only analysis data from daily profiles is returned. If set
  to False, analysis data is returned from smaller time windows (for example, one hour).
- `"max_results"`: The maximum number of results returned by
  GetFindingsReportAccountSummary in paginated output. When this parameter is used,
  GetFindingsReportAccountSummary only returns maxResults results in a single page along with
  a nextToken response element. The remaining results of the initial request can be seen by
  sending another GetFindingsReportAccountSummary request with the returned nextToken value.
- `"next_token"`: The nextToken value returned from a previous paginated
  GetFindingsReportAccountSummary request where maxResults was used and the results exceeded
  the value of that parameter. Pagination continues from the end of the previous results that
  returned the nextToken value.   This token should be treated as an opaque identifier that
  is only used to retrieve the next items in a list and not for other programmatic purposes.
"""
function get_findings_report_account_summary(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/internal/findingsReports",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_notification_configuration(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Get the current configuration for anomaly notifications for a profiling group.

# Arguments
- `profiling_group_name`: The name of the profiling group we want to get the notification
  configuration for.

"""
function get_notification_configuration(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups/$(profilingGroupName)/notificationConfiguration",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_policy(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns the JSON-formatted resource-based policy on a profiling group.

# Arguments
- `profiling_group_name`: The name of the profiling group.

"""
function get_policy(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups/$(profilingGroupName)/policy",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_profile(profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Gets the aggregated profile of a profiling group for a specified time range. Amazon
CodeGuru Profiler collects posted agent profiles for a profiling group into aggregated
profiles.   &lt;note&gt; &lt;p&gt; Because aggregated profiles expire over time
&lt;code&gt;GetProfile&lt;/code&gt; is not idempotent. &lt;/p&gt; &lt;/note&gt; &lt;p&gt;
Specify the time range for the requested aggregated profile using 1 or 2 of the following
parameters: &lt;code&gt;startTime&lt;/code&gt;, &lt;code&gt;endTime&lt;/code&gt;,
&lt;code&gt;period&lt;/code&gt;. The maximum time range allowed is 7 days. If you specify
all 3 parameters, an exception is thrown. If you specify only
&lt;code&gt;period&lt;/code&gt;, the latest aggregated profile is returned. &lt;/p&gt;
&lt;p&gt; Aggregated profiles are available with aggregation periods of 5 minutes, 1 hour,
and 1 day, aligned to UTC. The aggregation period of an aggregated profile determines how
long it is retained. For more information, see &lt;a
href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTim
e.html&quot;&gt; &lt;code&gt;AggregatedProfileTime&lt;/code&gt; &lt;/a&gt;. The aggregated
profile's aggregation period determines how long it is retained by CodeGuru Profiler.
&lt;/p&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 5 minutes, the
aggregated profile is retained for 15 days. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If
the aggregation period is 1 hour, the aggregated profile is retained for 60 days.
&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 1 day, the
aggregated profile is retained for 3 years. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
&lt;p&gt;There are two use cases for calling &lt;code&gt;GetProfile&lt;/code&gt;.&lt;/p&gt;
&lt;ol&gt; &lt;li&gt; &lt;p&gt; If you want to return an aggregated profile that already
exists, use &lt;a
href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.htm
l&quot;&gt; &lt;code&gt;ListProfileTimes&lt;/code&gt; &lt;/a&gt; to view the time ranges of
existing aggregated profiles. Use them in a &lt;code&gt;GetProfile&lt;/code&gt; request to
return a specific, existing aggregated profile. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;
If you want to return an aggregated profile for a time range that doesn't align with an
existing aggregated profile, then CodeGuru Profiler makes a best effort to combine existing
aggregated profiles from the requested time range and return them as one aggregated
profile. &lt;/p&gt; &lt;p&gt; If aggregated profiles do not exist for the full time range
requested, then aggregated profiles for a smaller time range are returned. For example, if
the requested time range is from 00:00 to 00:20, and the existing aggregated profiles are
from 00:15 and 00:25, then the aggregated profiles from 00:15 to 00:20 are returned.
&lt;/p&gt; &lt;/li&gt; &lt;/ol&gt;

# Arguments
- `profiling_group_name`: The name of the profiling group to get.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"accept"`:  The format of the returned profiling data. The format maps to the Accept and
  Content-Type headers of the HTTP request. You can specify one of the following: or the
  default .   &lt;ul&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;application/json&lt;/code&gt; —
  standard JSON format &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;
  &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data format. For more
  information, see &lt;a href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon
  Ion&lt;/a&gt;. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
- `"end_time"`:  The end time of the requested profile. Specify using the ISO 8601 format.
  For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
  UTC.   If you specify endTime, then you must also specify period or startTime, but not
  both.
- `"max_depth"`:  The maximum depth of the stacks in the code that is represented in the
  aggregated profile. For example, if CodeGuru Profiler finds a method A, which calls method
  B, which calls method C, which calls method D, then the depth is 4. If the maxDepth is set
  to 2, then the aggregated profile contains representations of methods A and B.
- `"period"`:  Used with startTime or endTime to specify the time range for the returned
  aggregated profile. Specify using the ISO 8601 format. For example, P1DT1H1M1S.   &lt;p&gt;
  To get the latest aggregated profile, specify only &lt;code&gt;period&lt;/code&gt;.
  &lt;/p&gt;
- `"start_time"`: The start time of the profile to get. Specify using the ISO 8601 format.
  For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
  UTC.  &lt;p&gt; If you specify &lt;code&gt;startTime&lt;/code&gt;, then you must also
  specify &lt;code&gt;period&lt;/code&gt; or &lt;code&gt;endTime&lt;/code&gt;, but not both.
  &lt;/p&gt;
"""
function get_profile(
    profilingGroupName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups/$(profilingGroupName)/profile",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_recommendations(end_time, profiling_group_name, start_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of  Recommendation  objects that contain recommendations for a profiling
group for a given time period. A list of  Anomaly  objects that contains details about
anomalies detected in the profiling group for the same time period is also returned.

# Arguments
- `end_time`:  The start time of the profile to get analysis data about. You must specify
  startTime and endTime. This is specified using the ISO 8601 format. For example,
  2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
- `profiling_group_name`:  The name of the profiling group to get analysis data about.
- `start_time`:  The end time of the profile to get analysis data about. You must specify
  startTime and endTime. This is specified using the ISO 8601 format. For example,
  2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"locale"`:  The language used to provide analysis. Specify using a string that is one of
  the following BCP 47 language codes.     de-DE - German, Germany     en-GB - English,
  United Kingdom     en-US - English, United States     es-ES - Spanish, Spain     fr-FR -
  French, France     it-IT - Italian, Italy     ja-JP - Japanese, Japan     ko-KR - Korean,
  Republic of Korea     pt-BR - Portugese, Brazil     zh-CN - Chinese, China     zh-TW -
  Chinese, Taiwan
"""
function get_recommendations(
    endTime,
    profilingGroupName,
    startTime;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/internal/profilingGroups/$(profilingGroupName)/recommendations",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("endTime" => endTime, "startTime" => startTime),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_findings_reports(end_time, profiling_group_name, start_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

List the available reports for a given profiling group and time range.

# Arguments
- `end_time`:  The end time of the profile to get analysis data about. You must specify
  startTime and endTime. This is specified using the ISO 8601 format. For example,
  2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
- `profiling_group_name`: The name of the profiling group from which to search for analysis
  data.
- `start_time`:  The start time of the profile to get analysis data about. You must specify
  startTime and endTime. This is specified using the ISO 8601 format. For example,
  2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"daily_reports_only"`: A Boolean value indicating whether to only return reports from
  daily profiles. If set to True, only analysis data from daily profiles is returned. If set
  to False, analysis data is returned from smaller time windows (for example, one hour).
- `"max_results"`: The maximum number of report results returned by ListFindingsReports in
  paginated output. When this parameter is used, ListFindingsReports only returns maxResults
  results in a single page along with a nextToken response element. The remaining results of
  the initial request can be seen by sending another ListFindingsReports request with the
  returned nextToken value.
- `"next_token"`: The nextToken value returned from a previous paginated
  ListFindingsReportsRequest request where maxResults was used and the results exceeded the
  value of that parameter. Pagination continues from the end of the previous results that
  returned the nextToken value.   This token should be treated as an opaque identifier that
  is only used to retrieve the next items in a list and not for other programmatic purposes.
"""
function list_findings_reports(
    endTime,
    profilingGroupName,
    startTime;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/internal/profilingGroups/$(profilingGroupName)/findingsReports",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("endTime" => endTime, "startTime" => startTime),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_profile_times(end_time, period, profiling_group_name, start_time; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists the start times of the available aggregated profiles of a profiling group for an
aggregation period within the specified time range.

# Arguments
- `end_time`: The end time of the time range from which to list the profiles.
- `period`:  The aggregation period. This specifies the period during which an aggregation
  profile collects posted agent profiles for a profiling group. There are 3 valid values.
  P1D — 1 day     PT1H — 1 hour     PT5M — 5 minutes
- `profiling_group_name`: The name of the profiling group.
- `start_time`: The start time of the time range from which to list the profiles.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of profile time results returned by ListProfileTimes
  in paginated output. When this parameter is used, ListProfileTimes only returns maxResults
  results in a single page with a nextToken response element. The remaining results of the
  initial request can be seen by sending another ListProfileTimes request with the returned
  nextToken value.
- `"next_token"`: The nextToken value returned from a previous paginated ListProfileTimes
  request where maxResults was used and the results exceeded the value of that parameter.
  Pagination continues from the end of the previous results that returned the nextToken
  value.   This token should be treated as an opaque identifier that is only used to retrieve
  the next items in a list and not for other programmatic purposes.
- `"order_by"`: The order (ascending or descending by start time of the profile) to use
  when listing profiles. Defaults to TIMESTAMP_DESCENDING.
"""
function list_profile_times(
    endTime,
    period,
    profilingGroupName,
    startTime;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups/$(profilingGroupName)/profileTimes",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "endTime" => endTime, "period" => period, "startTime" => startTime
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_profiling_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of profiling groups. The profiling groups are returned as
ProfilingGroupDescription  objects.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"include_description"`: A Boolean value indicating whether to include a description. If
  true, then a list of  ProfilingGroupDescription  objects that contain detailed information
  about profiling groups is returned. If false, then a list of profiling group names is
  returned.
- `"max_results"`: The maximum number of profiling groups results returned by
  ListProfilingGroups in paginated output. When this parameter is used, ListProfilingGroups
  only returns maxResults results in a single page along with a nextToken response element.
  The remaining results of the initial request can be seen by sending another
  ListProfilingGroups request with the returned nextToken value.
- `"next_token"`: The nextToken value returned from a previous paginated
  ListProfilingGroups request where maxResults was used and the results exceeded the value of
  that parameter. Pagination continues from the end of the previous results that returned the
  nextToken value.   This token should be treated as an opaque identifier that is only used
  to retrieve the next items in a list and not for other programmatic purposes.
"""
function list_profiling_groups(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/profilingGroups",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Returns a list of the tags that are assigned to a specified resource.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the resource that contains the tags to
  return.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    post_agent_profile(content-_type, agent_profile, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Submits profiling data to an aggregated profile of a profiling group. To get an aggregated
profile that is created with this profiling data, use  GetProfile .

# Arguments
- `content-_type`:  The format of the submitted profiling data. The format maps to the
  Accept and Content-Type headers of the HTTP request. You can specify one of the following:
  or the default .   &lt;ul&gt; &lt;li&gt; &lt;p&gt;
  &lt;code&gt;application/json&lt;/code&gt; — standard JSON format &lt;/p&gt; &lt;/li&gt;
  &lt;li&gt; &lt;p&gt; &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion
  data format. For more information, see &lt;a
  href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon Ion&lt;/a&gt;. &lt;/p&gt;
  &lt;/li&gt; &lt;/ul&gt;
- `agent_profile`:  The submitted profiling data.
- `profiling_group_name`:  The name of the profiling group with the aggregated profile that
  receives the submitted profiling data.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"profile_token"`:  Amazon CodeGuru Profiler uses this universally unique identifier
  (UUID) to prevent the accidental submission of duplicate profiling data if there are
  failures and retries.
"""
function post_agent_profile(
    Content_Type,
    agentProfile,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/profilingGroups/$(profilingGroupName)/agentProfile",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "agentProfile" => agentProfile,
                    "profile_token" => string(uuid4()),
                    "headers" => Dict{String,Any}("Content-Type" => Content_Type),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_permission(action_group, principals, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Adds permissions to a profiling group's resource-based policy that are provided using an
action group. If a profiling group doesn't have a resource-based policy, one is created for
it using the permissions in the action group and the roles and users in the principals
parameter.   &lt;p&gt; The one supported action group that can be added is
&lt;code&gt;agentPermission&lt;/code&gt; which grants
&lt;code&gt;ConfigureAgent&lt;/code&gt; and &lt;code&gt;PostAgent&lt;/code&gt; permissions.
For more information, see &lt;a
href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.h
tml&quot;&gt;Resource-based policies in CodeGuru Profiler&lt;/a&gt; in the &lt;i&gt;Amazon
CodeGuru Profiler User Guide&lt;/i&gt;, &lt;a
href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html
&quot;&gt; &lt;code&gt;ConfigureAgent&lt;/code&gt; &lt;/a&gt;, and &lt;a
href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.htm
l&quot;&gt; &lt;code&gt;PostAgentProfile&lt;/code&gt; &lt;/a&gt;. &lt;/p&gt; &lt;p&gt; The
first time you call &lt;code&gt;PutPermission&lt;/code&gt; on a profiling group, do not
specify a &lt;code&gt;revisionId&lt;/code&gt; because it doesn't have a resource-based
policy. Subsequent calls must provide a &lt;code&gt;revisionId&lt;/code&gt; to specify
which revision of the resource-based policy to add the permissions to. &lt;/p&gt; &lt;p&gt;
The response contains the profiling group's JSON-formatted resource policy. &lt;/p&gt;

# Arguments
- `action_group`:  Specifies an action group that contains permissions to add to a
  profiling group resource. One action group is supported, agentPermissions, which grants
  permission to perform actions required by the profiling agent, ConfigureAgent and
  PostAgentProfile permissions.
- `principals`:  A list ARNs for the roles and users you want to grant access to the
  profiling group. Wildcards are not are supported in the ARNs.
- `profiling_group_name`: The name of the profiling group to grant access to.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"revision_id"`:  A universally unique identifier (UUID) for the revision of the policy
  you are adding to the profiling group. Do not specify this when you add permissions to a
  profiling group for the first time. If a policy already exists on the profiling group, you
  must specify the revisionId.
"""
function put_permission(
    actionGroup,
    principals,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "PUT",
        "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("principals" => principals), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    remove_notification_channel(channel_id, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Remove one anomaly notifications channel for a profiling group.

# Arguments
- `channel_id`: The id of the channel that we want to stop receiving notifications.
- `profiling_group_name`: The name of the profiling group we want to change notification
  configuration for.

"""
function remove_notification_channel(
    channelId,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "DELETE",
        "/profilingGroups/$(profilingGroupName)/notificationConfiguration/$(channelId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    remove_permission(action_group, profiling_group_name, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Removes permissions from a profiling group's resource-based policy that are provided using
an action group. The one supported action group that can be removed is agentPermission
which grants ConfigureAgent and PostAgent permissions. For more information, see
Resource-based policies in CodeGuru Profiler in the Amazon CodeGuru Profiler User Guide,
ConfigureAgent , and  PostAgentProfile .

# Arguments
- `action_group`:  Specifies an action group that contains the permissions to remove from a
  profiling group's resource-based policy. One action group is supported, agentPermissions,
  which grants ConfigureAgent and PostAgentProfile permissions.
- `profiling_group_name`: The name of the profiling group.
- `revision_id`:  A universally unique identifier (UUID) for the revision of the
  resource-based policy from which you want to remove permissions.

"""
function remove_permission(
    actionGroup,
    profilingGroupName,
    revisionId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "DELETE",
        "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("revisionId" => revisionId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    submit_feedback(anomaly_instance_id, profiling_group_name, type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Sends feedback to CodeGuru Profiler about whether the anomaly detected by the analysis is
useful or not.

# Arguments
- `anomaly_instance_id`: The universally unique identifier (UUID) of the  AnomalyInstance
  object that is included in the analysis data.
- `profiling_group_name`: The name of the profiling group that is associated with the
  analysis data.
- `type`:  The feedback tpye. Thee are two valid values, Positive and Negative.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"comment"`: Optional feedback about this anomaly.
"""
function submit_feedback(
    anomalyInstanceId,
    profilingGroupName,
    type;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/internal/profilingGroups/$(profilingGroupName)/anomalies/$(anomalyInstanceId)/feedback",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("type" => type), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Use to assign one or more tags to a resource.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the resource that the tags are added
  to.
- `tags`:  The list of tags that are added to the specified resource.

"""
function tag_resource(
    resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

 Use to remove one or more tags from a resource.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the resource that contains the tags to
  remove.
- `tag_keys`:  A list of tag keys. Existing tags of resources with keys in this list are
  removed from the specified resource.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_profiling_group(agent_orchestration_config, profiling_group_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates a profiling group.

# Arguments
- `agent_orchestration_config`:  Specifies whether profiling is enabled or disabled for a
  profiling group.
- `profiling_group_name`: The name of the profiling group to update.

"""
function update_profiling_group(
    agentOrchestrationConfig,
    profilingGroupName;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return codeguruprofiler(
        "PUT",
        "/profilingGroups/$(profilingGroupName)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("agentOrchestrationConfig" => agentOrchestrationConfig),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
