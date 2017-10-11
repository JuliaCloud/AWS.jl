# generated from EC2TypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

type AccountAttributeValue <: AbstractAWSType
    attributeValue::Union{Void,String}
    function AccountAttributeValue(;attributeValue=nothing)
        new(attributeValue)
    end
    AccountAttributeValue(pd) = parse_from_xml(AccountAttributeValue, EC2TypeDict, pd)
end # AccountAttributeValue
export AccountAttributeValue

type AccountAttribute <: AbstractAWSType
    attributeName::Union{Void,String}
    attributeValueSet::Union{Void,Array{AccountAttributeValue,1}}
    function AccountAttribute(;attributeName=nothing, attributeValueSet=nothing)
        new(attributeName, attributeValueSet)
    end
    AccountAttribute(pd) = parse_from_xml(AccountAttribute, EC2TypeDict, pd)
end # AccountAttribute
export AccountAttribute

type ActiveInstance <: AbstractAWSType
    instanceHealth::Union{Void,String}
    instanceId::Union{Void,String}
    instanceType::Union{Void,String}
    spotInstanceRequestId::Union{Void,String}
    function ActiveInstance(;instanceHealth=nothing, instanceId=nothing, instanceType=nothing, spotInstanceRequestId=nothing)
        new(instanceHealth, instanceId, instanceType, spotInstanceRequestId)
    end
    ActiveInstance(pd) = parse_from_xml(ActiveInstance, EC2TypeDict, pd)
end # ActiveInstance
export ActiveInstance

type Address <: AbstractAWSType
    allocationId::Union{Void,String}
    associationId::Union{Void,String}
    domain::Union{Void,String}
    instanceId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    networkInterfaceOwnerId::Union{Void,String}
    privateIpAddress::Union{Void,String}
    publicIp::Union{Void,String}
    function Address(;allocationId=nothing, associationId=nothing, domain=nothing, instanceId=nothing, networkInterfaceId=nothing, networkInterfaceOwnerId=nothing, privateIpAddress=nothing, publicIp=nothing)
        new(allocationId, associationId, domain, instanceId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress, publicIp)
    end
    Address(pd) = parse_from_xml(Address, EC2TypeDict, pd)
end # Address
export Address

type AttributeBooleanValue <: AbstractAWSType
    value::Union{Void,Bool}
    function AttributeBooleanValue(;value=nothing)
        new(value)
    end
    AttributeBooleanValue(pd) = parse_from_xml(AttributeBooleanValue, EC2TypeDict, pd)
end # AttributeBooleanValue
export AttributeBooleanValue

type AttributeValue <: AbstractAWSType
    value::Union{Void,String}
    function AttributeValue(;value=nothing)
        new(value)
    end
    AttributeValue(pd) = parse_from_xml(AttributeValue, EC2TypeDict, pd)
end # AttributeValue
export AttributeValue

type AvailabilityZoneMessage <: AbstractAWSType
    message::Union{Void,String}
    function AvailabilityZoneMessage(;message=nothing)
        new(message)
    end
    AvailabilityZoneMessage(pd) = parse_from_xml(AvailabilityZoneMessage, EC2TypeDict, pd)
end # AvailabilityZoneMessage
export AvailabilityZoneMessage

type AvailabilityZone <: AbstractAWSType
    messageSet::Union{Void,Array{AvailabilityZoneMessage,1}}
    regionName::Union{Void,String}
    zoneName::Union{Void,String}
    zoneState::Union{Void,String}
    function AvailabilityZone(;messageSet=nothing, regionName=nothing, zoneName=nothing, zoneState=nothing)
        new(messageSet, regionName, zoneName, zoneState)
    end
    AvailabilityZone(pd) = parse_from_xml(AvailabilityZone, EC2TypeDict, pd)
end # AvailabilityZone
export AvailabilityZone

type InstanceCapacity <: AbstractAWSType
    availableCapacity::Union{Void,Int64}
    instanceType::Union{Void,String}
    totalCapacity::Union{Void,Int64}
    function InstanceCapacity(;availableCapacity=nothing, instanceType=nothing, totalCapacity=nothing)
        new(availableCapacity, instanceType, totalCapacity)
    end
    InstanceCapacity(pd) = parse_from_xml(InstanceCapacity, EC2TypeDict, pd)
end # InstanceCapacity
export InstanceCapacity

type AvailableCapacity <: AbstractAWSType
    availableInstanceCapacity::Union{Void,Array{InstanceCapacity,1}}
    availableVCpus::Union{Void,Int64}
    function AvailableCapacity(;availableInstanceCapacity=nothing, availableVCpus=nothing)
        new(availableInstanceCapacity, availableVCpus)
    end
    AvailableCapacity(pd) = parse_from_xml(AvailableCapacity, EC2TypeDict, pd)
end # AvailableCapacity
export AvailableCapacity

type BlobAttributeValue <: AbstractAWSType
    value::Union{Void,Array{UInt8,1}}
    function BlobAttributeValue(;value=nothing)
        new(value)
    end
    BlobAttributeValue(pd) = parse_from_xml(BlobAttributeValue, EC2TypeDict, pd)
end # BlobAttributeValue
export BlobAttributeValue

type Tag <: AbstractAWSType
    key::Union{Void,String}
    value::Union{Void,String}
    function Tag(;key=nothing, value=nothing)
        new(key, value)
    end
    Tag(pd) = parse_from_xml(Tag, EC2TypeDict, pd)
end # Tag
export Tag

type TagDescription <: AbstractAWSType
    key::Union{Void,String}
    resourceId::Union{Void,String}
    resourceType::Union{Void,String}
    value::Union{Void,String}
    function TagDescription(;key=nothing, resourceId=nothing, resourceType=nothing, value=nothing)
        new(key, resourceId, resourceType, value)
    end
    TagDescription(pd) = parse_from_xml(TagDescription, EC2TypeDict, pd)
end # TagDescription
export TagDescription

type TagSpecification <: AbstractAWSType
    resourceType::Union{Void,String}
    tags::Union{Void,Array{Tag,1}}
    function TagSpecification(;resourceType=nothing, tags=nothing)
        new(resourceType, tags)
    end
    TagSpecification(pd) = parse_from_xml(TagSpecification, EC2TypeDict, pd)
end # TagSpecification
export TagSpecification

type UnsuccessfulItemError <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function UnsuccessfulItemError(;code=nothing, message=nothing)
        new(code, message)
    end
    UnsuccessfulItemError(pd) = parse_from_xml(UnsuccessfulItemError, EC2TypeDict, pd)
end # UnsuccessfulItemError
export UnsuccessfulItemError

type UnsuccessfulItem <: AbstractAWSType
    error::Union{Void,UnsuccessfulItemError}
    resourceId::Union{Void,String}
    function UnsuccessfulItem(;error=nothing, resourceId=nothing)
        new(error, resourceId)
    end
    UnsuccessfulItem(pd) = parse_from_xml(UnsuccessfulItem, EC2TypeDict, pd)
end # UnsuccessfulItem
export UnsuccessfulItem

type UserBucket <: AbstractAWSType
    s3Bucket::Union{Void,String}
    s3Key::Union{Void,String}
    function UserBucket(;s3Bucket=nothing, s3Key=nothing)
        new(s3Bucket, s3Key)
    end
    UserBucket(pd) = parse_from_xml(UserBucket, EC2TypeDict, pd)
end # UserBucket
export UserBucket

type UserBucketDetails <: AbstractAWSType
    s3Bucket::Union{Void,String}
    s3Key::Union{Void,String}
    function UserBucketDetails(;s3Bucket=nothing, s3Key=nothing)
        new(s3Bucket, s3Key)
    end
    UserBucketDetails(pd) = parse_from_xml(UserBucketDetails, EC2TypeDict, pd)
end # UserBucketDetails
export UserBucketDetails

type UserData <: AbstractAWSType
    data::Union{Void,String}
    function UserData(;data=nothing)
        new(data)
    end
    UserData(pd) = parse_from_xml(UserData, EC2TypeDict, pd)
end # UserData
export UserData

type UserIdGroupPair <: AbstractAWSType
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    peeringStatus::Union{Void,String}
    userId::Union{Void,String}
    vpcId::Union{Void,String}
    vpcPeeringConnectionId::Union{Void,String}
    function UserIdGroupPair(;groupId=nothing, groupName=nothing, peeringStatus=nothing, userId=nothing, vpcId=nothing, vpcPeeringConnectionId=nothing)
        new(groupId, groupName, peeringStatus, userId, vpcId, vpcPeeringConnectionId)
    end
    UserIdGroupPair(pd) = parse_from_xml(UserIdGroupPair, EC2TypeDict, pd)
end # UserIdGroupPair
export UserIdGroupPair

type VgwTelemetry <: AbstractAWSType
    acceptedRouteCount::Union{Void,Int64}
    lastStatusChange::Union{Void,DateTime}
    outsideIpAddress::Union{Void,String}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    function VgwTelemetry(;acceptedRouteCount=nothing, lastStatusChange=nothing, outsideIpAddress=nothing, status=nothing, statusMessage=nothing)
        new(acceptedRouteCount, lastStatusChange, outsideIpAddress, status, statusMessage)
    end
    VgwTelemetry(pd) = parse_from_xml(VgwTelemetry, EC2TypeDict, pd)
end # VgwTelemetry
export VgwTelemetry

type VolumeAttachment <: AbstractAWSType
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    device::Union{Void,String}
    instanceId::Union{Void,String}
    status::Union{Void,String}
    volumeId::Union{Void,String}
    function VolumeAttachment(;attachTime=nothing, deleteOnTermination=nothing, device=nothing, instanceId=nothing, status=nothing, volumeId=nothing)
        new(attachTime, deleteOnTermination, device, instanceId, status, volumeId)
    end
    VolumeAttachment(pd) = parse_from_xml(VolumeAttachment, EC2TypeDict, pd)
end # VolumeAttachment
export VolumeAttachment

type VolumeDetail <: AbstractAWSType
    size::Union{Void,Int64}
    function VolumeDetail(;size=nothing)
        new(size)
    end
    VolumeDetail(pd) = parse_from_xml(VolumeDetail, EC2TypeDict, pd)
end # VolumeDetail
export VolumeDetail

type VolumeModification <: AbstractAWSType
    endTime::Union{Void,DateTime}
    modificationState::Union{Void,String}
    originalIops::Union{Void,Int64}
    originalSize::Union{Void,Int64}
    originalVolumeType::Union{Void,String}
    progress::Union{Void,Int64}
    startTime::Union{Void,DateTime}
    statusMessage::Union{Void,String}
    targetIops::Union{Void,Int64}
    targetSize::Union{Void,Int64}
    targetVolumeType::Union{Void,String}
    volumeId::Union{Void,String}
    function VolumeModification(;endTime=nothing, modificationState=nothing, originalIops=nothing, originalSize=nothing, originalVolumeType=nothing, progress=nothing, startTime=nothing, statusMessage=nothing, targetIops=nothing, targetSize=nothing, targetVolumeType=nothing, volumeId=nothing)
        new(endTime, modificationState, originalIops, originalSize, originalVolumeType, progress, startTime, statusMessage, targetIops, targetSize, targetVolumeType, volumeId)
    end
    VolumeModification(pd) = parse_from_xml(VolumeModification, EC2TypeDict, pd)
end # VolumeModification
export VolumeModification

type VolumeStatusAction <: AbstractAWSType
    code::Union{Void,String}
    description::Union{Void,String}
    eventId::Union{Void,String}
    eventType::Union{Void,String}
    function VolumeStatusAction(;code=nothing, description=nothing, eventId=nothing, eventType=nothing)
        new(code, description, eventId, eventType)
    end
    VolumeStatusAction(pd) = parse_from_xml(VolumeStatusAction, EC2TypeDict, pd)
end # VolumeStatusAction
export VolumeStatusAction

type VolumeStatusDetails <: AbstractAWSType
    name::Union{Void,String}
    status::Union{Void,String}
    function VolumeStatusDetails(;name=nothing, status=nothing)
        new(name, status)
    end
    VolumeStatusDetails(pd) = parse_from_xml(VolumeStatusDetails, EC2TypeDict, pd)
end # VolumeStatusDetails
export VolumeStatusDetails

type VolumeStatusEvent <: AbstractAWSType
    description::Union{Void,String}
    eventId::Union{Void,String}
    eventType::Union{Void,String}
    notAfter::Union{Void,DateTime}
    notBefore::Union{Void,DateTime}
    function VolumeStatusEvent(;description=nothing, eventId=nothing, eventType=nothing, notAfter=nothing, notBefore=nothing)
        new(description, eventId, eventType, notAfter, notBefore)
    end
    VolumeStatusEvent(pd) = parse_from_xml(VolumeStatusEvent, EC2TypeDict, pd)
end # VolumeStatusEvent
export VolumeStatusEvent

type VolumeStatusInfo <: AbstractAWSType
    details::Union{Void,Array{VolumeStatusDetails,1}}
    status::Union{Void,String}
    function VolumeStatusInfo(;details=nothing, status=nothing)
        new(details, status)
    end
    VolumeStatusInfo(pd) = parse_from_xml(VolumeStatusInfo, EC2TypeDict, pd)
end # VolumeStatusInfo
export VolumeStatusInfo

type VolumeStatusItem <: AbstractAWSType
    actionsSet::Union{Void,Array{VolumeStatusAction,1}}
    availabilityZone::Union{Void,String}
    eventsSet::Union{Void,Array{VolumeStatusEvent,1}}
    volumeId::Union{Void,String}
    volumeStatus::Union{Void,VolumeStatusInfo}
    function VolumeStatusItem(;actionsSet=nothing, availabilityZone=nothing, eventsSet=nothing, volumeId=nothing, volumeStatus=nothing)
        new(actionsSet, availabilityZone, eventsSet, volumeId, volumeStatus)
    end
    VolumeStatusItem(pd) = parse_from_xml(VolumeStatusItem, EC2TypeDict, pd)
end # VolumeStatusItem
export VolumeStatusItem

type Volume <: AbstractAWSType
    attachmentSet::Union{Void,Array{VolumeAttachment,1}}
    availabilityZone::Union{Void,String}
    createTime::Union{Void,DateTime}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    kmsKeyId::Union{Void,String}
    size::Union{Void,Int64}
    snapshotId::Union{Void,String}
    status::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    volumeId::Union{Void,String}
    volumeType::Union{Void,String}
    function Volume(;attachmentSet=nothing, availabilityZone=nothing, createTime=nothing, encrypted=nothing, iops=nothing, kmsKeyId=nothing, size=nothing, snapshotId=nothing, status=nothing, tagSet=nothing, volumeId=nothing, volumeType=nothing)
        new(attachmentSet, availabilityZone, createTime, encrypted, iops, kmsKeyId, size, snapshotId, status, tagSet, volumeId, volumeType)
    end
    Volume(pd) = parse_from_xml(Volume, EC2TypeDict, pd)
end # Volume
export Volume

type EbsBlockDevice <: AbstractAWSType
    deleteOnTermination::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    snapshotId::Union{Void,String}
    volumeSize::Union{Void,Int64}
    volumeType::Union{Void,Volume}
    function EbsBlockDevice(;deleteOnTermination=nothing, encrypted=nothing, iops=nothing, snapshotId=nothing, volumeSize=nothing, volumeType=nothing)
        new(deleteOnTermination, encrypted, iops, snapshotId, volumeSize, volumeType)
    end
    EbsBlockDevice(pd) = parse_from_xml(EbsBlockDevice, EC2TypeDict, pd)
end # EbsBlockDevice
export EbsBlockDevice

type BlockDeviceMapping <: AbstractAWSType
    deviceName::Union{Void,String}
    ebs::Union{Void,EbsBlockDevice}
    noDevice::Union{Void,String}
    virtualName::Union{Void,String}
    function BlockDeviceMapping(;deviceName=nothing, ebs=nothing, noDevice=nothing, virtualName=nothing)
        new(deviceName, ebs, noDevice, virtualName)
    end
    BlockDeviceMapping(pd) = parse_from_xml(BlockDeviceMapping, EC2TypeDict, pd)
end # BlockDeviceMapping
export BlockDeviceMapping

type BundleTaskError <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function BundleTaskError(;code=nothing, message=nothing)
        new(code, message)
    end
    BundleTaskError(pd) = parse_from_xml(BundleTaskError, EC2TypeDict, pd)
end # BundleTaskError
export BundleTaskError

type RunInstancesMonitoringEnabled <: AbstractAWSType
    enabled::Union{Void,Bool}
    function RunInstancesMonitoringEnabled(;enabled=nothing)
        new(enabled)
    end
    RunInstancesMonitoringEnabled(pd) = parse_from_xml(RunInstancesMonitoringEnabled, EC2TypeDict, pd)
end # RunInstancesMonitoringEnabled
export RunInstancesMonitoringEnabled

type S3Storage <: AbstractAWSType
    aWSAccessKeyId::Union{Void,String}
    bucket::Union{Void,String}
    prefix::Union{Void,String}
    uploadPolicy::Union{Void,Array{UInt8,1}}
    uploadPolicySignature::Union{Void,String}
    function S3Storage(;aWSAccessKeyId=nothing, bucket=nothing, prefix=nothing, uploadPolicy=nothing, uploadPolicySignature=nothing)
        new(aWSAccessKeyId, bucket, prefix, uploadPolicy, uploadPolicySignature)
    end
    S3Storage(pd) = parse_from_xml(S3Storage, EC2TypeDict, pd)
end # S3Storage
export S3Storage

type SpotInstanceStateFault <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function SpotInstanceStateFault(;code=nothing, message=nothing)
        new(code, message)
    end
    SpotInstanceStateFault(pd) = parse_from_xml(SpotInstanceStateFault, EC2TypeDict, pd)
end # SpotInstanceStateFault
export SpotInstanceStateFault

