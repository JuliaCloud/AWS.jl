# generated from AutoScalingTypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

type Activity <: AbstractAWSType
    activityId::Union{Void,String}
    autoScalingGroupName::Union{Void,String}
    cause::Union{Void,String}
    description::Union{Void,String}
    details::Union{Void,String}
    endTime::Union{Void,DateTime}
    progress::Union{Void,Int64}
    startTime::Union{Void,DateTime}
    statusCode::Union{Void,String}
    statusMessage::Union{Void,String}
    function Activity(;activityId=nothing, autoScalingGroupName=nothing, cause=nothing, description=nothing, details=nothing, endTime=nothing, progress=nothing, startTime=nothing, statusCode=nothing, statusMessage=nothing)
        new(activityId, autoScalingGroupName, cause, description, details, endTime, progress, startTime, statusCode, statusMessage)
    end
    Activity(pd) = parse_from_xml(Activity, AutoScalingTypeDict, pd)
end # Activity
export Activity

type AdjustmentType <: AbstractAWSType
    adjustmentType::Union{Void,String}
    function AdjustmentType(;adjustmentType=nothing)
        new(adjustmentType)
    end
    AdjustmentType(pd) = parse_from_xml(AdjustmentType, AutoScalingTypeDict, pd)
end # AdjustmentType
export AdjustmentType

type Alarm <: AbstractAWSType
    alarmARN::Union{Void,String}
    alarmName::Union{Void,String}
    function Alarm(;alarmARN=nothing, alarmName=nothing)
        new(alarmARN, alarmName)
    end
    Alarm(pd) = parse_from_xml(Alarm, AutoScalingTypeDict, pd)
end # Alarm
export Alarm

type EnabledMetric <: AbstractAWSType
    granularity::Union{Void,String}
    metric::Union{Void,String}
    function EnabledMetric(;granularity=nothing, metric=nothing)
        new(granularity, metric)
    end
    EnabledMetric(pd) = parse_from_xml(EnabledMetric, AutoScalingTypeDict, pd)
end # EnabledMetric
export EnabledMetric

type Instance <: AbstractAWSType
    availabilityZone::Union{Void,String}
    healthStatus::Union{Void,String}
    instanceId::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    lifecycleState::Union{Void,String}
    protectedFromScaleIn::Union{Void,Bool}
    function Instance(;availabilityZone=nothing, healthStatus=nothing, instanceId=nothing, launchConfigurationName=nothing, lifecycleState=nothing, protectedFromScaleIn=nothing)
        new(availabilityZone, healthStatus, instanceId, launchConfigurationName, lifecycleState, protectedFromScaleIn)
    end
    Instance(pd) = parse_from_xml(Instance, AutoScalingTypeDict, pd)
end # Instance
export Instance

type SuspendedProcess <: AbstractAWSType
    processName::Union{Void,String}
    suspensionReason::Union{Void,String}
    function SuspendedProcess(;processName=nothing, suspensionReason=nothing)
        new(processName, suspensionReason)
    end
    SuspendedProcess(pd) = parse_from_xml(SuspendedProcess, AutoScalingTypeDict, pd)
end # SuspendedProcess
export SuspendedProcess

type TagDescription <: AbstractAWSType
    key::Union{Void,String}
    propagateAtLaunch::Union{Void,Bool}
    resourceId::Union{Void,String}
    resourceType::Union{Void,String}
    value::Union{Void,String}
    function TagDescription(;key=nothing, propagateAtLaunch=nothing, resourceId=nothing, resourceType=nothing, value=nothing)
        new(key, propagateAtLaunch, resourceId, resourceType, value)
    end
    TagDescription(pd) = parse_from_xml(TagDescription, AutoScalingTypeDict, pd)
end # TagDescription
export TagDescription

