type XSDateTime
	y::Int
	m::Int
	d::Int
	h::Int
	mi::Int
	s::Int
end

type CreateImageResponseType
    requestId::String
    imageId::String

    CreateImageResponseType(requestId, imageId) =  new(requestId, imageId)
end
export CreateImageResponseType


type RegisterImageResponseType
    requestId::String
    imageId::String

    RegisterImageResponseType(requestId, imageId) =  new(requestId, imageId)
end
export RegisterImageResponseType


type DeregisterImageType
    imageId::String

    DeregisterImageType(imageId) =  new(imageId)
end
export DeregisterImageType


type DeregisterImageResponseType
    requestId::String
    _return::Bool

    DeregisterImageResponseType(requestId, _return) =  new(requestId, _return)
end
export DeregisterImageResponseType


type CreateKeyPairType
    keyName::String

    CreateKeyPairType(keyName) =  new(keyName)
end
export CreateKeyPairType


type CreateKeyPairResponseType
    requestId::String
    keyName::String
    keyFingerprint::String
    keyMaterial::String

    CreateKeyPairResponseType(requestId, keyName, keyFingerprint, keyMaterial) =  new(requestId, keyName, keyFingerprint, keyMaterial)
end
export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::String
    publicKeyMaterial::String

    ImportKeyPairType(keyName, publicKeyMaterial) =  new(keyName, publicKeyMaterial)
end
export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::String
    keyName::String
    keyFingerprint::String

    ImportKeyPairResponseType(requestId, keyName, keyFingerprint) =  new(requestId, keyName, keyFingerprint)
end
export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::String

    DeleteKeyPairType(keyName) =  new(keyName)
end
export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::String
    _return::Bool

    DeleteKeyPairResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::String

    DescribeKeyPairsItemType(keyName) =  new(keyName)
end
export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::String
    keyFingerprint::String

    DescribeKeyPairsResponseItemType(keyName, keyFingerprint) =  new(keyName, keyFingerprint)
end
export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union(String, Nothing)
    name::Union(String, Nothing)

    IamInstanceProfileRequestType() =  new(nothing, nothing)
end
export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::String
    primary::Union(Bool, Nothing)

    PrivateIpAddressesSetItemRequestType(privateIpAddress) =  new(privateIpAddress, nothing)
end
export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    ImportInstanceGroupItemType() =  new(nothing, nothing)
end
export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    GroupItemType() =  new(nothing, nothing)
end
export GroupItemType


type UserDataType
    data::Union(String, Nothing)

    UserDataType() =  new(nothing)
end
export UserDataType


type BlockDeviceMappingItemType
    deviceName::String

    BlockDeviceMappingItemType(deviceName) =  new(deviceName)
end
export BlockDeviceMappingItemType


type EbsBlockDeviceType
    snapshotId::Union(String, Nothing)
    volumeSize::Union(Int32, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    volumeType::Union(String, Nothing)
    iops::Union(Int32, Nothing)

    EbsBlockDeviceType() =  new(nothing, nothing, nothing, nothing, nothing)
end
export EbsBlockDeviceType


type PlacementRequestType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)
    tenancy::Union(String, Nothing)

    PlacementRequestType() =  new(nothing, nothing, nothing)
end
export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)

    SpotPlacementRequestType() =  new(nothing, nothing)
end
export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)

    InstancePlacementType() =  new(nothing, nothing)
end
export InstancePlacementType


type MonitoringInstanceType
    enabled::Union(Bool, Nothing)

    MonitoringInstanceType() =  new(nothing)
end
export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::String

    InstanceLicenseRequestType(pool) =  new(pool)
end
export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::String
    id::String

    IamInstanceProfileResponseType(arn, id) =  new(arn, id)
end
export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::String
    deviceIndex::Int32
    status::String
    attachTime::XSDateTime
    deleteOnTermination::Bool

    InstanceNetworkInterfaceAttachmentType(attachmentId, deviceIndex, status, attachTime, deleteOnTermination) =  new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end
export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::String
    publicDnsName::Union(String, Nothing)
    ipOwnerId::Union(String, Nothing)

    InstanceNetworkInterfaceAssociationType(publicIp) =  new(publicIp, nothing, nothing)
end
export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::String
    groupName::Union(String, Nothing)
    tenancy::Union(String, Nothing)

    PlacementResponseType(availabilityZone) =  new(availabilityZone, nothing, nothing)
end
export PlacementResponseType


type StateReasonType
    code::String
    message::String

    StateReasonType(code, message) =  new(code, message)
end
export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::String

    InstanceBlockDeviceMappingResponseItemType(deviceName) =  new(deviceName)
end
export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::String
    status::String
    attachTime::XSDateTime
    deleteOnTermination::Union(Bool, Nothing)

    EbsInstanceBlockDeviceMappingResponseType(volumeId, status, attachTime) =  new(volumeId, status, attachTime, nothing)
end
export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::String

    InstanceLicenseResponseType(pool) =  new(pool)
end
export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::String

    AccountAttributeNameSetItemType(attributeName) =  new(attributeName)
end
export AccountAttributeNameSetItemType


type AccountAttributeValueSetItemType
    attributeValue::String

    AccountAttributeValueSetItemType(attributeValue) =  new(attributeValue)
end
export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::String

    DescribeVpcAttributeType(vpcId) =  new(vpcId)
end
export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::String
    vpcId::String

    DescribeVpcAttributeResponseType(requestId, vpcId) =  new(requestId, vpcId)
end
export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::String

    ModifyVpcAttributeType(vpcId) =  new(vpcId)
end
export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::String
    _return::Bool

    ModifyVpcAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifyVpcAttributeResponseType


type GetConsoleOutputType
    instanceId::String

    GetConsoleOutputType(instanceId) =  new(instanceId)
end
export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::String
    instanceId::String
    timestamp::XSDateTime
    output::String

    GetConsoleOutputResponseType(requestId, instanceId, timestamp, output) =  new(requestId, instanceId, timestamp, output)
end
export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::String

    GetPasswordDataType(instanceId) =  new(instanceId)
end
export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::String
    instanceId::String
    timestamp::XSDateTime
    passwordData::String

    GetPasswordDataResponseType(requestId, instanceId, timestamp, passwordData) =  new(requestId, instanceId, timestamp, passwordData)
end
export GetPasswordDataResponseType


type InstanceIdType
    instanceId::String

    InstanceIdType(instanceId) =  new(instanceId)
end
export InstanceIdType


type InstanceBlockDeviceMappingItemType
    deviceName::String

    InstanceBlockDeviceMappingItemType(deviceName) =  new(deviceName)
end
export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::String
    deleteOnTermination::Union(Bool, Nothing)

    InstanceEbsBlockDeviceType(volumeId) =  new(volumeId, nothing)
end
export InstanceEbsBlockDeviceType


type RebootInstancesItemType
    instanceId::String

    RebootInstancesItemType(instanceId) =  new(instanceId)
end
export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::String
    _return::Bool

    RebootInstancesResponseType(requestId, _return) =  new(requestId, _return)
end
export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::String

    DescribeInstancesItemType(instanceId) =  new(instanceId)
end
export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::String

    UnavailableResultType(availabilityZone) =  new(availabilityZone)
end
export UnavailableResultType


type DescribeImagesItemType
    imageId::String

    DescribeImagesItemType(imageId) =  new(imageId)
end
export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::String

    DescribeImagesOwnerType(owner) =  new(owner)
end
export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::String

    DescribeImagesExecutableByType(user) =  new(user)
end
export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::String
    groupDescription::String
    vpcId::Union(String, Nothing)

    CreateSecurityGroupType(groupName, groupDescription) =  new(groupName, groupDescription, nothing)
end
export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::String
    _return::Bool
    groupId::String

    CreateSecurityGroupResponseType(requestId, _return, groupId) =  new(requestId, _return, groupId)
end
export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    DeleteSecurityGroupType() =  new(nothing, nothing)
end
export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::String
    _return::Bool

    DeleteSecurityGroupResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::String

    DescribeSecurityGroupsSetItemType(groupName) =  new(groupName)
end
export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::String

    DescribeSecurityGroupsIdSetItemType(groupId) =  new(groupId)
end
export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::String

    IpRangeItemType(cidrIp) =  new(cidrIp)
end
export IpRangeItemType


type UserIdGroupPairType
    userId::Union(String, Nothing)
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    UserIdGroupPairType() =  new(nothing, nothing, nothing)
end
export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::String
    _return::Bool

    AuthorizeSecurityGroupIngressResponseType(requestId, _return) =  new(requestId, _return)
end
export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::String
    _return::Bool

    RevokeSecurityGroupIngressResponseType(requestId, _return) =  new(requestId, _return)
end
export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::String
    _return::Bool

    AuthorizeSecurityGroupEgressResponseType(requestId, _return) =  new(requestId, _return)
end
export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::String
    _return::Bool

    RevokeSecurityGroupEgressResponseType(requestId, _return) =  new(requestId, _return)
end
export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Int32
    name::String

    InstanceStateType(code, name) =  new(code, name)
end
export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::String

    ModifyInstanceAttributeType(instanceId) =  new(instanceId)
end
export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::String

    SecurityGroupIdSetItemType(groupId) =  new(groupId)
end
export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::String
    _return::Bool

    ModifyInstanceAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::String

    ResetInstanceAttributeType(instanceId) =  new(instanceId)
end
export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::String
    _return::Bool

    ResetInstanceAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::String

    DescribeInstanceAttributeType(instanceId) =  new(instanceId)
end
export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::String
    instanceId::String

    DescribeInstanceAttributeResponseType(requestId, instanceId) =  new(requestId, instanceId)
end
export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::String

    ModifyImageAttributeType(imageId) =  new(imageId)
end
export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union(String, Nothing)
    group::Union(String, Nothing)

    LaunchPermissionItemType() =  new(nothing, nothing)
end
export LaunchPermissionItemType


type ProductCodeItemType
    productCode::String

    ProductCodeItemType(productCode) =  new(productCode)
end
export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::String
    _return::Bool

    ModifyImageAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::String

    ResetImageAttributeType(imageId) =  new(imageId)
end
export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::String
    _return::Bool

    ResetImageAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::String

    DescribeImageAttributeType(imageId) =  new(imageId)
end
export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::String
    imageId::String

    DescribeImageAttributeResponseType(requestId, imageId) =  new(requestId, imageId)
end
export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union(String, Nothing)

    NullableAttributeValueType() =  new(nothing)
end
export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union(Bool, Nothing)

    NullableAttributeBooleanValueType() =  new(nothing)
end
export NullableAttributeBooleanValueType


type AttributeValueType
    value::String

    AttributeValueType(value) =  new(value)
end
export AttributeValueType


type AttributeBooleanValueType
    value::Bool

    AttributeBooleanValueType(value) =  new(value)
end
export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::String
    instanceId::String

    ConfirmProductInstanceType(productCode, instanceId) =  new(productCode, instanceId)
end
export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::String
    _type::String

    ProductCodesSetItemType(productCode, _type) =  new(productCode, _type)
end
export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::String
    _return::Bool
    ownerId::Union(String, Nothing)

    ConfirmProductInstanceResponseType(requestId, _return) =  new(requestId, _return, nothing)
end
export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::String

    DescribeAvailabilityZonesSetItemType(zoneName) =  new(zoneName)
end
export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::String

    AvailabilityZoneMessageType(message) =  new(message)
end
export AvailabilityZoneMessageType


type AllocateAddressType
    domain::Union(String, Nothing)

    AllocateAddressType() =  new(nothing)
end
export AllocateAddressType


type AllocateAddressResponseType
    requestId::String
    publicIp::String
    domain::String
    allocationId::Union(String, Nothing)

    AllocateAddressResponseType(requestId, publicIp, domain) =  new(requestId, publicIp, domain, nothing)
end
export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union(String, Nothing)
    allocationId::Union(String, Nothing)

    ReleaseAddressType() =  new(nothing, nothing)
end
export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::String
    _return::Bool

    ReleaseAddressResponseType(requestId, _return) =  new(requestId, _return)
end
export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::String

    AllocationIdSetItemType(allocationId) =  new(allocationId)
end
export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::String

    DescribeAddressesItemType(publicIp) =  new(publicIp)
end
export DescribeAddressesItemType


type DescribeAddressesResponseItemType
    publicIp::String
    allocationId::Union(String, Nothing)
    domain::String
    instanceId::Union(String, Nothing)
    associationId::Union(String, Nothing)
    networkInterfaceId::Union(String, Nothing)
    networkInterfaceOwnerId::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)

    DescribeAddressesResponseItemType(publicIp, domain) =  new(publicIp, nothing, domain, nothing, nothing, nothing, nothing, nothing)
end
export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union(String, Nothing)
    allowReassociation::Union(Bool, Nothing)

    AssociateAddressType() =  new(nothing, nothing)
end
export AssociateAddressType


type AssociateAddressResponseType
    requestId::String
    _return::Bool
    associationId::Union(String, Nothing)

    AssociateAddressResponseType(requestId, _return) =  new(requestId, _return, nothing)
end
export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union(String, Nothing)
    associationId::Union(String, Nothing)

    DisassociateAddressType() =  new(nothing, nothing)
end
export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::String
    _return::Bool

    DisassociateAddressResponseType(requestId, _return) =  new(requestId, _return)
end
export DisassociateAddressResponseType


type CreateVolumeType
    size::Union(String, Nothing)
    snapshotId::Union(String, Nothing)
    availabilityZone::String
    volumeType::Union(String, Nothing)
    iops::Union(Int32, Nothing)

    CreateVolumeType(availabilityZone) =  new(nothing, nothing, availabilityZone, nothing, nothing)
end
export CreateVolumeType


type CreateVolumeResponseType
    requestId::String
    volumeId::String
    size::String
    snapshotId::String
    availabilityZone::String
    status::String
    createTime::XSDateTime
    volumeType::String
    iops::Union(Int32, Nothing)

    CreateVolumeResponseType(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType) =  new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, nothing)
end
export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::String

    DeleteVolumeType(volumeId) =  new(volumeId)
end
export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::String
    _return::Bool

    DeleteVolumeResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::String

    DescribeVolumesSetItemType(volumeId) =  new(volumeId)
end
export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::XSDateTime
    deleteOnTermination::Bool

    AttachmentSetItemResponseType(volumeId, instanceId, device, status, attachTime, deleteOnTermination) =  new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end
export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::String
    instanceId::String
    device::String

    AttachVolumeType(volumeId, instanceId, device) =  new(volumeId, instanceId, device)
end
export AttachVolumeType


type AttachVolumeResponseType
    requestId::String
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::XSDateTime

    AttachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) =  new(requestId, volumeId, instanceId, device, status, attachTime)
end
export AttachVolumeResponseType


type DetachVolumeType
    volumeId::String
    instanceId::Union(String, Nothing)
    device::Union(String, Nothing)
    force::Union(Bool, Nothing)

    DetachVolumeType(volumeId) =  new(volumeId, nothing, nothing, nothing)
end
export DetachVolumeType


