type CreateImageType
    instanceId::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    noReboot::Union(Bool, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)

    CreateImageType(; instanceId=nothing, name=nothing, description=nothing, noReboot=nothing, blockDeviceMapping=nothing) = 
         new(instanceId, name, description, noReboot, blockDeviceMapping)
end
export CreateImageType


type CreateImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CreateImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
export CreateImageResponseType


type RegisterImageType
    imageLocation::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    architecture::Union(ASCIIString, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    rootDeviceName::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)

    RegisterImageType(; imageLocation=nothing, name=nothing, description=nothing, architecture=nothing, kernelId=nothing, ramdiskId=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing) = 
         new(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping)
end
export RegisterImageType


type RegisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    RegisterImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
export RegisterImageResponseType


type DeregisterImageType
    imageId::Union(ASCIIString, Nothing)

    DeregisterImageType(; imageId=nothing) = 
         new(imageId)
end
export DeregisterImageType


type DeregisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeregisterImageResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeregisterImageResponseType


type CreateKeyPairType
    keyName::Union(ASCIIString, Nothing)

    CreateKeyPairType(; keyName=nothing) = 
         new(keyName)
end
export CreateKeyPairType


type CreateKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)
    keyMaterial::Union(ASCIIString, Nothing)

    CreateKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing, keyMaterial=nothing) = 
         new(requestId, keyName, keyFingerprint, keyMaterial)
end
export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::Union(ASCIIString, Nothing)
    publicKeyMaterial::Union(ASCIIString, Nothing)

    ImportKeyPairType(; keyName=nothing, publicKeyMaterial=nothing) = 
         new(keyName, publicKeyMaterial)
end
export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    ImportKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing) = 
         new(requestId, keyName, keyFingerprint)
end
export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::Union(ASCIIString, Nothing)

    DeleteKeyPairType(; keyName=nothing) = 
         new(keyName)
end
export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteKeyPairResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::Union(ASCIIString, Nothing)

    DescribeKeyPairsItemType(; keyName=nothing) = 
         new(keyName)
end
export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    DescribeKeyPairsResponseItemType(; keyName=nothing, keyFingerprint=nothing) = 
         new(keyName, keyFingerprint)
end
export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)

    IamInstanceProfileRequestType(; arn=nothing, name=nothing) = 
         new(arn, name)
end
export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)

    PrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing, primary=nothing) = 
         new(privateIpAddress, primary)
end
export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    ImportInstanceGroupItemType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    GroupItemType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
export GroupItemType


type UserDataType
    data::Union(ASCIIString, Nothing)

    UserDataType(; data=nothing) = 
         new(data)
end
export UserDataType


type BlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    BlockDeviceMappingItemType(; deviceName=nothing) = 
         new(deviceName)
end
export BlockDeviceMappingItemType


type EbsBlockDeviceType
    snapshotId::Union(ASCIIString, Nothing)
    volumeSize::Union(Int32, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    EbsBlockDeviceType(; snapshotId=nothing, volumeSize=nothing, deleteOnTermination=nothing, volumeType=nothing, iops=nothing) = 
         new(snapshotId, volumeSize, deleteOnTermination, volumeType, iops)
end
export EbsBlockDeviceType


type PlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementRequestType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) = 
         new(availabilityZone, groupName, tenancy)
end
export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    SpotPlacementRequestType(; availabilityZone=nothing, groupName=nothing) = 
         new(availabilityZone, groupName)
end
export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    InstancePlacementType(; availabilityZone=nothing, groupName=nothing) = 
         new(availabilityZone, groupName)
end
export InstancePlacementType


type MonitoringInstanceType
    enabled::Union(Bool, Nothing)

    MonitoringInstanceType(; enabled=nothing) = 
         new(enabled)
end
export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseRequestType(; pool=nothing) = 
         new(pool)
end
export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::Union(ASCIIString, Nothing)
    id::Union(ASCIIString, Nothing)

    IamInstanceProfileResponseType(; arn=nothing, id=nothing) = 
         new(arn, id)
end
export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceNetworkInterfaceAttachmentType(; attachmentId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end
export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::Union(ASCIIString, Nothing)
    publicDnsName::Union(ASCIIString, Nothing)
    ipOwnerId::Union(ASCIIString, Nothing)

    InstanceNetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing) = 
         new(publicIp, publicDnsName, ipOwnerId)
end
export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementResponseType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) = 
         new(availabilityZone, groupName, tenancy)
end
export PlacementResponseType


type StateReasonType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    StateReasonType(; code=nothing, message=nothing) = 
         new(code, message)
end
export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingResponseItemType(; deviceName=nothing) = 
         new(deviceName)
end
export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    EbsInstanceBlockDeviceMappingResponseType(; volumeId=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(volumeId, status, attachTime, deleteOnTermination)
end
export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseResponseType(; pool=nothing) = 
         new(pool)
end
export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::Union(ASCIIString, Nothing)

    AccountAttributeNameSetItemType(; attributeName=nothing) = 
         new(attributeName)
end
export AccountAttributeNameSetItemType


type AccountAttributeSetItemType
    attributeName::Union(ASCIIString, Nothing)
    attributeValueSet::Union(Array{ASCIIString,1}, Nothing)

    AccountAttributeSetItemType(; attributeName=nothing, attributeValueSet=nothing) = 
         new(attributeName, attributeValueSet)
end
export AccountAttributeSetItemType


type AccountAttributeValueSetItemType
    attributeValue::Union(ASCIIString, Nothing)

    AccountAttributeValueSetItemType(; attributeValue=nothing) = 
         new(attributeValue)
end
export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeType(; vpcId=nothing) = 
         new(vpcId)
end
export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeResponseType(; requestId=nothing, vpcId=nothing) = 
         new(requestId, vpcId)
end
export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    ModifyVpcAttributeType(; vpcId=nothing) = 
         new(vpcId)
end
export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVpcAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifyVpcAttributeResponseType


type GetConsoleOutputType
    instanceId::Union(ASCIIString, Nothing)

    GetConsoleOutputType(; instanceId=nothing) = 
         new(instanceId)
end
export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    output::Union(ASCIIString, Nothing)

    GetConsoleOutputResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, output=nothing) = 
         new(requestId, instanceId, timestamp, output)
end
export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::Union(ASCIIString, Nothing)

    GetPasswordDataType(; instanceId=nothing) = 
         new(instanceId)
end
export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    passwordData::Union(ASCIIString, Nothing)

    GetPasswordDataResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, passwordData=nothing) = 
         new(requestId, instanceId, timestamp, passwordData)
end
export GetPasswordDataResponseType


type InstanceIdType
    instanceId::Union(ASCIIString, Nothing)

    InstanceIdType(; instanceId=nothing) = 
         new(instanceId)
end
export InstanceIdType


type TerminateInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    TerminateInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
export TerminateInstancesType


type InstanceBlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingItemType(; deviceName=nothing) = 
         new(deviceName)
end
export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceEbsBlockDeviceType(; volumeId=nothing, deleteOnTermination=nothing) = 
         new(volumeId, deleteOnTermination)
end
export InstanceEbsBlockDeviceType


type StopInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    force::Union(Bool, Nothing)

    StopInstancesType(; instancesSet=nothing, force=nothing) = 
         new(instancesSet, force)
end
export StopInstancesType


type StartInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    StartInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
export StartInstancesType


type RebootInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    RebootInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
export RebootInstancesType


type RebootInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    RebootInstancesItemType(; instanceId=nothing) = 
         new(instanceId)
end
export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RebootInstancesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstancesItemType(; instanceId=nothing) = 
         new(instanceId)
end
export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::Union(ASCIIString, Nothing)

    UnavailableResultType(; availabilityZone=nothing) = 
         new(availabilityZone)
end
export UnavailableResultType


type DescribeImagesItemType
    imageId::Union(ASCIIString, Nothing)

    DescribeImagesItemType(; imageId=nothing) = 
         new(imageId)
end
export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeImagesOwnerType(; owner=nothing) = 
         new(owner)
end
export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::Union(ASCIIString, Nothing)

    DescribeImagesExecutableByType(; user=nothing) = 
         new(user)
end
export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::Union(ASCIIString, Nothing)
    groupDescription::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    CreateSecurityGroupType(; groupName=nothing, groupDescription=nothing, vpcId=nothing) = 
         new(groupName, groupDescription, vpcId)
end
export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    groupId::Union(ASCIIString, Nothing)

    CreateSecurityGroupResponseType(; requestId=nothing, _return=nothing, groupId=nothing) = 
         new(requestId, _return, groupId)
end
export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    DeleteSecurityGroupType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSecurityGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsSetItemType(; groupName=nothing) = 
         new(groupName)
end
export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsIdSetItemType(; groupId=nothing) = 
         new(groupId)
end
export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::Union(ASCIIString, Nothing)

    IpRangeItemType(; cidrIp=nothing) = 
         new(cidrIp)
end
export IpRangeItemType


type UserIdGroupPairType
    userId::Union(ASCIIString, Nothing)
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    UserIdGroupPairType(; userId=nothing, groupId=nothing, groupName=nothing) = 
         new(userId, groupId, groupName)
end
export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Union(Int32, Nothing)
    name::Union(ASCIIString, Nothing)

    InstanceStateType(; code=nothing, name=nothing) = 
         new(code, name)
end
export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ModifyInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    SecurityGroupIdSetItemType(; groupId=nothing) = 
         new(groupId)
end
export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyInstanceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ResetInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetInstanceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeResponseType(; requestId=nothing, instanceId=nothing) = 
         new(requestId, instanceId)
end
export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ModifyImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    LaunchPermissionItemType(; userId=nothing, group=nothing) = 
         new(userId, group)
end
export LaunchPermissionItemType


type ProductCodeItemType
    productCode::Union(ASCIIString, Nothing)

    ProductCodeItemType(; productCode=nothing) = 
         new(productCode)
end
export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyImageAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ResetImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetImageAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union(ASCIIString, Nothing)

    NullableAttributeValueType(; value=nothing) = 
         new(value)
end
export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union(Bool, Nothing)

    NullableAttributeBooleanValueType(; value=nothing) = 
         new(value)
end
export NullableAttributeBooleanValueType


type AttributeValueType
    value::Union(ASCIIString, Nothing)

    AttributeValueType(; value=nothing) = 
         new(value)
end
export AttributeValueType


type AttributeBooleanValueType
    value::Union(Bool, Nothing)

    AttributeBooleanValueType(; value=nothing) = 
         new(value)
end
export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceType(; productCode=nothing, instanceId=nothing) = 
         new(productCode, instanceId)
end
export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)

    ProductCodesSetItemType(; productCode=nothing, _type=nothing) = 
         new(productCode, _type)
end
export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    ownerId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceResponseType(; requestId=nothing, _return=nothing, ownerId=nothing) = 
         new(requestId, _return, ownerId)
end
export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::Union(ASCIIString, Nothing)

    DescribeAvailabilityZonesSetItemType(; zoneName=nothing) = 
         new(zoneName)
end
export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::Union(ASCIIString, Nothing)

    AvailabilityZoneMessageType(; message=nothing) = 
         new(message)
end
export AvailabilityZoneMessageType


type AvailabilityZoneItemType
    zoneName::Union(ASCIIString, Nothing)
    zoneState::Union(ASCIIString, Nothing)
    regionName::Union(ASCIIString, Nothing)
    messageSet::Union(Array{ASCIIString,1}, Nothing)

    AvailabilityZoneItemType(; zoneName=nothing, zoneState=nothing, regionName=nothing, messageSet=nothing) = 
         new(zoneName, zoneState, regionName, messageSet)
end
export AvailabilityZoneItemType


type AllocateAddressType
    domain::Union(ASCIIString, Nothing)

    AllocateAddressType(; domain=nothing) = 
         new(domain)
end
export AllocateAddressType


type AllocateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    publicIp::Union(ASCIIString, Nothing)
    domain::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)

    AllocateAddressResponseType(; requestId=nothing, publicIp=nothing, domain=nothing, allocationId=nothing) = 
         new(requestId, publicIp, domain, allocationId)
end
export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)

    ReleaseAddressType(; publicIp=nothing, allocationId=nothing) = 
         new(publicIp, allocationId)
end
export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReleaseAddressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::Union(ASCIIString, Nothing)

    AllocationIdSetItemType(; allocationId=nothing) = 
         new(allocationId)
end
export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::Union(ASCIIString, Nothing)

    DescribeAddressesItemType(; publicIp=nothing) = 
         new(publicIp)
end
export DescribeAddressesItemType


type DescribeAddressesResponseItemType
    publicIp::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)
    domain::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)
    networkInterfaceId::Union(ASCIIString, Nothing)
    networkInterfaceOwnerId::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)

    DescribeAddressesResponseItemType(; publicIp=nothing, allocationId=nothing, domain=nothing, instanceId=nothing, associationId=nothing, networkInterfaceId=nothing, networkInterfaceOwnerId=nothing, privateIpAddress=nothing) = 
         new(publicIp, allocationId, domain, instanceId, associationId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress)
end
export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union(ASCIIString, Nothing)
    allowReassociation::Union(Bool, Nothing)

    AssociateAddressType(; privateIpAddress=nothing, allowReassociation=nothing) = 
         new(privateIpAddress, allowReassociation)
end
export AssociateAddressType


type AssociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateAddressResponseType(; requestId=nothing, _return=nothing, associationId=nothing) = 
         new(requestId, _return, associationId)
end
export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    DisassociateAddressType(; publicIp=nothing, associationId=nothing) = 
         new(publicIp, associationId)
end
export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateAddressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DisassociateAddressResponseType


type CreateVolumeType
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    CreateVolumeType(; size=nothing, snapshotId=nothing, availabilityZone=nothing, volumeType=nothing, iops=nothing) = 
         new(size, snapshotId, availabilityZone, volumeType, iops)
end
export CreateVolumeType


type CreateVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    createTime::Union(XSDateTime, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    CreateVolumeResponseType(; requestId=nothing, volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, volumeType=nothing, iops=nothing) = 
         new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops)
end
export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::Union(ASCIIString, Nothing)

    DeleteVolumeType(; volumeId=nothing) = 
         new(volumeId)
end
export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVolumeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumesSetItemType(; volumeId=nothing) = 
         new(volumeId)
end
export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    AttachmentSetItemResponseType(; volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end
export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)

    AttachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing) = 
         new(volumeId, instanceId, device)
end
export AttachVolumeType


type AttachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)

    AttachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
export AttachVolumeResponseType