type SpotInstanceStatus <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    updateTime::Union{Void,DateTime}
    function SpotInstanceStatus(;code=nothing, message=nothing, updateTime=nothing)
        new(code, message, updateTime)
    end
    SpotInstanceStatus(pd) = parse_from_xml(SpotInstanceStatus, EC2TypeDict, pd)
end # SpotInstanceStatus
export SpotInstanceStatus

type SpotPlacement <: AbstractAWSType
    availabilityZone::Union{Void,String}
    groupName::Union{Void,String}
    tenancy::Union{Void,String}
    function SpotPlacement(;availabilityZone=nothing, groupName=nothing, tenancy=nothing)
        new(availabilityZone, groupName, tenancy)
    end
    SpotPlacement(pd) = parse_from_xml(SpotPlacement, EC2TypeDict, pd)
end # SpotPlacement
export SpotPlacement

type SpotPrice <: AbstractAWSType
    availabilityZone::Union{Void,String}
    instanceType::Union{Void,String}
    productDescription::Union{Void,String}
    spotPrice::Union{Void,String}
    timestamp::Union{Void,DateTime}
    function SpotPrice(;availabilityZone=nothing, instanceType=nothing, productDescription=nothing, spotPrice=nothing, timestamp=nothing)
        new(availabilityZone, instanceType, productDescription, spotPrice, timestamp)
    end
    SpotPrice(pd) = parse_from_xml(SpotPrice, EC2TypeDict, pd)
end # SpotPrice
export SpotPrice

type Storage <: AbstractAWSType
    s3::Union{Void,S3Storage}
    function Storage(;s3=nothing)
        new(s3)
    end
    Storage(pd) = parse_from_xml(Storage, EC2TypeDict, pd)
end # Storage
export Storage

type StorageLocation <: AbstractAWSType
    bucket::Union{Void,String}
    key::Union{Void,String}
    function StorageLocation(;bucket=nothing, key=nothing)
        new(bucket, key)
    end
    StorageLocation(pd) = parse_from_xml(StorageLocation, EC2TypeDict, pd)
end # StorageLocation
export StorageLocation

type BundleTask <: AbstractAWSType
    bundleId::Union{Void,String}
    error::Union{Void,BundleTaskError}
    instanceId::Union{Void,String}
    progress::Union{Void,String}
    startTime::Union{Void,DateTime}
    state::Union{Void,String}
    storage::Union{Void,Storage}
    updateTime::Union{Void,DateTime}
    function BundleTask(;bundleId=nothing, error=nothing, instanceId=nothing, progress=nothing, startTime=nothing, state=nothing, storage=nothing, updateTime=nothing)
        new(bundleId, error, instanceId, progress, startTime, state, storage, updateTime)
    end
    BundleTask(pd) = parse_from_xml(BundleTask, EC2TypeDict, pd)
end # BundleTask
export BundleTask

type CancelledSpotInstanceRequest <: AbstractAWSType
    spotInstanceRequestId::Union{Void,String}
    state::Union{Void,String}
    function CancelledSpotInstanceRequest(;spotInstanceRequestId=nothing, state=nothing)
        new(spotInstanceRequestId, state)
    end
    CancelledSpotInstanceRequest(pd) = parse_from_xml(CancelledSpotInstanceRequest, EC2TypeDict, pd)
end # CancelledSpotInstanceRequest
export CancelledSpotInstanceRequest

type CancelSpotFleetRequestsError <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function CancelSpotFleetRequestsError(;code=nothing, message=nothing)
        new(code, message)
    end
    CancelSpotFleetRequestsError(pd) = parse_from_xml(CancelSpotFleetRequestsError, EC2TypeDict, pd)
end # CancelSpotFleetRequestsError
export CancelSpotFleetRequestsError

type CancelSpotFleetRequestsErrorItem <: AbstractAWSType
    error::Union{Void,CancelSpotFleetRequestsError}
    spotFleetRequestId::Union{Void,String}
    function CancelSpotFleetRequestsErrorItem(;error=nothing, spotFleetRequestId=nothing)
        new(error, spotFleetRequestId)
    end
    CancelSpotFleetRequestsErrorItem(pd) = parse_from_xml(CancelSpotFleetRequestsErrorItem, EC2TypeDict, pd)
end # CancelSpotFleetRequestsErrorItem
export CancelSpotFleetRequestsErrorItem

type CancelSpotFleetRequestsSuccessItem <: AbstractAWSType
    currentSpotFleetRequestState::Union{Void,String}
    previousSpotFleetRequestState::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    function CancelSpotFleetRequestsSuccessItem(;currentSpotFleetRequestState=nothing, previousSpotFleetRequestState=nothing, spotFleetRequestId=nothing)
        new(currentSpotFleetRequestState, previousSpotFleetRequestState, spotFleetRequestId)
    end
    CancelSpotFleetRequestsSuccessItem(pd) = parse_from_xml(CancelSpotFleetRequestsSuccessItem, EC2TypeDict, pd)
end # CancelSpotFleetRequestsSuccessItem
export CancelSpotFleetRequestsSuccessItem

type GroupIdentifier <: AbstractAWSType
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    function GroupIdentifier(;groupId=nothing, groupName=nothing)
        new(groupId, groupName)
    end
    GroupIdentifier(pd) = parse_from_xml(GroupIdentifier, EC2TypeDict, pd)
end # GroupIdentifier
export GroupIdentifier

type ClassicLinkDnsSupport <: AbstractAWSType
    classicLinkDnsSupported::Union{Void,Bool}
    vpcId::Union{Void,String}
    function ClassicLinkDnsSupport(;classicLinkDnsSupported=nothing, vpcId=nothing)
        new(classicLinkDnsSupported, vpcId)
    end
    ClassicLinkDnsSupport(pd) = parse_from_xml(ClassicLinkDnsSupport, EC2TypeDict, pd)
end # ClassicLinkDnsSupport
export ClassicLinkDnsSupport

type ClassicLinkInstance <: AbstractAWSType
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    instanceId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function ClassicLinkInstance(;groupSet=nothing, instanceId=nothing, tagSet=nothing, vpcId=nothing)
        new(groupSet, instanceId, tagSet, vpcId)
    end
    ClassicLinkInstance(pd) = parse_from_xml(ClassicLinkInstance, EC2TypeDict, pd)
end # ClassicLinkInstance
export ClassicLinkInstance

type ClientData <: AbstractAWSType
    comment::Union{Void,String}
    uploadEnd::Union{Void,DateTime}
    uploadSize::Union{Void,Float64}
    uploadStart::Union{Void,DateTime}
    function ClientData(;comment=nothing, uploadEnd=nothing, uploadSize=nothing, uploadStart=nothing)
        new(comment, uploadEnd, uploadSize, uploadStart)
    end
    ClientData(pd) = parse_from_xml(ClientData, EC2TypeDict, pd)
end # ClientData
export ClientData

type DiskImageDetail <: AbstractAWSType
    bytes::Union{Void,Int64}
    format::Union{Void,String}
    importManifestUrl::Union{Void,String}
    function DiskImageDetail(;bytes=nothing, format=nothing, importManifestUrl=nothing)
        new(bytes, format, importManifestUrl)
    end
    DiskImageDetail(pd) = parse_from_xml(DiskImageDetail, EC2TypeDict, pd)
end # DiskImageDetail
export DiskImageDetail

type DiskImage <: AbstractAWSType
    description::Union{Void,String}
    image::Union{Void,DiskImageDetail}
    volume::Union{Void,VolumeDetail}
    function DiskImage(;description=nothing, image=nothing, volume=nothing)
        new(description, image, volume)
    end
    DiskImage(pd) = parse_from_xml(DiskImage, EC2TypeDict, pd)
end # DiskImage
export DiskImage

type DiskImageDescription <: AbstractAWSType
    checksum::Union{Void,String}
    format::Union{Void,String}
    importManifestUrl::Union{Void,String}
    size::Union{Void,Int64}
    function DiskImageDescription(;checksum=nothing, format=nothing, importManifestUrl=nothing, size=nothing)
        new(checksum, format, importManifestUrl, size)
    end
    DiskImageDescription(pd) = parse_from_xml(DiskImageDescription, EC2TypeDict, pd)
end # DiskImageDescription
export DiskImageDescription

type DiskImageVolumeDescription <: AbstractAWSType
    id::Union{Void,String}
    size::Union{Void,Int64}
    function DiskImageVolumeDescription(;id=nothing, size=nothing)
        new(id, size)
    end
    DiskImageVolumeDescription(pd) = parse_from_xml(DiskImageVolumeDescription, EC2TypeDict, pd)
end # DiskImageVolumeDescription
export DiskImageVolumeDescription

type ImportVolumeTaskDetails <: AbstractAWSType
    availabilityZone::Union{Void,String}
    bytesConverted::Union{Void,Int64}
    description::Union{Void,String}
    image::Union{Void,DiskImageDescription}
    volume::Union{Void,DiskImageVolumeDescription}
    function ImportVolumeTaskDetails(;availabilityZone=nothing, bytesConverted=nothing, description=nothing, image=nothing, volume=nothing)
        new(availabilityZone, bytesConverted, description, image, volume)
    end
    ImportVolumeTaskDetails(pd) = parse_from_xml(ImportVolumeTaskDetails, EC2TypeDict, pd)
end # ImportVolumeTaskDetails
export ImportVolumeTaskDetails

type ImportInstanceVolumeDetailItem <: AbstractAWSType
    availabilityZone::Union{Void,String}
    bytesConverted::Union{Void,Int64}
    description::Union{Void,String}
    image::Union{Void,DiskImageDescription}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    volume::Union{Void,DiskImageVolumeDescription}
    function ImportInstanceVolumeDetailItem(;availabilityZone=nothing, bytesConverted=nothing, description=nothing, image=nothing, status=nothing, statusMessage=nothing, volume=nothing)
        new(availabilityZone, bytesConverted, description, image, status, statusMessage, volume)
    end
    ImportInstanceVolumeDetailItem(pd) = parse_from_xml(ImportInstanceVolumeDetailItem, EC2TypeDict, pd)
end # ImportInstanceVolumeDetailItem
export ImportInstanceVolumeDetailItem

type ImportInstanceTaskDetails <: AbstractAWSType
    description::Union{Void,String}
    instanceId::Union{Void,String}
    platform::Union{Void,String}
    volumes::Union{Void,Array{ImportInstanceVolumeDetailItem,1}}
    function ImportInstanceTaskDetails(;description=nothing, instanceId=nothing, platform=nothing, volumes=nothing)
        new(description, instanceId, platform, volumes)
    end
    ImportInstanceTaskDetails(pd) = parse_from_xml(ImportInstanceTaskDetails, EC2TypeDict, pd)
end # ImportInstanceTaskDetails
export ImportInstanceTaskDetails

type ConversionTask <: AbstractAWSType
    conversionTaskId::Union{Void,String}
    expirationTime::Union{Void,String}
    importInstance::Union{Void,ImportInstanceTaskDetails}
    importVolume::Union{Void,ImportVolumeTaskDetails}
    state::Union{Void,String}
    statusMessage::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    function ConversionTask(;conversionTaskId=nothing, expirationTime=nothing, importInstance=nothing, importVolume=nothing, state=nothing, statusMessage=nothing, tagSet=nothing)
        new(conversionTaskId, expirationTime, importInstance, importVolume, state, statusMessage, tagSet)
    end
    ConversionTask(pd) = parse_from_xml(ConversionTask, EC2TypeDict, pd)
end # ConversionTask
export ConversionTask

type CreateVolumePermission <: AbstractAWSType
    group::Union{Void,String}
    userId::Union{Void,String}
    function CreateVolumePermission(;group=nothing, userId=nothing)
        new(group, userId)
    end
    CreateVolumePermission(pd) = parse_from_xml(CreateVolumePermission, EC2TypeDict, pd)
end # CreateVolumePermission
export CreateVolumePermission

type CreateVolumePermissionModifications <: AbstractAWSType
    add::Union{Void,Array{CreateVolumePermission,1}}
    remove::Union{Void,Array{CreateVolumePermission,1}}
    function CreateVolumePermissionModifications(;add=nothing, remove=nothing)
        new(add, remove)
    end
    CreateVolumePermissionModifications(pd) = parse_from_xml(CreateVolumePermissionModifications, EC2TypeDict, pd)
end # CreateVolumePermissionModifications
export CreateVolumePermissionModifications

type CustomerGateway <: AbstractAWSType
    bgpAsn::Union{Void,String}
    customerGatewayId::Union{Void,String}
    ipAddress::Union{Void,String}
    state::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    _type::Union{Void,String}
    function CustomerGateway(;bgpAsn=nothing, customerGatewayId=nothing, ipAddress=nothing, state=nothing, tagSet=nothing, _type=nothing)
        new(bgpAsn, customerGatewayId, ipAddress, state, tagSet, _type)
    end
    CustomerGateway(pd) = parse_from_xml(CustomerGateway, EC2TypeDict, pd)
end # CustomerGateway
export CustomerGateway

type DhcpConfiguration <: AbstractAWSType
    key::Union{Void,String}
    valueSet::Union{Void,Array{AttributeValue,1}}
    function DhcpConfiguration(;key=nothing, valueSet=nothing)
        new(key, valueSet)
    end
    DhcpConfiguration(pd) = parse_from_xml(DhcpConfiguration, EC2TypeDict, pd)
end # DhcpConfiguration
export DhcpConfiguration

type DhcpOptions <: AbstractAWSType
    dhcpConfigurationSet::Union{Void,Array{DhcpConfiguration,1}}
    dhcpOptionsId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    function DhcpOptions(;dhcpConfigurationSet=nothing, dhcpOptionsId=nothing, tagSet=nothing)
        new(dhcpConfigurationSet, dhcpOptionsId, tagSet)
    end
    DhcpOptions(pd) = parse_from_xml(DhcpOptions, EC2TypeDict, pd)
end # DhcpOptions
export DhcpOptions

type EbsInstanceBlockDevice <: AbstractAWSType
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    status::Union{Void,String}
    volumeId::Union{Void,String}
    function EbsInstanceBlockDevice(;attachTime=nothing, deleteOnTermination=nothing, status=nothing, volumeId=nothing)
        new(attachTime, deleteOnTermination, status, volumeId)
    end
    EbsInstanceBlockDevice(pd) = parse_from_xml(EbsInstanceBlockDevice, EC2TypeDict, pd)
end # EbsInstanceBlockDevice
export EbsInstanceBlockDevice

type EbsInstanceBlockDeviceSpecification <: AbstractAWSType
    deleteOnTermination::Union{Void,Bool}
    volumeId::Union{Void,String}
    function EbsInstanceBlockDeviceSpecification(;deleteOnTermination=nothing, volumeId=nothing)
        new(deleteOnTermination, volumeId)
    end
    EbsInstanceBlockDeviceSpecification(pd) = parse_from_xml(EbsInstanceBlockDeviceSpecification, EC2TypeDict, pd)
end # EbsInstanceBlockDeviceSpecification
export EbsInstanceBlockDeviceSpecification

type InternetGatewayAttachment <: AbstractAWSType
    state::Union{Void,String}
    vpcId::Union{Void,String}
    function InternetGatewayAttachment(;state=nothing, vpcId=nothing)
        new(state, vpcId)
    end
    InternetGatewayAttachment(pd) = parse_from_xml(InternetGatewayAttachment, EC2TypeDict, pd)
end # InternetGatewayAttachment
export InternetGatewayAttachment

type InternetGateway <: AbstractAWSType
    attachmentSet::Union{Void,Array{InternetGatewayAttachment,1}}
    internetGatewayId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    function InternetGateway(;attachmentSet=nothing, internetGatewayId=nothing, tagSet=nothing)
        new(attachmentSet, internetGatewayId, tagSet)
    end
    InternetGateway(pd) = parse_from_xml(InternetGateway, EC2TypeDict, pd)
end # InternetGateway
export InternetGateway

type EgressOnlyInternetGateway <: AbstractAWSType
    attachmentSet::Union{Void,Array{InternetGatewayAttachment,1}}
    egressOnlyInternetGatewayId::Union{Void,String}
    function EgressOnlyInternetGateway(;attachmentSet=nothing, egressOnlyInternetGatewayId=nothing)
        new(attachmentSet, egressOnlyInternetGatewayId)
    end
    EgressOnlyInternetGateway(pd) = parse_from_xml(EgressOnlyInternetGateway, EC2TypeDict, pd)
end # EgressOnlyInternetGateway
export EgressOnlyInternetGateway

type EventInformation <: AbstractAWSType
    eventDescription::Union{Void,String}
    eventSubType::Union{Void,String}
    instanceId::Union{Void,String}
    function EventInformation(;eventDescription=nothing, eventSubType=nothing, instanceId=nothing)
        new(eventDescription, eventSubType, instanceId)
    end
    EventInformation(pd) = parse_from_xml(EventInformation, EC2TypeDict, pd)
end # EventInformation
export EventInformation

type ExportToS3Task <: AbstractAWSType
    containerFormat::Union{Void,String}
    diskImageFormat::Union{Void,String}
    s3Bucket::Union{Void,String}
    s3Key::Union{Void,String}
    function ExportToS3Task(;containerFormat=nothing, diskImageFormat=nothing, s3Bucket=nothing, s3Key=nothing)
        new(containerFormat, diskImageFormat, s3Bucket, s3Key)
    end
    ExportToS3Task(pd) = parse_from_xml(ExportToS3Task, EC2TypeDict, pd)
end # ExportToS3Task
export ExportToS3Task

type InstanceCount <: AbstractAWSType
    instanceCount::Union{Void,Int64}
    state::Union{Void,String}
    function InstanceCount(;instanceCount=nothing, state=nothing)
        new(instanceCount, state)
    end
    InstanceCount(pd) = parse_from_xml(InstanceCount, EC2TypeDict, pd)
end # InstanceCount
export InstanceCount

