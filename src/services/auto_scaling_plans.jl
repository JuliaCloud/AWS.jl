include("../AWSServices.jl")
using .AWSServices: auto_scaling_plans

"""
    CreateScalingPlan()

Creates a scaling plan.

Required Parameters
{
  "ScalingPlanName": "The name of the scaling plan. Names cannot contain vertical bars, colons, or forward slashes.",
  "ApplicationSource": "A CloudFormation stack or set of tags. You can create one scaling plan per application source.",
  "ScalingInstructions": "The scaling instructions."
}
"""
CreateScalingPlan(args) = auto_scaling_plans("CreateScalingPlan", args)

"""
    DeleteScalingPlan()

Deletes the specified scaling plan. Deleting a scaling plan deletes the underlying ScalingInstruction for all of the scalable resources that are covered by the plan. If the plan has launched resources or has scaling activities in progress, you must delete those resources separately.

Required Parameters
{
  "ScalingPlanName": "The name of the scaling plan.",
  "ScalingPlanVersion": "The version number of the scaling plan."
}
"""
DeleteScalingPlan(args) = auto_scaling_plans("DeleteScalingPlan", args)

"""
    DescribeScalingPlanResources()

Describes the scalable resources in the specified scaling plan.

Required Parameters
{
  "ScalingPlanName": "The name of the scaling plan.",
  "ScalingPlanVersion": "The version number of the scaling plan."
}

Optional Parameters
{
  "MaxResults": "The maximum number of scalable resources to return. The value must be between 1 and 50. The default value is 50.",
  "NextToken": "The token for the next set of results."
}
"""
DescribeScalingPlanResources(args) = auto_scaling_plans("DescribeScalingPlanResources", args)

"""
    DescribeScalingPlans()

Describes one or more of your scaling plans.

Optional Parameters
{
  "MaxResults": "The maximum number of scalable resources to return. This value can be between 1 and 50. The default value is 50.",
  "ScalingPlanNames": "The names of the scaling plans (up to 10). If you specify application sources, you cannot specify scaling plan names.",
  "ScalingPlanVersion": "The version number of the scaling plan. If you specify a scaling plan version, you must also specify a scaling plan name.",
  "ApplicationSources": "The sources for the applications (up to 10). If you specify scaling plan names, you cannot specify application sources.",
  "NextToken": "The token for the next set of results."
}
"""
DescribeScalingPlans() = auto_scaling_plans("DescribeScalingPlans")
DescribeScalingPlans(args) = auto_scaling_plans("DescribeScalingPlans", args)

"""
    GetScalingPlanResourceForecastData()

Retrieves the forecast data for a scalable resource. Capacity forecasts are represented as predicted values, or data points, that are calculated using historical data points from a specified CloudWatch load metric. Data points are available for up to 56 days. 

Required Parameters
{
  "ScalingPlanName": "The name of the scaling plan.",
  "StartTime": "The inclusive start time of the time range for the forecast data to get. The date and time can be at most 56 days before the current date and time. ",
  "ScalingPlanVersion": "The version number of the scaling plan.",
  "EndTime": "The exclusive end time of the time range for the forecast data to get. The maximum time duration between the start and end time is seven days.  Although this parameter can accept a date and time that is more than two days in the future, the availability of forecast data has limits. AWS Auto Scaling only issues forecasts for periods of two days in advance.",
  "ResourceId": "The ID of the resource. This string consists of the resource type and unique identifier.    Auto Scaling group - The resource type is autoScalingGroup and the unique identifier is the name of the Auto Scaling group. Example: autoScalingGroup/my-asg.   ECS service - The resource type is service and the unique identifier is the cluster name and service name. Example: service/default/sample-webapp.   Spot Fleet request - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID. Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE.   DynamoDB table - The resource type is table and the unique identifier is the resource ID. Example: table/my-table.   DynamoDB global secondary index - The resource type is index and the unique identifier is the resource ID. Example: table/my-table/index/my-table-index.   Aurora DB cluster - The resource type is cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster.  ",
  "ForecastDataType": "The type of forecast data to get.    LoadForecast: The load metric forecast.     CapacityForecast: The capacity forecast.     ScheduledActionMinCapacity: The minimum capacity for each scheduled scaling action. This data is calculated as the larger of two values: the capacity forecast or the minimum capacity in the scaling instruction.    ScheduledActionMaxCapacity: The maximum capacity for each scheduled scaling action. The calculation used is determined by the predictive scaling maximum capacity behavior setting in the scaling instruction.  ",
  "ServiceNamespace": "The namespace of the AWS service.",
  "ScalableDimension": "The scalable dimension for the resource."
}
"""
GetScalingPlanResourceForecastData(args) = auto_scaling_plans("GetScalingPlanResourceForecastData", args)

"""
    UpdateScalingPlan()

Updates the specified scaling plan. You cannot update a scaling plan if it is in the process of being created, updated, or deleted.

Required Parameters
{
  "ScalingPlanName": "The name of the scaling plan.",
  "ScalingPlanVersion": "The version number of the scaling plan."
}

Optional Parameters
{
  "ApplicationSource": "A CloudFormation stack or set of tags.",
  "ScalingInstructions": "The scaling instructions."
}
"""
UpdateScalingPlan(args) = auto_scaling_plans("UpdateScalingPlan", args)