type DetachVolumeType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    force::Union(Bool, Nothing)

    DetachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing, force=nothing) = 
         new(volumeId, instanceId, device, force)
end
export DetachVolumeType


type DetachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)

    DetachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CreateSnapshotType(; volumeId=nothing, description=nothing) = 
         new(volumeId, description)
end
export CreateSnapshotType


type CreateSnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(XSDateTime, Nothing)
    progress::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    volumeSize::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CreateSnapshotResponseType(; requestId=nothing, snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing) = 
         new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description)
end
export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::Union(ASCIIString, Nothing)
    sourceSnapshotId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CopySnapshotType(; sourceRegion=nothing, sourceSnapshotId=nothing, description=nothing) = 
         new(sourceRegion, sourceSnapshotId, description)
end
export CopySnapshotType


type CopySnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    CopySnapshotResponseType(; requestId=nothing, snapshotId=nothing) = 
         new(requestId, snapshotId)
end
export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::Union(ASCIIString, Nothing)

    DeleteSnapshotType(; snapshotId=nothing) = 
         new(snapshotId)
end
export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSnapshotResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotsSetItemType(; snapshotId=nothing) = 
         new(snapshotId)
end
export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeSnapshotsOwnerType(; owner=nothing) = 
         new(owner)
end
export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::Union(ASCIIString, Nothing)

    DescribeSnapshotsRestorableByType(; user=nothing) = 
         new(user)
end
export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    CreateVolumePermissionItemType(; userId=nothing, group=nothing) = 
         new(userId, group)
end
export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifySnapshotAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    ResetSnapshotAttributeType(; snapshotId=nothing) = 
         new(snapshotId)
end
export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetSnapshotAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeType(; snapshotId=nothing) = 
         new(snapshotId)
end
export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeResponseType(; requestId=nothing, snapshotId=nothing) = 
         new(requestId, snapshotId)
end
export DescribeSnapshotAttributeResponseType


type BundleInstanceS3StorageType
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)
    awsAccessKeyId::Union(ASCIIString, Nothing)
    uploadPolicy::Union(ASCIIString, Nothing)
    uploadPolicySignature::Union(ASCIIString, Nothing)

    BundleInstanceS3StorageType(; bucket=nothing, prefix=nothing, awsAccessKeyId=nothing, uploadPolicy=nothing, uploadPolicySignature=nothing) = 
         new(bucket, prefix, awsAccessKeyId, uploadPolicy, uploadPolicySignature)
end
export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    BundleInstanceTaskErrorType(; code=nothing, message=nothing) = 
         new(code, message)
end
export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::Union(ASCIIString, Nothing)

    DescribeBundleTasksItemType(; bundleId=nothing) = 
         new(bundleId)
end
export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::Union(ASCIIString, Nothing)

    CancelBundleTaskType(; bundleId=nothing) = 
         new(bundleId)
end
export CancelBundleTaskType


type CopyImageType
    sourceRegion::Union(ASCIIString, Nothing)
    sourceImageId::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    CopyImageType(; sourceRegion=nothing, sourceImageId=nothing, name=nothing, description=nothing, clientToken=nothing) = 
         new(sourceRegion, sourceImageId, name, description, clientToken)
end
export CopyImageType


type CopyImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CopyImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::Union(ASCIIString, Nothing)

    DescribeRegionsSetItemType(; regionName=nothing) = 
         new(regionName)
end
export DescribeRegionsSetItemType


type RegionItemType
    regionName::Union(ASCIIString, Nothing)
    regionEndpoint::Union(ASCIIString, Nothing)

    RegionItemType(; regionName=nothing, regionEndpoint=nothing) = 
         new(regionName, regionEndpoint)
end
export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsSetItemType(; reservedInstancesOfferingId=nothing) = 
         new(reservedInstancesOfferingId)
end
export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::Union(ASCIIString, Nothing)
    amount::Union(Float64, Nothing)

    RecurringChargesSetItemType(; frequency=nothing, amount=nothing) = 
         new(frequency, amount)
end
export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Union(Float64, Nothing)
    count::Union(Int32, Nothing)

    PricingDetailsSetItemType(; price=nothing, count=nothing) = 
         new(price, count)
end
export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    ReservedInstanceLimitPriceType(; amount=nothing, currencyCode=nothing) = 
         new(amount, currencyCode)
end
export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesId::Union(ASCIIString, Nothing)

    PurchaseReservedInstancesOfferingResponseType(; requestId=nothing, reservedInstancesId=nothing) = 
         new(requestId, reservedInstancesId)
end
export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesSetItemType(; reservedInstancesId=nothing) = 
         new(reservedInstancesId)
end
export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Union(Int64, Nothing)
    price::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    PriceScheduleRequestSetItemType(; term=nothing, price=nothing, currencyCode=nothing) = 
         new(term, price, currencyCode)
end
export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    CancelReservedInstancesListingType(; reservedInstancesListingId=nothing) = 
         new(reservedInstancesListingId)
end
export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesListingSetItemType(; reservedInstancesListingId=nothing) = 
         new(reservedInstancesListingId)
end
export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)

    InstanceCountsSetItemType(; state=nothing, instanceCount=nothing) = 
         new(state, instanceCount)
end
export InstanceCountsSetItemType


type PriceScheduleSetItemType
    term::Union(Int64, Nothing)
    price::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)
    active::Union(Bool, Nothing)

    PriceScheduleSetItemType(; term=nothing, price=nothing, currencyCode=nothing, active=nothing) = 
         new(term, price, currencyCode, active)
end
export PriceScheduleSetItemType


type MonitorInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    MonitorInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
export MonitorInstancesType


type MonitorInstancesSetItemType
    instanceId::Union(ASCIIString, Nothing)

    MonitorInstancesSetItemType(; instanceId=nothing) = 
         new(instanceId)
end
export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::Union(ASCIIString, Nothing)

    InstanceMonitoringStateType(; state=nothing) = 
         new(state)
end
export InstanceMonitoringStateType


type AttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    AttachmentType(; vpcId=nothing, state=nothing) = 
         new(vpcId, state)
end
export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsResponseType(; staticRoutesOnly=nothing) = 
         new(staticRoutesOnly)
end
export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::Union(ASCIIString, Nothing)
    source::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    VpnStaticRouteType(; destinationCidrBlock=nothing, source=nothing, state=nothing) = 
         new(destinationCidrBlock, source, state)
end
export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    lastStatusChange::Union(XSDateTime, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    acceptedRouteCount::Union(Int32, Nothing)

    VpnTunnelTelemetryType(; outsideIpAddress=nothing, status=nothing, lastStatusChange=nothing, statusMessage=nothing, acceptedRouteCount=nothing) = 
         new(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount)
end
export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::Union(ASCIIString, Nothing)

    CustomerGatewayIdSetItemType(; customerGatewayId=nothing) = 
         new(customerGatewayId)
end
export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::Union(ASCIIString, Nothing)

    VpnGatewayIdSetItemType(; vpnGatewayId=nothing) = 
         new(vpnGatewayId)
end
export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::Union(ASCIIString, Nothing)

    VpnConnectionIdSetItemType(; vpnConnectionId=nothing) = 
         new(vpnConnectionId)
end
export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::Union(ASCIIString, Nothing)

    VpcIdSetItemType(; vpcId=nothing) = 
         new(vpcId)
end
export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::Union(ASCIIString, Nothing)

    SubnetIdSetItemType(; subnetId=nothing) = 
         new(subnetId)
end
export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DhcpOptionsIdSetItemType(; dhcpOptionsId=nothing) = 
         new(dhcpOptionsId)
end
export DhcpOptionsIdSetItemType


type DhcpConfigurationItemType
    key::Union(ASCIIString, Nothing)
    valueSet::Union(Array{ASCIIString,1}, Nothing)

    DhcpConfigurationItemType(; key=nothing, valueSet=nothing) = 
         new(key, valueSet)
end
export DhcpConfigurationItemType


type DhcpValueType
    value::Union(ASCIIString, Nothing)

    DhcpValueType(; value=nothing) = 
         new(value)
end
export DhcpValueType


type FilterType
    name::Union(ASCIIString, Nothing)
    valueSet::Union(Array{ASCIIString,1}, Nothing)

    FilterType(; name=nothing, valueSet=nothing) = 
         new(name, valueSet)
end
export FilterType


type ValueType
    value::Union(ASCIIString, Nothing)

    ValueType(; value=nothing) = 
         new(value)
end
export ValueType


type CreateCustomerGatewayType
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int32, Nothing)

    CreateCustomerGatewayType(; _type=nothing, ipAddress=nothing, bgpAsn=nothing) = 
         new(_type, ipAddress, bgpAsn)
end
export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)

    DeleteCustomerGatewayType(; customerGatewayId=nothing) = 
         new(customerGatewayId)
end
export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteCustomerGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateVpnGatewayType(; _type=nothing, availabilityZone=nothing) = 
         new(_type, availabilityZone)
end
export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)

    DeleteVpnGatewayType(; vpnGatewayId=nothing) = 
         new(vpnGatewayId)
end
export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsRequestType(; staticRoutesOnly=nothing) = 
         new(staticRoutesOnly)
end
export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) = 
         new(vpnConnectionId, destinationCidrBlock)
end
export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) = 
         new(vpnConnectionId, destinationCidrBlock)
end
export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::Union(ASCIIString, Nothing)

    DeleteVpnConnectionType(; vpnConnectionId=nothing) = 
         new(vpnConnectionId)
end
export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) = 
         new(vpnGatewayId, vpcId)
end
export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) = 
         new(vpnGatewayId, vpcId)
end
export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachVpnGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::Union(ASCIIString, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)

    CreateVpcType(; cidrBlock=nothing, instanceTenancy=nothing) = 
         new(cidrBlock, instanceTenancy)
end
export CreateVpcType


type DeleteVpcType
    vpcId::Union(ASCIIString, Nothing)

    DeleteVpcType(; vpcId=nothing) = 
         new(vpcId)
end
export DeleteVpcType


type DeleteVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpcResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteVpcResponseType


type CreateSubnetType
    vpcId::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateSubnetType(; vpcId=nothing, cidrBlock=nothing, availabilityZone=nothing) = 
         new(vpcId, cidrBlock, availabilityZone)
end
export CreateSubnetType


type DeleteSubnetType
    subnetId::Union(ASCIIString, Nothing)

    DeleteSubnetType(; subnetId=nothing) = 
         new(subnetId)
end
export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSubnetResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DeleteDhcpOptionsType(; dhcpOptionsId=nothing) = 
         new(dhcpOptionsId)
end
export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteDhcpOptionsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AssociateDhcpOptionsType(; dhcpOptionsId=nothing, vpcId=nothing) = 
         new(dhcpOptionsId, vpcId)
end
export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssociateDhcpOptionsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStateFaultType(; code=nothing, message=nothing) = 
         new(code, message)
end
export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union(ASCIIString, Nothing)
    updateTime::Union(XSDateTime, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStatusMessageType(; code=nothing, updateTime=nothing, message=nothing) = 
         new(code, updateTime, message)
end
export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)

    SpotInstanceRequestIdSetItemType(; spotInstanceRequestId=nothing) = 
         new(spotInstanceRequestId)
end
export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Array{ASCIIString,1}, Nothing)

    CancelSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing) = 
         new(spotInstanceRequestIdSet)
end
export CancelSpotInstanceRequestsType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    CancelSpotInstanceRequestsResponseSetItemType(; spotInstanceRequestId=nothing, state=nothing) = 
         new(spotInstanceRequestId, state)
end
export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::Union(ASCIIString, Nothing)

    InstanceTypeSetItemType(; instanceType=nothing) = 
         new(instanceType)
end
export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::Union(ASCIIString, Nothing)

    ProductDescriptionSetItemType(; productDescription=nothing) = 
         new(productDescription)
end
export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::Union(ASCIIString, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    spotPrice::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    SpotPriceHistorySetItemType(; instanceType=nothing, productDescription=nothing, spotPrice=nothing, timestamp=nothing, availabilityZone=nothing) = 
         new(instanceType, productDescription, spotPrice, timestamp, availabilityZone)
end
export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)

    CreateSpotDatafeedSubscriptionType(; bucket=nothing, prefix=nothing) = 
         new(bucket, prefix)
end
export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSpotDatafeedSubscriptionResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::Union(ASCIIString, Nothing)

    LicenseIdSetItemType(; licenseId=nothing) = 
         new(licenseId)
end
export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Union(Int32, Nothing)
    instanceCapacity::Union(Int32, Nothing)
    state::Union(ASCIIString, Nothing)
    earliestAllowedDeactivationTime::Union(XSDateTime, Nothing)

    LicenseCapacitySetItemType(; capacity=nothing, instanceCapacity=nothing, state=nothing, earliestAllowedDeactivationTime=nothing) = 
         new(capacity, instanceCapacity, state, earliestAllowedDeactivationTime)
end
export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int32, Nothing)

    ActivateLicenseType(; licenseId=nothing, capacity=nothing) = 
         new(licenseId, capacity)
end
export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ActivateLicenseResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int32, Nothing)

    DeactivateLicenseType(; licenseId=nothing, capacity=nothing) = 
         new(licenseId, capacity)
end
export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeactivateLicenseResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)

    CreatePlacementGroupType(; groupName=nothing, strategy=nothing) = 
         new(groupName, strategy)
end
export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreatePlacementGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::Union(ASCIIString, Nothing)

    DeletePlacementGroupType(; groupName=nothing) = 
         new(groupName)
end
export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeletePlacementGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::Union(ASCIIString, Nothing)

    DescribePlacementGroupItemType(; groupName=nothing) = 
         new(groupName)
end
export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    PlacementGroupInfoType(; groupName=nothing, strategy=nothing, state=nothing) = 
         new(groupName, strategy, state)
end
export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::Union(ASCIIString, Nothing)

    ResourceIdSetItemType(; resourceId=nothing) = 
         new(resourceId)
end
export ResourceIdSetItemType


type ResourceTagSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    ResourceTagSetItemType(; key=nothing, value=nothing) = 
         new(key, value)
end
export ResourceTagSetItemType


type CreateTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateTagsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CreateTagsResponseType


type TagSetItemType
    resourceId::Union(ASCIIString, Nothing)
    resourceType::Union(ASCIIString, Nothing)
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    TagSetItemType(; resourceId=nothing, resourceType=nothing, key=nothing, value=nothing) = 
         new(resourceId, resourceType, key, value)
end
export TagSetItemType


type DeleteTagsSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    DeleteTagsSetItemType(; key=nothing, value=nothing) = 
         new(key, value)