type InstanceExportDetails <: AbstractAWSType
    instanceId::Union{Void,String}
    targetEnvironment::Union{Void,String}
    function InstanceExportDetails(;instanceId=nothing, targetEnvironment=nothing)
        new(instanceId, targetEnvironment)
    end
    InstanceExportDetails(pd) = parse_from_xml(InstanceExportDetails, EC2TypeDict, pd)
end # InstanceExportDetails
export InstanceExportDetails

type InstanceIpv6Address <: AbstractAWSType
    ipv6Address::Union{Void,String}
    function InstanceIpv6Address(;ipv6Address=nothing)
        new(ipv6Address)
    end
    InstanceIpv6Address(pd) = parse_from_xml(InstanceIpv6Address, EC2TypeDict, pd)
end # InstanceIpv6Address
export InstanceIpv6Address

type ExportTask <: AbstractAWSType
    description::Union{Void,String}
    exportTaskId::Union{Void,String}
    exportToS3::Union{Void,ExportToS3Task}
    instanceExport::Union{Void,InstanceExportDetails}
    state::Union{Void,String}
    statusMessage::Union{Void,String}
    function ExportTask(;description=nothing, exportTaskId=nothing, exportToS3=nothing, instanceExport=nothing, state=nothing, statusMessage=nothing)
        new(description, exportTaskId, exportToS3, instanceExport, state, statusMessage)
    end
    ExportTask(pd) = parse_from_xml(ExportTask, EC2TypeDict, pd)
end # ExportTask
export ExportTask

type ExportToS3TaskSpecification <: AbstractAWSType
    containerFormat::Union{Void,String}
    diskImageFormat::Union{Void,String}
    s3Bucket::Union{Void,String}
    s3Prefix::Union{Void,String}
    function ExportToS3TaskSpecification(;containerFormat=nothing, diskImageFormat=nothing, s3Bucket=nothing, s3Prefix=nothing)
        new(containerFormat, diskImageFormat, s3Bucket, s3Prefix)
    end
    ExportToS3TaskSpecification(pd) = parse_from_xml(ExportToS3TaskSpecification, EC2TypeDict, pd)
end # ExportToS3TaskSpecification
export ExportToS3TaskSpecification

type Filter <: AbstractAWSType
    name::Union{Void,String}
    value::Union{Void,Array{String,1}}
    function Filter(;name=nothing, value=nothing)
        new(name, value)
    end
    Filter(pd) = parse_from_xml(Filter, EC2TypeDict, pd)
end # Filter
export Filter

type FlowLog <: AbstractAWSType
    creationTime::Union{Void,DateTime}
    deliverLogsErrorMessage::Union{Void,String}
    deliverLogsPermissionArn::Union{Void,String}
    deliverLogsStatus::Union{Void,String}
    flowLogId::Union{Void,String}
    flowLogStatus::Union{Void,String}
    logGroupName::Union{Void,String}
    resourceId::Union{Void,String}
    trafficType::Union{Void,String}
    function FlowLog(;creationTime=nothing, deliverLogsErrorMessage=nothing, deliverLogsPermissionArn=nothing, deliverLogsStatus=nothing, flowLogId=nothing, flowLogStatus=nothing, logGroupName=nothing, resourceId=nothing, trafficType=nothing)
        new(creationTime, deliverLogsErrorMessage, deliverLogsPermissionArn, deliverLogsStatus, flowLogId, flowLogStatus, logGroupName, resourceId, trafficType)
    end
    FlowLog(pd) = parse_from_xml(FlowLog, EC2TypeDict, pd)
end # FlowLog
export FlowLog

type FpgaImageState <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function FpgaImageState(;code=nothing, message=nothing)
        new(code, message)
    end
    FpgaImageState(pd) = parse_from_xml(FpgaImageState, EC2TypeDict, pd)
end # FpgaImageState
export FpgaImageState

type PciId <: AbstractAWSType
    deviceId::Union{Void,String}
    subsystemId::Union{Void,String}
    subsystemVendorId::Union{Void,String}
    vendorId::Union{Void,String}
    function PciId(;deviceId=nothing, subsystemId=nothing, subsystemVendorId=nothing, vendorId=nothing)
        new(deviceId, subsystemId, subsystemVendorId, vendorId)
    end
    PciId(pd) = parse_from_xml(PciId, EC2TypeDict, pd)
end # PciId
export PciId

type NewDhcpConfiguration <: AbstractAWSType
    key::Union{Void,String}
    values::Union{Void,Array{String,1}}
    function NewDhcpConfiguration(;key=nothing, values=nothing)
        new(key, values)
    end
    NewDhcpConfiguration(pd) = parse_from_xml(NewDhcpConfiguration, EC2TypeDict, pd)
end # NewDhcpConfiguration
export NewDhcpConfiguration

type PeeringConnectionOptions <: AbstractAWSType
    allowDnsResolutionFromRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalClassicLinkToRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalVpcToRemoteClassicLink::Union{Void,Bool}
    function PeeringConnectionOptions(;allowDnsResolutionFromRemoteVpc=nothing, allowEgressFromLocalClassicLinkToRemoteVpc=nothing, allowEgressFromLocalVpcToRemoteClassicLink=nothing)
        new(allowDnsResolutionFromRemoteVpc, allowEgressFromLocalClassicLinkToRemoteVpc, allowEgressFromLocalVpcToRemoteClassicLink)
    end
    PeeringConnectionOptions(pd) = parse_from_xml(PeeringConnectionOptions, EC2TypeDict, pd)
end # PeeringConnectionOptions
export PeeringConnectionOptions

type PeeringConnectionOptionsRequest <: AbstractAWSType
    allowDnsResolutionFromRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalClassicLinkToRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalVpcToRemoteClassicLink::Union{Void,Bool}
    function PeeringConnectionOptionsRequest(;allowDnsResolutionFromRemoteVpc=nothing, allowEgressFromLocalClassicLinkToRemoteVpc=nothing, allowEgressFromLocalVpcToRemoteClassicLink=nothing)
        new(allowDnsResolutionFromRemoteVpc, allowEgressFromLocalClassicLinkToRemoteVpc, allowEgressFromLocalVpcToRemoteClassicLink)
    end
    PeeringConnectionOptionsRequest(pd) = parse_from_xml(PeeringConnectionOptionsRequest, EC2TypeDict, pd)
end # PeeringConnectionOptionsRequest
export PeeringConnectionOptionsRequest

type Placement <: AbstractAWSType
    affinity::Union{Void,String}
    availabilityZone::Union{Void,String}
    groupName::Union{Void,String}
    hostId::Union{Void,String}
    spreadDomain::Union{Void,String}
    tenancy::Union{Void,String}
    function Placement(;affinity=nothing, availabilityZone=nothing, groupName=nothing, hostId=nothing, spreadDomain=nothing, tenancy=nothing)
        new(affinity, availabilityZone, groupName, hostId, spreadDomain, tenancy)
    end
    Placement(pd) = parse_from_xml(Placement, EC2TypeDict, pd)
end # Placement
export Placement

type PlacementGroup <: AbstractAWSType
    groupName::Union{Void,String}
    state::Union{Void,String}
    strategy::Union{Void,String}
    function PlacementGroup(;groupName=nothing, state=nothing, strategy=nothing)
        new(groupName, state, strategy)
    end
    PlacementGroup(pd) = parse_from_xml(PlacementGroup, EC2TypeDict, pd)
end # PlacementGroup
export PlacementGroup

type PortRange <: AbstractAWSType
    from::Union{Void,Int64}
    to::Union{Void,Int64}
    function PortRange(;from=nothing, to=nothing)
        new(from, to)
    end
    PortRange(pd) = parse_from_xml(PortRange, EC2TypeDict, pd)
end # PortRange
export PortRange

type PrefixList <: AbstractAWSType
    cidrSet::Union{Void,Array{String,1}}
    prefixListId::Union{Void,String}
    prefixListName::Union{Void,String}
    function PrefixList(;cidrSet=nothing, prefixListId=nothing, prefixListName=nothing)
        new(cidrSet, prefixListId, prefixListName)
    end
    PrefixList(pd) = parse_from_xml(PrefixList, EC2TypeDict, pd)
end # PrefixList
export PrefixList

type PrefixListId <: AbstractAWSType
    prefixListId::Union{Void,String}
    function PrefixListId(;prefixListId=nothing)
        new(prefixListId)
    end
    PrefixListId(pd) = parse_from_xml(PrefixListId, EC2TypeDict, pd)
end # PrefixListId
export PrefixListId

type PriceSchedule <: AbstractAWSType
    active::Union{Void,Bool}
    currencyCode::Union{Void,String}
    price::Union{Void,Float64}
    term::Union{Void,Int64}
    function PriceSchedule(;active=nothing, currencyCode=nothing, price=nothing, term=nothing)
        new(active, currencyCode, price, term)
    end
    PriceSchedule(pd) = parse_from_xml(PriceSchedule, EC2TypeDict, pd)
end # PriceSchedule
export PriceSchedule

type PriceScheduleSpecification <: AbstractAWSType
    currencyCode::Union{Void,String}
    price::Union{Void,Float64}
    term::Union{Void,Int64}
    function PriceScheduleSpecification(;currencyCode=nothing, price=nothing, term=nothing)
        new(currencyCode, price, term)
    end
    PriceScheduleSpecification(pd) = parse_from_xml(PriceScheduleSpecification, EC2TypeDict, pd)
end # PriceScheduleSpecification
export PriceScheduleSpecification

type PricingDetail <: AbstractAWSType
    count::Union{Void,Int64}
    price::Union{Void,Float64}
    function PricingDetail(;count=nothing, price=nothing)
        new(count, price)
    end
    PricingDetail(pd) = parse_from_xml(PricingDetail, EC2TypeDict, pd)
end # PricingDetail
export PricingDetail

type PrivateIpAddressSpecification <: AbstractAWSType
    primary::Union{Void,Bool}
    privateIpAddress::Union{Void,String}
    function PrivateIpAddressSpecification(;primary=nothing, privateIpAddress=nothing)
        new(primary, privateIpAddress)
    end
    PrivateIpAddressSpecification(pd) = parse_from_xml(PrivateIpAddressSpecification, EC2TypeDict, pd)
end # PrivateIpAddressSpecification
export PrivateIpAddressSpecification

type ProductCode <: AbstractAWSType
    productCode::Union{Void,String}
    _type::Union{Void,String}
    function ProductCode(;productCode=nothing, _type=nothing)
        new(productCode, _type)
    end
    ProductCode(pd) = parse_from_xml(ProductCode, EC2TypeDict, pd)
end # ProductCode
export ProductCode

type PropagatingVgw <: AbstractAWSType
    gatewayId::Union{Void,String}
    function PropagatingVgw(;gatewayId=nothing)
        new(gatewayId)
    end
    PropagatingVgw(pd) = parse_from_xml(PropagatingVgw, EC2TypeDict, pd)
end # PropagatingVgw
export PropagatingVgw

type ProvisionedBandwidth <: AbstractAWSType
    provisioned::Union{Void,String}
    provisionTime::Union{Void,DateTime}
    requested::Union{Void,String}
    requestTime::Union{Void,DateTime}
    status::Union{Void,String}
    function ProvisionedBandwidth(;provisioned=nothing, provisionTime=nothing, requested=nothing, requestTime=nothing, status=nothing)
        new(provisioned, provisionTime, requested, requestTime, status)
    end
    ProvisionedBandwidth(pd) = parse_from_xml(ProvisionedBandwidth, EC2TypeDict, pd)
end # ProvisionedBandwidth
export ProvisionedBandwidth

type Purchase <: AbstractAWSType
    currencyCode::Union{Void,String}
    duration::Union{Void,Int64}
    hostIdSet::Union{Void,Array{String,1}}
    hostReservationId::Union{Void,String}
    hourlyPrice::Union{Void,String}
    instanceFamily::Union{Void,String}
    paymentOption::Union{Void,String}
    upfrontPrice::Union{Void,String}
    function Purchase(;currencyCode=nothing, duration=nothing, hostIdSet=nothing, hostReservationId=nothing, hourlyPrice=nothing, instanceFamily=nothing, paymentOption=nothing, upfrontPrice=nothing)
        new(currencyCode, duration, hostIdSet, hostReservationId, hourlyPrice, instanceFamily, paymentOption, upfrontPrice)
    end
    Purchase(pd) = parse_from_xml(Purchase, EC2TypeDict, pd)
end # Purchase
export Purchase

type PurchaseRequest <: AbstractAWSType
    instanceCount::Union{Void,Int64}
    purchaseToken::Union{Void,String}
    function PurchaseRequest(;instanceCount=nothing, purchaseToken=nothing)
        new(instanceCount, purchaseToken)
    end
    PurchaseRequest(pd) = parse_from_xml(PurchaseRequest, EC2TypeDict, pd)
end # PurchaseRequest
export PurchaseRequest

type RecurringCharge <: AbstractAWSType
    amount::Union{Void,Float64}
    frequency::Union{Void,String}
    function RecurringCharge(;amount=nothing, frequency=nothing)
        new(amount, frequency)
    end
    RecurringCharge(pd) = parse_from_xml(RecurringCharge, EC2TypeDict, pd)
end # RecurringCharge
export RecurringCharge

type Region <: AbstractAWSType
    regionEndpoint::Union{Void,String}
    regionName::Union{Void,String}
    function Region(;regionEndpoint=nothing, regionName=nothing)
        new(regionEndpoint, regionName)
    end
    Region(pd) = parse_from_xml(Region, EC2TypeDict, pd)
end # Region
export Region

type FpgaImage <: AbstractAWSType
    createTime::Union{Void,DateTime}
    description::Union{Void,String}
    fpgaImageGlobalId::Union{Void,String}
    fpgaImageId::Union{Void,String}
    name::Union{Void,String}
    ownerAlias::Union{Void,String}
    ownerId::Union{Void,String}
    pciId::Union{Void,PciId}
    productCodes::Union{Void,Array{ProductCode,1}}
    shellVersion::Union{Void,String}
    state::Union{Void,FpgaImageState}
    tags::Union{Void,Array{Tag,1}}
    updateTime::Union{Void,DateTime}
    function FpgaImage(;createTime=nothing, description=nothing, fpgaImageGlobalId=nothing, fpgaImageId=nothing, name=nothing, ownerAlias=nothing, ownerId=nothing, pciId=nothing, productCodes=nothing, shellVersion=nothing, state=nothing, tags=nothing, updateTime=nothing)
        new(createTime, description, fpgaImageGlobalId, fpgaImageId, name, ownerAlias, ownerId, pciId, productCodes, shellVersion, state, tags, updateTime)
    end
    FpgaImage(pd) = parse_from_xml(FpgaImage, EC2TypeDict, pd)
end # FpgaImage
export FpgaImage

type HistoryRecord <: AbstractAWSType
    eventInformation::Union{Void,EventInformation}
    eventType::Union{Void,String}
    timestamp::Union{Void,DateTime}
    function HistoryRecord(;eventInformation=nothing, eventType=nothing, timestamp=nothing)
        new(eventInformation, eventType, timestamp)
    end
    HistoryRecord(pd) = parse_from_xml(HistoryRecord, EC2TypeDict, pd)
end # HistoryRecord
export HistoryRecord

type HostInstance <: AbstractAWSType
    instanceId::Union{Void,String}
    instanceType::Union{Void,String}
    function HostInstance(;instanceId=nothing, instanceType=nothing)
        new(instanceId, instanceType)
    end
    HostInstance(pd) = parse_from_xml(HostInstance, EC2TypeDict, pd)
end # HostInstance
export HostInstance

type HostOffering <: AbstractAWSType
    currencyCode::Union{Void,String}
    duration::Union{Void,Int64}
    hourlyPrice::Union{Void,String}
    instanceFamily::Union{Void,String}
    offeringId::Union{Void,String}
    paymentOption::Union{Void,String}
    upfrontPrice::Union{Void,String}
    function HostOffering(;currencyCode=nothing, duration=nothing, hourlyPrice=nothing, instanceFamily=nothing, offeringId=nothing, paymentOption=nothing, upfrontPrice=nothing)
        new(currencyCode, duration, hourlyPrice, instanceFamily, offeringId, paymentOption, upfrontPrice)
    end
    HostOffering(pd) = parse_from_xml(HostOffering, EC2TypeDict, pd)
end # HostOffering
export HostOffering

type HostProperties <: AbstractAWSType
    cores::Union{Void,Int64}
    instanceType::Union{Void,String}
    sockets::Union{Void,Int64}
    totalVCpus::Union{Void,Int64}
    function HostProperties(;cores=nothing, instanceType=nothing, sockets=nothing, totalVCpus=nothing)
        new(cores, instanceType, sockets, totalVCpus)
    end
    HostProperties(pd) = parse_from_xml(HostProperties, EC2TypeDict, pd)
end # HostProperties
export HostProperties

type HostReservation <: AbstractAWSType
    count::Union{Void,Int64}
    currencyCode::Union{Void,String}
    duration::Union{Void,Int64}
    _end::Union{Void,DateTime}
    hostIdSet::Union{Void,Array{String,1}}
    hostReservationId::Union{Void,String}
    hourlyPrice::Union{Void,String}
    instanceFamily::Union{Void,String}
    offeringId::Union{Void,String}
    paymentOption::Union{Void,String}
    start::Union{Void,DateTime}
    state::Union{Void,String}
    upfrontPrice::Union{Void,String}
    function HostReservation(;count=nothing, currencyCode=nothing, duration=nothing, _end=nothing, hostIdSet=nothing, hostReservationId=nothing, hourlyPrice=nothing, instanceFamily=nothing, offeringId=nothing, paymentOption=nothing, start=nothing, state=nothing, upfrontPrice=nothing)
        new(count, currencyCode, duration, _end, hostIdSet, hostReservationId, hourlyPrice, instanceFamily, offeringId, paymentOption, start, state, upfrontPrice)
    end
    HostReservation(pd) = parse_from_xml(HostReservation, EC2TypeDict, pd)
end # HostReservation
export HostReservation