type AutoScalingGroup <: AbstractAWSType
    autoScalingGroupARN::Union{Void,String}
    autoScalingGroupName::Union{Void,String}
    availabilityZones::Union{Void,Array{String,1}}
    createdTime::Union{Void,DateTime}
    defaultCooldown::Union{Void,Int64}
    desiredCapacity::Union{Void,Int64}
    enabledMetrics::Union{Void,Array{EnabledMetric,1}}
    healthCheckGracePeriod::Union{Void,Int64}
    healthCheckType::Union{Void,String}
    instances::Union{Void,Array{Instance,1}}
    launchConfigurationName::Union{Void,String}
    loadBalancerNames::Union{Void,Array{String,1}}
    maxSize::Union{Void,Int64}
    minSize::Union{Void,Int64}
    newInstancesProtectedFromScaleIn::Union{Void,Bool}
    placementGroup::Union{Void,String}
    status::Union{Void,String}
    suspendedProcesses::Union{Void,Array{SuspendedProcess,1}}
    tags::Union{Void,Array{TagDescription,1}}
    targetGroupARNs::Union{Void,Array{String,1}}
    terminationPolicies::Union{Void,Array{String,1}}
    vPCZoneIdentifier::Union{Void,String}
    function AutoScalingGroup(;autoScalingGroupARN=nothing, autoScalingGroupName=nothing, availabilityZones=nothing, createdTime=nothing, defaultCooldown=nothing, desiredCapacity=nothing, enabledMetrics=nothing, healthCheckGracePeriod=nothing, healthCheckType=nothing, instances=nothing, launchConfigurationName=nothing, loadBalancerNames=nothing, maxSize=nothing, minSize=nothing, newInstancesProtectedFromScaleIn=nothing, placementGroup=nothing, status=nothing, suspendedProcesses=nothing, tags=nothing, targetGroupARNs=nothing, terminationPolicies=nothing, vPCZoneIdentifier=nothing)
        new(autoScalingGroupARN, autoScalingGroupName, availabilityZones, createdTime, defaultCooldown, desiredCapacity, enabledMetrics, healthCheckGracePeriod, healthCheckType, instances, launchConfigurationName, loadBalancerNames, maxSize, minSize, newInstancesProtectedFromScaleIn, placementGroup, status, suspendedProcesses, tags, targetGroupARNs, terminationPolicies, vPCZoneIdentifier)
    end
    AutoScalingGroup(pd) = parse_from_xml(AutoScalingGroup, AutoScalingTypeDict, pd)
end # AutoScalingGroup
export AutoScalingGroup

type AutoScalingInstanceDetails <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    availabilityZone::Union{Void,String}
    healthStatus::Union{Void,String}
    instanceId::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    lifecycleState::Union{Void,String}
    protectedFromScaleIn::Union{Void,Bool}
    function AutoScalingInstanceDetails(;autoScalingGroupName=nothing, availabilityZone=nothing, healthStatus=nothing, instanceId=nothing, launchConfigurationName=nothing, lifecycleState=nothing, protectedFromScaleIn=nothing)
        new(autoScalingGroupName, availabilityZone, healthStatus, instanceId, launchConfigurationName, lifecycleState, protectedFromScaleIn)
    end
    AutoScalingInstanceDetails(pd) = parse_from_xml(AutoScalingInstanceDetails, AutoScalingTypeDict, pd)
end # AutoScalingInstanceDetails
export AutoScalingInstanceDetails

type Ebs <: AbstractAWSType
    deleteOnTermination::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    snapshotId::Union{Void,String}
    volumeSize::Union{Void,Int64}
    volumeType::Union{Void,String}
    function Ebs(;deleteOnTermination=nothing, encrypted=nothing, iops=nothing, snapshotId=nothing, volumeSize=nothing, volumeType=nothing)
        new(deleteOnTermination, encrypted, iops, snapshotId, volumeSize, volumeType)
    end
    Ebs(pd) = parse_from_xml(Ebs, AutoScalingTypeDict, pd)
end # Ebs
export Ebs

type BlockDeviceMapping <: AbstractAWSType
    deviceName::Union{Void,String}
    ebs::Union{Void,Ebs}
    noDevice::Union{Void,Bool}
    virtualName::Union{Void,String}
    function BlockDeviceMapping(;deviceName=nothing, ebs=nothing, noDevice=nothing, virtualName=nothing)
        new(deviceName, ebs, noDevice, virtualName)
    end
    BlockDeviceMapping(pd) = parse_from_xml(BlockDeviceMapping, AutoScalingTypeDict, pd)