end
export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteTagsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteTagsResponseType


type DiskImageDetailType
    format::Union(ASCIIString, Nothing)
    bytes::Union(Int64, Nothing)
    importManifestUrl::Union(ASCIIString, Nothing)

    DiskImageDetailType(; format=nothing, bytes=nothing, importManifestUrl=nothing) = 
         new(format, bytes, importManifestUrl)
end
export DiskImageDetailType


type DiskImageVolumeType
    size::Union(Int, Nothing)

    DiskImageVolumeType(; size=nothing) = 
         new(size)
end
export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Union(Int, Nothing)
    id::Union(ASCIIString, Nothing)

    DiskImageVolumeDescriptionType(; size=nothing, id=nothing) = 
         new(size, id)
end
export DiskImageVolumeDescriptionType


type DiskImageDescriptionType
    format::Union(ASCIIString, Nothing)
    size::Union(Int64, Nothing)
    importManifestUrl::Union(ASCIIString, Nothing)
    checksum::Union(ASCIIString, Nothing)

    DiskImageDescriptionType(; format=nothing, size=nothing, importManifestUrl=nothing, checksum=nothing) = 
         new(format, size, importManifestUrl, checksum)
end
export DiskImageDescriptionType


type DescribeConversionTasksType
    conversionTaskIdSet::Union(Array{ASCIIString,1}, Nothing)

    DescribeConversionTasksType(; conversionTaskIdSet=nothing) = 
         new(conversionTaskIdSet)
end
export DescribeConversionTasksType


type ConversionTaskIdItemType
    conversionTaskId::Union(ASCIIString, Nothing)

    ConversionTaskIdItemType(; conversionTaskId=nothing) = 
         new(conversionTaskId)
end
export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)

    CancelConversionTaskType(; conversionTaskId=nothing) = 
         new(conversionTaskId)
end
export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelConversionTaskResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    CreateInstanceExportTaskType(; description=nothing, instanceId=nothing, targetEnvironment=nothing) = 
         new(description, instanceId, targetEnvironment)
end
export CreateInstanceExportTaskType


type ExportToS3TaskType
    diskImageFormat::Union(ASCIIString, Nothing)
    containerFormat::Union(ASCIIString, Nothing)
    s3Bucket::Union(ASCIIString, Nothing)
    s3Prefix::Union(ASCIIString, Nothing)

    ExportToS3TaskType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Prefix=nothing) = 
         new(diskImageFormat, containerFormat, s3Bucket, s3Prefix)
end
export ExportToS3TaskType


type DescribeExportTasksType
    exportTaskIdSet::Union(Array{ASCIIString,1}, Nothing)

    DescribeExportTasksType(; exportTaskIdSet=nothing) = 
         new(exportTaskIdSet)
end
export DescribeExportTasksType


type ExportTaskIdType
    exportTaskId::Union(ASCIIString, Nothing)

    ExportTaskIdType(; exportTaskId=nothing) = 
         new(exportTaskId)
end
export ExportTaskIdType


type ExportTaskResponseType
    exportTaskId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)

    ExportTaskResponseType(; exportTaskId=nothing, description=nothing, state=nothing, statusMessage=nothing) = 
         new(exportTaskId, description, state, statusMessage)
end
export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    InstanceExportTaskResponseType(; instanceId=nothing, targetEnvironment=nothing) = 
         new(instanceId, targetEnvironment)
end
export InstanceExportTaskResponseType


type ExportToS3TaskResponseType
    diskImageFormat::Union(ASCIIString, Nothing)
    containerFormat::Union(ASCIIString, Nothing)
    s3Bucket::Union(ASCIIString, Nothing)
    s3Key::Union(ASCIIString, Nothing)

    ExportToS3TaskResponseType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Key=nothing) = 
         new(diskImageFormat, containerFormat, s3Bucket, s3Key)
end
export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::Union(ASCIIString, Nothing)

    CancelExportTaskType(; exportTaskId=nothing) = 
         new(exportTaskId)
end
export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelExportTaskResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    InternetGatewayAttachmentType(; vpcId=nothing, state=nothing) = 
         new(vpcId, state)
end
export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::Union(ASCIIString, Nothing)

    InternetGatewayIdSetItemType(; internetGatewayId=nothing) = 
         new(internetGatewayId)
end
export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)

    DeleteInternetGatewayType(; internetGatewayId=nothing) = 
         new(internetGatewayId)
end
export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) = 
         new(internetGatewayId, vpcId)
end
export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AttachInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) = 
         new(internetGatewayId, vpcId)
end
export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::Union(ASCIIString, Nothing)

    CreateRouteTableType(; vpcId=nothing) = 
         new(vpcId)
end
export CreateRouteTableType


type RouteType
    destinationCidrBlock::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    instanceOwnerId::Union(ASCIIString, Nothing)
    networkInterfaceId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    origin::Union(ASCIIString, Nothing)

    RouteType(; destinationCidrBlock=nothing, gatewayId=nothing, instanceId=nothing, instanceOwnerId=nothing, networkInterfaceId=nothing, state=nothing, origin=nothing) = 
         new(destinationCidrBlock, gatewayId, instanceId, instanceOwnerId, networkInterfaceId, state, origin)
end
export RouteType


type RouteTableAssociationType
    routeTableAssociationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableAssociationType(; routeTableAssociationId=nothing, routeTableId=nothing) = 
         new(routeTableAssociationId, routeTableId)
end
export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::Union(ASCIIString, Nothing)

    PropagatingVgwType(; gatewayId=nothing) = 
         new(gatewayId)
end
export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableIdSetItemType(; routeTableId=nothing) = 
         new(routeTableId)
end
export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    EnableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) = 
         new(routeTableId, gatewayId)
end
export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    DisableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) = 
         new(routeTableId, gatewayId)
end
export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::Union(ASCIIString, Nothing)

    DeleteRouteTableType(; routeTableId=nothing) = 
         new(routeTableId)
end
export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteTableResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    AssociateRouteTableType(; routeTableId=nothing, subnetId=nothing) = 
         new(routeTableId, subnetId)
end
export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateRouteTableResponseType(; requestId=nothing, associationId=nothing) = 
         new(requestId, associationId)
end
export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationType(; associationId=nothing, routeTableId=nothing) = 
         new(associationId, routeTableId)
end
export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationResponseType(; requestId=nothing, newAssociationId=nothing) = 
         new(requestId, newAssociationId)
end
export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::Union(ASCIIString, Nothing)

    DisassociateRouteTableType(; associationId=nothing) = 
         new(associationId)
end
export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateRouteTableResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
export CreateRouteType


type CreateRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    ReplaceRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
export DeleteRouteType


type DeleteRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::Union(ASCIIString, Nothing)

    CreateNetworkAclType(; vpcId=nothing) = 
         new(vpcId)
end
export CreateNetworkAclType


type IcmpTypeCodeType
    code::Union(Int32, Nothing)
    _type::Union(Int32, Nothing)

    IcmpTypeCodeType(; code=nothing, _type=nothing) = 
         new(code, _type)
end
export IcmpTypeCodeType


type PortRangeType
    from::Union(Int32, Nothing)
    to::Union(Int32, Nothing)

    PortRangeType(; from=nothing, to=nothing) = 
         new(from, to)
end
export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    NetworkAclAssociationType(; networkAclAssociationId=nothing, networkAclId=nothing, subnetId=nothing) = 
         new(networkAclAssociationId, networkAclId, subnetId)
end
export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::Union(ASCIIString, Nothing)

    NetworkAclIdSetItemType(; networkAclId=nothing) = 
         new(networkAclId)
end
export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::Union(ASCIIString, Nothing)

    DeleteNetworkAclType(; networkAclId=nothing) = 
         new(networkAclId)
end
export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationType(; associationId=nothing, networkAclId=nothing) = 
         new(associationId, networkAclId)
end
export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationResponseType(; requestId=nothing, newAssociationId=nothing) = 
         new(requestId, newAssociationId)
end
export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int32, Nothing)
    egress::Union(Bool, Nothing)

    DeleteNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, egress=nothing) = 
         new(networkAclId, ruleNumber, egress)
end
export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    impairedSince::Union(XSDateTime, Nothing)

    InstanceStatusDetailsSetItemType(; name=nothing, status=nothing, impairedSince=nothing) = 
         new(name, status, impairedSince)
end
export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    notBefore::Union(XSDateTime, Nothing)
    notAfter::Union(XSDateTime, Nothing)

    InstanceStatusEventType(; code=nothing, description=nothing, notBefore=nothing, notAfter=nothing) = 
         new(code, description, notBefore, notAfter)
end
export InstanceStatusEventType


type ReportInstanceStatusType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(XSDateTime, Nothing)
    endTime::Union(XSDateTime, Nothing)
    reasonCodesSet::Union(Array{ASCIIString,1}, Nothing)
    description::Union(ASCIIString, Nothing)

    ReportInstanceStatusType(; instancesSet=nothing, status=nothing, startTime=nothing, endTime=nothing, reasonCodesSet=nothing, description=nothing) = 
         new(instancesSet, status, startTime, endTime, reasonCodesSet, description)
end
export ReportInstanceStatusType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::Union(ASCIIString, Nothing)

    ReportInstanceStatusReasonCodeSetItemType(; reasonCode=nothing) = 
         new(reasonCode)
end
export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReportInstanceStatusResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::Union(ASCIIString, Nothing)

    NetworkInterfaceIdSetItemType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
export NetworkInterfaceIdSetItemType


type NetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    instanceOwnerId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    NetworkInterfaceAttachmentType(; attachmentId=nothing, instanceId=nothing, instanceOwnerId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination)
end
export NetworkInterfaceAttachmentType


type NetworkInterfaceAssociationType
    publicIp::Union(ASCIIString, Nothing)
    publicDnsName::Union(ASCIIString, Nothing)
    ipOwnerId::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    NetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing, allocationId=nothing, associationId=nothing) = 
         new(publicIp, publicDnsName, ipOwnerId, allocationId, associationId)
end
export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DeleteNetworkInterfaceType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)

    AttachNetworkInterfaceType(; networkInterfaceId=nothing, instanceId=nothing, deviceIndex=nothing) = 
         new(networkInterfaceId, instanceId, deviceIndex)
end
export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    attachmentId::Union(ASCIIString, Nothing)

    AttachNetworkInterfaceResponseType(; requestId=nothing, attachmentId=nothing) = 
         new(requestId, attachmentId)
end
export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::Union(ASCIIString, Nothing)
    force::Union(Bool, Nothing)

    DetachNetworkInterfaceType(; attachmentId=nothing, force=nothing) = 
         new(attachmentId, force)
end
export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeResponseType(; requestId=nothing, networkInterfaceId=nothing) = 
         new(requestId, networkInterfaceId)
end
export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ModifyNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttachmentType(; attachmentId=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, deleteOnTermination)
end
export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ResetNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Array{ASCIIString,1}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)
    allowReassignment::Union(Bool, Nothing)

    AssignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing, allowReassignment=nothing) = 
         new(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment)
end
export AssignPrivateIpAddressesType


type AssignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Array{ASCIIString,1}, Nothing)

    UnassignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, privateIpAddressesSet)
end
export UnassignPrivateIpAddressesType


type UnassignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    UnassignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)

    AssignPrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing) = 
         new(privateIpAddress)
end
export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)

    VolumeStatusDetailsItemType(; name=nothing, status=nothing) = 
         new(name, status)
end
export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::Union(ASCIIString, Nothing)
    notBefore::Union(XSDateTime, Nothing)
    notAfter::Union(XSDateTime, Nothing)
    eventId::Union(ASCIIString, Nothing)
    eventType::Union(ASCIIString, Nothing)

    VolumeStatusEventItemType(; description=nothing, notBefore=nothing, notAfter=nothing, eventId=nothing, eventType=nothing) = 
         new(description, notBefore, notAfter, eventId, eventType)
end
export VolumeStatusEventItemType


type VolumeStatusActionItemType
    description::Union(ASCIIString, Nothing)
    code::Union(ASCIIString, Nothing)
    eventId::Union(ASCIIString, Nothing)
    eventType::Union(ASCIIString, Nothing)

    VolumeStatusActionItemType(; description=nothing, code=nothing, eventId=nothing, eventType=nothing) = 
         new(description, code, eventId, eventType)
end
export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::Union(ASCIIString, Nothing)

    EnableVolumeIOType(; volumeId=nothing) = 
         new(volumeId)
end
export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVolumeIOResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    ModifyVolumeAttributeType(; volumeId=nothing) = 
         new(volumeId)
end
export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVolumeAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeType(; volumeId=nothing) = 
         new(volumeId)
end
export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeResponseType(; requestId=nothing, volumeId=nothing) = 
         new(requestId, volumeId)
end
export DescribeVolumeAttributeResponseType


type PriceScheduleRequestSetType
    item::Union(Array{PriceScheduleRequestSetItemType,1}, Nothing)

    PriceScheduleRequestSetType(; item=nothing) = 
         new(item)
end
export PriceScheduleRequestSetType


type DescribeAvailabilityZonesResponseType
    requestId::Union(ASCIIString, Nothing)
    availabilityZoneInfo::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    DescribeAvailabilityZonesResponseType(; requestId=nothing, availabilityZoneInfo=nothing) = 
         new(requestId, availabilityZoneInfo)
end
export DescribeAvailabilityZonesResponseType


type VpnGatewayIdSetType
    item::Union(Array{VpnGatewayIdSetItemType,1}, Nothing)

    VpnGatewayIdSetType(; item=nothing) = 
         new(item)
end
export VpnGatewayIdSetType


type AvailabilityZoneMessageSetType
    item::Union(Array{AvailabilityZoneMessageType,1}, Nothing)

    AvailabilityZoneMessageSetType(; item=nothing) = 
         new(item)
end
export AvailabilityZoneMessageSetType


type DescribeInternetGatewaysType
    internetGatewayIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeInternetGatewaysType(; internetGatewayIdSet=nothing, filterSet=nothing) = 
         new(internetGatewayIdSet, filterSet)
end
export DescribeInternetGatewaysType


type DescribeSpotPriceHistoryResponseType
    requestId::Union(ASCIIString, Nothing)
    spotPriceHistorySet::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeSpotPriceHistoryResponseType(; requestId=nothing, spotPriceHistorySet=nothing, nextToken=nothing) = 
         new(requestId, spotPriceHistorySet, nextToken)
end
export DescribeSpotPriceHistoryResponseType