type DetachVolumeResponseType
    requestId::String
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::XSDateTime

    DetachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) =  new(requestId, volumeId, instanceId, device, status, attachTime)
end
export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::String
    description::Union(String, Nothing)

    CreateSnapshotType(volumeId) =  new(volumeId, nothing)
end
export CreateSnapshotType


type CreateSnapshotResponseType
    requestId::String
    snapshotId::String
    volumeId::String
    status::String
    startTime::XSDateTime
    progress::String
    ownerId::String
    volumeSize::String
    description::Union(String, Nothing)

    CreateSnapshotResponseType(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize) =  new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, nothing)
end
export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::String
    sourceSnapshotId::String
    description::Union(String, Nothing)

    CopySnapshotType(sourceRegion, sourceSnapshotId) =  new(sourceRegion, sourceSnapshotId, nothing)
end
export CopySnapshotType


type CopySnapshotResponseType
    requestId::String
    snapshotId::String

    CopySnapshotResponseType(requestId, snapshotId) =  new(requestId, snapshotId)
end
export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::String

    DeleteSnapshotType(snapshotId) =  new(snapshotId)
end
export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::String
    _return::Bool

    DeleteSnapshotResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::String

    DescribeSnapshotsSetItemType(snapshotId) =  new(snapshotId)
end
export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::String

    DescribeSnapshotsOwnerType(owner) =  new(owner)
end
export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::String

    DescribeSnapshotsRestorableByType(user) =  new(user)
end
export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union(String, Nothing)
    group::Union(String, Nothing)

    CreateVolumePermissionItemType() =  new(nothing, nothing)
end
export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::String
    _return::Bool

    ModifySnapshotAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::String

    ResetSnapshotAttributeType(snapshotId) =  new(snapshotId)
end
export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::String
    _return::Bool

    ResetSnapshotAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::String

    DescribeSnapshotAttributeType(snapshotId) =  new(snapshotId)
end
export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::String
    snapshotId::String

    DescribeSnapshotAttributeResponseType(requestId, snapshotId) =  new(requestId, snapshotId)
end
export DescribeSnapshotAttributeResponseType


type BundleInstanceS3StorageType
    bucket::String
    prefix::String
    awsAccessKeyId::Union(String, Nothing)
    uploadPolicy::Union(String, Nothing)
    uploadPolicySignature::Union(String, Nothing)

    BundleInstanceS3StorageType(bucket, prefix) =  new(bucket, prefix, nothing, nothing, nothing)
end
export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::String
    message::String

    BundleInstanceTaskErrorType(code, message) =  new(code, message)
end
export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::String

    DescribeBundleTasksItemType(bundleId) =  new(bundleId)
end
export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::String

    CancelBundleTaskType(bundleId) =  new(bundleId)
end
export CancelBundleTaskType


type CopyImageType
    sourceRegion::String
    sourceImageId::String
    name::String
    description::Union(String, Nothing)
    clientToken::Union(String, Nothing)

    CopyImageType(sourceRegion, sourceImageId, name) =  new(sourceRegion, sourceImageId, name, nothing, nothing)
end
export CopyImageType


type CopyImageResponseType
    requestId::String
    imageId::String

    CopyImageResponseType(requestId, imageId) =  new(requestId, imageId)
end
export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::String

    DescribeRegionsSetItemType(regionName) =  new(regionName)
end
export DescribeRegionsSetItemType


type RegionItemType
    regionName::String
    regionEndpoint::String

    RegionItemType(regionName, regionEndpoint) =  new(regionName, regionEndpoint)
end
export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::String

    DescribeReservedInstancesOfferingsSetItemType(reservedInstancesOfferingId) =  new(reservedInstancesOfferingId)
end
export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::String
    amount::Float64

    RecurringChargesSetItemType(frequency, amount) =  new(frequency, amount)
end
export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Float64
    count::Int32

    PricingDetailsSetItemType(price, count) =  new(price, count)
end
export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Float64
    currencyCode::Union(String, Nothing)

    ReservedInstanceLimitPriceType(amount) =  new(amount, nothing)
end
export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::String
    reservedInstancesId::String

    PurchaseReservedInstancesOfferingResponseType(requestId, reservedInstancesId) =  new(requestId, reservedInstancesId)
end
export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::String

    DescribeReservedInstancesSetItemType(reservedInstancesId) =  new(reservedInstancesId)
end
export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Int64
    price::Float64
    currencyCode::Union(String, Nothing)

    PriceScheduleRequestSetItemType(term, price) =  new(term, price, nothing)
end
export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::String

    CancelReservedInstancesListingType(reservedInstancesListingId) =  new(reservedInstancesListingId)
end
export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::String

    DescribeReservedInstancesListingSetItemType(reservedInstancesListingId) =  new(reservedInstancesListingId)
end
export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::String
    instanceCount::Int32

    InstanceCountsSetItemType(state, instanceCount) =  new(state, instanceCount)
end
export InstanceCountsSetItemType


type PriceScheduleSetItemType
    term::Int64
    price::Float64
    currencyCode::Union(String, Nothing)
    active::Bool

    PriceScheduleSetItemType(term, price, active) =  new(term, price, nothing, active)
end
export PriceScheduleSetItemType


type MonitorInstancesSetItemType
    instanceId::String

    MonitorInstancesSetItemType(instanceId) =  new(instanceId)
end
export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::String

    InstanceMonitoringStateType(state) =  new(state)
end
export InstanceMonitoringStateType


type AttachmentType
    vpcId::String
    state::String

    AttachmentType(vpcId, state) =  new(vpcId, state)
end
export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsResponseType() =  new(nothing)
end
export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::String
    source::String
    state::String

    VpnStaticRouteType(destinationCidrBlock, source, state) =  new(destinationCidrBlock, source, state)
end
export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::String
    status::String
    lastStatusChange::XSDateTime
    statusMessage::Union(String, Nothing)
    acceptedRouteCount::Int32

    VpnTunnelTelemetryType(outsideIpAddress, status, lastStatusChange, acceptedRouteCount) =  new(outsideIpAddress, status, lastStatusChange, nothing, acceptedRouteCount)
end
export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::String

    CustomerGatewayIdSetItemType(customerGatewayId) =  new(customerGatewayId)
end
export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::String

    VpnGatewayIdSetItemType(vpnGatewayId) =  new(vpnGatewayId)
end
export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::String

    VpnConnectionIdSetItemType(vpnConnectionId) =  new(vpnConnectionId)
end
export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::String

    VpcIdSetItemType(vpcId) =  new(vpcId)
end
export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::String

    SubnetIdSetItemType(subnetId) =  new(subnetId)
end
export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::String

    DhcpOptionsIdSetItemType(dhcpOptionsId) =  new(dhcpOptionsId)
end
export DhcpOptionsIdSetItemType


type DhcpValueType
    value::String

    DhcpValueType(value) =  new(value)
end
export DhcpValueType


type ValueType
    value::String

    ValueType(value) =  new(value)
end
export ValueType


type CreateCustomerGatewayType
    _type::String
    ipAddress::String
    bgpAsn::Union(Int32, Nothing)

    CreateCustomerGatewayType(_type, ipAddress) =  new(_type, ipAddress, nothing)
end
export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::String

    DeleteCustomerGatewayType(customerGatewayId) =  new(customerGatewayId)
end
export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::String
    _return::Bool

    DeleteCustomerGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::String
    availabilityZone::Union(String, Nothing)

    CreateVpnGatewayType(_type) =  new(_type, nothing)
end
export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::String

    DeleteVpnGatewayType(vpnGatewayId) =  new(vpnGatewayId)
end
export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::String
    _return::Bool

    DeleteVpnGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsRequestType() =  new(nothing)
end
export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::String
    destinationCidrBlock::String

    CreateVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) =  new(vpnConnectionId, destinationCidrBlock)
end
export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::String
    _return::Bool

    CreateVpnConnectionRouteResponseType(requestId, _return) =  new(requestId, _return)
end
export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::String
    destinationCidrBlock::String

    DeleteVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) =  new(vpnConnectionId, destinationCidrBlock)
end
export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::String
    _return::Bool

    DeleteVpnConnectionRouteResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::String

    DeleteVpnConnectionType(vpnConnectionId) =  new(vpnConnectionId)
end
export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::String
    _return::Bool

    DeleteVpnConnectionResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::String
    vpcId::String

    AttachVpnGatewayType(vpnGatewayId, vpcId) =  new(vpnGatewayId, vpcId)
end
export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::String
    vpcId::String

    DetachVpnGatewayType(vpnGatewayId, vpcId) =  new(vpnGatewayId, vpcId)
end
export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::String
    _return::Bool

    DetachVpnGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::String
    instanceTenancy::Union(String, Nothing)

    CreateVpcType(cidrBlock) =  new(cidrBlock, nothing)
end
export CreateVpcType


type DeleteVpcType
    vpcId::String

    DeleteVpcType(vpcId) =  new(vpcId)
end
export DeleteVpcType


type DeleteVpcResponseType
    requestId::String
    _return::Bool

    DeleteVpcResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteVpcResponseType


type CreateSubnetType
    vpcId::String
    cidrBlock::String
    availabilityZone::Union(String, Nothing)

    CreateSubnetType(vpcId, cidrBlock) =  new(vpcId, cidrBlock, nothing)
end
export CreateSubnetType


type DeleteSubnetType
    subnetId::String

    DeleteSubnetType(subnetId) =  new(subnetId)
end
export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::String
    _return::Bool

    DeleteSubnetResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::String

    DeleteDhcpOptionsType(dhcpOptionsId) =  new(dhcpOptionsId)
end
export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::String
    _return::Bool

    DeleteDhcpOptionsResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::String
    vpcId::String

    AssociateDhcpOptionsType(dhcpOptionsId, vpcId) =  new(dhcpOptionsId, vpcId)
end
export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::String
    _return::Bool

    AssociateDhcpOptionsResponseType(requestId, _return) =  new(requestId, _return)
end
export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::String
    message::String

    SpotInstanceStateFaultType(code, message) =  new(code, message)
end
export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union(String, Nothing)
    updateTime::Union(XSDateTime, Nothing)
    message::Union(String, Nothing)

    SpotInstanceStatusMessageType() =  new(nothing, nothing, nothing)
end
export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::String

    SpotInstanceRequestIdSetItemType(spotInstanceRequestId) =  new(spotInstanceRequestId)
end
export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::String
    state::String

    CancelSpotInstanceRequestsResponseSetItemType(spotInstanceRequestId, state) =  new(spotInstanceRequestId, state)
end
export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::String

    InstanceTypeSetItemType(instanceType) =  new(instanceType)
end
export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::String

    ProductDescriptionSetItemType(productDescription) =  new(productDescription)
end
export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::String
    productDescription::String
    spotPrice::String
    timestamp::XSDateTime
    availabilityZone::Union(String, Nothing)

    SpotPriceHistorySetItemType(instanceType, productDescription, spotPrice, timestamp) =  new(instanceType, productDescription, spotPrice, timestamp, nothing)
end
export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::String
    prefix::String

    CreateSpotDatafeedSubscriptionType(bucket, prefix) =  new(bucket, prefix)
end
export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::String
    _return::Bool

    DeleteSpotDatafeedSubscriptionResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::String

    LicenseIdSetItemType(licenseId) =  new(licenseId)
end
export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Int32
    instanceCapacity::Int32
    state::String
    earliestAllowedDeactivationTime::Union(XSDateTime, Nothing)

    LicenseCapacitySetItemType(capacity, instanceCapacity, state) =  new(capacity, instanceCapacity, state, nothing)
end
export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::String
    capacity::Int32

    ActivateLicenseType(licenseId, capacity) =  new(licenseId, capacity)
end
export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::String
    _return::Bool

    ActivateLicenseResponseType(requestId, _return) =  new(requestId, _return)
end
export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::String
    capacity::Int32

    DeactivateLicenseType(licenseId, capacity) =  new(licenseId, capacity)
end
export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::String
    _return::Bool

    DeactivateLicenseResponseType(requestId, _return) =  new(requestId, _return)
end
export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::String
    strategy::String

    CreatePlacementGroupType(groupName, strategy) =  new(groupName, strategy)
end
export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::String
    _return::Bool

    CreatePlacementGroupResponseType(requestId, _return) =  new(requestId, _return)
end
export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::String

    DeletePlacementGroupType(groupName) =  new(groupName)
end
export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::String
    _return::Bool

    DeletePlacementGroupResponseType(requestId, _return) =  new(requestId, _return)
end
export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::String

    DescribePlacementGroupItemType(groupName) =  new(groupName)
end
export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::String
    strategy::String
    state::String

    PlacementGroupInfoType(groupName, strategy, state) =  new(groupName, strategy, state)
end
export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::String

    ResourceIdSetItemType(resourceId) =  new(resourceId)
end
export ResourceIdSetItemType


type ResourceTagSetItemType
    key::String
    value::String

    ResourceTagSetItemType(key, value) =  new(key, value)
end
export ResourceTagSetItemType


type CreateTagsResponseType
    requestId::String
    _return::Bool

    CreateTagsResponseType(requestId, _return) =  new(requestId, _return)
end
export CreateTagsResponseType


type TagSetItemType
    resourceId::Union(String, Nothing)
    resourceType::Union(String, Nothing)
    key::Union(String, Nothing)
    value::Union(String, Nothing)

    TagSetItemType() =  new(nothing, nothing, nothing, nothing)
end
export TagSetItemType


type DeleteTagsSetItemType
    key::Union(String, Nothing)
    value::Union(String, Nothing)

    DeleteTagsSetItemType() =  new(nothing, nothing)
end
export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::String
    _return::Bool

    DeleteTagsResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteTagsResponseType


type DiskImageDetailType
    format::String
    bytes::Int64
    importManifestUrl::String

    DiskImageDetailType(format, bytes, importManifestUrl) =  new(format, bytes, importManifestUrl)
end
export DiskImageDetailType


type DiskImageVolumeType
    size::Int

    DiskImageVolumeType(size) =  new(size)
end
export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Int
    id::String

    DiskImageVolumeDescriptionType(size, id) =  new(size, id)
end
export DiskImageVolumeDescriptionType


type DiskImageDescriptionType
    format::String
    size::Int64
    importManifestUrl::String
    checksum::Union(String, Nothing)

    DiskImageDescriptionType(format, size, importManifestUrl) =  new(format, size, importManifestUrl, nothing)
end
export DiskImageDescriptionType


type ConversionTaskIdItemType
    conversionTaskId::String

    ConversionTaskIdItemType(conversionTaskId) =  new(conversionTaskId)
end
export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::String

    CancelConversionTaskType(conversionTaskId) =  new(conversionTaskId)
end
export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::String
    _return::Bool

    CancelConversionTaskResponseType(requestId, _return) =  new(requestId, _return)
end
export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union(String, Nothing)
    instanceId::String
    targetEnvironment::String

    CreateInstanceExportTaskType(instanceId, targetEnvironment) =  new(nothing, instanceId, targetEnvironment)
end
export CreateInstanceExportTaskType


