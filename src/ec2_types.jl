type CreateImageResponseType
    requestId::String
    imageId::String

    CreateImageResponseType(requestId, imageId) =  new(requestId, imageId)
end

type RegisterImageResponseType
    requestId::String
    imageId::String

    RegisterImageResponseType(requestId, imageId) =  new(requestId, imageId)
end

type DeregisterImageType
    imageId::String

    DeregisterImageType(imageId) =  new(imageId)
end

type DeregisterImageResponseType
    requestId::String
    return::Bool

    DeregisterImageResponseType(requestId, return) =  new(requestId, return)
end

type CreateKeyPairType
    keyName::String

    CreateKeyPairType(keyName) =  new(keyName)
end

type CreateKeyPairResponseType
    requestId::String
    keyName::String
    keyFingerprint::String
    keyMaterial::String

    CreateKeyPairResponseType(requestId, keyName, keyFingerprint, keyMaterial) =  new(requestId, keyName, keyFingerprint, keyMaterial)
end

type ImportKeyPairType
    keyName::String
    publicKeyMaterial::String

    ImportKeyPairType(keyName, publicKeyMaterial) =  new(keyName, publicKeyMaterial)
end

type ImportKeyPairResponseType
    requestId::String
    keyName::String
    keyFingerprint::String

    ImportKeyPairResponseType(requestId, keyName, keyFingerprint) =  new(requestId, keyName, keyFingerprint)
end

type DeleteKeyPairType
    keyName::String

    DeleteKeyPairType(keyName) =  new(keyName)
end

type DeleteKeyPairResponseType
    requestId::String
    return::Bool

    DeleteKeyPairResponseType(requestId, return) =  new(requestId, return)
end

type DescribeKeyPairsItemType
    keyName::String

    DescribeKeyPairsItemType(keyName) =  new(keyName)
end

type DescribeKeyPairsResponseItemType
    keyName::String
    keyFingerprint::String

    DescribeKeyPairsResponseItemType(keyName, keyFingerprint) =  new(keyName, keyFingerprint)
end

type IamInstanceProfileRequestType
    arn::Union(String, Nothing)
    name::Union(String, Nothing)

    IamInstanceProfileRequestType() =  new(nothing, nothing)
end

type PrivateIpAddressesSetItemRequestType
    privateIpAddress::String
    primary::Union(Bool, Nothing)

    PrivateIpAddressesSetItemRequestType(privateIpAddress) =  new(privateIpAddress, nothing)
end

type ImportInstanceGroupItemType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    ImportInstanceGroupItemType() =  new(nothing, nothing)
end

type GroupItemType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    GroupItemType() =  new(nothing, nothing)
end

type UserDataType
    data::Union(String, Nothing)

    UserDataType() =  new(nothing)
end

type BlockDeviceMappingItemType
    deviceName::String

    BlockDeviceMappingItemType(deviceName) =  new(deviceName)
end

type EbsBlockDeviceType
    snapshotId::Union(String, Nothing)
    volumeSize::Union(Int32, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    volumeType::Union(String, Nothing)
    iops::Union(Int32, Nothing)

    EbsBlockDeviceType() =  new(nothing, nothing, nothing, nothing, nothing)
end

type PlacementRequestType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)
    tenancy::Union(String, Nothing)

    PlacementRequestType() =  new(nothing, nothing, nothing)
end

type SpotPlacementRequestType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)

    SpotPlacementRequestType() =  new(nothing, nothing)
end

type InstancePlacementType
    availabilityZone::Union(String, Nothing)
    groupName::Union(String, Nothing)

    InstancePlacementType() =  new(nothing, nothing)
end

type MonitoringInstanceType
    enabled::Union(Bool, Nothing)

    MonitoringInstanceType() =  new(nothing)
end

type InstanceLicenseRequestType
    pool::String

    InstanceLicenseRequestType(pool) =  new(pool)
end

type IamInstanceProfileResponseType
    arn::String
    id::String

    IamInstanceProfileResponseType(arn, id) =  new(arn, id)
end

type InstanceNetworkInterfaceAttachmentType
    attachmentId::String
    deviceIndex::Int32
    status::String
    attachTime::DateTime
    deleteOnTermination::Bool

    InstanceNetworkInterfaceAttachmentType(attachmentId, deviceIndex, status, attachTime, deleteOnTermination) =  new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end

type InstanceNetworkInterfaceAssociationType
    publicIp::String
    publicDnsName::Union(String, Nothing)
    ipOwnerId::Union(String, Nothing)

    InstanceNetworkInterfaceAssociationType(publicIp) =  new(publicIp, nothing, nothing)
end

type PlacementResponseType
    availabilityZone::String
    groupName::Union(String, Nothing)
    tenancy::Union(String, Nothing)

    PlacementResponseType(availabilityZone) =  new(availabilityZone, nothing, nothing)
end

type StateReasonType
    code::String
    message::String

    StateReasonType(code, message) =  new(code, message)
end

type InstanceBlockDeviceMappingResponseItemType
    deviceName::String

    InstanceBlockDeviceMappingResponseItemType(deviceName) =  new(deviceName)
end

type EbsInstanceBlockDeviceMappingResponseType
    volumeId::String
    status::String
    attachTime::DateTime
    deleteOnTermination::Union(Bool, Nothing)

    EbsInstanceBlockDeviceMappingResponseType(volumeId, status, attachTime) =  new(volumeId, status, attachTime, nothing)
end

type InstanceLicenseResponseType
    pool::String

    InstanceLicenseResponseType(pool) =  new(pool)
end

type AccountAttributeNameSetItemType
    attributeName::String

    AccountAttributeNameSetItemType(attributeName) =  new(attributeName)
end

type AccountAttributeValueSetItemType
    attributeValue::String

    AccountAttributeValueSetItemType(attributeValue) =  new(attributeValue)
end

type DescribeVpcAttributeType
    vpcId::String

    DescribeVpcAttributeType(vpcId) =  new(vpcId)
end

type DescribeVpcAttributeResponseType
    requestId::String
    vpcId::String

    DescribeVpcAttributeResponseType(requestId, vpcId) =  new(requestId, vpcId)
end

type ModifyVpcAttributeType
    vpcId::String

    ModifyVpcAttributeType(vpcId) =  new(vpcId)
end

type ModifyVpcAttributeResponseType
    requestId::String
    return::Bool

    ModifyVpcAttributeResponseType(requestId, return) =  new(requestId, return)
end

type GetConsoleOutputType
    instanceId::String

    GetConsoleOutputType(instanceId) =  new(instanceId)
end

type GetConsoleOutputResponseType
    requestId::String
    instanceId::String
    timestamp::DateTime
    output::String

    GetConsoleOutputResponseType(requestId, instanceId, timestamp, output) =  new(requestId, instanceId, timestamp, output)
end

type GetPasswordDataType
    instanceId::String

    GetPasswordDataType(instanceId) =  new(instanceId)
end

type GetPasswordDataResponseType
    requestId::String
    instanceId::String
    timestamp::DateTime
    passwordData::String

    GetPasswordDataResponseType(requestId, instanceId, timestamp, passwordData) =  new(requestId, instanceId, timestamp, passwordData)
end

type InstanceIdType
    instanceId::String

    InstanceIdType(instanceId) =  new(instanceId)
end

type InstanceBlockDeviceMappingItemType
    deviceName::String

    InstanceBlockDeviceMappingItemType(deviceName) =  new(deviceName)
end

type InstanceEbsBlockDeviceType
    volumeId::String
    deleteOnTermination::Union(Bool, Nothing)

    InstanceEbsBlockDeviceType(volumeId) =  new(volumeId, nothing)
end

type RebootInstancesItemType
    instanceId::String

    RebootInstancesItemType(instanceId) =  new(instanceId)
end

type RebootInstancesResponseType
    requestId::String
    return::Bool

    RebootInstancesResponseType(requestId, return) =  new(requestId, return)
end

type DescribeInstancesItemType
    instanceId::String

    DescribeInstancesItemType(instanceId) =  new(instanceId)
end

type UnavailableResultType
    availabilityZone::String

    UnavailableResultType(availabilityZone) =  new(availabilityZone)
end

type DescribeImagesItemType
    imageId::String

    DescribeImagesItemType(imageId) =  new(imageId)
end

type DescribeImagesOwnerType
    owner::String

    DescribeImagesOwnerType(owner) =  new(owner)
end

type DescribeImagesExecutableByType
    user::String

    DescribeImagesExecutableByType(user) =  new(user)
end

type CreateSecurityGroupType
    groupName::String
    groupDescription::String
    vpcId::Union(String, Nothing)

    CreateSecurityGroupType(groupName, groupDescription) =  new(groupName, groupDescription, nothing)
end

type CreateSecurityGroupResponseType
    requestId::String
    return::Bool
    groupId::String

    CreateSecurityGroupResponseType(requestId, return, groupId) =  new(requestId, return, groupId)
end

type DeleteSecurityGroupType
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    DeleteSecurityGroupType() =  new(nothing, nothing)
end

type DeleteSecurityGroupResponseType
    requestId::String
    return::Bool

    DeleteSecurityGroupResponseType(requestId, return) =  new(requestId, return)
end

type DescribeSecurityGroupsSetItemType
    groupName::String

    DescribeSecurityGroupsSetItemType(groupName) =  new(groupName)
end

type DescribeSecurityGroupsIdSetItemType
    groupId::String

    DescribeSecurityGroupsIdSetItemType(groupId) =  new(groupId)
end

type IpRangeItemType
    cidrIp::String

    IpRangeItemType(cidrIp) =  new(cidrIp)
end

type UserIdGroupPairType
    userId::Union(String, Nothing)
    groupId::Union(String, Nothing)
    groupName::Union(String, Nothing)

    UserIdGroupPairType() =  new(nothing, nothing, nothing)
end

type AuthorizeSecurityGroupIngressResponseType
    requestId::String
    return::Bool

    AuthorizeSecurityGroupIngressResponseType(requestId, return) =  new(requestId, return)
end

type RevokeSecurityGroupIngressResponseType
    requestId::String
    return::Bool

    RevokeSecurityGroupIngressResponseType(requestId, return) =  new(requestId, return)
end

type AuthorizeSecurityGroupEgressResponseType
    requestId::String
    return::Bool

    AuthorizeSecurityGroupEgressResponseType(requestId, return) =  new(requestId, return)
end

type RevokeSecurityGroupEgressResponseType
    requestId::String
    return::Bool

    RevokeSecurityGroupEgressResponseType(requestId, return) =  new(requestId, return)
end

type InstanceStateType
    code::Int32
    name::String

    InstanceStateType(code, name) =  new(code, name)
end

type ModifyInstanceAttributeType
    instanceId::String

    ModifyInstanceAttributeType(instanceId) =  new(instanceId)
end

type SecurityGroupIdSetItemType
    groupId::String

    SecurityGroupIdSetItemType(groupId) =  new(groupId)
end

type ModifyInstanceAttributeResponseType
    requestId::String
    return::Bool

    ModifyInstanceAttributeResponseType(requestId, return) =  new(requestId, return)
end

type ResetInstanceAttributeType
    instanceId::String

    ResetInstanceAttributeType(instanceId) =  new(instanceId)
end

type ResetInstanceAttributeResponseType
    requestId::String
    return::Bool

    ResetInstanceAttributeResponseType(requestId, return) =  new(requestId, return)
end

type DescribeInstanceAttributeType
    instanceId::String

    DescribeInstanceAttributeType(instanceId) =  new(instanceId)
end

type DescribeInstanceAttributeResponseType
    requestId::String
    instanceId::String

    DescribeInstanceAttributeResponseType(requestId, instanceId) =  new(requestId, instanceId)
end

type ModifyImageAttributeType
    imageId::String

    ModifyImageAttributeType(imageId) =  new(imageId)
end

type LaunchPermissionItemType
    userId::Union(String, Nothing)
    group::Union(String, Nothing)

    LaunchPermissionItemType() =  new(nothing, nothing)
end

type ProductCodeItemType
    productCode::String

    ProductCodeItemType(productCode) =  new(productCode)
end

type ModifyImageAttributeResponseType
    requestId::String
    return::Bool

    ModifyImageAttributeResponseType(requestId, return) =  new(requestId, return)
end

type ResetImageAttributeType
    imageId::String

    ResetImageAttributeType(imageId) =  new(imageId)
end

type EmptyElementType

    EmptyElementType() =  new()
end

type ResetImageAttributeResponseType
    requestId::String
    return::Bool

    ResetImageAttributeResponseType(requestId, return) =  new(requestId, return)
end

type DescribeImageAttributeType
    imageId::String

    DescribeImageAttributeType(imageId) =  new(imageId)
end

type DescribeImageAttributeResponseType
    requestId::String
    imageId::String

    DescribeImageAttributeResponseType(requestId, imageId) =  new(requestId, imageId)
end

type NullableAttributeValueType
    value::Union(String, Nothing)

    NullableAttributeValueType() =  new(nothing)
end

type NullableAttributeBooleanValueType
    value::Union(Bool, Nothing)

    NullableAttributeBooleanValueType() =  new(nothing)
end

type AttributeValueType
    value::String

    AttributeValueType(value) =  new(value)
end

type AttributeBooleanValueType
    value::Bool

    AttributeBooleanValueType(value) =  new(value)
end

type ConfirmProductInstanceType
    productCode::String
    instanceId::String

    ConfirmProductInstanceType(productCode, instanceId) =  new(productCode, instanceId)
end

type ProductCodesSetItemType
    productCode::String
    type::String

    ProductCodesSetItemType(productCode, type) =  new(productCode, type)