type Host <: AbstractAWSType
    autoPlacement::Union{Void,String}
    availabilityZone::Union{Void,String}
    availableCapacity::Union{Void,AvailableCapacity}
    clientToken::Union{Void,String}
    hostId::Union{Void,String}
    hostProperties::Union{Void,HostProperties}
    hostReservationId::Union{Void,String}
    instances::Union{Void,Array{HostInstance,1}}
    state::Union{Void,String}
    function Host(;autoPlacement=nothing, availabilityZone=nothing, availableCapacity=nothing, clientToken=nothing, hostId=nothing, hostProperties=nothing, hostReservationId=nothing, instances=nothing, state=nothing)
        new(autoPlacement, availabilityZone, availableCapacity, clientToken, hostId, hostProperties, hostReservationId, instances, state)
    end
    Host(pd) = parse_from_xml(Host, EC2TypeDict, pd)
end # Host
export Host

type IamInstanceProfile <: AbstractAWSType
    arn::Union{Void,String}
    id::Union{Void,String}
    function IamInstanceProfile(;arn=nothing, id=nothing)
        new(arn, id)
    end
    IamInstanceProfile(pd) = parse_from_xml(IamInstanceProfile, EC2TypeDict, pd)
end # IamInstanceProfile
export IamInstanceProfile

type IamInstanceProfileAssociation <: AbstractAWSType
    associationId::Union{Void,String}
    iamInstanceProfile::Union{Void,IamInstanceProfile}
    instanceId::Union{Void,String}
    state::Union{Void,String}
    timestamp::Union{Void,DateTime}
    function IamInstanceProfileAssociation(;associationId=nothing, iamInstanceProfile=nothing, instanceId=nothing, state=nothing, timestamp=nothing)
        new(associationId, iamInstanceProfile, instanceId, state, timestamp)
    end
    IamInstanceProfileAssociation(pd) = parse_from_xml(IamInstanceProfileAssociation, EC2TypeDict, pd)
end # IamInstanceProfileAssociation
export IamInstanceProfileAssociation

type IamInstanceProfileSpecification <: AbstractAWSType
    arn::Union{Void,String}
    name::Union{Void,String}
    function IamInstanceProfileSpecification(;arn=nothing, name=nothing)
        new(arn, name)
    end
    IamInstanceProfileSpecification(pd) = parse_from_xml(IamInstanceProfileSpecification, EC2TypeDict, pd)
end # IamInstanceProfileSpecification
export IamInstanceProfileSpecification

type IcmpTypeCode <: AbstractAWSType
    code::Union{Void,Int64}
    _Type::Union{Void,Int64}
    function IcmpTypeCode(;code=nothing, _Type=nothing)
        new(code, _Type)
    end
    IcmpTypeCode(pd) = parse_from_xml(IcmpTypeCode, EC2TypeDict, pd)
end # IcmpTypeCode
export IcmpTypeCode

type IdFormat <: AbstractAWSType
    deadline::Union{Void,DateTime}
    resource::Union{Void,String}
    useLongIds::Union{Void,Bool}
    function IdFormat(;deadline=nothing, resource=nothing, useLongIds=nothing)
        new(deadline, resource, useLongIds)
    end
    IdFormat(pd) = parse_from_xml(IdFormat, EC2TypeDict, pd)
end # IdFormat
export IdFormat

type StateReason <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function StateReason(;code=nothing, message=nothing)
        new(code, message)
    end
    StateReason(pd) = parse_from_xml(StateReason, EC2TypeDict, pd)
end # StateReason
export StateReason

type Image <: AbstractAWSType
    architecture::Union{Void,String}
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    creationDate::Union{Void,String}
    description::Union{Void,String}
    enaSupport::Union{Void,Bool}
    hypervisor::Union{Void,String}
    imageId::Union{Void,String}
    imageLocation::Union{Void,String}
    imageOwnerAlias::Union{Void,String}
    imageOwnerId::Union{Void,String}
    imageState::Union{Void,String}
    imageType::Union{Void,String}
    isPublic::Union{Void,Bool}
    kernelId::Union{Void,String}
    name::Union{Void,String}
    platform::Union{Void,String}
    productCodes::Union{Void,Array{ProductCode,1}}
    ramdiskId::Union{Void,String}
    rootDeviceName::Union{Void,String}
    rootDeviceType::Union{Void,String}
    sriovNetSupport::Union{Void,String}
    stateReason::Union{Void,StateReason}
    tagSet::Union{Void,Array{Tag,1}}
    virtualizationType::Union{Void,String}
    function Image(;architecture=nothing, blockDeviceMapping=nothing, creationDate=nothing, description=nothing, enaSupport=nothing, hypervisor=nothing, imageId=nothing, imageLocation=nothing, imageOwnerAlias=nothing, imageOwnerId=nothing, imageState=nothing, imageType=nothing, isPublic=nothing, kernelId=nothing, name=nothing, platform=nothing, productCodes=nothing, ramdiskId=nothing, rootDeviceName=nothing, rootDeviceType=nothing, sriovNetSupport=nothing, stateReason=nothing, tagSet=nothing, virtualizationType=nothing)
        new(architecture, blockDeviceMapping, creationDate, description, enaSupport, hypervisor, imageId, imageLocation, imageOwnerAlias, imageOwnerId, imageState, imageType, isPublic, kernelId, name, platform, productCodes, ramdiskId, rootDeviceName, rootDeviceType, sriovNetSupport, stateReason, tagSet, virtualizationType)
    end
    Image(pd) = parse_from_xml(Image, EC2TypeDict, pd)
end # Image
export Image

type ImageDiskContainer <: AbstractAWSType
    description::Union{Void,String}
    deviceName::Union{Void,String}
    format::Union{Void,String}
    snapshotId::Union{Void,String}
    url::Union{Void,String}
    userBucket::Union{Void,UserBucket}
    function ImageDiskContainer(;description=nothing, deviceName=nothing, format=nothing, snapshotId=nothing, url=nothing, userBucket=nothing)
        new(description, deviceName, format, snapshotId, url, userBucket)
    end
    ImageDiskContainer(pd) = parse_from_xml(ImageDiskContainer, EC2TypeDict, pd)
end # ImageDiskContainer
export ImageDiskContainer

type SecurityGroupReference <: AbstractAWSType
    groupId::Union{Void,String}
    referencingVpcId::Union{Void,String}
    vpcPeeringConnectionId::Union{Void,String}
    function SecurityGroupReference(;groupId=nothing, referencingVpcId=nothing, vpcPeeringConnectionId=nothing)
        new(groupId, referencingVpcId, vpcPeeringConnectionId)
    end
    SecurityGroupReference(pd) = parse_from_xml(SecurityGroupReference, EC2TypeDict, pd)
end # SecurityGroupReference
export SecurityGroupReference

type SlotDateTimeRangeRequest <: AbstractAWSType
    earliestTime::Union{Void,DateTime}
    latestTime::Union{Void,DateTime}
    function SlotDateTimeRangeRequest(;earliestTime=nothing, latestTime=nothing)
        new(earliestTime, latestTime)
    end
    SlotDateTimeRangeRequest(pd) = parse_from_xml(SlotDateTimeRangeRequest, EC2TypeDict, pd)
end # SlotDateTimeRangeRequest
export SlotDateTimeRangeRequest

type SlotStartTimeRangeRequest <: AbstractAWSType
    earliestTime::Union{Void,DateTime}
    latestTime::Union{Void,DateTime}
    function SlotStartTimeRangeRequest(;earliestTime=nothing, latestTime=nothing)
        new(earliestTime, latestTime)
    end
    SlotStartTimeRangeRequest(pd) = parse_from_xml(SlotStartTimeRangeRequest, EC2TypeDict, pd)
end # SlotStartTimeRangeRequest
export SlotStartTimeRangeRequest

type Snapshot <: AbstractAWSType
    dataEncryptionKeyId::Union{Void,String}
    description::Union{Void,String}
    encrypted::Union{Void,Bool}
    kmsKeyId::Union{Void,String}
    ownerAlias::Union{Void,String}
    ownerId::Union{Void,String}
    progress::Union{Void,String}
    snapshotId::Union{Void,String}
    startTime::Union{Void,DateTime}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    volumeId::Union{Void,String}
    volumeSize::Union{Void,Int64}
    function Snapshot(;dataEncryptionKeyId=nothing, description=nothing, encrypted=nothing, kmsKeyId=nothing, ownerAlias=nothing, ownerId=nothing, progress=nothing, snapshotId=nothing, startTime=nothing, status=nothing, statusMessage=nothing, tagSet=nothing, volumeId=nothing, volumeSize=nothing)
        new(dataEncryptionKeyId, description, encrypted, kmsKeyId, ownerAlias, ownerId, progress, snapshotId, startTime, status, statusMessage, tagSet, volumeId, volumeSize)
    end
    Snapshot(pd) = parse_from_xml(Snapshot, EC2TypeDict, pd)
end # Snapshot
export Snapshot

type SnapshotDetail <: AbstractAWSType
    description::Union{Void,String}
    deviceName::Union{Void,String}
    diskImageSize::Union{Void,Float64}
    format::Union{Void,String}
    progress::Union{Void,String}
    snapshotId::Union{Void,String}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    url::Union{Void,String}
    userBucket::Union{Void,UserBucketDetails}
    function SnapshotDetail(;description=nothing, deviceName=nothing, diskImageSize=nothing, format=nothing, progress=nothing, snapshotId=nothing, status=nothing, statusMessage=nothing, url=nothing, userBucket=nothing)
        new(description, deviceName, diskImageSize, format, progress, snapshotId, status, statusMessage, url, userBucket)
    end
    SnapshotDetail(pd) = parse_from_xml(SnapshotDetail, EC2TypeDict, pd)
end # SnapshotDetail
export SnapshotDetail

type SnapshotDiskContainer <: AbstractAWSType
    description::Union{Void,String}
    format::Union{Void,String}
    url::Union{Void,String}
    userBucket::Union{Void,UserBucket}
    function SnapshotDiskContainer(;description=nothing, format=nothing, url=nothing, userBucket=nothing)
        new(description, format, url, userBucket)
    end
    SnapshotDiskContainer(pd) = parse_from_xml(SnapshotDiskContainer, EC2TypeDict, pd)
end # SnapshotDiskContainer
export SnapshotDiskContainer

type SnapshotTaskDetail <: AbstractAWSType
    description::Union{Void,String}
    diskImageSize::Union{Void,Float64}
    format::Union{Void,String}
    progress::Union{Void,String}
    snapshotId::Union{Void,String}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    url::Union{Void,String}
    userBucket::Union{Void,UserBucketDetails}
    function SnapshotTaskDetail(;description=nothing, diskImageSize=nothing, format=nothing, progress=nothing, snapshotId=nothing, status=nothing, statusMessage=nothing, url=nothing, userBucket=nothing)
        new(description, diskImageSize, format, progress, snapshotId, status, statusMessage, url, userBucket)
    end
    SnapshotTaskDetail(pd) = parse_from_xml(SnapshotTaskDetail, EC2TypeDict, pd)
end # SnapshotTaskDetail
export SnapshotTaskDetail

type ImportImageTask <: AbstractAWSType
    architecture::Union{Void,String}
    description::Union{Void,String}
    hypervisor::Union{Void,String}
    imageId::Union{Void,String}
    importTaskId::Union{Void,String}
    licenseType::Union{Void,String}
    platform::Union{Void,String}
    progress::Union{Void,String}
    snapshotDetailSet::Union{Void,Array{SnapshotDetail,1}}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    function ImportImageTask(;architecture=nothing, description=nothing, hypervisor=nothing, imageId=nothing, importTaskId=nothing, licenseType=nothing, platform=nothing, progress=nothing, snapshotDetailSet=nothing, status=nothing, statusMessage=nothing)
        new(architecture, description, hypervisor, imageId, importTaskId, licenseType, platform, progress, snapshotDetailSet, status, statusMessage)
    end
    ImportImageTask(pd) = parse_from_xml(ImportImageTask, EC2TypeDict, pd)
end # ImportImageTask
export ImportImageTask

type ImportInstanceLaunchSpecification <: AbstractAWSType
    additionalInfo::Union{Void,String}
    architecture::Union{Void,String}
    groupIds::Union{Void,Array{String,1}}
    groupNames::Union{Void,Array{String,1}}
    instanceInitiatedShutdownBehavior::Union{Void,String}
    instanceType::Union{Void,String}
    monitoring::Union{Void,Bool}
    placement::Union{Void,Placement}
    privateIpAddress::Union{Void,String}
    subnetId::Union{Void,String}
    userData::Union{Void,UserData}
    function ImportInstanceLaunchSpecification(;additionalInfo=nothing, architecture=nothing, groupIds=nothing, groupNames=nothing, instanceInitiatedShutdownBehavior=nothing, instanceType=nothing, monitoring=nothing, placement=nothing, privateIpAddress=nothing, subnetId=nothing, userData=nothing)
        new(additionalInfo, architecture, groupIds, groupNames, instanceInitiatedShutdownBehavior, instanceType, monitoring, placement, privateIpAddress, subnetId, userData)
    end
    ImportInstanceLaunchSpecification(pd) = parse_from_xml(ImportInstanceLaunchSpecification, EC2TypeDict, pd)
end # ImportInstanceLaunchSpecification
export ImportInstanceLaunchSpecification

type ImportSnapshotTask <: AbstractAWSType
    description::Union{Void,String}
    importTaskId::Union{Void,String}
    snapshotTaskDetail::Union{Void,SnapshotTaskDetail}
    function ImportSnapshotTask(;description=nothing, importTaskId=nothing, snapshotTaskDetail=nothing)
        new(description, importTaskId, snapshotTaskDetail)
    end
    ImportSnapshotTask(pd) = parse_from_xml(ImportSnapshotTask, EC2TypeDict, pd)
end # ImportSnapshotTask
export ImportSnapshotTask

type InstanceBlockDeviceMapping <: AbstractAWSType
    deviceName::Union{Void,String}
    ebs::Union{Void,EbsInstanceBlockDevice}
    function InstanceBlockDeviceMapping(;deviceName=nothing, ebs=nothing)
        new(deviceName, ebs)
    end
    InstanceBlockDeviceMapping(pd) = parse_from_xml(InstanceBlockDeviceMapping, EC2TypeDict, pd)
end # InstanceBlockDeviceMapping
export InstanceBlockDeviceMapping

type InstanceState <: AbstractAWSType
    code::Union{Void,Int64}
    name::Union{Void,String}
    function InstanceState(;code=nothing, name=nothing)
        new(code, name)
    end
    InstanceState(pd) = parse_from_xml(InstanceState, EC2TypeDict, pd)
end # InstanceState
export InstanceState

type InstanceStateChange <: AbstractAWSType
    currentState::Union{Void,InstanceState}
    instanceId::Union{Void,String}
    previousState::Union{Void,InstanceState}
    function InstanceStateChange(;currentState=nothing, instanceId=nothing, previousState=nothing)
        new(currentState, instanceId, previousState)
    end
    InstanceStateChange(pd) = parse_from_xml(InstanceStateChange, EC2TypeDict, pd)
end # InstanceStateChange
export InstanceStateChange

type IpRange <: AbstractAWSType
    cidrIp::Union{Void,String}
    function IpRange(;cidrIp=nothing)
        new(cidrIp)
    end
    IpRange(pd) = parse_from_xml(IpRange, EC2TypeDict, pd)
end # IpRange
export IpRange

type Ipv6CidrBlock <: AbstractAWSType
    ipv6CidrBlock::Union{Void,String}
    function Ipv6CidrBlock(;ipv6CidrBlock=nothing)
        new(ipv6CidrBlock)
    end
    Ipv6CidrBlock(pd) = parse_from_xml(Ipv6CidrBlock, EC2TypeDict, pd)
end # Ipv6CidrBlock
export Ipv6CidrBlock

type Ipv6Range <: AbstractAWSType
    cidrIpv6::Union{Void,String}
    function Ipv6Range(;cidrIpv6=nothing)
        new(cidrIpv6)
    end
    Ipv6Range(pd) = parse_from_xml(Ipv6Range, EC2TypeDict, pd)
end # Ipv6Range
export Ipv6Range

type KeyPairInfo <: AbstractAWSType
    keyFingerprint::Union{Void,String}
    keyName::Union{Void,String}
    function KeyPairInfo(;keyFingerprint=nothing, keyName=nothing)
        new(keyFingerprint, keyName)
    end
    KeyPairInfo(pd) = parse_from_xml(KeyPairInfo, EC2TypeDict, pd)
end # KeyPairInfo
export KeyPairInfo

type LaunchPermission <: AbstractAWSType
    group::Union{Void,String}
    userId::Union{Void,String}
    function LaunchPermission(;group=nothing, userId=nothing)
        new(group, userId)
    end
    LaunchPermission(pd) = parse_from_xml(LaunchPermission, EC2TypeDict, pd)
end # LaunchPermission
export LaunchPermission

type Monitoring <: AbstractAWSType
    state::Union{Void,String}
    function Monitoring(;state=nothing)
        new(state)
    end
    Monitoring(pd) = parse_from_xml(Monitoring, EC2TypeDict, pd)
end # Monitoring
export Monitoring

type MovingAddressStatus <: AbstractAWSType
    moveStatus::Union{Void,String}
    publicIp::Union{Void,String}
    function MovingAddressStatus(;moveStatus=nothing, publicIp=nothing)
        new(moveStatus, publicIp)
    end
    MovingAddressStatus(pd) = parse_from_xml(MovingAddressStatus, EC2TypeDict, pd)
end # MovingAddressStatus
export MovingAddressStatus

type InstanceNetworkInterfaceAssociation <: AbstractAWSType
    ipOwnerId::Union{Void,String}
    publicDnsName::Union{Void,String}
    publicIp::Union{Void,String}
    function InstanceNetworkInterfaceAssociation(;ipOwnerId=nothing, publicDnsName=nothing, publicIp=nothing)
        new(ipOwnerId, publicDnsName, publicIp)
    end
    InstanceNetworkInterfaceAssociation(pd) = parse_from_xml(InstanceNetworkInterfaceAssociation, EC2TypeDict, pd)
