# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: xray
using AWS.Compat
using AWS.UUIDs

"""
    batch_get_traces(trace_ids)
    batch_get_traces(trace_ids, params::Dict{String,<:Any})

Retrieves a list of traces specified by ID. Each trace is a collection of segment documents
that originates from a single request. Use GetTraceSummaries to get a list of trace IDs.

# Arguments
- `trace_ids`: Specify the trace IDs of requests for which to retrieve segments.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Pagination token.
"""
batch_get_traces(TraceIds; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Traces", Dict{String, Any}("TraceIds"=>TraceIds); aws_config=aws_config)
batch_get_traces(TraceIds, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Traces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("TraceIds"=>TraceIds), params)); aws_config=aws_config)

"""
    create_group(group_name)
    create_group(group_name, params::Dict{String,<:Any})

Creates a group resource with a name and a filter expression.

# Arguments
- `group_name`: The case-sensitive name of the new group. Default is a reserved name and
  names must be unique.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FilterExpression"`: The filter expression defining criteria by which to group traces.
- `"InsightsConfiguration"`: The structure containing configurations related to insights.
  The InsightsEnabled boolean can be set to true to enable insights for the new group or
  false to disable insights for the new group.   The NotifcationsEnabled boolean can be set
  to true to enable insights notifications for the new group. Notifications may only be
  enabled on a group with InsightsEnabled set to true.
- `"Tags"`: A map that contains one or more tag keys and tag values to attach to an X-Ray
  group. For more information about ways to use tags, see Tagging AWS resources in the AWS
  General Reference. The following restrictions apply to tags:   Maximum number of
  user-applied tags per resource: 50   Maximum tag key length: 128 Unicode characters
  Maximum tag value length: 256 Unicode characters   Valid values for key and value: a-z,
  A-Z, 0-9, space, and the following characters: _ . : / = + - and @   Tag keys and values
  are case sensitive.   Don't use aws: as a prefix for keys; it's reserved for AWS use.
"""
create_group(GroupName; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/CreateGroup", Dict{String, Any}("GroupName"=>GroupName); aws_config=aws_config)
create_group(GroupName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/CreateGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupName"=>GroupName), params)); aws_config=aws_config)

"""
    create_sampling_rule(sampling_rule)
    create_sampling_rule(sampling_rule, params::Dict{String,<:Any})

Creates a rule to control sampling behavior for instrumented applications. Services
retrieve rules with GetSamplingRules, and evaluate each rule in ascending order of priority
for each request. If a rule matches, the service records a trace, borrowing it from the
reservoir size. After 10 seconds, the service reports back to X-Ray with GetSamplingTargets
to get updated versions of each in-use rule. The updated rule contains a trace quota that
the service can use instead of borrowing from the reservoir.

# Arguments
- `sampling_rule`: The rule definition.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Tags"`: A map that contains one or more tag keys and tag values to attach to an X-Ray
  sampling rule. For more information about ways to use tags, see Tagging AWS resources in
  the AWS General Reference. The following restrictions apply to tags:   Maximum number of
  user-applied tags per resource: 50   Maximum tag key length: 128 Unicode characters
  Maximum tag value length: 256 Unicode characters   Valid values for key and value: a-z,
  A-Z, 0-9, space, and the following characters: _ . : / = + - and @   Tag keys and values
  are case sensitive.   Don't use aws: as a prefix for keys; it's reserved for AWS use.
"""
create_sampling_rule(SamplingRule; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/CreateSamplingRule", Dict{String, Any}("SamplingRule"=>SamplingRule); aws_config=aws_config)
create_sampling_rule(SamplingRule, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/CreateSamplingRule", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SamplingRule"=>SamplingRule), params)); aws_config=aws_config)