end

type ConfirmProductInstanceResponseType
    requestId::String
    return::Bool
    ownerId::Union(String, Nothing)

    ConfirmProductInstanceResponseType(requestId, return) =  new(requestId, return, nothing)
end

type DescribeAvailabilityZonesSetItemType
    zoneName::String

    DescribeAvailabilityZonesSetItemType(zoneName) =  new(zoneName)
end

type AvailabilityZoneMessageType
    message::String

    AvailabilityZoneMessageType(message) =  new(message)
end

type AllocateAddressType
    domain::Union(String, Nothing)

    AllocateAddressType() =  new(nothing)
end

type AllocateAddressResponseType
    requestId::String
    publicIp::String
    domain::String
    allocationId::Union(String, Nothing)

    AllocateAddressResponseType(requestId, publicIp, domain) =  new(requestId, publicIp, domain, nothing)
end

type ReleaseAddressType

    ReleaseAddressType() =  new()
end

type ReleaseAddressResponseType
    requestId::String
    return::Bool

    ReleaseAddressResponseType(requestId, return) =  new(requestId, return)
end

type AllocationIdSetItemType
    allocationId::String

    AllocationIdSetItemType(allocationId) =  new(allocationId)
end

type DescribeAddressesItemType
    publicIp::String

    DescribeAddressesItemType(publicIp) =  new(publicIp)
end

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

type AssociateAddressType
    privateIpAddress::Union(String, Nothing)
    allowReassociation::Union(Bool, Nothing)

    AssociateAddressType() =  new(nothing, nothing)
end

type AssociateAddressResponseType
    requestId::String
    return::Bool
    associationId::Union(String, Nothing)

    AssociateAddressResponseType(requestId, return) =  new(requestId, return, nothing)
end

type DisassociateAddressType
    publicIp::Union(String, Nothing)
    associationId::Union(String, Nothing)

    DisassociateAddressType() =  new(nothing, nothing)
end

type DisassociateAddressResponseType
    requestId::String
    return::Bool

    DisassociateAddressResponseType(requestId, return) =  new(requestId, return)
end

type CreateVolumeType
    size::Union(String, Nothing)
    snapshotId::Union(String, Nothing)
    availabilityZone::String
    volumeType::Union(String, Nothing)
    iops::Union(Int32, Nothing)

    CreateVolumeType(availabilityZone) =  new(nothing, nothing, availabilityZone, nothing, nothing)
end

type CreateVolumeResponseType
    requestId::String
    volumeId::String
    size::String
    snapshotId::String
    availabilityZone::String
    status::String
    createTime::DateTime
    volumeType::String
    iops::Union(Int32, Nothing)

    CreateVolumeResponseType(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType) =  new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, nothing)
end

type DeleteVolumeType
    volumeId::String

    DeleteVolumeType(volumeId) =  new(volumeId)
end

type DeleteVolumeResponseType
    requestId::String
    return::Bool

    DeleteVolumeResponseType(requestId, return) =  new(requestId, return)
end

type DescribeVolumesSetItemType
    volumeId::String

    DescribeVolumesSetItemType(volumeId) =  new(volumeId)
end

type AttachmentSetItemResponseType
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::DateTime
    deleteOnTermination::Bool

    AttachmentSetItemResponseType(volumeId, instanceId, device, status, attachTime, deleteOnTermination) =  new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end

type AttachVolumeType
    volumeId::String
    instanceId::String
    device::String

    AttachVolumeType(volumeId, instanceId, device) =  new(volumeId, instanceId, device)
end

type AttachVolumeResponseType
    requestId::String
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::DateTime

    AttachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) =  new(requestId, volumeId, instanceId, device, status, attachTime)
end

type DetachVolumeType
    volumeId::String
    instanceId::Union(String, Nothing)
    device::Union(String, Nothing)
    force::Union(Bool, Nothing)

    DetachVolumeType(volumeId) =  new(volumeId, nothing, nothing, nothing)
end

type DetachVolumeResponseType
    requestId::String
    volumeId::String
    instanceId::String
    device::String
    status::String
    attachTime::DateTime

    DetachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) =  new(requestId, volumeId, instanceId, device, status, attachTime)
end

type CreateSnapshotType
    volumeId::String
    description::Union(String, Nothing)

    CreateSnapshotType(volumeId) =  new(volumeId, nothing)
end

type CreateSnapshotResponseType
    requestId::String
    snapshotId::String
    volumeId::String
    status::String
    startTime::DateTime
    progress::String
    ownerId::String
    volumeSize::String
    description::Union(String, Nothing)

    CreateSnapshotResponseType(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize) =  new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, nothing)
end

type CopySnapshotType
    sourceRegion::String
    sourceSnapshotId::String
    description::Union(String, Nothing)

    CopySnapshotType(sourceRegion, sourceSnapshotId) =  new(sourceRegion, sourceSnapshotId, nothing)
end

type CopySnapshotResponseType
    requestId::String
    snapshotId::String

    CopySnapshotResponseType(requestId, snapshotId) =  new(requestId, snapshotId)
end

type DeleteSnapshotType
    snapshotId::String

    DeleteSnapshotType(snapshotId) =  new(snapshotId)
end

type DeleteSnapshotResponseType
    requestId::String
    return::Bool

    DeleteSnapshotResponseType(requestId, return) =  new(requestId, return)
end

type DescribeSnapshotsSetItemType
    snapshotId::String

    DescribeSnapshotsSetItemType(snapshotId) =  new(snapshotId)
end

type DescribeSnapshotsOwnerType
    owner::String

    DescribeSnapshotsOwnerType(owner) =  new(owner)
end

type DescribeSnapshotsRestorableByType
    user::String

    DescribeSnapshotsRestorableByType(user) =  new(user)
end

type CreateVolumePermissionItemType
    userId::Union(String, Nothing)
    group::Union(String, Nothing)

    CreateVolumePermissionItemType() =  new(nothing, nothing)
end

type ModifySnapshotAttributeResponseType
    requestId::String
    return::Bool

    ModifySnapshotAttributeResponseType(requestId, return) =  new(requestId, return)
end

type ResetSnapshotAttributeType
    snapshotId::String

    ResetSnapshotAttributeType(snapshotId) =  new(snapshotId)
end

type ResetSnapshotAttributeResponseType
    requestId::String
    return::Bool

    ResetSnapshotAttributeResponseType(requestId, return) =  new(requestId, return)
end

type DescribeSnapshotAttributeType
    snapshotId::String

    DescribeSnapshotAttributeType(snapshotId) =  new(snapshotId)
end

type DescribeSnapshotAttributeResponseType
    requestId::String
    snapshotId::String

    DescribeSnapshotAttributeResponseType(requestId, snapshotId) =  new(requestId, snapshotId)
end

type BundleInstanceS3StorageType
    bucket::String
    prefix::String
    awsAccessKeyId::Union(String, Nothing)
    uploadPolicy::Union(String, Nothing)
    uploadPolicySignature::Union(String, Nothing)

    BundleInstanceS3StorageType(bucket, prefix) =  new(bucket, prefix, nothing, nothing, nothing)
end

type BundleInstanceTaskErrorType
    code::String
    message::String

    BundleInstanceTaskErrorType(code, message) =  new(code, message)
end

type DescribeBundleTasksItemType
    bundleId::String

    DescribeBundleTasksItemType(bundleId) =  new(bundleId)
end

type CancelBundleTaskType
    bundleId::String

    CancelBundleTaskType(bundleId) =  new(bundleId)
end

type CopyImageType
    sourceRegion::String
    sourceImageId::String
    name::String
    description::Union(String, Nothing)
    clientToken::Union(String, Nothing)

    CopyImageType(sourceRegion, sourceImageId, name) =  new(sourceRegion, sourceImageId, name, nothing, nothing)
end

type CopyImageResponseType
    requestId::String
    imageId::String

    CopyImageResponseType(requestId, imageId) =  new(requestId, imageId)
end

type DescribeRegionsSetItemType
    regionName::String

    DescribeRegionsSetItemType(regionName) =  new(regionName)
end

type RegionItemType
    regionName::String
    regionEndpoint::String

    RegionItemType(regionName, regionEndpoint) =  new(regionName, regionEndpoint)
end

type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::String

    DescribeReservedInstancesOfferingsSetItemType(reservedInstancesOfferingId) =  new(reservedInstancesOfferingId)
end

type RecurringChargesSetItemType
    frequency::String
    amount::Float64

    RecurringChargesSetItemType(frequency, amount) =  new(frequency, amount)
end

type PricingDetailsSetItemType
    price::Float64
    count::Int32

    PricingDetailsSetItemType(price, count) =  new(price, count)
end

type ReservedInstanceLimitPriceType
    amount::Float64
    currencyCode::Union(String, Nothing)

    ReservedInstanceLimitPriceType(amount) =  new(amount, nothing)
end

type PurchaseReservedInstancesOfferingResponseType
    requestId::String
    reservedInstancesId::String

    PurchaseReservedInstancesOfferingResponseType(requestId, reservedInstancesId) =  new(requestId, reservedInstancesId)
end

type DescribeReservedInstancesSetItemType
    reservedInstancesId::String

    DescribeReservedInstancesSetItemType(reservedInstancesId) =  new(reservedInstancesId)
end

type PriceScheduleRequestSetItemType
    term::Int64
    price::Float64
    currencyCode::Union(String, Nothing)

    PriceScheduleRequestSetItemType(term, price) =  new(term, price, nothing)
end

type CancelReservedInstancesListingType
    reservedInstancesListingId::String

    CancelReservedInstancesListingType(reservedInstancesListingId) =  new(reservedInstancesListingId)
end

type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::String

    DescribeReservedInstancesListingSetItemType(reservedInstancesListingId) =  new(reservedInstancesListingId)
end

type InstanceCountsSetItemType
    state::String
    instanceCount::Int32

    InstanceCountsSetItemType(state, instanceCount) =  new(state, instanceCount)
end

type PriceScheduleSetItemType
    term::Int64
    price::Float64
    currencyCode::Union(String, Nothing)
    active::Bool

    PriceScheduleSetItemType(term, price, active) =  new(term, price, nothing, active)
end

type MonitorInstancesSetItemType
    instanceId::String

    MonitorInstancesSetItemType(instanceId) =  new(instanceId)
end

type InstanceMonitoringStateType
    state::String

    InstanceMonitoringStateType(state) =  new(state)
end

type AttachmentType
    vpcId::String
    state::String

    AttachmentType(vpcId, state) =  new(vpcId, state)
end

type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsResponseType() =  new(nothing)
end

type VpnStaticRouteType
    destinationCidrBlock::String
    source::String
    state::String

    VpnStaticRouteType(destinationCidrBlock, source, state) =  new(destinationCidrBlock, source, state)
end

type VpnTunnelTelemetryType
    outsideIpAddress::String
    status::String
    lastStatusChange::DateTime
    statusMessage::Union(String, Nothing)
    acceptedRouteCount::Int32

    VpnTunnelTelemetryType(outsideIpAddress, status, lastStatusChange, acceptedRouteCount) =  new(outsideIpAddress, status, lastStatusChange, nothing, acceptedRouteCount)
end

type CustomerGatewayIdSetItemType
    customerGatewayId::String

    CustomerGatewayIdSetItemType(customerGatewayId) =  new(customerGatewayId)
end

type VpnGatewayIdSetItemType
    vpnGatewayId::String

    VpnGatewayIdSetItemType(vpnGatewayId) =  new(vpnGatewayId)
end

type VpnConnectionIdSetItemType
    vpnConnectionId::String

    VpnConnectionIdSetItemType(vpnConnectionId) =  new(vpnConnectionId)
end

type VpcIdSetItemType
    vpcId::String

    VpcIdSetItemType(vpcId) =  new(vpcId)
end

type SubnetIdSetItemType
    subnetId::String

    SubnetIdSetItemType(subnetId) =  new(subnetId)
end

type DhcpOptionsIdSetItemType
    dhcpOptionsId::String

    DhcpOptionsIdSetItemType(dhcpOptionsId) =  new(dhcpOptionsId)
end

type DhcpValueType
    value::String

    DhcpValueType(value) =  new(value)
end

type ValueType
    value::String

    ValueType(value) =  new(value)
end

type CreateCustomerGatewayType
    type::String
    ipAddress::String
    bgpAsn::Union(Int32, Nothing)

    CreateCustomerGatewayType(type, ipAddress) =  new(type, ipAddress, nothing)
end

type DeleteCustomerGatewayType
    customerGatewayId::String

    DeleteCustomerGatewayType(customerGatewayId) =  new(customerGatewayId)
end

type DeleteCustomerGatewayResponseType
    requestId::String
    return::Bool

    DeleteCustomerGatewayResponseType(requestId, return) =  new(requestId, return)
end

type CreateVpnGatewayType
    type::String
    availabilityZone::Union(String, Nothing)

    CreateVpnGatewayType(type) =  new(type, nothing)
end

type DeleteVpnGatewayType
    vpnGatewayId::String

    DeleteVpnGatewayType(vpnGatewayId) =  new(vpnGatewayId)
end

type DeleteVpnGatewayResponseType
    requestId::String
    return::Bool

    DeleteVpnGatewayResponseType(requestId, return) =  new(requestId, return)
end

type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsRequestType() =  new(nothing)
end

type CreateVpnConnectionRouteType
    vpnConnectionId::String
    destinationCidrBlock::String

    CreateVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) =  new(vpnConnectionId, destinationCidrBlock)
end