end # InstanceNetworkInterfaceAssociation
export InstanceNetworkInterfaceAssociation

type InstanceNetworkInterfaceAttachment <: AbstractAWSType
    attachmentId::Union{Void,String}
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    deviceIndex::Union{Void,Int64}
    status::Union{Void,String}
    function InstanceNetworkInterfaceAttachment(;attachmentId=nothing, attachTime=nothing, deleteOnTermination=nothing, deviceIndex=nothing, status=nothing)
        new(attachmentId, attachTime, deleteOnTermination, deviceIndex, status)
    end
    InstanceNetworkInterfaceAttachment(pd) = parse_from_xml(InstanceNetworkInterfaceAttachment, EC2TypeDict, pd)
end # InstanceNetworkInterfaceAttachment
export InstanceNetworkInterfaceAttachment

type InstancePrivateIpAddress <: AbstractAWSType
    association::Union{Void,InstanceNetworkInterfaceAssociation}
    primary::Union{Void,Bool}
    privateDnsName::Union{Void,String}
    privateIpAddress::Union{Void,String}
    function InstancePrivateIpAddress(;association=nothing, primary=nothing, privateDnsName=nothing, privateIpAddress=nothing)
        new(association, primary, privateDnsName, privateIpAddress)
    end
    InstancePrivateIpAddress(pd) = parse_from_xml(InstancePrivateIpAddress, EC2TypeDict, pd)
end # InstancePrivateIpAddress
export InstancePrivateIpAddress

type InstanceNetworkInterface <: AbstractAWSType
    association::Union{Void,InstanceNetworkInterfaceAssociation}
    attachment::Union{Void,InstanceNetworkInterfaceAttachment}
    description::Union{Void,String}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    ipv6AddressesSet::Union{Void,Array{InstanceIpv6Address,1}}
    macAddress::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    ownerId::Union{Void,String}
    privateDnsName::Union{Void,String}
    privateIpAddress::Union{Void,String}
    privateIpAddressesSet::Union{Void,Array{InstancePrivateIpAddress,1}}
    sourceDestCheck::Union{Void,Bool}
    status::Union{Void,String}
    subnetId::Union{Void,String}
    vpcId::Union{Void,String}
    function InstanceNetworkInterface(;association=nothing, attachment=nothing, description=nothing, groupSet=nothing, ipv6AddressesSet=nothing, macAddress=nothing, networkInterfaceId=nothing, ownerId=nothing, privateDnsName=nothing, privateIpAddress=nothing, privateIpAddressesSet=nothing, sourceDestCheck=nothing, status=nothing, subnetId=nothing, vpcId=nothing)
        new(association, attachment, description, groupSet, ipv6AddressesSet, macAddress, networkInterfaceId, ownerId, privateDnsName, privateIpAddress, privateIpAddressesSet, sourceDestCheck, status, subnetId, vpcId)
    end
    InstanceNetworkInterface(pd) = parse_from_xml(InstanceNetworkInterface, EC2TypeDict, pd)
end # InstanceNetworkInterface
export InstanceNetworkInterface

type Instance <: AbstractAWSType
    amiLaunchIndex::Union{Void,Int64}
    architecture::Union{Void,String}
    blockDeviceMapping::Union{Void,Array{InstanceBlockDeviceMapping,1}}
    clientToken::Union{Void,String}
    dnsName::Union{Void,String}
    ebsOptimized::Union{Void,Bool}
    enaSupport::Union{Void,Bool}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    hypervisor::Union{Void,String}
    iamInstanceProfile::Union{Void,IamInstanceProfile}
    imageId::Union{Void,String}
    instanceId::Union{Void,String}
    instanceLifecycle::Union{Void,String}
    instanceState::Union{Void,InstanceState}
    instanceType::Union{Void,String}
    ipAddress::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    launchTime::Union{Void,DateTime}
    monitoring::Union{Void,Monitoring}
    networkInterfaceSet::Union{Void,Array{InstanceNetworkInterface,1}}
    placement::Union{Void,Placement}
    platform::Union{Void,String}
    privateDnsName::Union{Void,String}
    privateIpAddress::Union{Void,String}
    productCodes::Union{Void,Array{ProductCode,1}}
    ramdiskId::Union{Void,String}
    reason::Union{Void,String}
    rootDeviceName::Union{Void,String}
    rootDeviceType::Union{Void,String}
    sourceDestCheck::Union{Void,Bool}
    spotInstanceRequestId::Union{Void,String}
    sriovNetSupport::Union{Void,String}
    stateReason::Union{Void,StateReason}
    subnetId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    virtualizationType::Union{Void,String}
    vpcId::Union{Void,String}
    function Instance(;amiLaunchIndex=nothing, architecture=nothing, blockDeviceMapping=nothing, clientToken=nothing, dnsName=nothing, ebsOptimized=nothing, enaSupport=nothing, groupSet=nothing, hypervisor=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceId=nothing, instanceLifecycle=nothing, instanceState=nothing, instanceType=nothing, ipAddress=nothing, kernelId=nothing, keyName=nothing, launchTime=nothing, monitoring=nothing, networkInterfaceSet=nothing, placement=nothing, platform=nothing, privateDnsName=nothing, privateIpAddress=nothing, productCodes=nothing, ramdiskId=nothing, reason=nothing, rootDeviceName=nothing, rootDeviceType=nothing, sourceDestCheck=nothing, spotInstanceRequestId=nothing, sriovNetSupport=nothing, stateReason=nothing, subnetId=nothing, tagSet=nothing, virtualizationType=nothing, vpcId=nothing)
        new(amiLaunchIndex, architecture, blockDeviceMapping, clientToken, dnsName, ebsOptimized, enaSupport, groupSet, hypervisor, iamInstanceProfile, imageId, instanceId, instanceLifecycle, instanceState, instanceType, ipAddress, kernelId, keyName, launchTime, monitoring, networkInterfaceSet, placement, platform, privateDnsName, privateIpAddress, productCodes, ramdiskId, reason, rootDeviceName, rootDeviceType, sourceDestCheck, spotInstanceRequestId, sriovNetSupport, stateReason, subnetId, tagSet, virtualizationType, vpcId)
    end
    Instance(pd) = parse_from_xml(Instance, EC2TypeDict, pd)
end # Instance
export Instance

type InstanceBlockDeviceMappingSpecification <: AbstractAWSType
    deviceName::Union{Void,String}
    ebs::Union{Void,EbsInstanceBlockDeviceSpecification}
    noDevice::Union{Void,String}
    virtualName::Union{Void,String}
    function InstanceBlockDeviceMappingSpecification(;deviceName=nothing, ebs=nothing, noDevice=nothing, virtualName=nothing)
        new(deviceName, ebs, noDevice, virtualName)
    end
    InstanceBlockDeviceMappingSpecification(pd) = parse_from_xml(InstanceBlockDeviceMappingSpecification, EC2TypeDict, pd)
end # InstanceBlockDeviceMappingSpecification
export InstanceBlockDeviceMappingSpecification

type InstanceMonitoring <: AbstractAWSType
    instanceId::Union{Void,String}
    monitoring::Union{Void,Monitoring}
    function InstanceMonitoring(;instanceId=nothing, monitoring=nothing)
        new(instanceId, monitoring)
    end
    InstanceMonitoring(pd) = parse_from_xml(InstanceMonitoring, EC2TypeDict, pd)
end # InstanceMonitoring
export InstanceMonitoring

type InstanceNetworkInterfaceSpecification <: AbstractAWSType
    associatePublicIpAddress::Union{Void,Bool}
    deleteOnTermination::Union{Void,Bool}
    description::Union{Void,String}
    deviceIndex::Union{Void,Int64}
    ipv6AddressCount::Union{Void,Int64}
    ipv6Addresses::Union{Void,Array{InstanceIpv6Address,1}}
    networkInterfaceId::Union{Void,String}
    privateIpAddress::Union{Void,String}
    privateIpAddresses::Union{Void,Array{PrivateIpAddressSpecification,1}}
    secondaryPrivateIpAddressCount::Union{Void,Int64}
    groups::Union{Void,Array{String,1}}
    subnetId::Union{Void,String}
    function InstanceNetworkInterfaceSpecification(;associatePublicIpAddress=nothing, deleteOnTermination=nothing, description=nothing, deviceIndex=nothing, ipv6AddressCount=nothing, ipv6Addresses=nothing, networkInterfaceId=nothing, privateIpAddress=nothing, privateIpAddresses=nothing, secondaryPrivateIpAddressCount=nothing, groups=nothing, subnetId=nothing)
        new(associatePublicIpAddress, deleteOnTermination, description, deviceIndex, ipv6AddressCount, ipv6Addresses, networkInterfaceId, privateIpAddress, privateIpAddresses, secondaryPrivateIpAddressCount, groups, subnetId)
    end
    InstanceNetworkInterfaceSpecification(pd) = parse_from_xml(InstanceNetworkInterfaceSpecification, EC2TypeDict, pd)
end # InstanceNetworkInterfaceSpecification
export InstanceNetworkInterfaceSpecification

type InstanceStatusDetails <: AbstractAWSType
    impairedSince::Union{Void,DateTime}
    name::Union{Void,String}
    status::Union{Void,String}
    function InstanceStatusDetails(;impairedSince=nothing, name=nothing, status=nothing)
        new(impairedSince, name, status)
    end
    InstanceStatusDetails(pd) = parse_from_xml(InstanceStatusDetails, EC2TypeDict, pd)
end # InstanceStatusDetails
export InstanceStatusDetails

type InstanceStatusEvent <: AbstractAWSType
    code::Union{Void,String}
    description::Union{Void,String}
    notAfter::Union{Void,DateTime}
    notBefore::Union{Void,DateTime}
    function InstanceStatusEvent(;code=nothing, description=nothing, notAfter=nothing, notBefore=nothing)
        new(code, description, notAfter, notBefore)
    end
    InstanceStatusEvent(pd) = parse_from_xml(InstanceStatusEvent, EC2TypeDict, pd)
end # InstanceStatusEvent
export InstanceStatusEvent

type InstanceStatusSummary <: AbstractAWSType
    details::Union{Void,Array{InstanceStatusDetails,1}}
    status::Union{Void,String}
    function InstanceStatusSummary(;details=nothing, status=nothing)
        new(details, status)
    end
    InstanceStatusSummary(pd) = parse_from_xml(InstanceStatusSummary, EC2TypeDict, pd)
end # InstanceStatusSummary
export InstanceStatusSummary

type InstanceStatus <: AbstractAWSType
    availabilityZone::Union{Void,String}
    eventsSet::Union{Void,Array{InstanceStatusEvent,1}}
    instanceId::Union{Void,String}
    instanceState::Union{Void,InstanceState}
    instanceStatus::Union{Void,InstanceStatusSummary}
    systemStatus::Union{Void,InstanceStatusSummary}
    function InstanceStatus(;availabilityZone=nothing, eventsSet=nothing, instanceId=nothing, instanceState=nothing, instanceStatus=nothing, systemStatus=nothing)
        new(availabilityZone, eventsSet, instanceId, instanceState, instanceStatus, systemStatus)
    end
    InstanceStatus(pd) = parse_from_xml(InstanceStatus, EC2TypeDict, pd)
end # InstanceStatus
export InstanceStatus

type IpPermission <: AbstractAWSType
    fromPort::Union{Void,Int64}
    userIdGroupPairs::Union{Void,Array{UserIdGroupPair,1}}
    ipProtocol::Union{Void,String}
    ipRanges::Union{Void,Array{IpRange,1}}
    ipv6Ranges::Union{Void,Array{Ipv6Range,1}}
    prefixListIds::Union{Void,Array{PrefixListId,1}}
    toPort::Union{Void,Int64}
    function IpPermission(;fromPort=nothing, userIdGroupPairs=nothing, ipProtocol=nothing, ipRanges=nothing, ipv6Ranges=nothing, prefixListIds=nothing, toPort=nothing)
        new(fromPort, userIdGroupPairs, ipProtocol, ipRanges, ipv6Ranges, prefixListIds, toPort)
    end
    IpPermission(pd) = parse_from_xml(IpPermission, EC2TypeDict, pd)
end # IpPermission
export IpPermission

type LaunchPermissionModifications <: AbstractAWSType
    add::Union{Void,Array{LaunchPermission,1}}
    remove::Union{Void,Array{LaunchPermission,1}}
    function LaunchPermissionModifications(;add=nothing, remove=nothing)
        new(add, remove)
    end
    LaunchPermissionModifications(pd) = parse_from_xml(LaunchPermissionModifications, EC2TypeDict, pd)
end # LaunchPermissionModifications
export LaunchPermissionModifications

type Route <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    destinationIpv6CidrBlock::Union{Void,String}
    destinationPrefixListId::Union{Void,String}
    egressOnlyInternetGatewayId::Union{Void,String}
    gatewayId::Union{Void,String}
    instanceId::Union{Void,String}
    instanceOwnerId::Union{Void,String}
    natGatewayId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    origin::Union{Void,String}
    state::Union{Void,String}
    vpcPeeringConnectionId::Union{Void,String}
    function Route(;destinationCidrBlock=nothing, destinationIpv6CidrBlock=nothing, destinationPrefixListId=nothing, egressOnlyInternetGatewayId=nothing, gatewayId=nothing, instanceId=nothing, instanceOwnerId=nothing, natGatewayId=nothing, networkInterfaceId=nothing, origin=nothing, state=nothing, vpcPeeringConnectionId=nothing)
        new(destinationCidrBlock, destinationIpv6CidrBlock, destinationPrefixListId, egressOnlyInternetGatewayId, gatewayId, instanceId, instanceOwnerId, natGatewayId, networkInterfaceId, origin, state, vpcPeeringConnectionId)
    end
    Route(pd) = parse_from_xml(Route, EC2TypeDict, pd)
end # Route
export Route

type RouteTableAssociation <: AbstractAWSType
    main::Union{Void,Bool}
    routeTableAssociationId::Union{Void,String}
    routeTableId::Union{Void,String}
    subnetId::Union{Void,String}
    function RouteTableAssociation(;main=nothing, routeTableAssociationId=nothing, routeTableId=nothing, subnetId=nothing)
        new(main, routeTableAssociationId, routeTableId, subnetId)
    end
    RouteTableAssociation(pd) = parse_from_xml(RouteTableAssociation, EC2TypeDict, pd)
end # RouteTableAssociation
export RouteTableAssociation

type RouteTable <: AbstractAWSType
    associationSet::Union{Void,Array{RouteTableAssociation,1}}
    propagatingVgwSet::Union{Void,Array{PropagatingVgw,1}}
    routeSet::Union{Void,Array{Route,1}}
    routeTableId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function RouteTable(;associationSet=nothing, propagatingVgwSet=nothing, routeSet=nothing, routeTableId=nothing, tagSet=nothing, vpcId=nothing)
        new(associationSet, propagatingVgwSet, routeSet, routeTableId, tagSet, vpcId)
    end
    RouteTable(pd) = parse_from_xml(RouteTable, EC2TypeDict, pd)
end # RouteTable
export RouteTable

type LaunchSpecification <: AbstractAWSType
    addressingType::Union{Void,String}
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    ebsOptimized::Union{Void,Bool}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    imageId::Union{Void,String}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    monitoring::Union{Void,RunInstancesMonitoringEnabled}
    networkInterfaceSet::Union{Void,Array{InstanceNetworkInterfaceSpecification,1}}
    placement::Union{Void,SpotPlacement}
    ramdiskId::Union{Void,String}
    subnetId::Union{Void,String}
    userData::Union{Void,String}
    function LaunchSpecification(;addressingType=nothing, blockDeviceMapping=nothing, ebsOptimized=nothing, groupSet=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, monitoring=nothing, networkInterfaceSet=nothing, placement=nothing, ramdiskId=nothing, subnetId=nothing, userData=nothing)
        new(addressingType, blockDeviceMapping, ebsOptimized, groupSet, iamInstanceProfile, imageId, instanceType, kernelId, keyName, monitoring, networkInterfaceSet, placement, ramdiskId, subnetId, userData)
    end
    LaunchSpecification(pd) = parse_from_xml(LaunchSpecification, EC2TypeDict, pd)
end # LaunchSpecification
export LaunchSpecification

type NatGatewayAddress <: AbstractAWSType
    allocationId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    privateIp::Union{Void,String}
    publicIp::Union{Void,String}
    function NatGatewayAddress(;allocationId=nothing, networkInterfaceId=nothing, privateIp=nothing, publicIp=nothing)
        new(allocationId, networkInterfaceId, privateIp, publicIp)
    end
    NatGatewayAddress(pd) = parse_from_xml(NatGatewayAddress, EC2TypeDict, pd)
end # NatGatewayAddress
export NatGatewayAddress

type NatGateway <: AbstractAWSType
    createTime::Union{Void,DateTime}
    deleteTime::Union{Void,DateTime}
    failureCode::Union{Void,String}
    failureMessage::Union{Void,String}
    natGatewayAddressSet::Union{Void,Array{NatGatewayAddress,1}}
    natGatewayId::Union{Void,String}
    provisionedBandwidth::Union{Void,ProvisionedBandwidth}
    state::Union{Void,String}
    subnetId::Union{Void,String}
    vpcId::Union{Void,String}
    function NatGateway(;createTime=nothing, deleteTime=nothing, failureCode=nothing, failureMessage=nothing, natGatewayAddressSet=nothing, natGatewayId=nothing, provisionedBandwidth=nothing, state=nothing, subnetId=nothing, vpcId=nothing)
        new(createTime, deleteTime, failureCode, failureMessage, natGatewayAddressSet, natGatewayId, provisionedBandwidth, state, subnetId, vpcId)
    end
    NatGateway(pd) = parse_from_xml(NatGateway, EC2TypeDict, pd)
end # NatGateway
export NatGateway