end # BlockDeviceMapping
export BlockDeviceMapping

type MetricDimension <: AbstractAWSType
    name::Union{Void,String}
    value::Union{Void,String}
    function MetricDimension(;name=nothing, value=nothing)
        new(name, value)
    end
    MetricDimension(pd) = parse_from_xml(MetricDimension, AutoScalingTypeDict, pd)
end # MetricDimension
export MetricDimension

type CustomizedMetricSpecification <: AbstractAWSType
    dimensions::Union{Void,Array{MetricDimension,1}}
    metricName::Union{Void,String}
    namespace::Union{Void,String}
    statistic::Union{Void,String}
    unit::Union{Void,String}
    function CustomizedMetricSpecification(;dimensions=nothing, metricName=nothing, namespace=nothing, statistic=nothing, unit=nothing)
        new(dimensions, metricName, namespace, statistic, unit)
    end
    CustomizedMetricSpecification(pd) = parse_from_xml(CustomizedMetricSpecification, AutoScalingTypeDict, pd)
end # CustomizedMetricSpecification
export CustomizedMetricSpecification

type Filter <: AbstractAWSType
    name::Union{Void,String}
    values::Union{Void,Array{String,1}}
    function Filter(;name=nothing, values=nothing)
        new(name, values)
    end
    Filter(pd) = parse_from_xml(Filter, AutoScalingTypeDict, pd)
end # Filter
export Filter

type InstanceMonitoring <: AbstractAWSType
    enabled::Union{Void,Bool}
    function InstanceMonitoring(;enabled=nothing)
        new(enabled)
    end
    InstanceMonitoring(pd) = parse_from_xml(InstanceMonitoring, AutoScalingTypeDict, pd)
end # InstanceMonitoring
export InstanceMonitoring

type LaunchConfiguration <: AbstractAWSType
    associatePublicIpAddress::Union{Void,Bool}
    blockDeviceMappings::Union{Void,Array{BlockDeviceMapping,1}}
    classicLinkVPCId::Union{Void,String}
    classicLinkVPCSecurityGroups::Union{Void,Array{String,1}}
    createdTime::Union{Void,DateTime}
    ebsOptimized::Union{Void,Bool}
    iamInstanceProfile::Union{Void,String}
    imageId::Union{Void,String}
    instanceMonitoring::Union{Void,InstanceMonitoring}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    launchConfigurationARN::Union{Void,String}
    launchConfigurationName::Union{Void,String}
    placementTenancy::Union{Void,String}
    ramdiskId::Union{Void,String}
    securityGroups::Union{Void,Array{String,1}}
    spotPrice::Union{Void,String}
    userData::Union{Void,String}
    function LaunchConfiguration(;associatePublicIpAddress=nothing, blockDeviceMappings=nothing, classicLinkVPCId=nothing, classicLinkVPCSecurityGroups=nothing, createdTime=nothing, ebsOptimized=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceMonitoring=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, launchConfigurationARN=nothing, launchConfigurationName=nothing, placementTenancy=nothing, ramdiskId=nothing, securityGroups=nothing, spotPrice=nothing, userData=nothing)
        new(associatePublicIpAddress, blockDeviceMappings, classicLinkVPCId, classicLinkVPCSecurityGroups, createdTime, ebsOptimized, iamInstanceProfile, imageId, instanceMonitoring, instanceType, kernelId, keyName, launchConfigurationARN, launchConfigurationName, placementTenancy, ramdiskId, securityGroups, spotPrice, userData)
    end
    LaunchConfiguration(pd) = parse_from_xml(LaunchConfiguration, AutoScalingTypeDict, pd)
end # LaunchConfiguration
export LaunchConfiguration