type CreateVpnConnectionRouteResponseType
    requestId::String
    return::Bool

    CreateVpnConnectionRouteResponseType(requestId, return) =  new(requestId, return)
end

type DeleteVpnConnectionRouteType
    vpnConnectionId::String
    destinationCidrBlock::String

    DeleteVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) =  new(vpnConnectionId, destinationCidrBlock)
end

type DeleteVpnConnectionRouteResponseType
    requestId::String
    return::Bool

    DeleteVpnConnectionRouteResponseType(requestId, return) =  new(requestId, return)
end

type DeleteVpnConnectionType
    vpnConnectionId::String

    DeleteVpnConnectionType(vpnConnectionId) =  new(vpnConnectionId)
end

type DeleteVpnConnectionResponseType
    requestId::String
    return::Bool

    DeleteVpnConnectionResponseType(requestId, return) =  new(requestId, return)
end

type AttachVpnGatewayType
    vpnGatewayId::String
    vpcId::String

    AttachVpnGatewayType(vpnGatewayId, vpcId) =  new(vpnGatewayId, vpcId)
end

type DetachVpnGatewayType
    vpnGatewayId::String
    vpcId::String

    DetachVpnGatewayType(vpnGatewayId, vpcId) =  new(vpnGatewayId, vpcId)
end

type DetachVpnGatewayResponseType
    requestId::String
    return::Bool

    DetachVpnGatewayResponseType(requestId, return) =  new(requestId, return)
end

type CreateVpcType
    cidrBlock::String
    instanceTenancy::Union(String, Nothing)

    CreateVpcType(cidrBlock) =  new(cidrBlock, nothing)
end

type DeleteVpcType
    vpcId::String

    DeleteVpcType(vpcId) =  new(vpcId)
end

type DeleteVpcResponseType
    requestId::String
    return::Bool

    DeleteVpcResponseType(requestId, return) =  new(requestId, return)
end

type CreateSubnetType
    vpcId::String
    cidrBlock::String
    availabilityZone::Union(String, Nothing)

    CreateSubnetType(vpcId, cidrBlock) =  new(vpcId, cidrBlock, nothing)
end

type DeleteSubnetType
    subnetId::String

    DeleteSubnetType(subnetId) =  new(subnetId)
end

type DeleteSubnetResponseType
    requestId::String
    return::Bool

    DeleteSubnetResponseType(requestId, return) =  new(requestId, return)
end

type DeleteDhcpOptionsType
    dhcpOptionsId::String

    DeleteDhcpOptionsType(dhcpOptionsId) =  new(dhcpOptionsId)
end

type DeleteDhcpOptionsResponseType
    requestId::String
    return::Bool

    DeleteDhcpOptionsResponseType(requestId, return) =  new(requestId, return)
end

type AssociateDhcpOptionsType
    dhcpOptionsId::String
    vpcId::String

    AssociateDhcpOptionsType(dhcpOptionsId, vpcId) =  new(dhcpOptionsId, vpcId)
end

type AssociateDhcpOptionsResponseType
    requestId::String
    return::Bool

    AssociateDhcpOptionsResponseType(requestId, return) =  new(requestId, return)
end

type SpotInstanceStateFaultType
    code::String
    message::String

    SpotInstanceStateFaultType(code, message) =  new(code, message)
end

type SpotInstanceStatusMessageType
    code::Union(String, Nothing)
    updateTime::Union(DateTime, Nothing)
    message::Union(String, Nothing)

    SpotInstanceStatusMessageType() =  new(nothing, nothing, nothing)
end

type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::String

    SpotInstanceRequestIdSetItemType(spotInstanceRequestId) =  new(spotInstanceRequestId)
end

type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::String
    state::String

    CancelSpotInstanceRequestsResponseSetItemType(spotInstanceRequestId, state) =  new(spotInstanceRequestId, state)
end

type InstanceTypeSetItemType
    instanceType::String

    InstanceTypeSetItemType(instanceType) =  new(instanceType)
end

type ProductDescriptionSetItemType
    productDescription::String

    ProductDescriptionSetItemType(productDescription) =  new(productDescription)
end

type SpotPriceHistorySetItemType
    instanceType::String
    productDescription::String
    spotPrice::String
    timestamp::DateTime
    availabilityZone::Union(String, Nothing)

    SpotPriceHistorySetItemType(instanceType, productDescription, spotPrice, timestamp) =  new(instanceType, productDescription, spotPrice, timestamp, nothing)
end

type CreateSpotDatafeedSubscriptionType
    bucket::String
    prefix::String

    CreateSpotDatafeedSubscriptionType(bucket, prefix) =  new(bucket, prefix)
end

type DescribeSpotDatafeedSubscriptionType

    DescribeSpotDatafeedSubscriptionType() =  new()
end

type DeleteSpotDatafeedSubscriptionType

    DeleteSpotDatafeedSubscriptionType() =  new()
end

type DeleteSpotDatafeedSubscriptionResponseType
    requestId::String
    return::Bool

    DeleteSpotDatafeedSubscriptionResponseType(requestId, return) =  new(requestId, return)
end

type LicenseIdSetItemType
    licenseId::String

    LicenseIdSetItemType(licenseId) =  new(licenseId)
end

type LicenseCapacitySetItemType
    capacity::Int32
    instanceCapacity::Int32
    state::String
    earliestAllowedDeactivationTime::Union(DateTime, Nothing)

    LicenseCapacitySetItemType(capacity, instanceCapacity, state) =  new(capacity, instanceCapacity, state, nothing)
end

type ActivateLicenseType
    licenseId::String
    capacity::Int32

    ActivateLicenseType(licenseId, capacity) =  new(licenseId, capacity)
end

type ActivateLicenseResponseType
    requestId::String
    return::Bool

    ActivateLicenseResponseType(requestId, return) =  new(requestId, return)
end

type DeactivateLicenseType
    licenseId::String
    capacity::Int32

    DeactivateLicenseType(licenseId, capacity) =  new(licenseId, capacity)
end

type DeactivateLicenseResponseType
    requestId::String
    return::Bool

    DeactivateLicenseResponseType(requestId, return) =  new(requestId, return)
end

type CreatePlacementGroupType
    groupName::String
    strategy::String

    CreatePlacementGroupType(groupName, strategy) =  new(groupName, strategy)
end

type CreatePlacementGroupResponseType
    requestId::String
    return::Bool

    CreatePlacementGroupResponseType(requestId, return) =  new(requestId, return)
end

type DeletePlacementGroupType
    groupName::String

    DeletePlacementGroupType(groupName) =  new(groupName)
end

type DeletePlacementGroupResponseType
    requestId::String
    return::Bool

    DeletePlacementGroupResponseType(requestId, return) =  new(requestId, return)
end

type DescribePlacementGroupItemType
    groupName::String

    DescribePlacementGroupItemType(groupName) =  new(groupName)
end

type PlacementGroupInfoType
    groupName::String
    strategy::String
    state::String

    PlacementGroupInfoType(groupName, strategy, state) =  new(groupName, strategy, state)
end

type ResourceIdSetItemType
    resourceId::String

    ResourceIdSetItemType(resourceId) =  new(resourceId)
end

type ResourceTagSetItemType
    key::String
    value::String

    ResourceTagSetItemType(key, value) =  new(key, value)
end

type CreateTagsResponseType
    requestId::String
    return::Bool

    CreateTagsResponseType(requestId, return) =  new(requestId, return)
end

type TagSetItemType
    resourceId::Union(String, Nothing)
    resourceType::Union(String, Nothing)
    key::Union(String, Nothing)
    value::Union(String, Nothing)

    TagSetItemType() =  new(nothing, nothing, nothing, nothing)
end

type DeleteTagsSetItemType
    key::Union(String, Nothing)
    value::Union(String, Nothing)

    DeleteTagsSetItemType() =  new(nothing, nothing)
end

type DeleteTagsResponseType
    requestId::String
    return::Bool

    DeleteTagsResponseType(requestId, return) =  new(requestId, return)
end

type DiskImageDetailType
    format::String
    bytes::Int64
    importManifestUrl::String

    DiskImageDetailType(format, bytes, importManifestUrl) =  new(format, bytes, importManifestUrl)
end

type DiskImageVolumeType
    size::Int

    DiskImageVolumeType(size) =  new(size)
end

type DiskImageVolumeDescriptionType
    size::Int
    id::String

    DiskImageVolumeDescriptionType(size, id) =  new(size, id)
end

type DiskImageDescriptionType
    format::String
    size::Int64
    importManifestUrl::String
    checksum::Union(String, Nothing)

    DiskImageDescriptionType(format, size, importManifestUrl) =  new(format, size, importManifestUrl, nothing)
end

type ConversionTaskIdItemType
    conversionTaskId::String

    ConversionTaskIdItemType(conversionTaskId) =  new(conversionTaskId)
end

type CancelConversionTaskType
    conversionTaskId::String

    CancelConversionTaskType(conversionTaskId) =  new(conversionTaskId)
end

type CancelConversionTaskResponseType
    requestId::String
    return::Bool

    CancelConversionTaskResponseType(requestId, return) =  new(requestId, return)
end

type CreateInstanceExportTaskType
    description::Union(String, Nothing)
    instanceId::String
    targetEnvironment::String

    CreateInstanceExportTaskType(instanceId, targetEnvironment) =  new(nothing, instanceId, targetEnvironment)
end

type ExportToS3TaskType
    diskImageFormat::Union(String, Nothing)
    containerFormat::Union(String, Nothing)
    s3Bucket::String
    s3Prefix::String

    ExportToS3TaskType(s3Bucket, s3Prefix) =  new(nothing, nothing, s3Bucket, s3Prefix)
end

type ExportTaskIdType
    exportTaskId::String

    ExportTaskIdType(exportTaskId) =  new(exportTaskId)
end

type ExportTaskResponseType
    exportTaskId::String
    description::Union(String, Nothing)
    state::String
    statusMessage::Union(String, Nothing)

    ExportTaskResponseType(exportTaskId, state) =  new(exportTaskId, nothing, state, nothing)
end

type InstanceExportTaskResponseType
    instanceId::String
    targetEnvironment::Union(String, Nothing)

    InstanceExportTaskResponseType(instanceId) =  new(instanceId, nothing)
end

type ExportToS3TaskResponseType
    diskImageFormat::String
    containerFormat::Union(String, Nothing)
    s3Bucket::String
    s3Key::String

    ExportToS3TaskResponseType(diskImageFormat, s3Bucket, s3Key) =  new(diskImageFormat, nothing, s3Bucket, s3Key)
end

type CancelExportTaskType
    exportTaskId::String

    CancelExportTaskType(exportTaskId) =  new(exportTaskId)
end

type CancelExportTaskResponseType
    requestId::String
    return::Bool

    CancelExportTaskResponseType(requestId, return) =  new(requestId, return)
end

type CreateInternetGatewayType

    CreateInternetGatewayType() =  new()
end

type InternetGatewayAttachmentType
    vpcId::String
    state::String

    InternetGatewayAttachmentType(vpcId, state) =  new(vpcId, state)
end

type InternetGatewayIdSetItemType
    internetGatewayId::String

    InternetGatewayIdSetItemType(internetGatewayId) =  new(internetGatewayId)
end

type DeleteInternetGatewayType
    internetGatewayId::String

    DeleteInternetGatewayType(internetGatewayId) =  new(internetGatewayId)
end

type DeleteInternetGatewayResponseType
    requestId::String
    return::Bool

    DeleteInternetGatewayResponseType(requestId, return) =  new(requestId, return)
end

type AttachInternetGatewayType
    internetGatewayId::String
    vpcId::String

    AttachInternetGatewayType(internetGatewayId, vpcId) =  new(internetGatewayId, vpcId)
end

type AttachInternetGatewayResponseType
    requestId::String
    return::Bool

    AttachInternetGatewayResponseType(requestId, return) =  new(requestId, return)
end

type DetachInternetGatewayType
    internetGatewayId::String
    vpcId::String

    DetachInternetGatewayType(internetGatewayId, vpcId) =  new(internetGatewayId, vpcId)
end

type DetachInternetGatewayResponseType
    requestId::String
    return::Bool

    DetachInternetGatewayResponseType(requestId, return) =  new(requestId, return)
end

type CreateRouteTableType
    vpcId::String

    CreateRouteTableType(vpcId) =  new(vpcId)
end

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

type RouteTableAssociationType
    routeTableAssociationId::String
    routeTableId::String

    RouteTableAssociationType(routeTableAssociationId, routeTableId) =  new(routeTableAssociationId, routeTableId)
end

type PropagatingVgwType
    gatewayId::String

    PropagatingVgwType(gatewayId) =  new(gatewayId)
end

type RouteTableIdSetItemType
    routeTableId::String

    RouteTableIdSetItemType(routeTableId) =  new(routeTableId)
end

type EnableVgwRoutePropagationRequestType
    routeTableId::String
    gatewayId::String

    EnableVgwRoutePropagationRequestType(routeTableId, gatewayId) =  new(routeTableId, gatewayId)
end

type EnableVgwRoutePropagationResponseType
    requestId::String
    return::Bool

    EnableVgwRoutePropagationResponseType(requestId, return) =  new(requestId, return)
end

type DisableVgwRoutePropagationRequestType
    routeTableId::String
    gatewayId::String

    DisableVgwRoutePropagationRequestType(routeTableId, gatewayId) =  new(routeTableId, gatewayId)
end

type DisableVgwRoutePropagationResponseType
    requestId::String
    return::Bool

    DisableVgwRoutePropagationResponseType(requestId, return) =  new(requestId, return)
end