type NetworkAclAssociation <: AbstractAWSType
    networkAclAssociationId::Union{Void,String}
    networkAclId::Union{Void,String}
    subnetId::Union{Void,String}
    function NetworkAclAssociation(;networkAclAssociationId=nothing, networkAclId=nothing, subnetId=nothing)
        new(networkAclAssociationId, networkAclId, subnetId)
    end
    NetworkAclAssociation(pd) = parse_from_xml(NetworkAclAssociation, EC2TypeDict, pd)
end # NetworkAclAssociation
export NetworkAclAssociation

type NetworkAclEntry <: AbstractAWSType
    cidrBlock::Union{Void,String}
    egress::Union{Void,Bool}
    icmpTypeCode::Union{Void,IcmpTypeCode}
    ipv6CidrBlock::Union{Void,String}
    portRange::Union{Void,PortRange}
    protocol::Union{Void,String}
    ruleAction::Union{Void,String}
    ruleNumber::Union{Void,Int64}
    function NetworkAclEntry(;cidrBlock=nothing, egress=nothing, icmpTypeCode=nothing, ipv6CidrBlock=nothing, portRange=nothing, protocol=nothing, ruleAction=nothing, ruleNumber=nothing)
        new(cidrBlock, egress, icmpTypeCode, ipv6CidrBlock, portRange, protocol, ruleAction, ruleNumber)
    end
    NetworkAclEntry(pd) = parse_from_xml(NetworkAclEntry, EC2TypeDict, pd)
end # NetworkAclEntry
export NetworkAclEntry

type NetworkAcl <: AbstractAWSType
    associationSet::Union{Void,Array{NetworkAclAssociation,1}}
    default::Union{Void,Bool}
    entrySet::Union{Void,Array{NetworkAclEntry,1}}
    networkAclId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function NetworkAcl(;associationSet=nothing, default=nothing, entrySet=nothing, networkAclId=nothing, tagSet=nothing, vpcId=nothing)
        new(associationSet, default, entrySet, networkAclId, tagSet, vpcId)
    end
    NetworkAcl(pd) = parse_from_xml(NetworkAcl, EC2TypeDict, pd)
end # NetworkAcl
export NetworkAcl

type NetworkInterfaceAssociation <: AbstractAWSType
    allocationId::Union{Void,String}
    associationId::Union{Void,String}
    ipOwnerId::Union{Void,String}
    publicDnsName::Union{Void,String}
    publicIp::Union{Void,String}
    function NetworkInterfaceAssociation(;allocationId=nothing, associationId=nothing, ipOwnerId=nothing, publicDnsName=nothing, publicIp=nothing)
        new(allocationId, associationId, ipOwnerId, publicDnsName, publicIp)
    end
    NetworkInterfaceAssociation(pd) = parse_from_xml(NetworkInterfaceAssociation, EC2TypeDict, pd)
end # NetworkInterfaceAssociation
export NetworkInterfaceAssociation

type NetworkInterfaceAttachment <: AbstractAWSType
    attachmentId::Union{Void,String}
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    deviceIndex::Union{Void,Int64}
    instanceId::Union{Void,String}
    instanceOwnerId::Union{Void,String}
    status::Union{Void,String}
    function NetworkInterfaceAttachment(;attachmentId=nothing, attachTime=nothing, deleteOnTermination=nothing, deviceIndex=nothing, instanceId=nothing, instanceOwnerId=nothing, status=nothing)
        new(attachmentId, attachTime, deleteOnTermination, deviceIndex, instanceId, instanceOwnerId, status)
    end
    NetworkInterfaceAttachment(pd) = parse_from_xml(NetworkInterfaceAttachment, EC2TypeDict, pd)
end # NetworkInterfaceAttachment
export NetworkInterfaceAttachment

type NetworkInterfaceAttachmentChanges <: AbstractAWSType
    attachmentId::Union{Void,String}
    deleteOnTermination::Union{Void,Bool}
    function NetworkInterfaceAttachmentChanges(;attachmentId=nothing, deleteOnTermination=nothing)
        new(attachmentId, deleteOnTermination)
    end
    NetworkInterfaceAttachmentChanges(pd) = parse_from_xml(NetworkInterfaceAttachmentChanges, EC2TypeDict, pd)
end # NetworkInterfaceAttachmentChanges
export NetworkInterfaceAttachmentChanges

type NetworkInterfaceIpv6Address <: AbstractAWSType
    ipv6Address::Union{Void,String}
    function NetworkInterfaceIpv6Address(;ipv6Address=nothing)
        new(ipv6Address)
    end
    NetworkInterfaceIpv6Address(pd) = parse_from_xml(NetworkInterfaceIpv6Address, EC2TypeDict, pd)
end # NetworkInterfaceIpv6Address
export NetworkInterfaceIpv6Address

type NetworkInterfacePermissionState <: AbstractAWSType
    state::Union{Void,String}
    statusMessage::Union{Void,String}
    function NetworkInterfacePermissionState(;state=nothing, statusMessage=nothing)
        new(state, statusMessage)
    end
    NetworkInterfacePermissionState(pd) = parse_from_xml(NetworkInterfacePermissionState, EC2TypeDict, pd)
end # NetworkInterfacePermissionState
export NetworkInterfacePermissionState

type NetworkInterfacePermission <: AbstractAWSType
    awsAccountId::Union{Void,String}
    awsService::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    networkInterfacePermissionId::Union{Void,String}
    permission::Union{Void,String}
    permissionState::Union{Void,NetworkInterfacePermissionState}
    function NetworkInterfacePermission(;awsAccountId=nothing, awsService=nothing, networkInterfaceId=nothing, networkInterfacePermissionId=nothing, permission=nothing, permissionState=nothing)
        new(awsAccountId, awsService, networkInterfaceId, networkInterfacePermissionId, permission, permissionState)
    end
    NetworkInterfacePermission(pd) = parse_from_xml(NetworkInterfacePermission, EC2TypeDict, pd)
end # NetworkInterfacePermission
export NetworkInterfacePermission

type NetworkInterfacePrivateIpAddress <: AbstractAWSType
    association::Union{Void,NetworkInterfaceAssociation}
    primary::Union{Void,Bool}
    privateDnsName::Union{Void,String}
    privateIpAddress::Union{Void,String}
    function NetworkInterfacePrivateIpAddress(;association=nothing, primary=nothing, privateDnsName=nothing, privateIpAddress=nothing)
        new(association, primary, privateDnsName, privateIpAddress)
    end
    NetworkInterfacePrivateIpAddress(pd) = parse_from_xml(NetworkInterfacePrivateIpAddress, EC2TypeDict, pd)
end # NetworkInterfacePrivateIpAddress
export NetworkInterfacePrivateIpAddress

type NetworkInterface <: AbstractAWSType
    association::Union{Void,NetworkInterfaceAssociation}
    attachment::Union{Void,NetworkInterfaceAttachment}
    availabilityZone::Union{Void,String}
    description::Union{Void,String}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    interfaceType::Union{Void,String}
    ipv6AddressesSet::Union{Void,Array{NetworkInterfaceIpv6Address,1}}
    macAddress::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    ownerId::Union{Void,String}
    privateDnsName::Union{Void,String}
    privateIpAddress::Union{Void,String}
    privateIpAddressesSet::Union{Void,Array{NetworkInterfacePrivateIpAddress,1}}
    requesterId::Union{Void,String}
    requesterManaged::Union{Void,Bool}
    sourceDestCheck::Union{Void,Bool}
    status::Union{Void,String}
    subnetId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function NetworkInterface(;association=nothing, attachment=nothing, availabilityZone=nothing, description=nothing, groupSet=nothing, interfaceType=nothing, ipv6AddressesSet=nothing, macAddress=nothing, networkInterfaceId=nothing, ownerId=nothing, privateDnsName=nothing, privateIpAddress=nothing, privateIpAddressesSet=nothing, requesterId=nothing, requesterManaged=nothing, sourceDestCheck=nothing, status=nothing, subnetId=nothing, tagSet=nothing, vpcId=nothing)
        new(association, attachment, availabilityZone, description, groupSet, interfaceType, ipv6AddressesSet, macAddress, networkInterfaceId, ownerId, privateDnsName, privateIpAddress, privateIpAddressesSet, requesterId, requesterManaged, sourceDestCheck, status, subnetId, tagSet, vpcId)
    end
    NetworkInterface(pd) = parse_from_xml(NetworkInterface, EC2TypeDict, pd)
end # NetworkInterface
export NetworkInterface

type RequestSpotLaunchSpecification <: AbstractAWSType
    addressingType::Union{Void,String}
    blockDeviceMappings::Union{Void,Array{BlockDeviceMapping,1}}
    ebsOptimized::Union{Void,Bool}
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    imageId::Union{Void,String}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    monitoring::Union{Void,RunInstancesMonitoringEnabled}
    networkInterfaces::Union{Void,Array{InstanceNetworkInterfaceSpecification,1}}
    placement::Union{Void,SpotPlacement}
    ramdiskId::Union{Void,String}
    securityGroups::Union{Void,Array{String,1}}
    securityGroupIds::Union{Void,Array{String,1}}
    subnetId::Union{Void,String}
    userData::Union{Void,String}
    function RequestSpotLaunchSpecification(;addressingType=nothing, blockDeviceMappings=nothing, ebsOptimized=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, monitoring=nothing, networkInterfaces=nothing, placement=nothing, ramdiskId=nothing, securityGroups=nothing, securityGroupIds=nothing, subnetId=nothing, userData=nothing)
        new(addressingType, blockDeviceMappings, ebsOptimized, iamInstanceProfile, imageId, instanceType, kernelId, keyName, monitoring, networkInterfaces, placement, ramdiskId, securityGroups, securityGroupIds, subnetId, userData)
    end
    RequestSpotLaunchSpecification(pd) = parse_from_xml(RequestSpotLaunchSpecification, EC2TypeDict, pd)
end # RequestSpotLaunchSpecification
export RequestSpotLaunchSpecification

type Reservation <: AbstractAWSType
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    instancesSet::Union{Void,Array{Instance,1}}
    ownerId::Union{Void,String}
    requesterId::Union{Void,String}
    reservationId::Union{Void,String}
    function Reservation(;groupSet=nothing, instancesSet=nothing, ownerId=nothing, requesterId=nothing, reservationId=nothing)
        new(groupSet, instancesSet, ownerId, requesterId, reservationId)
    end
    Reservation(pd) = parse_from_xml(Reservation, EC2TypeDict, pd)
end # Reservation
export Reservation

type ReservationValue <: AbstractAWSType
    hourlyPrice::Union{Void,String}
    remainingTotalValue::Union{Void,String}
    remainingUpfrontValue::Union{Void,String}
    function ReservationValue(;hourlyPrice=nothing, remainingTotalValue=nothing, remainingUpfrontValue=nothing)
        new(hourlyPrice, remainingTotalValue, remainingUpfrontValue)
    end
    ReservationValue(pd) = parse_from_xml(ReservationValue, EC2TypeDict, pd)
end # ReservationValue
export ReservationValue

type ReservedInstanceLimitPrice <: AbstractAWSType
    amount::Union{Void,Float64}
    currencyCode::Union{Void,String}
    function ReservedInstanceLimitPrice(;amount=nothing, currencyCode=nothing)
        new(amount, currencyCode)
    end
    ReservedInstanceLimitPrice(pd) = parse_from_xml(ReservedInstanceLimitPrice, EC2TypeDict, pd)
end # ReservedInstanceLimitPrice
export ReservedInstanceLimitPrice

type ReservedInstanceReservationValue <: AbstractAWSType
    reservationValue::Union{Void,ReservationValue}
    reservedInstanceId::Union{Void,String}
    function ReservedInstanceReservationValue(;reservationValue=nothing, reservedInstanceId=nothing)
        new(reservationValue, reservedInstanceId)
    end
    ReservedInstanceReservationValue(pd) = parse_from_xml(ReservedInstanceReservationValue, EC2TypeDict, pd)
end # ReservedInstanceReservationValue
export ReservedInstanceReservationValue

type ReservedInstances <: AbstractAWSType
    availabilityZone::Union{Void,String}
    currencyCode::Union{Void,String}
    duration::Union{Void,Int64}
    _end::Union{Void,DateTime}
    fixedPrice::Union{Void,Float64}
    instanceCount::Union{Void,Int64}
    instanceTenancy::Union{Void,String}
    instanceType::Union{Void,String}
    offeringClass::Union{Void,String}
    offeringType::Union{Void,String}
    productDescription::Union{Void,String}
    recurringCharges::Union{Void,Array{RecurringCharge,1}}
    reservedInstancesId::Union{Void,String}
    scope::Union{Void,String}
    start::Union{Void,DateTime}
    state::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    usagePrice::Union{Void,Float64}
    function ReservedInstances(;availabilityZone=nothing, currencyCode=nothing, duration=nothing, _end=nothing, fixedPrice=nothing, instanceCount=nothing, instanceTenancy=nothing, instanceType=nothing, offeringClass=nothing, offeringType=nothing, productDescription=nothing, recurringCharges=nothing, reservedInstancesId=nothing, scope=nothing, start=nothing, state=nothing, tagSet=nothing, usagePrice=nothing)
        new(availabilityZone, currencyCode, duration, _end, fixedPrice, instanceCount, instanceTenancy, instanceType, offeringClass, offeringType, productDescription, recurringCharges, reservedInstancesId, scope, start, state, tagSet, usagePrice)
    end
    ReservedInstances(pd) = parse_from_xml(ReservedInstances, EC2TypeDict, pd)
end # ReservedInstances
export ReservedInstances

type ReservedInstancesConfiguration <: AbstractAWSType
    availabilityZone::Union{Void,String}
    instanceCount::Union{Void,Int64}
    instanceType::Union{Void,String}
    platform::Union{Void,String}
    scope::Union{Void,String}
    function ReservedInstancesConfiguration(;availabilityZone=nothing, instanceCount=nothing, instanceType=nothing, platform=nothing, scope=nothing)
        new(availabilityZone, instanceCount, instanceType, platform, scope)
    end
    ReservedInstancesConfiguration(pd) = parse_from_xml(ReservedInstancesConfiguration, EC2TypeDict, pd)
end # ReservedInstancesConfiguration
export ReservedInstancesConfiguration

type ReservedInstancesId <: AbstractAWSType
    reservedInstancesId::Union{Void,String}
    function ReservedInstancesId(;reservedInstancesId=nothing)
        new(reservedInstancesId)
    end
    ReservedInstancesId(pd) = parse_from_xml(ReservedInstancesId, EC2TypeDict, pd)
end # ReservedInstancesId
export ReservedInstancesId

type ReservedInstancesListing <: AbstractAWSType
    clientToken::Union{Void,String}
    createDate::Union{Void,DateTime}
    instanceCounts::Union{Void,Array{InstanceCount,1}}
    priceSchedules::Union{Void,Array{PriceSchedule,1}}
    reservedInstancesId::Union{Void,String}
    reservedInstancesListingId::Union{Void,String}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    updateDate::Union{Void,DateTime}
    function ReservedInstancesListing(;clientToken=nothing, createDate=nothing, instanceCounts=nothing, priceSchedules=nothing, reservedInstancesId=nothing, reservedInstancesListingId=nothing, status=nothing, statusMessage=nothing, tagSet=nothing, updateDate=nothing)
        new(clientToken, createDate, instanceCounts, priceSchedules, reservedInstancesId, reservedInstancesListingId, status, statusMessage, tagSet, updateDate)
    end
    ReservedInstancesListing(pd) = parse_from_xml(ReservedInstancesListing, EC2TypeDict, pd)
end # ReservedInstancesListing
export ReservedInstancesListing

type ReservedInstancesModificationResult <: AbstractAWSType
    reservedInstancesId::Union{Void,String}
    targetConfiguration::Union{Void,ReservedInstancesConfiguration}
    function ReservedInstancesModificationResult(;reservedInstancesId=nothing, targetConfiguration=nothing)
        new(reservedInstancesId, targetConfiguration)
    end
    ReservedInstancesModificationResult(pd) = parse_from_xml(ReservedInstancesModificationResult, EC2TypeDict, pd)
end # ReservedInstancesModificationResult
export ReservedInstancesModificationResult

type ReservedInstancesModification <: AbstractAWSType
    clientToken::Union{Void,String}
    createDate::Union{Void,DateTime}
    effectiveDate::Union{Void,DateTime}
    modificationResultSet::Union{Void,Array{ReservedInstancesModificationResult,1}}
    reservedInstancesModificationId::Union{Void,String}
    reservedInstancesSet::Union{Void,Array{ReservedInstancesId,1}}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    updateDate::Union{Void,DateTime}
    function ReservedInstancesModification(;clientToken=nothing, createDate=nothing, effectiveDate=nothing, modificationResultSet=nothing, reservedInstancesModificationId=nothing, reservedInstancesSet=nothing, status=nothing, statusMessage=nothing, updateDate=nothing)
        new(clientToken, createDate, effectiveDate, modificationResultSet, reservedInstancesModificationId, reservedInstancesSet, status, statusMessage, updateDate)
    end
    ReservedInstancesModification(pd) = parse_from_xml(ReservedInstancesModification, EC2TypeDict, pd)
end # ReservedInstancesModification
export ReservedInstancesModification