type ExportToS3TaskType
    diskImageFormat::Union(String, Nothing)
    containerFormat::Union(String, Nothing)
    s3Bucket::String
    s3Prefix::String

    ExportToS3TaskType(s3Bucket, s3Prefix) =  new(nothing, nothing, s3Bucket, s3Prefix)
end
export ExportToS3TaskType


type ExportTaskIdType
    exportTaskId::String

    ExportTaskIdType(exportTaskId) =  new(exportTaskId)
end
export ExportTaskIdType


type ExportTaskResponseType
    exportTaskId::String
    description::Union(String, Nothing)
    state::String
    statusMessage::Union(String, Nothing)

    ExportTaskResponseType(exportTaskId, state) =  new(exportTaskId, nothing, state, nothing)
end
export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::String
    targetEnvironment::Union(String, Nothing)

    InstanceExportTaskResponseType(instanceId) =  new(instanceId, nothing)
end
export InstanceExportTaskResponseType


type ExportToS3TaskResponseType
    diskImageFormat::String
    containerFormat::Union(String, Nothing)
    s3Bucket::String
    s3Key::String

    ExportToS3TaskResponseType(diskImageFormat, s3Bucket, s3Key) =  new(diskImageFormat, nothing, s3Bucket, s3Key)
end
export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::String

    CancelExportTaskType(exportTaskId) =  new(exportTaskId)
end
export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::String
    _return::Bool

    CancelExportTaskResponseType(requestId, _return) =  new(requestId, _return)
end
export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::String
    state::String

    InternetGatewayAttachmentType(vpcId, state) =  new(vpcId, state)
end
export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::String

    InternetGatewayIdSetItemType(internetGatewayId) =  new(internetGatewayId)
end
export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::String

    DeleteInternetGatewayType(internetGatewayId) =  new(internetGatewayId)
end
export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::String
    _return::Bool

    DeleteInternetGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::String
    vpcId::String

    AttachInternetGatewayType(internetGatewayId, vpcId) =  new(internetGatewayId, vpcId)
end
export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::String
    _return::Bool

    AttachInternetGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::String
    vpcId::String

    DetachInternetGatewayType(internetGatewayId, vpcId) =  new(internetGatewayId, vpcId)
end
export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::String
    _return::Bool

    DetachInternetGatewayResponseType(requestId, _return) =  new(requestId, _return)
end
export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::String

    CreateRouteTableType(vpcId) =  new(vpcId)
end
export CreateRouteTableType


type RouteType
    destinationCidrBlock::String
    gatewayId::Union(String, Nothing)
    instanceId::Union(String, Nothing)
    instanceOwnerId::Union(String, Nothing)
    networkInterfaceId::Union(String, Nothing)
    state::String
    origin::String

    RouteType(destinationCidrBlock, state, origin) =  new(destinationCidrBlock, nothing, nothing, nothing, nothing, state, origin)
end
export RouteType


type RouteTableAssociationType
    routeTableAssociationId::String
    routeTableId::String

    RouteTableAssociationType(routeTableAssociationId, routeTableId) =  new(routeTableAssociationId, routeTableId)
end
export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::String

    PropagatingVgwType(gatewayId) =  new(gatewayId)
end
export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::String

    RouteTableIdSetItemType(routeTableId) =  new(routeTableId)
end
export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::String
    gatewayId::String

    EnableVgwRoutePropagationRequestType(routeTableId, gatewayId) =  new(routeTableId, gatewayId)
end
export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::String
    _return::Bool

    EnableVgwRoutePropagationResponseType(requestId, _return) =  new(requestId, _return)
end
export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::String
    gatewayId::String

    DisableVgwRoutePropagationRequestType(routeTableId, gatewayId) =  new(routeTableId, gatewayId)
end
export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::String
    _return::Bool

    DisableVgwRoutePropagationResponseType(requestId, _return) =  new(requestId, _return)
end
export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::String

    DeleteRouteTableType(routeTableId) =  new(routeTableId)
end
export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::String
    _return::Bool

    DeleteRouteTableResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::String
    subnetId::String

    AssociateRouteTableType(routeTableId, subnetId) =  new(routeTableId, subnetId)
end
export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::String
    associationId::String

    AssociateRouteTableResponseType(requestId, associationId) =  new(requestId, associationId)
end
export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::String
    routeTableId::String

    ReplaceRouteTableAssociationType(associationId, routeTableId) =  new(associationId, routeTableId)
end
export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::String
    newAssociationId::String

    ReplaceRouteTableAssociationResponseType(requestId, newAssociationId) =  new(requestId, newAssociationId)
end
export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::String

    DisassociateRouteTableType(associationId) =  new(associationId)
end
export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::String
    _return::Bool

    DisassociateRouteTableResponseType(requestId, _return) =  new(requestId, _return)
end
export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::String
    destinationCidrBlock::String

    CreateRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end
export CreateRouteType


type CreateRouteResponseType
    requestId::String
    _return::Bool

    CreateRouteResponseType(requestId, _return) =  new(requestId, _return)
end
export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::String
    destinationCidrBlock::String

    ReplaceRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end
export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::String
    _return::Bool

    ReplaceRouteResponseType(requestId, _return) =  new(requestId, _return)
end
export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::String
    destinationCidrBlock::String

    DeleteRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end
export DeleteRouteType


type DeleteRouteResponseType
    requestId::String
    _return::Bool

    DeleteRouteResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::String

    CreateNetworkAclType(vpcId) =  new(vpcId)
end
export CreateNetworkAclType


type IcmpTypeCodeType
    code::Int32
    _type::Int32

    IcmpTypeCodeType(code, _type) =  new(code, _type)
end
export IcmpTypeCodeType


type PortRangeType
    from::Int32
    to::Int32

    PortRangeType(from, to) =  new(from, to)
end
export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::String
    networkAclId::String
    subnetId::String

    NetworkAclAssociationType(networkAclAssociationId, networkAclId, subnetId) =  new(networkAclAssociationId, networkAclId, subnetId)
end
export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::String

    NetworkAclIdSetItemType(networkAclId) =  new(networkAclId)
end
export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::String

    DeleteNetworkAclType(networkAclId) =  new(networkAclId)
end
export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::String
    _return::Bool

    DeleteNetworkAclResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::String
    networkAclId::String

    ReplaceNetworkAclAssociationType(associationId, networkAclId) =  new(associationId, networkAclId)
end
export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::String
    newAssociationId::String

    ReplaceNetworkAclAssociationResponseType(requestId, newAssociationId) =  new(requestId, newAssociationId)
end
export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::String
    _return::Bool

    CreateNetworkAclEntryResponseType(requestId, _return) =  new(requestId, _return)
end
export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::String
    _return::Bool

    ReplaceNetworkAclEntryResponseType(requestId, _return) =  new(requestId, _return)
end
export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::String
    ruleNumber::Int32
    egress::Bool

    DeleteNetworkAclEntryType(networkAclId, ruleNumber, egress) =  new(networkAclId, ruleNumber, egress)
end
export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::String
    _return::Bool

    DeleteNetworkAclEntryResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::String
    status::String
    impairedSince::Union(XSDateTime, Nothing)

    InstanceStatusDetailsSetItemType(name, status) =  new(name, status, nothing)
end
export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::String
    description::String
    notBefore::XSDateTime
    notAfter::Union(XSDateTime, Nothing)

    InstanceStatusEventType(code, description, notBefore) =  new(code, description, notBefore, nothing)
end
export InstanceStatusEventType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::String

    ReportInstanceStatusReasonCodeSetItemType(reasonCode) =  new(reasonCode)
end
export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::String
    _return::Bool

    ReportInstanceStatusResponseType(requestId, _return) =  new(requestId, _return)
end
export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::String

    NetworkInterfaceIdSetItemType(networkInterfaceId) =  new(networkInterfaceId)
end
export NetworkInterfaceIdSetItemType


type NetworkInterfaceAttachmentType
    attachmentId::String
    instanceId::Union(String, Nothing)
    instanceOwnerId::Union(String, Nothing)
    deviceIndex::Int32
    status::String
    attachTime::XSDateTime
    deleteOnTermination::Bool

    NetworkInterfaceAttachmentType(attachmentId, deviceIndex, status, attachTime, deleteOnTermination) =  new(attachmentId, nothing, nothing, deviceIndex, status, attachTime, deleteOnTermination)
end
export NetworkInterfaceAttachmentType


type NetworkInterfaceAssociationType
    publicIp::String
    publicDnsName::Union(String, Nothing)
    ipOwnerId::Union(String, Nothing)
    allocationId::Union(String, Nothing)
    associationId::Union(String, Nothing)

    NetworkInterfaceAssociationType(publicIp) =  new(publicIp, nothing, nothing, nothing, nothing)
end
export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::String

    DeleteNetworkInterfaceType(networkInterfaceId) =  new(networkInterfaceId)
end
export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::String
    _return::Bool

    DeleteNetworkInterfaceResponseType(requestId, _return) =  new(requestId, _return)
end
export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::String
    instanceId::String
    deviceIndex::Int32

    AttachNetworkInterfaceType(networkInterfaceId, instanceId, deviceIndex) =  new(networkInterfaceId, instanceId, deviceIndex)
end
export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::String
    attachmentId::String

    AttachNetworkInterfaceResponseType(requestId, attachmentId) =  new(requestId, attachmentId)
end
export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::String
    force::Union(Bool, Nothing)

    DetachNetworkInterfaceType(attachmentId) =  new(attachmentId, nothing)
end
export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::String
    _return::Bool

    DetachNetworkInterfaceResponseType(requestId, _return) =  new(requestId, _return)
end
export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::String

    DescribeNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end
export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::String
    networkInterfaceId::String

    DescribeNetworkInterfaceAttributeResponseType(requestId, networkInterfaceId) =  new(requestId, networkInterfaceId)
end
export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::String

    ModifyNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end
export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::String
    deleteOnTermination::Bool

    ModifyNetworkInterfaceAttachmentType(attachmentId, deleteOnTermination) =  new(attachmentId, deleteOnTermination)
end
export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::String
    _return::Bool

    ModifyNetworkInterfaceAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::String

    ResetNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end
export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::String
    _return::Bool

    ResetNetworkInterfaceAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesResponseType
    requestId::String
    _return::Bool

    AssignPrivateIpAddressesResponseType(requestId, _return) =  new(requestId, _return)
end
export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesResponseType
    requestId::String
    _return::Bool

    UnassignPrivateIpAddressesResponseType(requestId, _return) =  new(requestId, _return)
end
export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::String

    AssignPrivateIpAddressesSetItemRequestType(privateIpAddress) =  new(privateIpAddress)
end
export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::String
    status::String

    VolumeStatusDetailsItemType(name, status) =  new(name, status)
end
export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::String
    notBefore::XSDateTime
    notAfter::XSDateTime
    eventId::String
    eventType::String

    VolumeStatusEventItemType(description, notBefore, notAfter, eventId, eventType) =  new(description, notBefore, notAfter, eventId, eventType)
end
export VolumeStatusEventItemType


type VolumeStatusActionItemType
    description::String
    code::String
    eventId::String
    eventType::String

    VolumeStatusActionItemType(description, code, eventId, eventType) =  new(description, code, eventId, eventType)
end
export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::String

    EnableVolumeIOType(volumeId) =  new(volumeId)
end
export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::String
    _return::Bool

    EnableVolumeIOResponseType(requestId, _return) =  new(requestId, _return)
end
export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::String

    ModifyVolumeAttributeType(volumeId) =  new(volumeId)
end
export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::String
    _return::Bool

    ModifyVolumeAttributeResponseType(requestId, _return) =  new(requestId, _return)
end
export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::String

    DescribeVolumeAttributeType(volumeId) =  new(volumeId)
end
export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::String
    volumeId::String

    DescribeVolumeAttributeResponseType(requestId, volumeId) =  new(requestId, volumeId)
end
export DescribeVolumeAttributeResponseType


type PriceScheduleRequestSetType
    item::Array{PriceScheduleRequestSetItemType,1}

    PriceScheduleRequestSetType(item) =  new(item)
end
export PriceScheduleRequestSetType


type VpnGatewayIdSetType
    item::Union(Array{VpnGatewayIdSetItemType,1}, Nothing)

    VpnGatewayIdSetType() =  new(nothing)
end
export VpnGatewayIdSetType


type AvailabilityZoneMessageSetType
    item::Union(Array{AvailabilityZoneMessageType,1}, Nothing)

    AvailabilityZoneMessageSetType() =  new(nothing)
end
export AvailabilityZoneMessageSetType


type DescribeSecurityGroupsSetType
    item::Union(Array{DescribeSecurityGroupsSetItemType,1}, Nothing)

    DescribeSecurityGroupsSetType() =  new(nothing)
end
export DescribeSecurityGroupsSetType


type VgwTelemetryType
    item::Union(Array{VpnTunnelTelemetryType,1}, Nothing)

    VgwTelemetryType() =  new(nothing)
end
export VgwTelemetryType


type CreateReservedInstancesListingType
    reservedInstancesId::String
    instanceCount::Union(Int32, Nothing)
    priceSchedules::PriceScheduleRequestSetType
    clientToken::String

    CreateReservedInstancesListingType(reservedInstancesId, priceSchedules, clientToken) =  new(reservedInstancesId, nothing, priceSchedules, clientToken)
end
export CreateReservedInstancesListingType


type UnavailableResultSetType
    item::Union(Array{UnavailableResultType,1}, Nothing)

    UnavailableResultSetType() =  new(nothing)
end
export UnavailableResultSetType


type DescribeReservedInstancesListingSetType
    item::Array{DescribeReservedInstancesListingSetItemType,1}

    DescribeReservedInstancesListingSetType(item) =  new(item)
end
export DescribeReservedInstancesListingSetType


type NetworkAclEntryType
    ruleNumber::Int32
    protocol::String
    ruleAction::String
    egress::Bool
    cidrBlock::String
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    NetworkAclEntryType(ruleNumber, protocol, ruleAction, egress, cidrBlock) =  new(ruleNumber, protocol, ruleAction, egress, cidrBlock, nothing, nothing)
end
export NetworkAclEntryType


type BundleInstanceTaskStorageType
    S3::BundleInstanceS3StorageType

    BundleInstanceTaskStorageType(S3) =  new(S3)
end
export BundleInstanceTaskStorageType


type DescribeAddressesInfoType
    item::Union(Array{DescribeAddressesItemType,1}, Nothing)

    DescribeAddressesInfoType() =  new(nothing)
end
export DescribeAddressesInfoType


type AttachmentSetType
    item::Union(Array{AttachmentType,1}, Nothing)

    AttachmentSetType() =  new(nothing)
end
export AttachmentSetType


type ProductDescriptionSetType
    item::Array{ProductDescriptionSetItemType,1}

    ProductDescriptionSetType(item) =  new(item)
end
export ProductDescriptionSetType


type ProductCodesSetType
    item::Union(Array{ProductCodesSetItemType,1}, Nothing)

    ProductCodesSetType() =  new(nothing)