type DeleteRouteTableType
    routeTableId::String

    DeleteRouteTableType(routeTableId) =  new(routeTableId)
end

type DeleteRouteTableResponseType
    requestId::String
    return::Bool

    DeleteRouteTableResponseType(requestId, return) =  new(requestId, return)
end

type AssociateRouteTableType
    routeTableId::String
    subnetId::String

    AssociateRouteTableType(routeTableId, subnetId) =  new(routeTableId, subnetId)
end

type AssociateRouteTableResponseType
    requestId::String
    associationId::String

    AssociateRouteTableResponseType(requestId, associationId) =  new(requestId, associationId)
end

type ReplaceRouteTableAssociationType
    associationId::String
    routeTableId::String

    ReplaceRouteTableAssociationType(associationId, routeTableId) =  new(associationId, routeTableId)
end

type ReplaceRouteTableAssociationResponseType
    requestId::String
    newAssociationId::String

    ReplaceRouteTableAssociationResponseType(requestId, newAssociationId) =  new(requestId, newAssociationId)
end

type DisassociateRouteTableType
    associationId::String

    DisassociateRouteTableType(associationId) =  new(associationId)
end

type DisassociateRouteTableResponseType
    requestId::String
    return::Bool

    DisassociateRouteTableResponseType(requestId, return) =  new(requestId, return)
end

type CreateRouteType
    routeTableId::String
    destinationCidrBlock::String

    CreateRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end

type CreateRouteResponseType
    requestId::String
    return::Bool

    CreateRouteResponseType(requestId, return) =  new(requestId, return)
end

type ReplaceRouteType
    routeTableId::String
    destinationCidrBlock::String

    ReplaceRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end

type ReplaceRouteResponseType
    requestId::String
    return::Bool

    ReplaceRouteResponseType(requestId, return) =  new(requestId, return)
end

type DeleteRouteType
    routeTableId::String
    destinationCidrBlock::String

    DeleteRouteType(routeTableId, destinationCidrBlock) =  new(routeTableId, destinationCidrBlock)
end

type DeleteRouteResponseType
    requestId::String
    return::Bool

    DeleteRouteResponseType(requestId, return) =  new(requestId, return)
end

type CreateNetworkAclType
    vpcId::String

    CreateNetworkAclType(vpcId) =  new(vpcId)
end

type IcmpTypeCodeType
    code::Int32
    type::Int32

    IcmpTypeCodeType(code, type) =  new(code, type)
end

type PortRangeType
    from::Int32
    to::Int32

    PortRangeType(from, to) =  new(from, to)
end

type NetworkAclAssociationType
    networkAclAssociationId::String
    networkAclId::String
    subnetId::String

    NetworkAclAssociationType(networkAclAssociationId, networkAclId, subnetId) =  new(networkAclAssociationId, networkAclId, subnetId)
end

type NetworkAclIdSetItemType
    networkAclId::String

    NetworkAclIdSetItemType(networkAclId) =  new(networkAclId)
end

type DeleteNetworkAclType
    networkAclId::String

    DeleteNetworkAclType(networkAclId) =  new(networkAclId)
end

type DeleteNetworkAclResponseType
    requestId::String
    return::Bool

    DeleteNetworkAclResponseType(requestId, return) =  new(requestId, return)
end

type ReplaceNetworkAclAssociationType
    associationId::String
    networkAclId::String

    ReplaceNetworkAclAssociationType(associationId, networkAclId) =  new(associationId, networkAclId)
end

type ReplaceNetworkAclAssociationResponseType
    requestId::String
    newAssociationId::String

    ReplaceNetworkAclAssociationResponseType(requestId, newAssociationId) =  new(requestId, newAssociationId)
end

type CreateNetworkAclEntryResponseType
    requestId::String
    return::Bool

    CreateNetworkAclEntryResponseType(requestId, return) =  new(requestId, return)
end

type ReplaceNetworkAclEntryResponseType
    requestId::String
    return::Bool

    ReplaceNetworkAclEntryResponseType(requestId, return) =  new(requestId, return)
end

type DeleteNetworkAclEntryType
    networkAclId::String
    ruleNumber::Int32
    egress::Bool

    DeleteNetworkAclEntryType(networkAclId, ruleNumber, egress) =  new(networkAclId, ruleNumber, egress)
end

type DeleteNetworkAclEntryResponseType
    requestId::String
    return::Bool

    DeleteNetworkAclEntryResponseType(requestId, return) =  new(requestId, return)
end

type InstanceStatusDetailsSetItemType
    name::String
    status::String
    impairedSince::Union(DateTime, Nothing)

    InstanceStatusDetailsSetItemType(name, status) =  new(name, status, nothing)
end

type InstanceStatusEventType
    code::String
    description::String
    notBefore::DateTime
    notAfter::Union(DateTime, Nothing)

    InstanceStatusEventType(code, description, notBefore) =  new(code, description, notBefore, nothing)
end

type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::String

    ReportInstanceStatusReasonCodeSetItemType(reasonCode) =  new(reasonCode)
end

type ReportInstanceStatusResponseType
    requestId::String
    return::Bool

    ReportInstanceStatusResponseType(requestId, return) =  new(requestId, return)
end

type NetworkInterfaceIdSetItemType
    networkInterfaceId::String

    NetworkInterfaceIdSetItemType(networkInterfaceId) =  new(networkInterfaceId)
end

type NetworkInterfaceAttachmentType
    attachmentId::String
    instanceId::Union(String, Nothing)
    instanceOwnerId::Union(String, Nothing)
    deviceIndex::Int32
    status::String
    attachTime::DateTime
    deleteOnTermination::Bool

    NetworkInterfaceAttachmentType(attachmentId, deviceIndex, status, attachTime, deleteOnTermination) =  new(attachmentId, nothing, nothing, deviceIndex, status, attachTime, deleteOnTermination)
end

type NetworkInterfaceAssociationType
    publicIp::String
    publicDnsName::Union(String, Nothing)
    ipOwnerId::Union(String, Nothing)
    allocationId::Union(String, Nothing)
    associationId::Union(String, Nothing)

    NetworkInterfaceAssociationType(publicIp) =  new(publicIp, nothing, nothing, nothing, nothing)
end

type DeleteNetworkInterfaceType
    networkInterfaceId::String

    DeleteNetworkInterfaceType(networkInterfaceId) =  new(networkInterfaceId)
end

type DeleteNetworkInterfaceResponseType
    requestId::String
    return::Bool

    DeleteNetworkInterfaceResponseType(requestId, return) =  new(requestId, return)
end

type AttachNetworkInterfaceType
    networkInterfaceId::String
    instanceId::String
    deviceIndex::Int32

    AttachNetworkInterfaceType(networkInterfaceId, instanceId, deviceIndex) =  new(networkInterfaceId, instanceId, deviceIndex)
end

type AttachNetworkInterfaceResponseType
    requestId::String
    attachmentId::String

    AttachNetworkInterfaceResponseType(requestId, attachmentId) =  new(requestId, attachmentId)
end

type DetachNetworkInterfaceType
    attachmentId::String
    force::Union(Bool, Nothing)

    DetachNetworkInterfaceType(attachmentId) =  new(attachmentId, nothing)
end

type DetachNetworkInterfaceResponseType
    requestId::String
    return::Bool

    DetachNetworkInterfaceResponseType(requestId, return) =  new(requestId, return)
end

type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::String

    DescribeNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end

type DescribeNetworkInterfaceAttributeResponseType
    requestId::String
    networkInterfaceId::String

    DescribeNetworkInterfaceAttributeResponseType(requestId, networkInterfaceId) =  new(requestId, networkInterfaceId)
end

type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::String

    ModifyNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end

type ModifyNetworkInterfaceAttachmentType
    attachmentId::String
    deleteOnTermination::Bool

    ModifyNetworkInterfaceAttachmentType(attachmentId, deleteOnTermination) =  new(attachmentId, deleteOnTermination)
end

type ModifyNetworkInterfaceAttributeResponseType
    requestId::String
    return::Bool

    ModifyNetworkInterfaceAttributeResponseType(requestId, return) =  new(requestId, return)
end

type ResetNetworkInterfaceAttributeType
    networkInterfaceId::String

    ResetNetworkInterfaceAttributeType(networkInterfaceId) =  new(networkInterfaceId)
end

type ResetNetworkInterfaceAttributeResponseType
    requestId::String
    return::Bool

    ResetNetworkInterfaceAttributeResponseType(requestId, return) =  new(requestId, return)
end

type AssignPrivateIpAddressesResponseType
    requestId::String
    return::Bool

    AssignPrivateIpAddressesResponseType(requestId, return) =  new(requestId, return)
end

type UnassignPrivateIpAddressesResponseType
    requestId::String
    return::Bool

    UnassignPrivateIpAddressesResponseType(requestId, return) =  new(requestId, return)
end

type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::String

    AssignPrivateIpAddressesSetItemRequestType(privateIpAddress) =  new(privateIpAddress)
end

type VolumeStatusDetailsItemType
    name::String
    status::String

    VolumeStatusDetailsItemType(name, status) =  new(name, status)
end

type VolumeStatusEventItemType
    description::String
    notBefore::DateTime
    notAfter::DateTime
    eventId::String
    eventType::String

    VolumeStatusEventItemType(description, notBefore, notAfter, eventId, eventType) =  new(description, notBefore, notAfter, eventId, eventType)
end

type VolumeStatusActionItemType
    description::String
    code::String
    eventId::String
    eventType::String

    VolumeStatusActionItemType(description, code, eventId, eventType) =  new(description, code, eventId, eventType)
end

type EnableVolumeIOType
    volumeId::String

    EnableVolumeIOType(volumeId) =  new(volumeId)
end

type EnableVolumeIOResponseType
    requestId::String
    return::Bool

    EnableVolumeIOResponseType(requestId, return) =  new(requestId, return)
end

type ModifyVolumeAttributeType
    volumeId::String

    ModifyVolumeAttributeType(volumeId) =  new(volumeId)
end

type ModifyVolumeAttributeResponseType
    requestId::String
    return::Bool

    ModifyVolumeAttributeResponseType(requestId, return) =  new(requestId, return)
end

type DescribeVolumeAttributeType
    volumeId::String

    DescribeVolumeAttributeType(volumeId) =  new(volumeId)
end

type DescribeVolumeAttributeResponseType
    requestId::String
    volumeId::String

    DescribeVolumeAttributeResponseType(requestId, volumeId) =  new(requestId, volumeId)
end

type PriceScheduleRequestSetType
    item::Array{PriceScheduleRequestSetItemType,1}

    PriceScheduleRequestSetType(item) =  new(item)
end

type VpnGatewayIdSetType
    item::Union(Array{VpnGatewayIdSetItemType,1}, Nothing)

    VpnGatewayIdSetType() =  new(nothing)
end

type AvailabilityZoneMessageSetType
    item::Union(Array{AvailabilityZoneMessageType,1}, Nothing)

    AvailabilityZoneMessageSetType() =  new(nothing)
end

type DescribeSecurityGroupsSetType
    item::Union(Array{DescribeSecurityGroupsSetItemType,1}, Nothing)

    DescribeSecurityGroupsSetType() =  new(nothing)
end

type VgwTelemetryType
    item::Union(Array{VpnTunnelTelemetryType,1}, Nothing)

    VgwTelemetryType() =  new(nothing)
end

type CreateReservedInstancesListingType
    reservedInstancesId::String
    instanceCount::Union(Int32, Nothing)
    priceSchedules::PriceScheduleRequestSetType
    clientToken::String

    CreateReservedInstancesListingType(reservedInstancesId, priceSchedules, clientToken) =  new(reservedInstancesId, nothing, priceSchedules, clientToken)
end

type UnavailableResultSetType
    item::Union(Array{UnavailableResultType,1}, Nothing)

    UnavailableResultSetType() =  new(nothing)
end

type DescribeReservedInstancesListingSetType
    item::Array{DescribeReservedInstancesListingSetItemType,1}

    DescribeReservedInstancesListingSetType(item) =  new(item)
end

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

type BundleInstanceTaskStorageType
    S3::BundleInstanceS3StorageType

    BundleInstanceTaskStorageType(S3) =  new(S3)
end

type DescribeAddressesInfoType
    item::Union(Array{DescribeAddressesItemType,1}, Nothing)

    DescribeAddressesInfoType() =  new(nothing)
end

type AttachmentSetType
    item::Union(Array{AttachmentType,1}, Nothing)

    AttachmentSetType() =  new(nothing)
end

type ProductDescriptionSetType
    item::Array{ProductDescriptionSetItemType,1}

    ProductDescriptionSetType(item) =  new(item)
end

type ProductCodesSetType
    item::Union(Array{ProductCodesSetItemType,1}, Nothing)

    ProductCodesSetType() =  new(nothing)
end

type DescribeRegionsSetType
    item::Union(Array{DescribeRegionsSetItemType,1}, Nothing)

    DescribeRegionsSetType() =  new(nothing)
end

type ResourceIdSetType
    item::Union(Array{ResourceIdSetItemType,1}, Nothing)

    ResourceIdSetType() =  new(nothing)
end

type PriceScheduleSetType
    item::Union(Array{PriceScheduleSetItemType,1}, Nothing)

    PriceScheduleSetType() =  new(nothing)
end

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

type CustomerGatewayIdSetType
    item::Union(Array{CustomerGatewayIdSetItemType,1}, Nothing)

    CustomerGatewayIdSetType() =  new(nothing)
end

type ValueSetType
    item::Union(Array{ValueType,1}, Nothing)

    ValueSetType() =  new(nothing)
end