type ReservedInstancesOffering <: AbstractAWSType
    availabilityZone::Union{Void,String}
    currencyCode::Union{Void,String}
    duration::Union{Void,Int64}
    fixedPrice::Union{Void,Float64}
    instanceTenancy::Union{Void,String}
    instanceType::Union{Void,String}
    marketplace::Union{Void,Bool}
    offeringClass::Union{Void,String}
    offeringType::Union{Void,String}
    pricingDetailsSet::Union{Void,Array{PricingDetail,1}}
    productDescription::Union{Void,String}
    recurringCharges::Union{Void,Array{RecurringCharge,1}}
    reservedInstancesOfferingId::Union{Void,String}
    scope::Union{Void,String}
    usagePrice::Union{Void,Float64}
    function ReservedInstancesOffering(;availabilityZone=nothing, currencyCode=nothing, duration=nothing, fixedPrice=nothing, instanceTenancy=nothing, instanceType=nothing, marketplace=nothing, offeringClass=nothing, offeringType=nothing, pricingDetailsSet=nothing, productDescription=nothing, recurringCharges=nothing, reservedInstancesOfferingId=nothing, scope=nothing, usagePrice=nothing)
        new(availabilityZone, currencyCode, duration, fixedPrice, instanceTenancy, instanceType, marketplace, offeringClass, offeringType, pricingDetailsSet, productDescription, recurringCharges, reservedInstancesOfferingId, scope, usagePrice)
    end
    ReservedInstancesOffering(pd) = parse_from_xml(ReservedInstancesOffering, EC2TypeDict, pd)
end # ReservedInstancesOffering
export ReservedInstancesOffering

type ScheduledInstanceRecurrence <: AbstractAWSType
    frequency::Union{Void,String}
    interval::Union{Void,Int64}
    occurrenceDaySet::Union{Void,Array{Int64,1}}
    occurrenceRelativeToEnd::Union{Void,Bool}
    occurrenceUnit::Union{Void,String}
    function ScheduledInstanceRecurrence(;frequency=nothing, interval=nothing, occurrenceDaySet=nothing, occurrenceRelativeToEnd=nothing, occurrenceUnit=nothing)
        new(frequency, interval, occurrenceDaySet, occurrenceRelativeToEnd, occurrenceUnit)
    end
    ScheduledInstanceRecurrence(pd) = parse_from_xml(ScheduledInstanceRecurrence, EC2TypeDict, pd)
end # ScheduledInstanceRecurrence
export ScheduledInstanceRecurrence

type ScheduledInstanceRecurrenceRequest <: AbstractAWSType
    frequency::Union{Void,String}
    interval::Union{Void,Int64}
    occurrenceDays::Union{Void,Array{Int64,1}}
    occurrenceRelativeToEnd::Union{Void,Bool}
    occurrenceUnit::Union{Void,String}
    function ScheduledInstanceRecurrenceRequest(;frequency=nothing, interval=nothing, occurrenceDays=nothing, occurrenceRelativeToEnd=nothing, occurrenceUnit=nothing)
        new(frequency, interval, occurrenceDays, occurrenceRelativeToEnd, occurrenceUnit)
    end
    ScheduledInstanceRecurrenceRequest(pd) = parse_from_xml(ScheduledInstanceRecurrenceRequest, EC2TypeDict, pd)
end # ScheduledInstanceRecurrenceRequest
export ScheduledInstanceRecurrenceRequest

type ScheduledInstance <: AbstractAWSType
    availabilityZone::Union{Void,String}
    createDate::Union{Void,DateTime}
    hourlyPrice::Union{Void,String}
    instanceCount::Union{Void,Int64}
    instanceType::Union{Void,String}
    networkPlatform::Union{Void,String}
    nextSlotStartTime::Union{Void,DateTime}
    platform::Union{Void,String}
    previousSlotEndTime::Union{Void,DateTime}
    recurrence::Union{Void,ScheduledInstanceRecurrence}
    scheduledInstanceId::Union{Void,String}
    slotDurationInHours::Union{Void,Int64}
    termEndDate::Union{Void,DateTime}
    termStartDate::Union{Void,DateTime}
    totalScheduledInstanceHours::Union{Void,Int64}
    function ScheduledInstance(;availabilityZone=nothing, createDate=nothing, hourlyPrice=nothing, instanceCount=nothing, instanceType=nothing, networkPlatform=nothing, nextSlotStartTime=nothing, platform=nothing, previousSlotEndTime=nothing, recurrence=nothing, scheduledInstanceId=nothing, slotDurationInHours=nothing, termEndDate=nothing, termStartDate=nothing, totalScheduledInstanceHours=nothing)
        new(availabilityZone, createDate, hourlyPrice, instanceCount, instanceType, networkPlatform, nextSlotStartTime, platform, previousSlotEndTime, recurrence, scheduledInstanceId, slotDurationInHours, termEndDate, termStartDate, totalScheduledInstanceHours)
    end
    ScheduledInstance(pd) = parse_from_xml(ScheduledInstance, EC2TypeDict, pd)
end # ScheduledInstance
export ScheduledInstance

type ScheduledInstanceAvailability <: AbstractAWSType
    availabilityZone::Union{Void,String}
    availableInstanceCount::Union{Void,Int64}
    firstSlotStartTime::Union{Void,DateTime}
    hourlyPrice::Union{Void,String}
    instanceType::Union{Void,String}
    maxTermDurationInDays::Union{Void,Int64}
    minTermDurationInDays::Union{Void,Int64}
    networkPlatform::Union{Void,String}
    platform::Union{Void,String}
    purchaseToken::Union{Void,String}
    recurrence::Union{Void,ScheduledInstanceRecurrence}
    slotDurationInHours::Union{Void,Int64}
    totalScheduledInstanceHours::Union{Void,Int64}
    function ScheduledInstanceAvailability(;availabilityZone=nothing, availableInstanceCount=nothing, firstSlotStartTime=nothing, hourlyPrice=nothing, instanceType=nothing, maxTermDurationInDays=nothing, minTermDurationInDays=nothing, networkPlatform=nothing, platform=nothing, purchaseToken=nothing, recurrence=nothing, slotDurationInHours=nothing, totalScheduledInstanceHours=nothing)
        new(availabilityZone, availableInstanceCount, firstSlotStartTime, hourlyPrice, instanceType, maxTermDurationInDays, minTermDurationInDays, networkPlatform, platform, purchaseToken, recurrence, slotDurationInHours, totalScheduledInstanceHours)
    end
    ScheduledInstanceAvailability(pd) = parse_from_xml(ScheduledInstanceAvailability, EC2TypeDict, pd)
end # ScheduledInstanceAvailability
export ScheduledInstanceAvailability

type ScheduledInstancesEbs <: AbstractAWSType
    deleteOnTermination::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    snapshotId::Union{Void,String}
    volumeSize::Union{Void,Int64}
    volumeType::Union{Void,String}
    function ScheduledInstancesEbs(;deleteOnTermination=nothing, encrypted=nothing, iops=nothing, snapshotId=nothing, volumeSize=nothing, volumeType=nothing)
        new(deleteOnTermination, encrypted, iops, snapshotId, volumeSize, volumeType)
    end
    ScheduledInstancesEbs(pd) = parse_from_xml(ScheduledInstancesEbs, EC2TypeDict, pd)
end # ScheduledInstancesEbs
export ScheduledInstancesEbs

type ScheduledInstancesBlockDeviceMapping <: AbstractAWSType
    deviceName::Union{Void,String}
    ebs::Union{Void,ScheduledInstancesEbs}
    noDevice::Union{Void,String}
    virtualName::Union{Void,String}
    function ScheduledInstancesBlockDeviceMapping(;deviceName=nothing, ebs=nothing, noDevice=nothing, virtualName=nothing)
        new(deviceName, ebs, noDevice, virtualName)
    end
    ScheduledInstancesBlockDeviceMapping(pd) = parse_from_xml(ScheduledInstancesBlockDeviceMapping, EC2TypeDict, pd)
end # ScheduledInstancesBlockDeviceMapping
export ScheduledInstancesBlockDeviceMapping

type ScheduledInstancesIamInstanceProfile <: AbstractAWSType
    arn::Union{Void,String}
    name::Union{Void,String}
    function ScheduledInstancesIamInstanceProfile(;arn=nothing, name=nothing)
        new(arn, name)
    end
    ScheduledInstancesIamInstanceProfile(pd) = parse_from_xml(ScheduledInstancesIamInstanceProfile, EC2TypeDict, pd)
end # ScheduledInstancesIamInstanceProfile
export ScheduledInstancesIamInstanceProfile

type ScheduledInstancesIpv6Address <: AbstractAWSType
    ipv6Address::Union{Void,String}
    function ScheduledInstancesIpv6Address(;ipv6Address=nothing)
        new(ipv6Address)
    end
    ScheduledInstancesIpv6Address(pd) = parse_from_xml(ScheduledInstancesIpv6Address, EC2TypeDict, pd)
end # ScheduledInstancesIpv6Address
export ScheduledInstancesIpv6Address

type ScheduledInstancesPlacement <: AbstractAWSType
    availabilityZone::Union{Void,String}
    groupName::Union{Void,String}
    function ScheduledInstancesPlacement(;availabilityZone=nothing, groupName=nothing)
        new(availabilityZone, groupName)
    end
    ScheduledInstancesPlacement(pd) = parse_from_xml(ScheduledInstancesPlacement, EC2TypeDict, pd)
end # ScheduledInstancesPlacement
export ScheduledInstancesPlacement

type ScheduledInstancesPrivateIpAddressConfig <: AbstractAWSType
    primary::Union{Void,Bool}
    privateIpAddress::Union{Void,String}
    function ScheduledInstancesPrivateIpAddressConfig(;primary=nothing, privateIpAddress=nothing)
        new(primary, privateIpAddress)
    end
    ScheduledInstancesPrivateIpAddressConfig(pd) = parse_from_xml(ScheduledInstancesPrivateIpAddressConfig, EC2TypeDict, pd)
end # ScheduledInstancesPrivateIpAddressConfig
export ScheduledInstancesPrivateIpAddressConfig

type ScheduledInstancesMonitoring <: AbstractAWSType
    enabled::Union{Void,Bool}
    function ScheduledInstancesMonitoring(;enabled=nothing)
        new(enabled)
    end
    ScheduledInstancesMonitoring(pd) = parse_from_xml(ScheduledInstancesMonitoring, EC2TypeDict, pd)
end # ScheduledInstancesMonitoring
export ScheduledInstancesMonitoring

type ScheduledInstancesNetworkInterface <: AbstractAWSType
    associatePublicIpAddress::Union{Void,Bool}
    deleteOnTermination::Union{Void,Bool}
    description::Union{Void,String}
    deviceIndex::Union{Void,Int64}
    groups::Union{Void,Array{String,1}}
    ipv6Addresses::Union{Void,Array{ScheduledInstancesIpv6Address,1}}
    ipv6AddressCount::Union{Void,Int64}
    networkInterfaceId::Union{Void,String}
    privateIpAddress::Union{Void,String}
    privateIpAddressConfigs::Union{Void,Array{ScheduledInstancesPrivateIpAddressConfig,1}}
    secondaryPrivateIpAddressCount::Union{Void,Int64}
    subnetId::Union{Void,String}
    function ScheduledInstancesNetworkInterface(;associatePublicIpAddress=nothing, deleteOnTermination=nothing, description=nothing, deviceIndex=nothing, groups=nothing, ipv6Addresses=nothing, ipv6AddressCount=nothing, networkInterfaceId=nothing, privateIpAddress=nothing, privateIpAddressConfigs=nothing, secondaryPrivateIpAddressCount=nothing, subnetId=nothing)
        new(associatePublicIpAddress, deleteOnTermination, description, deviceIndex, groups, ipv6Addresses, ipv6AddressCount, networkInterfaceId, privateIpAddress, privateIpAddressConfigs, secondaryPrivateIpAddressCount, subnetId)
    end
    ScheduledInstancesNetworkInterface(pd) = parse_from_xml(ScheduledInstancesNetworkInterface, EC2TypeDict, pd)
end # ScheduledInstancesNetworkInterface
export ScheduledInstancesNetworkInterface

type ScheduledInstancesLaunchSpecification <: AbstractAWSType
    blockDeviceMappings::Union{Void,Array{ScheduledInstancesBlockDeviceMapping,1}}
    ebsOptimized::Union{Void,Bool}
    iamInstanceProfile::Union{Void,ScheduledInstancesIamInstanceProfile}
    imageId::Union{Void,String}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    monitoring::Union{Void,ScheduledInstancesMonitoring}
    networkInterfaces::Union{Void,Array{ScheduledInstancesNetworkInterface,1}}
    placement::Union{Void,ScheduledInstancesPlacement}
    ramdiskId::Union{Void,String}
    securityGroupIds::Union{Void,Array{String,1}}
    subnetId::Union{Void,String}
    userData::Union{Void,String}
    function ScheduledInstancesLaunchSpecification(;blockDeviceMappings=nothing, ebsOptimized=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, monitoring=nothing, networkInterfaces=nothing, placement=nothing, ramdiskId=nothing, securityGroupIds=nothing, subnetId=nothing, userData=nothing)
        new(blockDeviceMappings, ebsOptimized, iamInstanceProfile, imageId, instanceType, kernelId, keyName, monitoring, networkInterfaces, placement, ramdiskId, securityGroupIds, subnetId, userData)
    end
    ScheduledInstancesLaunchSpecification(pd) = parse_from_xml(ScheduledInstancesLaunchSpecification, EC2TypeDict, pd)
end # ScheduledInstancesLaunchSpecification
export ScheduledInstancesLaunchSpecification

type SecurityGroup <: AbstractAWSType
    groupDescription::Union{Void,String}
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    ipPermissions::Union{Void,Array{IpPermission,1}}
    ipPermissionsEgress::Union{Void,Array{IpPermission,1}}
    ownerId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function SecurityGroup(;groupDescription=nothing, groupId=nothing, groupName=nothing, ipPermissions=nothing, ipPermissionsEgress=nothing, ownerId=nothing, tagSet=nothing, vpcId=nothing)
        new(groupDescription, groupId, groupName, ipPermissions, ipPermissionsEgress, ownerId, tagSet, vpcId)
    end
    SecurityGroup(pd) = parse_from_xml(SecurityGroup, EC2TypeDict, pd)
end # SecurityGroup
export SecurityGroup

type SpotFleetMonitoring <: AbstractAWSType
    enabled::Union{Void,Bool}
    function SpotFleetMonitoring(;enabled=nothing)
        new(enabled)
    end
    SpotFleetMonitoring(pd) = parse_from_xml(SpotFleetMonitoring, EC2TypeDict, pd)
end # SpotFleetMonitoring
export SpotFleetMonitoring

type SpotDatafeedSubscription <: AbstractAWSType
    bucket::Union{Void,String}
    fault::Union{Void,SpotInstanceStateFault}
    ownerId::Union{Void,String}
    prefix::Union{Void,String}
    state::Union{Void,String}
    function SpotDatafeedSubscription(;bucket=nothing, fault=nothing, ownerId=nothing, prefix=nothing, state=nothing)
        new(bucket, fault, ownerId, prefix, state)
    end
    SpotDatafeedSubscription(pd) = parse_from_xml(SpotDatafeedSubscription, EC2TypeDict, pd)
end # SpotDatafeedSubscription
export SpotDatafeedSubscription

type SpotFleetLaunchSpecification <: AbstractAWSType
    addressingType::Union{Void,String}
    blockDeviceMappings::Union{Void,Array{BlockDeviceMapping,1}}
    ebsOptimized::Union{Void,Bool}
    securityGroups::Union{Void,Array{GroupIdentifier,1}}
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    imageId::Union{Void,String}
    instanceType::Union{Void,String}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    monitoring::Union{Void,SpotFleetMonitoring}
    networkInterfaces::Union{Void,Array{InstanceNetworkInterfaceSpecification,1}}
    placement::Union{Void,SpotPlacement}
    ramdiskId::Union{Void,String}
    spotPrice::Union{Void,String}
    subnetId::Union{Void,String}
    userData::Union{Void,String}
    weightedCapacity::Union{Void,Float64}
    function SpotFleetLaunchSpecification(;addressingType=nothing, blockDeviceMappings=nothing, ebsOptimized=nothing, securityGroups=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceType=nothing, kernelId=nothing, keyName=nothing, monitoring=nothing, networkInterfaces=nothing, placement=nothing, ramdiskId=nothing, spotPrice=nothing, subnetId=nothing, userData=nothing, weightedCapacity=nothing)
        new(addressingType, blockDeviceMappings, ebsOptimized, securityGroups, iamInstanceProfile, imageId, instanceType, kernelId, keyName, monitoring, networkInterfaces, placement, ramdiskId, spotPrice, subnetId, userData, weightedCapacity)
    end
    SpotFleetLaunchSpecification(pd) = parse_from_xml(SpotFleetLaunchSpecification, EC2TypeDict, pd)
end # SpotFleetLaunchSpecification
export SpotFleetLaunchSpecification

type SpotFleetRequestConfigData <: AbstractAWSType
    allocationStrategy::Union{Void,String}
    clientToken::Union{Void,String}
    excessCapacityTerminationPolicy::Union{Void,String}
    fulfilledCapacity::Union{Void,Float64}
    iamFleetRole::Union{Void,String}
    launchSpecifications::Union{Void,Array{SpotFleetLaunchSpecification,1}}
    replaceUnhealthyInstances::Union{Void,Bool}
    spotPrice::Union{Void,String}
    targetCapacity::Union{Void,Int64}
    terminateInstancesWithExpiration::Union{Void,Bool}
    _Type::Union{Void,String}
    validFrom::Union{Void,DateTime}
    validUntil::Union{Void,DateTime}
    function SpotFleetRequestConfigData(;allocationStrategy=nothing, clientToken=nothing, excessCapacityTerminationPolicy=nothing, fulfilledCapacity=nothing, iamFleetRole=nothing, launchSpecifications=nothing, replaceUnhealthyInstances=nothing, spotPrice=nothing, targetCapacity=nothing, terminateInstancesWithExpiration=nothing, _Type=nothing, validFrom=nothing, validUntil=nothing)
        new(allocationStrategy, clientToken, excessCapacityTerminationPolicy, fulfilledCapacity, iamFleetRole, launchSpecifications, replaceUnhealthyInstances, spotPrice, targetCapacity, terminateInstancesWithExpiration, _Type, validFrom, validUntil)
    end
    SpotFleetRequestConfigData(pd) = parse_from_xml(SpotFleetRequestConfigData, EC2TypeDict, pd)
