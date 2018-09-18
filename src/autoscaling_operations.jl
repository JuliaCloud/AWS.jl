# generated from AutoScalingTypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

mutable struct DeleteNotificationConfigurationRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    topicARN::Union{Void,Array{String,1}}
    function DeleteNotificationConfigurationRequest(;autoScalingGroupName=nothing, topicARN=nothing)
        new(autoScalingGroupName, topicARN)
    end
    DeleteNotificationConfigurationRequest(pd) = parse_from_xml(DeleteNotificationConfigurationRequest, AutoScalingTypeDict, pd)
end # DeleteNotificationConfigurationRequest
export DeleteNotificationConfigurationRequest

function DeleteNotificationConfiguration(env::AWSEnv, msg::DeleteNotificationConfigurationRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteNotificationConfiguration", msg)
    resp
end
DeleteNotificationConfiguration(env::AWSEnv; kwargs...) = DeleteNotificationConfiguration(env, DeleteNotificationConfigurationRequest(; kwargs...))
export DeleteNotificationConfiguration

mutable struct DetachInstancesResult <: AbstractAWSType
    activities::Union{Void,Array{Activity,1}}
    function DetachInstancesResult(;activities=nothing)
        new(activities)
    end
    DetachInstancesResult(pd) = parse_from_xml(DetachInstancesResult, AutoScalingTypeDict, pd)
end # DetachInstancesResult
export DetachInstancesResult

mutable struct DetachInstancesRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceIds::Union{Void,Array{String,1}}
    shouldDecrementDesiredCapacity::Union{Void,Bool}
    function DetachInstancesRequest(;autoScalingGroupName=nothing, instanceIds=nothing, shouldDecrementDesiredCapacity=nothing)
        new(autoScalingGroupName, instanceIds, shouldDecrementDesiredCapacity)
    end
    DetachInstancesRequest(pd) = parse_from_xml(DetachInstancesRequest, AutoScalingTypeDict, pd)
end # DetachInstancesRequest
export DetachInstancesRequest

function DetachInstances(env::AWSEnv, msg::DetachInstancesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DetachInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachInstancesResult(resp.pd)
    end
    resp
end
DetachInstances(env::AWSEnv; kwargs...) = DetachInstances(env, DetachInstancesRequest(; kwargs...))
export DetachInstances

mutable struct DescribeMetricCollectionTypesResult <: AbstractAWSType
    granularities::Union{Void,Array{MetricGranularityType,1}}
    metrics::Union{Void,Array{MetricCollectionType,1}}
    function DescribeMetricCollectionTypesResult(;granularities=nothing, metrics=nothing)
        new(granularities, metrics)
    end
    DescribeMetricCollectionTypesResult(pd) = parse_from_xml(DescribeMetricCollectionTypesResult, AutoScalingTypeDict, pd)
end # DescribeMetricCollectionTypesResult
export DescribeMetricCollectionTypesResult

function DescribeMetricCollectionTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeMetricCollectionTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeMetricCollectionTypesResult(resp.pd)
    end
    resp
end
export DescribeMetricCollectionTypes

mutable struct SetInstanceHealthRequest <: AbstractAWSType
    healthStatus::Union{Void,String}
    instanceId::Union{Void,String}
    shouldRespectGracePeriod::Union{Void,Bool}
    function SetInstanceHealthRequest(;healthStatus=nothing, instanceId=nothing, shouldRespectGracePeriod=nothing)
        new(healthStatus, instanceId, shouldRespectGracePeriod)
    end
    SetInstanceHealthRequest(pd) = parse_from_xml(SetInstanceHealthRequest, AutoScalingTypeDict, pd)
end # SetInstanceHealthRequest
export SetInstanceHealthRequest

function SetInstanceHealth(env::AWSEnv, msg::SetInstanceHealthRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "SetInstanceHealth", msg)
    resp
end
SetInstanceHealth(env::AWSEnv; kwargs...) = SetInstanceHealth(env, SetInstanceHealthRequest(; kwargs...))
export SetInstanceHealth

mutable struct DeleteLaunchConfigurationRequest <: AbstractAWSType
    launchConfigurationName::Union{Void,String}
    function DeleteLaunchConfigurationRequest(;launchConfigurationName=nothing)
        new(launchConfigurationName)
    end
    DeleteLaunchConfigurationRequest(pd) = parse_from_xml(DeleteLaunchConfigurationRequest, AutoScalingTypeDict, pd)
end # DeleteLaunchConfigurationRequest
export DeleteLaunchConfigurationRequest

function DeleteLaunchConfiguration(env::AWSEnv, msg::DeleteLaunchConfigurationRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteLaunchConfiguration", msg)
    resp
end
DeleteLaunchConfiguration(env::AWSEnv; kwargs...) = DeleteLaunchConfiguration(env, DeleteLaunchConfigurationRequest(; kwargs...))
export DeleteLaunchConfiguration

mutable struct DescribeAutoScalingInstancesResult <: AbstractAWSType
    autoScalingInstances::Union{Void,Array{AutoScalingInstanceDetails,1}}
    nextToken::Union{Void,String}
    function DescribeAutoScalingInstancesResult(;autoScalingInstances=nothing, nextToken=nothing)
        new(autoScalingInstances, nextToken)
    end
    DescribeAutoScalingInstancesResult(pd) = parse_from_xml(DescribeAutoScalingInstancesResult, AutoScalingTypeDict, pd)
end # DescribeAutoScalingInstancesResult
export DescribeAutoScalingInstancesResult

mutable struct DescribeAutoScalingInstancesRequest <: AbstractAWSType
    instanceIds::Union{Void,Array{String,1}}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeAutoScalingInstancesRequest(;instanceIds=nothing, maxRecords=nothing, nextToken=nothing)
        new(instanceIds, maxRecords, nextToken)
    end
    DescribeAutoScalingInstancesRequest(pd) = parse_from_xml(DescribeAutoScalingInstancesRequest, AutoScalingTypeDict, pd)
end # DescribeAutoScalingInstancesRequest
export DescribeAutoScalingInstancesRequest

function DescribeAutoScalingInstances(env::AWSEnv, msg::DescribeAutoScalingInstancesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeAutoScalingInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAutoScalingInstancesResult(resp.pd)
    end
    resp
end
DescribeAutoScalingInstances(env::AWSEnv; kwargs...) = DescribeAutoScalingInstances(env, DescribeAutoScalingInstancesRequest(; kwargs...))
export DescribeAutoScalingInstances

mutable struct CreateLaunchConfigurationRequest <: AbstractAWSType
    associatePublicIpAddress::Union{Void,Bool}
    blockDeviceMappings::Union{Void,Array{BlockDeviceMapping,1}}
    classicLinkVPCId::Union{Void,String}
    classicLinkVPCSecurityGroups::Union{Void,Array{String,1}}
    ebsOptimized::Union{Void,Bool}
    iamInstanceProfile::Union{Void,String}
    imageId::Union{Void,String}
    instanceId::Union{Void,String}
    instanceMonitoring::Union{Void,InstanceMonitoring}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    placementTenancy::Union{Void,String}
    ramdiskId::Union{Void,String}
    securityGroups::Union{Void,Array{String,1}}
    spotPrice::Union{Void,String}
    userData::Union{Void,String}
    function CreateLaunchConfigurationRequest(;associatePublicIpAddress=nothing, blockDeviceMappings=nothing, classicLinkVPCId=nothing, classicLinkVPCSecurityGroups=nothing, ebsOptimized=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceId=nothing, instanceMonitoring=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, launchConfigurationName=nothing, placementTenancy=nothing, ramdiskId=nothing, securityGroups=nothing, spotPrice=nothing, userData=nothing)
        new(associatePublicIpAddress, blockDeviceMappings, classicLinkVPCId, classicLinkVPCSecurityGroups, ebsOptimized, iamInstanceProfile, imageId, instanceId, instanceMonitoring, instanceType, kernelId, keyName, launchConfigurationName, placementTenancy, ramdiskId, securityGroups, spotPrice, userData)
    end
    CreateLaunchConfigurationRequest(pd) = parse_from_xml(CreateLaunchConfigurationRequest, AutoScalingTypeDict, pd)
end # CreateLaunchConfigurationRequest
export CreateLaunchConfigurationRequest

function CreateLaunchConfiguration(env::AWSEnv, msg::CreateLaunchConfigurationRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "CreateLaunchConfiguration", msg)
    resp
end
CreateLaunchConfiguration(env::AWSEnv; kwargs...) = CreateLaunchConfiguration(env, CreateLaunchConfigurationRequest(; kwargs...))
export CreateLaunchConfiguration

mutable struct DescribeLifecycleHookTypesResult <: AbstractAWSType
    lifecycleHookTypes::Union{Void,Array{String,1}}
    function DescribeLifecycleHookTypesResult(;lifecycleHookTypes=nothing)
        new(lifecycleHookTypes)
    end
    DescribeLifecycleHookTypesResult(pd) = parse_from_xml(DescribeLifecycleHookTypesResult, AutoScalingTypeDict, pd)
end # DescribeLifecycleHookTypesResult
export DescribeLifecycleHookTypesResult

function DescribeLifecycleHookTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeLifecycleHookTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeLifecycleHookTypesResult(resp.pd)
    end
    resp
end
export DescribeLifecycleHookTypes

mutable struct PutNotificationConfigurationRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    notificationTypes::Union{Void,Array{String,1}}
    topicARN::Union{Void,String}
    function PutNotificationConfigurationRequest(;autoScalingGroupName=nothing, notificationTypes=nothing, topicARN=nothing)
        new(autoScalingGroupName, notificationTypes, topicARN)
    end
    PutNotificationConfigurationRequest(pd) = parse_from_xml(PutNotificationConfigurationRequest, AutoScalingTypeDict, pd)
end # PutNotificationConfigurationRequest
export PutNotificationConfigurationRequest

function PutNotificationConfiguration(env::AWSEnv, msg::PutNotificationConfigurationRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "PutNotificationConfiguration", msg)
    resp
end
PutNotificationConfiguration(env::AWSEnv; kwargs...) = PutNotificationConfiguration(env, PutNotificationConfigurationRequest(; kwargs...))
export PutNotificationConfiguration

mutable struct DeleteAutoScalingGroupRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    forceDelete::Union{Void,Bool}
    function DeleteAutoScalingGroupRequest(;autoScalingGroupName=nothing, forceDelete=nothing)
        new(autoScalingGroupName, forceDelete)
    end
    DeleteAutoScalingGroupRequest(pd) = parse_from_xml(DeleteAutoScalingGroupRequest, AutoScalingTypeDict, pd)
end # DeleteAutoScalingGroupRequest
export DeleteAutoScalingGroupRequest

function DeleteAutoScalingGroup(env::AWSEnv, msg::DeleteAutoScalingGroupRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteAutoScalingGroup", msg)
    resp
end
DeleteAutoScalingGroup(env::AWSEnv; kwargs...) = DeleteAutoScalingGroup(env, DeleteAutoScalingGroupRequest(; kwargs...))
export DeleteAutoScalingGroup

mutable struct SetDesiredCapacityRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    desiredCapacity::Union{Void,Int64}
    honorCooldown::Union{Void,Bool}
    function SetDesiredCapacityRequest(;autoScalingGroupName=nothing, desiredCapacity=nothing, honorCooldown=nothing)
        new(autoScalingGroupName, desiredCapacity, honorCooldown)
    end
    SetDesiredCapacityRequest(pd) = parse_from_xml(SetDesiredCapacityRequest, AutoScalingTypeDict, pd)
end # SetDesiredCapacityRequest
export SetDesiredCapacityRequest

function SetDesiredCapacity(env::AWSEnv, msg::SetDesiredCapacityRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "SetDesiredCapacity", msg)
    resp
end
SetDesiredCapacity(env::AWSEnv; kwargs...) = SetDesiredCapacity(env, SetDesiredCapacityRequest(; kwargs...))
export SetDesiredCapacity

mutable struct CreateOrUpdateTagsRequest <: AbstractAWSType
    tags::Union{Void,Array{Tag,1}}
    function CreateOrUpdateTagsRequest(;tags=nothing)
        new(tags)
    end
    CreateOrUpdateTagsRequest(pd) = parse_from_xml(CreateOrUpdateTagsRequest, AutoScalingTypeDict, pd)
end # CreateOrUpdateTagsRequest
export CreateOrUpdateTagsRequest

function CreateOrUpdateTags(env::AWSEnv, msg::CreateOrUpdateTagsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "CreateOrUpdateTags", msg)
    resp
end
CreateOrUpdateTags(env::AWSEnv; kwargs...) = CreateOrUpdateTags(env, CreateOrUpdateTagsRequest(; kwargs...))
export CreateOrUpdateTags

mutable struct DescribeLoadBalancerTargetGroupsResult <: AbstractAWSType
    loadBalancerTargetGroups::Union{Void,Array{LoadBalancerTargetGroupState,1}}
    nextToken::Union{Void,String}
    function DescribeLoadBalancerTargetGroupsResult(;loadBalancerTargetGroups=nothing, nextToken=nothing)
        new(loadBalancerTargetGroups, nextToken)
    end
    DescribeLoadBalancerTargetGroupsResult(pd) = parse_from_xml(DescribeLoadBalancerTargetGroupsResult, AutoScalingTypeDict, pd)
end # DescribeLoadBalancerTargetGroupsResult
export DescribeLoadBalancerTargetGroupsResult

mutable struct DescribeLoadBalancerTargetGroupsRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeLoadBalancerTargetGroupsRequest(;autoScalingGroupName=nothing, maxRecords=nothing, nextToken=nothing)
        new(autoScalingGroupName, maxRecords, nextToken)
    end
    DescribeLoadBalancerTargetGroupsRequest(pd) = parse_from_xml(DescribeLoadBalancerTargetGroupsRequest, AutoScalingTypeDict, pd)
end # DescribeLoadBalancerTargetGroupsRequest
export DescribeLoadBalancerTargetGroupsRequest

function DescribeLoadBalancerTargetGroups(env::AWSEnv, msg::DescribeLoadBalancerTargetGroupsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeLoadBalancerTargetGroups", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeLoadBalancerTargetGroupsResult(resp.pd)
    end
    resp
end
DescribeLoadBalancerTargetGroups(env::AWSEnv; kwargs...) = DescribeLoadBalancerTargetGroups(env, DescribeLoadBalancerTargetGroupsRequest(; kwargs...))
export DescribeLoadBalancerTargetGroups

mutable struct DescribeAutoScalingNotificationTypesResult <: AbstractAWSType
    autoScalingNotificationTypes::Union{Void,Array{String,1}}
    function DescribeAutoScalingNotificationTypesResult(;autoScalingNotificationTypes=nothing)
        new(autoScalingNotificationTypes)
    end
    DescribeAutoScalingNotificationTypesResult(pd) = parse_from_xml(DescribeAutoScalingNotificationTypesResult, AutoScalingTypeDict, pd)
end # DescribeAutoScalingNotificationTypesResult
export DescribeAutoScalingNotificationTypesResult

function DescribeAutoScalingNotificationTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeAutoScalingNotificationTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAutoScalingNotificationTypesResult(resp.pd)
    end
    resp
end
export DescribeAutoScalingNotificationTypes

mutable struct PutLifecycleHookRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    defaultResult::Union{Void,String}
    heartbeatTimeout::Union{Void,Int64}
    lifecycleHookName::Union{Void,String}
    lifecycleTransition::Union{Void,String}
    notificationMetadata::Union{Void,String}
    notificationTargetARN::Union{Void,String}
    roleARN::Union{Void,String}
    function PutLifecycleHookRequest(;autoScalingGroupName=nothing, defaultResult=nothing, heartbeatTimeout=nothing, lifecycleHookName=nothing, lifecycleTransition=nothing, notificationMetadata=nothing, notificationTargetARN=nothing, roleARN=nothing)
        new(autoScalingGroupName, defaultResult, heartbeatTimeout, lifecycleHookName, lifecycleTransition, notificationMetadata, notificationTargetARN, roleARN)
    end
    PutLifecycleHookRequest(pd) = parse_from_xml(PutLifecycleHookRequest, AutoScalingTypeDict, pd)
end # PutLifecycleHookRequest
export PutLifecycleHookRequest

function PutLifecycleHook(env::AWSEnv, msg::PutLifecycleHookRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "PutLifecycleHook", msg)
    resp
end
PutLifecycleHook(env::AWSEnv; kwargs...) = PutLifecycleHook(env, PutLifecycleHookRequest(; kwargs...))
export PutLifecycleHook

mutable struct DescribeTagsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    tags::Union{Void,Array{TagDescription,1}}
    function DescribeTagsResult(;nextToken=nothing, tags=nothing)
        new(nextToken, tags)
    end
    DescribeTagsResult(pd) = parse_from_xml(DescribeTagsResult, AutoScalingTypeDict, pd)
end # DescribeTagsResult
export DescribeTagsResult

mutable struct DescribeTagsRequest <: AbstractAWSType
    filters::Union{Void,Array{Filter,1}}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeTagsRequest(;filters=nothing, maxRecords=nothing, nextToken=nothing)
        new(filters, maxRecords, nextToken)
    end
    DescribeTagsRequest(pd) = parse_from_xml(DescribeTagsRequest, AutoScalingTypeDict, pd)
end # DescribeTagsRequest
export DescribeTagsRequest

function DescribeTags(env::AWSEnv, msg::DescribeTagsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeTags", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeTagsResult(resp.pd)
    end
    resp
end
DescribeTags(env::AWSEnv; kwargs...) = DescribeTags(env, DescribeTagsRequest(; kwargs...))
export DescribeTags

mutable struct DetachLoadBalancersRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    loadBalancerNames::Union{Void,Array{String,1}}
    function DetachLoadBalancersRequest(;autoScalingGroupName=nothing, loadBalancerNames=nothing)
        new(autoScalingGroupName, loadBalancerNames)
    end
    DetachLoadBalancersRequest(pd) = parse_from_xml(DetachLoadBalancersRequest, AutoScalingTypeDict, pd)
end # DetachLoadBalancersRequest
export DetachLoadBalancersRequest

function DetachLoadBalancers(env::AWSEnv, msg::DetachLoadBalancersRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DetachLoadBalancers", msg)
    resp
end
DetachLoadBalancers(env::AWSEnv; kwargs...) = DetachLoadBalancers(env, DetachLoadBalancersRequest(; kwargs...))
export DetachLoadBalancers

mutable struct DescribeLifecycleHooksResult <: AbstractAWSType
    lifecycleHooks::Union{Void,Array{LifecycleHook,1}}
    function DescribeLifecycleHooksResult(;lifecycleHooks=nothing)
        new(lifecycleHooks)
    end
    DescribeLifecycleHooksResult(pd) = parse_from_xml(DescribeLifecycleHooksResult, AutoScalingTypeDict, pd)
end # DescribeLifecycleHooksResult
export DescribeLifecycleHooksResult

mutable struct DescribeLifecycleHooksRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    lifecycleHookNames::Union{Void,Array{String,1}}
    function DescribeLifecycleHooksRequest(;autoScalingGroupName=nothing, lifecycleHookNames=nothing)
        new(autoScalingGroupName, lifecycleHookNames)
    end
    DescribeLifecycleHooksRequest(pd) = parse_from_xml(DescribeLifecycleHooksRequest, AutoScalingTypeDict, pd)
end # DescribeLifecycleHooksRequest
export DescribeLifecycleHooksRequest

function DescribeLifecycleHooks(env::AWSEnv, msg::DescribeLifecycleHooksRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeLifecycleHooks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeLifecycleHooksResult(resp.pd)
    end
    resp
end
DescribeLifecycleHooks(env::AWSEnv; kwargs...) = DescribeLifecycleHooks(env, DescribeLifecycleHooksRequest(; kwargs...))
export DescribeLifecycleHooks

mutable struct DeleteScheduledActionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    scheduledActionName::Union{Void,String}
    function DeleteScheduledActionRequest(;autoScalingGroupName=nothing, scheduledActionName=nothing)
        new(autoScalingGroupName, scheduledActionName)
    end
    DeleteScheduledActionRequest(pd) = parse_from_xml(DeleteScheduledActionRequest, AutoScalingTypeDict, pd)
end # DeleteScheduledActionRequest
export DeleteScheduledActionRequest

function DeleteScheduledAction(env::AWSEnv, msg::DeleteScheduledActionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteScheduledAction", msg)
    resp
end
DeleteScheduledAction(env::AWSEnv; kwargs...) = DeleteScheduledAction(env, DeleteScheduledActionRequest(; kwargs...))
export DeleteScheduledAction

mutable struct SuspendProcessesRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    scalingProcesses::Union{Void,Array{String,1}}
    function SuspendProcessesRequest(;autoScalingGroupName=nothing, scalingProcesses=nothing)
        new(autoScalingGroupName, scalingProcesses)
    end
    SuspendProcessesRequest(pd) = parse_from_xml(SuspendProcessesRequest, AutoScalingTypeDict, pd)
end # SuspendProcessesRequest
export SuspendProcessesRequest

function SuspendProcesses(env::AWSEnv, msg::SuspendProcessesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "SuspendProcesses", msg)
    resp
end
SuspendProcesses(env::AWSEnv; kwargs...) = SuspendProcesses(env, SuspendProcessesRequest(; kwargs...))
export SuspendProcesses

mutable struct ResumeProcessesRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    scalingProcesses::Union{Void,Array{String,1}}
    function ResumeProcessesRequest(;autoScalingGroupName=nothing, scalingProcesses=nothing)
        new(autoScalingGroupName, scalingProcesses)
    end
    ResumeProcessesRequest(pd) = parse_from_xml(ResumeProcessesRequest, AutoScalingTypeDict, pd)
end # ResumeProcessesRequest
export ResumeProcessesRequest

function ResumeProcesses(env::AWSEnv, msg::ResumeProcessesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "ResumeProcesses", msg)
    resp
end
ResumeProcesses(env::AWSEnv; kwargs...) = ResumeProcesses(env, ResumeProcessesRequest(; kwargs...))
export ResumeProcesses

mutable struct DisableMetricsCollectionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    metrics::Union{Void,Array{String,1}}
    function DisableMetricsCollectionRequest(;autoScalingGroupName=nothing, metrics=nothing)
        new(autoScalingGroupName, metrics)
    end
    DisableMetricsCollectionRequest(pd) = parse_from_xml(DisableMetricsCollectionRequest, AutoScalingTypeDict, pd)
end # DisableMetricsCollectionRequest
export DisableMetricsCollectionRequest

function DisableMetricsCollection(env::AWSEnv, msg::DisableMetricsCollectionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DisableMetricsCollection", msg)
    resp
end
DisableMetricsCollection(env::AWSEnv; kwargs...) = DisableMetricsCollection(env, DisableMetricsCollectionRequest(; kwargs...))
export DisableMetricsCollection

mutable struct DescribeLoadBalancersResult <: AbstractAWSType
    loadBalancers::Union{Void,Array{LoadBalancerState,1}}
    nextToken::Union{Void,String}
    function DescribeLoadBalancersResult(;loadBalancers=nothing, nextToken=nothing)
        new(loadBalancers, nextToken)
    end
    DescribeLoadBalancersResult(pd) = parse_from_xml(DescribeLoadBalancersResult, AutoScalingTypeDict, pd)
end # DescribeLoadBalancersResult
export DescribeLoadBalancersResult

mutable struct DescribeLoadBalancersRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeLoadBalancersRequest(;autoScalingGroupName=nothing, maxRecords=nothing, nextToken=nothing)
        new(autoScalingGroupName, maxRecords, nextToken)
    end
    DescribeLoadBalancersRequest(pd) = parse_from_xml(DescribeLoadBalancersRequest, AutoScalingTypeDict, pd)
end # DescribeLoadBalancersRequest
export DescribeLoadBalancersRequest

function DescribeLoadBalancers(env::AWSEnv, msg::DescribeLoadBalancersRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeLoadBalancers", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeLoadBalancersResult(resp.pd)
    end
    resp
end
DescribeLoadBalancers(env::AWSEnv; kwargs...) = DescribeLoadBalancers(env, DescribeLoadBalancersRequest(; kwargs...))
export DescribeLoadBalancers

mutable struct PutScheduledUpdateGroupActionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    desiredCapacity::Union{Void,Int64}
    endTime::Union{Void,DateTime}
    maxSize::Union{Void,Int64}
    minSize::Union{Void,Int64}
    recurrence::Union{Void,String}
    scheduledActionName::Union{Void,String}
    startTime::Union{Void,DateTime}
    time::Union{Void,DateTime}
    function PutScheduledUpdateGroupActionRequest(;autoScalingGroupName=nothing, desiredCapacity=nothing, endTime=nothing, maxSize=nothing, minSize=nothing, recurrence=nothing, scheduledActionName=nothing, startTime=nothing, time=nothing)
        new(autoScalingGroupName, desiredCapacity, endTime, maxSize, minSize, recurrence, scheduledActionName, startTime, time)
    end
    PutScheduledUpdateGroupActionRequest(pd) = parse_from_xml(PutScheduledUpdateGroupActionRequest, AutoScalingTypeDict, pd)
end # PutScheduledUpdateGroupActionRequest
export PutScheduledUpdateGroupActionRequest

function PutScheduledUpdateGroupAction(env::AWSEnv, msg::PutScheduledUpdateGroupActionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "PutScheduledUpdateGroupAction", msg)
    resp
end
PutScheduledUpdateGroupAction(env::AWSEnv; kwargs...) = PutScheduledUpdateGroupAction(env, PutScheduledUpdateGroupActionRequest(; kwargs...))
export PutScheduledUpdateGroupAction

mutable struct AttachLoadBalancersRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    loadBalancerNames::Union{Void,Array{String,1}}
    function AttachLoadBalancersRequest(;autoScalingGroupName=nothing, loadBalancerNames=nothing)
        new(autoScalingGroupName, loadBalancerNames)
    end
    AttachLoadBalancersRequest(pd) = parse_from_xml(AttachLoadBalancersRequest, AutoScalingTypeDict, pd)
end # AttachLoadBalancersRequest
export AttachLoadBalancersRequest

function AttachLoadBalancers(env::AWSEnv, msg::AttachLoadBalancersRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "AttachLoadBalancers", msg)
    resp
end
AttachLoadBalancers(env::AWSEnv; kwargs...) = AttachLoadBalancers(env, AttachLoadBalancersRequest(; kwargs...))
export AttachLoadBalancers

mutable struct AttachInstancesRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceIds::Union{Void,Array{String,1}}
    function AttachInstancesRequest(;autoScalingGroupName=nothing, instanceIds=nothing)
        new(autoScalingGroupName, instanceIds)
    end
    AttachInstancesRequest(pd) = parse_from_xml(AttachInstancesRequest, AutoScalingTypeDict, pd)
end # AttachInstancesRequest
export AttachInstancesRequest

function AttachInstances(env::AWSEnv, msg::AttachInstancesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "AttachInstances", msg)
    resp
end
AttachInstances(env::AWSEnv; kwargs...) = AttachInstances(env, AttachInstancesRequest(; kwargs...))
export AttachInstances

mutable struct DescribeScheduledActionsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    scheduledUpdateGroupActions::Union{Void,Array{ScheduledUpdateGroupAction,1}}
    function DescribeScheduledActionsResult(;nextToken=nothing, scheduledUpdateGroupActions=nothing)
        new(nextToken, scheduledUpdateGroupActions)
    end
    DescribeScheduledActionsResult(pd) = parse_from_xml(DescribeScheduledActionsResult, AutoScalingTypeDict, pd)
end # DescribeScheduledActionsResult
export DescribeScheduledActionsResult

mutable struct DescribeScheduledActionsRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    endTime::Union{Void,DateTime}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    scheduledActionNames::Union{Void,Array{String,1}}
    startTime::Union{Void,DateTime}
    function DescribeScheduledActionsRequest(;autoScalingGroupName=nothing, endTime=nothing, maxRecords=nothing, nextToken=nothing, scheduledActionNames=nothing, startTime=nothing)
        new(autoScalingGroupName, endTime, maxRecords, nextToken, scheduledActionNames, startTime)
    end
    DescribeScheduledActionsRequest(pd) = parse_from_xml(DescribeScheduledActionsRequest, AutoScalingTypeDict, pd)
end # DescribeScheduledActionsRequest
export DescribeScheduledActionsRequest

function DescribeScheduledActions(env::AWSEnv, msg::DescribeScheduledActionsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeScheduledActions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeScheduledActionsResult(resp.pd)
    end
    resp
end
DescribeScheduledActions(env::AWSEnv; kwargs...) = DescribeScheduledActions(env, DescribeScheduledActionsRequest(; kwargs...))
export DescribeScheduledActions

mutable struct EnterStandbyResult <: AbstractAWSType
    activities::Union{Void,Array{Activity,1}}
    function EnterStandbyResult(;activities=nothing)
        new(activities)
    end
    EnterStandbyResult(pd) = parse_from_xml(EnterStandbyResult, AutoScalingTypeDict, pd)
end # EnterStandbyResult
export EnterStandbyResult

mutable struct EnterStandbyRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceIds::Union{Void,Array{String,1}}
    shouldDecrementDesiredCapacity::Union{Void,Bool}
    function EnterStandbyRequest(;autoScalingGroupName=nothing, instanceIds=nothing, shouldDecrementDesiredCapacity=nothing)
        new(autoScalingGroupName, instanceIds, shouldDecrementDesiredCapacity)
    end
    EnterStandbyRequest(pd) = parse_from_xml(EnterStandbyRequest, AutoScalingTypeDict, pd)
end # EnterStandbyRequest
export EnterStandbyRequest

function EnterStandby(env::AWSEnv, msg::EnterStandbyRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "EnterStandby", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = EnterStandbyResult(resp.pd)
    end
    resp
end
EnterStandby(env::AWSEnv; kwargs...) = EnterStandby(env, EnterStandbyRequest(; kwargs...))
export EnterStandby

mutable struct DescribeAccountLimitsResult <: AbstractAWSType
    maxNumberOfAutoScalingGroups::Union{Void,Int64}
    maxNumberOfLaunchConfigurations::Union{Void,Int64}
    numberOfAutoScalingGroups::Union{Void,Int64}
    numberOfLaunchConfigurations::Union{Void,Int64}
    function DescribeAccountLimitsResult(;maxNumberOfAutoScalingGroups=nothing, maxNumberOfLaunchConfigurations=nothing, numberOfAutoScalingGroups=nothing, numberOfLaunchConfigurations=nothing)
        new(maxNumberOfAutoScalingGroups, maxNumberOfLaunchConfigurations, numberOfAutoScalingGroups, numberOfLaunchConfigurations)
    end
    DescribeAccountLimitsResult(pd) = parse_from_xml(DescribeAccountLimitsResult, AutoScalingTypeDict, pd)
end # DescribeAccountLimitsResult
export DescribeAccountLimitsResult

function DescribeAccountLimits(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeAccountLimits")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAccountLimitsResult(resp.pd)
    end
    resp
end
export DescribeAccountLimits

mutable struct CompleteLifecycleActionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceId::Union{Void,String}
    lifecycleActionResult::Union{Void,String}
    lifecycleActionToken::Union{Void,String}
    lifecycleHookName::Union{Void,String}
    function CompleteLifecycleActionRequest(;autoScalingGroupName=nothing, instanceId=nothing, lifecycleActionResult=nothing, lifecycleActionToken=nothing, lifecycleHookName=nothing)
        new(autoScalingGroupName, instanceId, lifecycleActionResult, lifecycleActionToken, lifecycleHookName)
    end
    CompleteLifecycleActionRequest(pd) = parse_from_xml(CompleteLifecycleActionRequest, AutoScalingTypeDict, pd)
end # CompleteLifecycleActionRequest
export CompleteLifecycleActionRequest

function CompleteLifecycleAction(env::AWSEnv, msg::CompleteLifecycleActionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "CompleteLifecycleAction", msg)
    resp
end
CompleteLifecycleAction(env::AWSEnv; kwargs...) = CompleteLifecycleAction(env, CompleteLifecycleActionRequest(; kwargs...))
export CompleteLifecycleAction

mutable struct ExecutePolicyRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    breachThreshold::Union{Void,Float64}
    honorCooldown::Union{Void,Bool}
    metricValue::Union{Void,Float64}
    policyName::Union{Void,String}
    function ExecutePolicyRequest(;autoScalingGroupName=nothing, breachThreshold=nothing, honorCooldown=nothing, metricValue=nothing, policyName=nothing)
        new(autoScalingGroupName, breachThreshold, honorCooldown, metricValue, policyName)
    end
    ExecutePolicyRequest(pd) = parse_from_xml(ExecutePolicyRequest, AutoScalingTypeDict, pd)
end # ExecutePolicyRequest
export ExecutePolicyRequest

function ExecutePolicy(env::AWSEnv, msg::ExecutePolicyRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "ExecutePolicy", msg)
    resp
end
ExecutePolicy(env::AWSEnv; kwargs...) = ExecutePolicy(env, ExecutePolicyRequest(; kwargs...))
export ExecutePolicy

mutable struct DescribeLaunchConfigurationsResult <: AbstractAWSType
    launchConfigurations::Union{Void,Array{LaunchConfiguration,1}}
    nextToken::Union{Void,String}
    function DescribeLaunchConfigurationsResult(;launchConfigurations=nothing, nextToken=nothing)
        new(launchConfigurations, nextToken)
    end
    DescribeLaunchConfigurationsResult(pd) = parse_from_xml(DescribeLaunchConfigurationsResult, AutoScalingTypeDict, pd)
end # DescribeLaunchConfigurationsResult
export DescribeLaunchConfigurationsResult

mutable struct DescribeLaunchConfigurationsRequest <: AbstractAWSType
    launchConfigurationNames::Union{Void,Array{String,1}}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeLaunchConfigurationsRequest(;launchConfigurationNames=nothing, maxRecords=nothing, nextToken=nothing)
        new(launchConfigurationNames, maxRecords, nextToken)
    end
    DescribeLaunchConfigurationsRequest(pd) = parse_from_xml(DescribeLaunchConfigurationsRequest, AutoScalingTypeDict, pd)
end # DescribeLaunchConfigurationsRequest
export DescribeLaunchConfigurationsRequest

function DescribeLaunchConfigurations(env::AWSEnv, msg::DescribeLaunchConfigurationsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeLaunchConfigurations", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeLaunchConfigurationsResult(resp.pd)
    end
    resp
end
DescribeLaunchConfigurations(env::AWSEnv; kwargs...) = DescribeLaunchConfigurations(env, DescribeLaunchConfigurationsRequest(; kwargs...))
export DescribeLaunchConfigurations

mutable struct UpdateAutoScalingGroupRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    availabilityZones::Union{Void,Array{String,1}}
    defaultCooldown::Union{Void,Int64}
    desiredCapacity::Union{Void,Int64}
    healthCheckGracePeriod::Union{Void,Int64}
    healthCheckType::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    maxSize::Union{Void,Int64}
    minSize::Union{Void,Int64}
    newInstancesProtectedFromScaleIn::Union{Void,Bool}
    placementGroup::Union{Void,String}
    terminationPolicies::Union{Void,Array{String,1}}
    vPCZoneIdentifier::Union{Void,String}
    function UpdateAutoScalingGroupRequest(;autoScalingGroupName=nothing, availabilityZones=nothing, defaultCooldown=nothing, desiredCapacity=nothing, healthCheckGracePeriod=nothing, healthCheckType=nothing, launchConfigurationName=nothing, maxSize=nothing, minSize=nothing, newInstancesProtectedFromScaleIn=nothing, placementGroup=nothing, terminationPolicies=nothing, vPCZoneIdentifier=nothing)
        new(autoScalingGroupName, availabilityZones, defaultCooldown, desiredCapacity, healthCheckGracePeriod, healthCheckType, launchConfigurationName, maxSize, minSize, newInstancesProtectedFromScaleIn, placementGroup, terminationPolicies, vPCZoneIdentifier)
    end
    UpdateAutoScalingGroupRequest(pd) = parse_from_xml(UpdateAutoScalingGroupRequest, AutoScalingTypeDict, pd)
end # UpdateAutoScalingGroupRequest
export UpdateAutoScalingGroupRequest

function UpdateAutoScalingGroup(env::AWSEnv, msg::UpdateAutoScalingGroupRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "UpdateAutoScalingGroup", msg)
    resp
end
UpdateAutoScalingGroup(env::AWSEnv; kwargs...) = UpdateAutoScalingGroup(env, UpdateAutoScalingGroupRequest(; kwargs...))
export UpdateAutoScalingGroup

mutable struct DescribeTerminationPolicyTypesResult <: AbstractAWSType
    terminationPolicyTypes::Union{Void,Array{String,1}}
    function DescribeTerminationPolicyTypesResult(;terminationPolicyTypes=nothing)
        new(terminationPolicyTypes)
    end
    DescribeTerminationPolicyTypesResult(pd) = parse_from_xml(DescribeTerminationPolicyTypesResult, AutoScalingTypeDict, pd)
end # DescribeTerminationPolicyTypesResult
export DescribeTerminationPolicyTypesResult

function DescribeTerminationPolicyTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeTerminationPolicyTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeTerminationPolicyTypesResult(resp.pd)
    end
    resp
end
export DescribeTerminationPolicyTypes

mutable struct DescribeAutoScalingGroupsResult <: AbstractAWSType
    autoScalingGroups::Union{Void,Array{AutoScalingGroup,1}}
    nextToken::Union{Void,String}
    function DescribeAutoScalingGroupsResult(;autoScalingGroups=nothing, nextToken=nothing)
        new(autoScalingGroups, nextToken)
    end
    DescribeAutoScalingGroupsResult(pd) = parse_from_xml(DescribeAutoScalingGroupsResult, AutoScalingTypeDict, pd)
end # DescribeAutoScalingGroupsResult
export DescribeAutoScalingGroupsResult

mutable struct DescribeAutoScalingGroupsRequest <: AbstractAWSType
    autoScalingGroupNames::Union{Void,Array{String,1}}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeAutoScalingGroupsRequest(;autoScalingGroupNames=nothing, maxRecords=nothing, nextToken=nothing)
        new(autoScalingGroupNames, maxRecords, nextToken)
    end
    DescribeAutoScalingGroupsRequest(pd) = parse_from_xml(DescribeAutoScalingGroupsRequest, AutoScalingTypeDict, pd)
end # DescribeAutoScalingGroupsRequest
export DescribeAutoScalingGroupsRequest

function DescribeAutoScalingGroups(env::AWSEnv, msg::DescribeAutoScalingGroupsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeAutoScalingGroups", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAutoScalingGroupsResult(resp.pd)
    end
    resp
end
DescribeAutoScalingGroups(env::AWSEnv; kwargs...) = DescribeAutoScalingGroups(env, DescribeAutoScalingGroupsRequest(; kwargs...))
export DescribeAutoScalingGroups

mutable struct SetInstanceProtectionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceIds::Union{Void,Array{String,1}}
    protectedFromScaleIn::Union{Void,Bool}
    function SetInstanceProtectionRequest(;autoScalingGroupName=nothing, instanceIds=nothing, protectedFromScaleIn=nothing)
        new(autoScalingGroupName, instanceIds, protectedFromScaleIn)
    end
    SetInstanceProtectionRequest(pd) = parse_from_xml(SetInstanceProtectionRequest, AutoScalingTypeDict, pd)
end # SetInstanceProtectionRequest
export SetInstanceProtectionRequest

function SetInstanceProtection(env::AWSEnv, msg::SetInstanceProtectionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "SetInstanceProtection", msg)
    resp
end
SetInstanceProtection(env::AWSEnv; kwargs...) = SetInstanceProtection(env, SetInstanceProtectionRequest(; kwargs...))
export SetInstanceProtection

mutable struct DescribePoliciesResult <: AbstractAWSType
    nextToken::Union{Void,String}
    scalingPolicies::Union{Void,Array{ScalingPolicy,1}}
    function DescribePoliciesResult(;nextToken=nothing, scalingPolicies=nothing)
        new(nextToken, scalingPolicies)
    end
    DescribePoliciesResult(pd) = parse_from_xml(DescribePoliciesResult, AutoScalingTypeDict, pd)
end # DescribePoliciesResult
export DescribePoliciesResult

mutable struct DescribePoliciesRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    policyNames::Union{Void,Array{String,1}}
    policyTypes::Union{Void,Array{String,1}}
    function DescribePoliciesRequest(;autoScalingGroupName=nothing, maxRecords=nothing, nextToken=nothing, policyNames=nothing, policyTypes=nothing)
        new(autoScalingGroupName, maxRecords, nextToken, policyNames, policyTypes)
    end
    DescribePoliciesRequest(pd) = parse_from_xml(DescribePoliciesRequest, AutoScalingTypeDict, pd)
end # DescribePoliciesRequest
export DescribePoliciesRequest

function DescribePolicies(env::AWSEnv, msg::DescribePoliciesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribePolicies", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribePoliciesResult(resp.pd)
    end
    resp
end
DescribePolicies(env::AWSEnv; kwargs...) = DescribePolicies(env, DescribePoliciesRequest(; kwargs...))
export DescribePolicies

mutable struct EnableMetricsCollectionRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    granularity::Union{Void,String}
    metrics::Union{Void,Array{String,1}}
    function EnableMetricsCollectionRequest(;autoScalingGroupName=nothing, granularity=nothing, metrics=nothing)
        new(autoScalingGroupName, granularity, metrics)
    end
    EnableMetricsCollectionRequest(pd) = parse_from_xml(EnableMetricsCollectionRequest, AutoScalingTypeDict, pd)
end # EnableMetricsCollectionRequest
export EnableMetricsCollectionRequest

function EnableMetricsCollection(env::AWSEnv, msg::EnableMetricsCollectionRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "EnableMetricsCollection", msg)
    resp
end
EnableMetricsCollection(env::AWSEnv; kwargs...) = EnableMetricsCollection(env, EnableMetricsCollectionRequest(; kwargs...))
export EnableMetricsCollection

mutable struct ExitStandbyResult <: AbstractAWSType
    activities::Union{Void,Array{Activity,1}}
    function ExitStandbyResult(;activities=nothing)
        new(activities)
    end
    ExitStandbyResult(pd) = parse_from_xml(ExitStandbyResult, AutoScalingTypeDict, pd)
end # ExitStandbyResult
export ExitStandbyResult

mutable struct ExitStandbyRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceIds::Union{Void,Array{String,1}}
    function ExitStandbyRequest(;autoScalingGroupName=nothing, instanceIds=nothing)
        new(autoScalingGroupName, instanceIds)
    end
    ExitStandbyRequest(pd) = parse_from_xml(ExitStandbyRequest, AutoScalingTypeDict, pd)
end # ExitStandbyRequest
export ExitStandbyRequest

function ExitStandby(env::AWSEnv, msg::ExitStandbyRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "ExitStandby", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ExitStandbyResult(resp.pd)
    end
    resp
end
ExitStandby(env::AWSEnv; kwargs...) = ExitStandby(env, ExitStandbyRequest(; kwargs...))
export ExitStandby

mutable struct DescribeNotificationConfigurationsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    notificationConfigurations::Union{Void,Array{NotificationConfiguration,1}}
    function DescribeNotificationConfigurationsResult(;nextToken=nothing, notificationConfigurations=nothing)
        new(nextToken, notificationConfigurations)
    end
    DescribeNotificationConfigurationsResult(pd) = parse_from_xml(DescribeNotificationConfigurationsResult, AutoScalingTypeDict, pd)
end # DescribeNotificationConfigurationsResult
export DescribeNotificationConfigurationsResult

mutable struct DescribeNotificationConfigurationsRequest <: AbstractAWSType
    autoScalingGroupNames::Union{Void,Array{String,1}}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeNotificationConfigurationsRequest(;autoScalingGroupNames=nothing, maxRecords=nothing, nextToken=nothing)
        new(autoScalingGroupNames, maxRecords, nextToken)
    end
    DescribeNotificationConfigurationsRequest(pd) = parse_from_xml(DescribeNotificationConfigurationsRequest, AutoScalingTypeDict, pd)
end # DescribeNotificationConfigurationsRequest
export DescribeNotificationConfigurationsRequest

function DescribeNotificationConfigurations(env::AWSEnv, msg::DescribeNotificationConfigurationsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeNotificationConfigurations", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNotificationConfigurationsResult(resp.pd)
    end
    resp
end
DescribeNotificationConfigurations(env::AWSEnv; kwargs...) = DescribeNotificationConfigurations(env, DescribeNotificationConfigurationsRequest(; kwargs...))
export DescribeNotificationConfigurations

mutable struct CreateAutoScalingGroupRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    availabilityZones::Union{Void,Array{String,1}}
    defaultCooldown::Union{Void,Int64}
    desiredCapacity::Union{Void,Int64}
    healthCheckGracePeriod::Union{Void,Int64}
    healthCheckType::Union{Void,String}
    instanceId::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    loadBalancerNames::Union{Void,Array{String,1}}
    maxSize::Union{Void,Int64}
    minSize::Union{Void,Int64}
    newInstancesProtectedFromScaleIn::Union{Void,Bool}
    placementGroup::Union{Void,String}
    tags::Union{Void,Array{Tag,1}}
    targetGroupARNs::Union{Void,Array{String,1}}
    terminationPolicies::Union{Void,Array{String,1}}
    vPCZoneIdentifier::Union{Void,String}
    function CreateAutoScalingGroupRequest(;autoScalingGroupName=nothing, availabilityZones=nothing, defaultCooldown=nothing, desiredCapacity=nothing, healthCheckGracePeriod=nothing, healthCheckType=nothing, instanceId=nothing, launchConfigurationName=nothing, loadBalancerNames=nothing, maxSize=nothing, minSize=nothing, newInstancesProtectedFromScaleIn=nothing, placementGroup=nothing, tags=nothing, targetGroupARNs=nothing, terminationPolicies=nothing, vPCZoneIdentifier=nothing)
        new(autoScalingGroupName, availabilityZones, defaultCooldown, desiredCapacity, healthCheckGracePeriod, healthCheckType, instanceId, launchConfigurationName, loadBalancerNames, maxSize, minSize, newInstancesProtectedFromScaleIn, placementGroup, tags, targetGroupARNs, terminationPolicies, vPCZoneIdentifier)
    end
    CreateAutoScalingGroupRequest(pd) = parse_from_xml(CreateAutoScalingGroupRequest, AutoScalingTypeDict, pd)
end # CreateAutoScalingGroupRequest
export CreateAutoScalingGroupRequest

function CreateAutoScalingGroup(env::AWSEnv, msg::CreateAutoScalingGroupRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "CreateAutoScalingGroup", msg)
    resp
end
CreateAutoScalingGroup(env::AWSEnv; kwargs...) = CreateAutoScalingGroup(env, CreateAutoScalingGroupRequest(; kwargs...))
export CreateAutoScalingGroup

mutable struct DescribeScalingProcessTypesResult <: AbstractAWSType
    processes::Union{Void,Array{ProcessType,1}}
    function DescribeScalingProcessTypesResult(;processes=nothing)
        new(processes)
    end
    DescribeScalingProcessTypesResult(pd) = parse_from_xml(DescribeScalingProcessTypesResult, AutoScalingTypeDict, pd)
end # DescribeScalingProcessTypesResult
export DescribeScalingProcessTypesResult

function DescribeScalingProcessTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeScalingProcessTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeScalingProcessTypesResult(resp.pd)
    end
    resp
end
export DescribeScalingProcessTypes

mutable struct DetachLoadBalancerTargetGroupsRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    targetGroupARNs::Union{Void,Array{String,1}}
    function DetachLoadBalancerTargetGroupsRequest(;autoScalingGroupName=nothing, targetGroupARNs=nothing)
        new(autoScalingGroupName, targetGroupARNs)
    end
    DetachLoadBalancerTargetGroupsRequest(pd) = parse_from_xml(DetachLoadBalancerTargetGroupsRequest, AutoScalingTypeDict, pd)
end # DetachLoadBalancerTargetGroupsRequest
export DetachLoadBalancerTargetGroupsRequest

function DetachLoadBalancerTargetGroups(env::AWSEnv, msg::DetachLoadBalancerTargetGroupsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DetachLoadBalancerTargetGroups", msg)
    resp
end
DetachLoadBalancerTargetGroups(env::AWSEnv; kwargs...) = DetachLoadBalancerTargetGroups(env, DetachLoadBalancerTargetGroupsRequest(; kwargs...))
export DetachLoadBalancerTargetGroups

mutable struct PutScalingPolicyResult <: AbstractAWSType
    alarms::Union{Void,Array{Alarm,1}}
    policyARN::Union{Void,String}
    function PutScalingPolicyResult(;alarms=nothing, policyARN=nothing)
        new(alarms, policyARN)
    end
    PutScalingPolicyResult(pd) = parse_from_xml(PutScalingPolicyResult, AutoScalingTypeDict, pd)
end # PutScalingPolicyResult
export PutScalingPolicyResult

mutable struct PutScalingPolicyRequest <: AbstractAWSType
    adjustmentType::Union{Void,String}
    autoScalingGroupName::Union{Void,String}
    cooldown::Union{Void,Int64}
    estimatedInstanceWarmup::Union{Void,Int64}
    metricAggregationType::Union{Void,String}
    minAdjustmentMagnitude::Union{Void,Int64}
    minAdjustmentStep::Union{Void,Int64}
    policyName::Union{Void,String}
    policyType::Union{Void,String}
    scalingAdjustment::Union{Void,Int64}
    stepAdjustments::Union{Void,Array{StepAdjustment,1}}
    targetTrackingConfiguration::Union{Void,TargetTrackingConfiguration}
    function PutScalingPolicyRequest(;adjustmentType=nothing, autoScalingGroupName=nothing, cooldown=nothing, estimatedInstanceWarmup=nothing, metricAggregationType=nothing, minAdjustmentMagnitude=nothing, minAdjustmentStep=nothing, policyName=nothing, policyType=nothing, scalingAdjustment=nothing, stepAdjustments=nothing, targetTrackingConfiguration=nothing)
        new(adjustmentType, autoScalingGroupName, cooldown, estimatedInstanceWarmup, metricAggregationType, minAdjustmentMagnitude, minAdjustmentStep, policyName, policyType, scalingAdjustment, stepAdjustments, targetTrackingConfiguration)
    end
    PutScalingPolicyRequest(pd) = parse_from_xml(PutScalingPolicyRequest, AutoScalingTypeDict, pd)
end # PutScalingPolicyRequest
export PutScalingPolicyRequest

function PutScalingPolicy(env::AWSEnv, msg::PutScalingPolicyRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "PutScalingPolicy", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = PutScalingPolicyResult(resp.pd)
    end
    resp
end
PutScalingPolicy(env::AWSEnv; kwargs...) = PutScalingPolicy(env, PutScalingPolicyRequest(; kwargs...))
export PutScalingPolicy

mutable struct DescribeScalingActivitiesResult <: AbstractAWSType
    activities::Union{Void,Array{Activity,1}}
    nextToken::Union{Void,String}
    function DescribeScalingActivitiesResult(;activities=nothing, nextToken=nothing)
        new(activities, nextToken)
    end
    DescribeScalingActivitiesResult(pd) = parse_from_xml(DescribeScalingActivitiesResult, AutoScalingTypeDict, pd)
end # DescribeScalingActivitiesResult
export DescribeScalingActivitiesResult

mutable struct DescribeScalingActivitiesRequest <: AbstractAWSType
    activityIds::Union{Void,Array{String,1}}
    autoScalingGroupName::Union{Void,String}
    maxRecords::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeScalingActivitiesRequest(;activityIds=nothing, autoScalingGroupName=nothing, maxRecords=nothing, nextToken=nothing)
        new(activityIds, autoScalingGroupName, maxRecords, nextToken)
    end
    DescribeScalingActivitiesRequest(pd) = parse_from_xml(DescribeScalingActivitiesRequest, AutoScalingTypeDict, pd)
end # DescribeScalingActivitiesRequest
export DescribeScalingActivitiesRequest

function DescribeScalingActivities(env::AWSEnv, msg::DescribeScalingActivitiesRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeScalingActivities", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeScalingActivitiesResult(resp.pd)
    end
    resp
end
DescribeScalingActivities(env::AWSEnv; kwargs...) = DescribeScalingActivities(env, DescribeScalingActivitiesRequest(; kwargs...))
export DescribeScalingActivities

mutable struct DeleteLifecycleHookRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    lifecycleHookName::Union{Void,String}
    function DeleteLifecycleHookRequest(;autoScalingGroupName=nothing, lifecycleHookName=nothing)
        new(autoScalingGroupName, lifecycleHookName)
    end
    DeleteLifecycleHookRequest(pd) = parse_from_xml(DeleteLifecycleHookRequest, AutoScalingTypeDict, pd)
end # DeleteLifecycleHookRequest
export DeleteLifecycleHookRequest

function DeleteLifecycleHook(env::AWSEnv, msg::DeleteLifecycleHookRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteLifecycleHook", msg)
    resp
end
DeleteLifecycleHook(env::AWSEnv; kwargs...) = DeleteLifecycleHook(env, DeleteLifecycleHookRequest(; kwargs...))
export DeleteLifecycleHook

mutable struct DeletePolicyRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    policyName::Union{Void,String}
    function DeletePolicyRequest(;autoScalingGroupName=nothing, policyName=nothing)
        new(autoScalingGroupName, policyName)
    end
    DeletePolicyRequest(pd) = parse_from_xml(DeletePolicyRequest, AutoScalingTypeDict, pd)
end # DeletePolicyRequest
export DeletePolicyRequest

function DeletePolicy(env::AWSEnv, msg::DeletePolicyRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeletePolicy", msg)
    resp
end
DeletePolicy(env::AWSEnv; kwargs...) = DeletePolicy(env, DeletePolicyRequest(; kwargs...))
export DeletePolicy

mutable struct DescribeAdjustmentTypesResult <: AbstractAWSType
    adjustmentTypes::Union{Void,Array{AdjustmentType,1}}
    function DescribeAdjustmentTypesResult(;adjustmentTypes=nothing)
        new(adjustmentTypes)
    end
    DescribeAdjustmentTypesResult(pd) = parse_from_xml(DescribeAdjustmentTypesResult, AutoScalingTypeDict, pd)
end # DescribeAdjustmentTypesResult
export DescribeAdjustmentTypesResult

function DescribeAdjustmentTypes(env::AWSEnv)
    resp::AutoScalingResponse = autoscaling_execute(env, "DescribeAdjustmentTypes")
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAdjustmentTypesResult(resp.pd)
    end
    resp
end
export DescribeAdjustmentTypes

mutable struct TerminateInstanceInAutoScalingGroupResult <: AbstractAWSType
    activity::Union{Void,Activity}
    function TerminateInstanceInAutoScalingGroupResult(;activity=nothing)
        new(activity)
    end
    TerminateInstanceInAutoScalingGroupResult(pd) = parse_from_xml(TerminateInstanceInAutoScalingGroupResult, AutoScalingTypeDict, pd)
end # TerminateInstanceInAutoScalingGroupResult
export TerminateInstanceInAutoScalingGroupResult

mutable struct TerminateInstanceInAutoScalingGroupRequest <: AbstractAWSType
    instanceId::Union{Void,String}
    shouldDecrementDesiredCapacity::Union{Void,Bool}
    function TerminateInstanceInAutoScalingGroupRequest(;instanceId=nothing, shouldDecrementDesiredCapacity=nothing)
        new(instanceId, shouldDecrementDesiredCapacity)
    end
    TerminateInstanceInAutoScalingGroupRequest(pd) = parse_from_xml(TerminateInstanceInAutoScalingGroupRequest, AutoScalingTypeDict, pd)
end # TerminateInstanceInAutoScalingGroupRequest
export TerminateInstanceInAutoScalingGroupRequest

function TerminateInstanceInAutoScalingGroup(env::AWSEnv, msg::TerminateInstanceInAutoScalingGroupRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "TerminateInstanceInAutoScalingGroup", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = TerminateInstanceInAutoScalingGroupResult(resp.pd)
    end
    resp
end
TerminateInstanceInAutoScalingGroup(env::AWSEnv; kwargs...) = TerminateInstanceInAutoScalingGroup(env, TerminateInstanceInAutoScalingGroupRequest(; kwargs...))
export TerminateInstanceInAutoScalingGroup

mutable struct RecordLifecycleActionHeartbeatRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    instanceId::Union{Void,String}
    lifecycleActionToken::Union{Void,String}
    lifecycleHookName::Union{Void,String}
    function RecordLifecycleActionHeartbeatRequest(;autoScalingGroupName=nothing, instanceId=nothing, lifecycleActionToken=nothing, lifecycleHookName=nothing)
        new(autoScalingGroupName, instanceId, lifecycleActionToken, lifecycleHookName)
    end
    RecordLifecycleActionHeartbeatRequest(pd) = parse_from_xml(RecordLifecycleActionHeartbeatRequest, AutoScalingTypeDict, pd)
end # RecordLifecycleActionHeartbeatRequest
export RecordLifecycleActionHeartbeatRequest

function RecordLifecycleActionHeartbeat(env::AWSEnv, msg::RecordLifecycleActionHeartbeatRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "RecordLifecycleActionHeartbeat", msg)
    resp
end
RecordLifecycleActionHeartbeat(env::AWSEnv; kwargs...) = RecordLifecycleActionHeartbeat(env, RecordLifecycleActionHeartbeatRequest(; kwargs...))
export RecordLifecycleActionHeartbeat

mutable struct DeleteTagsRequest <: AbstractAWSType
    tags::Union{Void,Array{Tag,1}}
    function DeleteTagsRequest(;tags=nothing)
        new(tags)
    end
    DeleteTagsRequest(pd) = parse_from_xml(DeleteTagsRequest, AutoScalingTypeDict, pd)
end # DeleteTagsRequest
export DeleteTagsRequest

function DeleteTags(env::AWSEnv, msg::DeleteTagsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "DeleteTags", msg)
    resp
end
DeleteTags(env::AWSEnv; kwargs...) = DeleteTags(env, DeleteTagsRequest(; kwargs...))
export DeleteTags

mutable struct AttachLoadBalancerTargetGroupsRequest <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    targetGroupARNs::Union{Void,Array{String,1}}
    function AttachLoadBalancerTargetGroupsRequest(;autoScalingGroupName=nothing, targetGroupARNs=nothing)
        new(autoScalingGroupName, targetGroupARNs)
    end
    AttachLoadBalancerTargetGroupsRequest(pd) = parse_from_xml(AttachLoadBalancerTargetGroupsRequest, AutoScalingTypeDict, pd)
end # AttachLoadBalancerTargetGroupsRequest
export AttachLoadBalancerTargetGroupsRequest

function AttachLoadBalancerTargetGroups(env::AWSEnv, msg::AttachLoadBalancerTargetGroupsRequest)
    resp::AutoScalingResponse = autoscaling_execute(env, "AttachLoadBalancerTargetGroups", msg)
    resp
end
AttachLoadBalancerTargetGroups(env::AWSEnv; kwargs...) = AttachLoadBalancerTargetGroups(env, AttachLoadBalancerTargetGroupsRequest(; kwargs...))
export AttachLoadBalancerTargetGroups
