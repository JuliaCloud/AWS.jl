const AutoScalingTypes = [
    :Activity => [
        :ActivityId => String,
        :AutoScalingGroupName => String,
        :Cause => String,
        :Description => String,
        :Details => String,
        :EndTime => Base.Dates.DateTime,
        :Progress => Int,
        :StartTime => Base.Dates.DateTime,
        :StatusCode => String,
        :StatusMessage => String
    ],
    :AdjustmentType => [
        :AdjustmentType => String
    ],
    :Alarm => [
        :AlarmARN => String,
        :AlarmName => String
    ],
    :EnabledMetric => [
        :Granularity => String,
        :Metric => String
    ],
    :Instance => [
        :AvailabilityZone => String,
        :HealthStatus => String,
        :InstanceId => String,
        :LaunchConfigurationName => String,
        :LifecycleState => String,
        :ProtectedFromScaleIn => Bool
    ],
    :SuspendedProcess => [
        :ProcessName => String,
        :SuspensionReason => String
    ],
    :TagDescription => [
        :Key => String,
        :PropagateAtLaunch => Bool,
        :ResourceId => String,
        :ResourceType => String,
        :Value => String
    ],
    :AutoScalingGroup => [
        :AutoScalingGroupARN => String,
        :AutoScalingGroupName => String,
        :AvailabilityZones => Vector{String},
        :CreatedTime => Base.Dates.DateTime,
        :DefaultCooldown => Int,
        :DesiredCapacity => Int,
        :EnabledMetrics => Vector{EnabledMetric},
        :HealthCheckGracePeriod => Int,
        :HealthCheckType => String,
        :Instances => Vector{Instance},
        :LaunchConfigurationName => String,
        :LoadBalancerNames => Vector{String},
        :MaxSize => Int,
        :MinSize => Int,
        :NewInstancesProtectedFromScaleIn => Bool,
        :PlacementGroup => String,
        :Status => String,
        :SuspendedProcesses => Vector{SuspendedProcess},
        :Tags => Vector{TagDescription},
        :TargetGroupARNs => Vector{String},
        :TerminationPolicies => Vector{String},
        :VPCZoneIdentifier => String
    ],
    :AutoScalingInstanceDetails => [
        :AutoScalingGroupName => String,
        :AvailabilityZone => String,
        :HealthStatus => String,
        :InstanceId => String,
        :LaunchConfigurationName => String,
        :LifecycleState => String,
        :ProtectedFromScaleIn => Bool
    ],
    :Ebs => [
        :DeleteOnTermination => Bool,
        :Encrypted => Bool,
        :Iops => Int,
        :SnapshotId => String,
        :VolumeSize => Int,
        :VolumeType => String
    ],
    :BlockDeviceMapping => [
        :DeviceName => String,
        :Ebs => Ebs,
        :NoDevice => Bool,
        :VirtualName => String
    ],
    :MetricDimension => [
        :Name => String,
        :Value => String
    ],
    :CustomizedMetricSpecification => [
        :Dimensions => Vector{MetricDimension},
        :MetricName => String,
        :Namespace => String,
        :Statistic => String,
        :Unit => String
    ],
    :Filter => [
        :Name => String,
        :Values => Vector{String}
    ],
    :InstanceMonitoring => [
        :Enabled => Bool
    ],
    :LaunchConfiguration => [
        :AssociatePublicIpAddress => Bool,
        :BlockDeviceMappings => Vector{BlockDeviceMapping},
        :ClassicLinkVPCId => String,
        :ClassicLinkVPCSecurityGroups => Vector{String},
        :CreatedTime => Base.Dates.DateTime,
        :EbsOptimized => Bool,
        :IamInstanceProfile => String,
        :ImageId => String,
        :InstanceMonitoring => InstanceMonitoring,
        :InstanceType => String,
        :KernelId => String,
        :KeyName => String,
        :LaunchConfigurationARN => String,
        :LaunchConfigurationName => String,
        :PlacementTenancy => String,
        :RamdiskId => String,
        :SecurityGroups => Vector{String},
        :SpotPrice => String,
        :UserData => String
    ],
    :LifecycleHook => [
        :AutoScalingGroupName => String,
        :DefaultResult => String,
        :GlobalTimeout => Int,
        :HeartbeatTimeout => Int,
        :LifecycleHookName => String,
        :LifecycleTransition => String,
        :NotificationMetadata => String,
        :NotificationTargetARN => String,
        :RoleARN => String
    ],
    :LoadBalancerState => [
        :LoadBalancerName => String,
        :State => String
    ],
    :LoadBalancerTargetGroupState => [
        :LoadBalancerTargetGroupARN => String,
        :State => String
    ],
    :MetricCollectionType => [
        :Metric => String
    ],
    :MetricGranularityType => [
        :Granularity => String
    ],
    :NotificationConfiguration => [
        :AutoScalingGroupName => String,
        :NotificationType => String,
        :TopicARN => String
    ],
    :PredefinedMetricSpecification => [
        :PredefinedMetricType => String,
        :ResourceLabel => String
    ],
    :ProcessType => [
        :ProcessName => String
    ],
    :StepAdjustment => [
        :MetricIntervalLowerBound => Float64,
        :MetricIntervalUpperBound => Float64,
        :ScalingAdjustment => Int
    ],
    :TargetTrackingConfiguration => [
        :CustomizedMetricSpecification => CustomizedMetricSpecification,
        :DisableScaleIn => Bool,
        :PredefinedMetricSpecification => PredefinedMetricSpecification,
        :TargetValue => Float64
    ],
    :ScalingPolicy => [
        :AdjustmentType => String,
        :Alarms => Vector{Alarm},
        :AutoScalingGroupName => String,
        :Cooldown => Int,
        :EstimatedInstanceWarmup => Int,
        :MetricAggregationType => String,
        :MinAdjustmentMagnitude => Int,
        :MinAdjustmentStep => Int,
        :PolicyARN => String,
        :PolicyType => String,
        :ScalingAdjustment => Int,
        :StepAdjustments => Vector{StepAdjustment},
        :TargetTrackingConfiguration => TargetTrackingConfiguration
    ],
    :ScheduledUpdateGroupAction => [
        :AutoScalingGroupName => String,
        :DesiredCapacity => Int,
        :EndTime => Base.Dates.DateTime,
        :MaxSize => Int,
        :MinSize => Int,
        :Recurrence => String,
        :ScheduledActionARN => String,
        :ScheduledActionName => String,
        :StartTime => Base.Dates.DateTime,
        :Time => Base.Dates.DateTime
    ],
    :Tag => [
        :Key => String,
        :PropagateAtLaunch => Bool,
        :ResourceId => String,
        :ResourceType => String,
        :Value => String
    ]
]

