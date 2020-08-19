# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: codeguruprofiler

using Compat
using UUIDs
"""
    AddNotificationChannels()

Add up to 2 anomaly notifications channels for a profiling group.

# Required Parameters
- `channels`: One or 2 channels to report to when anomalies are detected.
- `profilingGroupName`: The name of the profiling group that we are setting up notifications for.

"""

AddNotificationChannels(channels, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/notificationConfiguration", Dict{String, Any}("channels"=>channels); aws_config=aws_config)
AddNotificationChannels(channels, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/notificationConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channels"=>channels), args)); aws_config=aws_config)

"""
    BatchGetFrameMetricData()

 Returns the time series of values for a requested list of frame metrics from a time period.

# Required Parameters
- `profilingGroupName`:  The name of the profiling group associated with the the frame metrics used to return the time series values. 

# Optional Parameters
- `endTime`:  The end time of the time period for the returned time series values. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 
- `frameMetrics`:  The details of the metrics that are used to request a time series of values. The metric includes the name of the frame, the aggregation type to calculate the metric value for the frame, and the thread states to use to get the count for the metric value of the frame.
- `period`:  The duration of the frame metrics used to return the time series values. Specify using the ISO 8601 format. The maximum period duration is one day (PT24H or P1D). 
- `startTime`:  The start time of the time period for the frame metrics used to return the time series values. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 
- `targetResolution`: The requested resolution of time steps for the returned time series of values. If the requested target resolution is not available due to data not being retained we provide a best effort result by falling back to the most granular available resolution after the target resolution. There are 3 valid values.     P1D — 1 day     PT1H — 1 hour     PT5M — 5 minutes   
"""

BatchGetFrameMetricData(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/frames/-/metrics"; aws_config=aws_config)
BatchGetFrameMetricData(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/frames/-/metrics", args; aws_config=aws_config)

"""
    ConfigureAgent()

 Used by profiler agents to report their current state and to receive remote configuration updates. For example, ConfigureAgent can be used to tell and agent whether to profile or not and for how long to return profiling data. 

# Required Parameters
- `profilingGroupName`:  The name of the profiling group for which the configured agent is collecting profiling data. 

# Optional Parameters
- `fleetInstanceId`:  A universally unique identifier (UUID) for a profiling instance. For example, if the profiling instance is an Amazon EC2 instance, it is the instance ID. If it is an AWS Fargate container, it is the container's task ID. 
- `metadata`:  Metadata captured about the compute platform the agent is running on. It includes information about sampling and reporting. The valid fields are:    COMPUTE_PLATFORM - The compute platform on which the agent is running     AGENT_ID - The ID for an agent instance.     AWS_REQUEST_ID - The AWS request ID of a Lambda invocation.     EXECUTION_ENVIRONMENT - The execution environment a Lambda function is running on.     LAMBDA_FUNCTION_ARN - The Amazon Resource Name (ARN) that is used to invoke a Lambda function.     LAMBDA_MEMORY_LIMIT_IN_MB - The memory allocated to a Lambda function.     LAMBDA_REMAINING_TIME_IN_MILLISECONDS - The time in milliseconds before execution of a Lambda function times out.     LAMBDA_TIME_GAP_BETWEEN_INVOKES_IN_MILLISECONDS - The time in milliseconds between two invocations of a Lambda function.     LAMBDA_PREVIOUS_EXECUTION_TIME_IN_MILLISECONDS - The time in milliseconds for the previous Lambda invocation.   
"""

ConfigureAgent(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/configureAgent"; aws_config=aws_config)
ConfigureAgent(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/configureAgent", args; aws_config=aws_config)

"""
    CreateProfilingGroup()

Creates a profiling group.

# Required Parameters
- `clientToken`:  Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to prevent the accidental creation of duplicate profiling groups if there are failures and retries. 
- `profilingGroupName`: The name of the profiling group to create.

# Optional Parameters
- `agentOrchestrationConfig`:  Specifies whether profiling is enabled or disabled for the created profiling group. 
- `computePlatform`:  The compute platform of the profiling group. Use AWSLambda if your application runs on AWS Lambda. Use Default if your application runs on a compute platform that is not AWS Lambda, such an Amazon EC2 instance, an on-premises server, or a different platform. If not specified, Default is used. 
- `tags`:  A list of tags to add to the created profiling group. 
"""

CreateProfilingGroup(clientToken, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups", Dict{String, Any}("clientToken"=>clientToken, "profilingGroupName"=>profilingGroupName); aws_config=aws_config)
CreateProfilingGroup(clientToken, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>clientToken, "profilingGroupName"=>profilingGroupName), args)); aws_config=aws_config)

"""
    DeleteProfilingGroup()

Deletes a profiling group.

# Required Parameters
- `profilingGroupName`: The name of the profiling group to delete.

"""

DeleteProfilingGroup(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)"; aws_config=aws_config)
DeleteProfilingGroup(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)", args; aws_config=aws_config)

"""
    DescribeProfilingGroup()

 Returns a  ProfilingGroupDescription  object that contains information about the requested profiling group. 

# Required Parameters
- `profilingGroupName`:  The name of the profiling group to get information about. 

"""

DescribeProfilingGroup(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)"; aws_config=aws_config)
DescribeProfilingGroup(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)", args; aws_config=aws_config)

"""
    GetFindingsReportAccountSummary()

 Returns a list of  FindingsReportSummary  objects that contain analysis results for all profiling groups in your AWS account. 

# Optional Parameters
- `dailyReportsOnly`: A Boolean value indicating whether to only return reports from daily profiles. If set to True, only analysis data from daily profiles is returned. If set to False, analysis data is returned from smaller time windows (for example, one hour).
- `maxResults`: The maximum number of results returned by  GetFindingsReportAccountSummary in paginated output. When this parameter is used, GetFindingsReportAccountSummary only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another GetFindingsReportAccountSummary request with the returned nextToken value.
- `nextToken`: The nextToken value returned from a previous paginated GetFindingsReportAccountSummary request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. 
"""

GetFindingsReportAccountSummary(; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/findingsReports"; aws_config=aws_config)
GetFindingsReportAccountSummary(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/findingsReports", args; aws_config=aws_config)

"""
    GetNotificationConfiguration()

Get the current configuration for anomaly notifications for a profiling group.

# Required Parameters
- `profilingGroupName`: The name of the profiling group we want to get the notification configuration for.

"""

GetNotificationConfiguration(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/notificationConfiguration"; aws_config=aws_config)
GetNotificationConfiguration(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/notificationConfiguration", args; aws_config=aws_config)

"""
    GetPolicy()

 Returns the JSON-formatted resource-based policy on a profiling group. 

# Required Parameters
- `profilingGroupName`: The name of the profiling group.

"""

GetPolicy(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/policy"; aws_config=aws_config)
GetPolicy(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/policy", args; aws_config=aws_config)

"""
    GetProfile()

 Gets the aggregated profile of a profiling group for a specified time range. Amazon CodeGuru Profiler collects posted agent profiles for a profiling group into aggregated profiles.   &lt;note&gt; &lt;p&gt; Because aggregated profiles expire over time &lt;code&gt;GetProfile&lt;/code&gt; is not idempotent. &lt;/p&gt; &lt;/note&gt; &lt;p&gt; Specify the time range for the requested aggregated profile using 1 or 2 of the following parameters: &lt;code&gt;startTime&lt;/code&gt;, &lt;code&gt;endTime&lt;/code&gt;, &lt;code&gt;period&lt;/code&gt;. The maximum time range allowed is 7 days. If you specify all 3 parameters, an exception is thrown. If you specify only &lt;code&gt;period&lt;/code&gt;, the latest aggregated profile is returned. &lt;/p&gt; &lt;p&gt; Aggregated profiles are available with aggregation periods of 5 minutes, 1 hour, and 1 day, aligned to UTC. The aggregation period of an aggregated profile determines how long it is retained. For more information, see &lt;a href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html&quot;&gt; &lt;code&gt;AggregatedProfileTime&lt;/code&gt; &lt;/a&gt;. The aggregated profile's aggregation period determines how long it is retained by CodeGuru Profiler. &lt;/p&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 5 minutes, the aggregated profile is retained for 15 days. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 1 hour, the aggregated profile is retained for 60 days. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 1 day, the aggregated profile is retained for 3 years. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; &lt;p&gt;There are two use cases for calling &lt;code&gt;GetProfile&lt;/code&gt;.&lt;/p&gt; &lt;ol&gt; &lt;li&gt; &lt;p&gt; If you want to return an aggregated profile that already exists, use &lt;a href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.html&quot;&gt; &lt;code&gt;ListProfileTimes&lt;/code&gt; &lt;/a&gt; to view the time ranges of existing aggregated profiles. Use them in a &lt;code&gt;GetProfile&lt;/code&gt; request to return a specific, existing aggregated profile. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If you want to return an aggregated profile for a time range that doesn't align with an existing aggregated profile, then CodeGuru Profiler makes a best effort to combine existing aggregated profiles from the requested time range and return them as one aggregated profile. &lt;/p&gt; &lt;p&gt; If aggregated profiles do not exist for the full time range requested, then aggregated profiles for a smaller time range are returned. For example, if the requested time range is from 00:00 to 00:20, and the existing aggregated profiles are from 00:15 and 00:25, then the aggregated profiles from 00:15 to 00:20 are returned. &lt;/p&gt; &lt;/li&gt; &lt;/ol&gt; 

# Required Parameters
- `profilingGroupName`: The name of the profiling group to get.

# Optional Parameters
- `Accept`:  The format of the returned profiling data. The format maps to the Accept and Content-Type headers of the HTTP request. You can specify one of the following: or the default .   &lt;ul&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;application/json&lt;/code&gt; — standard JSON format &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data format. For more information, see &lt;a href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon Ion&lt;/a&gt;. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; 
- `endTime`:  The end time of the requested profile. Specify using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.   If you specify endTime, then you must also specify period or startTime, but not both. 
- `maxDepth`:  The maximum depth of the stacks in the code that is represented in the aggregated profile. For example, if CodeGuru Profiler finds a method A, which calls method B, which calls method C, which calls method D, then the depth is 4. If the maxDepth is set to 2, then the aggregated profile contains representations of methods A and B. 
- `period`:  Used with startTime or endTime to specify the time range for the returned aggregated profile. Specify using the ISO 8601 format. For example, P1DT1H1M1S.   &lt;p&gt; To get the latest aggregated profile, specify only &lt;code&gt;period&lt;/code&gt;. &lt;/p&gt; 
- `startTime`: The start time of the profile to get. Specify using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.  &lt;p&gt; If you specify &lt;code&gt;startTime&lt;/code&gt;, then you must also specify &lt;code&gt;period&lt;/code&gt; or &lt;code&gt;endTime&lt;/code&gt;, but not both. &lt;/p&gt; 
"""

GetProfile(profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/profile"; aws_config=aws_config)
GetProfile(profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/profile", args; aws_config=aws_config)

"""
    GetRecommendations()

 Returns a list of  Recommendation  objects that contain recommendations for a profiling group for a given time period. A list of  Anomaly  objects that contains details about anomalies detected in the profiling group for the same time period is also returned. 

# Required Parameters
- `endTime`:  The start time of the profile to get analysis data about. You must specify startTime and endTime. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 
- `profilingGroupName`:  The name of the profiling group to get analysis data about. 
- `startTime`:  The end time of the profile to get analysis data about. You must specify startTime and endTime. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 

# Optional Parameters
- `locale`:  The language used to provide analysis. Specify using a string that is one of the following BCP 47 language codes.     de-DE - German, Germany     en-GB - English, United Kingdom     en-US - English, United States     es-ES - Spanish, Spain     fr-FR - French, France     it-IT - Italian, Italy     ja-JP - Japanese, Japan     ko-KR - Korean, Republic of Korea     pt-BR - Portugese, Brazil     zh-CN - Chinese, China     zh-TW - Chinese, Taiwan   
"""

GetRecommendations(endTime, profilingGroupName, startTime; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/profilingGroups/$(profilingGroupName)/recommendations", Dict{String, Any}("endTime"=>endTime, "startTime"=>startTime); aws_config=aws_config)
GetRecommendations(endTime, profilingGroupName, startTime, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/profilingGroups/$(profilingGroupName)/recommendations", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("endTime"=>endTime, "startTime"=>startTime), args)); aws_config=aws_config)

"""
    ListFindingsReports()

List the available reports for a given profiling group and time range.

# Required Parameters
- `endTime`:  The end time of the profile to get analysis data about. You must specify startTime and endTime. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 
- `profilingGroupName`: The name of the profiling group from which to search for analysis data.
- `startTime`:  The start time of the profile to get analysis data about. You must specify startTime and endTime. This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. 

# Optional Parameters
- `dailyReportsOnly`: A Boolean value indicating whether to only return reports from daily profiles. If set to True, only analysis data from daily profiles is returned. If set to False, analysis data is returned from smaller time windows (for example, one hour).
- `maxResults`: The maximum number of report results returned by ListFindingsReports in paginated output. When this parameter is used, ListFindingsReports only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListFindingsReports request with the returned nextToken value.
- `nextToken`: The nextToken value returned from a previous paginated ListFindingsReportsRequest request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. 
"""

ListFindingsReports(endTime, profilingGroupName, startTime; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/profilingGroups/$(profilingGroupName)/findingsReports", Dict{String, Any}("endTime"=>endTime, "startTime"=>startTime); aws_config=aws_config)
ListFindingsReports(endTime, profilingGroupName, startTime, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/internal/profilingGroups/$(profilingGroupName)/findingsReports", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("endTime"=>endTime, "startTime"=>startTime), args)); aws_config=aws_config)

"""
    ListProfileTimes()

Lists the start times of the available aggregated profiles of a profiling group for an aggregation period within the specified time range.

# Required Parameters
- `endTime`: The end time of the time range from which to list the profiles.
- `period`:  The aggregation period. This specifies the period during which an aggregation profile collects posted agent profiles for a profiling group. There are 3 valid values.     P1D — 1 day     PT1H — 1 hour     PT5M — 5 minutes   
- `profilingGroupName`: The name of the profiling group.
- `startTime`: The start time of the time range from which to list the profiles.

# Optional Parameters
- `maxResults`: The maximum number of profile time results returned by ListProfileTimes in paginated output. When this parameter is used, ListProfileTimes only returns maxResults results in a single page with a nextToken response element. The remaining results of the initial request can be seen by sending another ListProfileTimes request with the returned nextToken value. 
- `nextToken`: The nextToken value returned from a previous paginated ListProfileTimes request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. 
- `orderBy`: The order (ascending or descending by start time of the profile) to use when listing profiles. Defaults to TIMESTAMP_DESCENDING. 
"""

ListProfileTimes(endTime, period, profilingGroupName, startTime; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/profileTimes", Dict{String, Any}("endTime"=>endTime, "period"=>period, "startTime"=>startTime); aws_config=aws_config)
ListProfileTimes(endTime, period, profilingGroupName, startTime, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups/$(profilingGroupName)/profileTimes", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("endTime"=>endTime, "period"=>period, "startTime"=>startTime), args)); aws_config=aws_config)

"""
    ListProfilingGroups()

 Returns a list of profiling groups. The profiling groups are returned as  ProfilingGroupDescription  objects. 

# Optional Parameters
- `includeDescription`: A Boolean value indicating whether to include a description. If true, then a list of  ProfilingGroupDescription  objects that contain detailed information about profiling groups is returned. If false, then a list of profiling group names is returned.
- `maxResults`: The maximum number of profiling groups results returned by ListProfilingGroups in paginated output. When this parameter is used, ListProfilingGroups only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListProfilingGroups request with the returned nextToken value. 
- `nextToken`: The nextToken value returned from a previous paginated ListProfilingGroups request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. 
"""

ListProfilingGroups(; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups"; aws_config=aws_config)
ListProfilingGroups(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/profilingGroups", args; aws_config=aws_config)

"""
    ListTagsForResource()

 Returns a list of the tags that are assigned to a specified resource. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the resource that contains the tags to return. 

"""

ListTagsForResource(resourceArn; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
ListTagsForResource(resourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("GET", "/tags/$(resourceArn)", args; aws_config=aws_config)

"""
    PostAgentProfile()

 Submits profiling data to an aggregated profile of a profiling group. To get an aggregated profile that is created with this profiling data, use  GetProfile . 

# Required Parameters
- `Content-Type`:  The format of the submitted profiling data. The format maps to the Accept and Content-Type headers of the HTTP request. You can specify one of the following: or the default .   &lt;ul&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;application/json&lt;/code&gt; — standard JSON format &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data format. For more information, see &lt;a href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon Ion&lt;/a&gt;. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; 
- `agentProfile`:  The submitted profiling data. 
- `profilingGroupName`:  The name of the profiling group with the aggregated profile that receives the submitted profiling data. 

# Optional Parameters
- `profileToken`:  Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to prevent the accidental submission of duplicate profiling data if there are failures and retries. 
"""

PostAgentProfile(Content_Type, agentProfile, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/agentProfile", Dict{String, Any}("agentProfile"=>agentProfile, "profileToken"=>string(uuid4()), "headers"=>Dict{String, Any}("Content-Type"=>Content_Type)); aws_config=aws_config)
PostAgentProfile(Content_Type, agentProfile, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/profilingGroups/$(profilingGroupName)/agentProfile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("agentProfile"=>agentProfile, "profileToken"=>string(uuid4()), "headers"=>Dict{String, Any}("Content-Type"=>Content_Type)), args)); aws_config=aws_config)

"""
    PutPermission()

 Adds permissions to a profiling group's resource-based policy that are provided using an action group. If a profiling group doesn't have a resource-based policy, one is created for it using the permissions in the action group and the roles and users in the principals parameter.   &lt;p&gt; The one supported action group that can be added is &lt;code&gt;agentPermission&lt;/code&gt; which grants &lt;code&gt;ConfigureAgent&lt;/code&gt; and &lt;code&gt;PostAgent&lt;/code&gt; permissions. For more information, see &lt;a href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html&quot;&gt;Resource-based policies in CodeGuru Profiler&lt;/a&gt; in the &lt;i&gt;Amazon CodeGuru Profiler User Guide&lt;/i&gt;, &lt;a href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html&quot;&gt; &lt;code&gt;ConfigureAgent&lt;/code&gt; &lt;/a&gt;, and &lt;a href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html&quot;&gt; &lt;code&gt;PostAgentProfile&lt;/code&gt; &lt;/a&gt;. &lt;/p&gt; &lt;p&gt; The first time you call &lt;code&gt;PutPermission&lt;/code&gt; on a profiling group, do not specify a &lt;code&gt;revisionId&lt;/code&gt; because it doesn't have a resource-based policy. Subsequent calls must provide a &lt;code&gt;revisionId&lt;/code&gt; to specify which revision of the resource-based policy to add the permissions to. &lt;/p&gt; &lt;p&gt; The response contains the profiling group's JSON-formatted resource policy. &lt;/p&gt; 

# Required Parameters
- `actionGroup`:  Specifies an action group that contains permissions to add to a profiling group resource. One action group is supported, agentPermissions, which grants permission to perform actions required by the profiling agent, ConfigureAgent and PostAgentProfile permissions. 
- `principals`:  A list ARNs for the roles and users you want to grant access to the profiling group. Wildcards are not are supported in the ARNs. 
- `profilingGroupName`: The name of the profiling group to grant access to.

# Optional Parameters
- `revisionId`:  A universally unique identifier (UUID) for the revision of the policy you are adding to the profiling group. Do not specify this when you add permissions to a profiling group for the first time. If a policy already exists on the profiling group, you must specify the revisionId. 
"""

PutPermission(actionGroup, principals, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("PUT", "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)", Dict{String, Any}("principals"=>principals); aws_config=aws_config)
PutPermission(actionGroup, principals, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("PUT", "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("principals"=>principals), args)); aws_config=aws_config)

"""
    RemoveNotificationChannel()

Remove one anomaly notifications channel for a profiling group.

# Required Parameters
- `channelId`: The id of the channel that we want to stop receiving notifications.
- `profilingGroupName`: The name of the profiling group we want to change notification configuration for.

"""

RemoveNotificationChannel(channelId, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)/notificationConfiguration/$(channelId)"; aws_config=aws_config)
RemoveNotificationChannel(channelId, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)/notificationConfiguration/$(channelId)", args; aws_config=aws_config)

"""
    RemovePermission()

 Removes permissions from a profiling group's resource-based policy that are provided using an action group. The one supported action group that can be removed is agentPermission which grants ConfigureAgent and PostAgent permissions. For more information, see Resource-based policies in CodeGuru Profiler in the Amazon CodeGuru Profiler User Guide,  ConfigureAgent , and  PostAgentProfile . 

# Required Parameters
- `actionGroup`:  Specifies an action group that contains the permissions to remove from a profiling group's resource-based policy. One action group is supported, agentPermissions, which grants ConfigureAgent and PostAgentProfile permissions. 
- `profilingGroupName`: The name of the profiling group.
- `revisionId`:  A universally unique identifier (UUID) for the revision of the resource-based policy from which you want to remove permissions. 

"""

RemovePermission(actionGroup, profilingGroupName, revisionId; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)", Dict{String, Any}("revisionId"=>revisionId); aws_config=aws_config)
RemovePermission(actionGroup, profilingGroupName, revisionId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/profilingGroups/$(profilingGroupName)/policy/$(actionGroup)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("revisionId"=>revisionId), args)); aws_config=aws_config)

"""
    SubmitFeedback()

Sends feedback to CodeGuru Profiler about whether the anomaly detected by the analysis is useful or not.

# Required Parameters
- `anomalyInstanceId`: The universally unique identifier (UUID) of the  AnomalyInstance  object that is included in the analysis data.
- `profilingGroupName`: The name of the profiling group that is associated with the analysis data.
- `type`:  The feedback tpye. Thee are two valid values, Positive and Negative. 

# Optional Parameters
- `comment`: Optional feedback about this anomaly.
"""

SubmitFeedback(anomalyInstanceId, profilingGroupName, type; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/internal/profilingGroups/$(profilingGroupName)/anomalies/$(anomalyInstanceId)/feedback", Dict{String, Any}("type"=>type); aws_config=aws_config)
SubmitFeedback(anomalyInstanceId, profilingGroupName, type, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/internal/profilingGroups/$(profilingGroupName)/anomalies/$(anomalyInstanceId)/feedback", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("type"=>type), args)); aws_config=aws_config)

"""
    TagResource()

 Use to assign one or more tags to a resource. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the resource that the tags are added to. 
- `tags`:  The list of tags that are added to the specified resource. 

"""

TagResource(resourceArn, tags; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
TagResource(resourceArn, tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), args)); aws_config=aws_config)

"""
    UntagResource()

 Use to remove one or more tags from a resource. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the resource that contains the tags to remove. 
- `tagKeys`:  A list of tag keys. Existing tags of resources with keys in this list are removed from the specified resource. 

"""

UntagResource(resourceArn, tagKeys; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
UntagResource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    UpdateProfilingGroup()

Updates a profiling group.

# Required Parameters
- `agentOrchestrationConfig`:  Specifies whether profiling is enabled or disabled for a profiling group. 
- `profilingGroupName`: The name of the profiling group to update.

"""

UpdateProfilingGroup(agentOrchestrationConfig, profilingGroupName; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("PUT", "/profilingGroups/$(profilingGroupName)", Dict{String, Any}("agentOrchestrationConfig"=>agentOrchestrationConfig); aws_config=aws_config)
UpdateProfilingGroup(agentOrchestrationConfig, profilingGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = codeguruprofiler("PUT", "/profilingGroups/$(profilingGroupName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("agentOrchestrationConfig"=>agentOrchestrationConfig), args)); aws_config=aws_config)