type GroupSetType
    item::Union(Array{GroupItemType,1}, Nothing)

    GroupSetType() =  new(nothing)
end

type DeleteTagsSetType
    item::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsSetType() =  new(nothing)
end

type DescribeKeyPairsInfoType
    item::Union(Array{DescribeKeyPairsItemType,1}, Nothing)

    DescribeKeyPairsInfoType() =  new(nothing)
end

type DescribeVolumesSetType
    item::Union(Array{DescribeVolumesSetItemType,1}, Nothing)

    DescribeVolumesSetType() =  new(nothing)
end

type SpotPriceHistorySetType
    item::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)

    SpotPriceHistorySetType() =  new(nothing)
end

type IpRangeSetType
    item::Union(Array{IpRangeItemType,1}, Nothing)

    IpRangeSetType() =  new(nothing)
end

type DescribeKeyPairsResponseInfoType
    item::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseInfoType() =  new(nothing)
end

type CreateVpnConnectionType
    type::String
    customerGatewayId::String
    vpnGatewayId::String
    options::Union(VpnConnectionOptionsRequestType, Nothing)

    CreateVpnConnectionType(type, customerGatewayId, vpnGatewayId) =  new(type, customerGatewayId, vpnGatewayId, nothing)
end

type AvailabilityZoneItemType
    zoneName::String
    zoneState::String
    regionName::String
    messageSet::AvailabilityZoneMessageSetType

    AvailabilityZoneItemType(zoneName, zoneState, regionName, messageSet) =  new(zoneName, zoneState, regionName, messageSet)
end

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

type DescribeAvailabilityZonesSetType
    item::Union(Array{DescribeAvailabilityZonesSetItemType,1}, Nothing)

    DescribeAvailabilityZonesSetType() =  new(nothing)
end

type DescribeSnapshotsSetType
    item::Union(Array{DescribeSnapshotsSetItemType,1}, Nothing)

    DescribeSnapshotsSetType() =  new(nothing)
end

type SubnetIdSetType
    item::Union(Array{SubnetIdSetItemType,1}, Nothing)

    SubnetIdSetType() =  new(nothing)
end

type VpcIdSetType
    item::Union(Array{VpcIdSetItemType,1}, Nothing)

    VpcIdSetType() =  new(nothing)
end

type ConversionTaskIdSetType
    item::Union(Array{ConversionTaskIdItemType,1}, Nothing)

    ConversionTaskIdSetType() =  new(nothing)
end

type PlacementGroupSetType
    item::Union(Array{PlacementGroupInfoType,1}, Nothing)

    PlacementGroupSetType() =  new(nothing)
end

type SpotDatafeedSubscriptionType
    ownerId::String
    bucket::String
    prefix::String
    state::String
    fault::Union(SpotInstanceStateFaultType, Nothing)

    SpotDatafeedSubscriptionType(ownerId, bucket, prefix, state) =  new(ownerId, bucket, prefix, state, nothing)
end

type AllocationIdSetType
    item::Union(Array{AllocationIdSetItemType,1}, Nothing)

    AllocationIdSetType() =  new(nothing)
end

type DescribeBundleTasksInfoType
    item::Union(Array{DescribeBundleTasksItemType,1}, Nothing)

    DescribeBundleTasksInfoType() =  new(nothing)
end

type TagSetType
    item::Union(Array{TagSetItemType,1}, Nothing)

    TagSetType() =  new(nothing)
end

type NetworkAclAssociationSetType
    item::Union(Array{NetworkAclAssociationType,1}, Nothing)

    NetworkAclAssociationSetType() =  new(nothing)
end

type DescribeImagesInfoType
    item::Union(Array{DescribeImagesItemType,1}, Nothing)

    DescribeImagesInfoType() =  new(nothing)
end

type NetworkInterfaceIdSetType
    item::Union(Array{NetworkInterfaceIdSetItemType,1}, Nothing)

    NetworkInterfaceIdSetType() =  new(nothing)
end

type DescribeSnapshotsRestorableBySetType
    item::Union(Array{DescribeSnapshotsRestorableByType,1}, Nothing)

    DescribeSnapshotsRestorableBySetType() =  new(nothing)
end

type ImportVolumeType
    availabilityZone::String
    image::DiskImageDetailType
    description::Union(String, Nothing)
    volume::DiskImageVolumeType

    ImportVolumeType(availabilityZone, image, volume) =  new(availabilityZone, image, nothing, volume)
end

type RegionSetType
    item::Union(Array{RegionItemType,1}, Nothing)

    RegionSetType() =  new(nothing)
end

type VpnConnectionIdSetType
    item::Union(Array{VpnConnectionIdSetItemType,1}, Nothing)

    VpnConnectionIdSetType() =  new(nothing)
end

type VolumeStatusEventsSetType
    item::Union(Array{VolumeStatusEventItemType,1}, Nothing)

    VolumeStatusEventsSetType() =  new(nothing)
end

type RebootInstancesInfoType
    item::Array{RebootInstancesItemType,1}

    RebootInstancesInfoType(item) =  new(item)
end

type VpnStaticRoutesSetType
    item::Union(Array{VpnStaticRouteType,1}, Nothing)

    VpnStaticRoutesSetType() =  new(nothing)
end

type ExportTaskSetResponseType
    item::Union(Array{ExportTaskResponseType,1}, Nothing)

    ExportTaskSetResponseType() =  new(nothing)
end

type RebootInstancesType
    instancesSet::RebootInstancesInfoType

    RebootInstancesType(instancesSet) =  new(instancesSet)
end

type RouteTableAssociationSetType
    item::Union(Array{RouteTableAssociationType,1}, Nothing)

    RouteTableAssociationSetType() =  new(nothing)
end

type VolumeStatusActionsSetType
    item::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusActionsSetType() =  new(nothing)
end

type DescribeImagesOwnersType
    item::Union(Array{DescribeImagesOwnerType,1}, Nothing)

    DescribeImagesOwnersType() =  new(nothing)
end

type DescribePlacementGroupsResponseType
    requestId::String
    placementGroupSet::PlacementGroupSetType

    DescribePlacementGroupsResponseType(requestId, placementGroupSet) =  new(requestId, placementGroupSet)
end

type SpotInstanceRequestIdSetType
    item::Union(Array{SpotInstanceRequestIdSetItemType,1}, Nothing)

    SpotInstanceRequestIdSetType() =  new(nothing)
end

type BundleInstanceTaskType
    instanceId::String
    bundleId::String
    state::String
    startTime::DateTime
    updateTime::DateTime
    storage::BundleInstanceTaskStorageType
    progress::Union(String, Nothing)
    error::Union(BundleInstanceTaskErrorType, Nothing)

    BundleInstanceTaskType(instanceId, bundleId, state, startTime, updateTime, storage) =  new(instanceId, bundleId, state, startTime, updateTime, storage, nothing, nothing)
end

type CreateInstanceExportTaskResponseType
    requestId::String
    exportTask::ExportTaskResponseType

    CreateInstanceExportTaskResponseType(requestId, exportTask) =  new(requestId, exportTask)
end

type InstanceIdSetType
    item::Union(Array{InstanceIdType,1}, Nothing)

    InstanceIdSetType() =  new(nothing)
end

type LicenseCapacitySetType
    item::Union(Array{LicenseCapacitySetItemType,1}, Nothing)

    LicenseCapacitySetType() =  new(nothing)
end

type InstanceBlockDeviceMappingType
    item::Union(Array{InstanceBlockDeviceMappingItemType,1}, Nothing)

    InstanceBlockDeviceMappingType() =  new(nothing)
end

type InstanceBlockDeviceMappingResponseType
    item::Union(Array{InstanceBlockDeviceMappingResponseItemType,1}, Nothing)

    InstanceBlockDeviceMappingResponseType() =  new(nothing)
end

type InstanceStatusDetailsSetType
    item::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusDetailsSetType() =  new(nothing)
end

type RecurringChargesSetType
    item::Union(Array{RecurringChargesSetItemType,1}, Nothing)

    RecurringChargesSetType() =  new(nothing)
end

type InternetGatewayIdSetType
    item::Union(Array{InternetGatewayIdSetItemType,1}, Nothing)

    InternetGatewayIdSetType() =  new(nothing)
end

type DescribeExportTasksResponseType
    requestId::String
    exportTaskSet::ExportTaskSetResponseType

    DescribeExportTasksResponseType(requestId, exportTaskSet) =  new(requestId, exportTaskSet)
end

type BlockDeviceMappingType
    item::Union(Array{BlockDeviceMappingItemType,1}, Nothing)

    BlockDeviceMappingType() =  new(nothing)
end

type DescribeRegionsResponseType
    requestId::String
    regionInfo::RegionSetType

    DescribeRegionsResponseType(requestId, regionInfo) =  new(requestId, regionInfo)
end

type AccountAttributeValueSetType
    item::Union(Array{AccountAttributeValueSetItemType,1}, Nothing)

    AccountAttributeValueSetType() =  new(nothing)
end

type ExportTaskIdSetType
    item::Union(Array{ExportTaskIdType,1}, Nothing)

    ExportTaskIdSetType() =  new(nothing)
end

type InstanceCountsSetType
    item::Array{InstanceCountsSetItemType,1}

    InstanceCountsSetType(item) =  new(item)
end

type DescribeAddressesResponseInfoType
    item::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseInfoType() =  new(nothing)
end

type DescribeKeyPairsResponseType
    requestId::String
    keySet::DescribeKeyPairsResponseInfoType

    DescribeKeyPairsResponseType(requestId, keySet) =  new(requestId, keySet)
end

type DescribeReservedInstancesOfferingsSetType
    item::Union(Array{DescribeReservedInstancesOfferingsSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsSetType() =  new(nothing)
end

type LicenseIdSetType
    item::Union(Array{LicenseIdSetItemType,1}, Nothing)

    LicenseIdSetType() =  new(nothing)
end

type InstanceStatusEventsSetType
    item::Union(Array{InstanceStatusEventType,1}, Nothing)

    InstanceStatusEventsSetType() =  new(nothing)
end

type DescribeImagesExecutableBySetType
    item::Union(Array{DescribeImagesExecutableByType,1}, Nothing)

    DescribeImagesExecutableBySetType() =  new(nothing)
end

type RouteTableIdSetType
    item::Union(Array{RouteTableIdSetItemType,1}, Nothing)

    RouteTableIdSetType() =  new(nothing)
end

type AssignPrivateIpAddressesSetRequestType
    item::Array{AssignPrivateIpAddressesSetItemRequestType,1}

    AssignPrivateIpAddressesSetRequestType(item) =  new(item)
end

type ImportVolumeTaskDetailsType
    bytesConverted::Int64
    availabilityZone::String
    description::Union(String, Nothing)
    image::DiskImageDescriptionType
    volume::DiskImageVolumeDescriptionType

    ImportVolumeTaskDetailsType(bytesConverted, availabilityZone, image, volume) =  new(bytesConverted, availabilityZone, nothing, image, volume)
end

type FilterType
    name::String
    valueSet::ValueSetType

    FilterType(name, valueSet) =  new(name, valueSet)
end

type NetworkAclIdSetType
    item::Union(Array{NetworkAclIdSetItemType,1}, Nothing)

    NetworkAclIdSetType() =  new(nothing)
end

type DescribeInstancesInfoType
    item::Union(Array{DescribeInstancesItemType,1}, Nothing)

    DescribeInstancesInfoType() =  new(nothing)
end

type ImportInstanceGroupSetType
    item::Union(Array{ImportInstanceGroupItemType,1}, Nothing)

    ImportInstanceGroupSetType() =  new(nothing)
end

type MonitorInstancesSetType
    item::Array{MonitorInstancesSetItemType,1}

    MonitorInstancesSetType(item) =  new(item)
end

type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::String
    instanceCount::Int32
    limitPrice::Union(ReservedInstanceLimitPriceType, Nothing)

    PurchaseReservedInstancesOfferingType(reservedInstancesOfferingId, instanceCount) =  new(reservedInstancesOfferingId, instanceCount, nothing)
end

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

type CreateImageType
    instanceId::String
    name::String
    description::Union(String, Nothing)
    noReboot::Union(Bool, Nothing)
    blockDeviceMapping::Union(BlockDeviceMappingType, Nothing)

    CreateImageType(instanceId, name) =  new(instanceId, name, nothing, nothing, nothing)
end

type PropagatingVgwSetType
    item::Union(Array{PropagatingVgwType,1}, Nothing)

    PropagatingVgwSetType() =  new(nothing)
end

type AttachmentSetResponseType
    item::Union(Array{AttachmentSetItemResponseType,1}, Nothing)

    AttachmentSetResponseType() =  new(nothing)
end

type StartInstancesType
    instancesSet::InstanceIdSetType

    StartInstancesType(instancesSet) =  new(instancesSet)
end

type PricingDetailsSetType
    item::Union(Array{PricingDetailsSetItemType,1}, Nothing)

    PricingDetailsSetType() =  new(nothing)
end

type ProductCodeListType
    item::Union(Array{ProductCodeItemType,1}, Nothing)

    ProductCodeListType() =  new(nothing)
end

type DescribeSpotDatafeedSubscriptionResponseType
    requestId::String
    spotDatafeedSubscription::SpotDatafeedSubscriptionType

    DescribeSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) =  new(requestId, spotDatafeedSubscription)
end

type DescribeSnapshotsOwnersType
    item::Union(Array{DescribeSnapshotsOwnerType,1}, Nothing)

    DescribeSnapshotsOwnersType() =  new(nothing)
end

type CreateSpotDatafeedSubscriptionResponseType
    requestId::String
    spotDatafeedSubscription::SpotDatafeedSubscriptionType

    CreateSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) =  new(requestId, spotDatafeedSubscription)