type LifecycleHook <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    defaultResult::Union{Void,String}
    globalTimeout::Union{Void,Int64}
    heartbeatTimeout::Union{Void,Int64}
    lifecycleHookName::Union{Void,String}
    lifecycleTransition::Union{Void,String}
    notificationMetadata::Union{Void,String}
    notificationTargetARN::Union{Void,String}
    roleARN::Union{Void,String}
    function LifecycleHook(;autoScalingGroupName=nothing, defaultResult=nothing, globalTimeout=nothing, heartbeatTimeout=nothing, lifecycleHookName=nothing, lifecycleTransition=nothing, notificationMetadata=nothing, notificationTargetARN=nothing, roleARN=nothing)
        new(autoScalingGroupName, defaultResult, globalTimeout, heartbeatTimeout, lifecycleHookName, lifecycleTransition, notificationMetadata, notificationTargetARN, roleARN)
    end
    LifecycleHook(pd) = parse_from_xml(LifecycleHook, AutoScalingTypeDict, pd)
end # LifecycleHook
export LifecycleHook

type LoadBalancerState <: AbstractAWSType
    loadBalancerName::Union{Void,String}
    state::Union{Void,String}
    function LoadBalancerState(;loadBalancerName=nothing, state=nothing)
        new(loadBalancerName, state)
    end
    LoadBalancerState(pd) = parse_from_xml(LoadBalancerState, AutoScalingTypeDict, pd)
end # LoadBalancerState
export LoadBalancerState

type LoadBalancerTargetGroupState <: AbstractAWSType
    loadBalancerTargetGroupARN::Union{Void,String}
    state::Union{Void,String}
    function LoadBalancerTargetGroupState(;loadBalancerTargetGroupARN=nothing, state=nothing)
        new(loadBalancerTargetGroupARN, state)
    end
    LoadBalancerTargetGroupState(pd) = parse_from_xml(LoadBalancerTargetGroupState, AutoScalingTypeDict, pd)
end # LoadBalancerTargetGroupState
export LoadBalancerTargetGroupState

type MetricCollectionType <: AbstractAWSType
    metric::Union{Void,String}
    function MetricCollectionType(;metric=nothing)
        new(metric)
    end
    MetricCollectionType(pd) = parse_from_xml(MetricCollectionType, AutoScalingTypeDict, pd)
end # MetricCollectionType
export MetricCollectionType

type MetricGranularityType <: AbstractAWSType
    granularity::Union{Void,String}
    function MetricGranularityType(;granularity=nothing)
        new(granularity)
    end
    MetricGranularityType(pd) = parse_from_xml(MetricGranularityType, AutoScalingTypeDict, pd)
end # MetricGranularityType
export MetricGranularityType

type NotificationConfiguration <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    notificationType::Union{Void,String}
    topicARN::Union{Void,String}
    function NotificationConfiguration(;autoScalingGroupName=nothing, notificationType=nothing, topicARN=nothing)
        new(autoScalingGroupName, notificationType, topicARN)
    end
    NotificationConfiguration(pd) = parse_from_xml(NotificationConfiguration, AutoScalingTypeDict, pd)
end # NotificationConfiguration
export NotificationConfiguration

type PredefinedMetricSpecification <: AbstractAWSType
    predefinedMetricType::Union{Void,String}
    resourceLabel::Union{Void,String}
    function PredefinedMetricSpecification(;predefinedMetricType=nothing, resourceLabel=nothing)
        new(predefinedMetricType, resourceLabel)
    end
    PredefinedMetricSpecification(pd) = parse_from_xml(PredefinedMetricSpecification, AutoScalingTypeDict, pd)
end # PredefinedMetricSpecification
export PredefinedMetricSpecification

type ProcessType <: AbstractAWSType
    processName::Union{Void,String}
    function ProcessType(;processName=nothing)
        new(processName)
    end
    ProcessType(pd) = parse_from_xml(ProcessType, AutoScalingTypeDict, pd)
end # ProcessType
export ProcessType

type StepAdjustment <: AbstractAWSType
    metricIntervalLowerBound::Union{Void,Float64}
    metricIntervalUpperBound::Union{Void,Float64}
    scalingAdjustment::Union{Void,Int64}
    function StepAdjustment(;metricIntervalLowerBound=nothing, metricIntervalUpperBound=nothing, scalingAdjustment=nothing)
        new(metricIntervalLowerBound, metricIntervalUpperBound, scalingAdjustment)
    end
    StepAdjustment(pd) = parse_from_xml(StepAdjustment, AutoScalingTypeDict, pd)
end # StepAdjustment
export StepAdjustment