const AutoScalingApi = Dict(
    :AttachInstances => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceIds => Vector{String}
        ]
    ),
    :AttachLoadBalancers => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :LoadBalancerNames => Vector{String}
        ]
    ),
    :AttachLoadBalancerTargetGroups => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :TargetGroupARNs => Vector{String}
        ]
    ),
    :CompleteLifecycleAction => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceId => String,
            :LifecycleActionResult => String,
            :LifecycleActionToken => String,
            :LifecycleHookName => String
        ]
    ),
    :CreateAutoScalingGroup => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :AvailabilityZones => Vector{String},
            :DefaultCooldown => Int,
            :DesiredCapacity => Int,
            :HealthCheckGracePeriod => Int,
            :HealthCheckType => String,
            :InstanceId => String,
            :LaunchConfigurationName => String,
            :LoadBalancerNames => Vector{String},
            :MaxSize => Int,
            :MinSize => Int,
            :NewInstancesProtectedFromScaleIn => Bool,
            :PlacementGroup => String,
            :Tags => Vector{Tag},
            :TargetGroupARNs => Vector{String},
            :TerminationPolicies => Vector{String},
            :VPCZoneIdentifier => String
        ]
    ),
    :CreateLaunchConfiguration => Dict(
        :Request => [
            :AssociatePublicIpAddress => Bool,
            :BlockDeviceMappings => Vector{BlockDeviceMapping},
            :ClassicLinkVPCId => String,
            :ClassicLinkVPCSecurityGroups => Vector{String},
            :EbsOptimized => Bool,
            :IamInstanceProfile => String,
            :ImageId => String,
            :InstanceId => String,
            :InstanceMonitoring => InstanceMonitoring,
            :InstanceType => String,
            :KernelId => String,
            :KeyName => String,
            :LaunchConfigurationName => String,
            :PlacementTenancy => String,
            :RamdiskId => String,
            :SecurityGroups => Vector{String},
            :SpotPrice => String,
            :UserData => String
        ]
    ),
    :CreateOrUpdateTags => Dict(
        :Request => [
            :Tags => Vector{Tag}
        ]
    ),
    :DeleteAutoScalingGroup => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :ForceDelete => Bool
        ]
    ),
    :DeleteLaunchConfiguration => Dict(
        :Request => [
            :LaunchConfigurationName => String
        ]
    ),
    :DeleteLifecycleHook => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :LifecycleHookName => String
        ]
    ),
    :DeleteNotificationConfiguration => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :TopicARN => Vector{String}
        ]
    ),
    :DeletePolicy => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :PolicyName => String
        ]
    ),
    :DeleteScheduledAction => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :ScheduledActionName => String
        ]
    ),
    :DeleteTags => Dict(
        :Request => [
            :Tags => Vector{Tag}
        ]
    ),
    :DescribeAccountLimits => Dict(
        :Result => [
            :MaxNumberOfAutoScalingGroups => Int,
            :MaxNumberOfLaunchConfigurations => Int,
            :NumberOfAutoScalingGroups => Int,
            :NumberOfLaunchConfigurations => Int
        ]
    ),
    :DescribeAdjustmentTypes => Dict(
        :Result => [
            :AdjustmentTypes => Vector{AdjustmentType}
        ]
    ),
    :DescribeAutoScalingGroups => Dict(
        :Request => [
            :AutoScalingGroupNames => Vector{String},
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :AutoScalingGroups => Vector{AutoScalingGroup},
            :NextToken => String
        ]
    ),
    :DescribeAutoScalingInstances => Dict(
        :Request => [
            :InstanceIds => Vector{String},
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :AutoScalingInstances => Vector{AutoScalingInstanceDetails},
            :NextToken => String
        ]
    ),
    :DescribeAutoScalingNotificationTypes => Dict(
        :Result => [
            :AutoScalingNotificationTypes => Vector{String}
        ]
    ),
    :DescribeLaunchConfigurations => Dict(
        :Request => [
            :LaunchConfigurationNames => Vector{String},
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :LaunchConfigurations => Vector{LaunchConfiguration},
            :NextToken => String
        ]
    ),
    :DescribeLifecycleHooks => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :LifecycleHookNames => Vector{String}
        ],
        :Result => [
            :LifecycleHooks => Vector{LifecycleHook}
        ]
    ),
    :DescribeLifecycleHookTypes => Dict(
        :Result => [
            :LifecycleHookTypes => Vector{String}
        ]
    ),
    :DescribeLoadBalancers => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :LoadBalancers => Vector{LoadBalancerState},
            :NextToken => String
        ]
    ),
    :DescribeLoadBalancerTargetGroups => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :LoadBalancerTargetGroups => Vector{LoadBalancerTargetGroupState},
            :NextToken => String
        ]
    ),
    :DescribeMetricCollectionTypes => Dict(
        :Result => [
            :Granularities => Vector{MetricGranularityType},
            :Metrics => Vector{MetricCollectionType}
        ]
    ),
    :DescribeNotificationConfigurations => Dict(
        :Request => [
            :AutoScalingGroupNames => Vector{String},
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :NextToken => String,
            :NotificationConfigurations => Vector{NotificationConfiguration}
        ]
    ),
    :DescribePolicies => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :MaxRecords => Int,
            :NextToken => String,
            :PolicyNames => Vector{String},
            :PolicyTypes => Vector{String}
        ],
        :Result => [
            :NextToken => String,
            :ScalingPolicies => Vector{ScalingPolicy},
        ]
    ),
    :DescribeScalingActivities => Dict(
        :Request => [
            :ActivityIds => Vector{String},
            :AutoScalingGroupName => String,
            :MaxRecords => Int,
            :NextToken => String
        ],
        :Result => [
            :Activities => Vector{Activity},
            :NextToken => String
        ]
    ),
    :DescribeScalingProcessTypes => Dict(
        :Result => [
            :Processes => Vector{ProcessType}
        ]
    ),
    :DescribeScheduledActions => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :EndTime => Base.Dates.DateTime,
            :MaxRecords => Int,
            :NextToken => String,
            :ScheduledActionNames => Vector{String},
            :StartTime => Base.Dates.DateTime
        ],
        :Result => [
            :NextToken => String,
            :ScheduledUpdateGroupActions => Vector{ScheduledUpdateGroupAction}
        ]
    ),
    :DescribeTags => Dict(
        :Request => [
            :Filters => Vector{Filter},
            :MaxRecords => Int,
            :NextToken => String,
        ],
        :Result => [
            :NextToken => String,
            :Tags => Vector{TagDescription}
        ]
    ),
    :DescribeTerminationPolicyTypes => Dict(
        :Result => [
            :TerminationPolicyTypes => Vector{String}
        ]
    ),
    :DetachInstances => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceIds => Vector{String},
            :ShouldDecrementDesiredCapacity => Bool
        ],
        :Result => [
            :Activities => Vector{Activity}
        ]
    ),
    :DetachLoadBalancers => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :LoadBalancerNames => Vector{String}
        ]
    ),
    :DetachLoadBalancerTargetGroups => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :TargetGroupARNs => Vector{String}
        ]
    ),
    :DisableMetricsCollection => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :Metrics => Vector{String}
        ]
    ),
    :EnableMetricsCollection => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :Granularity => String,
            :Metrics => Vector{String}
        ]
    ),
    :EnterStandby => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceIds => Vector{String},
            :ShouldDecrementDesiredCapacity => Bool
        ],
        :Result => [
            :Activities => Vector{Activity}
        ]
    ),
    :ExecutePolicy => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :BreachThreshold => Float64,
            :HonorCooldown => Bool,
            :MetricValue => Float64,
            :PolicyName => String
        ]
    ),
    :ExitStandby => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceIds => Vector{String}
        ],
        :Result => [
            :Activities => Vector{Activity}
        ]
    ),
    :PutLifecycleHook => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :DefaultResult => String,
            :HeartbeatTimeout => Int,
            :LifecycleHookName => String,
            :LifecycleTransition => String,
            :NotificationMetadata => String,
            :NotificationTargetARN => String,
            :RoleARN => String
        ]
    ),
    :PutNotificationConfiguration => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :NotificationTypes => Vector{String},
            :TopicARN => String
        ]
    ),
    :PutScalingPolicy => Dict(
        :Request => [
            :AdjustmentType => String,
            :AutoScalingGroupName => String,
            :Cooldown => Int,
            :EstimatedInstanceWarmup => Int,
            :MetricAggregationType => String,
            :MinAdjustmentMagnitude => Int,
            :MinAdjustmentStep => Int,
            :PolicyName => String,
            :PolicyType => String,
            :ScalingAdjustment => Int,
            :StepAdjustments => Vector{StepAdjustment},
            :TargetTrackingConfiguration => TargetTrackingConfiguration
        ],
        :Result => [
            :Alarms => Vector{Alarm},
            :PolicyARN => String
        ]
    ),
    :PutScheduledUpdateGroupAction => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :DesiredCapacity => Int,
            :EndTime => Base.Dates.DateTime,
            :MaxSize => Int,
            :MinSize => Int,
            :Recurrence => String,
            :ScheduledActionName => String,
            :StartTime => Base.Dates.DateTime,
            :Time => Base.Dates.DateTime
        ]
    ),
    :RecordLifecycleActionHeartbeat => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceId => String,
            :LifecycleActionToken => String,
            :LifecycleHookName => String
        ]
    ),
    :ResumeProcesses => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :ScalingProcesses => Vector{String}
        ]
    ),
    :SetDesiredCapacity => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :DesiredCapacity => Int,
            :HonorCooldown => Bool
        ]
    ),
    :SetInstanceHealth => Dict(
        :Request => [
            :HealthStatus => String,
            :InstanceId => String,
            :ShouldRespectGracePeriod => Bool
        ]
    ),
    :SetInstanceProtection => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :InstanceIds => Vector{String},
            :ProtectedFromScaleIn => Bool
        ]
    ),
    :SuspendProcesses => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :ScalingProcesses => Vector{String}
        ]
    ),
    :TerminateInstanceInAutoScalingGroup => Dict(
        :Request => [
            :InstanceId => String,
            :ShouldDecrementDesiredCapacity => Bool
        ],
        :Result => [
            :Activity => Activity
        ]
    ),
    :UpdateAutoScalingGroup => Dict(
        :Request => [
            :AutoScalingGroupName => String,
            :AvailabilityZones => Vector{String},
            :DefaultCooldown => Int,
            :DesiredCapacity => Int,
            :HealthCheckGracePeriod => Int,
            :HealthCheckType => String,
            :LaunchConfigurationName => String,
            :MaxSize => Int,
            :MinSize => Int,
            :NewInstancesProtectedFromScaleIn => Bool,
            :PlacementGroup => String,
            :TerminationPolicies => Vector{String},
            :VPCZoneIdentifier => String
        ]
    )
)

function _autoscaling_type_map()
    d = Dict(AutoScalingTypes...)
    for (apiname,apispec) in AutoScalingApi
        for (opname,optype) in apispec
            d[Symbol(string(apiname)*string(opname))] = optype
        end
    end
    d
end

const AutoScalingTypeDict = _autoscaling_type_map()
const AutoScalingApiVer = "2011-01-01"