type CreateVolumePermissionOperationType
    add::Union(Array{CreateVolumePermissionItemType,1}, Nothing)
    remove::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionOperationType(; add=nothing, remove=nothing) = 
         new(add, remove)
end
export CreateVolumePermissionOperationType


type DescribeSecurityGroupsSetType
    item::Union(Array{DescribeSecurityGroupsSetItemType,1}, Nothing)

    DescribeSecurityGroupsSetType(; item=nothing) = 
         new(item)
end
export DescribeSecurityGroupsSetType


type VgwTelemetryType
    item::Union(Array{VpnTunnelTelemetryType,1}, Nothing)

    VgwTelemetryType(; item=nothing) = 
         new(item)
end
export VgwTelemetryType


type CreateReservedInstancesListingType
    reservedInstancesId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)
    priceSchedules::Union(Array{PriceScheduleRequestSetItemType,1}, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    CreateReservedInstancesListingType(; reservedInstancesId=nothing, instanceCount=nothing, priceSchedules=nothing, clientToken=nothing) = 
         new(reservedInstancesId, instanceCount, priceSchedules, clientToken)
end
export CreateReservedInstancesListingType


type DescribeAddressesType
    publicIpsSet::Union(Array{ASCIIString,1}, Nothing)
    allocationIdsSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAddressesType(; publicIpsSet=nothing, allocationIdsSet=nothing, filterSet=nothing) = 
         new(publicIpsSet, allocationIdsSet, filterSet)
end
export DescribeAddressesType


type UnavailableResultSetType
    item::Union(Array{UnavailableResultType,1}, Nothing)

    UnavailableResultSetType(; item=nothing) = 
         new(item)
end
export UnavailableResultSetType


type DescribeReservedInstancesListingSetType
    item::Union(Array{DescribeReservedInstancesListingSetItemType,1}, Nothing)

    DescribeReservedInstancesListingSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesListingSetType


type ModifySnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)
    createVolumePermission::Union(CreateVolumePermissionOperationType, Nothing)

    ModifySnapshotAttributeType(; snapshotId=nothing, createVolumePermission=nothing) = 
         new(snapshotId, createVolumePermission)
end
export ModifySnapshotAttributeType