end
export ProductCodesSetType


type DescribeRegionsSetType
    item::Union(Array{DescribeRegionsSetItemType,1}, Nothing)

    DescribeRegionsSetType() =  new(nothing)
end
export DescribeRegionsSetType


type ResourceIdSetType
    item::Union(Array{ResourceIdSetItemType,1}, Nothing)

    ResourceIdSetType() =  new(nothing)
end
export ResourceIdSetType


type PriceScheduleSetType
    item::Union(Array{PriceScheduleSetItemType,1}, Nothing)

    PriceScheduleSetType() =  new(nothing)
end
export PriceScheduleSetType


type ImportInstanceVolumeDetailItemType
    bytesConverted::Int64
    availabilityZone::String
    image::DiskImageDescriptionType
    description::Union(String, Nothing)
    volume::DiskImageVolumeDescriptionType
    status::String
    statusMessage::Union(String, Nothing)

    ImportInstanceVolumeDetailItemType(bytesConverted, availabilityZone, image, volume, status) =  new(bytesConverted, availabilityZone, image, nothing, volume, status, nothing)
end
export ImportInstanceVolumeDetailItemType


type CustomerGatewayIdSetType
    item::Union(Array{CustomerGatewayIdSetItemType,1}, Nothing)

    CustomerGatewayIdSetType() =  new(nothing)
end
export CustomerGatewayIdSetType


type ValueSetType
    item::Union(Array{ValueType,1}, Nothing)

    ValueSetType() =  new(nothing)
end
export ValueSetType


type GroupSetType
    item::Union(Array{GroupItemType,1}, Nothing)

    GroupSetType() =  new(nothing)
end
export GroupSetType


type DeleteTagsSetType
    item::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsSetType() =  new(nothing)
end
export DeleteTagsSetType


type DescribeKeyPairsInfoType
    item::Union(Array{DescribeKeyPairsItemType,1}, Nothing)

    DescribeKeyPairsInfoType() =  new(nothing)
end
export DescribeKeyPairsInfoType


type DescribeVolumesSetType
    item::Union(Array{DescribeVolumesSetItemType,1}, Nothing)

    DescribeVolumesSetType() =  new(nothing)
end
export DescribeVolumesSetType


type SpotPriceHistorySetType
    item::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)

    SpotPriceHistorySetType() =  new(nothing)
end
export SpotPriceHistorySetType


type IpRangeSetType
    item::Union(Array{IpRangeItemType,1}, Nothing)

    IpRangeSetType() =  new(nothing)
end
export IpRangeSetType


type DescribeKeyPairsResponseInfoType
    item::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseInfoType() =  new(nothing)
end
export DescribeKeyPairsResponseInfoType


type CreateVpnConnectionType
    _type::String
    customerGatewayId::String
    vpnGatewayId::String
    options::Union(VpnConnectionOptionsRequestType, Nothing)

    CreateVpnConnectionType(_type, customerGatewayId, vpnGatewayId) =  new(_type, customerGatewayId, vpnGatewayId, nothing)
end
export CreateVpnConnectionType


type AvailabilityZoneItemType
    zoneName::String
    zoneState::String
    regionName::String
    messageSet::AvailabilityZoneMessageSetType

    AvailabilityZoneItemType(zoneName, zoneState, regionName, messageSet) =  new(zoneName, zoneState, regionName, messageSet)
end
export AvailabilityZoneItemType


type ReplaceNetworkAclEntryType
    networkAclId::String
    ruleNumber::Int32
    protocol::String
    ruleAction::String
    egress::Bool
    cidrBlock::String
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    ReplaceNetworkAclEntryType(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock) =  new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, nothing, nothing)
end
export ReplaceNetworkAclEntryType


type DescribeAvailabilityZonesSetType
    item::Union(Array{DescribeAvailabilityZonesSetItemType,1}, Nothing)

    DescribeAvailabilityZonesSetType() =  new(nothing)
end
export DescribeAvailabilityZonesSetType


type DescribeSnapshotsSetType
    item::Union(Array{DescribeSnapshotsSetItemType,1}, Nothing)

    DescribeSnapshotsSetType() =  new(nothing)
end
export DescribeSnapshotsSetType


type SubnetIdSetType
    item::Union(Array{SubnetIdSetItemType,1}, Nothing)

    SubnetIdSetType() =  new(nothing)
end
export SubnetIdSetType


type VpcIdSetType
    item::Union(Array{VpcIdSetItemType,1}, Nothing)

    VpcIdSetType() =  new(nothing)
end
export VpcIdSetType


type ConversionTaskIdSetType
    item::Union(Array{ConversionTaskIdItemType,1}, Nothing)

    ConversionTaskIdSetType() =  new(nothing)
end
export ConversionTaskIdSetType


type PlacementGroupSetType
    item::Union(Array{PlacementGroupInfoType,1}, Nothing)

    PlacementGroupSetType() =  new(nothing)
end
export PlacementGroupSetType


type SpotDatafeedSubscriptionType
    ownerId::String
    bucket::String
    prefix::String
    state::String
    fault::Union(SpotInstanceStateFaultType, Nothing)

    SpotDatafeedSubscriptionType(ownerId, bucket, prefix, state) =  new(ownerId, bucket, prefix, state, nothing)
end
export SpotDatafeedSubscriptionType


type AllocationIdSetType
    item::Union(Array{AllocationIdSetItemType,1}, Nothing)

    AllocationIdSetType() =  new(nothing)
end
export AllocationIdSetType


type DescribeBundleTasksInfoType
    item::Union(Array{DescribeBundleTasksItemType,1}, Nothing)

    DescribeBundleTasksInfoType() =  new(nothing)
end
export DescribeBundleTasksInfoType


type TagSetType
    item::Union(Array{TagSetItemType,1}, Nothing)

    TagSetType() =  new(nothing)
end
export TagSetType


type NetworkAclAssociationSetType
    item::Union(Array{NetworkAclAssociationType,1}, Nothing)

    NetworkAclAssociationSetType() =  new(nothing)
end
export NetworkAclAssociationSetType


type DescribeImagesInfoType
    item::Union(Array{DescribeImagesItemType,1}, Nothing)

    DescribeImagesInfoType() =  new(nothing)
end
export DescribeImagesInfoType


type NetworkInterfaceIdSetType
    item::Union(Array{NetworkInterfaceIdSetItemType,1}, Nothing)

    NetworkInterfaceIdSetType() =  new(nothing)
end
export NetworkInterfaceIdSetType


type DescribeSnapshotsRestorableBySetType
    item::Union(Array{DescribeSnapshotsRestorableByType,1}, Nothing)

    DescribeSnapshotsRestorableBySetType() =  new(nothing)
end
export DescribeSnapshotsRestorableBySetType


type ImportVolumeType
    availabilityZone::String
    image::DiskImageDetailType
    description::Union(String, Nothing)
    volume::DiskImageVolumeType

    ImportVolumeType(availabilityZone, image, volume) =  new(availabilityZone, image, nothing, volume)
end
export ImportVolumeType


type RegionSetType
    item::Union(Array{RegionItemType,1}, Nothing)

    RegionSetType() =  new(nothing)
end
export RegionSetType


type VpnConnectionIdSetType
    item::Union(Array{VpnConnectionIdSetItemType,1}, Nothing)

    VpnConnectionIdSetType() =  new(nothing)
end
export VpnConnectionIdSetType


type VolumeStatusEventsSetType
    item::Union(Array{VolumeStatusEventItemType,1}, Nothing)

    VolumeStatusEventsSetType() =  new(nothing)
end
export VolumeStatusEventsSetType


type RebootInstancesInfoType
    item::Array{RebootInstancesItemType,1}

    RebootInstancesInfoType(item) =  new(item)
end
export RebootInstancesInfoType


type VpnStaticRoutesSetType
    item::Union(Array{VpnStaticRouteType,1}, Nothing)

    VpnStaticRoutesSetType() =  new(nothing)
end
export VpnStaticRoutesSetType


type ExportTaskSetResponseType
    item::Union(Array{ExportTaskResponseType,1}, Nothing)

    ExportTaskSetResponseType() =  new(nothing)
end
export ExportTaskSetResponseType


type RebootInstancesType
    instancesSet::RebootInstancesInfoType

    RebootInstancesType(instancesSet) =  new(instancesSet)
end
export RebootInstancesType


type RouteTableAssociationSetType
    item::Union(Array{RouteTableAssociationType,1}, Nothing)

    RouteTableAssociationSetType() =  new(nothing)
end
export RouteTableAssociationSetType


type VolumeStatusActionsSetType
    item::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusActionsSetType() =  new(nothing)
end
export VolumeStatusActionsSetType


type DescribeImagesOwnersType
    item::Union(Array{DescribeImagesOwnerType,1}, Nothing)

    DescribeImagesOwnersType() =  new(nothing)
end
export DescribeImagesOwnersType


type DescribePlacementGroupsResponseType
    requestId::String
    placementGroupSet::PlacementGroupSetType

    DescribePlacementGroupsResponseType(requestId, placementGroupSet) =  new(requestId, placementGroupSet)
end
export DescribePlacementGroupsResponseType


type SpotInstanceRequestIdSetType
    item::Union(Array{SpotInstanceRequestIdSetItemType,1}, Nothing)

    SpotInstanceRequestIdSetType() =  new(nothing)
end
export SpotInstanceRequestIdSetType


type BundleInstanceTaskType
    instanceId::String
    bundleId::String
    state::String
    startTime::XSDateTime
    updateTime::XSDateTime
    storage::BundleInstanceTaskStorageType
    progress::Union(String, Nothing)
    error::Union(BundleInstanceTaskErrorType, Nothing)

    BundleInstanceTaskType(instanceId, bundleId, state, startTime, updateTime, storage) =  new(instanceId, bundleId, state, startTime, updateTime, storage, nothing, nothing)
end
export BundleInstanceTaskType


type CreateInstanceExportTaskResponseType
    requestId::String
    exportTask::ExportTaskResponseType

    CreateInstanceExportTaskResponseType(requestId, exportTask) =  new(requestId, exportTask)
end
export CreateInstanceExportTaskResponseType


type InstanceIdSetType
    item::Union(Array{InstanceIdType,1}, Nothing)

    InstanceIdSetType() =  new(nothing)
end
export InstanceIdSetType


type LicenseCapacitySetType
    item::Union(Array{LicenseCapacitySetItemType,1}, Nothing)

    LicenseCapacitySetType() =  new(nothing)
end
export LicenseCapacitySetType


type InstanceBlockDeviceMappingType
    item::Union(Array{InstanceBlockDeviceMappingItemType,1}, Nothing)

    InstanceBlockDeviceMappingType() =  new(nothing)
end
export InstanceBlockDeviceMappingType


type InstanceBlockDeviceMappingResponseType
    item::Union(Array{InstanceBlockDeviceMappingResponseItemType,1}, Nothing)

    InstanceBlockDeviceMappingResponseType() =  new(nothing)
end
export InstanceBlockDeviceMappingResponseType


type InstanceStatusDetailsSetType
    item::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusDetailsSetType() =  new(nothing)
end
export InstanceStatusDetailsSetType


type RecurringChargesSetType
    item::Union(Array{RecurringChargesSetItemType,1}, Nothing)

    RecurringChargesSetType() =  new(nothing)
end
export RecurringChargesSetType


type InternetGatewayIdSetType
    item::Union(Array{InternetGatewayIdSetItemType,1}, Nothing)

    InternetGatewayIdSetType() =  new(nothing)
end
export InternetGatewayIdSetType


type DescribeExportTasksResponseType
    requestId::String
    exportTaskSet::ExportTaskSetResponseType

    DescribeExportTasksResponseType(requestId, exportTaskSet) =  new(requestId, exportTaskSet)
end
export DescribeExportTasksResponseType


type BlockDeviceMappingType
    item::Union(Array{BlockDeviceMappingItemType,1}, Nothing)

    BlockDeviceMappingType() =  new(nothing)
end
export BlockDeviceMappingType


type DescribeRegionsResponseType
    requestId::String
    regionInfo::RegionSetType

    DescribeRegionsResponseType(requestId, regionInfo) =  new(requestId, regionInfo)
end
export DescribeRegionsResponseType


type AccountAttributeValueSetType
    item::Union(Array{AccountAttributeValueSetItemType,1}, Nothing)

    AccountAttributeValueSetType() =  new(nothing)
end
export AccountAttributeValueSetType


type ExportTaskIdSetType
    item::Union(Array{ExportTaskIdType,1}, Nothing)

    ExportTaskIdSetType() =  new(nothing)
end
export ExportTaskIdSetType


type InstanceCountsSetType
    item::Array{InstanceCountsSetItemType,1}

    InstanceCountsSetType(item) =  new(item)
end
export InstanceCountsSetType


type DescribeAddressesResponseInfoType
    item::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseInfoType() =  new(nothing)
end
export DescribeAddressesResponseInfoType


type DescribeKeyPairsResponseType
    requestId::String
    keySet::DescribeKeyPairsResponseInfoType

    DescribeKeyPairsResponseType(requestId, keySet) =  new(requestId, keySet)
end
export DescribeKeyPairsResponseType