type TargetTrackingConfiguration <: AbstractAWSType
    customizedMetricSpecification::Union{Void,CustomizedMetricSpecification}
    disableScaleIn::Union{Void,Bool}
    predefinedMetricSpecification::Union{Void,PredefinedMetricSpecification}
    targetValue::Union{Void,Float64}
    function TargetTrackingConfiguration(;customizedMetricSpecification=nothing, disableScaleIn=nothing, predefinedMetricSpecification=nothing, targetValue=nothing)
        new(customizedMetricSpecification, disableScaleIn, predefinedMetricSpecification, targetValue)
    end
    TargetTrackingConfiguration(pd) = parse_from_xml(TargetTrackingConfiguration, AutoScalingTypeDict, pd)
end # TargetTrackingConfiguration
export TargetTrackingConfiguration

type ScalingPolicy <: AbstractAWSType
    adjustmentType::Union{Void,String}
    alarms::Union{Void,Array{Alarm,1}}
    autoScalingGroupName::Union{Void,String}
    cooldown::Union{Void,Int64}
    estimatedInstanceWarmup::Union{Void,Int64}
    metricAggregationType::Union{Void,String}
    minAdjustmentMagnitude::Union{Void,Int64}
    minAdjustmentStep::Union{Void,Int64}
    policyARN::Union{Void,String}
    policyType::Union{Void,String}
    scalingAdjustment::Union{Void,Int64}
    stepAdjustments::Union{Void,Array{StepAdjustment,1}}
    targetTrackingConfiguration::Union{Void,TargetTrackingConfiguration}
    function ScalingPolicy(;adjustmentType=nothing, alarms=nothing, autoScalingGroupName=nothing, cooldown=nothing, estimatedInstanceWarmup=nothing, metricAggregationType=nothing, minAdjustmentMagnitude=nothing, minAdjustmentStep=nothing, policyARN=nothing, policyType=nothing, scalingAdjustment=nothing, stepAdjustments=nothing, targetTrackingConfiguration=nothing)
        new(adjustmentType, alarms, autoScalingGroupName, cooldown, estimatedInstanceWarmup, metricAggregationType, minAdjustmentMagnitude, minAdjustmentStep, policyARN, policyType, scalingAdjustment, stepAdjustments, targetTrackingConfiguration)
    end
    ScalingPolicy(pd) = parse_from_xml(ScalingPolicy, AutoScalingTypeDict, pd)
end # ScalingPolicy
export ScalingPolicy

type ScheduledUpdateGroupAction <: AbstractAWSType
    autoScalingGroupName::Union{Void,String}
    desiredCapacity::Union{Void,Int64}
    endTime::Union{Void,DateTime}
    maxSize::Union{Void,Int64}
    minSize::Union{Void,Int64}
    recurrence::Union{Void,String}
    scheduledActionARN::Union{Void,String}
    scheduledActionName::Union{Void,String}
    startTime::Union{Void,DateTime}
    time::Union{Void,DateTime}
    function ScheduledUpdateGroupAction(;autoScalingGroupName=nothing, desiredCapacity=nothing, endTime=nothing, maxSize=nothing, minSize=nothing, recurrence=nothing, scheduledActionARN=nothing, scheduledActionName=nothing, startTime=nothing, time=nothing)
        new(autoScalingGroupName, desiredCapacity, endTime, maxSize, minSize, recurrence, scheduledActionARN, scheduledActionName, startTime, time)
    end
    ScheduledUpdateGroupAction(pd) = parse_from_xml(ScheduledUpdateGroupAction, AutoScalingTypeDict, pd)
end # ScheduledUpdateGroupAction
export ScheduledUpdateGroupAction

type Tag <: AbstractAWSType
    key::Union{Void,String}
    propagateAtLaunch::Union{Void,Bool}
    resourceId::Union{Void,String}
    resourceType::Union{Void,String}
    value::Union{Void,String}
    function Tag(;key=nothing, propagateAtLaunch=nothing, resourceId=nothing, resourceType=nothing, value=nothing)
        new(key, propagateAtLaunch, resourceId, resourceType, value)
    end
    Tag(pd) = parse_from_xml(Tag, AutoScalingTypeDict, pd)
end # Tag
export Tag