type NetworkAclEntryType
    ruleNumber::Union(Int32, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    NetworkAclEntryType(; ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
export NetworkAclEntryType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpnGatewaysType(; vpnGatewaySet=nothing, filterSet=nothing) = 
         new(vpnGatewaySet, filterSet)
end
export DescribeVpnGatewaysType


type BundleInstanceTaskStorageType
    S3::Union(BundleInstanceS3StorageType, Nothing)

    BundleInstanceTaskStorageType(; S3=nothing) = 
         new(S3)
end
export BundleInstanceTaskStorageType


type DescribeAddressesInfoType
    item::Union(Array{DescribeAddressesItemType,1}, Nothing)

    DescribeAddressesInfoType(; item=nothing) = 
         new(item)
end
export DescribeAddressesInfoType


type DescribeReservedInstancesType
    reservedInstancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    offeringType::Union(ASCIIString, Nothing)

    DescribeReservedInstancesType(; reservedInstancesSet=nothing, filterSet=nothing, offeringType=nothing) = 
         new(reservedInstancesSet, filterSet, offeringType)
end
export DescribeReservedInstancesType


type AttachmentSetType
    item::Union(Array{AttachmentType,1}, Nothing)

    AttachmentSetType(; item=nothing) = 
         new(item)
end
export AttachmentSetType


type ProductDescriptionSetType
    item::Union(Array{ProductDescriptionSetItemType,1}, Nothing)

    ProductDescriptionSetType(; item=nothing) = 
         new(item)
end
export ProductDescriptionSetType


type CustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int32, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    CustomerGatewayType(; customerGatewayId=nothing, state=nothing, _type=nothing, ipAddress=nothing, bgpAsn=nothing, tagSet=nothing) = 
         new(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet)
end
export CustomerGatewayType


type ProductCodesSetType
    item::Union(Array{ProductCodesSetItemType,1}, Nothing)

    ProductCodesSetType(; item=nothing) = 
         new(item)
end
export ProductCodesSetType


type DescribeRegionsSetType
    item::Union(Array{DescribeRegionsSetItemType,1}, Nothing)

    DescribeRegionsSetType(; item=nothing) = 
         new(item)
end
export DescribeRegionsSetType


type InternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    attachmentSet::Union(Array{InternetGatewayAttachmentType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    InternetGatewayType(; internetGatewayId=nothing, attachmentSet=nothing, tagSet=nothing) = 
         new(internetGatewayId, attachmentSet, tagSet)
end
export InternetGatewayType


type ResourceIdSetType
    item::Union(Array{ResourceIdSetItemType,1}, Nothing)

    ResourceIdSetType(; item=nothing) = 
         new(item)
end
export ResourceIdSetType


type DescribeReservedInstancesOfferingsResponseSetItemType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    duration::Union(Int64, Nothing)
    fixedPrice::Union(Float64, Nothing)
    usagePrice::Union(Float64, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    currencyCode::Union(ASCIIString, Nothing)
    offeringType::Union(ASCIIString, Nothing)
    recurringCharges::Union(Array{RecurringChargesSetItemType,1}, Nothing)
    marketplace::Union(Bool, Nothing)
    pricingDetailsSet::Union(Array{PricingDetailsSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetItemType(; reservedInstancesOfferingId=nothing, instanceType=nothing, availabilityZone=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, productDescription=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing, marketplace=nothing, pricingDetailsSet=nothing) = 
         new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet)
end
export DescribeReservedInstancesOfferingsResponseSetItemType


type ImportInstanceLaunchSpecificationType
    architecture::Union(ASCIIString, Nothing)
    groupSet::Union(Array{ImportInstanceGroupItemType,1}, Nothing)
    userData::Union(UserDataType, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(InstancePlacementType, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    instanceInitiatedShutdownBehavior::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)

    ImportInstanceLaunchSpecificationType(; architecture=nothing, groupSet=nothing, userData=nothing, instanceType=nothing, placement=nothing, monitoring=nothing, subnetId=nothing, instanceInitiatedShutdownBehavior=nothing, privateIpAddress=nothing) = 
         new(architecture, groupSet, userData, instanceType, placement, monitoring, subnetId, instanceInitiatedShutdownBehavior, privateIpAddress)
end
export ImportInstanceLaunchSpecificationType


type PriceScheduleSetType
    item::Union(Array{PriceScheduleSetItemType,1}, Nothing)

    PriceScheduleSetType(; item=nothing) = 
         new(item)
end
export PriceScheduleSetType


type CreateTagsType
    resourcesSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    CreateTagsType(; resourcesSet=nothing, tagSet=nothing) = 
         new(resourcesSet, tagSet)
end
export CreateTagsType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing, filterSet=nothing) = 
         new(spotInstanceRequestIdSet, filterSet)
end
export DescribeSpotInstanceRequestsType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeCustomerGatewaysType(; customerGatewaySet=nothing, filterSet=nothing) = 
         new(customerGatewaySet, filterSet)
end
export DescribeCustomerGatewaysType


type DescribeReservedInstancesOfferingsType
    reservedInstancesOfferingsSet::Union(Array{ASCIIString,1}, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    offeringType::Union(ASCIIString, Nothing)
    includeMarketplace::Union(Bool, Nothing)
    minDuration::Union(Int64, Nothing)
    maxDuration::Union(Int64, Nothing)
    maxInstanceCount::Union(Int32, Nothing)
    nextToken::Union(ASCIIString, Nothing)
    maxResults::Union(Int32, Nothing)

    DescribeReservedInstancesOfferingsType(; reservedInstancesOfferingsSet=nothing, instanceType=nothing, availabilityZone=nothing, productDescription=nothing, filterSet=nothing, instanceTenancy=nothing, offeringType=nothing, includeMarketplace=nothing, minDuration=nothing, maxDuration=nothing, maxInstanceCount=nothing, nextToken=nothing, maxResults=nothing) = 
         new(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults)
end
export DescribeReservedInstancesOfferingsType


type DescribeAvailabilityZonesType
    availabilityZoneSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAvailabilityZonesType(; availabilityZoneSet=nothing, filterSet=nothing) = 
         new(availabilityZoneSet, filterSet)
end
export DescribeAvailabilityZonesType


type ImportInstanceVolumeDetailItemType
    bytesConverted::Union(Int64, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    image::Union(DiskImageDescriptionType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeDescriptionType, Nothing)
    status::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)

    ImportInstanceVolumeDetailItemType(; bytesConverted=nothing, availabilityZone=nothing, image=nothing, description=nothing, volume=nothing, status=nothing, statusMessage=nothing) = 
         new(bytesConverted, availabilityZone, image, description, volume, status, statusMessage)
end
export ImportInstanceVolumeDetailItemType


type CustomerGatewayIdSetType
    item::Union(Array{CustomerGatewayIdSetItemType,1}, Nothing)

    CustomerGatewayIdSetType(; item=nothing) = 
         new(item)
end
export CustomerGatewayIdSetType


type ValueSetType
    item::Union(Array{ValueType,1}, Nothing)

    ValueSetType(; item=nothing) = 
         new(item)
end
export ValueSetType


type GroupSetType
    item::Union(Array{GroupItemType,1}, Nothing)

    GroupSetType(; item=nothing) = 
         new(item)
end
export GroupSetType


type DeleteTagsType
    resourcesSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsType(; resourcesSet=nothing, tagSet=nothing) = 
         new(resourcesSet, tagSet)
end
export DeleteTagsType


type InstanceStatusType
    status::Union(ASCIIString, Nothing)
    details::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusType(; status=nothing, details=nothing) = 
         new(status, details)
end
export InstanceStatusType


type DeleteTagsSetType
    item::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsSetType(; item=nothing) = 
         new(item)
end
export DeleteTagsSetType


type DescribeTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    tagSet::Union(Array{TagSetItemType,1}, Nothing)

    DescribeTagsResponseType(; requestId=nothing, tagSet=nothing) = 
         new(requestId, tagSet)
end
export DescribeTagsResponseType


type DescribeKeyPairsInfoType
    item::Union(Array{DescribeKeyPairsItemType,1}, Nothing)

    DescribeKeyPairsInfoType(; item=nothing) = 
         new(item)
end
export DescribeKeyPairsInfoType


type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::Union(ASCIIString, Nothing)
    reservedInstancesId::Union(ASCIIString, Nothing)
    createDate::Union(XSDateTime, Nothing)
    updateDate::Union(XSDateTime, Nothing)
    status::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    instanceCounts::Union(Array{InstanceCountsSetItemType,1}, Nothing)
    priceSchedules::Union(Array{PriceScheduleSetItemType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    DescribeReservedInstancesListingsResponseSetItemType(; reservedInstancesListingId=nothing, reservedInstancesId=nothing, createDate=nothing, updateDate=nothing, status=nothing, statusMessage=nothing, instanceCounts=nothing, priceSchedules=nothing, tagSet=nothing, clientToken=nothing) = 
         new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken)
end
export DescribeReservedInstancesListingsResponseSetItemType


type DescribeLicensesType
    licenseIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeLicensesType(; licenseIdSet=nothing, filterSet=nothing) = 
         new(licenseIdSet, filterSet)
end
export DescribeLicensesType


type DescribeSnapshotsType
    snapshotSet::Union(Array{ASCIIString,1}, Nothing)
    ownersSet::Union(Array{ASCIIString,1}, Nothing)
    restorableBySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSnapshotsType(; snapshotSet=nothing, ownersSet=nothing, restorableBySet=nothing, filterSet=nothing) = 
         new(snapshotSet, ownersSet, restorableBySet, filterSet)
end
export DescribeSnapshotsType


type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    start::Union(XSDateTime, Nothing)
    duration::Union(Int64, Nothing)
    fixedPrice::Union(Float64, Nothing)
    usagePrice::Union(Float64, Nothing)
    instanceCount::Union(Int, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    currencyCode::Union(ASCIIString, Nothing)
    offeringType::Union(ASCIIString, Nothing)
    recurringCharges::Union(Array{RecurringChargesSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseSetItemType(; reservedInstancesId=nothing, instanceType=nothing, availabilityZone=nothing, start=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, instanceCount=nothing, productDescription=nothing, state=nothing, tagSet=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing) = 
         new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges)
end
export DescribeReservedInstancesResponseSetItemType


type DescribeVolumesSetType
    item::Union(Array{DescribeVolumesSetItemType,1}, Nothing)

    DescribeVolumesSetType(; item=nothing) = 
         new(item)
end
export DescribeVolumesSetType


type SpotPriceHistorySetType
    item::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)

    SpotPriceHistorySetType(; item=nothing) = 
         new(item)
end
export SpotPriceHistorySetType


type DescribeReservedInstancesResponseSetType
    item::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesResponseSetType


type IpPermissionType
    ipProtocol::Union(ASCIIString, Nothing)
    fromPort::Union(Int32, Nothing)
    toPort::Union(Int32, Nothing)
    groups::Union(Array{UserIdGroupPairType,1}, Nothing)
    ipRanges::Union(Array{ASCIIString,1}, Nothing)

    IpPermissionType(; ipProtocol=nothing, fromPort=nothing, toPort=nothing, groups=nothing, ipRanges=nothing) = 
         new(ipProtocol, fromPort, toPort, groups, ipRanges)
end
export IpPermissionType


type IpRangeSetType
    item::Union(Array{IpRangeItemType,1}, Nothing)

    IpRangeSetType(; item=nothing) = 
         new(item)
end
export IpRangeSetType


type DescribeKeyPairsResponseInfoType
    item::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseInfoType(; item=nothing) = 
         new(item)
end
export DescribeKeyPairsResponseInfoType


type CreateVpnConnectionType
    _type::Union(ASCIIString, Nothing)
    customerGatewayId::Union(ASCIIString, Nothing)
    vpnGatewayId::Union(ASCIIString, Nothing)
    options::Union(VpnConnectionOptionsRequestType, Nothing)

    CreateVpnConnectionType(; _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, options=nothing) = 
         new(_type, customerGatewayId, vpnGatewayId, options)
end
export CreateVpnConnectionType


type LicenseSetItemType
    licenseId::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    pool::Union(ASCIIString, Nothing)
    capacitySet::Union(Array{LicenseCapacitySetItemType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    LicenseSetItemType(; licenseId=nothing, _type=nothing, pool=nothing, capacitySet=nothing, tagSet=nothing) = 
         new(licenseId, _type, pool, capacitySet, tagSet)
end
export LicenseSetItemType


type ReplaceNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int32, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    ReplaceNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
export ReplaceNetworkAclEntryType


type DescribeAvailabilityZonesSetType
    item::Union(Array{DescribeAvailabilityZonesSetItemType,1}, Nothing)

    DescribeAvailabilityZonesSetType(; item=nothing) = 
         new(item)
end
export DescribeAvailabilityZonesSetType


type DescribeSnapshotsSetType
    item::Union(Array{DescribeSnapshotsSetItemType,1}, Nothing)

    DescribeSnapshotsSetType(; item=nothing) = 
         new(item)
end
export DescribeSnapshotsSetType


type CancelReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    CancelReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
export CancelReservedInstancesListingResponseType


type SubnetIdSetType
    item::Union(Array{SubnetIdSetItemType,1}, Nothing)

    SubnetIdSetType(; item=nothing) = 
         new(item)
end
export SubnetIdSetType


type VpcIdSetType
    item::Union(Array{VpcIdSetItemType,1}, Nothing)

    VpcIdSetType(; item=nothing) = 
         new(item)
end
export VpcIdSetType


type ConversionTaskIdSetType
    item::Union(Array{ConversionTaskIdItemType,1}, Nothing)

    ConversionTaskIdSetType(; item=nothing) = 
         new(item)
end
export ConversionTaskIdSetType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpnConnectionsType(; vpnConnectionSet=nothing, filterSet=nothing) = 
         new(vpnConnectionSet, filterSet)
end
export DescribeVpnConnectionsType


type PlacementGroupSetType
    item::Union(Array{PlacementGroupInfoType,1}, Nothing)

    PlacementGroupSetType(; item=nothing) = 
         new(item)
end
export PlacementGroupSetType


type SpotDatafeedSubscriptionType
    ownerId::Union(ASCIIString, Nothing)
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    fault::Union(SpotInstanceStateFaultType, Nothing)

    SpotDatafeedSubscriptionType(; ownerId=nothing, bucket=nothing, prefix=nothing, state=nothing, fault=nothing) = 
         new(ownerId, bucket, prefix, state, fault)
end
export SpotDatafeedSubscriptionType


type AllocationIdSetType
    item::Union(Array{AllocationIdSetItemType,1}, Nothing)

    AllocationIdSetType(; item=nothing) = 
         new(item)
end
export AllocationIdSetType


type DescribeBundleTasksInfoType
    item::Union(Array{DescribeBundleTasksItemType,1}, Nothing)

    DescribeBundleTasksInfoType(; item=nothing) = 
         new(item)
end
export DescribeBundleTasksInfoType


type TagSetType
    item::Union(Array{TagSetItemType,1}, Nothing)

    TagSetType(; item=nothing) = 
         new(item)
end
export TagSetType


type DescribeReservedInstancesListingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
export DescribeReservedInstancesListingsResponseType


type NetworkAclAssociationSetType
    item::Union(Array{NetworkAclAssociationType,1}, Nothing)

    NetworkAclAssociationSetType(; item=nothing) = 
         new(item)
end
export NetworkAclAssociationSetType


type DescribeImagesType
    executableBySet::Union(Array{ASCIIString,1}, Nothing)
    imagesSet::Union(Array{ASCIIString,1}, Nothing)
    ownersSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeImagesType(; executableBySet=nothing, imagesSet=nothing, ownersSet=nothing, filterSet=nothing) = 
         new(executableBySet, imagesSet, ownersSet, filterSet)
end
export DescribeImagesType


type DescribeVpcsType
    vpcSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpcsType(; vpcSet=nothing, filterSet=nothing) = 
         new(vpcSet, filterSet)
end
export DescribeVpcsType


type LicenseSetType
    item::Union(Array{LicenseSetItemType,1}, Nothing)

    LicenseSetType(; item=nothing) = 
         new(item)
end
export LicenseSetType


type CreateNetworkInterfaceType
    subnetId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    groupSet::Union(Array{ASCIIString,1}, Nothing)
    privateIpAddressesSet::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    CreateNetworkInterfaceType(; subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) = 
         new(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
export CreateNetworkInterfaceType


type DescribeImagesInfoType
    item::Union(Array{DescribeImagesItemType,1}, Nothing)

    DescribeImagesInfoType(; item=nothing) = 
         new(item)
end
export DescribeImagesInfoType


type NetworkInterfaceIdSetType
    item::Union(Array{NetworkInterfaceIdSetItemType,1}, Nothing)

    NetworkInterfaceIdSetType(; item=nothing) = 
         new(item)
end
export NetworkInterfaceIdSetType


type DescribeSnapshotsRestorableBySetType
    item::Union(Array{DescribeSnapshotsRestorableByType,1}, Nothing)

    DescribeSnapshotsRestorableBySetType(; item=nothing) = 
         new(item)
end
export DescribeSnapshotsRestorableBySetType


type CancelSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{CancelSpotInstanceRequestsResponseSetItemType,1}, Nothing)

    CancelSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
export CancelSpotInstanceRequestsResponseType


type DescribeReservedInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesSet::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseType(; requestId=nothing, reservedInstancesSet=nothing) = 
         new(requestId, reservedInstancesSet)
end
export DescribeReservedInstancesResponseType


type NetworkAclType
    networkAclId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    default::Union(Bool, Nothing)
    entrySet::Union(Array{NetworkAclEntryType,1}, Nothing)
    associationSet::Union(Array{NetworkAclAssociationType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    NetworkAclType(; networkAclId=nothing, vpcId=nothing, default=nothing, entrySet=nothing, associationSet=nothing, tagSet=nothing) = 
         new(networkAclId, vpcId, default, entrySet, associationSet, tagSet)
end
export NetworkAclType


type ImportVolumeType
    availabilityZone::Union(ASCIIString, Nothing)
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    ImportVolumeType(; availabilityZone=nothing, image=nothing, description=nothing, volume=nothing) = 
         new(availabilityZone, image, description, volume)
end
export ImportVolumeType


type RegionSetType
    item::Union(Array{RegionItemType,1}, Nothing)

    RegionSetType(; item=nothing) = 
         new(item)
end
export RegionSetType


type VpnConnectionIdSetType
    item::Union(Array{VpnConnectionIdSetItemType,1}, Nothing)

    VpnConnectionIdSetType(; item=nothing) = 
         new(item)
end
export VpnConnectionIdSetType


type VolumeStatusEventsSetType
    item::Union(Array{VolumeStatusEventItemType,1}, Nothing)

    VolumeStatusEventsSetType(; item=nothing) = 
         new(item)
end
export VolumeStatusEventsSetType


type RebootInstancesInfoType
    item::Union(Array{RebootInstancesItemType,1}, Nothing)

    RebootInstancesInfoType(; item=nothing) = 
         new(item)
end
export RebootInstancesInfoType


type VpnStaticRoutesSetType
    item::Union(Array{VpnStaticRouteType,1}, Nothing)

    VpnStaticRoutesSetType(; item=nothing) = 
         new(item)
end
export VpnStaticRoutesSetType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeNetworkInterfacesType(; networkInterfaceIdSet=nothing, filterSet=nothing) = 
         new(networkInterfaceIdSet, filterSet)
end
export DescribeNetworkInterfacesType


type IpPermissionSetType
    item::Union(Array{IpPermissionType,1}, Nothing)

    IpPermissionSetType(; item=nothing) = 
         new(item)
end
export IpPermissionSetType


type ExportTaskSetResponseType
    item::Union(Array{ExportTaskResponseType,1}, Nothing)

    ExportTaskSetResponseType(; item=nothing) = 
         new(item)
end
export ExportTaskSetResponseType


type RouteTableAssociationSetType
    item::Union(Array{RouteTableAssociationType,1}, Nothing)

    RouteTableAssociationSetType(; item=nothing) = 
         new(item)
end
export RouteTableAssociationSetType


type InstanceStatusItemType
    instanceId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    eventsSet::Union(Array{InstanceStatusEventType,1}, Nothing)
    instanceState::Union(InstanceStateType, Nothing)
    systemStatus::Union(InstanceStatusType, Nothing)
    instanceStatus::Union(InstanceStatusType, Nothing)

    InstanceStatusItemType(; instanceId=nothing, availabilityZone=nothing, eventsSet=nothing, instanceState=nothing, systemStatus=nothing, instanceStatus=nothing) = 
         new(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus)
end
export InstanceStatusItemType


type VolumeStatusActionsSetType
    item::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusActionsSetType(; item=nothing) = 
         new(item)
end
export VolumeStatusActionsSetType


type DescribeInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeInstancesType(; instancesSet=nothing, filterSet=nothing) = 
         new(instancesSet, filterSet)
end
export DescribeInstancesType


type VpcType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    dhcpOptionsId::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    isDefault::Union(Bool, Nothing)

    VpcType(; vpcId=nothing, state=nothing, cidrBlock=nothing, dhcpOptionsId=nothing, tagSet=nothing, instanceTenancy=nothing, isDefault=nothing) = 
         new(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault)
end
export VpcType


type DescribeImagesOwnersType
    item::Union(Array{DescribeImagesOwnerType,1}, Nothing)

    DescribeImagesOwnersType(; item=nothing) = 
         new(item)
end
export DescribeImagesOwnersType


type SubnetType
    subnetId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    availableIpAddressCount::Union(Int32, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    defaultForAz::Union(Bool, Nothing)
    mapPublicIpOnLaunch::Union(Bool, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    SubnetType(; subnetId=nothing, state=nothing, vpcId=nothing, cidrBlock=nothing, availableIpAddressCount=nothing, availabilityZone=nothing, defaultForAz=nothing, mapPublicIpOnLaunch=nothing, tagSet=nothing) = 
         new(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet)
end
export SubnetType


type DescribePlacementGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    placementGroupSet::Union(Array{PlacementGroupInfoType,1}, Nothing)

    DescribePlacementGroupsResponseType(; requestId=nothing, placementGroupSet=nothing) = 
         new(requestId, placementGroupSet)
end
export DescribePlacementGroupsResponseType


type SpotInstanceRequestIdSetType
    item::Union(Array{SpotInstanceRequestIdSetItemType,1}, Nothing)

    SpotInstanceRequestIdSetType(; item=nothing) = 
         new(item)
end
export SpotInstanceRequestIdSetType


type BundleInstanceTaskType
    instanceId::Union(ASCIIString, Nothing)
    bundleId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    startTime::Union(XSDateTime, Nothing)
    updateTime::Union(XSDateTime, Nothing)
    storage::Union(BundleInstanceTaskStorageType, Nothing)
    progress::Union(ASCIIString, Nothing)
    error::Union(BundleInstanceTaskErrorType, Nothing)

    BundleInstanceTaskType(; instanceId=nothing, bundleId=nothing, state=nothing, startTime=nothing, updateTime=nothing, storage=nothing, progress=nothing, error=nothing) = 
         new(instanceId, bundleId, state, startTime, updateTime, storage, progress, error)
end
export BundleInstanceTaskType


type DescribeVolumesType
    volumeSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVolumesType(; volumeSet=nothing, filterSet=nothing) = 
         new(volumeSet, filterSet)
end
export DescribeVolumesType


type VpcSetType
    item::Union(Array{VpcType,1}, Nothing)

    VpcSetType(; item=nothing) = 
         new(item)
end
export VpcSetType


type DescribeLicensesResponseType
    requestId::Union(ASCIIString, Nothing)
    licenseSet::Union(Array{LicenseSetItemType,1}, Nothing)

    DescribeLicensesResponseType(; requestId=nothing, licenseSet=nothing) = 
         new(requestId, licenseSet)
end
export DescribeLicensesResponseType


type CreateInstanceExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTask::Union(ExportTaskResponseType, Nothing)

    CreateInstanceExportTaskResponseType(; requestId=nothing, exportTask=nothing) = 
         new(requestId, exportTask)
end
export CreateInstanceExportTaskResponseType


type VpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    attachments::Union(Array{AttachmentType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    VpnGatewayType(; vpnGatewayId=nothing, state=nothing, _type=nothing, availabilityZone=nothing, attachments=nothing, tagSet=nothing) = 
         new(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet)
end
export VpnGatewayType


type DescribeSubnetsType
    subnetSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSubnetsType(; subnetSet=nothing, filterSet=nothing) = 
         new(subnetSet, filterSet)
end
export DescribeSubnetsType


type CreateDhcpOptionsType
    dhcpConfigurationSet::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    CreateDhcpOptionsType(; dhcpConfigurationSet=nothing) = 
         new(dhcpConfigurationSet)
end
export CreateDhcpOptionsType


type DescribeVpcsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcSet::Union(Array{VpcType,1}, Nothing)

    DescribeVpcsResponseType(; requestId=nothing, vpcSet=nothing) = 
         new(requestId, vpcSet)
end
export DescribeVpcsResponseType


type InstanceIdSetType
    item::Union(Array{InstanceIdType,1}, Nothing)

    InstanceIdSetType(; item=nothing) = 
         new(item)
end
export InstanceIdSetType


type LicenseCapacitySetType
    item::Union(Array{LicenseCapacitySetItemType,1}, Nothing)

    LicenseCapacitySetType(; item=nothing) = 
         new(item)
end
export LicenseCapacitySetType


type InstanceBlockDeviceMappingType
    item::Union(Array{InstanceBlockDeviceMappingItemType,1}, Nothing)

    InstanceBlockDeviceMappingType(; item=nothing) = 
         new(item)
end
export InstanceBlockDeviceMappingType


type DescribeReservedInstancesOfferingsResponseSetType
    item::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesOfferingsResponseSetType


type DescribeNetworkAclsType
    networkAclIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeNetworkAclsType(; networkAclIdSet=nothing, filterSet=nothing) = 
         new(networkAclIdSet, filterSet)
end
export DescribeNetworkAclsType


type RevokeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    RevokeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) = 
         new(groupId, ipPermissions)
end
export RevokeSecurityGroupEgressType


type DhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    dhcpConfigurationSet::Union(Array{DhcpConfigurationItemType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    DhcpOptionsType(; dhcpOptionsId=nothing, dhcpConfigurationSet=nothing, tagSet=nothing) = 
         new(dhcpOptionsId, dhcpConfigurationSet, tagSet)
end
export DhcpOptionsType


type InstanceBlockDeviceMappingResponseType
    item::Union(Array{InstanceBlockDeviceMappingResponseItemType,1}, Nothing)

    InstanceBlockDeviceMappingResponseType(; item=nothing) = 
         new(item)
end
export InstanceBlockDeviceMappingResponseType


type InstanceStatusDetailsSetType
    item::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusDetailsSetType(; item=nothing) = 
         new(item)
end
export InstanceStatusDetailsSetType


type DescribeBundleTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTasksSet::Union(Array{BundleInstanceTaskType,1}, Nothing)

    DescribeBundleTasksResponseType(; requestId=nothing, bundleInstanceTasksSet=nothing) = 
         new(requestId, bundleInstanceTasksSet)
end
export DescribeBundleTasksResponseType


type VolumeStatusInfoType
    status::Union(ASCIIString, Nothing)
    details::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusInfoType(; status=nothing, details=nothing) = 
         new(status, details)
end
export VolumeStatusInfoType


type RecurringChargesSetType
    item::Union(Array{RecurringChargesSetItemType,1}, Nothing)

    RecurringChargesSetType(; item=nothing) = 
         new(item)
end
export RecurringChargesSetType


type InternetGatewayIdSetType
    item::Union(Array{InternetGatewayIdSetItemType,1}, Nothing)

    InternetGatewayIdSetType(; item=nothing) = 
         new(item)
end
export InternetGatewayIdSetType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAccountAttributesType(; accountAttributeNameSet=nothing, filterSet=nothing) = 
         new(accountAttributeNameSet, filterSet)
end
export DescribeAccountAttributesType


type CustomerGatewaySetType
    item::Union(Array{CustomerGatewayType,1}, Nothing)

    CustomerGatewaySetType(; item=nothing) = 
         new(item)
end
export CustomerGatewaySetType


type LaunchPermissionOperationType
    add::Union(Array{LaunchPermissionItemType,1}, Nothing)
    remove::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionOperationType(; add=nothing, remove=nothing) = 
         new(add, remove)
end
export LaunchPermissionOperationType


type DescribePlacementGroupsType
    placementGroupSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribePlacementGroupsType(; placementGroupSet=nothing, filterSet=nothing) = 
         new(placementGroupSet, filterSet)
end
export DescribePlacementGroupsType


type DescribeExportTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTaskSet::Union(Array{ExportTaskResponseType,1}, Nothing)

    DescribeExportTasksResponseType(; requestId=nothing, exportTaskSet=nothing) = 
         new(requestId, exportTaskSet)
end
export DescribeExportTasksResponseType


type DescribeInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceStatusSet::Union(Array{InstanceStatusItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeInstanceStatusResponseType(; requestId=nothing, instanceStatusSet=nothing, nextToken=nothing) = 
         new(requestId, instanceStatusSet, nextToken)
end
export DescribeInstanceStatusResponseType


type BlockDeviceMappingType
    item::Union(Array{BlockDeviceMappingItemType,1}, Nothing)

    BlockDeviceMappingType(; item=nothing) = 
         new(item)
end
export BlockDeviceMappingType


type DescribeRegionsResponseType
    requestId::Union(ASCIIString, Nothing)
    regionInfo::Union(Array{RegionItemType,1}, Nothing)

    DescribeRegionsResponseType(; requestId=nothing, regionInfo=nothing) = 
         new(requestId, regionInfo)
end
export DescribeRegionsResponseType


type RouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    routeSet::Union(Array{RouteType,1}, Nothing)
    associationSet::Union(Array{RouteTableAssociationType,1}, Nothing)
    propagatingVgwSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    RouteTableType(; routeTableId=nothing, vpcId=nothing, routeSet=nothing, associationSet=nothing, propagatingVgwSet=nothing, tagSet=nothing) = 
         new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet)
end
export RouteTableType


type AccountAttributeValueSetType
    item::Union(Array{AccountAttributeValueSetItemType,1}, Nothing)

    AccountAttributeValueSetType(; item=nothing) = 
         new(item)
end
export AccountAttributeValueSetType


type ExportTaskIdSetType
    item::Union(Array{ExportTaskIdType,1}, Nothing)

    ExportTaskIdSetType(; item=nothing) = 
         new(item)
end
export ExportTaskIdSetType


type InstanceCountsSetType
    item::Union(Array{InstanceCountsSetItemType,1}, Nothing)

    InstanceCountsSetType(; item=nothing) = 
         new(item)
end
export InstanceCountsSetType


type VpnConnectionType
    vpnConnectionId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    customerGatewayConfiguration::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    customerGatewayId::Union(ASCIIString, Nothing)
    vpnGatewayId::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    vgwTelemetry::Union(Array{VpnTunnelTelemetryType,1}, Nothing)
    options::Union(VpnConnectionOptionsResponseType, Nothing)
    routes::Union(Array{VpnStaticRouteType,1}, Nothing)

    VpnConnectionType(; vpnConnectionId=nothing, state=nothing, customerGatewayConfiguration=nothing, _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, tagSet=nothing, vgwTelemetry=nothing, options=nothing, routes=nothing) = 
         new(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes)
end
export VpnConnectionType


type DescribeAddressesResponseInfoType
    item::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseInfoType(; item=nothing) = 
         new(item)
end
export DescribeAddressesResponseInfoType


type DescribeKeyPairsResponseType
    requestId::Union(ASCIIString, Nothing)
    keySet::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseType(; requestId=nothing, keySet=nothing) = 
         new(requestId, keySet)
end
export DescribeKeyPairsResponseType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeDhcpOptionsType(; dhcpOptionsSet=nothing, filterSet=nothing) = 
         new(dhcpOptionsSet, filterSet)
end
export DescribeDhcpOptionsType


type InternetGatewaySetType
    item::Union(Array{InternetGatewayType,1}, Nothing)

    InternetGatewaySetType(; item=nothing) = 
         new(item)
end
export InternetGatewaySetType


type DescribeReservedInstancesOfferingsSetType
    item::Union(Array{DescribeReservedInstancesOfferingsSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesOfferingsSetType


type LicenseIdSetType
    item::Union(Array{LicenseIdSetItemType,1}, Nothing)

    LicenseIdSetType(; item=nothing) = 
         new(item)
end
export LicenseIdSetType


type InstanceStatusEventsSetType
    item::Union(Array{InstanceStatusEventType,1}, Nothing)

    InstanceStatusEventsSetType(; item=nothing) = 
         new(item)
end
export InstanceStatusEventsSetType


type DescribeImagesExecutableBySetType
    item::Union(Array{DescribeImagesExecutableByType,1}, Nothing)

    DescribeImagesExecutableBySetType(; item=nothing) = 
         new(item)
end
export DescribeImagesExecutableBySetType


type ImportInstanceTaskDetailsType
    volumes::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    platform::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    ImportInstanceTaskDetailsType(; volumes=nothing, instanceId=nothing, platform=nothing, description=nothing) = 
         new(volumes, instanceId, platform, description)
end
export ImportInstanceTaskDetailsType


type RouteTableIdSetType
    item::Union(Array{RouteTableIdSetItemType,1}, Nothing)

    RouteTableIdSetType(; item=nothing) = 
         new(item)
end
export RouteTableIdSetType


type AssignPrivateIpAddressesSetRequestType
    item::Union(Array{AssignPrivateIpAddressesSetItemRequestType,1}, Nothing)

    AssignPrivateIpAddressesSetRequestType(; item=nothing) = 
         new(item)
end
export AssignPrivateIpAddressesSetRequestType


type ImportVolumeTaskDetailsType
    bytesConverted::Union(Int64, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    image::Union(DiskImageDescriptionType, Nothing)
    volume::Union(DiskImageVolumeDescriptionType, Nothing)

    ImportVolumeTaskDetailsType(; bytesConverted=nothing, availabilityZone=nothing, description=nothing, image=nothing, volume=nothing) = 
         new(bytesConverted, availabilityZone, description, image, volume)
end
export ImportVolumeTaskDetailsType


type InstanceNetworkInterfaceSetItemRequestType
    networkInterfaceId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    groupSet::Union(Array{ASCIIString,1}, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    privateIpAddressesSet::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    InstanceNetworkInterfaceSetItemRequestType(; networkInterfaceId=nothing, deviceIndex=nothing, subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, deleteOnTermination=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) = 
         new(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
export InstanceNetworkInterfaceSetItemRequestType


type NetworkAclIdSetType
    item::Union(Array{NetworkAclIdSetItemType,1}, Nothing)

    NetworkAclIdSetType(; item=nothing) = 
         new(item)
end
export NetworkAclIdSetType


type InstanceStatusSetType
    item::Union(Array{InstanceStatusItemType,1}, Nothing)

    InstanceStatusSetType(; item=nothing) = 
         new(item)
end
export InstanceStatusSetType


type DescribeInstancesInfoType
    item::Union(Array{DescribeInstancesItemType,1}, Nothing)

    DescribeInstancesInfoType(; item=nothing) = 
         new(item)
end
export DescribeInstancesInfoType


type ImportInstanceGroupSetType
    item::Union(Array{ImportInstanceGroupItemType,1}, Nothing)

    ImportInstanceGroupSetType(; item=nothing) = 
         new(item)
end
export ImportInstanceGroupSetType


type MonitorInstancesSetType
    item::Union(Array{MonitorInstancesSetItemType,1}, Nothing)

    MonitorInstancesSetType(; item=nothing) = 
         new(item)
end
export MonitorInstancesSetType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)
    limitPrice::Union(ReservedInstanceLimitPriceType, Nothing)

    PurchaseReservedInstancesOfferingType(; reservedInstancesOfferingId=nothing, instanceCount=nothing, limitPrice=nothing) = 
         new(reservedInstancesOfferingId, instanceCount, limitPrice)
end
export PurchaseReservedInstancesOfferingType


type DescribeReservedInstancesOfferingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesOfferingsSet::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsResponseType(; requestId=nothing, reservedInstancesOfferingsSet=nothing, nextToken=nothing) = 
         new(requestId, reservedInstancesOfferingsSet, nextToken)
end
export DescribeReservedInstancesOfferingsResponseType


type CreateNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int32, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    CreateNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
export CreateNetworkAclEntryType


type RevokeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    RevokeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) = 
         new(userId, ipPermissions)
end
export RevokeSecurityGroupIngressType


type DescribeInstanceStatusType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)
    maxResults::Union(Int32, Nothing)
    includeAllInstances::Union(Bool, Nothing)

    DescribeInstanceStatusType(; instancesSet=nothing, filterSet=nothing, nextToken=nothing, maxResults=nothing, includeAllInstances=nothing) = 
         new(instancesSet, filterSet, nextToken, maxResults, includeAllInstances)
end
export DescribeInstanceStatusType


type DescribeKeyPairsType
    keySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeKeyPairsType(; keySet=nothing, filterSet=nothing) = 
         new(keySet, filterSet)
end
export DescribeKeyPairsType


type PropagatingVgwSetType
    item::Union(Array{PropagatingVgwType,1}, Nothing)

    PropagatingVgwSetType(; item=nothing) = 
         new(item)
end
export PropagatingVgwSetType


type AttachmentSetResponseType
    item::Union(Array{AttachmentSetItemResponseType,1}, Nothing)

    AttachmentSetResponseType(; item=nothing) = 
         new(item)
end
export AttachmentSetResponseType


type DescribeCustomerGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGatewaySet::Union(Array{CustomerGatewayType,1}, Nothing)

    DescribeCustomerGatewaysResponseType(; requestId=nothing, customerGatewaySet=nothing) = 
         new(requestId, customerGatewaySet)
end
export DescribeCustomerGatewaysResponseType


type PricingDetailsSetType
    item::Union(Array{PricingDetailsSetItemType,1}, Nothing)

    PricingDetailsSetType(; item=nothing) = 
         new(item)
end
export PricingDetailsSetType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union(Array{ASCIIString,1}, Nothing)
    reservedInstancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeReservedInstancesListingsType(; reservedInstancesListingSet=nothing, reservedInstancesSet=nothing, filterSet=nothing) = 
         new(reservedInstancesListingSet, reservedInstancesSet, filterSet)
end
export DescribeReservedInstancesListingsType


type DescribeVolumesSetItemResponseType
    volumeId::Union(ASCIIString, Nothing)
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    createTime::Union(XSDateTime, Nothing)
    attachmentSet::Union(Array{AttachmentSetItemResponseType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    DescribeVolumesSetItemResponseType(; volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, attachmentSet=nothing, tagSet=nothing, volumeType=nothing, iops=nothing) = 
         new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops)
end
export DescribeVolumesSetItemResponseType


type ProductCodeListType
    item::Union(Array{ProductCodeItemType,1}, Nothing)

    ProductCodeListType(; item=nothing) = 
         new(item)
end
export ProductCodeListType


type CreateNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAcl::Union(NetworkAclType, Nothing)

    CreateNetworkAclResponseType(; requestId=nothing, networkAcl=nothing) = 
         new(requestId, networkAcl)
end
export CreateNetworkAclResponseType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    DescribeSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) = 
         new(requestId, spotDatafeedSubscription)
end
export DescribeSpotDatafeedSubscriptionResponseType


type DescribeSnapshotsOwnersType
    item::Union(Array{DescribeSnapshotsOwnerType,1}, Nothing)

    DescribeSnapshotsOwnersType(; item=nothing) = 
         new(item)
end
export DescribeSnapshotsOwnersType


type DescribeTagsType
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeTagsType(; filterSet=nothing) = 
         new(filterSet)
end
export DescribeTagsType


type DescribeAccountAttributesResponseType
    requestId::Union(ASCIIString, Nothing)
    accountAttributeSet::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    DescribeAccountAttributesResponseType(; requestId=nothing, accountAttributeSet=nothing) = 
         new(requestId, accountAttributeSet)
end
export DescribeAccountAttributesResponseType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    CreateSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) = 
         new(requestId, spotDatafeedSubscription)
end
export CreateSpotDatafeedSubscriptionResponseType


type DescribeSecurityGroupsIdSetType
    item::Union(Array{DescribeSecurityGroupsIdSetItemType,1}, Nothing)

    DescribeSecurityGroupsIdSetType(; item=nothing) = 
         new(item)
end
export DescribeSecurityGroupsIdSetType


type DescribeVolumeStatusType
    volumeSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusType(; volumeSet=nothing, filterSet=nothing, maxResults=nothing, nextToken=nothing) = 
         new(volumeSet, filterSet, maxResults, nextToken)
end
export DescribeVolumeStatusType


type DescribeReservedInstancesSetType
    item::Union(Array{DescribeReservedInstancesSetItemType,1}, Nothing)

    DescribeReservedInstancesSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesSetType


type CreateCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGateway::Union(CustomerGatewayType, Nothing)

    CreateCustomerGatewayResponseType(; requestId=nothing, customerGateway=nothing) = 
         new(requestId, customerGateway)
end
export CreateCustomerGatewayResponseType


type DescribeSpotPriceHistoryType
    startTime::Union(XSDateTime, Nothing)
    endTime::Union(XSDateTime, Nothing)
    instanceTypeSet::Union(Array{ASCIIString,1}, Nothing)
    productDescriptionSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeSpotPriceHistoryType(; startTime=nothing, endTime=nothing, instanceTypeSet=nothing, productDescriptionSet=nothing, filterSet=nothing, availabilityZone=nothing, maxResults=nothing, nextToken=nothing) = 
         new(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken)
end
export DescribeSpotPriceHistoryType


type DescribeReservedInstancesListingsResponseSetType
    item::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseSetType(; item=nothing) = 
         new(item)
end
export DescribeReservedInstancesListingsResponseSetType


type CreateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptions::Union(DhcpOptionsType, Nothing)

    CreateDhcpOptionsResponseType(; requestId=nothing, dhcpOptions=nothing) = 
         new(requestId, dhcpOptions)
end
export CreateDhcpOptionsResponseType


type CreateInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGateway::Union(InternetGatewayType, Nothing)

    CreateInternetGatewayResponseType(; requestId=nothing, internetGateway=nothing) = 
         new(requestId, internetGateway)
end
export CreateInternetGatewayResponseType


type FilterSetType
    item::Union(Array{FilterType,1}, Nothing)

    FilterSetType(; item=nothing) = 
         new(item)
end
export FilterSetType


type AvailabilityZoneSetType
    item::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    AvailabilityZoneSetType(; item=nothing) = 
         new(item)
end
export AvailabilityZoneSetType


type CreateVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnection::Union(VpnConnectionType, Nothing)

    CreateVpnConnectionResponseType(; requestId=nothing, vpnConnection=nothing) = 
         new(requestId, vpnConnection)
end
export CreateVpnConnectionResponseType


type InstanceStateChangeType
    instanceId::Union(ASCIIString, Nothing)
    currentState::Union(InstanceStateType, Nothing)
    previousState::Union(InstanceStateType, Nothing)

    InstanceStateChangeType(; instanceId=nothing, currentState=nothing, previousState=nothing) = 
         new(instanceId, currentState, previousState)
end
export InstanceStateChangeType


type ReportInstanceStatusReasonCodesSetType
    item::Union(Array{ReportInstanceStatusReasonCodeSetItemType,1}, Nothing)

    ReportInstanceStatusReasonCodesSetType(; item=nothing) = 
         new(item)
end
export ReportInstanceStatusReasonCodesSetType


type DescribeBundleTasksType
    bundlesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeBundleTasksType(; bundlesSet=nothing, filterSet=nothing) = 
         new(bundlesSet, filterSet)
end
export DescribeBundleTasksType


type DescribeRouteTablesType
    routeTableIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeRouteTablesType(; routeTableIdSet=nothing, filterSet=nothing) = 
         new(routeTableIdSet, filterSet)
end
export DescribeRouteTablesType


type DescribeVpnGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGatewaySet::Union(Array{VpnGatewayType,1}, Nothing)

    DescribeVpnGatewaysResponseType(; requestId=nothing, vpnGatewaySet=nothing) = 
         new(requestId, vpnGatewaySet)
end
export DescribeVpnGatewaysResponseType


type DescribePlacementGroupsInfoType
    item::Union(Array{DescribePlacementGroupItemType,1}, Nothing)

    DescribePlacementGroupsInfoType(; item=nothing) = 
         new(item)
end
export DescribePlacementGroupsInfoType


type DescribeSnapshotsSetItemResponseType
    snapshotId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(XSDateTime, Nothing)
    progress::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    volumeSize::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    ownerAlias::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    DescribeSnapshotsSetItemResponseType(; snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing, ownerAlias=nothing, tagSet=nothing) = 
         new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet)
end
export DescribeSnapshotsSetItemResponseType


type DescribeSecurityGroupsType
    securityGroupSet::Union(Array{ASCIIString,1}, Nothing)
    securityGroupIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSecurityGroupsType(; securityGroupSet=nothing, securityGroupIdSet=nothing, filterSet=nothing) = 
         new(securityGroupSet, securityGroupIdSet, filterSet)
end
export DescribeSecurityGroupsType


type CancelBundleTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    CancelBundleTaskResponseType(; requestId=nothing, bundleInstanceTask=nothing) = 
         new(requestId, bundleInstanceTask)
end
export CancelBundleTaskResponseType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)

    NetworkInterfacePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) = 
         new(privateIpAddress, privateDnsName, primary, association)
end
export NetworkInterfacePrivateIpAddressesSetItemType


type InstanceTypeSetType
    item::Union(Array{InstanceTypeSetItemType,1}, Nothing)

    InstanceTypeSetType(; item=nothing) = 
         new(item)
end
export InstanceTypeSetType


type DiskImageType
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    DiskImageType(; image=nothing, description=nothing, volume=nothing) = 
         new(image, description, volume)
end
export DiskImageType


type AccountAttributeSetType
    item::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    AccountAttributeSetType(; item=nothing) = 
         new(item)
end
export AccountAttributeSetType


type UserIdGroupPairSetType
    item::Union(Array{UserIdGroupPairType,1}, Nothing)

    UserIdGroupPairSetType(; item=nothing) = 
         new(item)
end
export UserIdGroupPairSetType


type ResourceTagSetType
    item::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ResourceTagSetType(; item=nothing) = 
         new(item)
end
export ResourceTagSetType


type NetworkAclEntrySetType
    item::Union(Array{NetworkAclEntryType,1}, Nothing)

    NetworkAclEntrySetType(; item=nothing) = 
         new(item)
end
export NetworkAclEntrySetType


type LaunchPermissionListType
    item::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionListType(; item=nothing) = 
         new(item)
end
export LaunchPermissionListType


type StartInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    StartInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
export StartInstancesResponseType


type SecurityGroupIdSetType
    item::Union(Array{SecurityGroupIdSetItemType,1}, Nothing)

    SecurityGroupIdSetType(; item=nothing) = 
         new(item)
end
export SecurityGroupIdSetType


type InternetGatewayAttachmentSetType
    item::Union(Array{InternetGatewayAttachmentType,1}, Nothing)

    InternetGatewayAttachmentSetType(; item=nothing) = 
         new(item)
end
export InternetGatewayAttachmentSetType


type ConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)
    expirationTime::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ConversionTaskType(; conversionTaskId=nothing, expirationTime=nothing, state=nothing, statusMessage=nothing, tagSet=nothing) = 
         new(conversionTaskId, expirationTime, state, statusMessage, tagSet)
end
export ConversionTaskType


type VolumeStatusDetailsSetType
    item::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusDetailsSetType(; item=nothing) = 
         new(item)
end
export VolumeStatusDetailsSetType


type AttachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    attachment::Union(AttachmentType, Nothing)

    AttachVpnGatewayResponseType(; requestId=nothing, attachment=nothing) = 
         new(requestId, attachment)
end
export AttachVpnGatewayResponseType


type MonitorInstancesResponseSetItemType
    instanceId::Union(ASCIIString, Nothing)
    monitoring::Union(InstanceMonitoringStateType, Nothing)

    MonitorInstancesResponseSetItemType(; instanceId=nothing, monitoring=nothing) = 
         new(instanceId, monitoring)
end
export MonitorInstancesResponseSetItemType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)

    InstancePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) = 
         new(privateIpAddress, privateDnsName, primary, association)
end
export InstancePrivateIpAddressesSetItemType


type DescribeDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptionsSet::Union(Array{DhcpOptionsType,1}, Nothing)

    DescribeDhcpOptionsResponseType(; requestId=nothing, dhcpOptionsSet=nothing) = 
         new(requestId, dhcpOptionsSet)
end
export DescribeDhcpOptionsResponseType


type AuthorizeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    AuthorizeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) = 
         new(userId, ipPermissions)
end
export AuthorizeSecurityGroupIngressType


type RouteSetType
    item::Union(Array{RouteType,1}, Nothing)

    RouteSetType(; item=nothing) = 
         new(item)
end
export RouteSetType


type RouteTableSetType
    item::Union(Array{RouteTableType,1}, Nothing)

    RouteTableSetType(; item=nothing) = 
         new(item)
end
export RouteTableSetType


type CreateVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGateway::Union(VpnGatewayType, Nothing)

    CreateVpnGatewayResponseType(; requestId=nothing, vpnGateway=nothing) = 
         new(requestId, vpnGateway)
end
export CreateVpnGatewayResponseType


type PrivateIpAddressesSetRequestType
    item::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)

    PrivateIpAddressesSetRequestType(; item=nothing) = 
         new(item)
end
export PrivateIpAddressesSetRequestType


type CreateReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    CreateReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
export CreateReservedInstancesListingResponseType


type ImportInstanceVolumeDetailSetType
    item::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)

    ImportInstanceVolumeDetailSetType(; item=nothing) = 
         new(item)
end
export ImportInstanceVolumeDetailSetType


type DhcpConfigurationItemSetType
    item::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    DhcpConfigurationItemSetType(; item=nothing) = 
         new(item)
end
export DhcpConfigurationItemSetType


type DescribeRouteTablesResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTableSet::Union(Array{RouteTableType,1}, Nothing)

    DescribeRouteTablesResponseType(; requestId=nothing, routeTableSet=nothing) = 
         new(requestId, routeTableSet)
end
export DescribeRouteTablesResponseType


type DhcpOptionsIdSetType
    item::Union(Array{DhcpOptionsIdSetItemType,1}, Nothing)

    DhcpOptionsIdSetType(; item=nothing) = 
         new(item)
end
export DhcpOptionsIdSetType


type DescribeRegionsType
    regionSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeRegionsType(; regionSet=nothing, filterSet=nothing) = 
         new(regionSet, filterSet)
end
export DescribeRegionsType


type DescribeInternetGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGatewaySet::Union(Array{InternetGatewayType,1}, Nothing)

    DescribeInternetGatewaysResponseType(; requestId=nothing, internetGatewaySet=nothing) = 
         new(requestId, internetGatewaySet)
end
export DescribeInternetGatewaysResponseType


type BundleInstanceType
    instanceId::Union(ASCIIString, Nothing)
    storage::Union(BundleInstanceTaskStorageType, Nothing)

    BundleInstanceType(; instanceId=nothing, storage=nothing) = 
         new(instanceId, storage)
end
export BundleInstanceType


type ImportInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportInstanceResponseType(; requestId=nothing, conversionTask=nothing) = 
         new(requestId, conversionTask)
end
export ImportInstanceResponseType


type DescribeAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    addressesSet::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseType(; requestId=nothing, addressesSet=nothing) = 
         new(requestId, addressesSet)
end
export DescribeAddressesResponseType


type CancelSpotInstanceRequestsResponseSetType
    item::Union(Array{CancelSpotInstanceRequestsResponseSetItemType,1}, Nothing)

    CancelSpotInstanceRequestsResponseSetType(; item=nothing) = 
         new(item)
end
export CancelSpotInstanceRequestsResponseSetType


type DhcpValueSetType
    item::Union(Array{DhcpValueType,1}, Nothing)

    DhcpValueSetType(; item=nothing) = 
         new(item)
end
export DhcpValueSetType


type LaunchSpecificationResponseType
    imageId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationResponseType(; imageId=nothing, keyName=nothing, groupSet=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
export LaunchSpecificationResponseType


type CreateVolumePermissionListType
    item::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionListType(; item=nothing) = 
         new(item)
end
export CreateVolumePermissionListType


type AccountAttributeNameSetType
    item::Union(Array{AccountAttributeNameSetItemType,1}, Nothing)

    AccountAttributeNameSetType(; item=nothing) = 
         new(item)
end
export AccountAttributeNameSetType


type DescribeImagesResponseItemType
    imageId::Union(ASCIIString, Nothing)
    imageLocation::Union(ASCIIString, Nothing)
    imageState::Union(ASCIIString, Nothing)
    imageOwnerId::Union(ASCIIString, Nothing)
    isPublic::Union(Bool, Nothing)
    productCodes::Union(Array{ProductCodesSetItemType,1}, Nothing)
    architecture::Union(ASCIIString, Nothing)
    imageType::Union(ASCIIString, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    platform::Union(ASCIIString, Nothing)
    stateReason::Union(StateReasonType, Nothing)
    imageOwnerAlias::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    rootDeviceType::Union(ASCIIString, Nothing)
    rootDeviceName::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    virtualizationType::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    hypervisor::Union(ASCIIString, Nothing)

    DescribeImagesResponseItemType(; imageId=nothing, imageLocation=nothing, imageState=nothing, imageOwnerId=nothing, isPublic=nothing, productCodes=nothing, architecture=nothing, imageType=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, stateReason=nothing, imageOwnerAlias=nothing, name=nothing, description=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, virtualizationType=nothing, tagSet=nothing, hypervisor=nothing) = 
         new(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor)
end
export DescribeImagesResponseItemType


type RunInstancesType
    imageId::Union(ASCIIString, Nothing)
    minCount::Union(Int32, Nothing)
    maxCount::Union(Int32, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    additionalInfo::Union(ASCIIString, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(PlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    disableApiTermination::Union(Bool, Nothing)
    instanceInitiatedShutdownBehavior::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseRequestType, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, groupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
export RunInstancesType


type LaunchSpecificationRequestType
    imageId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationRequestType(; imageId=nothing, keyName=nothing, groupSet=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, keyName, groupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
export LaunchSpecificationRequestType


type DescribeVpnConnectionsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnectionSet::Union(Array{VpnConnectionType,1}, Nothing)

    DescribeVpnConnectionsResponseType(; requestId=nothing, vpnConnectionSet=nothing) = 
         new(requestId, vpnConnectionSet)
end
export DescribeVpnConnectionsResponseType


type VolumeStatusItemType
    volumeId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeStatus::Union(VolumeStatusInfoType, Nothing)
    eventsSet::Union(Array{VolumeStatusEventItemType,1}, Nothing)
    actionsSet::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusItemType(; volumeId=nothing, availabilityZone=nothing, volumeStatus=nothing, eventsSet=nothing, actionsSet=nothing) = 
         new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end
export VolumeStatusItemType


type VolumeStatusSetType
    item::Union(Array{VolumeStatusItemType,1}, Nothing)

    VolumeStatusSetType(; item=nothing) = 
         new(item)
end
export VolumeStatusSetType


type ImportInstanceType
    description::Union(ASCIIString, Nothing)
    launchSpecification::Union(ImportInstanceLaunchSpecificationType, Nothing)
    diskImageSet::Union(Array{DiskImageType,1}, Nothing)
    keepPartialImports::Union(Bool, Nothing)
    platform::Union(ASCIIString, Nothing)

    ImportInstanceType(; description=nothing, launchSpecification=nothing, diskImageSet=nothing, keepPartialImports=nothing, platform=nothing) = 
         new(description, launchSpecification, diskImageSet, keepPartialImports, platform)
end
export ImportInstanceType


type SpotInstanceRequestSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    spotPrice::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    fault::Union(SpotInstanceStateFaultType, Nothing)
    status::Union(SpotInstanceStatusMessageType, Nothing)
    validFrom::Union(XSDateTime, Nothing)
    validUntil::Union(XSDateTime, Nothing)
    launchGroup::Union(ASCIIString, Nothing)
    availabilityZoneGroup::Union(ASCIIString, Nothing)
    launchSpecification::Union(LaunchSpecificationResponseType, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    createTime::Union(XSDateTime, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    launchedAvailabilityZone::Union(ASCIIString, Nothing)

    SpotInstanceRequestSetItemType(; spotInstanceRequestId=nothing, spotPrice=nothing, _type=nothing, state=nothing, fault=nothing, status=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing, instanceId=nothing, createTime=nothing, productDescription=nothing, tagSet=nothing, launchedAvailabilityZone=nothing) = 
         new(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone)
end
export SpotInstanceRequestSetItemType


type DescribeVolumesResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeSet::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesResponseType(; requestId=nothing, volumeSet=nothing) = 
         new(requestId, volumeSet)
end
export DescribeVolumesResponseType


type InstanceStateChangeSetType
    item::Union(Array{InstanceStateChangeType,1}, Nothing)

    InstanceStateChangeSetType(; item=nothing) = 
         new(item)
end
export InstanceStateChangeSetType


type DescribeVolumesSetResponseType
    item::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesSetResponseType(; item=nothing) = 
         new(item)
end
export DescribeVolumesSetResponseType


type BundleInstanceTasksSetType
    item::Union(Array{BundleInstanceTaskType,1}, Nothing)

    BundleInstanceTasksSetType(; item=nothing) = 
         new(item)
end
export BundleInstanceTasksSetType


type DescribeSnapshotsResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotSet::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsResponseType(; requestId=nothing, snapshotSet=nothing) = 
         new(requestId, snapshotSet)
end
export DescribeSnapshotsResponseType


type SpotInstanceRequestSetType
    item::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    SpotInstanceRequestSetType(; item=nothing) = 
         new(item)
end
export SpotInstanceRequestSetType


type CreateSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    subnet::Union(SubnetType, Nothing)

    CreateSubnetResponseType(; requestId=nothing, subnet=nothing) = 
         new(requestId, subnet)
end
export CreateSubnetResponseType


type TerminateInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    TerminateInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
export TerminateInstancesResponseType


type StopInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    StopInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
export StopInstancesResponseType


type RequestSpotInstancesType
    spotPrice::Union(ASCIIString, Nothing)
    instanceCount::Union(Int, Nothing)
    _type::Union(ASCIIString, Nothing)
    validFrom::Union(XSDateTime, Nothing)
    validUntil::Union(XSDateTime, Nothing)
    launchGroup::Union(ASCIIString, Nothing)
    availabilityZoneGroup::Union(ASCIIString, Nothing)
    launchSpecification::Union(LaunchSpecificationRequestType, Nothing)

    RequestSpotInstancesType(; spotPrice=nothing, instanceCount=nothing, _type=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing) = 
         new(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification)
end
export RequestSpotInstancesType


type CreateVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    vpc::Union(VpcType, Nothing)

    CreateVpcResponseType(; requestId=nothing, vpc=nothing) = 
         new(requestId, vpc)
end
export CreateVpcResponseType


type NetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    requesterId::Union(ASCIIString, Nothing)
    requesterManaged::Union(Bool, Nothing)
    status::Union(ASCIIString, Nothing)
    macAddress::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    sourceDestCheck::Union(Bool, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    attachment::Union(NetworkInterfaceAttachmentType, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    privateIpAddressesSet::Union(Array{NetworkInterfacePrivateIpAddressesSetItemType,1}, Nothing)

    NetworkInterfaceType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, availabilityZone=nothing, description=nothing, ownerId=nothing, requesterId=nothing, requesterManaged=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, tagSet=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet)
end
export NetworkInterfaceType


type VpnGatewaySetType
    item::Union(Array{VpnGatewayType,1}, Nothing)

    VpnGatewaySetType(; item=nothing) = 
         new(item)
end
export VpnGatewaySetType


type DiskImageSetType
    item::Union(Array{DiskImageType,1}, Nothing)

    DiskImageSetType(; item=nothing) = 
         new(item)
end
export DiskImageSetType


type InstanceNetworkInterfaceSetRequestType
    item::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)

    InstanceNetworkInterfaceSetRequestType(; item=nothing) = 
         new(item)
end
export InstanceNetworkInterfaceSetRequestType


type ConversionTaskSetType
    item::Union(Array{ConversionTaskType,1}, Nothing)

    ConversionTaskSetType(; item=nothing) = 
         new(item)
end
export ConversionTaskSetType


type InstancePrivateIpAddressesSetType
    item::Union(Array{InstancePrivateIpAddressesSetItemType,1}, Nothing)

    InstancePrivateIpAddressesSetType(; item=nothing) = 
         new(item)
end
export InstancePrivateIpAddressesSetType


type NetworkAclSetType
    item::Union(Array{NetworkAclType,1}, Nothing)

    NetworkAclSetType(; item=nothing) = 
         new(item)
end
export NetworkAclSetType


type DescribeSnapshotsSetResponseType
    item::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsSetResponseType(; item=nothing) = 
         new(item)
end
export DescribeSnapshotsSetResponseType


type RequestSpotInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    RequestSpotInstancesResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
export RequestSpotInstancesResponseType


type DescribeSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    DescribeSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
export DescribeSpotInstanceRequestsResponseType


type DescribeNetworkAclsResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAclSet::Union(Array{NetworkAclType,1}, Nothing)

    DescribeNetworkAclsResponseType(; requestId=nothing, networkAclSet=nothing) = 
         new(requestId, networkAclSet)
end
export DescribeNetworkAclsResponseType


type ImportVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportVolumeResponseType(; requestId=nothing, conversionTask=nothing) = 
         new(requestId, conversionTask)
end
export ImportVolumeResponseType


type DescribeVolumeStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeStatusSet::Union(Array{VolumeStatusItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusResponseType(; requestId=nothing, volumeStatusSet=nothing, nextToken=nothing) = 
         new(requestId, volumeStatusSet, nextToken)
end
export DescribeVolumeStatusResponseType


type MonitorInstancesResponseSetType
    item::Union(Array{MonitorInstancesResponseSetItemType,1}, Nothing)

    MonitorInstancesResponseSetType(; item=nothing) = 
         new(item)
end
export MonitorInstancesResponseSetType


type DescribeImagesResponseType
    requestId::Union(ASCIIString, Nothing)
    imagesSet::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseType(; requestId=nothing, imagesSet=nothing) = 
         new(requestId, imagesSet)
end
export DescribeImagesResponseType


type NetworkInterfacePrivateIpAddressesSetType
    item::Union(Array{NetworkInterfacePrivateIpAddressesSetItemType,1}, Nothing)

    NetworkInterfacePrivateIpAddressesSetType(; item=nothing) = 
         new(item)
end
export NetworkInterfacePrivateIpAddressesSetType


type DescribeImagesResponseInfoType
    item::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseInfoType(; item=nothing) = 
         new(item)
end
export DescribeImagesResponseInfoType


type SecurityGroupItemType
    ownerId::Union(ASCIIString, Nothing)
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    groupDescription::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)
    ipPermissionsEgress::Union(Array{IpPermissionType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    SecurityGroupItemType(; ownerId=nothing, groupId=nothing, groupName=nothing, groupDescription=nothing, vpcId=nothing, ipPermissions=nothing, ipPermissionsEgress=nothing, tagSet=nothing) = 
         new(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet)
end
export SecurityGroupItemType


type MonitorInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{MonitorInstancesResponseSetItemType,1}, Nothing)

    MonitorInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
export MonitorInstancesResponseType


type DhcpOptionsSetType
    item::Union(Array{DhcpOptionsType,1}, Nothing)

    DhcpOptionsSetType(; item=nothing) = 
         new(item)
end
export DhcpOptionsSetType


type AuthorizeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    AuthorizeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) = 
         new(groupId, ipPermissions)
end
export AuthorizeSecurityGroupEgressType


type BundleInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    BundleInstanceResponseType(; requestId=nothing, bundleInstanceTask=nothing) = 
         new(requestId, bundleInstanceTask)
end
export BundleInstanceResponseType


type SubnetSetType
    item::Union(Array{SubnetType,1}, Nothing)

    SubnetSetType(; item=nothing) = 
         new(item)
end
export SubnetSetType


type DescribeNetworkInterfacesResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{NetworkInterfaceType,1}, Nothing)

    DescribeNetworkInterfacesResponseType(; requestId=nothing, networkInterfaceSet=nothing) = 
         new(requestId, networkInterfaceSet)
end
export DescribeNetworkInterfacesResponseType


type VpnConnectionSetType
    item::Union(Array{VpnConnectionType,1}, Nothing)

    VpnConnectionSetType(; item=nothing) = 
         new(item)
end
export VpnConnectionSetType


type DescribeSubnetsResponseType
    requestId::Union(ASCIIString, Nothing)
    subnetSet::Union(Array{SubnetType,1}, Nothing)

    DescribeSubnetsResponseType(; requestId=nothing, subnetSet=nothing) = 
         new(requestId, subnetSet)
end
export DescribeSubnetsResponseType


type CreateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTable::Union(RouteTableType, Nothing)

    CreateRouteTableResponseType(; requestId=nothing, routeTable=nothing) = 
         new(requestId, routeTable)
end
export CreateRouteTableResponseType


type InstanceNetworkInterfaceSetItemType
    networkInterfaceId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    macAddress::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    sourceDestCheck::Union(Bool, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    attachment::Union(InstanceNetworkInterfaceAttachmentType, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)
    privateIpAddressesSet::Union(Array{InstancePrivateIpAddressesSetItemType,1}, Nothing)

    InstanceNetworkInterfaceSetItemType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, description=nothing, ownerId=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet)
end
export InstanceNetworkInterfaceSetItemType


type DescribeConversionTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTasks::Union(Array{ConversionTaskType,1}, Nothing)

    DescribeConversionTasksResponseType(; requestId=nothing, conversionTasks=nothing) = 
         new(requestId, conversionTasks)
end
export DescribeConversionTasksResponseType


type CreateNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterface::Union(NetworkInterfaceType, Nothing)

    CreateNetworkInterfaceResponseType(; requestId=nothing, networkInterface=nothing) = 
         new(requestId, networkInterface)
end
export CreateNetworkInterfaceResponseType


type RunningInstancesItemType
    instanceId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)
    instanceState::Union(InstanceStateType, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    dnsName::Union(ASCIIString, Nothing)
    reason::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    amiLaunchIndex::Union(ASCIIString, Nothing)
    productCodes::Union(Array{ProductCodesSetItemType,1}, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    launchTime::Union(XSDateTime, Nothing)
    placement::Union(PlacementResponseType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    platform::Union(ASCIIString, Nothing)
    monitoring::Union(InstanceMonitoringStateType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    sourceDestCheck::Union(Bool, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    stateReason::Union(StateReasonType, Nothing)
    architecture::Union(ASCIIString, Nothing)
    rootDeviceType::Union(ASCIIString, Nothing)
    rootDeviceName::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    instanceLifecycle::Union(ASCIIString, Nothing)
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseResponseType, Nothing)
    virtualizationType::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)
    hypervisor::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{InstanceNetworkInterfaceSetItemType,1}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileResponseType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunningInstancesItemType(; instanceId=nothing, imageId=nothing, instanceState=nothing, privateDnsName=nothing, dnsName=nothing, reason=nothing, keyName=nothing, amiLaunchIndex=nothing, productCodes=nothing, instanceType=nothing, launchTime=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, monitoring=nothing, subnetId=nothing, vpcId=nothing, privateIpAddress=nothing, ipAddress=nothing, sourceDestCheck=nothing, groupSet=nothing, stateReason=nothing, architecture=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, instanceLifecycle=nothing, spotInstanceRequestId=nothing, license=nothing, virtualizationType=nothing, clientToken=nothing, tagSet=nothing, hypervisor=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
export RunningInstancesItemType


type RunningInstancesSetType
    item::Union(Array{RunningInstancesItemType,1}, Nothing)

    RunningInstancesSetType(; item=nothing) = 
         new(item)
end
export RunningInstancesSetType


type DescribeSecurityGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    securityGroupInfo::Union(Array{SecurityGroupItemType,1}, Nothing)

    DescribeSecurityGroupsResponseType(; requestId=nothing, securityGroupInfo=nothing) = 
         new(requestId, securityGroupInfo)
end
export DescribeSecurityGroupsResponseType


type InstanceNetworkInterfaceSetType
    item::Union(Array{InstanceNetworkInterfaceSetItemType,1}, Nothing)

    InstanceNetworkInterfaceSetType(; item=nothing) = 
         new(item)
end
export InstanceNetworkInterfaceSetType


type NetworkInterfaceSetType
    item::Union(Array{NetworkInterfaceType,1}, Nothing)

    NetworkInterfaceSetType(; item=nothing) = 
         new(item)
end
export NetworkInterfaceSetType


type SecurityGroupSetType
    item::Union(Array{SecurityGroupItemType,1}, Nothing)

    SecurityGroupSetType(; item=nothing) = 
         new(item)
end
export SecurityGroupSetType


type ReservationInfoType
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    instancesSet::Union(Array{RunningInstancesItemType,1}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    ReservationInfoType(; reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) = 
         new(reservationId, ownerId, groupSet, instancesSet, requesterId)
end
export ReservationInfoType


type RunInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    instancesSet::Union(Array{RunningInstancesItemType,1}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    RunInstancesResponseType(; requestId=nothing, reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) = 
         new(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId)
end
export RunInstancesResponseType


type ReservationSetType
    item::Union(Array{ReservationInfoType,1}, Nothing)

    ReservationSetType(; item=nothing) = 
         new(item)
end
export ReservationSetType


type DescribeInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationSet::Union(Array{ReservationInfoType,1}, Nothing)

    DescribeInstancesResponseType(; requestId=nothing, reservationSet=nothing) = 
         new(requestId, reservationSet)
end
export DescribeInstancesResponseType


