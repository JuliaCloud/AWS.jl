const EC2Types = [
    :AccountAttributeValue => [
        :attributeValue => String
    ]
    ,:AccountAttribute => [
        :attributeName => String
        ,:attributeValueSet => Vector{AccountAttributeValue}
    ]
    ,:ActiveInstance => [
        :instanceHealth => String
        ,:instanceId => String
        ,:instanceType => String
        ,:spotInstanceRequestId => String
    ]
    ,:Address => [
        :allocationId => String
        ,:associationId => String
        ,:domain => String
        ,:instanceId => String
        ,:networkInterfaceId => String
        ,:networkInterfaceOwnerId => String
        ,:privateIpAddress => String
        ,:publicIp => String
    ]
    ,:AttributeBooleanValue => [
        :Value => Bool
    ]
    ,:AttributeValue => [
        :Value => String
    ]
    ,:AvailabilityZoneMessage => [
        :message => String
    ]
    ,:AvailabilityZone => [
        :messageSet => Vector{AvailabilityZoneMessage}
        ,:regionName => String
        ,:zoneName => String
        ,:zoneState => String
    ]
    ,:InstanceCapacity => [
        :availableCapacity => Int
        ,:instanceType => String
        ,:totalCapacity => Int
    ]
    ,:AvailableCapacity => [
        :availableInstanceCapacity => Vector{InstanceCapacity}
        ,:availableVCpus => Int
    ]
    ,:BlobAttributeValue => [
        :Value => Vector{UInt8}
    ]
    ,:Tag => [
        :Key => String
        ,:Value => String
    ]
    ,:TagDescription => [
        :key => String
        ,:resourceId => String
        ,:resourceType => String
        ,:value => String
    ]
    ,:TagSpecification => [
        :ResourceType => String
        ,:Tags => Vector{Tag}
    ]
    ,:UnsuccessfulItemError => [
        :code => String
        ,:message => String
    ]
    ,:UnsuccessfulItem => [
        :error => UnsuccessfulItemError
        ,:resourceId => String
    ]
    ,:UserBucket => [
        :S3Bucket => String
        ,:S3Key => String
    ]
    ,:UserBucketDetails => [
        :s3Bucket => String
        ,:s3Key => String
    ]
    ,:UserData => [
        :Data => String
    ]
    ,:UserIdGroupPair => [
        :GroupId => String
        ,:GroupName => String
        ,:PeeringStatus => String
        ,:UserId => String
        ,:VpcId => String
        ,:VpcPeeringConnectionId => String
    ]
    ,:VgwTelemetry => [
        :acceptedRouteCount => Int
        ,:lastStatusChange => Base.Dates.DateTime
        ,:outsideIpAddress => String
        ,:status => String
        ,:statusMessage => String
    ]
    ,:VolumeAttachment => [
        :attachTime => Base.Dates.DateTime
        ,:deleteOnTermination => Bool
        ,:device => String
        ,:instanceId => String
        ,:status => String
        ,:volumeId => String
    ]
    ,:VolumeDetail => [
        :Size => Int
    ]
    ,:VolumeModification => [
        :endTime => Base.Dates.DateTime
        ,:modificationState => String
        ,:originalIops => Int
        ,:originalSize => Int
        ,:originalVolumeType => String
        ,:progress => Int
        ,:startTime => Base.Dates.DateTime
        ,:statusMessage => String
        ,:targetIops => Int
        ,:targetSize => Int
        ,:targetVolumeType => String
        ,:volumeId => String
    ]
    ,:VolumeStatusAction => [
        :code => String
        ,:description => String
        ,:eventId => String
        ,:eventType => String
    ]
    ,:VolumeStatusDetails => [
        :name => String
        ,:status => String
    ]
    ,:VolumeStatusEvent => [
        :description => String
        ,:eventId => String
        ,:eventType => String
        ,:notAfter => Base.Dates.DateTime
        ,:notBefore => Base.Dates.DateTime
    ]
    ,:VolumeStatusInfo => [
        :details => Vector{VolumeStatusDetails}
        ,:status => String
    ]
    ,:VolumeStatusItem => [
        :actionsSet => Vector{VolumeStatusAction}
        ,:availabilityZone => String
        ,:eventsSet => Vector{VolumeStatusEvent}
        ,:volumeId => String
        ,:volumeStatus => VolumeStatusInfo
    ]
    ,:Volume => [
        :attachmentSet => Vector{VolumeAttachment}
        ,:availabilityZone => String
        ,:createTime => Base.Dates.DateTime
        ,:encrypted => Bool
        ,:iops => Int
        ,:kmsKeyId => String
        ,:size => Int
        ,:snapshotId => String
        ,:status => String
        ,:tagSet => Vector{Tag}
        ,:volumeId => String
        ,:volumeType => String
    ]
    ,:EbsBlockDevice => [
        :DeleteOnTermination => Bool
        ,:Encrypted => Bool
        ,:Iops => Int
        ,:SnapshotId => String
        ,:VolumeSize => Int
        ,:VolumeType => Volume
    ]
    ,:BlockDeviceMapping => [
        :DeviceName => String
        ,:Ebs => EbsBlockDevice
        ,:NoDevice => String
        ,:VirtualName => String
    ]
    ,:BundleTaskError => [
        :code => String
        ,:message => String
    ]
    ,:RunInstancesMonitoringEnabled => [
        :Enabled => Bool
    ]
    ,:S3Storage => [
        :AWSAccessKeyId => String
        ,:Bucket => String
        ,:Prefix => String
        ,:UploadPolicy => Vector{UInt8}
        ,:UploadPolicySignature => String
    ]
    ,:SpotInstanceStateFault => [
        :code => String
        ,:message => String
    ]
    ,:SpotInstanceStatus => [
        :code => String
        ,:message => String
        ,:updateTime => Base.Dates.DateTime
    ]
    ,:SpotPlacement => [
        :AvailabilityZone => String
        ,:GroupName => String
        ,:Tenancy => String
    ]
    ,:SpotPrice => [
        :availabilityZone => String
        ,:instanceType => String
        ,:productDescription => String
        ,:spotPrice => String
        ,:timestamp => Base.Dates.DateTime
    ]
    ,:Storage => [
        :S3 => S3Storage
    ]
    ,:StorageLocation => [
        :Bucket => String
        ,:Key => String
    ]
    ,:BundleTask => [
        :bundleId => String
        ,:error => BundleTaskError
        ,:instanceId => String
        ,:progress => String
        ,:startTime => Base.Dates.DateTime
        ,:state => String
        ,:storage => Storage
        ,:updateTime => Base.Dates.DateTime
    ]
    ,:CancelledSpotInstanceRequest => [
        :spotInstanceRequestId => String
        ,:state => String
    ]
    ,:CancelSpotFleetRequestsError => [
        :code => String
        ,:message => String
    ]
    ,:CancelSpotFleetRequestsErrorItem => [
        :error => CancelSpotFleetRequestsError
        ,:spotFleetRequestId => String
    ]
    ,:CancelSpotFleetRequestsSuccessItem => [
        :currentSpotFleetRequestState => String
        ,:previousSpotFleetRequestState => String
        ,:spotFleetRequestId => String
    ]
    ,:GroupIdentifier => [
        :GroupId => String
        ,:GroupName => String
    ]
    ,:ClassicLinkDnsSupport => [
        :classicLinkDnsSupported => Bool
        ,:vpcId => String
    ]
    ,:ClassicLinkInstance => [
        :groupSet => Vector{GroupIdentifier}
        ,:instanceId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:ClientData => [
        :Comment => String
        ,:UploadEnd => Base.Dates.DateTime
        ,:UploadSize => Float64
        ,:UploadStart => Base.Dates.DateTime
    ]
    ,:DiskImageDetail => [
        :Bytes => Int
        ,:Format => String
        ,:ImportManifestUrl => String
    ]
    ,:DiskImage => [
        :Description => String
        ,:Image => DiskImageDetail
        ,:Volume => VolumeDetail
    ]
    ,:DiskImageDescription => [
        :checksum => String
        ,:format => String
        ,:importManifestUrl => String
        ,:size => Int
    ]
    ,:DiskImageVolumeDescription => [
        :id => String
        ,:size => Int
    ]
    ,:ImportVolumeTaskDetails => [
        :availabilityZone => String
        ,:bytesConverted => Int
        ,:description => String
        ,:image => DiskImageDescription
        ,:volume => DiskImageVolumeDescription
    ]
    ,:ImportInstanceVolumeDetailItem => [
        :availabilityZone => String
        ,:bytesConverted => Int
        ,:description => String
        ,:image => DiskImageDescription
        ,:status => String
        ,:statusMessage => String
        ,:volume => DiskImageVolumeDescription
    ]
    ,:ImportInstanceTaskDetails => [
        :description => String
        ,:instanceId => String
        ,:platform => String
        ,:volumes => Vector{ImportInstanceVolumeDetailItem}
    ]
    ,:ConversionTask => [
        :conversionTaskId => String
        ,:expirationTime => String
        ,:importInstance => ImportInstanceTaskDetails
        ,:importVolume => ImportVolumeTaskDetails
        ,:state => String
        ,:statusMessage => String
        ,:tagSet => Vector{Tag}
    ]
    ,:CreateVolumePermission => [
        :Group => String
        ,:UserId => String
    ]
    ,:CreateVolumePermissionModifications => [
        :Add => Vector{CreateVolumePermission}
        ,:Remove => Vector{CreateVolumePermission}
    ]
    ,:CustomerGateway => [
        :bgpAsn => String
        ,:customerGatewayId => String
        ,:ipAddress => String
        ,:state => String
        ,:tagSet => Vector{Tag}
        ,:_type => String
    ]
    ,:DhcpConfiguration => [
        :key => String
        ,:valueSet => Vector{AttributeValue}
    ]
    ,:DhcpOptions => [
        :dhcpConfigurationSet => Vector{DhcpConfiguration}
        ,:dhcpOptionsId => String
        ,:tagSet => Vector{Tag}
    ]
    ,:EbsInstanceBlockDevice => [
        :attachTime => Base.Dates.DateTime
        ,:deleteOnTermination => Bool
        ,:status => String
        ,:volumeId => String
    ]
    ,:EbsInstanceBlockDeviceSpecification => [
        :DeleteOnTermination => Bool
        ,:VolumeId => String
    ]
    ,:InternetGatewayAttachment => [
        :state => String
        ,:vpcId => String
    ]
    ,:InternetGateway => [
        :attachmentSet => Vector{InternetGatewayAttachment}
        ,:internetGatewayId => String
        ,:tagSet => Vector{Tag}
    ]
    ,:EgressOnlyInternetGateway => [
        :attachmentSet => Vector{InternetGatewayAttachment}
        ,:egressOnlyInternetGatewayId => String
    ]
    ,:EventInformation => [
        :eventDescription => String
        ,:eventSubType => String
        ,:instanceId => String
    ]
    ,:ExportToS3Task => [
        :containerFormat => String
        ,:diskImageFormat => String
        ,:s3Bucket => String
        ,:s3Key => String
    ]
    ,:InstanceCount => [
        :instanceCount => Int
        ,:state => String
    ]
    ,:InstanceExportDetails => [
        :instanceId => String
        ,:targetEnvironment => String
    ]
    ,:InstanceIpv6Address => [
        :Ipv6Address => String
    ]
    ,:ExportTask => [
        :description => String
        ,:exportTaskId => String
        ,:exportToS3 => ExportToS3Task
        ,:instanceExport => InstanceExportDetails
        ,:state => String
        ,:statusMessage => String
    ]
    ,:ExportToS3TaskSpecification => [
        :ContainerFormat => String
        ,:DiskImageFormat => String
        ,:S3Bucket => String
        ,:S3Prefix => String
    ]
    ,:Filter => [
        :Name => String
        ,:Value => Vector{String}
    ]
    ,:FlowLog => [
        :creationTime => Base.Dates.DateTime
        ,:deliverLogsErrorMessage => String
        ,:deliverLogsPermissionArn => String
        ,:deliverLogsStatus => String
        ,:flowLogId => String
        ,:flowLogStatus => String
        ,:logGroupName => String
        ,:resourceId => String
        ,:trafficType => String
    ]
    ,:FpgaImageState => [
        :code => String
        ,:message => String
    ]
    ,:PciId => [
        :DeviceId => String
        ,:SubsystemId => String
        ,:SubsystemVendorId => String
        ,:VendorId => String
    ]
    ,:NewDhcpConfiguration => [
        :Key => String
        ,:Values => Vector{String}
    ]
    ,:PeeringConnectionOptions => [
        :allowDnsResolutionFromRemoteVpc => Bool
        ,:allowEgressFromLocalClassicLinkToRemoteVpc => Bool
        ,:allowEgressFromLocalVpcToRemoteClassicLink => Bool
    ]
    ,:PeeringConnectionOptionsRequest => [
        :AllowDnsResolutionFromRemoteVpc => Bool
        ,:AllowEgressFromLocalClassicLinkToRemoteVpc => Bool
        ,:AllowEgressFromLocalVpcToRemoteClassicLink => Bool
    ]
    ,:Placement => [
        :Affinity => String
        ,:AvailabilityZone => String
        ,:GroupName => String
        ,:HostId => String
        ,:SpreadDomain => String
        ,:Tenancy => String
    ]
    ,:PlacementGroup => [
        :groupName => String
        ,:state => String
        ,:strategy => String
    ]
    ,:PortRange => [
        :From => Int
        ,:To => Int
    ]
    ,:PrefixList => [
        :cidrSet => Vector{String}
        ,:prefixListId => String
        ,:prefixListName => String
    ]
    ,:PrefixListId => [
        :PrefixListId => String
    ]
    ,:PriceSchedule => [
        :active => Bool
        ,:currencyCode => String
        ,:price => Float64
        ,:term => Int
    ]
    ,:PriceScheduleSpecification => [
        :CurrencyCode => String
        ,:Price => Float64
        ,:Term => Int
    ]
    ,:PricingDetail => [
        :count => Int
        ,:price => Float64
    ]
    ,:PrivateIpAddressSpecification => [
        :Primary => Bool
        ,:PrivateIpAddress => String
    ]
    ,:ProductCode => [
        :productCode => String
        ,:_type => String
    ]
    ,:PropagatingVgw => [
        :gatewayId => String
    ]
    ,:ProvisionedBandwidth => [
        :provisioned => String
        ,:provisionTime => Base.Dates.DateTime
        ,:requested => String
        ,:requestTime => Base.Dates.DateTime
        ,:status => String
    ]
    ,:Purchase => [
        :currencyCode => String
        ,:duration => Int
        ,:hostIdSet => Vector{String}
        ,:hostReservationId => String
        ,:hourlyPrice => String
        ,:instanceFamily => String
        ,:paymentOption => String
        ,:upfrontPrice => String
    ]
    ,:PurchaseRequest => [
        :InstanceCount => Int
        ,:PurchaseToken => String
    ]
    ,:RecurringCharge => [
        :amount => Float64
        ,:frequency => String
    ]
    ,:Region => [
        :regionEndpoint => String
        ,:regionName => String
    ]
    ,:FpgaImage => [
        :createTime => Base.Dates.DateTime
        ,:description => String
        ,:fpgaImageGlobalId => String
        ,:fpgaImageId => String
        ,:name => String
        ,:ownerAlias => String
        ,:ownerId => String
        ,:pciId => PciId
        ,:productCodes => Vector{ProductCode}
        ,:shellVersion => String
        ,:state => FpgaImageState
        ,:tags => Vector{Tag}
        ,:updateTime => Base.Dates.DateTime
    ]
    ,:HistoryRecord => [
        :eventInformation => EventInformation
        ,:eventType => String
        ,:timestamp => Base.Dates.DateTime
    ]
    ,:HostInstance => [
        :instanceId => String
        ,:instanceType => String
    ]
    ,:HostOffering => [
        :currencyCode => String
        ,:duration => Int
        ,:hourlyPrice => String
        ,:instanceFamily => String
        ,:offeringId => String
        ,:paymentOption => String
        ,:upfrontPrice => String
    ]
    ,:HostProperties => [
        :cores => Int
        ,:instanceType => String
        ,:sockets => Int
        ,:totalVCpus => Int
    ]
    ,:HostReservation => [
        :count => Int
        ,:currencyCode => String
        ,:duration => Int
        ,:_end => Base.Dates.DateTime
        ,:hostIdSet => Vector{String}
        ,:hostReservationId => String
        ,:hourlyPrice => String
        ,:instanceFamily => String
        ,:offeringId => String
        ,:paymentOption => String
        ,:start => Base.Dates.DateTime
        ,:state => String
        ,:upfrontPrice => String
    ]
    ,:Host => [
        :autoPlacement => String
        ,:availabilityZone => String
        ,:availableCapacity => AvailableCapacity
        ,:clientToken => String
        ,:hostId => String
        ,:hostProperties => HostProperties
        ,:hostReservationId => String
        ,:instances => Vector{HostInstance}
        ,:state => String
    ]
    ,:IamInstanceProfile => [
        :arn => String
        ,:id => String
    ]
    ,:IamInstanceProfileAssociation => [
        :associationId => String
        ,:iamInstanceProfile => IamInstanceProfile
        ,:instanceId => String
        ,:state => String
        ,:timestamp => Base.Dates.DateTime
    ]
    ,:IamInstanceProfileSpecification => [
        :Arn => String
        ,:Name => String
    ]
    ,:IcmpTypeCode => [
        :Code => Int
        ,:_Type => Int
    ]
    ,:IdFormat => [
        :deadline => Base.Dates.DateTime
        ,:resource => String
        ,:useLongIds => Bool
    ]
    ,:StateReason => [
        :code => String
        ,:message => String
    ]
    ,:Image => [
        :architecture => String
        ,:blockDeviceMapping => Vector{BlockDeviceMapping}
        ,:creationDate => String
        ,:description => String
        ,:enaSupport => Bool
        ,:hypervisor => String
        ,:imageId => String
        ,:imageLocation => String
        ,:imageOwnerAlias => String
        ,:imageOwnerId => String
        ,:imageState => String
        ,:imageType => String
        ,:isPublic => Bool
        ,:kernelId => String
        ,:name => String
        ,:platform => String
        ,:productCodes => Vector{ProductCode}
        ,:ramdiskId => String
        ,:rootDeviceName => String
        ,:rootDeviceType => String
        ,:sriovNetSupport => String
        ,:stateReason => StateReason
        ,:tagSet => Vector{Tag}
        ,:virtualizationType => String
    ]
    ,:ImageDiskContainer => [
        :Description => String
        ,:DeviceName => String
        ,:Format => String
        ,:SnapshotId => String
        ,:Url => String
        ,:UserBucket => UserBucket
    ]
    ,:SecurityGroupReference => [
        :groupId => String
        ,:referencingVpcId => String
        ,:vpcPeeringConnectionId => String
    ]
    ,:SlotDateTimeRangeRequest => [
        :EarliestTime => Base.Dates.DateTime
        ,:LatestTime => Base.Dates.DateTime
    ]
    ,:SlotStartTimeRangeRequest => [
        :EarliestTime => Base.Dates.DateTime
        ,:LatestTime => Base.Dates.DateTime
    ]
    ,:Snapshot => [
        :dataEncryptionKeyId => String
        ,:description => String
        ,:encrypted => Bool
        ,:kmsKeyId => String
        ,:ownerAlias => String
        ,:ownerId => String
        ,:progress => String
        ,:snapshotId => String
        ,:startTime => Base.Dates.DateTime
        ,:status => String
        ,:statusMessage => String
        ,:tagSet => Vector{Tag}
        ,:volumeId => String
        ,:volumeSize => Int
    ]
    ,:SnapshotDetail => [
        :description => String
        ,:deviceName => String
        ,:diskImageSize => Float64
        ,:format => String
        ,:progress => String
        ,:snapshotId => String
        ,:status => String
        ,:statusMessage => String
        ,:url => String
        ,:userBucket => UserBucketDetails
    ]
    ,:SnapshotDiskContainer => [
        :Description => String
        ,:Format => String
        ,:Url => String
        ,:UserBucket => UserBucket
    ]
    ,:SnapshotTaskDetail => [
        :description => String
        ,:diskImageSize => Float64
        ,:format => String
        ,:progress => String
        ,:snapshotId => String
        ,:status => String
        ,:statusMessage => String
        ,:url => String
        ,:userBucket => UserBucketDetails
    ]
    ,:ImportImageTask => [
        :architecture => String
        ,:description => String
        ,:hypervisor => String
        ,:imageId => String
        ,:importTaskId => String
        ,:licenseType => String
        ,:platform => String
        ,:progress => String
        ,:snapshotDetailSet => Vector{SnapshotDetail}
        ,:status => String
        ,:statusMessage => String
    ]
    ,:ImportInstanceLaunchSpecification => [
        :AdditionalInfo => String
        ,:Architecture => String
        ,:GroupIds => Vector{String}
        ,:GroupNames => Vector{String}
        ,:InstanceInitiatedShutdownBehavior => String
        ,:InstanceType => String
        ,:Monitoring => Bool
        ,:Placement => Placement
        ,:PrivateIpAddress => String
        ,:SubnetId => String
        ,:UserData => UserData
    ]
    ,:ImportSnapshotTask => [
        :description => String
        ,:importTaskId => String
        ,:snapshotTaskDetail => SnapshotTaskDetail
    ]
    ,:InstanceBlockDeviceMapping => [
        :deviceName => String
        ,:ebs => EbsInstanceBlockDevice
    ]
    ,:InstanceState => [
        :code => Int
        ,:name => String
    ]
    ,:InstanceStateChange => [
        :currentState => InstanceState
        ,:instanceId => String
        ,:previousState => InstanceState
    ]
    ,:IpRange => [
        :CidrIp => String
    ]
    ,:Ipv6CidrBlock => [
        :ipv6CidrBlock => String
    ]
    ,:Ipv6Range => [
        :CidrIpv6 => String
    ]
    ,:KeyPairInfo => [
        :keyFingerprint => String
        ,:keyName => String
    ]
    ,:LaunchPermission => [
        :Group => String
        ,:UserId => String
    ]
    ,:Monitoring => [
        :state => String
    ]
    ,:MovingAddressStatus => [
        :moveStatus => String
        ,:publicIp => String
    ]
    ,:InstanceNetworkInterfaceAssociation => [
        :ipOwnerId => String
        ,:publicDnsName => String
        ,:publicIp => String
    ]
    ,:InstanceNetworkInterfaceAttachment => [
        :attachmentId => String
        ,:attachTime => Base.Dates.DateTime
        ,:deleteOnTermination => Bool
        ,:deviceIndex => Int
        ,:status => String
    ]
    ,:InstancePrivateIpAddress => [
        :association => InstanceNetworkInterfaceAssociation
        ,:primary => Bool
        ,:privateDnsName => String
        ,:privateIpAddress => String
    ]
    ,:InstanceNetworkInterface => [
        :association => InstanceNetworkInterfaceAssociation
        ,:attachment => InstanceNetworkInterfaceAttachment
        ,:description => String
        ,:groupSet => Vector{GroupIdentifier}
        ,:ipv6AddressesSet => Vector{InstanceIpv6Address}
        ,:macAddress => String
        ,:networkInterfaceId => String
        ,:ownerId => String
        ,:privateDnsName => String
        ,:privateIpAddress => String
        ,:privateIpAddressesSet => Vector{InstancePrivateIpAddress}
        ,:sourceDestCheck => Bool
        ,:status => String
        ,:subnetId => String
        ,:vpcId => String
    ]
    ,:Instance => [
        :amiLaunchIndex => Int
        ,:architecture => String
        ,:blockDeviceMapping => Vector{InstanceBlockDeviceMapping}
        ,:clientToken => String
        ,:dnsName => String
        ,:ebsOptimized => Bool
        ,:enaSupport => Bool
        ,:groupSet => Vector{GroupIdentifier}
        ,:hypervisor => String
        ,:iamInstanceProfile => IamInstanceProfile
        ,:imageId => String
        ,:instanceId => String
        ,:instanceLifecycle => String
        ,:instanceState => InstanceState
        ,:instanceType => String
        ,:ipAddress => String
        ,:kernelId => String
        ,:keyName => String
        ,:launchTime => Base.Dates.DateTime
        ,:monitoring => Monitoring
        ,:networkInterfaceSet => Vector{InstanceNetworkInterface}
        ,:placement => Placement
        ,:platform => String
        ,:privateDnsName => String
        ,:privateIpAddress => String
        ,:productCodes => Vector{ProductCode}
        ,:ramdiskId => String
        ,:reason => String
        ,:rootDeviceName => String
        ,:rootDeviceType => String
        ,:sourceDestCheck => Bool
        ,:spotInstanceRequestId => String
        ,:sriovNetSupport => String
        ,:stateReason => StateReason
        ,:subnetId => String
        ,:tagSet => Vector{Tag}
        ,:virtualizationType => String
        ,:vpcId => String
    ]
    ,:InstanceBlockDeviceMappingSpecification => [
        :DeviceName => String
        ,:Ebs => EbsInstanceBlockDeviceSpecification
        ,:NoDevice => String
        ,:VirtualName => String
    ]
    ,:InstanceMonitoring => [
        :instanceId => String
        ,:monitoring => Monitoring
    ]
    ,:InstanceNetworkInterfaceSpecification => [
        :AssociatePublicIpAddress => Bool
        ,:DeleteOnTermination => Bool
        ,:Description => String
        ,:DeviceIndex => Int
        ,:Ipv6AddressCount => Int
        ,:Ipv6Addresses => Vector{InstanceIpv6Address}
        ,:NetworkInterfaceId => String
        ,:PrivateIpAddress => String
        ,:PrivateIpAddresses => Vector{PrivateIpAddressSpecification}
        ,:SecondaryPrivateIpAddressCount => Int
        ,:Groups => Vector{String}
        ,:SubnetId => String
    ]
    ,:InstanceStatusDetails => [
        :impairedSince => Base.Dates.DateTime
        ,:name => String
        ,:status => String
    ]
    ,:InstanceStatusEvent => [
        :code => String
        ,:description => String
        ,:notAfter => Base.Dates.DateTime
        ,:notBefore => Base.Dates.DateTime
    ]
    ,:InstanceStatusSummary => [
        :details => Vector{InstanceStatusDetails}
        ,:status => String
    ]
    ,:InstanceStatus => [
        :availabilityZone => String
        ,:eventsSet => Vector{InstanceStatusEvent}
        ,:instanceId => String
        ,:instanceState => InstanceState
        ,:instanceStatus => InstanceStatusSummary
        ,:systemStatus => InstanceStatusSummary
    ]
    ,:IpPermission => [
        :FromPort => Int
        ,:UserIdGroupPairs => Vector{UserIdGroupPair}
        ,:IpProtocol => String
        ,:IpRanges => Vector{IpRange}
        ,:Ipv6Ranges => Vector{Ipv6Range}
        ,:PrefixListIds => Vector{PrefixListId}
        ,:ToPort => Int
    ]
    ,:LaunchPermissionModifications => [
        :Add => Vector{LaunchPermission}
        ,:Remove => Vector{LaunchPermission}
    ]
    ,:Route => [
        :destinationCidrBlock => String
        ,:destinationIpv6CidrBlock => String
        ,:destinationPrefixListId => String
        ,:egressOnlyInternetGatewayId => String
        ,:gatewayId => String
        ,:instanceId => String
        ,:instanceOwnerId => String
        ,:natGatewayId => String
        ,:networkInterfaceId => String
        ,:origin => String
        ,:state => String
        ,:vpcPeeringConnectionId => String
    ]
    ,:RouteTableAssociation => [
        :main => Bool
        ,:routeTableAssociationId => String
        ,:routeTableId => String
        ,:subnetId => String
    ]
    ,:RouteTable => [
        :associationSet => Vector{RouteTableAssociation}
        ,:propagatingVgwSet => Vector{PropagatingVgw}
        ,:routeSet => Vector{Route}
        ,:routeTableId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:LaunchSpecification => [
        :addressingType => String
        ,:blockDeviceMapping => Vector{BlockDeviceMapping}
        ,:ebsOptimized => Bool
        ,:groupSet => Vector{GroupIdentifier}
        ,:iamInstanceProfile => IamInstanceProfileSpecification
        ,:imageId => String
        ,:instanceType => String
        ,:kernelId => String
        ,:keyName => String
        ,:monitoring => RunInstancesMonitoringEnabled
        ,:networkInterfaceSet => Vector{InstanceNetworkInterfaceSpecification}
        ,:placement => SpotPlacement
        ,:ramdiskId => String
        ,:subnetId => String
        ,:userData => String
    ]
    ,:NatGatewayAddress => [
        :allocationId => String
        ,:networkInterfaceId => String
        ,:privateIp => String
        ,:publicIp => String
    ]
    ,:NatGateway => [
        :createTime => Base.Dates.DateTime
        ,:deleteTime => Base.Dates.DateTime
        ,:failureCode => String
        ,:failureMessage => String
        ,:natGatewayAddressSet => Vector{NatGatewayAddress}
        ,:natGatewayId => String
        ,:provisionedBandwidth => ProvisionedBandwidth
        ,:state => String
        ,:subnetId => String
        ,:vpcId => String
    ]
    ,:NetworkAclAssociation => [
        :networkAclAssociationId => String
        ,:networkAclId => String
        ,:subnetId => String
    ]
    ,:NetworkAclEntry => [
        :cidrBlock => String
        ,:egress => Bool
        ,:icmpTypeCode => IcmpTypeCode
        ,:ipv6CidrBlock => String
        ,:portRange => PortRange
        ,:protocol => String
        ,:ruleAction => String
        ,:ruleNumber => Int
    ]
    ,:NetworkAcl => [
        :associationSet => Vector{NetworkAclAssociation}
        ,:default => Bool
        ,:entrySet => Vector{NetworkAclEntry}
        ,:networkAclId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:NetworkInterfaceAssociation => [
        :allocationId => String
        ,:associationId => String
        ,:ipOwnerId => String
        ,:publicDnsName => String
        ,:publicIp => String
    ]
    ,:NetworkInterfaceAttachment => [
        :attachmentId => String
        ,:attachTime => Base.Dates.DateTime
        ,:deleteOnTermination => Bool
        ,:deviceIndex => Int
        ,:instanceId => String
        ,:instanceOwnerId => String
        ,:status => String
    ]
    ,:NetworkInterfaceAttachmentChanges => [
        :AttachmentId => String
        ,:DeleteOnTermination => Bool
    ]
    ,:NetworkInterfaceIpv6Address => [
        :ipv6Address => String
    ]
    ,:NetworkInterfacePermissionState => [
        :state => String
        ,:statusMessage => String
    ]
    ,:NetworkInterfacePermission => [
        :awsAccountId => String
        ,:awsService => String
        ,:networkInterfaceId => String
        ,:networkInterfacePermissionId => String
        ,:permission => String
        ,:permissionState => NetworkInterfacePermissionState
    ]
    ,:NetworkInterfacePrivateIpAddress => [
        :association => NetworkInterfaceAssociation
        ,:primary => Bool
        ,:privateDnsName => String
        ,:privateIpAddress => String
    ]
    ,:NetworkInterface => [
        :association => NetworkInterfaceAssociation
        ,:attachment => NetworkInterfaceAttachment
        ,:availabilityZone => String
        ,:description => String
        ,:groupSet => Vector{GroupIdentifier}
        ,:interfaceType => String
        ,:ipv6AddressesSet => Vector{NetworkInterfaceIpv6Address}
        ,:macAddress => String
        ,:networkInterfaceId => String
        ,:ownerId => String
        ,:privateDnsName => String
        ,:privateIpAddress => String
        ,:privateIpAddressesSet => Vector{NetworkInterfacePrivateIpAddress}
        ,:requesterId => String
        ,:requesterManaged => Bool
        ,:sourceDestCheck => Bool
        ,:status => String
        ,:subnetId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:RequestSpotLaunchSpecification => [
        :AddressingType => String
        ,:BlockDeviceMappings => Vector{BlockDeviceMapping}
        ,:EbsOptimized => Bool
        ,:IamInstanceProfile => IamInstanceProfileSpecification
        ,:ImageId => String
        ,:InstanceType => String
        ,:KernelId => String
        ,:KeyName => String
        ,:Monitoring => RunInstancesMonitoringEnabled
        ,:NetworkInterfaces => Vector{InstanceNetworkInterfaceSpecification}
        ,:Placement => SpotPlacement
        ,:RamdiskId => String
        ,:SecurityGroups => Vector{String}
        ,:SecurityGroupIds => Vector{String}
        ,:SubnetId => String
        ,:UserData => String
    ]
    ,:Reservation => [
        :groupSet => Vector{GroupIdentifier}
        ,:instancesSet => Vector{Instance}
        ,:ownerId => String
        ,:requesterId => String
        ,:reservationId => String
    ]
    ,:ReservationValue => [
        :hourlyPrice => String
        ,:remainingTotalValue => String
        ,:remainingUpfrontValue => String
    ]
    ,:ReservedInstanceLimitPrice => [
        :Amount => Float64
        ,:CurrencyCode => String
    ]
    ,:ReservedInstanceReservationValue => [
        :reservationValue => ReservationValue
        ,:reservedInstanceId => String
    ]
    ,:ReservedInstances => [
        :availabilityZone => String
        ,:currencyCode => String
        ,:duration => Int
        ,:_end => Base.Dates.DateTime
        ,:fixedPrice => Float64
        ,:instanceCount => Int
        ,:instanceTenancy => String
        ,:instanceType => String
        ,:offeringClass => String
        ,:offeringType => String
        ,:productDescription => String
        ,:recurringCharges => Vector{RecurringCharge}
        ,:reservedInstancesId => String
        ,:scope => String
        ,:start => Base.Dates.DateTime
        ,:state => String
        ,:tagSet => Vector{Tag}
        ,:usagePrice => Float64
    ]
    ,:ReservedInstancesConfiguration => [
        :AvailabilityZone => String
        ,:InstanceCount => Int
        ,:InstanceType => String
        ,:Platform => String
        ,:Scope => String
    ]
    ,:ReservedInstancesId => [
        :reservedInstancesId => String
    ]
    ,:ReservedInstancesListing => [
        :clientToken => String
        ,:createDate => Base.Dates.DateTime
        ,:instanceCounts => Vector{InstanceCount}
        ,:priceSchedules => Vector{PriceSchedule}
        ,:reservedInstancesId => String
        ,:reservedInstancesListingId => String
        ,:status => String
        ,:statusMessage => String
        ,:tagSet => Vector{Tag}
        ,:updateDate => Base.Dates.DateTime
    ]
    ,:ReservedInstancesModificationResult => [
        :reservedInstancesId => String
        ,:targetConfiguration => ReservedInstancesConfiguration
    ]
    ,:ReservedInstancesModification => [
        :clientToken => String
        ,:createDate => Base.Dates.DateTime
        ,:effectiveDate => Base.Dates.DateTime
        ,:modificationResultSet => Vector{ReservedInstancesModificationResult}
        ,:reservedInstancesModificationId => String
        ,:reservedInstancesSet => Vector{ReservedInstancesId}
        ,:status => String
        ,:statusMessage => String
        ,:updateDate => Base.Dates.DateTime
    ]
    ,:ReservedInstancesOffering => [
        :availabilityZone => String
        ,:currencyCode => String
        ,:duration => Int
        ,:fixedPrice => Float64
        ,:instanceTenancy => String
        ,:instanceType => String
        ,:marketplace => Bool
        ,:offeringClass => String
        ,:offeringType => String
        ,:pricingDetailsSet => Vector{PricingDetail}
        ,:productDescription => String
        ,:recurringCharges => Vector{RecurringCharge}
        ,:reservedInstancesOfferingId => String
        ,:scope => String
        ,:usagePrice => Float64
    ]
    ,:ScheduledInstanceRecurrence => [
        :frequency => String
        ,:interval => Int
        ,:occurrenceDaySet => Vector{Int}
        ,:occurrenceRelativeToEnd => Bool
        ,:occurrenceUnit => String
    ]
    ,:ScheduledInstanceRecurrenceRequest => [
        :Frequency => String
        ,:Interval => Int
        ,:OccurrenceDays => Vector{Int}
        ,:OccurrenceRelativeToEnd => Bool
        ,:OccurrenceUnit => String
    ]
    ,:ScheduledInstance => [
        :availabilityZone => String
        ,:createDate => Base.Dates.DateTime
        ,:hourlyPrice => String
        ,:instanceCount => Int
        ,:instanceType => String
        ,:networkPlatform => String
        ,:nextSlotStartTime => Base.Dates.DateTime
        ,:platform => String
        ,:previousSlotEndTime => Base.Dates.DateTime
        ,:recurrence => ScheduledInstanceRecurrence
        ,:scheduledInstanceId => String
        ,:slotDurationInHours => Int
        ,:termEndDate => Base.Dates.DateTime
        ,:termStartDate => Base.Dates.DateTime
        ,:totalScheduledInstanceHours => Int
    ]
    ,:ScheduledInstanceAvailability => [
        :availabilityZone => String
        ,:availableInstanceCount => Int
        ,:firstSlotStartTime => Base.Dates.DateTime
        ,:hourlyPrice => String
        ,:instanceType => String
        ,:maxTermDurationInDays => Int
        ,:minTermDurationInDays => Int
        ,:networkPlatform => String
        ,:platform => String
        ,:purchaseToken => String
        ,:recurrence => ScheduledInstanceRecurrence
        ,:slotDurationInHours => Int
        ,:totalScheduledInstanceHours => Int
    ]
    ,:ScheduledInstancesEbs => [
        :DeleteOnTermination => Bool
        ,:Encrypted => Bool
        ,:Iops => Int
        ,:SnapshotId => String
        ,:VolumeSize => Int
        ,:VolumeType => String
    ]
    ,:ScheduledInstancesBlockDeviceMapping => [
        :DeviceName => String
        ,:Ebs => ScheduledInstancesEbs
        ,:NoDevice => String
        ,:VirtualName => String
    ]
    ,:ScheduledInstancesIamInstanceProfile => [
        :Arn => String
        ,:Name => String
    ]
    ,:ScheduledInstancesIpv6Address => [
        :Ipv6Address => String
    ]
    ,:ScheduledInstancesPlacement => [
        :AvailabilityZone => String
        ,:GroupName => String
    ]
    ,:ScheduledInstancesPrivateIpAddressConfig => [
        :Primary => Bool
        ,:PrivateIpAddress => String
    ]
    ,:ScheduledInstancesMonitoring => [
        :Enabled => Bool
    ]
    ,:ScheduledInstancesNetworkInterface => [
        :AssociatePublicIpAddress => Bool
        ,:DeleteOnTermination => Bool
        ,:Description => String
        ,:DeviceIndex => Int
        ,:Groups => Vector{String}
        ,:Ipv6Addresses => Vector{ScheduledInstancesIpv6Address}
        ,:Ipv6AddressCount => Int
        ,:NetworkInterfaceId => String
        ,:PrivateIpAddress => String
        ,:PrivateIpAddressConfigs => Vector{ScheduledInstancesPrivateIpAddressConfig}
        ,:SecondaryPrivateIpAddressCount => Int
        ,:SubnetId => String
    ]
    ,:ScheduledInstancesLaunchSpecification => [
        :BlockDeviceMappings => Vector{ScheduledInstancesBlockDeviceMapping}
        ,:EbsOptimized => Bool
        ,:IamInstanceProfile => ScheduledInstancesIamInstanceProfile
        ,:ImageId => String
        ,:InstanceType => String
        ,:KernelId => String
        ,:KeyName => String
        ,:Monitoring => ScheduledInstancesMonitoring
        ,:NetworkInterfaces => Vector{ScheduledInstancesNetworkInterface}
        ,:Placement => ScheduledInstancesPlacement
        ,:RamdiskId => String
        ,:SecurityGroupIds => Vector{String}
        ,:SubnetId => String
        ,:UserData => String
    ]
    ,:SecurityGroup => [
        :groupDescription => String
        ,:groupId => String
        ,:groupName => String
        ,:ipPermissions => Vector{IpPermission}
        ,:ipPermissionsEgress => Vector{IpPermission}
        ,:ownerId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:SpotFleetMonitoring => [
        :Enabled => Bool
    ]
    ,:SpotDatafeedSubscription => [
        :bucket => String
        ,:fault => SpotInstanceStateFault
        ,:ownerId => String
        ,:prefix => String
        ,:state => String
    ]
    ,:SpotFleetLaunchSpecification => [
        :AddressingType => String
        ,:BlockDeviceMappings => Vector{BlockDeviceMapping}
        ,:EbsOptimized => Bool
        ,:SecurityGroups => Vector{GroupIdentifier}
        ,:IamInstanceProfile => IamInstanceProfileSpecification
        ,:ImageId => String
        ,:InstanceType => String
        ,:KernelId => String
        ,:KeyName => String
        ,:Monitoring => SpotFleetMonitoring
        ,:NetworkInterfaces => Vector{InstanceNetworkInterfaceSpecification}
        ,:Placement => SpotPlacement
        ,:RamdiskId => String
        ,:SpotPrice => String
        ,:SubnetId => String
        ,:UserData => String
        ,:WeightedCapacity => Float64
    ]
    ,:SpotFleetRequestConfigData => [
        :AllocationStrategy => String
        ,:ClientToken => String
        ,:ExcessCapacityTerminationPolicy => String
        ,:FulfilledCapacity => Float64
        ,:IamFleetRole => String
        ,:LaunchSpecifications => Vector{SpotFleetLaunchSpecification}
        ,:ReplaceUnhealthyInstances => Bool
        ,:SpotPrice => String
        ,:TargetCapacity => Int
        ,:TerminateInstancesWithExpiration => Bool
        ,:_Type => String
        ,:ValidFrom => Base.Dates.DateTime
        ,:ValidUntil => Base.Dates.DateTime
    ]
    ,:SpotFleetRequestConfig => [
        :activityStatus => String
        ,:createTime => Base.Dates.DateTime
        ,:spotFleetRequestConfig => SpotFleetRequestConfigData
        ,:spotFleetRequestId => String
        ,:spotFleetRequestState => String
    ]
    ,:SpotInstanceRequest => [
        :actualBlockHourlyPrice => String
        ,:availabilityZoneGroup => String
        ,:blockDurationMinutes => Int
        ,:createTime => Base.Dates.DateTime
        ,:fault => SpotInstanceStateFault
        ,:instanceId => String
        ,:launchedAvailabilityZone => String
        ,:launchGroup => String
        ,:launchSpecification => LaunchSpecification
        ,:productDescription => String
        ,:spotInstanceRequestId => String
        ,:spotPrice => String
        ,:state => String
        ,:status => SpotInstanceStatus
        ,:tagSet => Vector{Tag}
        ,:_type => String
        ,:validFrom => Base.Dates.DateTime
        ,:validUntil => Base.Dates.DateTime
    ]
    ,:StaleIpPermission => [
        :fromPort => Int
        ,:groups => Vector{UserIdGroupPair}
        ,:ipProtocol => String
        ,:ipRanges => Vector{String}
        ,:prefixListIds => Vector{String}
        ,:toPort => Int
    ]
    ,:StaleSecurityGroup => [
        :description => String
        ,:groupId => String
        ,:groupName => String
        ,:staleIpPermissions => Vector{StaleIpPermission}
        ,:staleIpPermissionsEgress => Vector{StaleIpPermission}
        ,:vpcId => String
    ]
    ,:SubnetCidrBlockState => [
        :state => String
        ,:statusMessage => String
    ]
    ,:SubnetIpv6CidrBlockAssociation => [
        :associationId => String
        ,:ipv6CidrBlock => String
        ,:ipv6CidrBlockState => SubnetCidrBlockState
    ]
    ,:TargetConfiguration => [
        :instanceCount => Int
        ,:offeringId => String
    ]
    ,:TargetConfigurationRequest => [
        :InstanceCount => Int
        ,:OfferingId => String
    ]
    ,:Subnet => [
        :assignIpv6AddressOnCreation => Bool
        ,:availabilityZone => String
        ,:availableIpAddressCount => Int
        ,:cidrBlock => String
        ,:defaultForAz => Bool
        ,:ipv6CidrBlockAssociationSet => Vector{SubnetIpv6CidrBlockAssociation}
        ,:mapPublicIpOnLaunch => Bool
        ,:state => String
        ,:subnetId => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:TargetReservationValue => [
        :reservationValue => ReservationValue
        ,:targetConfiguration => TargetConfiguration
    ]
    ,:VpcAttachment => [
        :state => String
        ,:vpcId => String
    ]
    ,:VpcCidrBlockState => [
        :state => String
        ,:statusMessage => String
    ]
    ,:VpcClassicLink => [
        :classicLinkEnabled => Bool
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:VpcEndpoint => [
        :creationTimestamp => Base.Dates.DateTime
        ,:policyDocument => String
        ,:routeTableIdSet => Vector{String}
        ,:serviceName => String
        ,:state => String
        ,:vpcEndpointId => String
        ,:vpcId => String
    ]
    ,:VpcPeeringConnectionStateReason => [
        :code => String
        ,:message => String
    ]
    ,:VpnConnectionOptions => [
        :staticRoutesOnly => Bool
    ]
    ,:VpnConnectionOptionsSpecification => [
        :StaticRoutesOnly => Bool
    ]
    ,:VpnStaticRoute => [
        :destinationCidrBlock => String
        ,:source => String
        ,:state => String
    ]
    ,:VpcIpv6CidrBlockAssociation => [
        :associationId => String
        ,:ipv6CidrBlock => String
        ,:ipv6CidrBlockState => VpcCidrBlockState
    ]
    ,:Vpc => [
        :cidrBlock => String
        ,:dhcpOptionsId => String
        ,:instanceTenancy => String
        ,:ipv6CidrBlockAssociationSet => Vector{VpcIpv6CidrBlockAssociation}
        ,:isDefault => Bool
        ,:state => String
        ,:tagSet => Vector{Tag}
        ,:vpcId => String
    ]
    ,:VpcPeeringConnectionOptionsDescription => [
        :allowDnsResolutionFromRemoteVpc => Bool
        ,:allowEgressFromLocalClassicLinkToRemoteVpc => Bool
        ,:allowEgressFromLocalVpcToRemoteClassicLink => Bool
    ]
    ,:VpcPeeringConnectionVpcInfo => [
        :cidrBlock => String
        ,:ipv6CidrBlockSet => Vector{Ipv6CidrBlock}
        ,:ownerId => String
        ,:peeringOptions => VpcPeeringConnectionOptionsDescription
        ,:vpcId => String
    ]
    ,:VpcPeeringConnection => [
        :accepterVpcInfo => VpcPeeringConnectionVpcInfo
        ,:expirationTime => Base.Dates.DateTime
        ,:requesterVpcInfo => VpcPeeringConnectionVpcInfo
        ,:status => VpcPeeringConnectionStateReason
        ,:tagSet => Vector{Tag}
        ,:vpcPeeringConnectionId => String
    ]
    ,:VpnConnection => [
        :customerGatewayConfiguration => String
        ,:customerGatewayId => String
        ,:options => VpnConnectionOptions
        ,:routes => Vector{VpnStaticRoute}
        ,:state => String
        ,:tagSet => Vector{Tag}
        ,:_type => String
        ,:vgwTelemetry => Vector{VgwTelemetry}
        ,:vpnConnectionId => String
        ,:vpnGatewayId => String
    ]
    ,:VpnGateway => [
        :attachments => Vector{VpcAttachment}
        ,:availabilityZone => String
        ,:state => String
        ,:tagSet => Vector{Tag}
        ,:_type => String
        ,:vpnGatewayId => String
    ]
]

const EC2Api = Dict(
    :ModifyHosts => Dict(
        :Result => [
            :requestId => String
            ,:successful => Vector{String}
            ,:unsuccessful => Vector{UnsuccessfulItem}
        ]
        ,:Request => [
            :AutoPlacement => String
            ,:HostId => Vector{String}
        ]
    )
    ,:StartInstances => Dict(
        :Result => [
            :instancesSet => Vector{InstanceStateChange}
            ,:requestId => String
        ]
        ,:Request => [
            :AdditionalInfo => String
            ,:DryRun => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:DetachInternetGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InternetGatewayId => String
            ,:VpcId => String
        ]
    )
    ,:DescribeIamInstanceProfileAssociations => Dict(
        :Result => [
            :iamInstanceProfileAssociationSet => Vector{IamInstanceProfileAssociation}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :AssociationId => Vector{String}
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:DescribeVolumeAttribute => Dict(
        :Result => [
            :autoEnableIO => AttributeBooleanValue
            ,:productCodes => Vector{ProductCode}
            ,:requestId => String
            ,:volumeId => String
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:VolumeId => String
        ]
    )
    ,:GetReservedInstancesExchangeQuote => Dict(
        :Result => [
            :currencyCode => String
            ,:isValidExchange => Bool
            ,:outputReservedInstancesWillExpireAt => Base.Dates.DateTime
            ,:paymentDue => String
            ,:requestId => String
            ,:reservedInstanceValueRollup => ReservationValue
            ,:reservedInstanceValueSet => Vector{ReservedInstanceReservationValue}
            ,:targetConfigurationValueRollup => ReservationValue
            ,:targetConfigurationValueSet => Vector{TargetReservationValue}
            ,:validationFailureReason => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ReservedInstanceId => Vector{String}
            ,:TargetConfiguration => Vector{TargetConfigurationRequest}
        ]
    )
    ,:ReplaceRoute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DestinationCidrBlock => String
            ,:DestinationIpv6CidrBlock => String
            ,:DryRun => Bool
            ,:EgressOnlyInternetGatewayId => String
            ,:GatewayId => String
            ,:InstanceId => String
            ,:NatGatewayId => String
            ,:NetworkInterfaceId => String
            ,:RouteTableId => String
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:RegisterImage => Dict(
        :Result => [
            :imageId => String
            ,:requestId => String
        ]
        ,:Request => [
            :Architecture => String
            ,:BillingProduct => Vector{String}
            ,:BlockDeviceMapping => Vector{BlockDeviceMapping}
            ,:Description => String
            ,:DryRun => Bool
            ,:EnaSupport => Bool
            ,:ImageLocation => String
            ,:KernelId => String
            ,:Name => String
            ,:RamdiskId => String
            ,:RootDeviceName => String
            ,:SriovNetSupport => String
            ,:VirtualizationType => String
        ]
    )
    ,:DescribeNetworkInterfaceAttribute => Dict(
        :Result => [
            :attachment => NetworkInterfaceAttachment
            ,:description => AttributeValue
            ,:groupSet => Vector{GroupIdentifier}
            ,:networkInterfaceId => String
            ,:requestId => String
            ,:sourceDestCheck => AttributeBooleanValue
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:NetworkInterfaceId => String
        ]
    )
    ,:RevokeSecurityGroupIngress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrIp => String
            ,:DryRun => Bool
            ,:FromPort => Int
            ,:GroupId => String
            ,:GroupName => String
            ,:IpPermissions => Vector{IpPermission}
            ,:IpProtocol => String
            ,:SourceSecurityGroupName => String
            ,:SourceSecurityGroupOwnerId => String
            ,:ToPort => Int
        ]
    )
    ,:CreateSpotDatafeedSubscription => Dict(
        :Result => [
            :requestId => String
            ,:spotDatafeedSubscription => SpotDatafeedSubscription
        ]
        ,:Request => [
            :Bucket => String
            ,:DryRun => Bool
            ,:Prefix => String
        ]
    )
    ,:DeleteNetworkAclEntry => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Egress => Bool
            ,:NetworkAclId => String
            ,:RuleNumber => Int
        ]
    )
    ,:DetachClassicLinkVpc => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
            ,:VpcId => String
        ]
    )
    ,:CreateKeyPair => Dict(
        :Result => [
            :keyFingerprint => String
            ,:keyMaterial => String
            ,:keyName => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:KeyName => String
        ]
    )
    ,:DeleteVpcEndpoints => Dict(
        :Result => [
            :requestId => String
            ,:unsuccessful => Vector{UnsuccessfulItem}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcEndpointId => Vector{String}
        ]
    )
    ,:ReplaceNetworkAclAssociation => Dict(
        :Result => [
            :newAssociationId => String
            ,:requestId => String
        ]
        ,:Request => [
            :AssociationId => String
            ,:DryRun => Bool
            ,:NetworkAclId => String
        ]
    )
    ,:ReplaceNetworkAclEntry => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrBlock => String
            ,:DryRun => Bool
            ,:Egress => Bool
            ,:Icmp => IcmpTypeCode
            ,:Ipv6CidrBlock => String
            ,:NetworkAclId => String
            ,:PortRange => PortRange
            ,:Protocol => String
            ,:RuleAction => String
            ,:RuleNumber => Int
        ]
    )
    ,:DescribeSnapshots => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:snapshotSet => Vector{Snapshot}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:Owner => Vector{String}
            ,:RestorableBy => Vector{String}
            ,:SnapshotId => Vector{String}
        ]
    )
    ,:ResetNetworkInterfaceAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:NetworkInterfaceId => String
            ,:SourceDestCheck => String
        ]
    )
    ,:ModifyImageAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:Description => AttributeValue
            ,:DryRun => Bool
            ,:ImageId => String
            ,:LaunchPermission => LaunchPermissionModifications
            ,:OperationType => String
            ,:ProductCode => Vector{String}
            ,:UserGroup => Vector{String}
            ,:UserId => Vector{String}
            ,:Value => String
        ]
    )
    ,:AssociateSubnetCidrBlock => Dict(
        :Result => [
            :ipv6CidrBlockAssociation => SubnetIpv6CidrBlockAssociation
            ,:requestId => String
            ,:subnetId => String
        ]
        ,:Request => [
            :Ipv6CidrBlock => String
            ,:SubnetId => String
        ]
    )
    ,:DeleteSpotDatafeedSubscription => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
        ]
    )
    ,:DescribeIdFormat => Dict(
        :Result => [
            :requestId => String
            ,:statusSet => Vector{IdFormat}
        ]
        ,:Request => [
            :Resource => String
        ]
    )
    ,:UnassignIpv6Addresses => Dict(
        :Result => [
            :networkInterfaceId => String
            ,:requestId => String
            ,:unassignedIpv6Addresses => Vector{String}
        ]
        ,:Request => [
            :Ipv6Addresses => Vector{String}
            ,:NetworkInterfaceId => String
        ]
    )
    ,:ImportInstance => Dict(
        :Result => [
            :conversionTask => ConversionTask
            ,:requestId => String
        ]
        ,:Request => [
            :Description => String
            ,:DiskImage => Vector{DiskImage}
            ,:DryRun => Bool
            ,:LaunchSpecification => ImportInstanceLaunchSpecification
            ,:Platform => String
        ]
    )
    ,:CancelSpotFleetRequests => Dict(
        :Result => [
            :requestId => String
            ,:successfulFleetRequestSet => Vector{CancelSpotFleetRequestsSuccessItem}
            ,:unsuccessfulFleetRequestSet => Vector{CancelSpotFleetRequestsErrorItem}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:SpotFleetRequestId => Vector{String}
            ,:TerminateInstances => Bool
        ]
    )
    ,:DeletePlacementGroup => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:GroupName => String
        ]
    )
    ,:DescribeVpcClassicLinkDnsSupport => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:vpcs => Vector{ClassicLinkDnsSupport}
        ]
        ,:Request => [
            :MaxResults => Int
            ,:NextToken => String
            ,:VpcIds => Vector{String}
        ]
    )
    ,:CreateImage => Dict(
        :Result => [
            :imageId => String
            ,:requestId => String
        ]
        ,:Request => [
            :BlockDeviceMapping => Vector{BlockDeviceMapping}
            ,:Description => String
            ,:DryRun => Bool
            ,:InstanceId => String
            ,:Name => String
            ,:NoReboot => Bool
        ]
    )
    ,:DescribeTags => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:tagSet => Vector{TagDescription}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:CreateCustomerGateway => Dict(
        :Result => [
            :customerGateway => CustomerGateway
            ,:requestId => String
        ]
        ,:Request => [
            :BgpAsn => Int
            ,:DryRun => Bool
            ,:IpAddress => String
            ,:_Type => String
        ]
    )
    ,:ReleaseHosts => Dict(
        :Result => [
            :requestId => String
            ,:successful => Vector{String}
            ,:unsuccessful => Vector{UnsuccessfulItem}
        ]
        ,:Request => [
            :HostId => Vector{String}
        ]
    )
    ,:CreateVpc => Dict(
        :Result => [
            :requestId => String
            ,:vpc => Vpc
        ]
        ,:Request => [
            :AmazonProvidedIpv6CidrBlock => Bool
            ,:CidrBlock => String
            ,:DryRun => Bool
            ,:InstanceTenancy => String
        ]
    )
    ,:DeleteSnapshot => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:SnapshotId => String
        ]
    )
    ,:CreateNetworkAclEntry => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrBlock => String
            ,:DryRun => Bool
            ,:Egress => Bool
            ,:Icmp => IcmpTypeCode
            ,:Ipv6CidrBlock => String
            ,:NetworkAclId => String
            ,:PortRange => PortRange
            ,:Protocol => String
            ,:RuleAction => String
            ,:RuleNumber => Int
        ]
    )
    ,:DescribeNetworkInterfaces => Dict(
        :Result => [
            :networkInterfaceSet => Vector{NetworkInterface}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:NetworkInterfaceId => Vector{String}
        ]
    )
    ,:GetConsoleOutput => Dict(
        :Result => [
            :instanceId => String
            ,:output => String
            ,:requestId => String
            ,:timestamp => Base.Dates.DateTime
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
        ]
    )
    ,:DeleteNetworkInterface => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:NetworkInterfaceId => String
        ]
    )
    ,:CreatePlacementGroup => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:GroupName => String
            ,:Strategy => String
        ]
    )
    ,:RequestSpotInstances => Dict(
        :Result => [
            :requestId => String
            ,:spotInstanceRequestSet => Vector{SpotInstanceRequest}
        ]
        ,:Request => [
            :AvailabilityZoneGroup => String
            ,:BlockDurationMinutes => Int
            ,:ClientToken => String
            ,:DryRun => Bool
            ,:InstanceCount => Int
            ,:LaunchGroup => String
            ,:LaunchSpecification => RequestSpotLaunchSpecification
            ,:SpotPrice => String
            ,:_Type => String
            ,:ValidFrom => Base.Dates.DateTime
            ,:ValidUntil => Base.Dates.DateTime
        ]
    )
    ,:DescribeAccountAttributes => Dict(
        :Result => [
            :accountAttributeSet => Vector{AccountAttribute}
            ,:requestId => String
        ]
        ,:Request => [
            :AttributeName => Vector{String}
            ,:DryRun => Bool
        ]
    )
    ,:ModifyIdFormat => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Resource => String
            ,:UseLongIds => Bool
        ]
    )
    ,:AssociateDhcpOptions => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DhcpOptionsId => String
            ,:DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:DescribeRouteTables => Dict(
        :Result => [
            :requestId => String
            ,:routeTableSet => Vector{RouteTable}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:RouteTableId => Vector{String}
        ]
    )
    ,:DeleteVpnConnection => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpnConnectionId => String
        ]
    )
    ,:CreateFlowLogs => Dict(
        :Result => [
            :clientToken => String
            ,:flowLogIdSet => Vector{String}
            ,:requestId => String
            ,:unsuccessful => Vector{UnsuccessfulItem}
        ]
        ,:Request => [
            :ClientToken => String
            ,:DeliverLogsPermissionArn => String
            ,:LogGroupName => String
            ,:ResourceId => Vector{String}
            ,:ResourceType => String
            ,:TrafficType => String
        ]
    )
    ,:RestoreAddressToClassic => Dict(
        :Result => [
            :publicIp => String
            ,:requestId => String
            ,:status => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:PublicIp => String
        ]
    )
    ,:DisassociateIamInstanceProfile => Dict(
        :Result => [
            :iamInstanceProfileAssociation => IamInstanceProfileAssociation
            ,:requestId => String
        ]
        ,:Request => [
            :AssociationId => String
        ]
    )
    ,:DescribeCustomerGateways => Dict(
        :Result => [
            :customerGatewaySet => Vector{CustomerGateway}
            ,:requestId => String
        ]
        ,:Request => [
            :CustomerGatewayId => Vector{String}
            ,:DryRun => Bool
            ,:Filter => Vector{Filter}
        ]
    )
    ,:DeleteVpnConnectionRoute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DestinationCidrBlock => String
            ,:VpnConnectionId => String
        ]
    )
    ,:DescribePlacementGroups => Dict(
        :Result => [
            :placementGroupSet => Vector{PlacementGroup}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:GroupName => Vector{String}
        ]
    )
    ,:EnableVpcClassicLink => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:DetachVolume => Dict(
        :Result => [
            :attachTime => Base.Dates.DateTime
            ,:deleteOnTermination => Bool
            ,:device => String
            ,:instanceId => String
            ,:requestId => String
            ,:status => String
            ,:volumeId => String
        ]
        ,:Request => [
            :Device => String
            ,:DryRun => Bool
            ,:Force => Bool
            ,:InstanceId => String
            ,:VolumeId => String
        ]
    )
    ,:DescribeVpcAttribute => Dict(
        :Result => [
            :enableDnsHostnames => AttributeBooleanValue
            ,:enableDnsSupport => AttributeBooleanValue
            ,:requestId => String
            ,:vpcId => String
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:BundleInstance => Dict(
        :Result => [
            :bundleInstanceTask => BundleTask
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
            ,:Storage => String
        ]
    )
    ,:DescribeVolumes => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:volumeSet => Vector{Volume}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:VolumeId => Vector{String}
        ]
    )
    ,:DescribeConversionTasks => Dict(
        :Result => [
            :conversionTasks => Vector{ConversionTask}
            ,:requestId => String
        ]
        ,:Request => [
            :ConversionTaskId => Vector{String}
            ,:DryRun => Bool
        ]
    )
    ,:DescribeSpotFleetRequests => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:spotFleetRequestConfigSet => Vector{SpotFleetRequestConfig}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:MaxResults => Int
            ,:NextToken => String
            ,:SpotFleetRequestId => Vector{String}
        ]
    )
    ,:DescribeVolumesModifications => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:volumeModificationSet => Vector{VolumeModification}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:VolumeId => Vector{String}
        ]
    )
    ,:ModifyVpcEndpoint => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AddRouteTableId => Vector{String}
            ,:DryRun => Bool
            ,:PolicyDocument => String
            ,:RemoveRouteTableId => Vector{String}
            ,:ResetPolicy => Bool
            ,:VpcEndpointId => String
        ]
    )
    ,:RunScheduledInstances => Dict(
        :Result => [
            :instanceIdSet => Vector{String}
            ,:requestId => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:DryRun => Bool
            ,:InstanceCount => Int
            ,:LaunchSpecification => ScheduledInstancesLaunchSpecification
            ,:ScheduledInstanceId => String
        ]
    )
    ,:DescribeFlowLogs => Dict(
        :Result => [
            :flowLogSet => Vector{FlowLog}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:FlowLogId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:RequestSpotFleet => Dict(
        :Result => [
            :requestId => String
            ,:spotFleetRequestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:SpotFleetRequestConfig => SpotFleetRequestConfigData
        ]
    )
    ,:CreateVpnConnection => Dict(
        :Result => [
            :requestId => String
            ,:vpnConnection => VpnConnection
        ]
        ,:Request => [
            :CustomerGatewayId => String
            ,:DryRun => Bool
            ,:Options => VpnConnectionOptionsSpecification
            ,:_Type => String
            ,:VpnGatewayId => String
        ]
    )
    ,:CancelReservedInstancesListing => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesListingsSet => Vector{ReservedInstancesListing}
        ]
        ,:Request => [
            :ReservedInstancesListingId => String
        ]
    )
    ,:ImportVolume => Dict(
        :Result => [
            :conversionTask => ConversionTask
            ,:requestId => String
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:Description => String
            ,:DryRun => Bool
            ,:Image => DiskImageDetail
            ,:Volume => VolumeDetail
        ]
    )
    ,:GetHostReservationPurchasePreview => Dict(
        :Result => [
            :currencyCode => String
            ,:purchase => Vector{Purchase}
            ,:requestId => String
            ,:totalHourlyPrice => String
            ,:totalUpfrontPrice => String
        ]
        ,:Request => [
            :HostIdSet => Vector{String}
            ,:OfferingId => String
        ]
    )
    ,:CreateVpcEndpoint => Dict(
        :Result => [
            :clientToken => String
            ,:requestId => String
            ,:vpcEndpoint => VpcEndpoint
        ]
        ,:Request => [
            :ClientToken => String
            ,:DryRun => Bool
            ,:PolicyDocument => String
            ,:RouteTableId => Vector{String}
            ,:ServiceName => String
            ,:VpcId => String
        ]
    )
    ,:CreateNatGateway => Dict(
        :Result => [
            :clientToken => String
            ,:natGateway => NatGateway
            ,:requestId => String
        ]
        ,:Request => [
            :AllocationId => String
            ,:ClientToken => String
            ,:SubnetId => String
        ]
    )
    ,:AssociateRouteTable => Dict(
        :Result => [
            :associationId => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:RouteTableId => String
            ,:SubnetId => String
        ]
    )
    ,:ModifyVpcPeeringConnectionOptions => Dict(
        :Result => [
            :accepterPeeringConnectionOptions => PeeringConnectionOptions
            ,:requesterPeeringConnectionOptions => PeeringConnectionOptions
            ,:requestId => String
        ]
        ,:Request => [
            :AccepterPeeringConnectionOptions => PeeringConnectionOptionsRequest
            ,:DryRun => Bool
            ,:RequesterPeeringConnectionOptions => PeeringConnectionOptionsRequest
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:ImportImage => Dict(
        :Result => [
            :architecture => String
            ,:description => String
            ,:hypervisor => String
            ,:imageId => String
            ,:importTaskId => String
            ,:licenseType => String
            ,:platform => String
            ,:progress => String
            ,:requestId => String
            ,:snapshotDetailSet => Vector{SnapshotDetail}
            ,:status => String
            ,:statusMessage => String
        ]
        ,:Request => [
            :Architecture => String
            ,:ClientData => ClientData
            ,:ClientToken => String
            ,:Description => String
            ,:DiskContainer => Vector{ImageDiskContainer}
            ,:DryRun => Bool
            ,:Hypervisor => String
            ,:LicenseType => String
            ,:Platform => String
            ,:RoleName => String
        ]
    )
    ,:ReportInstanceStatus => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Description => String
            ,:DryRun => Bool
            ,:EndTime => Base.Dates.DateTime
            ,:InstanceId => Vector{String}
            ,:ReasonCode => Vector{String}
            ,:StartTime => Base.Dates.DateTime
            ,:Status => String
        ]
    )
    ,:CreateVpnConnectionRoute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DestinationCidrBlock => String
            ,:VpnConnectionId => String
        ]
    )
    ,:DescribeVpnGateways => Dict(
        :Result => [
            :requestId => String
            ,:vpnGatewaySet => Vector{VpnGateway}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:VpnGatewayId => Vector{String}
        ]
    )
    ,:ResetSnapshotAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:SnapshotId => String
        ]
    )
    ,:DisableVgwRoutePropagation => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :GatewayId => String
            ,:RouteTableId => String
        ]
    )
    ,:AllocateAddress => Dict(
        :Result => [
            :allocationId => String
            ,:domain => String
            ,:publicIp => String
            ,:requestId => String
        ]
        ,:Request => [
            :Domain => String
            ,:DryRun => Bool
        ]
    )
    ,:DescribeEgressOnlyInternetGateways => Dict(
        :Result => [
            :egressOnlyInternetGatewaySet => Vector{EgressOnlyInternetGateway}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:EgressOnlyInternetGatewayId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:DescribeSpotDatafeedSubscription => Dict(
        :Result => [
            :requestId => String
            ,:spotDatafeedSubscription => SpotDatafeedSubscription
        ]
        ,:Request => [
            :DryRun => Bool
        ]
    )
    ,:DescribeRegions => Dict(
        :Result => [
            :regionInfo => Vector{Region}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:RegionName => Vector{String}
        ]
    )
    ,:DeleteRoute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DestinationCidrBlock => String
            ,:DestinationIpv6CidrBlock => String
            ,:DryRun => Bool
            ,:RouteTableId => String
        ]
    )
    ,:ModifySubnetAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AssignIpv6AddressOnCreation => AttributeBooleanValue
            ,:MapPublicIpOnLaunch => AttributeBooleanValue
            ,:SubnetId => String
        ]
    )
    ,:DeleteKeyPair => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:KeyName => String
        ]
    )
    ,:DescribeVpcEndpointServices => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:serviceNameSet => Vector{String}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:CreateEgressOnlyInternetGateway => Dict(
        :Result => [
            :clientToken => String
            ,:egressOnlyInternetGateway => EgressOnlyInternetGateway
            ,:requestId => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:DescribeAvailabilityZones => Dict(
        :Result => [
            :availabilityZoneInfo => Vector{AvailabilityZone}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:ZoneName => Vector{String}
        ]
    )
    ,:DescribeFpgaImages => Dict(
        :Result => [
            :fpgaImageSet => Vector{FpgaImage}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:FpgaImageId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:Owner => Vector{String}
        ]
    )
    ,:CreateSubnet => Dict(
        :Result => [
            :requestId => String
            ,:subnet => Subnet
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:CidrBlock => String
            ,:DryRun => Bool
            ,:Ipv6CidrBlock => String
            ,:VpcId => String
        ]
    )
    ,:CreateVpnGateway => Dict(
        :Result => [
            :requestId => String
            ,:vpnGateway => VpnGateway
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:DryRun => Bool
            ,:_Type => String
        ]
    )
    ,:DescribePrefixLists => Dict(
        :Result => [
            :nextToken => String
            ,:prefixListSet => Vector{PrefixList}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:PrefixListId => Vector{String}
        ]
    )
    ,:CancelExportTask => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :ExportTaskId => String
        ]
    )
    ,:CreateSnapshot => Dict(
        :Result => [
            :dataEncryptionKeyId => String
            ,:description => String
            ,:encrypted => Bool
            ,:kmsKeyId => String
            ,:ownerAlias => String
            ,:ownerId => String
            ,:progress => String
            ,:requestId => String
            ,:snapshotId => String
            ,:startTime => Base.Dates.DateTime
            ,:status => String
            ,:statusMessage => String
            ,:tagSet => Vector{Tag}
            ,:volumeId => String
            ,:volumeSize => Int
        ]
        ,:Request => [
            :Description => String
            ,:DryRun => Bool
            ,:VolumeId => String
        ]
    )
    ,:AuthorizeSecurityGroupIngress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrIp => String
            ,:DryRun => Bool
            ,:FromPort => Int
            ,:GroupId => String
            ,:GroupName => String
            ,:IpPermissions => Vector{IpPermission}
            ,:IpProtocol => String
            ,:SourceSecurityGroupName => String
            ,:SourceSecurityGroupOwnerId => String
            ,:ToPort => Int
        ]
    )
    ,:ModifyIdentityIdFormat => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :PrincipalArn => String
            ,:Resource => String
            ,:UseLongIds => Bool
        ]
    )
    ,:DescribeVpcClassicLink => Dict(
        :Result => [
            :requestId => String
            ,:vpcSet => Vector{VpcClassicLink}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:VpcId => Vector{String}
        ]
    )
    ,:DescribeNatGateways => Dict(
        :Result => [
            :natGatewaySet => Vector{NatGateway}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NatGatewayId => Vector{String}
            ,:NextToken => String
        ]
    )
    ,:DeleteSecurityGroup => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:GroupId => String
            ,:GroupName => String
        ]
    )
    ,:DisableVpcClassicLinkDnsSupport => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :VpcId => String
        ]
    )
    ,:DescribeStaleSecurityGroups => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:staleSecurityGroupSet => Vector{StaleSecurityGroup}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:MaxResults => Int
            ,:NextToken => String
            ,:VpcId => String
        ]
    )
    ,:DeleteFlowLogs => Dict(
        :Result => [
            :requestId => String
            ,:unsuccessful => Vector{UnsuccessfulItem}
        ]
        ,:Request => [
            :FlowLogId => Vector{String}
        ]
    )
    ,:CopyImage => Dict(
        :Result => [
            :imageId => String
            ,:requestId => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:Description => String
            ,:DryRun => Bool
            ,:Encrypted => Bool
            ,:KmsKeyId => String
            ,:Name => String
            ,:SourceImageId => String
            ,:SourceRegion => String
        ]
    )
    ,:CancelSpotInstanceRequests => Dict(
        :Result => [
            :requestId => String
            ,:spotInstanceRequestSet => Vector{CancelledSpotInstanceRequest}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:SpotInstanceRequestId => Vector{String}
        ]
    )
    ,:RejectVpcPeeringConnection => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:DescribeInternetGateways => Dict(
        :Result => [
            :internetGatewaySet => Vector{InternetGateway}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:InternetGatewayId => Vector{String}
        ]
    )
    ,:PurchaseScheduledInstances => Dict(
        :Result => [
            :requestId => String
            ,:scheduledInstanceSet => Vector{ScheduledInstance}
        ]
        ,:Request => [
            :ClientToken => String
            ,:DryRun => Bool
            ,:PurchaseRequest => Vector{PurchaseRequest}
        ]
    )
    ,:AssignIpv6Addresses => Dict(
        :Result => [
            :assignedIpv6Addresses => Vector{String}
            ,:networkInterfaceId => String
            ,:requestId => String
        ]
        ,:Request => [
            :Ipv6AddressCount => Int
            ,:Ipv6Addresses => Vector{String}
            ,:NetworkInterfaceId => String
        ]
    )
    ,:CreateInstanceExportTask => Dict(
        :Result => [
            :exportTask => ExportTask
            ,:requestId => String
        ]
        ,:Request => [
            :Description => String
            ,:ExportToS3 => ExportToS3TaskSpecification
            ,:InstanceId => String
            ,:TargetEnvironment => String
        ]
    )
    ,:RebootInstances => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:AttachVolume => Dict(
        :Result => [
            :attachTime => Base.Dates.DateTime
            ,:deleteOnTermination => Bool
            ,:device => String
            ,:instanceId => String
            ,:requestId => String
            ,:status => String
            ,:volumeId => String
        ]
        ,:Request => [
            :Device => String
            ,:DryRun => Bool
            ,:InstanceId => String
            ,:VolumeId => String
        ]
    )
    ,:ModifyVolumeAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AutoEnableIO => AttributeBooleanValue
            ,:DryRun => Bool
            ,:VolumeId => String
        ]
    )
    ,:DeleteNetworkInterfacePermission => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Force => Bool
            ,:NetworkInterfacePermissionId => String
        ]
    )
    ,:AttachInternetGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InternetGatewayId => String
            ,:VpcId => String
        ]
    )
    ,:DescribeImportSnapshotTasks => Dict(
        :Result => [
            :importSnapshotTaskSet => Vector{ImportSnapshotTask}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filters => Vector{Filter}
            ,:ImportTaskId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:ImportSnapshot => Dict(
        :Result => [
            :description => String
            ,:importTaskId => String
            ,:requestId => String
            ,:snapshotTaskDetail => SnapshotTaskDetail
        ]
        ,:Request => [
            :ClientData => ClientData
            ,:ClientToken => String
            ,:Description => String
            ,:DiskContainer => SnapshotDiskContainer
            ,:DryRun => Bool
            ,:RoleName => String
        ]
    )
    ,:CreateDhcpOptions => Dict(
        :Result => [
            :dhcpOptions => DhcpOptions
            ,:requestId => String
        ]
        ,:Request => [
            :DhcpConfiguration => Vector{NewDhcpConfiguration}
            ,:DryRun => Bool
        ]
    )
    ,:ModifyInstanceAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:BlockDeviceMapping => Vector{InstanceBlockDeviceMappingSpecification}
            ,:DisableApiTermination => AttributeBooleanValue
            ,:DryRun => Bool
            ,:EbsOptimized => AttributeBooleanValue
            ,:EnaSupport => AttributeBooleanValue
            ,:GroupId => Vector{String}
            ,:InstanceId => String
            ,:InstanceInitiatedShutdownBehavior => AttributeValue
            ,:InstanceType => AttributeValue
            ,:Kernel => AttributeValue
            ,:Ramdisk => AttributeValue
            ,:SourceDestCheck => AttributeBooleanValue
            ,:SriovNetSupport => AttributeValue
            ,:UserData => BlobAttributeValue
            ,:Value => String
        ]
    )
    ,:AttachNetworkInterface => Dict(
        :Result => [
            :attachmentId => String
            ,:requestId => String
        ]
        ,:Request => [
            :DeviceIndex => Int
            ,:DryRun => Bool
            ,:InstanceId => String
            ,:NetworkInterfaceId => String
        ]
    )
    ,:ModifyInstancePlacement => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Affinity => String
            ,:HostId => String
            ,:InstanceId => String
            ,:Tenancy => String
        ]
    )
    ,:DescribeSecurityGroupReferences => Dict(
        :Result => [
            :requestId => String
            ,:securityGroupReferenceSet => Vector{SecurityGroupReference}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:GroupId => Vector{String}
        ]
    )
    ,:DescribeVpcs => Dict(
        :Result => [
            :requestId => String
            ,:vpcSet => Vector{Vpc}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:VpcId => Vector{String}
        ]
    )
    ,:StopInstances => Dict(
        :Result => [
            :instancesSet => Vector{InstanceStateChange}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Force => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:ModifyVolume => Dict(
        :Result => [
            :requestId => String
            ,:volumeModification => VolumeModification
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Iops => Int
            ,:Size => Int
            ,:VolumeId => String
            ,:VolumeType => String
        ]
    )
    ,:GetConsoleScreenshot => Dict(
        :Result => [
            :imageData => String
            ,:instanceId => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
            ,:WakeUp => Bool
        ]
    )
    ,:GetPasswordData => Dict(
        :Result => [
            :instanceId => String
            ,:passwordData => String
            ,:requestId => String
            ,:timestamp => Base.Dates.DateTime
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
        ]
    )
    ,:DeleteNatGateway => Dict(
        :Result => [
            :natGatewayId => String
            ,:requestId => String
        ]
        ,:Request => [
            :NatGatewayId => String
        ]
    )
    ,:DescribeSpotFleetInstances => Dict(
        :Result => [
            :activeInstanceSet => Vector{ActiveInstance}
            ,:nextToken => String
            ,:requestId => String
            ,:spotFleetRequestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:MaxResults => Int
            ,:NextToken => String
            ,:SpotFleetRequestId => String
        ]
    )
    ,:AcceptVpcPeeringConnection => Dict(
        :Result => [
            :requestId => String
            ,:vpcPeeringConnection => VpcPeeringConnection
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:DescribeImageAttribute => Dict(
        :Result => [
            :blockDeviceMapping => Vector{BlockDeviceMapping}
            ,:description => AttributeValue
            ,:imageId => String
            ,:kernel => AttributeValue
            ,:launchPermission => Vector{LaunchPermission}
            ,:productCodes => Vector{ProductCode}
            ,:ramdisk => AttributeValue
            ,:requestId => String
            ,:sriovNetSupport => AttributeValue
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:ImageId => String
        ]
    )
    ,:AuthorizeSecurityGroupEgress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrIp => String
            ,:DryRun => Bool
            ,:FromPort => Int
            ,:GroupId => String
            ,:IpPermissions => Vector{IpPermission}
            ,:IpProtocol => String
            ,:SourceSecurityGroupName => String
            ,:SourceSecurityGroupOwnerId => String
            ,:ToPort => Int
        ]
    )
    ,:DeleteInternetGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InternetGatewayId => String
        ]
    )
    ,:DeleteVpc => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:DeleteDhcpOptions => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DhcpOptionsId => String
            ,:DryRun => Bool
        ]
    )
    ,:DeleteEgressOnlyInternetGateway => Dict(
        :Result => [
            :requestId => String
            ,:returnCode => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:EgressOnlyInternetGatewayId => String
        ]
    )
    ,:DisableVpcClassicLink => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:DescribeInstanceStatus => Dict(
        :Result => [
            :instanceStatusSet => Vector{InstanceStatus}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:IncludeAllInstances => Bool
            ,:InstanceId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:CreateVolume => Dict(
        :Result => [
            :attachmentSet => Vector{VolumeAttachment}
            ,:availabilityZone => String
            ,:createTime => Base.Dates.DateTime
            ,:encrypted => Bool
            ,:iops => Int
            ,:kmsKeyId => String
            ,:requestId => String
            ,:size => Int
            ,:snapshotId => String
            ,:status => String
            ,:tagSet => Vector{Tag}
            ,:volumeId => String
            ,:volumeType => String
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:DryRun => Bool
            ,:Encrypted => Bool
            ,:Iops => Int
            ,:KmsKeyId => String
            ,:Size => Int
            ,:SnapshotId => String
            ,:TagSpecification => Vector{TagSpecification}
            ,:VolumeType => String
        ]
    )
    ,:DescribeAddresses => Dict(
        :Result => [
            :addressesSet => Vector{Address}
            ,:requestId => String
        ]
        ,:Request => [
            :AllocationId => Vector{String}
            ,:DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:PublicIp => Vector{String}
        ]
    )
    ,:ModifyNetworkInterfaceAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attachment => NetworkInterfaceAttachmentChanges
            ,:Description => AttributeValue
            ,:DryRun => Bool
            ,:NetworkInterfaceId => String
            ,:SecurityGroupId => Vector{String}
            ,:SourceDestCheck => AttributeBooleanValue
        ]
    )
    ,:UnassignPrivateIpAddresses => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :NetworkInterfaceId => String
            ,:PrivateIpAddress => Vector{String}
        ]
    )
    ,:CreateReservedInstancesListing => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesListingsSet => Vector{ReservedInstancesListing}
        ]
        ,:Request => [
            :ClientToken => String
            ,:InstanceCount => Int
            ,:PriceSchedules => Vector{PriceScheduleSpecification}
            ,:ReservedInstancesId => String
        ]
    )
    ,:CreateNetworkAcl => Dict(
        :Result => [
            :networkAcl => NetworkAcl
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:ResetImageAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:ImageId => String
        ]
    )
    ,:DescribeSnapshotAttribute => Dict(
        :Result => [
            :createVolumePermission => Vector{CreateVolumePermission}
            ,:productCodes => Vector{ProductCode}
            ,:requestId => String
            ,:snapshotId => String
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:SnapshotId => String
        ]
    )
    ,:AssociateAddress => Dict(
        :Result => [
            :associationId => String
            ,:requestId => String
        ]
        ,:Request => [
            :AllocationId => String
            ,:AllowReassociation => Bool
            ,:DryRun => Bool
            ,:InstanceId => String
            ,:NetworkInterfaceId => String
            ,:PrivateIpAddress => String
            ,:PublicIp => String
        ]
    )
    ,:EnableVpcClassicLinkDnsSupport => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :VpcId => String
        ]
    )
    ,:DescribeReservedInstancesModifications => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:reservedInstancesModificationsSet => Vector{ReservedInstancesModification}
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:NextToken => String
            ,:ReservedInstancesModificationId => Vector{String}
        ]
    )
    ,:DeleteCustomerGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CustomerGatewayId => String
            ,:DryRun => Bool
        ]
    )
    ,:DescribeHostReservations => Dict(
        :Result => [
            :hostReservationSet => Vector{HostReservation}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:HostReservationIdSet => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:MonitorInstances => Dict(
        :Result => [
            :instancesSet => Vector{InstanceMonitoring}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:DeleteVpnGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpnGatewayId => String
        ]
    )
    ,:CreateNetworkInterface => Dict(
        :Result => [
            :networkInterface => NetworkInterface
            ,:requestId => String
        ]
        ,:Request => [
            :Description => String
            ,:DryRun => Bool
            ,:Ipv6AddressCount => Int
            ,:Ipv6Addresses => Vector{InstanceIpv6Address}
            ,:PrivateIpAddress => String
            ,:PrivateIpAddresses => Vector{PrivateIpAddressSpecification}
            ,:SecondaryPrivateIpAddressCount => Int
            ,:SecurityGroupId => Vector{String}
            ,:SubnetId => String
        ]
    )
    ,:DetachVpnGateway => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
            ,:VpnGatewayId => String
        ]
    )
    ,:DescribeScheduledInstances => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:scheduledInstanceSet => Vector{ScheduledInstance}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:ScheduledInstanceId => Vector{String}
            ,:SlotStartTimeRange => SlotStartTimeRangeRequest
        ]
    )
    ,:AssociateIamInstanceProfile => Dict(
        :Result => [
            :iamInstanceProfileAssociation => IamInstanceProfileAssociation
            ,:requestId => String
        ]
        ,:Request => [
            :IamInstanceProfile => IamInstanceProfileSpecification
            ,:InstanceId => String
        ]
    )
    ,:DeleteNetworkAcl => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:NetworkAclId => String
        ]
    )
    ,:DescribeReservedInstances => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesSet => Vector{ReservedInstances}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:OfferingClass => String
            ,:OfferingType => String
            ,:ReservedInstancesId => Vector{String}
        ]
    )
    ,:RunInstances => Dict(
        :Result => [
            :groupSet => Vector{GroupIdentifier}
            ,:instancesSet => Vector{Instance}
            ,:ownerId => String
            ,:requesterId => String
            ,:requestId => String
            ,:reservationId => String
        ]
        ,:Request => [
            :AdditionalInfo => String
            ,:BlockDeviceMapping => Vector{BlockDeviceMapping}
            ,:ClientToken => String
            ,:DisableApiTermination => Bool
            ,:DryRun => Bool
            ,:EbsOptimized => Bool
            ,:IamInstanceProfile => IamInstanceProfileSpecification
            ,:ImageId => String
            ,:InstanceInitiatedShutdownBehavior => String
            ,:InstanceType => String
            ,:Ipv6Address => Vector{InstanceIpv6Address}
            ,:Ipv6AddressCount => Int
            ,:KernelId => String
            ,:KeyName => String
            ,:MaxCount => Int
            ,:MinCount => Int
            ,:Monitoring => RunInstancesMonitoringEnabled
            ,:NetworkInterface => Vector{InstanceNetworkInterfaceSpecification}
            ,:Placement => Placement
            ,:PrivateIpAddress => String
            ,:RamdiskId => String
            ,:SecurityGroup => Vector{String}
            ,:SecurityGroupId => Vector{String}
            ,:SubnetId => String
            ,:TagSpecification => Vector{TagSpecification}
            ,:UserData => String
        ]
    )
    ,:CreateVpcPeeringConnection => Dict(
        :Result => [
            :requestId => String
            ,:vpcPeeringConnection => VpcPeeringConnection
        ]
        ,:Request => [
            :DryRun => Bool
            ,:PeerOwnerId => String
            ,:PeerVpcId => String
            ,:VpcId => String
        ]
    )
    ,:DescribeHosts => Dict(
        :Result => [
            :hostSet => Vector{Host}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:HostId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:AllocateHosts => Dict(
        :Result => [
            :hostIdSet => Vector{String}
            ,:requestId => String
        ]
        ,:Request => [
            :AutoPlacement => String
            ,:AvailabilityZone => String
            ,:ClientToken => String
            ,:InstanceType => String
            ,:Quantity => Int
        ]
    )
    ,:DescribeReservedInstancesListings => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesListingsSet => Vector{ReservedInstancesListing}
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:ReservedInstancesId => String
            ,:ReservedInstancesListingId => String
        ]
    )
    ,:CreateInternetGateway => Dict(
        :Result => [
            :internetGateway => InternetGateway
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
        ]
    )
    ,:AcceptReservedInstancesExchangeQuote => Dict(
        :Result => [
            :exchangeId => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ReservedInstanceId => Vector{String}
            ,:TargetConfiguration => Vector{TargetConfigurationRequest}
        ]
    )
    ,:TerminateInstances => Dict(
        :Result => [
            :instancesSet => Vector{InstanceStateChange}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:EnableVolumeIO => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VolumeId => String
        ]
    )
    ,:DescribeVpnConnections => Dict(
        :Result => [
            :requestId => String
            ,:vpnConnectionSet => Vector{VpnConnection}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:VpnConnectionId => Vector{String}
        ]
    )
    ,:DescribeMovingAddresses => Dict(
        :Result => [
            :movingAddressStatusSet => Vector{MovingAddressStatus}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:PublicIp => Vector{String}
        ]
    )
    ,:CreateRouteTable => Dict(
        :Result => [
            :requestId => String
            ,:routeTable => RouteTable
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
        ]
    )
    ,:UnmonitorInstances => Dict(
        :Result => [
            :instancesSet => Vector{InstanceMonitoring}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => Vector{String}
        ]
    )
    ,:DeleteSubnet => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:SubnetId => String
        ]
    )
    ,:DeleteVolume => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VolumeId => String
        ]
    )
    ,:DescribeKeyPairs => Dict(
        :Result => [
            :keySet => Vector{KeyPairInfo}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:KeyName => Vector{String}
        ]
    )
    ,:CreateSecurityGroup => Dict(
        :Result => [
            :groupId => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:GroupDescription => String
            ,:GroupName => String
            ,:VpcId => String
        ]
    )
    ,:DescribeSpotFleetRequestHistory => Dict(
        :Result => [
            :historyRecordSet => Vector{HistoryRecord}
            ,:lastEvaluatedTime => Base.Dates.DateTime
            ,:nextToken => String
            ,:requestId => String
            ,:spotFleetRequestId => String
            ,:startTime => Base.Dates.DateTime
        ]
        ,:Request => [
            :DryRun => Bool
            ,:EventType => String
            ,:MaxResults => Int
            ,:NextToken => String
            ,:SpotFleetRequestId => String
            ,:StartTime => Base.Dates.DateTime
        ]
    )
    ,:ModifySpotFleetRequest => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :ExcessCapacityTerminationPolicy => String
            ,:SpotFleetRequestId => String
            ,:TargetCapacity => Int
        ]
    )
    ,:ImportKeyPair => Dict(
        :Result => [
            :keyFingerprint => String
            ,:keyName => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:KeyName => String
            ,:PublicKeyMaterial => Vector{UInt8}
        ]
    )
    ,:DisassociateAddress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AssociationId => String
            ,:DryRun => Bool
            ,:PublicIp => String
        ]
    )
    ,:DescribeSecurityGroups => Dict(
        :Result => [
            :requestId => String
            ,:securityGroupInfo => Vector{SecurityGroup}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:GroupId => Vector{String}
            ,:GroupName => Vector{String}
        ]
    )
    ,:DisassociateRouteTable => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AssociationId => String
            ,:DryRun => Bool
        ]
    )
    ,:ConfirmProductInstance => Dict(
        :Result => [
            :ownerId => String
            ,:requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
            ,:ProductCode => String
        ]
    )
    ,:DescribeInstanceAttribute => Dict(
        :Result => [
            :blockDeviceMapping => Vector{InstanceBlockDeviceMapping}
            ,:disableApiTermination => AttributeBooleanValue
            ,:ebsOptimized => AttributeBooleanValue
            ,:enaSupport => AttributeBooleanValue
            ,:groupSet => Vector{GroupIdentifier}
            ,:instanceId => String
            ,:instanceInitiatedShutdownBehavior => AttributeValue
            ,:instanceType => AttributeValue
            ,:kernel => AttributeValue
            ,:productCodes => Vector{ProductCode}
            ,:ramdisk => AttributeValue
            ,:requestId => String
            ,:rootDeviceName => AttributeValue
            ,:sourceDestCheck => AttributeBooleanValue
            ,:sriovNetSupport => AttributeValue
            ,:userData => AttributeValue
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:InstanceId => String
        ]
    )
    ,:ModifySnapshotAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:CreateVolumePermission => CreateVolumePermissionModifications
            ,:DryRun => Bool
            ,:OperationType => String
            ,:SnapshotId => String
            ,:UserGroup => Vector{String}
            ,:UserId => Vector{String}
        ]
    )
    ,:AssignPrivateIpAddresses => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AllowReassignment => Bool
            ,:NetworkInterfaceId => String
            ,:PrivateIpAddress => Vector{String}
            ,:SecondaryPrivateIpAddressCount => Int
        ]
    )
    ,:DescribeNetworkAcls => Dict(
        :Result => [
            :networkAclSet => Vector{NetworkAcl}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:NetworkAclId => Vector{String}
        ]
    )
    ,:DescribeVpcEndpoints => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:vpcEndpointSet => Vector{VpcEndpoint}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:VpcEndpointId => Vector{String}
        ]
    )
    ,:AttachClassicLinkVpc => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceId => String
            ,:SecurityGroupId => Vector{String}
            ,:VpcId => String
        ]
    )
    ,:AssociateVpcCidrBlock => Dict(
        :Result => [
            :ipv6CidrBlockAssociation => VpcIpv6CidrBlockAssociation
            ,:requestId => String
            ,:vpcId => String
        ]
        ,:Request => [
            :AmazonProvidedIpv6CidrBlock => Bool
            ,:VpcId => String
        ]
    )
    ,:DescribeNetworkInterfacePermissions => Dict(
        :Result => [
            :networkInterfacePermissions => Vector{NetworkInterfacePermission}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NetworkInterfacePermissionId => Vector{String}
            ,:NextToken => String
        ]
    )
    ,:ReleaseAddress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AllocationId => String
            ,:DryRun => Bool
            ,:PublicIp => String
        ]
    )
    ,:CreateRoute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DestinationCidrBlock => String
            ,:DestinationIpv6CidrBlock => String
            ,:DryRun => Bool
            ,:EgressOnlyInternetGatewayId => String
            ,:GatewayId => String
            ,:InstanceId => String
            ,:NatGatewayId => String
            ,:NetworkInterfaceId => String
            ,:RouteTableId => String
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:CancelImportTask => Dict(
        :Result => [
            :importTaskId => String
            ,:previousState => String
            ,:requestId => String
            ,:state => String
        ]
        ,:Request => [
            :CancelReason => String
            ,:DryRun => Bool
            ,:ImportTaskId => String
        ]
    )
    ,:MoveAddressToVpc => Dict(
        :Result => [
            :allocationId => String
            ,:requestId => String
            ,:status => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:PublicIp => String
        ]
    )
    ,:DescribeSpotPriceHistory => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:spotPriceHistorySet => Vector{SpotPrice}
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:DryRun => Bool
            ,:EndTime => Base.Dates.DateTime
            ,:Filter => Vector{Filter}
            ,:InstanceType => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:ProductDescription => Vector{String}
            ,:StartTime => Base.Dates.DateTime
        ]
    )
    ,:DisassociateVpcCidrBlock => Dict(
        :Result => [
            :ipv6CidrBlockAssociation => VpcIpv6CidrBlockAssociation
            ,:requestId => String
            ,:vpcId => String
        ]
        ,:Request => [
            :AssociationId => String
        ]
    )
    ,:DeregisterImage => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ImageId => String
        ]
    )
    ,:DescribeDhcpOptions => Dict(
        :Result => [
            :dhcpOptionsSet => Vector{DhcpOptions}
            ,:requestId => String
        ]
        ,:Request => [
            :DhcpOptionsId => Vector{String}
            ,:DryRun => Bool
            ,:Filter => Vector{Filter}
        ]
    )
    ,:DescribeClassicLinkInstances => Dict(
        :Result => [
            :instancesSet => Vector{ClassicLinkInstance}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:InstanceId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:DescribeReservedInstancesOfferings => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:reservedInstancesOfferingsSet => Vector{ReservedInstancesOffering}
        ]
        ,:Request => [
            :AvailabilityZone => String
            ,:DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:IncludeMarketplace => Bool
            ,:InstanceTenancy => String
            ,:InstanceType => String
            ,:MaxDuration => Int
            ,:MaxInstanceCount => Int
            ,:MaxResults => Int
            ,:MinDuration => Int
            ,:NextToken => String
            ,:OfferingClass => String
            ,:OfferingType => String
            ,:ProductDescription => String
            ,:ReservedInstancesOfferingId => Vector{String}
        ]
    )
    ,:EnableVgwRoutePropagation => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :GatewayId => String
            ,:RouteTableId => String
        ]
    )
    ,:ReplaceIamInstanceProfileAssociation => Dict(
        :Result => [
            :iamInstanceProfileAssociation => IamInstanceProfileAssociation
            ,:requestId => String
        ]
        ,:Request => [
            :AssociationId => String
            ,:IamInstanceProfile => IamInstanceProfileSpecification
        ]
    )
    ,:DescribeSpotInstanceRequests => Dict(
        :Result => [
            :requestId => String
            ,:spotInstanceRequestSet => Vector{SpotInstanceRequest}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:SpotInstanceRequestId => Vector{String}
        ]
    )
    ,:DescribeVolumeStatus => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:volumeStatusSet => Vector{VolumeStatusItem}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:MaxResults => Int
            ,:NextToken => String
            ,:VolumeId => Vector{String}
        ]
    )
    ,:DeleteRouteTable => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:RouteTableId => String
        ]
    )
    ,:DescribeExportTasks => Dict(
        :Result => [
            :exportTaskSet => Vector{ExportTask}
            ,:requestId => String
        ]
        ,:Request => [
            :ExportTaskId => Vector{String}
        ]
    )
    ,:AttachVpnGateway => Dict(
        :Result => [
            :attachment => VpcAttachment
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcId => String
            ,:VpnGatewayId => String
        ]
    )
    ,:DeleteTags => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ResourceId => Vector{String}
            ,:Tag => Vector{Tag}
        ]
    )
    ,:CreateTags => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ResourceId => Vector{String}
            ,:Tag => Vector{Tag}
        ]
    )
    ,:CreateFpgaImage => Dict(
        :Result => [
            :fpgaImageGlobalId => String
            ,:fpgaImageId => String
            ,:requestId => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:Description => String
            ,:DryRun => Bool
            ,:InputStorageLocation => StorageLocation
            ,:LogsStorageLocation => StorageLocation
            ,:Name => String
        ]
    )
    ,:DescribeImportImageTasks => Dict(
        :Result => [
            :importImageTaskSet => Vector{ImportImageTask}
            ,:nextToken => String
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filters => Vector{Filter}
            ,:ImportTaskId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:ModifyReservedInstances => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesModificationId => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:ReservedInstancesConfigurationSetItemType => Vector{ReservedInstancesConfiguration}
            ,:ReservedInstancesId => Vector{String}
        ]
    )
    ,:DescribeHostReservationOfferings => Dict(
        :Result => [
            :nextToken => String
            ,:offeringSet => Vector{HostOffering}
            ,:requestId => String
        ]
        ,:Request => [
            :Filter => Vector{Filter}
            ,:MaxDuration => Int
            ,:MaxResults => Int
            ,:MinDuration => Int
            ,:NextToken => String
            ,:OfferingId => String
        ]
    )
    ,:PurchaseReservedInstancesOffering => Dict(
        :Result => [
            :requestId => String
            ,:reservedInstancesId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:InstanceCount => Int
            ,:LimitPrice => ReservedInstanceLimitPrice
            ,:ReservedInstancesOfferingId => String
        ]
    )
    ,:DescribeInstances => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:reservationSet => Vector{Reservation}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:InstanceId => Vector{String}
            ,:MaxResults => Int
            ,:NextToken => String
        ]
    )
    ,:PurchaseHostReservation => Dict(
        :Result => [
            :clientToken => String
            ,:currencyCode => String
            ,:purchase => Vector{Purchase}
            ,:requestId => String
            ,:totalHourlyPrice => String
            ,:totalUpfrontPrice => String
        ]
        ,:Request => [
            :ClientToken => String
            ,:CurrencyCode => String
            ,:HostIdSet => Vector{String}
            ,:LimitPrice => String
            ,:OfferingId => String
        ]
    )
    ,:DeleteVpcPeeringConnection => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :DryRun => Bool
            ,:VpcPeeringConnectionId => String
        ]
    )
    ,:CancelConversionTask => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :ConversionTaskId => String
            ,:DryRun => Bool
            ,:ReasonMessage => String
        ]
    )
    ,:RevokeSecurityGroupEgress => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :CidrIp => String
            ,:DryRun => Bool
            ,:FromPort => Int
            ,:GroupId => String
            ,:IpPermissions => Vector{IpPermission}
            ,:IpProtocol => String
            ,:SourceSecurityGroupName => String
            ,:SourceSecurityGroupOwnerId => String
            ,:ToPort => Int
        ]
    )
    ,:DescribeSubnets => Dict(
        :Result => [
            :requestId => String
            ,:subnetSet => Vector{Subnet}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:SubnetId => Vector{String}
        ]
    )
    ,:CreateNetworkInterfacePermission => Dict(
        :Result => [
            :interfacePermission => NetworkInterfacePermission
            ,:requestId => String
        ]
        ,:Request => [
            :AwsAccountId => String
            ,:AwsService => String
            ,:DryRun => Bool
            ,:NetworkInterfaceId => String
            ,:Permission => String
        ]
    )
    ,:ModifyVpcAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :EnableDnsHostnames => AttributeBooleanValue
            ,:EnableDnsSupport => AttributeBooleanValue
            ,:VpcId => String
        ]
    )
    ,:DetachNetworkInterface => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :AttachmentId => String
            ,:DryRun => Bool
            ,:Force => Bool
        ]
    )
    ,:DisassociateSubnetCidrBlock => Dict(
        :Result => [
            :ipv6CidrBlockAssociation => SubnetIpv6CidrBlockAssociation
            ,:requestId => String
            ,:subnetId => String
        ]
        ,:Request => [
            :AssociationId => String
        ]
    )
    ,:DescribeVpcPeeringConnections => Dict(
        :Result => [
            :requestId => String
            ,:vpcPeeringConnectionSet => Vector{VpcPeeringConnection}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:VpcPeeringConnectionId => Vector{String}
        ]
    )
    ,:DescribeImages => Dict(
        :Result => [
            :imagesSet => Vector{Image}
            ,:requestId => String
        ]
        ,:Request => [
            :DryRun => Bool
            ,:ExecutableBy => Vector{String}
            ,:Filter => Vector{Filter}
            ,:ImageId => Vector{String}
            ,:Owner => Vector{String}
        ]
    )
    ,:DescribeBundleTasks => Dict(
        :Result => [
            :bundleInstanceTasksSet => Vector{BundleTask}
            ,:requestId => String
        ]
        ,:Request => [
            :BundleId => Vector{String}
            ,:DryRun => Bool
            ,:Filter => Vector{Filter}
        ]
    )
    ,:CopySnapshot => Dict(
        :Result => [
            :requestId => String
            ,:snapshotId => String
        ]
        ,:Request => [
            :Description => String
            ,:DestinationRegion => String
            ,:DryRun => Bool
            ,:Encrypted => Bool
            ,:KmsKeyId => String
            ,:PresignedUrl => String
            ,:SourceRegion => String
            ,:SourceSnapshotId => String
        ]
    )
    ,:ResetInstanceAttribute => Dict(
        :Result => [
            :requestId => String
            ,:_return => Bool
        ]
        ,:Request => [
            :Attribute => String
            ,:DryRun => Bool
            ,:InstanceId => String
        ]
    )
    ,:ReplaceRouteTableAssociation => Dict(
        :Result => [
            :newAssociationId => String
            ,:requestId => String
        ]
        ,:Request => [
            :AssociationId => String
            ,:DryRun => Bool
            ,:RouteTableId => String
        ]
    )
    ,:DescribeScheduledInstanceAvailability => Dict(
        :Result => [
            :nextToken => String
            ,:requestId => String
            ,:scheduledInstanceAvailabilitySet => Vector{ScheduledInstanceAvailability}
        ]
        ,:Request => [
            :DryRun => Bool
            ,:Filter => Vector{Filter}
            ,:FirstSlotStartTimeRange => SlotDateTimeRangeRequest
            ,:MaxResults => Int
            ,:MaxSlotDurationInHours => Int
            ,:MinSlotDurationInHours => Int
            ,:NextToken => String
            ,:Recurrence => ScheduledInstanceRecurrenceRequest
        ]
    )
    ,:CancelBundleTask => Dict(
        :Result => [
            :bundleInstanceTask => BundleTask
            ,:requestId => String
        ]
        ,:Request => [
            :BundleId => String
            ,:DryRun => Bool
        ]
    )
    ,:DescribeIdentityIdFormat => Dict(
        :Result => [
            :requestId => String
            ,:statusSet => Vector{IdFormat}
        ]
        ,:Request => [
            :PrincipalArn => String
            ,:Resource => String
        ]
    )
)

function _ec2_type_map()
    d = Dict(EC2Types...)
    for (apiname,apispec) in EC2Api
        for (opname,optype) in apispec
            d[Symbol(string(apiname)*string(opname))] = optype
        end
    end
    d
end

const EC2TypeDict = _ec2_type_map()

const EC2ApiVer = "2016-11-15"