end

type DescribeSecurityGroupsIdSetType
    item::Union(Array{DescribeSecurityGroupsIdSetItemType,1}, Nothing)

    DescribeSecurityGroupsIdSetType() =  new(nothing)
end

type DescribeReservedInstancesSetType
    item::Union(Array{DescribeReservedInstancesSetItemType,1}, Nothing)

    DescribeReservedInstancesSetType() =  new(nothing)
end

type AccountAttributeSetItemType
    attributeName::String
    attributeValueSet::AccountAttributeValueSetType

    AccountAttributeSetItemType(attributeName, attributeValueSet) =  new(attributeName, attributeValueSet)
end

type FilterSetType
    item::Union(Array{FilterType,1}, Nothing)

    FilterSetType() =  new(nothing)
end

type AvailabilityZoneSetType
    item::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    AvailabilityZoneSetType() =  new(nothing)
end

type InstanceStateChangeType
    instanceId::String
    currentState::InstanceStateType
    previousState::InstanceStateType

    InstanceStateChangeType(instanceId, currentState, previousState) =  new(instanceId, currentState, previousState)
end

type ReportInstanceStatusReasonCodesSetType
    item::Array{ReportInstanceStatusReasonCodeSetItemType,1}

    ReportInstanceStatusReasonCodesSetType(item) =  new(item)
end

type DescribeBundleTasksType
    bundlesSet::DescribeBundleTasksInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeBundleTasksType(bundlesSet) =  new(bundlesSet, nothing)
end

type DescribeRouteTablesType
    routeTableIdSet::RouteTableIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeRouteTablesType(routeTableIdSet) =  new(routeTableIdSet, nothing)
end

type DescribePlacementGroupsInfoType
    item::Union(Array{DescribePlacementGroupItemType,1}, Nothing)

    DescribePlacementGroupsInfoType() =  new(nothing)
end

type DescribeSecurityGroupsType
    securityGroupSet::DescribeSecurityGroupsSetType
    securityGroupIdSet::Union(DescribeSecurityGroupsIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSecurityGroupsType(securityGroupSet) =  new(securityGroupSet, nothing, nothing)
end

type CancelBundleTaskResponseType
    requestId::String
    bundleInstanceTask::BundleInstanceTaskType

    CancelBundleTaskResponseType(requestId, bundleInstanceTask) =  new(requestId, bundleInstanceTask)
end

type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::String
    privateDnsName::Union(String, Nothing)
    primary::Bool
    association::Union(NetworkInterfaceAssociationType, Nothing)

    NetworkInterfacePrivateIpAddressesSetItemType(privateIpAddress, primary) =  new(privateIpAddress, nothing, primary, nothing)
end

type InstanceTypeSetType
    item::Array{InstanceTypeSetItemType,1}

    InstanceTypeSetType(item) =  new(item)
end

type DiskImageType
    image::DiskImageDetailType
    description::Union(String, Nothing)
    volume::DiskImageVolumeType

    DiskImageType(image, volume) =  new(image, nothing, volume)
end

type AccountAttributeSetType
    item::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    AccountAttributeSetType() =  new(nothing)
end

type UserIdGroupPairSetType
    item::Union(Array{UserIdGroupPairType,1}, Nothing)

    UserIdGroupPairSetType() =  new(nothing)
end

type ResourceTagSetType
    item::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ResourceTagSetType() =  new(nothing)
end

type NetworkAclEntrySetType
    item::Union(Array{NetworkAclEntryType,1}, Nothing)

    NetworkAclEntrySetType() =  new(nothing)
end

type LaunchPermissionListType
    item::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionListType() =  new(nothing)
end

type SecurityGroupIdSetType
    item::Union(Array{SecurityGroupIdSetItemType,1}, Nothing)

    SecurityGroupIdSetType() =  new(nothing)
end

type InternetGatewayAttachmentSetType
    item::Union(Array{InternetGatewayAttachmentType,1}, Nothing)

    InternetGatewayAttachmentSetType() =  new(nothing)
end

type ConversionTaskType
    conversionTaskId::String
    expirationTime::Union(String, Nothing)
    state::String
    statusMessage::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    ConversionTaskType(conversionTaskId, state) =  new(conversionTaskId, nothing, state, nothing, nothing)
end

type VolumeStatusDetailsSetType
    item::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusDetailsSetType() =  new(nothing)
end

type AttachVpnGatewayResponseType
    requestId::String
    attachment::AttachmentType

    AttachVpnGatewayResponseType(requestId, attachment) =  new(requestId, attachment)
end

type MonitorInstancesResponseSetItemType
    instanceId::String
    monitoring::InstanceMonitoringStateType

    MonitorInstancesResponseSetItemType(instanceId, monitoring) =  new(instanceId, monitoring)
end

type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union(String, Nothing)
    privateDnsName::Union(String, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)

    InstancePrivateIpAddressesSetItemType() =  new(nothing, nothing, nothing, nothing)
end

type RouteSetType
    item::Union(Array{RouteType,1}, Nothing)

    RouteSetType() =  new(nothing)
end

type PrivateIpAddressesSetRequestType
    item::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)

    PrivateIpAddressesSetRequestType() =  new(nothing)
end

type ImportInstanceVolumeDetailSetType
    item::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)

    ImportInstanceVolumeDetailSetType() =  new(nothing)
end

type DhcpOptionsIdSetType
    item::Union(Array{DhcpOptionsIdSetItemType,1}, Nothing)

    DhcpOptionsIdSetType() =  new(nothing)
end

type DescribeRegionsType
    regionSet::DescribeRegionsSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeRegionsType(regionSet) =  new(regionSet, nothing)
end

type BundleInstanceType
    instanceId::String
    storage::BundleInstanceTaskStorageType

    BundleInstanceType(instanceId, storage) =  new(instanceId, storage)
end

type ImportInstanceResponseType
    requestId::String
    conversionTask::ConversionTaskType

    ImportInstanceResponseType(requestId, conversionTask) =  new(requestId, conversionTask)
end

type DescribeAddressesResponseType
    requestId::String
    addressesSet::DescribeAddressesResponseInfoType

    DescribeAddressesResponseType(requestId, addressesSet) =  new(requestId, addressesSet)
end

type CancelSpotInstanceRequestsResponseSetType
    item::Array{CancelSpotInstanceRequestsResponseSetItemType,1}

    CancelSpotInstanceRequestsResponseSetType(item) =  new(item)
end

type DhcpValueSetType
    item::Union(Array{DhcpValueType,1}, Nothing)

    DhcpValueSetType() =  new(nothing)
end

type CreateVolumePermissionListType
    item::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionListType() =  new(nothing)
end

type AccountAttributeNameSetType
    item::Union(Array{AccountAttributeNameSetItemType,1}, Nothing)

    AccountAttributeNameSetType() =  new(nothing)
end

type DhcpConfigurationItemType
    key::String
    valueSet::DhcpValueSetType

    DhcpConfigurationItemType(key, valueSet) =  new(key, valueSet)
end

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

type DescribeInstancesType
    instancesSet::DescribeInstancesInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeInstancesType(instancesSet) =  new(instancesSet, nothing)
end

type DescribeAvailabilityZonesResponseType
    requestId::String
    availabilityZoneInfo::AvailabilityZoneSetType

    DescribeAvailabilityZonesResponseType(requestId, availabilityZoneInfo) =  new(requestId, availabilityZoneInfo)
end

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

type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union(DescribeReservedInstancesListingSetType, Nothing)
    reservedInstancesSet::Union(DescribeReservedInstancesSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeReservedInstancesListingsType() =  new(nothing, nothing, nothing)
end

type DescribeVolumesSetItemResponseType
    volumeId::String
    size::String
    snapshotId::String
    availabilityZone::String
    status::String
    createTime::DateTime
    attachmentSet::AttachmentSetResponseType
    tagSet::Union(ResourceTagSetType, Nothing)
    volumeType::String
    iops::Union(Int32, Nothing)

    DescribeVolumesSetItemResponseType(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, volumeType) =  new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, nothing, volumeType, nothing)
end

type ReportInstanceStatusType
    instancesSet::InstanceIdSetType
    status::String
    startTime::Union(DateTime, Nothing)
    endTime::Union(DateTime, Nothing)
    reasonCodesSet::ReportInstanceStatusReasonCodesSetType
    description::Union(String, Nothing)

    ReportInstanceStatusType(instancesSet, status, reasonCodesSet) =  new(instancesSet, status, nothing, nothing, reasonCodesSet, nothing)
end

type IpPermissionType
    ipProtocol::String
    fromPort::Union(Int32, Nothing)
    toPort::Union(Int32, Nothing)
    groups::UserIdGroupPairSetType
    ipRanges::IpRangeSetType

    IpPermissionType(ipProtocol, groups, ipRanges) =  new(ipProtocol, nothing, nothing, groups, ipRanges)
end

type DescribeTagsType
    filterSet::Union(FilterSetType, Nothing)

    DescribeTagsType() =  new(nothing)
end

type DescribeInternetGatewaysType
    internetGatewayIdSet::InternetGatewayIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeInternetGatewaysType(internetGatewayIdSet) =  new(internetGatewayIdSet, nothing)
end

type DescribeSpotPriceHistoryResponseType
    requestId::String
    spotPriceHistorySet::SpotPriceHistorySetType
    nextToken::Union(String, Nothing)

    DescribeSpotPriceHistoryResponseType(requestId, spotPriceHistorySet) =  new(requestId, spotPriceHistorySet, nothing)
end

type CreateVolumePermissionOperationType
    add::Union(CreateVolumePermissionListType, Nothing)
    remove::Union(CreateVolumePermissionListType, Nothing)

    CreateVolumePermissionOperationType() =  new(nothing, nothing)
end

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

type DescribeAccountAttributesResponseType
    requestId::String
    accountAttributeSet::Union(AccountAttributeSetType, Nothing)

    DescribeAccountAttributesResponseType(requestId) =  new(requestId, nothing)
end

type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::SpotInstanceRequestIdSetType

    CancelSpotInstanceRequestsType(spotInstanceRequestIdSet) =  new(spotInstanceRequestIdSet)
end

type LicenseSetItemType
    licenseId::String
    type::String
    pool::String
    capacitySet::LicenseCapacitySetType
    tagSet::Union(ResourceTagSetType, Nothing)

    LicenseSetItemType(licenseId, type, pool, capacitySet) =  new(licenseId, type, pool, capacitySet, nothing)
end

type DescribeVolumesType
    volumeSet::DescribeVolumesSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeVolumesType(volumeSet) =  new(volumeSet, nothing)
end