"""
    delete_group()
    delete_group(params::Dict{String,<:Any})

Deletes a group resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"GroupARN"`: The ARN of the group that was generated on creation.
- `"GroupName"`: The case-sensitive name of the group.
"""
delete_group(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/DeleteGroup"; aws_config=aws_config)
delete_group(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/DeleteGroup", params; aws_config=aws_config)

"""
    delete_sampling_rule()
    delete_sampling_rule(params::Dict{String,<:Any})

Deletes a sampling rule.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"RuleARN"`: The ARN of the sampling rule. Specify a rule by either name or ARN, but not
  both.
- `"RuleName"`: The name of the sampling rule. Specify a rule by either name or ARN, but
  not both.
"""
delete_sampling_rule(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/DeleteSamplingRule"; aws_config=aws_config)
delete_sampling_rule(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/DeleteSamplingRule", params; aws_config=aws_config)

"""
    get_encryption_config()
    get_encryption_config(params::Dict{String,<:Any})

Retrieves the current encryption configuration for X-Ray data.

"""
get_encryption_config(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/EncryptionConfig"; aws_config=aws_config)
get_encryption_config(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/EncryptionConfig", params; aws_config=aws_config)

"""
    get_group()
    get_group(params::Dict{String,<:Any})

Retrieves group resource details.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"GroupARN"`: The ARN of the group that was generated on creation.
- `"GroupName"`: The case-sensitive name of the group.
"""
get_group(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/GetGroup"; aws_config=aws_config)
get_group(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/GetGroup", params; aws_config=aws_config)

"""
    get_groups()
    get_groups(params::Dict{String,<:Any})

Retrieves all active group details.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Pagination token.
"""
get_groups(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Groups"; aws_config=aws_config)
get_groups(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Groups", params; aws_config=aws_config)

"""
    get_insight(insight_id)
    get_insight(insight_id, params::Dict{String,<:Any})

Retrieves the summary information of an insight. This includes impact to clients and root
cause services, the top anomalous services, the category, the state of the insight, and the
start and end time of the insight.

# Arguments
- `insight_id`: The insight's unique identifier. Use the GetInsightSummaries action to
  retrieve an InsightId.

"""
get_insight(InsightId; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Insight", Dict{String, Any}("InsightId"=>InsightId); aws_config=aws_config)
get_insight(InsightId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/Insight", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InsightId"=>InsightId), params)); aws_config=aws_config)

"""
    get_insight_events(insight_id)
    get_insight_events(insight_id, params::Dict{String,<:Any})

X-Ray reevaluates insights periodically until they're resolved, and records each
intermediate state as an event. You can review an insight's events in the Impact Timeline
on the Inspect page in the X-Ray console.

# Arguments
- `insight_id`: The insight's unique identifier. Use the GetInsightSummaries action to
  retrieve an InsightId.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: Used to retrieve at most the specified value of events.
- `"NextToken"`: Specify the pagination token returned by a previous request to retrieve
  the next page of events.
"""
get_insight_events(InsightId; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightEvents", Dict{String, Any}("InsightId"=>InsightId); aws_config=aws_config)
get_insight_events(InsightId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightEvents", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InsightId"=>InsightId), params)); aws_config=aws_config)

"""
    get_insight_impact_graph(end_time, insight_id, start_time)
    get_insight_impact_graph(end_time, insight_id, start_time, params::Dict{String,<:Any})

Retrieves a service graph structure filtered by the specified insight. The service graph is
limited to only structural information. For a complete service graph, use this API with the
GetServiceGraph API.

# Arguments
- `end_time`: The estimated end time of the insight, in Unix time seconds. The EndTime is
  exclusive of the value provided. The time range between the start time and end time can't
  be more than six hours.
- `insight_id`: The insight's unique identifier. Use the GetInsightSummaries action to
  retrieve an InsightId.
- `start_time`: The estimated start time of the insight, in Unix time seconds. The
  StartTime is inclusive of the value provided and can't be more than 30 days old.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Specify the pagination token returned by a previous request to retrieve
  the next page of results.
"""
get_insight_impact_graph(EndTime, InsightId, StartTime; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightImpactGraph", Dict{String, Any}("EndTime"=>EndTime, "InsightId"=>InsightId, "StartTime"=>StartTime); aws_config=aws_config)
get_insight_impact_graph(EndTime, InsightId, StartTime, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightImpactGraph", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("EndTime"=>EndTime, "InsightId"=>InsightId, "StartTime"=>StartTime), params)); aws_config=aws_config)

"""
    get_insight_summaries(end_time, start_time)
    get_insight_summaries(end_time, start_time, params::Dict{String,<:Any})

Retrieves the summaries of all insights in the specified group matching the provided filter
values.

# Arguments
- `end_time`: The end of the time frame in which the insights ended. The end time can't be
  more than 30 days old.
- `start_time`: The beginning of the time frame in which the insights started. The start
  time can't be more than 30 days old.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"GroupARN"`: The Amazon Resource Name (ARN) of the group. Required if the GroupName
  isn't provided.
- `"GroupName"`: The name of the group. Required if the GroupARN isn't provided.
- `"MaxResults"`: The maximum number of results to display.
- `"NextToken"`: Pagination token.
- `"States"`: The list of insight states.
"""
get_insight_summaries(EndTime, StartTime; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightSummaries", Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime); aws_config=aws_config)
get_insight_summaries(EndTime, StartTime, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/InsightSummaries", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime), params)); aws_config=aws_config)

"""
    get_sampling_rules()
    get_sampling_rules(params::Dict{String,<:Any})

Retrieves all sampling rules.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Pagination token.
"""
get_sampling_rules(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/GetSamplingRules"; aws_config=aws_config)
get_sampling_rules(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/GetSamplingRules", params; aws_config=aws_config)

"""
    get_sampling_statistic_summaries()
    get_sampling_statistic_summaries(params::Dict{String,<:Any})

Retrieves information about recent sampling results for all sampling rules.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Pagination token.
"""
get_sampling_statistic_summaries(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/SamplingStatisticSummaries"; aws_config=aws_config)
get_sampling_statistic_summaries(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/SamplingStatisticSummaries", params; aws_config=aws_config)

"""
    get_sampling_targets(sampling_statistics_documents)
    get_sampling_targets(sampling_statistics_documents, params::Dict{String,<:Any})

Requests a sampling quota for rules that the service is using to sample requests.

# Arguments
- `sampling_statistics_documents`: Information about rules that the service is using to
  sample requests.

"""
get_sampling_targets(SamplingStatisticsDocuments; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/SamplingTargets", Dict{String, Any}("SamplingStatisticsDocuments"=>SamplingStatisticsDocuments); aws_config=aws_config)
get_sampling_targets(SamplingStatisticsDocuments, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/SamplingTargets", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SamplingStatisticsDocuments"=>SamplingStatisticsDocuments), params)); aws_config=aws_config)

"""
    get_service_graph(end_time, start_time)
    get_service_graph(end_time, start_time, params::Dict{String,<:Any})

Retrieves a document that describes services that process incoming requests, and downstream
services that they call as a result. Root services process incoming requests and make calls
to downstream services. Root services are applications that use the AWS X-Ray SDK.
Downstream services can be other applications, AWS resources, HTTP web APIs, or SQL
databases.

# Arguments
- `end_time`: The end of the timeframe for which to generate a graph.
- `start_time`: The start of the time frame for which to generate a graph.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"GroupARN"`: The Amazon Resource Name (ARN) of a group based on which you want to
  generate a graph.
- `"GroupName"`: The name of a group based on which you want to generate a graph.
- `"NextToken"`: Pagination token.
"""
get_service_graph(EndTime, StartTime; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/ServiceGraph", Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime); aws_config=aws_config)
get_service_graph(EndTime, StartTime, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/ServiceGraph", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime), params)); aws_config=aws_config)

"""
    get_time_series_service_statistics(end_time, start_time)
    get_time_series_service_statistics(end_time, start_time, params::Dict{String,<:Any})

Get an aggregation of service statistics defined by a specific time range.

# Arguments
- `end_time`: The end of the time frame for which to aggregate statistics.
- `start_time`: The start of the time frame for which to aggregate statistics.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"EntitySelectorExpression"`: A filter expression defining entities that will be
  aggregated for statistics. Supports ID, service, and edge functions. If no selector
  expression is specified, edge statistics are returned.
- `"ForecastStatistics"`: The forecasted high and low fault count values. Forecast enabled
  requests require the EntitySelectorExpression ID be provided.
- `"GroupARN"`: The Amazon Resource Name (ARN) of the group for which to pull statistics
  from.
- `"GroupName"`: The case-sensitive name of the group for which to pull statistics from.
- `"NextToken"`: Pagination token.
- `"Period"`: Aggregation period in seconds.
"""
get_time_series_service_statistics(EndTime, StartTime; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TimeSeriesServiceStatistics", Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime); aws_config=aws_config)
get_time_series_service_statistics(EndTime, StartTime, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TimeSeriesServiceStatistics", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime), params)); aws_config=aws_config)

"""
    get_trace_graph(trace_ids)
    get_trace_graph(trace_ids, params::Dict{String,<:Any})

Retrieves a service graph for one or more specific trace IDs.

# Arguments
- `trace_ids`: Trace IDs of requests for which to generate a service graph.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: Pagination token.
"""
get_trace_graph(TraceIds; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceGraph", Dict{String, Any}("TraceIds"=>TraceIds); aws_config=aws_config)
get_trace_graph(TraceIds, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceGraph", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("TraceIds"=>TraceIds), params)); aws_config=aws_config)

"""
    get_trace_summaries(end_time, start_time)
    get_trace_summaries(end_time, start_time, params::Dict{String,<:Any})

Retrieves IDs and annotations for traces available for a specified time frame using an
optional filter. To get the full traces, pass the trace IDs to BatchGetTraces. A filter
expression can target traced requests that hit specific service nodes or edges, have
errors, or come from a known user. For example, the following filter expression targets
traces that pass through api.example.com:  service(\"api.example.com\")  This filter
expression finds traces that have an annotation named account with the value 12345:
annotation.account = \"12345\"  For a full list of indexed fields and keywords that you can
use in filter expressions, see Using Filter Expressions in the AWS X-Ray Developer Guide.

# Arguments
- `end_time`: The end of the time frame for which to retrieve traces.
- `start_time`: The start of the time frame for which to retrieve traces.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FilterExpression"`: Specify a filter expression to retrieve trace summaries for
  services or requests that meet certain requirements.
- `"NextToken"`: Specify the pagination token returned by a previous request to retrieve
  the next page of results.
- `"Sampling"`: Set to true to get summaries for only a subset of available traces.
- `"SamplingStrategy"`: A parameter to indicate whether to enable sampling on trace
  summaries. Input parameters are Name and Value.
- `"TimeRangeType"`: A parameter to indicate whether to query trace summaries by TraceId or
  Event time.
"""
get_trace_summaries(EndTime, StartTime; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceSummaries", Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime); aws_config=aws_config)
get_trace_summaries(EndTime, StartTime, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceSummaries", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("EndTime"=>EndTime, "StartTime"=>StartTime), params)); aws_config=aws_config)

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Returns a list of tags that are applied to the specified AWS X-Ray group or sampling rule.

# Arguments
- `resource_arn`: The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: A pagination token. If multiple pages of results are returned, use the
  NextToken value returned with the current page of results as the value of this parameter to
  get the next page of results.
"""
list_tags_for_resource(ResourceARN; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/ListTagsForResource", Dict{String, Any}("ResourceARN"=>ResourceARN); aws_config=aws_config)
list_tags_for_resource(ResourceARN, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN), params)); aws_config=aws_config)

"""
    put_encryption_config(type)
    put_encryption_config(type, params::Dict{String,<:Any})

Updates the encryption configuration for X-Ray data.

# Arguments
- `type`: The type of encryption. Set to KMS to use your own key for encryption. Set to
  NONE for default encryption.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"KeyId"`: An AWS KMS customer master key (CMK) in one of the following formats:    Alias
  - The name of the key. For example, alias/MyKey.    Key ID - The KMS key ID of the key. For
  example, ae4aa6d49-a4d8-9df9-a475-4ff6d7898456. AWS X-Ray does not support asymmetric CMKs.
     ARN - The full Amazon Resource Name of the key ID or alias. For example,
  arn:aws:kms:us-east-2:123456789012:key/ae4aa6d49-a4d8-9df9-a475-4ff6d7898456. Use this
  format to specify a key in a different account.   Omit this key if you set Type to NONE.
"""
put_encryption_config(Type; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/PutEncryptionConfig", Dict{String, Any}("Type"=>Type); aws_config=aws_config)
put_encryption_config(Type, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/PutEncryptionConfig", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Type"=>Type), params)); aws_config=aws_config)

"""
    put_telemetry_records(telemetry_records)
    put_telemetry_records(telemetry_records, params::Dict{String,<:Any})

Used by the AWS X-Ray daemon to upload telemetry.

# Arguments
- `telemetry_records`:

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"EC2InstanceId"`:
- `"Hostname"`:
- `"ResourceARN"`:
"""
put_telemetry_records(TelemetryRecords; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TelemetryRecords", Dict{String, Any}("TelemetryRecords"=>TelemetryRecords); aws_config=aws_config)
put_telemetry_records(TelemetryRecords, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TelemetryRecords", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("TelemetryRecords"=>TelemetryRecords), params)); aws_config=aws_config)

"""
    put_trace_segments(trace_segment_documents)
    put_trace_segments(trace_segment_documents, params::Dict{String,<:Any})

Uploads segment documents to AWS X-Ray. The X-Ray SDK generates segment documents and sends
them to the X-Ray daemon, which uploads them in batches. A segment document can be a
completed segment, an in-progress segment, or an array of subsegments. Segments must
include the following fields. For the full segment document schema, see AWS X-Ray Segment
Documents in the AWS X-Ray Developer Guide.  Required segment document fields     name -
The name of the service that handled the request.    id - A 64-bit identifier for the
segment, unique among segments in the same trace, in 16 hexadecimal digits.    trace_id - A
unique identifier that connects all segments and subsegments originating from a single
client request.    start_time - Time the segment or subsegment was created, in floating
point seconds in epoch time, accurate to milliseconds. For example, 1480615200.010 or
1.480615200010E9.    end_time - Time the segment or subsegment was closed. For example,
1480615200.090 or 1.480615200090E9. Specify either an end_time or in_progress.
in_progress - Set to true instead of specifying an end_time to record that a segment has
been started, but is not complete. Send an in-progress segment when your application
receives a request that will take a long time to serve, to trace that the request was
received. When the response is sent, send the complete segment to overwrite the in-progress
segment.   A trace_id consists of three numbers separated by hyphens. For example,
1-58406520-a006649127e371903a2de979. This includes:  Trace ID Format    The version number,
for instance, 1.   The time of the original request, in Unix epoch time, in 8 hexadecimal
digits. For example, 10:00AM December 2nd, 2016 PST in epoch time is 1480615200 seconds, or
58406520 in hexadecimal.   A 96-bit identifier for the trace, globally unique, in 24
hexadecimal digits.

# Arguments
- `trace_segment_documents`: A string containing a JSON document defining one or more
  segments or subsegments.

"""
put_trace_segments(TraceSegmentDocuments; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceSegments", Dict{String, Any}("TraceSegmentDocuments"=>TraceSegmentDocuments); aws_config=aws_config)
put_trace_segments(TraceSegmentDocuments, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TraceSegments", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("TraceSegmentDocuments"=>TraceSegmentDocuments), params)); aws_config=aws_config)

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Applies tags to an existing AWS X-Ray group or sampling rule.

# Arguments
- `resource_arn`: The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
- `tags`: A map that contains one or more tag keys and tag values to attach to an X-Ray
  group or sampling rule. For more information about ways to use tags, see Tagging AWS
  resources in the AWS General Reference. The following restrictions apply to tags:   Maximum
  number of user-applied tags per resource: 50   Maximum tag key length: 128 Unicode
  characters   Maximum tag value length: 256 Unicode characters   Valid values for key and
  value: a-z, A-Z, 0-9, space, and the following characters: _ . : / = + - and @   Tag keys
  and values are case sensitive.   Don't use aws: as a prefix for keys; it's reserved for AWS
  use. You cannot edit or delete system tags.

"""
tag_resource(ResourceARN, Tags; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TagResource", Dict{String, Any}("ResourceARN"=>ResourceARN, "Tags"=>Tags); aws_config=aws_config)
tag_resource(ResourceARN, Tags, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN, "Tags"=>Tags), params)); aws_config=aws_config)

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from an AWS X-Ray group or sampling rule. You cannot edit or delete system
tags (those with an aws: prefix).

# Arguments
- `resource_arn`: The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
- `tag_keys`: Keys for one or more tags that you want to remove from an X-Ray group or
  sampling rule.

"""
untag_resource(ResourceARN, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UntagResource", Dict{String, Any}("ResourceARN"=>ResourceARN, "TagKeys"=>TagKeys); aws_config=aws_config)
untag_resource(ResourceARN, TagKeys, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceARN"=>ResourceARN, "TagKeys"=>TagKeys), params)); aws_config=aws_config)

"""
    update_group()
    update_group(params::Dict{String,<:Any})

Updates a group resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FilterExpression"`: The updated filter expression defining criteria by which to group
  traces.
- `"GroupARN"`: The ARN that was generated upon creation.
- `"GroupName"`: The case-sensitive name of the group.
- `"InsightsConfiguration"`: The structure containing configurations related to insights.
  The InsightsEnabled boolean can be set to true to enable insights for the group or false to
  disable insights for the group.   The NotifcationsEnabled boolean can be set to true to
  enable insights notifications for the group. Notifications can only be enabled on a group
  with InsightsEnabled set to true.
"""
update_group(; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UpdateGroup"; aws_config=aws_config)
update_group(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UpdateGroup", params; aws_config=aws_config)

"""
    update_sampling_rule(sampling_rule_update)
    update_sampling_rule(sampling_rule_update, params::Dict{String,<:Any})

Modifies a sampling rule's configuration.

# Arguments
- `sampling_rule_update`: The rule and fields to change.

"""
update_sampling_rule(SamplingRuleUpdate; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UpdateSamplingRule", Dict{String, Any}("SamplingRuleUpdate"=>SamplingRuleUpdate); aws_config=aws_config)
update_sampling_rule(SamplingRuleUpdate, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = xray("POST", "/UpdateSamplingRule", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SamplingRuleUpdate"=>SamplingRuleUpdate), params)); aws_config=aws_config)