type DescribeReservedInstancesOfferingsSetType
    item::Union(Array{DescribeReservedInstancesOfferingsSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsSetType() =  new(nothing)
end
export DescribeReservedInstancesOfferingsSetType


type LicenseIdSetType
    item::Union(Array{LicenseIdSetItemType,1}, Nothing)

    LicenseIdSetType() =  new(nothing)
end
export LicenseIdSetType


type InstanceStatusEventsSetType
    item::Union(Array{InstanceStatusEventType,1}, Nothing)

    InstanceStatusEventsSetType() =  new(nothing)
end
export InstanceStatusEventsSetType


type DescribeImagesExecutableBySetType
    item::Union(Array{DescribeImagesExecutableByType,1}, Nothing)

    DescribeImagesExecutableBySetType() =  new(nothing)
end
export DescribeImagesExecutableBySetType


type RouteTableIdSetType
    item::Union(Array{RouteTableIdSetItemType,1}, Nothing)

    RouteTableIdSetType() =  new(nothing)
end
export RouteTableIdSetType


type AssignPrivateIpAddressesSetRequestType
    item::Array{AssignPrivateIpAddressesSetItemRequestType,1}

    AssignPrivateIpAddressesSetRequestType(item) =  new(item)
end
export AssignPrivateIpAddressesSetRequestType


type ImportVolumeTaskDetailsType
    bytesConverted::Int64
    availabilityZone::String
    description::Union(String, Nothing)
    image::DiskImageDescriptionType
    volume::DiskImageVolumeDescriptionType

    ImportVolumeTaskDetailsType(bytesConverted, availabilityZone, image, volume) =  new(bytesConverted, availabilityZone, nothing, image, volume)
end
export ImportVolumeTaskDetailsType


type FilterType
    name::String
    valueSet::ValueSetType

    FilterType(name, valueSet) =  new(name, valueSet)
end
export FilterType


type NetworkAclIdSetType
    item::Union(Array{NetworkAclIdSetItemType,1}, Nothing)

    NetworkAclIdSetType() =  new(nothing)
end
export NetworkAclIdSetType


type DescribeInstancesInfoType
    item::Union(Array{DescribeInstancesItemType,1}, Nothing)

    DescribeInstancesInfoType() =  new(nothing)
end
export DescribeInstancesInfoType


type ImportInstanceGroupSetType
    item::Union(Array{ImportInstanceGroupItemType,1}, Nothing)

    ImportInstanceGroupSetType() =  new(nothing)
end
export ImportInstanceGroupSetType


type MonitorInstancesSetType
    item::Array{MonitorInstancesSetItemType,1}

    MonitorInstancesSetType(item) =  new(item)
end
export MonitorInstancesSetType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::String
    instanceCount::Int32
    limitPrice::Union(ReservedInstanceLimitPriceType, Nothing)

    PurchaseReservedInstancesOfferingType(reservedInstancesOfferingId, instanceCount) =  new(reservedInstancesOfferingId, instanceCount, nothing)
end
export PurchaseReservedInstancesOfferingType


type CreateNetworkAclEntryType
    networkAclId::String
    ruleNumber::Int32
    protocol::String
    ruleAction::String
    egress::Bool
    cidrBlock::String
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    CreateNetworkAclEntryType(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock) =  new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, nothing, nothing)
end
export CreateNetworkAclEntryType


type CreateImageType
    instanceId::String
    name::String
    description::Union(String, Nothing)
    noReboot::Union(Bool, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)

    CreateImageType(instanceId, name) =  new(instanceId, name, nothing, nothing, nothing)
end
export CreateImageType


type PropagatingVgwSetType
    item::Union(Array{PropagatingVgwType,1}, Nothing)

    PropagatingVgwSetType() =  new(nothing)
end
export PropagatingVgwSetType


type AttachmentSetResponseType
    item::Union(Array{AttachmentSetItemResponseType,1}, Nothing)

    AttachmentSetResponseType() =  new(nothing)
end
export AttachmentSetResponseType


type StartInstancesType
    instancesSet::InstanceIdSetType

    StartInstancesType(instancesSet) =  new(instancesSet)
end
export StartInstancesType


type PricingDetailsSetType
    item::Union(Array{PricingDetailsSetItemType,1}, Nothing)

    PricingDetailsSetType() =  new(nothing)
end
export PricingDetailsSetType


type ProductCodeListType
    item::Union(Array{ProductCodeItemType,1}, Nothing)

    ProductCodeListType() =  new(nothing)
end
export ProductCodeListType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::String
    spotDatafeedSubscription::SpotDatafeedSubscriptionType

    DescribeSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) =  new(requestId, spotDatafeedSubscription)
end
export DescribeSpotDatafeedSubscriptionResponseType


type DescribeSnapshotsOwnersType
    item::Union(Array{DescribeSnapshotsOwnerType,1}, Nothing)

    DescribeSnapshotsOwnersType() =  new(nothing)
end
export DescribeSnapshotsOwnersType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::String
    spotDatafeedSubscription::SpotDatafeedSubscriptionType

    CreateSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) =  new(requestId, spotDatafeedSubscription)
end
export CreateSpotDatafeedSubscriptionResponseType


type DescribeSecurityGroupsIdSetType
    item::Union(Array{DescribeSecurityGroupsIdSetItemType,1}, Nothing)

    DescribeSecurityGroupsIdSetType() =  new(nothing)
end
export DescribeSecurityGroupsIdSetType


type DescribeReservedInstancesSetType
    item::Union(Array{DescribeReservedInstancesSetItemType,1}, Nothing)

    DescribeReservedInstancesSetType() =  new(nothing)
end
export DescribeReservedInstancesSetType


type AccountAttributeSetItemType
    attributeName::String
    attributeValueSet::AccountAttributeValueSetType

    AccountAttributeSetItemType(attributeName, attributeValueSet) =  new(attributeName, attributeValueSet)
end
export AccountAttributeSetItemType


type FilterSetType
    item::Union(Array{FilterType,1}, Nothing)

    FilterSetType() =  new(nothing)
end
export FilterSetType


type AvailabilityZoneSetType
    item::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    AvailabilityZoneSetType() =  new(nothing)
end
export AvailabilityZoneSetType


type InstanceStateChangeType
    instanceId::String
    currentState::InstanceStateType
    previousState::InstanceStateType

    InstanceStateChangeType(instanceId, currentState, previousState) =  new(instanceId, currentState, previousState)
end
export InstanceStateChangeType


type ReportInstanceStatusReasonCodesSetType
    item::Array{ReportInstanceStatusReasonCodeSetItemType,1}

    ReportInstanceStatusReasonCodesSetType(item) =  new(item)
end
export ReportInstanceStatusReasonCodesSetType


type DescribeBundleTasksType
    bundlesSet::DescribeBundleTasksInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeBundleTasksType(bundlesSet) =  new(bundlesSet, nothing)
end
export DescribeBundleTasksType


type DescribeRouteTablesType
    routeTableIdSet::RouteTableIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeRouteTablesType(routeTableIdSet) =  new(routeTableIdSet, nothing)
end
export DescribeRouteTablesType


type DescribePlacementGroupsInfoType
    item::Union(Array{DescribePlacementGroupItemType,1}, Nothing)

    DescribePlacementGroupsInfoType() =  new(nothing)
end
export DescribePlacementGroupsInfoType


type DescribeSecurityGroupsType
    securityGroupSet::DescribeSecurityGroupsSetType
    securityGroupIdSet::Union(DescribeSecurityGroupsIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSecurityGroupsType(securityGroupSet) =  new(securityGroupSet, nothing, nothing)
end
export DescribeSecurityGroupsType


type CancelBundleTaskResponseType
    requestId::String
    bundleInstanceTask::BundleInstanceTaskType

    CancelBundleTaskResponseType(requestId, bundleInstanceTask) =  new(requestId, bundleInstanceTask)
end
export CancelBundleTaskResponseType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::String
    privateDnsName::Union(String, Nothing)
    primary::Bool
    association::Union(NetworkInterfaceAssociationType, Nothing)

    NetworkInterfacePrivateIpAddressesSetItemType(privateIpAddress, primary) =  new(privateIpAddress, nothing, primary, nothing)
end
export NetworkInterfacePrivateIpAddressesSetItemType


type InstanceTypeSetType
    item::Array{InstanceTypeSetItemType,1}

    InstanceTypeSetType(item) =  new(item)
end
export InstanceTypeSetType


type DiskImageType
    image::DiskImageDetailType
    description::Union(String, Nothing)
    volume::DiskImageVolumeType

    DiskImageType(image, volume) =  new(image, nothing, volume)
end
export DiskImageType


type AccountAttributeSetType
    item::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    AccountAttributeSetType() =  new(nothing)
end
export AccountAttributeSetType


type UserIdGroupPairSetType
    item::Union(Array{UserIdGroupPairType,1}, Nothing)

    UserIdGroupPairSetType() =  new(nothing)
end
export UserIdGroupPairSetType


type ResourceTagSetType
    item::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ResourceTagSetType() =  new(nothing)
end
export ResourceTagSetType


type NetworkAclEntrySetType
    item::Union(Array{NetworkAclEntryType,1}, Nothing)

    NetworkAclEntrySetType() =  new(nothing)
end
export NetworkAclEntrySetType


type LaunchPermissionListType
    item::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionListType() =  new(nothing)
end
export LaunchPermissionListType


type SecurityGroupIdSetType
    item::Union(Array{SecurityGroupIdSetItemType,1}, Nothing)

    SecurityGroupIdSetType() =  new(nothing)
end
export SecurityGroupIdSetType


type InternetGatewayAttachmentSetType
    item::Union(Array{InternetGatewayAttachmentType,1}, Nothing)

    InternetGatewayAttachmentSetType() =  new(nothing)
end
export InternetGatewayAttachmentSetType


type ConversionTaskType
    conversionTaskId::String
    expirationTime::Union(String, Nothing)
    state::String
    statusMessage::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    ConversionTaskType(conversionTaskId, state) =  new(conversionTaskId, nothing, state, nothing, nothing)
end
export ConversionTaskType


type VolumeStatusDetailsSetType
    item::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusDetailsSetType() =  new(nothing)
end
export VolumeStatusDetailsSetType


type AttachVpnGatewayResponseType
    requestId::String
    attachment::AttachmentType

    AttachVpnGatewayResponseType(requestId, attachment) =  new(requestId, attachment)
end
export AttachVpnGatewayResponseType


type MonitorInstancesResponseSetItemType
    instanceId::String
    monitoring::InstanceMonitoringStateType

    MonitorInstancesResponseSetItemType(instanceId, monitoring) =  new(instanceId, monitoring)
end
export MonitorInstancesResponseSetItemType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union(String, Nothing)
    privateDnsName::Union(String, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)

    InstancePrivateIpAddressesSetItemType() =  new(nothing, nothing, nothing, nothing)
end
export InstancePrivateIpAddressesSetItemType


type RouteSetType
    item::Union(Array{RouteType,1}, Nothing)

    RouteSetType() =  new(nothing)
end
export RouteSetType


type PrivateIpAddressesSetRequestType
    item::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)

    PrivateIpAddressesSetRequestType() =  new(nothing)
end
export PrivateIpAddressesSetRequestType


type ImportInstanceVolumeDetailSetType
    item::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)

    ImportInstanceVolumeDetailSetType() =  new(nothing)
end
export ImportInstanceVolumeDetailSetType


type DhcpOptionsIdSetType
    item::Union(Array{DhcpOptionsIdSetItemType,1}, Nothing)

    DhcpOptionsIdSetType() =  new(nothing)
end
export DhcpOptionsIdSetType


type DescribeRegionsType
    regionSet::DescribeRegionsSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeRegionsType(regionSet) =  new(regionSet, nothing)
end
export DescribeRegionsType


type BundleInstanceType
    instanceId::String
    storage::BundleInstanceTaskStorageType

    BundleInstanceType(instanceId, storage) =  new(instanceId, storage)
end
export BundleInstanceType


type ImportInstanceResponseType
    requestId::String
    conversionTask::ConversionTaskType

    ImportInstanceResponseType(requestId, conversionTask) =  new(requestId, conversionTask)
end
export ImportInstanceResponseType


type DescribeAddressesResponseType
    requestId::String
    addressesSet::DescribeAddressesResponseInfoType

    DescribeAddressesResponseType(requestId, addressesSet) =  new(requestId, addressesSet)
end
export DescribeAddressesResponseType


type CancelSpotInstanceRequestsResponseSetType
    item::Array{CancelSpotInstanceRequestsResponseSetItemType,1}

    CancelSpotInstanceRequestsResponseSetType(item) =  new(item)
end
export CancelSpotInstanceRequestsResponseSetType


type DhcpValueSetType
    item::Union(Array{DhcpValueType,1}, Nothing)

    DhcpValueSetType() =  new(nothing)
end
export DhcpValueSetType


type CreateVolumePermissionListType
    item::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionListType() =  new(nothing)
end
export CreateVolumePermissionListType


type AccountAttributeNameSetType
    item::Union(Array{AccountAttributeNameSetItemType,1}, Nothing)

    AccountAttributeNameSetType() =  new(nothing)
end
export AccountAttributeNameSetType


type DhcpConfigurationItemType
    key::String
    valueSet::DhcpValueSetType

    DhcpConfigurationItemType(key, valueSet) =  new(key, valueSet)
end
export DhcpConfigurationItemType