type DescribeVolumeStatusType
    volumeSet::DescribeVolumesSetType
    filterSet::Union(FilterSetType, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(String, Nothing)

    DescribeVolumeStatusType(volumeSet) =  new(volumeSet, nothing, nothing, nothing)
end

type VpcSetType
    item::Union(Array{VpcType,1}, Nothing)

    VpcSetType() =  new(nothing)
end

type TerminateInstancesType
    instancesSet::InstanceIdSetType

    TerminateInstancesType(instancesSet) =  new(instancesSet)
end

type VpnGatewayType
    vpnGatewayId::String
    state::String
    type::String
    availabilityZone::Union(String, Nothing)
    attachments::AttachmentSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    VpnGatewayType(vpnGatewayId, state, type, attachments) =  new(vpnGatewayId, state, type, nothing, attachments, nothing)
end

type DescribeAddressesType
    publicIpsSet::DescribeAddressesInfoType
    allocationIdsSet::AllocationIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeAddressesType(publicIpsSet, allocationIdsSet) =  new(publicIpsSet, allocationIdsSet, nothing)
end

type DescribeSubnetsType
    subnetSet::Union(SubnetIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSubnetsType() =  new(nothing, nothing)
end

type InstanceStateChangeSetType
    item::Union(Array{InstanceStateChangeType,1}, Nothing)

    InstanceStateChangeSetType() =  new(nothing)
end

type DescribeVolumesSetResponseType
    item::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesSetResponseType() =  new(nothing)
end

type ModifySnapshotAttributeType
    snapshotId::String
    createVolumePermission::CreateVolumePermissionOperationType

    ModifySnapshotAttributeType(snapshotId, createVolumePermission) =  new(snapshotId, createVolumePermission)
end

type DescribeVpcsResponseType
    requestId::String
    vpcSet::VpcSetType

    DescribeVpcsResponseType(requestId, vpcSet) =  new(requestId, vpcSet)
end

type DescribeSpotPriceHistoryType
    startTime::Union(DateTime, Nothing)
    endTime::Union(DateTime, Nothing)
    instanceTypeSet::Union(InstanceTypeSetType, Nothing)
    productDescriptionSet::Union(ProductDescriptionSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)
    availabilityZone::Union(String, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(String, Nothing)

    DescribeSpotPriceHistoryType() =  new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end

type DescribeVpnGatewaysType
    vpnGatewaySet::Union(VpnGatewayIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpnGatewaysType() =  new(nothing, nothing)
end

type StopInstancesType
    instancesSet::InstanceIdSetType
    force::Union(Bool, Nothing)

    StopInstancesType(instancesSet) =  new(instancesSet, nothing)
end

type BundleInstanceTasksSetType
    item::Union(Array{BundleInstanceTaskType,1}, Nothing)

    BundleInstanceTasksSetType() =  new(nothing)
end

type DescribeNetworkAclsType
    networkAclIdSet::NetworkAclIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeNetworkAclsType(networkAclIdSet) =  new(networkAclIdSet, nothing)
end

type UnassignPrivateIpAddressesType
    networkInterfaceId::String
    privateIpAddressesSet::AssignPrivateIpAddressesSetRequestType

    UnassignPrivateIpAddressesType(networkInterfaceId, privateIpAddressesSet) =  new(networkInterfaceId, privateIpAddressesSet)
end

type DescribeReservedInstancesType
    reservedInstancesSet::Union(DescribeReservedInstancesSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)
    offeringType::Union(String, Nothing)

    DescribeReservedInstancesType() =  new(nothing, nothing, nothing)
end

type CustomerGatewayType
    customerGatewayId::String
    state::String
    type::String
    ipAddress::String
    bgpAsn::Union(Int32, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    CustomerGatewayType(customerGatewayId, state, type, ipAddress) =  new(customerGatewayId, state, type, ipAddress, nothing, nothing)
end

type CreateSubnetResponseType
    requestId::String
    subnet::SubnetType

    CreateSubnetResponseType(requestId, subnet) =  new(requestId, subnet)
end

type TerminateInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    TerminateInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end

type MonitorInstancesType
    instancesSet::MonitorInstancesSetType

    MonitorInstancesType(instancesSet) =  new(instancesSet)
end

type DescribeBundleTasksResponseType
    requestId::String
    bundleInstanceTasksSet::BundleInstanceTasksSetType

    DescribeBundleTasksResponseType(requestId, bundleInstanceTasksSet) =  new(requestId, bundleInstanceTasksSet)
end

type VolumeStatusInfoType
    status::String
    details::VolumeStatusDetailsSetType

    VolumeStatusInfoType(status, details) =  new(status, details)
end

type StopInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    StopInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end

type DescribeSnapshotsSetItemResponseType
    snapshotId::String
    volumeId::String
    status::String
    startTime::DateTime
    progress::String
    ownerId::String
    volumeSize::String
    description::Union(String, Nothing)
    ownerAlias::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)

    DescribeSnapshotsSetItemResponseType(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize) =  new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, nothing, nothing, nothing)
end

type InternetGatewayType
    internetGatewayId::String
    attachmentSet::InternetGatewayAttachmentSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    InternetGatewayType(internetGatewayId, attachmentSet) =  new(internetGatewayId, attachmentSet, nothing)
end

type DescribeAccountAttributesType
    accountAttributeNameSet::Union(AccountAttributeNameSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeAccountAttributesType() =  new(nothing, nothing)
end

type CreateVpcResponseType
    requestId::String
    vpc::VpcType

    CreateVpcResponseType(requestId, vpc) =  new(requestId, vpc)
end

type CustomerGatewaySetType
    item::Union(Array{CustomerGatewayType,1}, Nothing)

    CustomerGatewaySetType() =  new(nothing)
end

type LaunchPermissionOperationType
    add::Union(LaunchPermissionListType, Nothing)
    remove::Union(LaunchPermissionListType, Nothing)

    LaunchPermissionOperationType() =  new(nothing, nothing)
end

type VpnGatewaySetType
    item::Union(Array{VpnGatewayType,1}, Nothing)

    VpnGatewaySetType() =  new(nothing)
end

type DescribePlacementGroupsType
    placementGroupSet::DescribePlacementGroupsInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribePlacementGroupsType(placementGroupSet) =  new(placementGroupSet, nothing)
end

type DescribeVpnConnectionsType
    vpnConnectionSet::Union(VpnConnectionIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpnConnectionsType() =  new(nothing, nothing)
end

type RouteTableType
    routeTableId::String
    vpcId::String
    routeSet::RouteSetType
    associationSet::RouteTableAssociationSetType
    propagatingVgwSet::PropagatingVgwSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    RouteTableType(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet) =  new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, nothing)
end

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

type DiskImageSetType
    item::Union(Array{DiskImageType,1}, Nothing)

    DiskImageSetType() =  new(nothing)
end

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

type VpnConnectionType
    vpnConnectionId::String
    state::String
    customerGatewayConfiguration::Union(String, Nothing)
    type::Union(String, Nothing)
    customerGatewayId::String
    vpnGatewayId::String
    tagSet::Union(ResourceTagSetType, Nothing)
    vgwTelemetry::Union(VgwTelemetryType, Nothing)
    options::Union(VpnConnectionOptionsResponseType, Nothing)
    routes::Union(VpnStaticRoutesSetType, Nothing)

    VpnConnectionType(vpnConnectionId, state, customerGatewayId, vpnGatewayId) =  new(vpnConnectionId, state, nothing, nothing, customerGatewayId, vpnGatewayId, nothing, nothing, nothing, nothing)
end

type CreateTagsType
    resourcesSet::ResourceIdSetType
    tagSet::ResourceTagSetType

    CreateTagsType(resourcesSet, tagSet) =  new(resourcesSet, tagSet)
end

type ConversionTaskSetType
    item::Union(Array{ConversionTaskType,1}, Nothing)

    ConversionTaskSetType() =  new(nothing)
end

type DescribeDhcpOptionsType
    dhcpOptionsSet::Union(DhcpOptionsIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeDhcpOptionsType() =  new(nothing, nothing)
end

type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::SpotInstanceRequestIdSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeSpotInstanceRequestsType(spotInstanceRequestIdSet) =  new(spotInstanceRequestIdSet, nothing)
end

type InternetGatewaySetType
    item::Union(Array{InternetGatewayType,1}, Nothing)

    InternetGatewaySetType() =  new(nothing)
end

type DescribeImagesType
    executableBySet::Union(DescribeImagesExecutableBySetType, Nothing)
    imagesSet::DescribeImagesInfoType
    ownersSet::Union(DescribeImagesOwnersType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeImagesType(imagesSet) =  new(nothing, imagesSet, nothing, nothing)
end

type DescribeCustomerGatewaysType
    customerGatewaySet::Union(CustomerGatewayIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeCustomerGatewaysType() =  new(nothing, nothing)
end

type InstancePrivateIpAddressesSetType
    item::Union(Array{InstancePrivateIpAddressesSetItemType,1}, Nothing)

    InstancePrivateIpAddressesSetType() =  new(nothing)
end

type DescribeVpcsType
    vpcSet::Union(VpcIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeVpcsType() =  new(nothing, nothing)
end

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

type DescribeSnapshotsSetResponseType
    item::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsSetResponseType() =  new(nothing)
end

type DescribeAvailabilityZonesType
    availabilityZoneSet::DescribeAvailabilityZonesSetType
    filterSet::Union(FilterSetType, Nothing)

    DescribeAvailabilityZonesType(availabilityZoneSet) =  new(availabilityZoneSet, nothing)
end

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

type StartInstancesResponseType
    requestId::String
    instancesSet::InstanceStateChangeSetType

    StartInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end

type ImportInstanceTaskDetailsType
    volumes::ImportInstanceVolumeDetailSetType
    instanceId::Union(String, Nothing)
    platform::Union(String, Nothing)
    description::Union(String, Nothing)

    ImportInstanceTaskDetailsType(volumes) =  new(volumes, nothing, nothing, nothing)
end

type ImportVolumeResponseType
    requestId::String
    conversionTask::ConversionTaskType

    ImportVolumeResponseType(requestId, conversionTask) =  new(requestId, conversionTask)
end

type MonitorInstancesResponseSetType
    item::Array{MonitorInstancesResponseSetItemType,1}

    MonitorInstancesResponseSetType(item) =  new(item)
end

type LicenseSetType
    item::Union(Array{LicenseSetItemType,1}, Nothing)

    LicenseSetType() =  new(nothing)
end

type CreateNetworkInterfaceType
    subnetId::String
    description::Union(String, Nothing)
    privateIpAddress::Union(String, Nothing)
    groupSet::Union(SecurityGroupIdSetType, Nothing)
    privateIpAddressesSet::Union(PrivateIpAddressesSetRequestType, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    CreateNetworkInterfaceType(subnetId) =  new(subnetId, nothing, nothing, nothing, nothing, nothing)
end

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

type NetworkInterfacePrivateIpAddressesSetType
    item::Union(Array{NetworkInterfacePrivateIpAddressesSetItemType,1}, Nothing)

    NetworkInterfacePrivateIpAddressesSetType() =  new(nothing)
end

type DescribeImagesResponseInfoType
    item::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseInfoType() =  new(nothing)
end

type CancelSpotInstanceRequestsResponseType
    requestId::String
    spotInstanceRequestSet::CancelSpotInstanceRequestsResponseSetType

    CancelSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end

type MonitorInstancesResponseType
    requestId::String
    instancesSet::MonitorInstancesResponseSetType

    MonitorInstancesResponseType(requestId, instancesSet) =  new(requestId, instancesSet)
end

type DescribeConversionTasksType
    conversionTaskIdSet::ConversionTaskIdSetType

    DescribeConversionTasksType(conversionTaskIdSet) =  new(conversionTaskIdSet)
end

type NetworkAclType
    networkAclId::String
    vpcId::String
    default::Bool
    entrySet::NetworkAclEntrySetType
    associationSet::NetworkAclAssociationSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    NetworkAclType(networkAclId, vpcId, default, entrySet, associationSet) =  new(networkAclId, vpcId, default, entrySet, associationSet, nothing)
end

type RouteTableSetType
    item::Union(Array{RouteTableType,1}, Nothing)

    RouteTableSetType() =  new(nothing)
end

type CreateVpnGatewayResponseType
    requestId::String
    vpnGateway::VpnGatewayType

    CreateVpnGatewayResponseType(requestId, vpnGateway) =  new(requestId, vpnGateway)
end

type DeleteTagsType
    resourcesSet::ResourceIdSetType
    tagSet::DeleteTagsSetType

    DeleteTagsType(resourcesSet, tagSet) =  new(resourcesSet, tagSet)
end

type DhcpConfigurationItemSetType
    item::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    DhcpConfigurationItemSetType() =  new(nothing)
end

type InstanceStatusType
    status::String
    details::Union(InstanceStatusDetailsSetType, Nothing)

    InstanceStatusType(status) =  new(status, nothing)
end

type DescribeRouteTablesResponseType
    requestId::String
    routeTableSet::RouteTableSetType

    DescribeRouteTablesResponseType(requestId, routeTableSet) =  new(requestId, routeTableSet)
end

type AssignPrivateIpAddressesType
    networkInterfaceId::String
    privateIpAddressesSet::Union(AssignPrivateIpAddressesSetRequestType, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)
    allowReassignment::Union(Bool, Nothing)

    AssignPrivateIpAddressesType(networkInterfaceId) =  new(networkInterfaceId, nothing, nothing, nothing)
end

type BundleInstanceResponseType
    requestId::String
    bundleInstanceTask::BundleInstanceTaskType

    BundleInstanceResponseType(requestId, bundleInstanceTask) =  new(requestId, bundleInstanceTask)
end

type DescribeInternetGatewaysResponseType
    requestId::String
    internetGatewaySet::InternetGatewaySetType

    DescribeInternetGatewaysResponseType(requestId, internetGatewaySet) =  new(requestId, internetGatewaySet)
end

type DescribeTagsResponseType
    requestId::String
    tagSet::TagSetType

    DescribeTagsResponseType(requestId, tagSet) =  new(requestId, tagSet)
end

type SubnetSetType
    item::Union(Array{SubnetType,1}, Nothing)

    SubnetSetType() =  new(nothing)
end

type DescribeInstanceStatusType
    instancesSet::InstanceIdSetType
    filterSet::Union(FilterSetType, Nothing)
    nextToken::Union(String, Nothing)
    maxResults::Union(Int32, Nothing)
    includeAllInstances::Union(Bool, Nothing)

    DescribeInstanceStatusType(instancesSet) =  new(instancesSet, nothing, nothing, nothing, nothing)
end

type DescribeKeyPairsType
    keySet::DescribeKeyPairsInfoType
    filterSet::Union(FilterSetType, Nothing)

    DescribeKeyPairsType(keySet) =  new(keySet, nothing)
end

type VpnConnectionSetType
    item::Union(Array{VpnConnectionType,1}, Nothing)

    VpnConnectionSetType() =  new(nothing)
end

type DescribeSubnetsResponseType
    requestId::String
    subnetSet::SubnetSetType

    DescribeSubnetsResponseType(requestId, subnetSet) =  new(requestId, subnetSet)
end

type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union(NetworkInterfaceIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeNetworkInterfacesType() =  new(nothing, nothing)
end

type IpPermissionSetType
    item::Union(Array{IpPermissionType,1}, Nothing)

    IpPermissionSetType() =  new(nothing)
end

type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::String
    reservedInstancesId::String
    createDate::DateTime
    updateDate::DateTime
    status::String
    statusMessage::String
    instanceCounts::InstanceCountsSetType
    priceSchedules::PriceScheduleSetType
    tagSet::Union(ResourceTagSetType, Nothing)
    clientToken::Union(String, Nothing)

    DescribeReservedInstancesListingsResponseSetItemType(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules) =  new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, nothing, nothing)
end

type DescribeLicensesType
    licenseIdSet::Union(LicenseIdSetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeLicensesType() =  new(nothing, nothing)
end

type DescribeSnapshotsType
    snapshotSet::DescribeSnapshotsSetType
    ownersSet::Union(DescribeSnapshotsOwnersType, Nothing)
    restorableBySet::Union(DescribeSnapshotsRestorableBySetType, Nothing)
    filterSet::Union(FilterSetType, Nothing)

    DescribeSnapshotsType(snapshotSet) =  new(snapshotSet, nothing, nothing, nothing)
end

type CreateRouteTableResponseType
    requestId::String
    routeTable::RouteTableType

    CreateRouteTableResponseType(requestId, routeTable) =  new(requestId, routeTable)
end

type DescribeExportTasksType
    exportTaskIdSet::ExportTaskIdSetType

    DescribeExportTasksType(exportTaskIdSet) =  new(exportTaskIdSet)
end

type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::String
    instanceType::String
    availabilityZone::String
    start::DateTime
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

type DescribeConversionTasksResponseType
    requestId::String
    conversionTasks::ConversionTaskSetType

    DescribeConversionTasksResponseType(requestId, conversionTasks) =  new(requestId, conversionTasks)
end

type DescribeCustomerGatewaysResponseType
    requestId::String
    customerGatewaySet::CustomerGatewaySetType

    DescribeCustomerGatewaysResponseType(requestId, customerGatewaySet) =  new(requestId, customerGatewaySet)
end

type InstanceStatusItemType
    instanceId::String
    availabilityZone::String
    eventsSet::Union(InstanceStatusEventsSetType, Nothing)
    instanceState::InstanceStateType
    systemStatus::InstanceStatusType
    instanceStatus::InstanceStatusType

    InstanceStatusItemType(instanceId, availabilityZone, instanceState, systemStatus, instanceStatus) =  new(instanceId, availabilityZone, nothing, instanceState, systemStatus, instanceStatus)
end

type DescribeReservedInstancesResponseSetType
    item::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseSetType() =  new(nothing)
end

type DescribeVpnConnectionsResponseType
    requestId::String
    vpnConnectionSet::VpnConnectionSetType

    DescribeVpnConnectionsResponseType(requestId, vpnConnectionSet) =  new(requestId, vpnConnectionSet)
end

type CreateNetworkAclResponseType
    requestId::String
    networkAcl::NetworkAclType

    CreateNetworkAclResponseType(requestId, networkAcl) =  new(requestId, networkAcl)
end

type VolumeStatusItemType
    volumeId::String
    availabilityZone::String
    volumeStatus::VolumeStatusInfoType
    eventsSet::VolumeStatusEventsSetType
    actionsSet::VolumeStatusActionsSetType

    VolumeStatusItemType(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet) =  new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end

type VolumeStatusSetType
    item::Union(Array{VolumeStatusItemType,1}, Nothing)

    VolumeStatusSetType() =  new(nothing)
end

type DescribeLicensesResponseType
    requestId::String
    licenseSet::LicenseSetType

    DescribeLicensesResponseType(requestId, licenseSet) =  new(requestId, licenseSet)
end

type ImportInstanceType
    description::Union(String, Nothing)
    launchSpecification::ImportInstanceLaunchSpecificationType
    diskImageSet::DiskImageSetType
    keepPartialImports::Union(Bool, Nothing)
    platform::String

    ImportInstanceType(launchSpecification, diskImageSet, platform) =  new(nothing, launchSpecification, diskImageSet, nothing, platform)
end

type DescribeVolumesResponseType
    requestId::String
    volumeSet::DescribeVolumesSetResponseType

    DescribeVolumesResponseType(requestId, volumeSet) =  new(requestId, volumeSet)
end

type CreateDhcpOptionsType
    dhcpConfigurationSet::DhcpConfigurationItemSetType

    CreateDhcpOptionsType(dhcpConfigurationSet) =  new(dhcpConfigurationSet)
end

type CreateCustomerGatewayResponseType
    requestId::String
    customerGateway::CustomerGatewayType

    CreateCustomerGatewayResponseType(requestId, customerGateway) =  new(requestId, customerGateway)
end

type DescribeReservedInstancesListingsResponseSetType
    item::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseSetType() =  new(nothing)
end

type DescribeReservedInstancesOfferingsResponseSetType
    item::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetType() =  new(nothing)
end

type DescribeSnapshotsResponseType
    requestId::String
    snapshotSet::DescribeSnapshotsSetResponseType

    DescribeSnapshotsResponseType(requestId, snapshotSet) =  new(requestId, snapshotSet)
end

type CreateInternetGatewayResponseType
    requestId::String
    internetGateway::InternetGatewayType

    CreateInternetGatewayResponseType(requestId, internetGateway) =  new(requestId, internetGateway)
end

type RevokeSecurityGroupEgressType
    groupId::String
    ipPermissions::IpPermissionSetType

    RevokeSecurityGroupEgressType(groupId, ipPermissions) =  new(groupId, ipPermissions)
end

type CreateVpnConnectionResponseType
    requestId::String
    vpnConnection::VpnConnectionType

    CreateVpnConnectionResponseType(requestId, vpnConnection) =  new(requestId, vpnConnection)
end

type CancelReservedInstancesListingResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    CancelReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end

type DhcpOptionsType
    dhcpOptionsId::String
    dhcpConfigurationSet::DhcpConfigurationItemSetType
    tagSet::Union(ResourceTagSetType, Nothing)

    DhcpOptionsType(dhcpOptionsId, dhcpConfigurationSet) =  new(dhcpOptionsId, dhcpConfigurationSet, nothing)
end

type DescribeVpnGatewaysResponseType
    requestId::String
    vpnGatewaySet::VpnGatewaySetType

    DescribeVpnGatewaysResponseType(requestId, vpnGatewaySet) =  new(requestId, vpnGatewaySet)
end

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

type InstanceNetworkInterfaceSetRequestType
    item::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)

    InstanceNetworkInterfaceSetRequestType() =  new(nothing)
end

type DescribeReservedInstancesListingsResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    DescribeReservedInstancesListingsResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end

type NetworkAclSetType
    item::Union(Array{NetworkAclType,1}, Nothing)

    NetworkAclSetType() =  new(nothing)
end

type DescribeNetworkAclsResponseType
    requestId::String
    networkAclSet::NetworkAclSetType

    DescribeNetworkAclsResponseType(requestId, networkAclSet) =  new(requestId, networkAclSet)
end

type DescribeVolumeStatusResponseType
    requestId::String
    volumeStatusSet::VolumeStatusSetType
    nextToken::Union(String, Nothing)

    DescribeVolumeStatusResponseType(requestId, volumeStatusSet) =  new(requestId, volumeStatusSet, nothing)
end

type DescribeImagesResponseType
    requestId::String
    imagesSet::DescribeImagesResponseInfoType

    DescribeImagesResponseType(requestId, imagesSet) =  new(requestId, imagesSet)
end

type AuthorizeSecurityGroupIngressType
    userId::Union(String, Nothing)
    ipPermissions::IpPermissionSetType

    AuthorizeSecurityGroupIngressType(ipPermissions) =  new(nothing, ipPermissions)
end

type InstanceStatusSetType
    item::Union(Array{InstanceStatusItemType,1}, Nothing)

    InstanceStatusSetType() =  new(nothing)
end

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

type DescribeReservedInstancesResponseType
    requestId::String
    reservedInstancesSet::DescribeReservedInstancesResponseSetType

    DescribeReservedInstancesResponseType(requestId, reservedInstancesSet) =  new(requestId, reservedInstancesSet)
end

type DhcpOptionsSetType
    item::Union(Array{DhcpOptionsType,1}, Nothing)

    DhcpOptionsSetType() =  new(nothing)
end

type CreateReservedInstancesListingResponseType
    requestId::String
    reservedInstancesListingsSet::DescribeReservedInstancesListingsResponseSetType

    CreateReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) =  new(requestId, reservedInstancesListingsSet)
end

type AuthorizeSecurityGroupEgressType
    groupId::String
    ipPermissions::IpPermissionSetType

    AuthorizeSecurityGroupEgressType(groupId, ipPermissions) =  new(groupId, ipPermissions)
end

type DescribeReservedInstancesOfferingsResponseType
    requestId::String
    reservedInstancesOfferingsSet::DescribeReservedInstancesOfferingsResponseSetType
    nextToken::Union(String, Nothing)

    DescribeReservedInstancesOfferingsResponseType(requestId, reservedInstancesOfferingsSet) =  new(requestId, reservedInstancesOfferingsSet, nothing)
end

type RevokeSecurityGroupIngressType
    userId::Union(String, Nothing)
    ipPermissions::IpPermissionSetType

    RevokeSecurityGroupIngressType(ipPermissions) =  new(nothing, ipPermissions)
end

type InstanceNetworkInterfaceSetType
    item::Union(Array{InstanceNetworkInterfaceSetItemType,1}, Nothing)

    InstanceNetworkInterfaceSetType() =  new(nothing)
end

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
    launchTime::DateTime
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

type CreateDhcpOptionsResponseType
    requestId::String
    dhcpOptions::DhcpOptionsType

    CreateDhcpOptionsResponseType(requestId, dhcpOptions) =  new(requestId, dhcpOptions)
end

type NetworkInterfaceSetType
    item::Union(Array{NetworkInterfaceType,1}, Nothing)

    NetworkInterfaceSetType() =  new(nothing)
end

type CreateNetworkInterfaceResponseType
    requestId::String
    networkInterface::NetworkInterfaceType

    CreateNetworkInterfaceResponseType(requestId, networkInterface) =  new(requestId, networkInterface)
end

type DescribeNetworkInterfacesResponseType
    requestId::String
    networkInterfaceSet::NetworkInterfaceSetType

    DescribeNetworkInterfacesResponseType(requestId, networkInterfaceSet) =  new(requestId, networkInterfaceSet)
end

type SecurityGroupSetType
    item::Union(Array{SecurityGroupItemType,1}, Nothing)

    SecurityGroupSetType() =  new(nothing)
end

type RequestSpotInstancesType
    spotPrice::String
    instanceCount::Union(Int, Nothing)
    type::Union(String, Nothing)
    validFrom::Union(DateTime, Nothing)
    validUntil::Union(DateTime, Nothing)
    launchGroup::Union(String, Nothing)
    availabilityZoneGroup::Union(String, Nothing)
    launchSpecification::LaunchSpecificationRequestType

    RequestSpotInstancesType(spotPrice, launchSpecification) =  new(spotPrice, nothing, nothing, nothing, nothing, nothing, nothing, launchSpecification)
end

type DescribeInstanceStatusResponseType
    requestId::String
    instanceStatusSet::InstanceStatusSetType
    nextToken::Union(String, Nothing)

    DescribeInstanceStatusResponseType(requestId, instanceStatusSet) =  new(requestId, instanceStatusSet, nothing)
end

type DescribeDhcpOptionsResponseType
    requestId::String
    dhcpOptionsSet::DhcpOptionsSetType

    DescribeDhcpOptionsResponseType(requestId, dhcpOptionsSet) =  new(requestId, dhcpOptionsSet)
end

type SpotInstanceRequestSetItemType
    spotInstanceRequestId::String
    spotPrice::String
    type::String
    state::String
    fault::Union(SpotInstanceStateFaultType, Nothing)
    status::Union(SpotInstanceStatusMessageType, Nothing)
    validFrom::Union(DateTime, Nothing)
    validUntil::Union(DateTime, Nothing)
    launchGroup::Union(String, Nothing)
    availabilityZoneGroup::Union(String, Nothing)
    launchSpecification::Union(LaunchSpecificationResponseType, Nothing)
    instanceId::Union(String, Nothing)
    createTime::Union(DateTime, Nothing)
    productDescription::Union(String, Nothing)
    tagSet::Union(ResourceTagSetType, Nothing)
    launchedAvailabilityZone::Union(String, Nothing)

    SpotInstanceRequestSetItemType(spotInstanceRequestId, spotPrice, type, state) =  new(spotInstanceRequestId, spotPrice, type, state, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end

type RunningInstancesSetType
    item::Array{RunningInstancesItemType,1}

    RunningInstancesSetType(item) =  new(item)
end

type ReservationInfoType
    reservationId::String
    ownerId::String
    groupSet::GroupSetType
    instancesSet::RunningInstancesSetType
    requesterId::Union(String, Nothing)

    ReservationInfoType(reservationId, ownerId, groupSet, instancesSet) =  new(reservationId, ownerId, groupSet, instancesSet, nothing)
end

type RunInstancesResponseType
    requestId::String
    reservationId::String
    ownerId::String
    groupSet::GroupSetType
    instancesSet::RunningInstancesSetType
    requesterId::Union(String, Nothing)

    RunInstancesResponseType(requestId, reservationId, ownerId, groupSet, instancesSet) =  new(requestId, reservationId, ownerId, groupSet, instancesSet, nothing)
end

type ReservationSetType
    item::Union(Array{ReservationInfoType,1}, Nothing)

    ReservationSetType() =  new(nothing)
end

type SpotInstanceRequestSetType
    item::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    SpotInstanceRequestSetType() =  new(nothing)
end

type DescribeSpotInstanceRequestsResponseType
    requestId::String
    spotInstanceRequestSet::SpotInstanceRequestSetType

    DescribeSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end

type DescribeSecurityGroupsResponseType
    requestId::String
    securityGroupInfo::SecurityGroupSetType

    DescribeSecurityGroupsResponseType(requestId, securityGroupInfo) =  new(requestId, securityGroupInfo)
end

type DescribeInstancesResponseType
    requestId::String
    reservationSet::ReservationSetType

    DescribeInstancesResponseType(requestId, reservationSet) =  new(requestId, reservationSet)
end

type RequestSpotInstancesResponseType
    requestId::String
    spotInstanceRequestSet::SpotInstanceRequestSetType

    RequestSpotInstancesResponseType(requestId, spotInstanceRequestSet) =  new(requestId, spotInstanceRequestSet)
end