end # SpotFleetRequestConfigData
export SpotFleetRequestConfigData

type SpotFleetRequestConfig <: AbstractAWSType
    activityStatus::Union{Void,String}
    createTime::Union{Void,DateTime}
    spotFleetRequestConfig::Union{Void,SpotFleetRequestConfigData}
    spotFleetRequestId::Union{Void,String}
    spotFleetRequestState::Union{Void,String}
    function SpotFleetRequestConfig(;activityStatus=nothing, createTime=nothing, spotFleetRequestConfig=nothing, spotFleetRequestId=nothing, spotFleetRequestState=nothing)
        new(activityStatus, createTime, spotFleetRequestConfig, spotFleetRequestId, spotFleetRequestState)
    end
    SpotFleetRequestConfig(pd) = parse_from_xml(SpotFleetRequestConfig, EC2TypeDict, pd)
end # SpotFleetRequestConfig
export SpotFleetRequestConfig

type SpotInstanceRequest <: AbstractAWSType
    actualBlockHourlyPrice::Union{Void,String}
    availabilityZoneGroup::Union{Void,String}
    blockDurationMinutes::Union{Void,Int64}
    createTime::Union{Void,DateTime}
    fault::Union{Void,SpotInstanceStateFault}
    instanceId::Union{Void,String}
    launchedAvailabilityZone::Union{Void,String}
    launchGroup::Union{Void,String}
    launchSpecification::Union{Void,LaunchSpecification}
    productDescription::Union{Void,String}
    spotInstanceRequestId::Union{Void,String}
    spotPrice::Union{Void,String}
    state::Union{Void,String}
    status::Union{Void,SpotInstanceStatus}
    tagSet::Union{Void,Array{Tag,1}}
    _type::Union{Void,String}
    validFrom::Union{Void,DateTime}
    validUntil::Union{Void,DateTime}
    function SpotInstanceRequest(;actualBlockHourlyPrice=nothing, availabilityZoneGroup=nothing, blockDurationMinutes=nothing, createTime=nothing, fault=nothing, instanceId=nothing, launchedAvailabilityZone=nothing, launchGroup=nothing, launchSpecification=nothing, productDescription=nothing, spotInstanceRequestId=nothing, spotPrice=nothing, state=nothing, status=nothing, tagSet=nothing, _type=nothing, validFrom=nothing, validUntil=nothing)
        new(actualBlockHourlyPrice, availabilityZoneGroup, blockDurationMinutes, createTime, fault, instanceId, launchedAvailabilityZone, launchGroup, launchSpecification, productDescription, spotInstanceRequestId, spotPrice, state, status, tagSet, _type, validFrom, validUntil)
    end
    SpotInstanceRequest(pd) = parse_from_xml(SpotInstanceRequest, EC2TypeDict, pd)
end # SpotInstanceRequest
export SpotInstanceRequest

type StaleIpPermission <: AbstractAWSType
    fromPort::Union{Void,Int64}
    groups::Union{Void,Array{UserIdGroupPair,1}}
    ipProtocol::Union{Void,String}
    ipRanges::Union{Void,Array{String,1}}
    prefixListIds::Union{Void,Array{String,1}}
    toPort::Union{Void,Int64}
    function StaleIpPermission(;fromPort=nothing, groups=nothing, ipProtocol=nothing, ipRanges=nothing, prefixListIds=nothing, toPort=nothing)
        new(fromPort, groups, ipProtocol, ipRanges, prefixListIds, toPort)
    end
    StaleIpPermission(pd) = parse_from_xml(StaleIpPermission, EC2TypeDict, pd)
end # StaleIpPermission
export StaleIpPermission

type StaleSecurityGroup <: AbstractAWSType
    description::Union{Void,String}
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    staleIpPermissions::Union{Void,Array{StaleIpPermission,1}}
    staleIpPermissionsEgress::Union{Void,Array{StaleIpPermission,1}}
    vpcId::Union{Void,String}
    function StaleSecurityGroup(;description=nothing, groupId=nothing, groupName=nothing, staleIpPermissions=nothing, staleIpPermissionsEgress=nothing, vpcId=nothing)
        new(description, groupId, groupName, staleIpPermissions, staleIpPermissionsEgress, vpcId)
    end
    StaleSecurityGroup(pd) = parse_from_xml(StaleSecurityGroup, EC2TypeDict, pd)
end # StaleSecurityGroup
export StaleSecurityGroup

type SubnetCidrBlockState <: AbstractAWSType
    state::Union{Void,String}
    statusMessage::Union{Void,String}
    function SubnetCidrBlockState(;state=nothing, statusMessage=nothing)
        new(state, statusMessage)
    end
    SubnetCidrBlockState(pd) = parse_from_xml(SubnetCidrBlockState, EC2TypeDict, pd)
end # SubnetCidrBlockState
export SubnetCidrBlockState

type SubnetIpv6CidrBlockAssociation <: AbstractAWSType
    associationId::Union{Void,String}
    ipv6CidrBlock::Union{Void,String}
    ipv6CidrBlockState::Union{Void,SubnetCidrBlockState}
    function SubnetIpv6CidrBlockAssociation(;associationId=nothing, ipv6CidrBlock=nothing, ipv6CidrBlockState=nothing)
        new(associationId, ipv6CidrBlock, ipv6CidrBlockState)
    end
    SubnetIpv6CidrBlockAssociation(pd) = parse_from_xml(SubnetIpv6CidrBlockAssociation, EC2TypeDict, pd)
end # SubnetIpv6CidrBlockAssociation
export SubnetIpv6CidrBlockAssociation

type TargetConfiguration <: AbstractAWSType
    instanceCount::Union{Void,Int64}
    offeringId::Union{Void,String}
    function TargetConfiguration(;instanceCount=nothing, offeringId=nothing)
        new(instanceCount, offeringId)
    end
    TargetConfiguration(pd) = parse_from_xml(TargetConfiguration, EC2TypeDict, pd)
end # TargetConfiguration
export TargetConfiguration

type TargetConfigurationRequest <: AbstractAWSType
    instanceCount::Union{Void,Int64}
    offeringId::Union{Void,String}
    function TargetConfigurationRequest(;instanceCount=nothing, offeringId=nothing)
        new(instanceCount, offeringId)
    end
    TargetConfigurationRequest(pd) = parse_from_xml(TargetConfigurationRequest, EC2TypeDict, pd)
end # TargetConfigurationRequest
export TargetConfigurationRequest

type Subnet <: AbstractAWSType
    assignIpv6AddressOnCreation::Union{Void,Bool}
    availabilityZone::Union{Void,String}
    availableIpAddressCount::Union{Void,Int64}
    cidrBlock::Union{Void,String}
    defaultForAz::Union{Void,Bool}
    ipv6CidrBlockAssociationSet::Union{Void,Array{SubnetIpv6CidrBlockAssociation,1}}
    mapPublicIpOnLaunch::Union{Void,Bool}
    state::Union{Void,String}
    subnetId::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function Subnet(;assignIpv6AddressOnCreation=nothing, availabilityZone=nothing, availableIpAddressCount=nothing, cidrBlock=nothing, defaultForAz=nothing, ipv6CidrBlockAssociationSet=nothing, mapPublicIpOnLaunch=nothing, state=nothing, subnetId=nothing, tagSet=nothing, vpcId=nothing)
        new(assignIpv6AddressOnCreation, availabilityZone, availableIpAddressCount, cidrBlock, defaultForAz, ipv6CidrBlockAssociationSet, mapPublicIpOnLaunch, state, subnetId, tagSet, vpcId)
    end
    Subnet(pd) = parse_from_xml(Subnet, EC2TypeDict, pd)
end # Subnet
export Subnet

type TargetReservationValue <: AbstractAWSType
    reservationValue::Union{Void,ReservationValue}
    targetConfiguration::Union{Void,TargetConfiguration}
    function TargetReservationValue(;reservationValue=nothing, targetConfiguration=nothing)
        new(reservationValue, targetConfiguration)
    end
    TargetReservationValue(pd) = parse_from_xml(TargetReservationValue, EC2TypeDict, pd)
end # TargetReservationValue
export TargetReservationValue

type VpcAttachment <: AbstractAWSType
    state::Union{Void,String}
    vpcId::Union{Void,String}
    function VpcAttachment(;state=nothing, vpcId=nothing)
        new(state, vpcId)
    end
    VpcAttachment(pd) = parse_from_xml(VpcAttachment, EC2TypeDict, pd)
end # VpcAttachment
export VpcAttachment

type VpcCidrBlockState <: AbstractAWSType
    state::Union{Void,String}
    statusMessage::Union{Void,String}
    function VpcCidrBlockState(;state=nothing, statusMessage=nothing)
        new(state, statusMessage)
    end
    VpcCidrBlockState(pd) = parse_from_xml(VpcCidrBlockState, EC2TypeDict, pd)
end # VpcCidrBlockState
export VpcCidrBlockState

type VpcClassicLink <: AbstractAWSType
    classicLinkEnabled::Union{Void,Bool}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function VpcClassicLink(;classicLinkEnabled=nothing, tagSet=nothing, vpcId=nothing)
        new(classicLinkEnabled, tagSet, vpcId)
    end
    VpcClassicLink(pd) = parse_from_xml(VpcClassicLink, EC2TypeDict, pd)
end # VpcClassicLink
export VpcClassicLink

type VpcEndpoint <: AbstractAWSType
    creationTimestamp::Union{Void,DateTime}
    policyDocument::Union{Void,String}
    routeTableIdSet::Union{Void,Array{String,1}}
    serviceName::Union{Void,String}
    state::Union{Void,String}
    vpcEndpointId::Union{Void,String}
    vpcId::Union{Void,String}
    function VpcEndpoint(;creationTimestamp=nothing, policyDocument=nothing, routeTableIdSet=nothing, serviceName=nothing, state=nothing, vpcEndpointId=nothing, vpcId=nothing)
        new(creationTimestamp, policyDocument, routeTableIdSet, serviceName, state, vpcEndpointId, vpcId)
    end
    VpcEndpoint(pd) = parse_from_xml(VpcEndpoint, EC2TypeDict, pd)
end # VpcEndpoint
export VpcEndpoint

type VpcPeeringConnectionStateReason <: AbstractAWSType
    code::Union{Void,String}
    message::Union{Void,String}
    function VpcPeeringConnectionStateReason(;code=nothing, message=nothing)
        new(code, message)
    end
    VpcPeeringConnectionStateReason(pd) = parse_from_xml(VpcPeeringConnectionStateReason, EC2TypeDict, pd)
end # VpcPeeringConnectionStateReason
export VpcPeeringConnectionStateReason

type VpnConnectionOptions <: AbstractAWSType
    staticRoutesOnly::Union{Void,Bool}
    function VpnConnectionOptions(;staticRoutesOnly=nothing)
        new(staticRoutesOnly)
    end
    VpnConnectionOptions(pd) = parse_from_xml(VpnConnectionOptions, EC2TypeDict, pd)
end # VpnConnectionOptions
export VpnConnectionOptions

type VpnConnectionOptionsSpecification <: AbstractAWSType
    staticRoutesOnly::Union{Void,Bool}
    function VpnConnectionOptionsSpecification(;staticRoutesOnly=nothing)
        new(staticRoutesOnly)
    end
    VpnConnectionOptionsSpecification(pd) = parse_from_xml(VpnConnectionOptionsSpecification, EC2TypeDict, pd)
end # VpnConnectionOptionsSpecification
export VpnConnectionOptionsSpecification

type VpnStaticRoute <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    source::Union{Void,String}
    state::Union{Void,String}
    function VpnStaticRoute(;destinationCidrBlock=nothing, source=nothing, state=nothing)
        new(destinationCidrBlock, source, state)
    end
    VpnStaticRoute(pd) = parse_from_xml(VpnStaticRoute, EC2TypeDict, pd)
end # VpnStaticRoute
export VpnStaticRoute

type VpcIpv6CidrBlockAssociation <: AbstractAWSType
    associationId::Union{Void,String}
    ipv6CidrBlock::Union{Void,String}
    ipv6CidrBlockState::Union{Void,VpcCidrBlockState}
    function VpcIpv6CidrBlockAssociation(;associationId=nothing, ipv6CidrBlock=nothing, ipv6CidrBlockState=nothing)
        new(associationId, ipv6CidrBlock, ipv6CidrBlockState)
    end
    VpcIpv6CidrBlockAssociation(pd) = parse_from_xml(VpcIpv6CidrBlockAssociation, EC2TypeDict, pd)
end # VpcIpv6CidrBlockAssociation
export VpcIpv6CidrBlockAssociation

type Vpc <: AbstractAWSType
    cidrBlock::Union{Void,String}
    dhcpOptionsId::Union{Void,String}
    instanceTenancy::Union{Void,String}
    ipv6CidrBlockAssociationSet::Union{Void,Array{VpcIpv6CidrBlockAssociation,1}}
    isDefault::Union{Void,Bool}
    state::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    vpcId::Union{Void,String}
    function Vpc(;cidrBlock=nothing, dhcpOptionsId=nothing, instanceTenancy=nothing, ipv6CidrBlockAssociationSet=nothing, isDefault=nothing, state=nothing, tagSet=nothing, vpcId=nothing)
        new(cidrBlock, dhcpOptionsId, instanceTenancy, ipv6CidrBlockAssociationSet, isDefault, state, tagSet, vpcId)
    end
    Vpc(pd) = parse_from_xml(Vpc, EC2TypeDict, pd)
end # Vpc
export Vpc

type VpcPeeringConnectionOptionsDescription <: AbstractAWSType
    allowDnsResolutionFromRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalClassicLinkToRemoteVpc::Union{Void,Bool}
    allowEgressFromLocalVpcToRemoteClassicLink::Union{Void,Bool}
    function VpcPeeringConnectionOptionsDescription(;allowDnsResolutionFromRemoteVpc=nothing, allowEgressFromLocalClassicLinkToRemoteVpc=nothing, allowEgressFromLocalVpcToRemoteClassicLink=nothing)
        new(allowDnsResolutionFromRemoteVpc, allowEgressFromLocalClassicLinkToRemoteVpc, allowEgressFromLocalVpcToRemoteClassicLink)
    end
    VpcPeeringConnectionOptionsDescription(pd) = parse_from_xml(VpcPeeringConnectionOptionsDescription, EC2TypeDict, pd)
end # VpcPeeringConnectionOptionsDescription
export VpcPeeringConnectionOptionsDescription

type VpcPeeringConnectionVpcInfo <: AbstractAWSType
    cidrBlock::Union{Void,String}
    ipv6CidrBlockSet::Union{Void,Array{Ipv6CidrBlock,1}}
    ownerId::Union{Void,String}
    peeringOptions::Union{Void,VpcPeeringConnectionOptionsDescription}
    vpcId::Union{Void,String}
    function VpcPeeringConnectionVpcInfo(;cidrBlock=nothing, ipv6CidrBlockSet=nothing, ownerId=nothing, peeringOptions=nothing, vpcId=nothing)
        new(cidrBlock, ipv6CidrBlockSet, ownerId, peeringOptions, vpcId)
    end
    VpcPeeringConnectionVpcInfo(pd) = parse_from_xml(VpcPeeringConnectionVpcInfo, EC2TypeDict, pd)
end # VpcPeeringConnectionVpcInfo
export VpcPeeringConnectionVpcInfo

type VpcPeeringConnection <: AbstractAWSType
    accepterVpcInfo::Union{Void,VpcPeeringConnectionVpcInfo}
    expirationTime::Union{Void,DateTime}
    requesterVpcInfo::Union{Void,VpcPeeringConnectionVpcInfo}
    status::Union{Void,VpcPeeringConnectionStateReason}
    tagSet::Union{Void,Array{Tag,1}}
    vpcPeeringConnectionId::Union{Void,String}
    function VpcPeeringConnection(;accepterVpcInfo=nothing, expirationTime=nothing, requesterVpcInfo=nothing, status=nothing, tagSet=nothing, vpcPeeringConnectionId=nothing)
        new(accepterVpcInfo, expirationTime, requesterVpcInfo, status, tagSet, vpcPeeringConnectionId)
    end
    VpcPeeringConnection(pd) = parse_from_xml(VpcPeeringConnection, EC2TypeDict, pd)
end # VpcPeeringConnection
export VpcPeeringConnection

type VpnConnection <: AbstractAWSType
    customerGatewayConfiguration::Union{Void,String}
    customerGatewayId::Union{Void,String}
    options::Union{Void,VpnConnectionOptions}
    routes::Union{Void,Array{VpnStaticRoute,1}}
    state::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    _type::Union{Void,String}
    vgwTelemetry::Union{Void,Array{VgwTelemetry,1}}
    vpnConnectionId::Union{Void,String}
    vpnGatewayId::Union{Void,String}
    function VpnConnection(;customerGatewayConfiguration=nothing, customerGatewayId=nothing, options=nothing, routes=nothing, state=nothing, tagSet=nothing, _type=nothing, vgwTelemetry=nothing, vpnConnectionId=nothing, vpnGatewayId=nothing)
        new(customerGatewayConfiguration, customerGatewayId, options, routes, state, tagSet, _type, vgwTelemetry, vpnConnectionId, vpnGatewayId)
    end
    VpnConnection(pd) = parse_from_xml(VpnConnection, EC2TypeDict, pd)
end # VpnConnection
export VpnConnection

type VpnGateway <: AbstractAWSType
    attachments::Union{Void,Array{VpcAttachment,1}}
    availabilityZone::Union{Void,String}
    state::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    _type::Union{Void,String}
    vpnGatewayId::Union{Void,String}
    function VpnGateway(;attachments=nothing, availabilityZone=nothing, state=nothing, tagSet=nothing, _type=nothing, vpnGatewayId=nothing)
        new(attachments, availabilityZone, state, tagSet, _type, vpnGatewayId)
    end
    VpnGateway(pd) = parse_from_xml(VpnGateway, EC2TypeDict, pd)
end # VpnGateway
export VpnGateway