type DescribeImagesResponseItemType
    imageId::String
    imageLocation::Union(String, Nothing)
    imageState::String
    imageOwnerId::String
    isPublic::Bool
    productCodes::Union(ProductCodesSetType, Nothing)
    architecture::Union(String, Nothing)
    imageType::Union(String, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    platform::Union(String, Nothing)
    stateReason::Union(StateReasonType, Nothing)
    imageOwnerAlias::Union(String, Nothing)
    name::Union(String, Nothing)
    description::Union(String, Nothing)
    rootDeviceType::Union(String, Nothing)
    rootDeviceName::Union(String, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)
    virtualizationType::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    hypervisor::Union(String, Nothing)

    DescribeImagesResponseItemType(imageId, imageState, imageOwnerId, isPublic) =  new(imageId, nothing, imageState, imageOwnerId, isPublic, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeImagesResponseItemType


type DescribeInstancesType
    instancesSet::DescribeInstancesInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeInstancesType(instancesSet) =  new(instancesSet, nothing)
end
export DescribeInstancesType


type DescribeAvailabilityZonesResponseType
    requestId::String
    availabilityZoneInfo::AvailabilityZoneSetType

    DescribeAvailabilityZonesResponseType(requestId, availabilityZoneInfo) =  new(requestId, availabilityZoneInfo)
end
export DescribeAvailabilityZonesResponseType


type VpcType
    vpcId::String
    state::Union(String, Nothing)
    cidrBlock::Union(String, Nothing)
    dhcpOptionsId::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    instanceTenancy::Union(String, Nothing)
    isDefault::Union(Bool, Nothing)

    VpcType(vpcId) =  new(vpcId, nothing, nothing, nothing, nothing, nothing, nothing)
end
export VpcType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union(DescribeReservedInstancesListingSetType, Nothing)
    reservedInstancesSet::Union(DescribeReservedInstancesSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeReservedInstancesListingsType() =  new(nothing, nothing, nothing)
end
export DescribeReservedInstancesListingsType


type DescribeVolumesSetItemResponseType
    volumeId::String
    size::String
    snapshotId::String
    availabilityZone::String
    status::String
    createTime::XSDateTime
    attachmentSet::AttachmentSetResponseType
    tagSet::Union(ResourceTagSetType, Nothing)
    volumeType::String
    iops::Union(Int32, Nothing)

    DescribeVolumesSetItemResponseType(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, volumeType) =  new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, nothing, volumeType, nothing)
end
export DescribeVolumesSetItemResponseType


type ReportInstanceStatusType
    instancesSet::InstanceIdSetType
    status::String
    startTime::Union(XSDateTime, Nothing)
    endTime::Union(XSDateTime, Nothing)
    reasonCodesSet::ReportInstanceStatusReasonCodesSetType
    description::Union(String, Nothing)

    ReportInstanceStatusType(instancesSet, status, reasonCodesSet) =  new(instancesSet, status, nothing, nothing, reasonCodesSet, nothing)
end
export ReportInstanceStatusType


type IpPermissionType
    ipProtocol::String
    fromPort::Union(Int32, Nothing)
    toPort::Union(Int32, Nothing)
    groups::UserIdGroupPairSetType
    ipRanges::IpRangeSetType

    IpPermissionType(ipProtocol, groups, ipRanges) =  new(ipProtocol, nothing, nothing, groups, ipRanges)
end
export IpPermissionType


type DescribeTagsType
    filterSet::Union(FilterSetType, Nothing)

    DescribeTagsType() =  new(nothing)
end
export DescribeTagsType


type DescribeInternetGatewaysType
    internetGatewayIdSet::InternetGatewayIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeInternetGatewaysType(internetGatewayIdSet) =  new(internetGatewayIdSet, nothing)
end
export DescribeInternetGatewaysType


type DescribeSpotPriceHistoryResponseType
    requestId::String
    spotPriceHistorySet::SpotPriceHistorySetType
    nextToken::Union(String, Nothing)

    DescribeSpotPriceHistoryResponseType(requestId, spotPriceHistorySet) =  new(requestId, spotPriceHistorySet, nothing)
end
export DescribeSpotPriceHistoryResponseType


type CreateVolumePermissionOperationType
    add::Union(CreateVolumePermissionListType, Nothing)
    remove::Union(CreateVolumePermissionListType, Nothing)

    CreateVolumePermissionOperationType() =  new(nothing, nothing)
end
export CreateVolumePermissionOperationType


type SubnetType
    subnetId::String
    state::Union(String, Nothing)
    vpcId::Union(String, Nothing)
    cidrBlock::Union(String, Nothing)
    availableIpAddressCount::Union(Int32, Nothing)
    availabilityZone::Union(String, Nothing)
    defaultForAz::Union(Bool, Nothing)
    mapPublicIpOnLaunch::Union(Bool, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    SubnetType(subnetId) =  new(subnetId, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export SubnetType


type DescribeAccountAttributesResponseType
    requestId::String
    accountAttributeSet::Union(AccountAttributeSetType, Nothing)

    DescribeAccountAttributesResponseType(requestId) =  new(requestId, nothing)
end
export DescribeAccountAttributesResponseType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::SpotInstanceRequestIdSetType

    CancelSpotInstanceRequestsType(spotInstanceRequestIdSet) =  new(spotInstanceRequestIdSet)
end
export CancelSpotInstanceRequestsType


type LicenseSetItemType
    licenseId::String
    _type::String
    pool::String
    capacitySet::LicenseCapacitySetType
    tagSet::Union(ResourceTagSetType, Nothing)

    LicenseSetItemType(licenseId, _type, pool, capacitySet) =  new(licenseId, _type, pool, capacitySet, nothing)
end
export LicenseSetItemType


type DescribeVolumesType
    volumeSet::DescribeVolumesSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeVolumesType(volumeSet) =  new(volumeSet, nothing)
end
export DescribeVolumesType


type DescribeVolumeStatusType
    volumeSet::DescribeVolumesSetType
    filterSet::Union(FilterSetType, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(String, Nothing)

    DescribeVolumeStatusType(volumeSet) =  new(volumeSet, nothing, nothing, nothing)
end
export DescribeVolumeStatusType


type VpcSetType
    item::Union(Array{VpcType,1}, Nothing)

    VpcSetType() =  new(nothing)
end
export VpcSetType


type TerminateInstancesType
    instancesSet::InstanceIdSetType

    TerminateInstancesType(instancesSet) =  new(instancesSet)
end
export TerminateInstancesType


type VpnGatewayType
    vpnGatewayId::String
    state::String
    _type::String
    availabilityZone::Union(String, Nothing)
    attachments::AttachmentSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    VpnGatewayType(vpnGatewayId, state, _type, attachments) =  new(vpnGatewayId, state, _type, nothing, attachments, nothing)
end
export VpnGatewayType


type DescribeAddressesType
    publicIpsSet::DescribeAddressesInfoType
    allocationIdsSet::AllocationIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeAddressesType(publicIpsSet, allocationIdsSet) =  new(publicIpsSet, allocationIdsSet, nothing)
end
export DescribeAddressesType


type DescribeSubnetsType
    subnetSet::Union(SubnetIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSubnetsType() =  new(nothing, nothing)
end
export DescribeSubnetsType


type InstanceStateChangeSetType
    item::Union(Array{InstanceStateChangeType,1}, Nothing)

    InstanceStateChangeSetType() =  new(nothing)
end
export InstanceStateChangeSetType


type DescribeVolumesSetResponseType
    item::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesSetResponseType() =  new(nothing)
end
export DescribeVolumesSetResponseType


type ModifySnapshotAttributeType
    snapshotId::String
    createVolumePermission::CreateVolumePermissionOperationType

    ModifySnapshotAttributeType(snapshotId, createVolumePermission) =  new(snapshotId, createVolumePermission)
end
export ModifySnapshotAttributeType


type DescribeVpcsResponseType
    requestId::String
    vpcSet::VpcSetType

    DescribeVpcsResponseType(requestId, vpcSet) =  new(requestId, vpcSet)
end
export DescribeVpcsResponseType


type DescribeSpotPriceHistoryType
    startTime::Union(XSDateTime, Nothing)
    endTime::Union(XSDateTime, Nothing)
    instanceTypeSet::Union(InstanceTypeSetType, Nothing)
    productDescriptionSet::Union(ProductDescriptionSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)
    availabilityZone::Union(String, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(String, Nothing)

    DescribeSpotPriceHistoryType() =  new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeSpotPriceHistoryType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union(VpnGatewayIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpnGatewaysType() =  new(nothing, nothing)
end
export DescribeVpnGatewaysType


type StopInstancesType
    instancesSet::InstanceIdSetType
    force::Union(Bool, Nothing)

    StopInstancesType(instancesSet) =  new(instancesSet, nothing)
end
export StopInstancesType


type BundleInstanceTasksSetType
    item::Union(Array{BundleInstanceTaskType,1}, Nothing)

    BundleInstanceTasksSetType() =  new(nothing)
end
export BundleInstanceTasksSetType


type DescribeNetworkAclsType
    networkAclIdSet::NetworkAclIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeNetworkAclsType(networkAclIdSet) =  new(networkAclIdSet, nothing)
end
export DescribeNetworkAclsType


type UnassignPrivateIpAddressesType
    networkInterfaceId::String
    privateIpAddressesSet::AssignPrivateIpAddressesSetRequestType

    UnassignPrivateIpAddressesType(networkInterfaceId, privateIpAddressesSet) =  new(networkInterfaceId, privateIpAddressesSet)
end
export UnassignPrivateIpAddressesType


type DescribeReservedInstancesType
    reservedInstancesSet::Union(DescribeReservedInstancesSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)
    offeringType::Union(String, Nothing)

    DescribeReservedInstancesType() =  new(nothing, nothing, nothing)
end
export DescribeReservedInstancesType


type CustomerGatewayType
    customerGatewayId::String
    state::String
    _type::String
    ipAddress::String
    bgpAsn::Union(Int32, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    CustomerGatewayType(customerGatewayId, state, _type, ipAddress) =  new(customerGatewayId, state, _type, ipAddress, nothing, nothing)
end
export CustomerGatewayType


type CreateSubnetResponseType
    requestId::String
    subnet::SubnetType

    CreateSubnetResponseType(requestId, subnet) =  new(requestId, subnet)
end
export CreateSubnetResponseType


type TerminateInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    TerminateInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end
export TerminateInstancesResponseType


type MonitorInstancesType
    instancesSet::MonitorInstancesSetType

    MonitorInstancesType(instancesSet) =  new(instancesSet)
end
export MonitorInstancesType


type DescribeBundleTasksResponseType
    requestId::String
    bundleInstanceTasksSet::BundleInstanceTasksSetType

    DescribeBundleTasksResponseType(requestId, bundleInstanceTasksSet) =  new(requestId, bundleInstanceTasksSet)
end
export DescribeBundleTasksResponseType


type VolumeStatusInfoType
    status::String
    details::VolumeStatusDetailsSetType

    VolumeStatusInfoType(status, details) =  new(status, details)
end
export VolumeStatusInfoType


type StopInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    StopInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end
export StopInstancesResponseType


type DescribeSnapshotsSetItemResponseType
    snapshotId::String
    volumeId::String
    status::String
    startTime::XSDateTime
    progress::String
    ownerId::String
    volumeSize::String
    description::Union(String, Nothing)
    ownerAlias::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    DescribeSnapshotsSetItemResponseType(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize) =  new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, nothing, nothing, nothing)
end
export DescribeSnapshotsSetItemResponseType


type InternetGatewayType
    internetGatewayId::String
    attachmentSet::InternetGatewayAttachmentSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    InternetGatewayType(internetGatewayId, attachmentSet) =  new(internetGatewayId, attachmentSet, nothing)
end
export InternetGatewayType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union(AccountAttributeNameSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeAccountAttributesType() =  new(nothing, nothing)
end
export DescribeAccountAttributesType


type CreateVpcResponseType
    requestId::String
    vpc::VpcType

    CreateVpcResponseType(requestId, vpc) =  new(requestId, vpc)
end
export CreateVpcResponseType


type CustomerGatewaySetType
    item::Union(Array{CustomerGatewayType,1}, Nothing)

    CustomerGatewaySetType() =  new(nothing)
end
export CustomerGatewaySetType


type LaunchPermissionOperationType
    add::Union(LaunchPermissionListType, Nothing)
    remove::Union(LaunchPermissionListType, Nothing)

    LaunchPermissionOperationType() =  new(nothing, nothing)
end
export LaunchPermissionOperationType


type VpnGatewaySetType
    item::Union(Array{VpnGatewayType,1}, Nothing)

    VpnGatewaySetType() =  new(nothing)
end
export VpnGatewaySetType


type DescribePlacementGroupsType
    placementGroupSet::DescribePlacementGroupsInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribePlacementGroupsType(placementGroupSet) =  new(placementGroupSet, nothing)
end
export DescribePlacementGroupsType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union(VpnConnectionIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpnConnectionsType() =  new(nothing, nothing)
end
export DescribeVpnConnectionsType


type RouteTableType
    routeTableId::String
    vpcId::String
    routeSet::RouteSetType
    associationSet::RouteTableAssociationSetType
    propagatingVgwSet::PropagatingVgwSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    RouteTableType(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet) =  new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, nothing)
end
export RouteTableType


type DescribeReservedInstancesOfferingsResponseSetItemType
    reservedInstancesOfferingId::String
    instanceType::String
    availabilityZone::String
    duration::Int64
    fixedPrice::Float64
    usagePrice::Float64
    productDescription::String
    instanceTenancy::String
    currencyCode::String
    offeringType::String
    recurringCharges::RecurringChargesSetType
    marketplace::Union(Bool, Nothing)
    pricingDetailsSet::Union(PricingDetailsSetType, Nothing)

    DescribeReservedInstancesOfferingsResponseSetItemType(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges) =  new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, nothing, nothing)
end
export DescribeReservedInstancesOfferingsResponseSetItemType


type DiskImageSetType
    item::Union(Array{DiskImageType,1}, Nothing)

    DiskImageSetType() =  new(nothing)
end
export DiskImageSetType


type ImportInstanceLaunchSpecificationType
    architecture::String
    groupSet::Union(ImportInstanceGroupSetType, Nothing)
    userData::Union(UserDataType, Nothing)
    instanceType::String
    placement::Union(InstancePlacementType, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(String, Nothing)
    instanceInitiatedShutdownBehavior::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)

    ImportInstanceLaunchSpecificationType(architecture, instanceType) =  new(architecture, nothing, nothing, instanceType, nothing, nothing, nothing, nothing, nothing)
end
export ImportInstanceLaunchSpecificationType


type VpnConnectionType
    vpnConnectionId::String
    state::String
    customerGatewayConfiguration::Union(String, Nothing)
    _type::Union(String, Nothing)
    customerGatewayId::String
    vpnGatewayId::String
    tagSet::Union(ResourceTagSetType, Nothing)
    vgwTelemetry::Union(VgwTelemetryType, Nothing)
    options::Union(VpnConnectionOptionsResponseType, Nothing)
    routes::Union(VpnStaticRoutesSetType, Nothing)

    VpnConnectionType(vpnConnectionId, state, customerGatewayId, vpnGatewayId) =  new(vpnConnectionId, state, nothing, nothing, customerGatewayId, vpnGatewayId, nothing, nothing, nothing, nothing)
end
export VpnConnectionType


type CreateTagsType
    resourcesSet::ResourceIdSetType
    tagSet::ResourceTagSetType

    CreateTagsType(resourcesSet, tagSet) =  new(resourcesSet, tagSet)
end
export CreateTagsType


type ConversionTaskSetType
    item::Union(Array{ConversionTaskType,1}, Nothing)

    ConversionTaskSetType() =  new(nothing)
end
export ConversionTaskSetType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union(DhcpOptionsIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeDhcpOptionsType() =  new(nothing, nothing)
end
export DescribeDhcpOptionsType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::SpotInstanceRequestIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeSpotInstanceRequestsType(spotInstanceRequestIdSet) =  new(spotInstanceRequestIdSet, nothing)
end
export DescribeSpotInstanceRequestsType


type InternetGatewaySetType
    item::Union(Array{InternetGatewayType,1}, Nothing)

    InternetGatewaySetType() =  new(nothing)
end
export InternetGatewaySetType


type DescribeImagesType
    executableBySet::Union(DescribeImagesExecutableBySetType, Nothing)
    imagesSet::DescribeImagesInfoType
    ownersSet::Union(DescribeImagesOwnersType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeImagesType(imagesSet) =  new(nothing, imagesSet, nothing, nothing)
end
export DescribeImagesType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union(CustomerGatewayIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeCustomerGatewaysType() =  new(nothing, nothing)
end
export DescribeCustomerGatewaysType


type InstancePrivateIpAddressesSetType
    item::Union(Array{InstancePrivateIpAddressesSetItemType,1}, Nothing)

    InstancePrivateIpAddressesSetType() =  new(nothing)
end
export InstancePrivateIpAddressesSetType


type DescribeVpcsType
    vpcSet::Union(VpcIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpcsType() =  new(nothing, nothing)
end
export DescribeVpcsType


type DescribeReservedInstancesOfferingsType
    reservedInstancesOfferingsSet::Union(DescribeReservedInstancesOfferingsSetType, Nothing)
    instanceType::Union(String, Nothing)
    availabilityZone::Union(String, Nothing)
    productDescription::Union(String, Nothing)
    filterSet::Union(FilterSetType, Nothing)
    instanceTenancy::Union(String, Nothing)
    offeringType::Union(String, Nothing)
    includeMarketplace::Union(Bool, Nothing)
    minDuration::Union(Int64, Nothing)
    maxDuration::Union(Int64, Nothing)
    maxInstanceCount::Union(Int32, Nothing)
    nextToken::Union(String, Nothing)
    maxResults::Union(Int32, Nothing)

    DescribeReservedInstancesOfferingsType() =  new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeReservedInstancesOfferingsType


type DescribeSnapshotsSetResponseType
    item::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsSetResponseType() =  new(nothing)
end
export DescribeSnapshotsSetResponseType


type DescribeAvailabilityZonesType
    availabilityZoneSet::DescribeAvailabilityZonesSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeAvailabilityZonesType(availabilityZoneSet) =  new(availabilityZoneSet, nothing)
end
export DescribeAvailabilityZonesType


type RegisterImageType
    imageLocation::Union(String, Nothing)
    name::String
    description::Union(String, Nothing)
    architecture::Union(String, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    rootDeviceName::Union(String, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)

    RegisterImageType(name) =  new(nothing, name, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RegisterImageType


type StartInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    StartInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end
export StartInstancesResponseType


type ImportInstanceTaskDetailsType
    volumes::ImportInstanceVolumeDetailSetType
    instanceId::Union(String, Nothing)
    platform::Union(String, Nothing)
    description::Union(String, Nothing)

    ImportInstanceTaskDetailsType(volumes) =  new(volumes, nothing, nothing, nothing)
end
export ImportInstanceTaskDetailsType


type ImportVolumeResponseType
    requestId::String
    conversionTask::ConversionTaskType

    ImportVolumeResponseType(requestId, conversionTask) =  new(requestId, conversionTask)
end
export ImportVolumeResponseType


type MonitorInstancesResponseSetType
    item::Array{MonitorInstancesResponseSetItemType,1}

    MonitorInstancesResponseSetType(item) =  new(item)
end
export MonitorInstancesResponseSetType


type LicenseSetType
    item::Union(Array{LicenseSetItemType,1}, Nothing)

    LicenseSetType() =  new(nothing)
end
export LicenseSetType


type CreateNetworkInterfaceType
    subnetId::String
    description::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)
    groupSet::Union(SecurityGroupIdSetType, Nothing)
    privateIpAddressesSet::Union(PrivateIpAddressesSetRequestType, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    CreateNetworkInterfaceType(subnetId) =  new(subnetId, nothing, nothing, nothing, nothing, nothing)
end
export CreateNetworkInterfaceType


type InstanceNetworkInterfaceSetItemRequestType
    networkInterfaceId::Union(String, Nothing)
    deviceIndex::Int32
    subnetId::Union(String, Nothing)
    description::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)
    groupSet::Union(SecurityGroupIdSetType, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    privateIpAddressesSet::Union(PrivateIpAddressesSetRequestType, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    InstanceNetworkInterfaceSetItemRequestType(deviceIndex) =  new(nothing, deviceIndex, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export InstanceNetworkInterfaceSetItemRequestType


type NetworkInterfacePrivateIpAddressesSetType
    item::Union(Array{NetworkInterfacePrivateIpAddressesSetItemType,1}, Nothing)

    NetworkInterfacePrivateIpAddressesSetType() =  new(nothing)
end
export NetworkInterfacePrivateIpAddressesSetType


type DescribeImagesResponseInfoType
    item::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseInfoType() =  new(nothing)
end
export DescribeImagesResponseInfoType


type CancelSpotInstanceRequestsResponseType
    requestId::String
    spotInstanceRequestSet::CancelSpotInstanceRequestsResponseSetType

    CancelSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end
export CancelSpotInstanceRequestsResponseType


type MonitorInstancesResponseType
    requestId::String
    instancesSet::MonitorInstancesResponseSetType

    MonitorInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end
export MonitorInstancesResponseType


type DescribeConversionTasksType
    conversionTaskIdSet::ConversionTaskIdSetType

    DescribeConversionTasksType(conversionTaskIdSet) =  new(conversionTaskIdSet)
end
export DescribeConversionTasksType


type NetworkAclType
    networkAclId::String
    vpcId::String
    default::Bool
    entrySet::NetworkAclEntrySetType
    associationSet::NetworkAclAssociationSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    NetworkAclType(networkAclId, vpcId, default, entrySet, associationSet) =  new(networkAclId, vpcId, default, entrySet, associationSet, nothing)
end
export NetworkAclType


type RouteTableSetType
    item::Union(Array{RouteTableType,1}, Nothing)

    RouteTableSetType() =  new(nothing)
end
export RouteTableSetType


type CreateVpnGatewayResponseType
    requestId::String
    vpnGateway::VpnGatewayType

    CreateVpnGatewayResponseType(requestId, vpnGateway) =  new(requestId, vpnGateway)
end
export CreateVpnGatewayResponseType


type DeleteTagsType
    resourcesSet::ResourceIdSetType
    tagSet::DeleteTagsSetType

    DeleteTagsType(resourcesSet, tagSet) =  new(resourcesSet, tagSet)
end
export DeleteTagsType


type DhcpConfigurationItemSetType
    item::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    DhcpConfigurationItemSetType() =  new(nothing)
end
export DhcpConfigurationItemSetType


type InstanceStatusType
    status::String
    details::Union(InstanceStatusDetailsSetType, Nothing)

    InstanceStatusType(status) =  new(status, nothing)
end
export InstanceStatusType


type DescribeRouteTablesResponseType
    requestId::String
    routeTableSet::RouteTableSetType

    DescribeRouteTablesResponseType(requestId, routeTableSet) =  new(requestId, routeTableSet)
end
export DescribeRouteTablesResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::String
    privateIpAddressesSet::Union(AssignPrivateIpAddressesSetRequestType, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)
    allowReassignment::Union(Bool, Nothing)

    AssignPrivateIpAddressesType(networkInterfaceId) =  new(networkInterfaceId, nothing, nothing, nothing)
end
export AssignPrivateIpAddressesType


type BundleInstanceResponseType
    requestId::String
    bundleInstanceTask::BundleInstanceTaskType

    BundleInstanceResponseType(requestId, bundleInstanceTask) =  new(requestId, bundleInstanceTask)
end
export BundleInstanceResponseType


type DescribeInternetGatewaysResponseType
    requestId::String
    internetGatewaySet::InternetGatewaySetType

    DescribeInternetGatewaysResponseType(requestId, internetGatewaySet) =  new(requestId, internetGatewaySet)
end
export DescribeInternetGatewaysResponseType


type DescribeTagsResponseType
    requestId::String
    tagSet::TagSetType

    DescribeTagsResponseType(requestId, tagSet) =  new(requestId, tagSet)
end
export DescribeTagsResponseType


type SubnetSetType
    item::Union(Array{SubnetType,1}, Nothing)

    SubnetSetType() =  new(nothing)
end
export SubnetSetType


type DescribeInstanceStatusType
    instancesSet::InstanceIdSetType
    filterSet::Union(FilterSetType, Nothing)
    nextToken::Union(String, Nothing)
    maxResults::Union(Int32, Nothing)
    includeAllInstances::Union(Bool, Nothing)

    DescribeInstanceStatusType(instancesSet) =  new(instancesSet, nothing, nothing, nothing, nothing)
end
export DescribeInstanceStatusType


type DescribeKeyPairsType
    keySet::DescribeKeyPairsInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeKeyPairsType(keySet) =  new(keySet, nothing)
end
export DescribeKeyPairsType


type VpnConnectionSetType
    item::Union(Array{VpnConnectionType,1}, Nothing)

    VpnConnectionSetType() =  new(nothing)
end
export VpnConnectionSetType


type DescribeSubnetsResponseType
    requestId::String
    subnetSet::SubnetSetType

    DescribeSubnetsResponseType(requestId, subnetSet) =  new(requestId, subnetSet)
end
export DescribeSubnetsResponseType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union(NetworkInterfaceIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeNetworkInterfacesType() =  new(nothing, nothing)
end
export DescribeNetworkInterfacesType


type IpPermissionSetType
    item::Union(Array{IpPermissionType,1}, Nothing)

    IpPermissionSetType() =  new(nothing)
end
export IpPermissionSetType


type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::String
    reservedInstancesId::String
    createDate::XSDateTime
    updateDate::XSDateTime
    status::String
    statusMessage::String
    instanceCounts::InstanceCountsSetType
    priceSchedules::PriceScheduleSetType
    tagSet::Union(ResourceTagSetType, Nothing)
    clientToken::Union(String, Nothing)

    DescribeReservedInstancesListingsResponseSetItemType(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules) =  new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, nothing, nothing)
end
export DescribeReservedInstancesListingsResponseSetItemType


type DescribeLicensesType
    licenseIdSet::Union(LicenseIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeLicensesType() =  new(nothing, nothing)
end
export DescribeLicensesType


type DescribeSnapshotsType
    snapshotSet::DescribeSnapshotsSetType
    ownersSet::Union(DescribeSnapshotsOwnersType, Nothing)
    restorableBySet::Union(DescribeSnapshotsRestorableBySetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSnapshotsType(snapshotSet) =  new(snapshotSet, nothing, nothing, nothing)
end
export DescribeSnapshotsType


type CreateRouteTableResponseType
    requestId::String
    routeTable::RouteTableType

    CreateRouteTableResponseType(requestId, routeTable) =  new(requestId, routeTable)
end
export CreateRouteTableResponseType


type DescribeExportTasksType
    exportTaskIdSet::ExportTaskIdSetType

    DescribeExportTasksType(exportTaskIdSet) =  new(exportTaskIdSet)
end
export DescribeExportTasksType


type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::String
    instanceType::String
    availabilityZone::String
    start::XSDateTime
    duration::Int64
    fixedPrice::Float64
    usagePrice::Float64
    instanceCount::Int
    productDescription::String
    state::String
    tagSet::Union(ResourceTagSetType, Nothing)
    instanceTenancy::String
    currencyCode::String
    offeringType::String
    recurringCharges::Union(RecurringChargesSetType, Nothing)

    DescribeReservedInstancesResponseSetItemType(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, instanceTenancy, currencyCode, offeringType) =  new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, nothing, instanceTenancy, currencyCode, offeringType, nothing)
end
export DescribeReservedInstancesResponseSetItemType


type InstanceNetworkInterfaceSetItemType
    networkInterfaceId::String
    subnetId::Union(String, Nothing)
    vpcId::Union(String, Nothing)
    description::Union(String, Nothing)
    ownerId::String
    status::String
    macAddress::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)
    privateDnsName::Union(String, Nothing)
    sourceDestCheck::Union(Bool, Nothing)
    groupSet::Union(GroupSetType, Nothing)
    attachment::InstanceNetworkInterfaceAttachmentType
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)
    privateIpAddressesSet::Union(InstancePrivateIpAddressesSetType, Nothing)

    InstanceNetworkInterfaceSetItemType(networkInterfaceId, ownerId, status, attachment) =  new(networkInterfaceId, nothing, nothing, nothing, ownerId, status, nothing, nothing, nothing, nothing, nothing, attachment, nothing, nothing)
end
export InstanceNetworkInterfaceSetItemType


type DescribeConversionTasksResponseType
    requestId::String
    conversionTasks::ConversionTaskSetType

    DescribeConversionTasksResponseType(requestId, conversionTasks) =  new(requestId, conversionTasks)
end
export DescribeConversionTasksResponseType


type DescribeCustomerGatewaysResponseType
    requestId::String
    customerGatewaySet::CustomerGatewaySetType

    DescribeCustomerGatewaysResponseType(requestId, customerGatewaySet) =  new(requestId, customerGatewaySet)
end
export DescribeCustomerGatewaysResponseType


type InstanceStatusItemType
    instanceId::String
    availabilityZone::String
    eventsSet::Union(InstanceStatusEventsSetType, Nothing)
    instanceState::InstanceStateType
    systemStatus::InstanceStatusType
    instanceStatus::InstanceStatusType

    InstanceStatusItemType(instanceId, availabilityZone, instanceState, systemStatus, instanceStatus) =  new(instanceId, availabilityZone, nothing, instanceState, systemStatus, instanceStatus)
end
export InstanceStatusItemType


type DescribeReservedInstancesResponseSetType
    item::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseSetType() =  new(nothing)
end
export DescribeReservedInstancesResponseSetType


type DescribeVpnConnectionsResponseType
    requestId::String
    vpnConnectionSet::VpnConnectionSetType

    DescribeVpnConnectionsResponseType(requestId, vpnConnectionSet) =  new(requestId, vpnConnectionSet)
end
export DescribeVpnConnectionsResponseType


type CreateNetworkAclResponseType
    requestId::String
    networkAcl::NetworkAclType

    CreateNetworkAclResponseType(requestId, networkAcl) =  new(requestId, networkAcl)
end
export CreateNetworkAclResponseType


type VolumeStatusItemType
    volumeId::String
    availabilityZone::String
    volumeStatus::VolumeStatusInfoType
    eventsSet::VolumeStatusEventsSetType
    actionsSet::VolumeStatusActionsSetType

    VolumeStatusItemType(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet) =  new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end
export VolumeStatusItemType


type VolumeStatusSetType
    item::Union(Array{VolumeStatusItemType,1}, Nothing)

    VolumeStatusSetType() =  new(nothing)
end
export VolumeStatusSetType


type DescribeLicensesResponseType
    requestId::String
    licenseSet::LicenseSetType

    DescribeLicensesResponseType(requestId, licenseSet) =  new(requestId, licenseSet)
end
export DescribeLicensesResponseType


type ImportInstanceType
    description::Union(String, Nothing)
    launchSpecification::ImportInstanceLaunchSpecificationType
    diskImageSet::DiskImageSetType
    keepPartialImports::Union(Bool, Nothing)
    platform::String

    ImportInstanceType(launchSpecification, diskImageSet, platform) =  new(nothing, launchSpecification, diskImageSet, nothing, platform)
end
export ImportInstanceType


type DescribeVolumesResponseType
    requestId::String
    volumeSet::DescribeVolumesSetResponseType

    DescribeVolumesResponseType(requestId, volumeSet) =  new(requestId, volumeSet)
end
export DescribeVolumesResponseType


type CreateDhcpOptionsType
    dhcpConfigurationSet::DhcpConfigurationItemSetType

    CreateDhcpOptionsType(dhcpConfigurationSet) =  new(dhcpConfigurationSet)
end
export CreateDhcpOptionsType


type CreateCustomerGatewayResponseType
    requestId::String
    customerGateway::CustomerGatewayType

    CreateCustomerGatewayResponseType(requestId, customerGateway) =  new(requestId, customerGateway)
end
export CreateCustomerGatewayResponseType


type DescribeReservedInstancesListingsResponseSetType
    item::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseSetType() =  new(nothing)
end
export DescribeReservedInstancesListingsResponseSetType


type DescribeReservedInstancesOfferingsResponseSetType
    item::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetType() =  new(nothing)
end
export DescribeReservedInstancesOfferingsResponseSetType


type DescribeSnapshotsResponseType
    requestId::String
    snapshotSet::DescribeSnapshotsSetResponseType

    DescribeSnapshotsResponseType(requestId, snapshotSet) =  new(requestId, snapshotSet)
end
export DescribeSnapshotsResponseType


type CreateInternetGatewayResponseType
    requestId::String
    internetGateway::InternetGatewayType

    CreateInternetGatewayResponseType(requestId, internetGateway) =  new(requestId, internetGateway)
end
export CreateInternetGatewayResponseType


type RevokeSecurityGroupEgressType
    groupId::String
    ipPermissions::IpPermissionSetType

    RevokeSecurityGroupEgressType(groupId, ipPermissions) =  new(groupId, ipPermissions)
end
export RevokeSecurityGroupEgressType


type CreateVpnConnectionResponseType
    requestId::String
    vpnConnection::VpnConnectionType

    CreateVpnConnectionResponseType(requestId, vpnConnection) =  new(requestId, vpnConnection)
end
export CreateVpnConnectionResponseType


type CancelReservedInstancesListingResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    CancelReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end
export CancelReservedInstancesListingResponseType


type DhcpOptionsType
    dhcpOptionsId::String
    dhcpConfigurationSet::DhcpConfigurationItemSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    DhcpOptionsType(dhcpOptionsId, dhcpConfigurationSet) =  new(dhcpOptionsId, dhcpConfigurationSet, nothing)
end
export DhcpOptionsType


type DescribeVpnGatewaysResponseType
    requestId::String
    vpnGatewaySet::VpnGatewaySetType

    DescribeVpnGatewaysResponseType(requestId, vpnGatewaySet) =  new(requestId, vpnGatewaySet)
end
export DescribeVpnGatewaysResponseType


type NetworkInterfaceType
    networkInterfaceId::String
    subnetId::Union(String, Nothing)
    vpcId::Union(String, Nothing)
    availabilityZone::Union(String, Nothing)
    description::Union(String, Nothing)
    ownerId::String
    requesterId::Union(String, Nothing)
    requesterManaged::Union(Bool, Nothing)
    status::String
    macAddress::String
    privateIpAddress::String
    privateDnsName::Union(String, Nothing)
    sourceDestCheck::Bool
    groupSet::GroupSetType
    attachment::Union(NetworkInterfaceAttachmentType, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    privateIpAddressesSet::Union(NetworkInterfacePrivateIpAddressesSetType, Nothing)

    NetworkInterfaceType(networkInterfaceId, ownerId, status, macAddress, privateIpAddress, sourceDestCheck, groupSet) =  new(networkInterfaceId, nothing, nothing, nothing, nothing, ownerId, nothing, nothing, status, macAddress, privateIpAddress, nothing, sourceDestCheck, groupSet, nothing, nothing, nothing, nothing)
end
export NetworkInterfaceType


type InstanceNetworkInterfaceSetRequestType
    item::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)

    InstanceNetworkInterfaceSetRequestType() =  new(nothing)
end
export InstanceNetworkInterfaceSetRequestType


type DescribeReservedInstancesListingsResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    DescribeReservedInstancesListingsResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end
export DescribeReservedInstancesListingsResponseType


type NetworkAclSetType
    item::Union(Array{NetworkAclType,1}, Nothing)

    NetworkAclSetType() =  new(nothing)
end
export NetworkAclSetType


type DescribeNetworkAclsResponseType
    requestId::String
    networkAclSet::NetworkAclSetType

    DescribeNetworkAclsResponseType(requestId, networkAclSet) =  new(requestId, networkAclSet)
end
export DescribeNetworkAclsResponseType


type DescribeVolumeStatusResponseType
    requestId::String
    volumeStatusSet::VolumeStatusSetType
    nextToken::Union(String, Nothing)

    DescribeVolumeStatusResponseType(requestId, volumeStatusSet) =  new(requestId, volumeStatusSet, nothing)
end
export DescribeVolumeStatusResponseType


type DescribeImagesResponseType
    requestId::String
    imagesSet::DescribeImagesResponseInfoType

    DescribeImagesResponseType(requestId, imagesSet) =  new(requestId, imagesSet)
end
export DescribeImagesResponseType


type AuthorizeSecurityGroupIngressType
    userId::Union(String, Nothing)
    ipPermissions::IpPermissionSetType

    AuthorizeSecurityGroupIngressType(ipPermissions) =  new(nothing, ipPermissions)
end
export AuthorizeSecurityGroupIngressType


type InstanceStatusSetType
    item::Union(Array{InstanceStatusItemType,1}, Nothing)

    InstanceStatusSetType() =  new(nothing)
end
export InstanceStatusSetType


type SecurityGroupItemType
    ownerId::String
    groupId::String
    groupName::String
    groupDescription::String
    vpcId::Union(String, Nothing)
    ipPermissions::IpPermissionSetType
    ipPermissionsEgress::Union(IpPermissionSetType, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    SecurityGroupItemType(ownerId, groupId, groupName, groupDescription, ipPermissions) =  new(ownerId, groupId, groupName, groupDescription, nothing, ipPermissions, nothing, nothing)
end
export SecurityGroupItemType


type DescribeReservedInstancesResponseType
    requestId::String
    reservedInstancesSet::DescribeReservedInstancesResponseSetType

    DescribeReservedInstancesResponseType(requestId, reservedInstancesSet) =  new(requestId, reservedInstancesSet)
end
export DescribeReservedInstancesResponseType


type DhcpOptionsSetType
    item::Union(Array{DhcpOptionsType,1}, Nothing)

    DhcpOptionsSetType() =  new(nothing)
end
export DhcpOptionsSetType


type CreateReservedInstancesListingResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    CreateReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end
export CreateReservedInstancesListingResponseType


type AuthorizeSecurityGroupEgressType
    groupId::String
    ipPermissions::IpPermissionSetType

    AuthorizeSecurityGroupEgressType(groupId, ipPermissions) =  new(groupId, ipPermissions)
end
export AuthorizeSecurityGroupEgressType


type DescribeReservedInstancesOfferingsResponseType
    requestId::String
    reservedInstancesOfferingsSet::DescribeReservedInstancesOfferingsResponseSetType
    nextToken::Union(String, Nothing)

    DescribeReservedInstancesOfferingsResponseType(requestId, reservedInstancesOfferingsSet) =  new(requestId, reservedInstancesOfferingsSet, nothing)
end
export DescribeReservedInstancesOfferingsResponseType


type RevokeSecurityGroupIngressType
    userId::Union(String, Nothing)
    ipPermissions::IpPermissionSetType

    RevokeSecurityGroupIngressType(ipPermissions) =  new(nothing, ipPermissions)
end
export RevokeSecurityGroupIngressType


type InstanceNetworkInterfaceSetType
    item::Union(Array{InstanceNetworkInterfaceSetItemType,1}, Nothing)

    InstanceNetworkInterfaceSetType() =  new(nothing)
end
export InstanceNetworkInterfaceSetType


type LaunchSpecificationResponseType
    imageId::String
    keyName::Union(String, Nothing)
    groupSet::GroupSetType
    addressingType::Union(String, Nothing)
    instanceType::String
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(String, Nothing)
    networkInterfaceSet::Union(InstanceNetworkInterfaceSetRequestType, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationResponseType(imageId, groupSet, instanceType) =  new(imageId, nothing, groupSet, nothing, instanceType, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export LaunchSpecificationResponseType


type RunInstancesType
    imageId::String
    minCount::Int32
    maxCount::Int32
    keyName::Union(String, Nothing)
    groupSet::GroupSetType
    additionalInfo::Union(String, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(String, Nothing)
    instanceType::String
    placement::Union(PlacementRequestType, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(String, Nothing)
    disableApiTermination::Union(Bool, Nothing)
    instanceInitiatedShutdownBehavior::Union(String, Nothing)
    license::Union(InstanceLicenseRequestType, Nothing)
    privateIpAddress::Union(String, Nothing)
    clientToken::Union(String, Nothing)
    networkInterfaceSet::Union(InstanceNetworkInterfaceSetRequestType, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunInstancesType(imageId, minCount, maxCount, groupSet, instanceType) =  new(imageId, minCount, maxCount, nothing, groupSet, nothing, nothing, nothing, instanceType, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RunInstancesType


type LaunchSpecificationRequestType
    imageId::String
    keyName::Union(String, Nothing)
    groupSet::GroupSetType
    userData::Union(UserDataType, Nothing)
    addressingType::Union(String, Nothing)
    instanceType::String
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(String, Nothing)
    networkInterfaceSet::Union(InstanceNetworkInterfaceSetRequestType, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationRequestType(imageId, groupSet, instanceType) =  new(imageId, nothing, groupSet, nothing, nothing, instanceType, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export LaunchSpecificationRequestType


type RunningInstancesItemType
    instanceId::String
    imageId::Union(String, Nothing)
    instanceState::InstanceStateType
    privateDnsName::String
    dnsName::Union(String, Nothing)
    reason::Union(String, Nothing)
    keyName::Union(String, Nothing)
    amiLaunchIndex::Union(String, Nothing)
    productCodes::Union(ProductCodesSetType, Nothing)
    instanceType::String
    launchTime::XSDateTime
    placement::Union(PlacementResponseType, Nothing)
    kernelId::Union(String, Nothing)
    ramdiskId::Union(String, Nothing)
    platform::Union(String, Nothing)
    monitoring::Union(InstanceMonitoringStateType, Nothing)
    subnetId::Union(String, Nothing)
    vpcId::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)
    ipAddress::Union(String, Nothing)
    sourceDestCheck::Union(Bool, Nothing)
    groupSet::GroupSetType
    stateReason::Union(StateReasonType, Nothing)
    architecture::Union(String, Nothing)
    rootDeviceType::Union(String, Nothing)
    rootDeviceName::Union(String, Nothing)
    blockDeviceMapping::Union(InstanceBlockDeviceMappingResponseType, Nothing)
    instanceLifecycle::Union(String, Nothing)
    spotInstanceRequestId::Union(String, Nothing)
    license::Union(InstanceLicenseResponseType, Nothing)
    virtualizationType::Union(String, Nothing)
    clientToken::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    hypervisor::Union(String, Nothing)
    networkInterfaceSet::Union(InstanceNetworkInterfaceSetType, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileResponseType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunningInstancesItemType(instanceId, instanceState, privateDnsName, instanceType, launchTime, groupSet) =  new(instanceId, nothing, instanceState, privateDnsName, nothing, nothing, nothing, nothing, nothing, instanceType, launchTime, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, groupSet, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RunningInstancesItemType


type CreateDhcpOptionsResponseType
    requestId::String
    dhcpOptions::DhcpOptionsType

    CreateDhcpOptionsResponseType(requestId, dhcpOptions) =  new(requestId, dhcpOptions)
end
export CreateDhcpOptionsResponseType


type NetworkInterfaceSetType
    item::Union(Array{NetworkInterfaceType,1}, Nothing)

    NetworkInterfaceSetType() =  new(nothing)
end
export NetworkInterfaceSetType


type CreateNetworkInterfaceResponseType
    requestId::String
    networkInterface::NetworkInterfaceType

    CreateNetworkInterfaceResponseType(requestId, networkInterface) =  new(requestId, networkInterface)
end
export CreateNetworkInterfaceResponseType


type DescribeNetworkInterfacesResponseType
    requestId::String
    networkInterfaceSet::NetworkInterfaceSetType

    DescribeNetworkInterfacesResponseType(requestId, networkInterfaceSet) =  new(requestId, networkInterfaceSet)
end
export DescribeNetworkInterfacesResponseType


type SecurityGroupSetType
    item::Union(Array{SecurityGroupItemType,1}, Nothing)

    SecurityGroupSetType() =  new(nothing)
end
export SecurityGroupSetType


type RequestSpotInstancesType
    spotPrice::String
    instanceCount::Union(Int, Nothing)
    _type::Union(String, Nothing)
    validFrom::Union(XSDateTime, Nothing)
    validUntil::Union(XSDateTime, Nothing)
    launchGroup::Union(String, Nothing)
    availabilityZoneGroup::Union(String, Nothing)
    launchSpecification::LaunchSpecificationRequestType

    RequestSpotInstancesType(spotPrice, launchSpecification) =  new(spotPrice, nothing, nothing, nothing, nothing, nothing, nothing, launchSpecification)
end
export RequestSpotInstancesType


type DescribeInstanceStatusResponseType
    requestId::String
    instanceStatusSet::InstanceStatusSetType
    nextToken::Union(String, Nothing)

    DescribeInstanceStatusResponseType(requestId, instanceStatusSet) =  new(requestId, instanceStatusSet, nothing)
end
export DescribeInstanceStatusResponseType


type DescribeDhcpOptionsResponseType
    requestId::String
    dhcpOptionsSet::DhcpOptionsSetType

    DescribeDhcpOptionsResponseType(requestId, dhcpOptionsSet) =  new(requestId, dhcpOptionsSet)
end
export DescribeDhcpOptionsResponseType


type SpotInstanceRequestSetItemType
    spotInstanceRequestId::String
    spotPrice::String
    _type::String
    state::String
    fault::Union(SpotInstanceStateFaultType, Nothing)
    status::Union(SpotInstanceStatusMessageType, Nothing)
    validFrom::Union(XSDateTime, Nothing)
    validUntil::Union(XSDateTime, Nothing)
    launchGroup::Union(String, Nothing)
    availabilityZoneGroup::Union(String, Nothing)
    launchSpecification::Union(LaunchSpecificationResponseType, Nothing)
    instanceId::Union(String, Nothing)
    createTime::Union(XSDateTime, Nothing)
    productDescription::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    launchedAvailabilityZone::Union(String, Nothing)

    SpotInstanceRequestSetItemType(spotInstanceRequestId, spotPrice, _type, state) =  new(spotInstanceRequestId, spotPrice, _type, state, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export SpotInstanceRequestSetItemType


type RunningInstancesSetType
    item::Array{RunningInstancesItemType,1}

    RunningInstancesSetType(item) =  new(item)
end
export RunningInstancesSetType


type ReservationInfoType
    reservationId::String
    ownerId::String
    groupSet::GroupSetType
    instancesSet::RunningInstancesSetType
    requesterId::Union(String, Nothing)

    ReservationInfoType(reservationId, ownerId, groupSet, instancesSet) =  new(reservationId, ownerId, groupSet, instancesSet, nothing)
end
export ReservationInfoType


type RunInstancesResponseType
    requestId::String
    reservationId::String
    ownerId::String
    groupSet::GroupSetType
    instancesSet::RunningInstancesSetType
    requesterId::Union(String, Nothing)

    RunInstancesResponseType(requestId, reservationId, ownerId, groupSet, instancesSet) =  new(requestId, reservationId, ownerId, groupSet, instancesSet, nothing)
end
export RunInstancesResponseType


type ReservationSetType
    item::Union(Array{ReservationInfoType,1}, Nothing)

    ReservationSetType() =  new(nothing)
end
export ReservationSetType


type SpotInstanceRequestSetType
    item::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    SpotInstanceRequestSetType() =  new(nothing)
end
export SpotInstanceRequestSetType


type DescribeSpotInstanceRequestsResponseType
    requestId::String
    spotInstanceRequestSet::SpotInstanceRequestSetType

    DescribeSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end
export DescribeSpotInstanceRequestsResponseType


type DescribeSecurityGroupsResponseType
    requestId::String
    securityGroupInfo::SecurityGroupSetType

    DescribeSecurityGroupsResponseType(requestId, securityGroupInfo) =  new(requestId, securityGroupInfo)
end
export DescribeSecurityGroupsResponseType


type DescribeInstancesResponseType
    requestId::String
    reservationSet::ReservationSetType

    DescribeInstancesResponseType(requestId, reservationSet) =  new(requestId, reservationSet)
end
export DescribeInstancesResponseType


type RequestSpotInstancesResponseType
    requestId::String
    spotInstanceRequestSet::SpotInstanceRequestSetType

    RequestSpotInstancesResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end
export RequestSpotInstancesResponseType


