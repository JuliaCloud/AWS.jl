type CreateImageType
    instanceId::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    noReboot::Union(Bool, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)

    CreateImageType(instanceId, name, description, noReboot, blockDeviceMapping) = 
         new(instanceId, name, description, noReboot, blockDeviceMapping)
    CreateImageType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export CreateImageType


type CreateImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CreateImageResponseType(requestId, imageId) = 
         new(requestId, imageId)
    CreateImageResponseType() = 
        new(nothing, nothing)
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

    RegisterImageType(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping) = 
         new(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping)
    RegisterImageType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RegisterImageType


type RegisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    RegisterImageResponseType(requestId, imageId) = 
         new(requestId, imageId)
    RegisterImageResponseType() = 
        new(nothing, nothing)
end
export RegisterImageResponseType


type DeregisterImageType
    imageId::Union(ASCIIString, Nothing)

    DeregisterImageType(imageId) = 
         new(imageId)
    DeregisterImageType() = 
        new(nothing)
end
export DeregisterImageType


type DeregisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeregisterImageResponseType(requestId, _return) = 
         new(requestId, _return)
    DeregisterImageResponseType() = 
        new(nothing, nothing)
end
export DeregisterImageResponseType


type CreateKeyPairType
    keyName::Union(ASCIIString, Nothing)

    CreateKeyPairType(keyName) = 
         new(keyName)
    CreateKeyPairType() = 
        new(nothing)
end
export CreateKeyPairType


type CreateKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)
    keyMaterial::Union(ASCIIString, Nothing)

    CreateKeyPairResponseType(requestId, keyName, keyFingerprint, keyMaterial) = 
         new(requestId, keyName, keyFingerprint, keyMaterial)
    CreateKeyPairResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::Union(ASCIIString, Nothing)
    publicKeyMaterial::Union(ASCIIString, Nothing)

    ImportKeyPairType(keyName, publicKeyMaterial) = 
         new(keyName, publicKeyMaterial)
    ImportKeyPairType() = 
        new(nothing, nothing)
end
export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    ImportKeyPairResponseType(requestId, keyName, keyFingerprint) = 
         new(requestId, keyName, keyFingerprint)
    ImportKeyPairResponseType() = 
        new(nothing, nothing, nothing)
end
export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::Union(ASCIIString, Nothing)

    DeleteKeyPairType(keyName) = 
         new(keyName)
    DeleteKeyPairType() = 
        new(nothing)
end
export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteKeyPairResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteKeyPairResponseType() = 
        new(nothing, nothing)
end
export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::Union(ASCIIString, Nothing)

    DescribeKeyPairsItemType(keyName) = 
         new(keyName)
    DescribeKeyPairsItemType() = 
        new(nothing)
end
export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    DescribeKeyPairsResponseItemType(keyName, keyFingerprint) = 
         new(keyName, keyFingerprint)
    DescribeKeyPairsResponseItemType() = 
        new(nothing, nothing)
end
export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)

    IamInstanceProfileRequestType(arn, name) = 
         new(arn, name)
    IamInstanceProfileRequestType() = 
        new(nothing, nothing)
end
export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)

    PrivateIpAddressesSetItemRequestType(privateIpAddress, primary) = 
         new(privateIpAddress, primary)
    PrivateIpAddressesSetItemRequestType() = 
        new(nothing, nothing)
end
export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    ImportInstanceGroupItemType(groupId, groupName) = 
         new(groupId, groupName)
    ImportInstanceGroupItemType() = 
        new(nothing, nothing)
end
export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    GroupItemType(groupId, groupName) = 
         new(groupId, groupName)
    GroupItemType() = 
        new(nothing, nothing)
end
export GroupItemType


type UserDataType
    data::Union(ASCIIString, Nothing)

    UserDataType(data) = 
         new(data)
    UserDataType() = 
        new(nothing)
end
export UserDataType


type BlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    BlockDeviceMappingItemType(deviceName) = 
         new(deviceName)
    BlockDeviceMappingItemType() = 
        new(nothing)
end
export BlockDeviceMappingItemType


type EbsBlockDeviceType
    snapshotId::Union(ASCIIString, Nothing)
    volumeSize::Union(Int32, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    EbsBlockDeviceType(snapshotId, volumeSize, deleteOnTermination, volumeType, iops) = 
         new(snapshotId, volumeSize, deleteOnTermination, volumeType, iops)
    EbsBlockDeviceType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export EbsBlockDeviceType


type PlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementRequestType(availabilityZone, groupName, tenancy) = 
         new(availabilityZone, groupName, tenancy)
    PlacementRequestType() = 
        new(nothing, nothing, nothing)
end
export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    SpotPlacementRequestType(availabilityZone, groupName) = 
         new(availabilityZone, groupName)
    SpotPlacementRequestType() = 
        new(nothing, nothing)
end
export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    InstancePlacementType(availabilityZone, groupName) = 
         new(availabilityZone, groupName)
    InstancePlacementType() = 
        new(nothing, nothing)
end
export InstancePlacementType


type MonitoringInstanceType
    enabled::Union(Bool, Nothing)

    MonitoringInstanceType(enabled) = 
         new(enabled)
    MonitoringInstanceType() = 
        new(nothing)
end
export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseRequestType(pool) = 
         new(pool)
    InstanceLicenseRequestType() = 
        new(nothing)
end
export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::Union(ASCIIString, Nothing)
    id::Union(ASCIIString, Nothing)

    IamInstanceProfileResponseType(arn, id) = 
         new(arn, id)
    IamInstanceProfileResponseType() = 
        new(nothing, nothing)
end
export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceNetworkInterfaceAttachmentType(attachmentId, deviceIndex, status, attachTime, deleteOnTermination) = 
         new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
    InstanceNetworkInterfaceAttachmentType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::Union(ASCIIString, Nothing)
    publicDnsName::Union(ASCIIString, Nothing)
    ipOwnerId::Union(ASCIIString, Nothing)

    InstanceNetworkInterfaceAssociationType(publicIp, publicDnsName, ipOwnerId) = 
         new(publicIp, publicDnsName, ipOwnerId)
    InstanceNetworkInterfaceAssociationType() = 
        new(nothing, nothing, nothing)
end
export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementResponseType(availabilityZone, groupName, tenancy) = 
         new(availabilityZone, groupName, tenancy)
    PlacementResponseType() = 
        new(nothing, nothing, nothing)
end
export PlacementResponseType


type StateReasonType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    StateReasonType(code, message) = 
         new(code, message)
    StateReasonType() = 
        new(nothing, nothing)
end
export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingResponseItemType(deviceName) = 
         new(deviceName)
    InstanceBlockDeviceMappingResponseItemType() = 
        new(nothing)
end
export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    EbsInstanceBlockDeviceMappingResponseType(volumeId, status, attachTime, deleteOnTermination) = 
         new(volumeId, status, attachTime, deleteOnTermination)
    EbsInstanceBlockDeviceMappingResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseResponseType(pool) = 
         new(pool)
    InstanceLicenseResponseType() = 
        new(nothing)
end
export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::Union(ASCIIString, Nothing)

    AccountAttributeNameSetItemType(attributeName) = 
         new(attributeName)
    AccountAttributeNameSetItemType() = 
        new(nothing)
end
export AccountAttributeNameSetItemType


type AccountAttributeSetItemType
    attributeName::Union(ASCIIString, Nothing)
    attributeValueSet::Union(Array{ASCIIString,1}, Nothing)

    AccountAttributeSetItemType(attributeName, attributeValueSet) = 
         new(attributeName, attributeValueSet)
    AccountAttributeSetItemType() = 
        new(nothing, nothing)
end
export AccountAttributeSetItemType


type AccountAttributeValueSetItemType
    attributeValue::Union(ASCIIString, Nothing)

    AccountAttributeValueSetItemType(attributeValue) = 
         new(attributeValue)
    AccountAttributeValueSetItemType() = 
        new(nothing)
end
export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeType(vpcId) = 
         new(vpcId)
    DescribeVpcAttributeType() = 
        new(nothing)
end
export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeResponseType(requestId, vpcId) = 
         new(requestId, vpcId)
    DescribeVpcAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    ModifyVpcAttributeType(vpcId) = 
         new(vpcId)
    ModifyVpcAttributeType() = 
        new(nothing)
end
export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVpcAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifyVpcAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifyVpcAttributeResponseType


type GetConsoleOutputType
    instanceId::Union(ASCIIString, Nothing)

    GetConsoleOutputType(instanceId) = 
         new(instanceId)
    GetConsoleOutputType() = 
        new(nothing)
end
export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    output::Union(ASCIIString, Nothing)

    GetConsoleOutputResponseType(requestId, instanceId, timestamp, output) = 
         new(requestId, instanceId, timestamp, output)
    GetConsoleOutputResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::Union(ASCIIString, Nothing)

    GetPasswordDataType(instanceId) = 
         new(instanceId)
    GetPasswordDataType() = 
        new(nothing)
end
export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    passwordData::Union(ASCIIString, Nothing)

    GetPasswordDataResponseType(requestId, instanceId, timestamp, passwordData) = 
         new(requestId, instanceId, timestamp, passwordData)
    GetPasswordDataResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export GetPasswordDataResponseType


type InstanceIdType
    instanceId::Union(ASCIIString, Nothing)

    InstanceIdType(instanceId) = 
         new(instanceId)
    InstanceIdType() = 
        new(nothing)
end
export InstanceIdType


type TerminateInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    TerminateInstancesType(instancesSet) = 
         new(instancesSet)
    TerminateInstancesType() = 
        new(nothing)
end
export TerminateInstancesType


type InstanceBlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingItemType(deviceName) = 
         new(deviceName)
    InstanceBlockDeviceMappingItemType() = 
        new(nothing)
end
export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceEbsBlockDeviceType(volumeId, deleteOnTermination) = 
         new(volumeId, deleteOnTermination)
    InstanceEbsBlockDeviceType() = 
        new(nothing, nothing)
end
export InstanceEbsBlockDeviceType


type StopInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    force::Union(Bool, Nothing)

    StopInstancesType(instancesSet, force) = 
         new(instancesSet, force)
    StopInstancesType() = 
        new(nothing, nothing)
end
export StopInstancesType


type StartInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    StartInstancesType(instancesSet) = 
         new(instancesSet)
    StartInstancesType() = 
        new(nothing)
end
export StartInstancesType


type RebootInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    RebootInstancesType(instancesSet) = 
         new(instancesSet)
    RebootInstancesType() = 
        new(nothing)
end
export RebootInstancesType


type RebootInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    RebootInstancesItemType(instanceId) = 
         new(instanceId)
    RebootInstancesItemType() = 
        new(nothing)
end
export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RebootInstancesResponseType(requestId, _return) = 
         new(requestId, _return)
    RebootInstancesResponseType() = 
        new(nothing, nothing)
end
export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstancesItemType(instanceId) = 
         new(instanceId)
    DescribeInstancesItemType() = 
        new(nothing)
end
export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::Union(ASCIIString, Nothing)

    UnavailableResultType(availabilityZone) = 
         new(availabilityZone)
    UnavailableResultType() = 
        new(nothing)
end
export UnavailableResultType


type DescribeImagesItemType
    imageId::Union(ASCIIString, Nothing)

    DescribeImagesItemType(imageId) = 
         new(imageId)
    DescribeImagesItemType() = 
        new(nothing)
end
export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeImagesOwnerType(owner) = 
         new(owner)
    DescribeImagesOwnerType() = 
        new(nothing)
end
export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::Union(ASCIIString, Nothing)

    DescribeImagesExecutableByType(user) = 
         new(user)
    DescribeImagesExecutableByType() = 
        new(nothing)
end
export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::Union(ASCIIString, Nothing)
    groupDescription::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    CreateSecurityGroupType(groupName, groupDescription, vpcId) = 
         new(groupName, groupDescription, vpcId)
    CreateSecurityGroupType() = 
        new(nothing, nothing, nothing)
end
export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    groupId::Union(ASCIIString, Nothing)

    CreateSecurityGroupResponseType(requestId, _return, groupId) = 
         new(requestId, _return, groupId)
    CreateSecurityGroupResponseType() = 
        new(nothing, nothing, nothing)
end
export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    DeleteSecurityGroupType(groupId, groupName) = 
         new(groupId, groupName)
    DeleteSecurityGroupType() = 
        new(nothing, nothing)
end
export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSecurityGroupResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteSecurityGroupResponseType() = 
        new(nothing, nothing)
end
export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsSetItemType(groupName) = 
         new(groupName)
    DescribeSecurityGroupsSetItemType() = 
        new(nothing)
end
export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsIdSetItemType(groupId) = 
         new(groupId)
    DescribeSecurityGroupsIdSetItemType() = 
        new(nothing)
end
export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::Union(ASCIIString, Nothing)

    IpRangeItemType(cidrIp) = 
         new(cidrIp)
    IpRangeItemType() = 
        new(nothing)
end
export IpRangeItemType


type UserIdGroupPairType
    userId::Union(ASCIIString, Nothing)
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    UserIdGroupPairType(userId, groupId, groupName) = 
         new(userId, groupId, groupName)
    UserIdGroupPairType() = 
        new(nothing, nothing, nothing)
end
export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupIngressResponseType(requestId, _return) = 
         new(requestId, _return)
    AuthorizeSecurityGroupIngressResponseType() = 
        new(nothing, nothing)
end
export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupIngressResponseType(requestId, _return) = 
         new(requestId, _return)
    RevokeSecurityGroupIngressResponseType() = 
        new(nothing, nothing)
end
export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupEgressResponseType(requestId, _return) = 
         new(requestId, _return)
    AuthorizeSecurityGroupEgressResponseType() = 
        new(nothing, nothing)
end
export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupEgressResponseType(requestId, _return) = 
         new(requestId, _return)
    RevokeSecurityGroupEgressResponseType() = 
        new(nothing, nothing)
end
export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Union(Int32, Nothing)
    name::Union(ASCIIString, Nothing)

    InstanceStateType(code, name) = 
         new(code, name)
    InstanceStateType() = 
        new(nothing, nothing)
end
export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ModifyInstanceAttributeType(instanceId) = 
         new(instanceId)
    ModifyInstanceAttributeType() = 
        new(nothing)
end
export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    SecurityGroupIdSetItemType(groupId) = 
         new(groupId)
    SecurityGroupIdSetItemType() = 
        new(nothing)
end
export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyInstanceAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifyInstanceAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ResetInstanceAttributeType(instanceId) = 
         new(instanceId)
    ResetInstanceAttributeType() = 
        new(nothing)
end
export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetInstanceAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ResetInstanceAttributeResponseType() = 
        new(nothing, nothing)
end
export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeType(instanceId) = 
         new(instanceId)
    DescribeInstanceAttributeType() = 
        new(nothing)
end
export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeResponseType(requestId, instanceId) = 
         new(requestId, instanceId)
    DescribeInstanceAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ModifyImageAttributeType(imageId) = 
         new(imageId)
    ModifyImageAttributeType() = 
        new(nothing)
end
export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    LaunchPermissionItemType(userId, group) = 
         new(userId, group)
    LaunchPermissionItemType() = 
        new(nothing, nothing)
end
export LaunchPermissionItemType


type ProductCodeItemType
    productCode::Union(ASCIIString, Nothing)

    ProductCodeItemType(productCode) = 
         new(productCode)
    ProductCodeItemType() = 
        new(nothing)
end
export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyImageAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifyImageAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ResetImageAttributeType(imageId) = 
         new(imageId)
    ResetImageAttributeType() = 
        new(nothing)
end
export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetImageAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ResetImageAttributeResponseType() = 
        new(nothing, nothing)
end
export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeType(imageId) = 
         new(imageId)
    DescribeImageAttributeType() = 
        new(nothing)
end
export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeResponseType(requestId, imageId) = 
         new(requestId, imageId)
    DescribeImageAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union(ASCIIString, Nothing)

    NullableAttributeValueType(value) = 
         new(value)
    NullableAttributeValueType() = 
        new(nothing)
end
export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union(Bool, Nothing)

    NullableAttributeBooleanValueType(value) = 
         new(value)
    NullableAttributeBooleanValueType() = 
        new(nothing)
end
export NullableAttributeBooleanValueType


type AttributeValueType
    value::Union(ASCIIString, Nothing)

    AttributeValueType(value) = 
         new(value)
    AttributeValueType() = 
        new(nothing)
end
export AttributeValueType


type AttributeBooleanValueType
    value::Union(Bool, Nothing)

    AttributeBooleanValueType(value) = 
         new(value)
    AttributeBooleanValueType() = 
        new(nothing)
end
export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceType(productCode, instanceId) = 
         new(productCode, instanceId)
    ConfirmProductInstanceType() = 
        new(nothing, nothing)
end
export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)

    ProductCodesSetItemType(productCode, _type) = 
         new(productCode, _type)
    ProductCodesSetItemType() = 
        new(nothing, nothing)
end
export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    ownerId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceResponseType(requestId, _return, ownerId) = 
         new(requestId, _return, ownerId)
    ConfirmProductInstanceResponseType() = 
        new(nothing, nothing, nothing)
end
export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::Union(ASCIIString, Nothing)

    DescribeAvailabilityZonesSetItemType(zoneName) = 
         new(zoneName)
    DescribeAvailabilityZonesSetItemType() = 
        new(nothing)
end
export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::Union(ASCIIString, Nothing)

    AvailabilityZoneMessageType(message) = 
         new(message)
    AvailabilityZoneMessageType() = 
        new(nothing)
end
export AvailabilityZoneMessageType


type AvailabilityZoneItemType
    zoneName::Union(ASCIIString, Nothing)
    zoneState::Union(ASCIIString, Nothing)
    regionName::Union(ASCIIString, Nothing)
    messageSet::Union(Array{ASCIIString,1}, Nothing)

    AvailabilityZoneItemType(zoneName, zoneState, regionName, messageSet) = 
         new(zoneName, zoneState, regionName, messageSet)
    AvailabilityZoneItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export AvailabilityZoneItemType


type AllocateAddressType
    domain::Union(ASCIIString, Nothing)

    AllocateAddressType(domain) = 
         new(domain)
    AllocateAddressType() = 
        new(nothing)
end
export AllocateAddressType


type AllocateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    publicIp::Union(ASCIIString, Nothing)
    domain::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)

    AllocateAddressResponseType(requestId, publicIp, domain, allocationId) = 
         new(requestId, publicIp, domain, allocationId)
    AllocateAddressResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)

    ReleaseAddressType(publicIp, allocationId) = 
         new(publicIp, allocationId)
    ReleaseAddressType() = 
        new(nothing, nothing)
end
export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReleaseAddressResponseType(requestId, _return) = 
         new(requestId, _return)
    ReleaseAddressResponseType() = 
        new(nothing, nothing)
end
export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::Union(ASCIIString, Nothing)

    AllocationIdSetItemType(allocationId) = 
         new(allocationId)
    AllocationIdSetItemType() = 
        new(nothing)
end
export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::Union(ASCIIString, Nothing)

    DescribeAddressesItemType(publicIp) = 
         new(publicIp)
    DescribeAddressesItemType() = 
        new(nothing)
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

    DescribeAddressesResponseItemType(publicIp, allocationId, domain, instanceId, associationId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress) = 
         new(publicIp, allocationId, domain, instanceId, associationId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress)
    DescribeAddressesResponseItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union(ASCIIString, Nothing)
    allowReassociation::Union(Bool, Nothing)

    AssociateAddressType(privateIpAddress, allowReassociation) = 
         new(privateIpAddress, allowReassociation)
    AssociateAddressType() = 
        new(nothing, nothing)
end
export AssociateAddressType


type AssociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateAddressResponseType(requestId, _return, associationId) = 
         new(requestId, _return, associationId)
    AssociateAddressResponseType() = 
        new(nothing, nothing, nothing)
end
export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    DisassociateAddressType(publicIp, associationId) = 
         new(publicIp, associationId)
    DisassociateAddressType() = 
        new(nothing, nothing)
end
export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateAddressResponseType(requestId, _return) = 
         new(requestId, _return)
    DisassociateAddressResponseType() = 
        new(nothing, nothing)
end
export DisassociateAddressResponseType


type CreateVolumeType
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int32, Nothing)

    CreateVolumeType(size, snapshotId, availabilityZone, volumeType, iops) = 
         new(size, snapshotId, availabilityZone, volumeType, iops)
    CreateVolumeType() = 
        new(nothing, nothing, nothing, nothing, nothing)
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

    CreateVolumeResponseType(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops) = 
         new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops)
    CreateVolumeResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::Union(ASCIIString, Nothing)

    DeleteVolumeType(volumeId) = 
         new(volumeId)
    DeleteVolumeType() = 
        new(nothing)
end
export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVolumeResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteVolumeResponseType() = 
        new(nothing, nothing)
end
export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumesSetItemType(volumeId) = 
         new(volumeId)
    DescribeVolumesSetItemType() = 
        new(nothing)
end
export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    AttachmentSetItemResponseType(volumeId, instanceId, device, status, attachTime, deleteOnTermination) = 
         new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
    AttachmentSetItemResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)

    AttachVolumeType(volumeId, instanceId, device) = 
         new(volumeId, instanceId, device)
    AttachVolumeType() = 
        new(nothing, nothing, nothing)
end
export AttachVolumeType


type AttachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)

    AttachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
    AttachVolumeResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export AttachVolumeResponseType


type DetachVolumeType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    force::Union(Bool, Nothing)

    DetachVolumeType(volumeId, instanceId, device, force) = 
         new(volumeId, instanceId, device, force)
    DetachVolumeType() = 
        new(nothing, nothing, nothing, nothing)
end
export DetachVolumeType


type DetachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(XSDateTime, Nothing)

    DetachVolumeResponseType(requestId, volumeId, instanceId, device, status, attachTime) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
    DetachVolumeResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CreateSnapshotType(volumeId, description) = 
         new(volumeId, description)
    CreateSnapshotType() = 
        new(nothing, nothing)
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

    CreateSnapshotResponseType(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description) = 
         new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description)
    CreateSnapshotResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::Union(ASCIIString, Nothing)
    sourceSnapshotId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CopySnapshotType(sourceRegion, sourceSnapshotId, description) = 
         new(sourceRegion, sourceSnapshotId, description)
    CopySnapshotType() = 
        new(nothing, nothing, nothing)
end
export CopySnapshotType


type CopySnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    CopySnapshotResponseType(requestId, snapshotId) = 
         new(requestId, snapshotId)
    CopySnapshotResponseType() = 
        new(nothing, nothing)
end
export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::Union(ASCIIString, Nothing)

    DeleteSnapshotType(snapshotId) = 
         new(snapshotId)
    DeleteSnapshotType() = 
        new(nothing)
end
export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSnapshotResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteSnapshotResponseType() = 
        new(nothing, nothing)
end
export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotsSetItemType(snapshotId) = 
         new(snapshotId)
    DescribeSnapshotsSetItemType() = 
        new(nothing)
end
export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeSnapshotsOwnerType(owner) = 
         new(owner)
    DescribeSnapshotsOwnerType() = 
        new(nothing)
end
export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::Union(ASCIIString, Nothing)

    DescribeSnapshotsRestorableByType(user) = 
         new(user)
    DescribeSnapshotsRestorableByType() = 
        new(nothing)
end
export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    CreateVolumePermissionItemType(userId, group) = 
         new(userId, group)
    CreateVolumePermissionItemType() = 
        new(nothing, nothing)
end
export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifySnapshotAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifySnapshotAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    ResetSnapshotAttributeType(snapshotId) = 
         new(snapshotId)
    ResetSnapshotAttributeType() = 
        new(nothing)
end
export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetSnapshotAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ResetSnapshotAttributeResponseType() = 
        new(nothing, nothing)
end
export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeType(snapshotId) = 
         new(snapshotId)
    DescribeSnapshotAttributeType() = 
        new(nothing)
end
export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeResponseType(requestId, snapshotId) = 
         new(requestId, snapshotId)
    DescribeSnapshotAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeSnapshotAttributeResponseType


type BundleInstanceS3StorageType
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)
    awsAccessKeyId::Union(ASCIIString, Nothing)
    uploadPolicy::Union(ASCIIString, Nothing)
    uploadPolicySignature::Union(ASCIIString, Nothing)

    BundleInstanceS3StorageType(bucket, prefix, awsAccessKeyId, uploadPolicy, uploadPolicySignature) = 
         new(bucket, prefix, awsAccessKeyId, uploadPolicy, uploadPolicySignature)
    BundleInstanceS3StorageType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    BundleInstanceTaskErrorType(code, message) = 
         new(code, message)
    BundleInstanceTaskErrorType() = 
        new(nothing, nothing)
end
export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::Union(ASCIIString, Nothing)

    DescribeBundleTasksItemType(bundleId) = 
         new(bundleId)
    DescribeBundleTasksItemType() = 
        new(nothing)
end
export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::Union(ASCIIString, Nothing)

    CancelBundleTaskType(bundleId) = 
         new(bundleId)
    CancelBundleTaskType() = 
        new(nothing)
end
export CancelBundleTaskType


type CopyImageType
    sourceRegion::Union(ASCIIString, Nothing)
    sourceImageId::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    CopyImageType(sourceRegion, sourceImageId, name, description, clientToken) = 
         new(sourceRegion, sourceImageId, name, description, clientToken)
    CopyImageType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export CopyImageType


type CopyImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CopyImageResponseType(requestId, imageId) = 
         new(requestId, imageId)
    CopyImageResponseType() = 
        new(nothing, nothing)
end
export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::Union(ASCIIString, Nothing)

    DescribeRegionsSetItemType(regionName) = 
         new(regionName)
    DescribeRegionsSetItemType() = 
        new(nothing)
end
export DescribeRegionsSetItemType


type RegionItemType
    regionName::Union(ASCIIString, Nothing)
    regionEndpoint::Union(ASCIIString, Nothing)

    RegionItemType(regionName, regionEndpoint) = 
         new(regionName, regionEndpoint)
    RegionItemType() = 
        new(nothing, nothing)
end
export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsSetItemType(reservedInstancesOfferingId) = 
         new(reservedInstancesOfferingId)
    DescribeReservedInstancesOfferingsSetItemType() = 
        new(nothing)
end
export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::Union(ASCIIString, Nothing)
    amount::Union(Float64, Nothing)

    RecurringChargesSetItemType(frequency, amount) = 
         new(frequency, amount)
    RecurringChargesSetItemType() = 
        new(nothing, nothing)
end
export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Union(Float64, Nothing)
    count::Union(Int32, Nothing)

    PricingDetailsSetItemType(price, count) = 
         new(price, count)
    PricingDetailsSetItemType() = 
        new(nothing, nothing)
end
export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    ReservedInstanceLimitPriceType(amount, currencyCode) = 
         new(amount, currencyCode)
    ReservedInstanceLimitPriceType() = 
        new(nothing, nothing)
end
export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesId::Union(ASCIIString, Nothing)

    PurchaseReservedInstancesOfferingResponseType(requestId, reservedInstancesId) = 
         new(requestId, reservedInstancesId)
    PurchaseReservedInstancesOfferingResponseType() = 
        new(nothing, nothing)
end
export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesSetItemType(reservedInstancesId) = 
         new(reservedInstancesId)
    DescribeReservedInstancesSetItemType() = 
        new(nothing)
end
export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Union(Int64, Nothing)
    price::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    PriceScheduleRequestSetItemType(term, price, currencyCode) = 
         new(term, price, currencyCode)
    PriceScheduleRequestSetItemType() = 
        new(nothing, nothing, nothing)
end
export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    CancelReservedInstancesListingType(reservedInstancesListingId) = 
         new(reservedInstancesListingId)
    CancelReservedInstancesListingType() = 
        new(nothing)
end
export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesListingSetItemType(reservedInstancesListingId) = 
         new(reservedInstancesListingId)
    DescribeReservedInstancesListingSetItemType() = 
        new(nothing)
end
export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)

    InstanceCountsSetItemType(state, instanceCount) = 
         new(state, instanceCount)
    InstanceCountsSetItemType() = 
        new(nothing, nothing)
end
export InstanceCountsSetItemType


type PriceScheduleSetItemType
    term::Union(Int64, Nothing)
    price::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)
    active::Union(Bool, Nothing)

    PriceScheduleSetItemType(term, price, currencyCode, active) = 
         new(term, price, currencyCode, active)
    PriceScheduleSetItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export PriceScheduleSetItemType


type MonitorInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)

    MonitorInstancesType(instancesSet) = 
         new(instancesSet)
    MonitorInstancesType() = 
        new(nothing)
end
export MonitorInstancesType


type MonitorInstancesSetItemType
    instanceId::Union(ASCIIString, Nothing)

    MonitorInstancesSetItemType(instanceId) = 
         new(instanceId)
    MonitorInstancesSetItemType() = 
        new(nothing)
end
export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::Union(ASCIIString, Nothing)

    InstanceMonitoringStateType(state) = 
         new(state)
    InstanceMonitoringStateType() = 
        new(nothing)
end
export InstanceMonitoringStateType


type AttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    AttachmentType(vpcId, state) = 
         new(vpcId, state)
    AttachmentType() = 
        new(nothing, nothing)
end
export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsResponseType(staticRoutesOnly) = 
         new(staticRoutesOnly)
    VpnConnectionOptionsResponseType() = 
        new(nothing)
end
export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::Union(ASCIIString, Nothing)
    source::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    VpnStaticRouteType(destinationCidrBlock, source, state) = 
         new(destinationCidrBlock, source, state)
    VpnStaticRouteType() = 
        new(nothing, nothing, nothing)
end
export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    lastStatusChange::Union(XSDateTime, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    acceptedRouteCount::Union(Int32, Nothing)

    VpnTunnelTelemetryType(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount) = 
         new(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount)
    VpnTunnelTelemetryType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::Union(ASCIIString, Nothing)

    CustomerGatewayIdSetItemType(customerGatewayId) = 
         new(customerGatewayId)
    CustomerGatewayIdSetItemType() = 
        new(nothing)
end
export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::Union(ASCIIString, Nothing)

    VpnGatewayIdSetItemType(vpnGatewayId) = 
         new(vpnGatewayId)
    VpnGatewayIdSetItemType() = 
        new(nothing)
end
export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::Union(ASCIIString, Nothing)

    VpnConnectionIdSetItemType(vpnConnectionId) = 
         new(vpnConnectionId)
    VpnConnectionIdSetItemType() = 
        new(nothing)
end
export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::Union(ASCIIString, Nothing)

    VpcIdSetItemType(vpcId) = 
         new(vpcId)
    VpcIdSetItemType() = 
        new(nothing)
end
export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::Union(ASCIIString, Nothing)

    SubnetIdSetItemType(subnetId) = 
         new(subnetId)
    SubnetIdSetItemType() = 
        new(nothing)
end
export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DhcpOptionsIdSetItemType(dhcpOptionsId) = 
         new(dhcpOptionsId)
    DhcpOptionsIdSetItemType() = 
        new(nothing)
end
export DhcpOptionsIdSetItemType


type DhcpConfigurationItemType
    key::Union(ASCIIString, Nothing)
    valueSet::Union(Array{ASCIIString,1}, Nothing)

    DhcpConfigurationItemType(key, valueSet) = 
         new(key, valueSet)
    DhcpConfigurationItemType() = 
        new(nothing, nothing)
end
export DhcpConfigurationItemType


type DhcpValueType
    value::Union(ASCIIString, Nothing)

    DhcpValueType(value) = 
         new(value)
    DhcpValueType() = 
        new(nothing)
end
export DhcpValueType


type FilterType
    name::Union(ASCIIString, Nothing)
    valueSet::Union(Array{ASCIIString,1}, Nothing)

    FilterType(name, valueSet) = 
         new(name, valueSet)
    FilterType() = 
        new(nothing, nothing)
end
export FilterType


type ValueType
    value::Union(ASCIIString, Nothing)

    ValueType(value) = 
         new(value)
    ValueType() = 
        new(nothing)
end
export ValueType


type CreateCustomerGatewayType
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int32, Nothing)

    CreateCustomerGatewayType(_type, ipAddress, bgpAsn) = 
         new(_type, ipAddress, bgpAsn)
    CreateCustomerGatewayType() = 
        new(nothing, nothing, nothing)
end
export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)

    DeleteCustomerGatewayType(customerGatewayId) = 
         new(customerGatewayId)
    DeleteCustomerGatewayType() = 
        new(nothing)
end
export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteCustomerGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteCustomerGatewayResponseType() = 
        new(nothing, nothing)
end
export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateVpnGatewayType(_type, availabilityZone) = 
         new(_type, availabilityZone)
    CreateVpnGatewayType() = 
        new(nothing, nothing)
end
export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)

    DeleteVpnGatewayType(vpnGatewayId) = 
         new(vpnGatewayId)
    DeleteVpnGatewayType() = 
        new(nothing)
end
export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteVpnGatewayResponseType() = 
        new(nothing, nothing)
end
export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsRequestType(staticRoutesOnly) = 
         new(staticRoutesOnly)
    VpnConnectionOptionsRequestType() = 
        new(nothing)
end
export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) = 
         new(vpnConnectionId, destinationCidrBlock)
    CreateVpnConnectionRouteType() = 
        new(nothing, nothing)
end
export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateVpnConnectionRouteResponseType(requestId, _return) = 
         new(requestId, _return)
    CreateVpnConnectionRouteResponseType() = 
        new(nothing, nothing)
end
export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteVpnConnectionRouteType(vpnConnectionId, destinationCidrBlock) = 
         new(vpnConnectionId, destinationCidrBlock)
    DeleteVpnConnectionRouteType() = 
        new(nothing, nothing)
end
export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionRouteResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteVpnConnectionRouteResponseType() = 
        new(nothing, nothing)
end
export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::Union(ASCIIString, Nothing)

    DeleteVpnConnectionType(vpnConnectionId) = 
         new(vpnConnectionId)
    DeleteVpnConnectionType() = 
        new(nothing)
end
export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteVpnConnectionResponseType() = 
        new(nothing, nothing)
end
export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachVpnGatewayType(vpnGatewayId, vpcId) = 
         new(vpnGatewayId, vpcId)
    AttachVpnGatewayType() = 
        new(nothing, nothing)
end
export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachVpnGatewayType(vpnGatewayId, vpcId) = 
         new(vpnGatewayId, vpcId)
    DetachVpnGatewayType() = 
        new(nothing, nothing)
end
export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachVpnGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    DetachVpnGatewayResponseType() = 
        new(nothing, nothing)
end
export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::Union(ASCIIString, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)

    CreateVpcType(cidrBlock, instanceTenancy) = 
         new(cidrBlock, instanceTenancy)
    CreateVpcType() = 
        new(nothing, nothing)
end
export CreateVpcType


type DeleteVpcType
    vpcId::Union(ASCIIString, Nothing)

    DeleteVpcType(vpcId) = 
         new(vpcId)
    DeleteVpcType() = 
        new(nothing)
end
export DeleteVpcType


type DeleteVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpcResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteVpcResponseType() = 
        new(nothing, nothing)
end
export DeleteVpcResponseType


type CreateSubnetType
    vpcId::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateSubnetType(vpcId, cidrBlock, availabilityZone) = 
         new(vpcId, cidrBlock, availabilityZone)
    CreateSubnetType() = 
        new(nothing, nothing, nothing)
end
export CreateSubnetType


type DeleteSubnetType
    subnetId::Union(ASCIIString, Nothing)

    DeleteSubnetType(subnetId) = 
         new(subnetId)
    DeleteSubnetType() = 
        new(nothing)
end
export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSubnetResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteSubnetResponseType() = 
        new(nothing, nothing)
end
export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DeleteDhcpOptionsType(dhcpOptionsId) = 
         new(dhcpOptionsId)
    DeleteDhcpOptionsType() = 
        new(nothing)
end
export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteDhcpOptionsResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteDhcpOptionsResponseType() = 
        new(nothing, nothing)
end
export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AssociateDhcpOptionsType(dhcpOptionsId, vpcId) = 
         new(dhcpOptionsId, vpcId)
    AssociateDhcpOptionsType() = 
        new(nothing, nothing)
end
export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssociateDhcpOptionsResponseType(requestId, _return) = 
         new(requestId, _return)
    AssociateDhcpOptionsResponseType() = 
        new(nothing, nothing)
end
export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStateFaultType(code, message) = 
         new(code, message)
    SpotInstanceStateFaultType() = 
        new(nothing, nothing)
end
export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union(ASCIIString, Nothing)
    updateTime::Union(XSDateTime, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStatusMessageType(code, updateTime, message) = 
         new(code, updateTime, message)
    SpotInstanceStatusMessageType() = 
        new(nothing, nothing, nothing)
end
export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)

    SpotInstanceRequestIdSetItemType(spotInstanceRequestId) = 
         new(spotInstanceRequestId)
    SpotInstanceRequestIdSetItemType() = 
        new(nothing)
end
export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Array{ASCIIString,1}, Nothing)

    CancelSpotInstanceRequestsType(spotInstanceRequestIdSet) = 
         new(spotInstanceRequestIdSet)
    CancelSpotInstanceRequestsType() = 
        new(nothing)
end
export CancelSpotInstanceRequestsType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    CancelSpotInstanceRequestsResponseSetItemType(spotInstanceRequestId, state) = 
         new(spotInstanceRequestId, state)
    CancelSpotInstanceRequestsResponseSetItemType() = 
        new(nothing, nothing)
end
export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::Union(ASCIIString, Nothing)

    InstanceTypeSetItemType(instanceType) = 
         new(instanceType)
    InstanceTypeSetItemType() = 
        new(nothing)
end
export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::Union(ASCIIString, Nothing)

    ProductDescriptionSetItemType(productDescription) = 
         new(productDescription)
    ProductDescriptionSetItemType() = 
        new(nothing)
end
export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::Union(ASCIIString, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    spotPrice::Union(ASCIIString, Nothing)
    timestamp::Union(XSDateTime, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    SpotPriceHistorySetItemType(instanceType, productDescription, spotPrice, timestamp, availabilityZone) = 
         new(instanceType, productDescription, spotPrice, timestamp, availabilityZone)
    SpotPriceHistorySetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)

    CreateSpotDatafeedSubscriptionType(bucket, prefix) = 
         new(bucket, prefix)
    CreateSpotDatafeedSubscriptionType() = 
        new(nothing, nothing)
end
export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSpotDatafeedSubscriptionResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteSpotDatafeedSubscriptionResponseType() = 
        new(nothing, nothing)
end
export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::Union(ASCIIString, Nothing)

    LicenseIdSetItemType(licenseId) = 
         new(licenseId)
    LicenseIdSetItemType() = 
        new(nothing)
end
export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Union(Int32, Nothing)
    instanceCapacity::Union(Int32, Nothing)
    state::Union(ASCIIString, Nothing)
    earliestAllowedDeactivationTime::Union(XSDateTime, Nothing)

    LicenseCapacitySetItemType(capacity, instanceCapacity, state, earliestAllowedDeactivationTime) = 
         new(capacity, instanceCapacity, state, earliestAllowedDeactivationTime)
    LicenseCapacitySetItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int32, Nothing)

    ActivateLicenseType(licenseId, capacity) = 
         new(licenseId, capacity)
    ActivateLicenseType() = 
        new(nothing, nothing)
end
export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ActivateLicenseResponseType(requestId, _return) = 
         new(requestId, _return)
    ActivateLicenseResponseType() = 
        new(nothing, nothing)
end
export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int32, Nothing)

    DeactivateLicenseType(licenseId, capacity) = 
         new(licenseId, capacity)
    DeactivateLicenseType() = 
        new(nothing, nothing)
end
export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeactivateLicenseResponseType(requestId, _return) = 
         new(requestId, _return)
    DeactivateLicenseResponseType() = 
        new(nothing, nothing)
end
export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)

    CreatePlacementGroupType(groupName, strategy) = 
         new(groupName, strategy)
    CreatePlacementGroupType() = 
        new(nothing, nothing)
end
export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreatePlacementGroupResponseType(requestId, _return) = 
         new(requestId, _return)
    CreatePlacementGroupResponseType() = 
        new(nothing, nothing)
end
export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::Union(ASCIIString, Nothing)

    DeletePlacementGroupType(groupName) = 
         new(groupName)
    DeletePlacementGroupType() = 
        new(nothing)
end
export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeletePlacementGroupResponseType(requestId, _return) = 
         new(requestId, _return)
    DeletePlacementGroupResponseType() = 
        new(nothing, nothing)
end
export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::Union(ASCIIString, Nothing)

    DescribePlacementGroupItemType(groupName) = 
         new(groupName)
    DescribePlacementGroupItemType() = 
        new(nothing)
end
export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    PlacementGroupInfoType(groupName, strategy, state) = 
         new(groupName, strategy, state)
    PlacementGroupInfoType() = 
        new(nothing, nothing, nothing)
end
export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::Union(ASCIIString, Nothing)

    ResourceIdSetItemType(resourceId) = 
         new(resourceId)
    ResourceIdSetItemType() = 
        new(nothing)
end
export ResourceIdSetItemType


type ResourceTagSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    ResourceTagSetItemType(key, value) = 
         new(key, value)
    ResourceTagSetItemType() = 
        new(nothing, nothing)
end
export ResourceTagSetItemType


type CreateTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateTagsResponseType(requestId, _return) = 
         new(requestId, _return)
    CreateTagsResponseType() = 
        new(nothing, nothing)
end
export CreateTagsResponseType


type TagSetItemType
    resourceId::Union(ASCIIString, Nothing)
    resourceType::Union(ASCIIString, Nothing)
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    TagSetItemType(resourceId, resourceType, key, value) = 
         new(resourceId, resourceType, key, value)
    TagSetItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export TagSetItemType


type DeleteTagsSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    DeleteTagsSetItemType(key, value) = 
         new(key, value)
    DeleteTagsSetItemType() = 
        new(nothing, nothing)
end
export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteTagsResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteTagsResponseType() = 
        new(nothing, nothing)
end
export DeleteTagsResponseType


type DiskImageDetailType
    format::Union(ASCIIString, Nothing)
    bytes::Union(Int64, Nothing)
    importManifestUrl::Union(ASCIIString, Nothing)

    DiskImageDetailType(format, bytes, importManifestUrl) = 
         new(format, bytes, importManifestUrl)
    DiskImageDetailType() = 
        new(nothing, nothing, nothing)
end
export DiskImageDetailType


type DiskImageVolumeType
    size::Union(Int, Nothing)

    DiskImageVolumeType(size) = 
         new(size)
    DiskImageVolumeType() = 
        new(nothing)
end
export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Union(Int, Nothing)
    id::Union(ASCIIString, Nothing)

    DiskImageVolumeDescriptionType(size, id) = 
         new(size, id)
    DiskImageVolumeDescriptionType() = 
        new(nothing, nothing)
end
export DiskImageVolumeDescriptionType


type DiskImageDescriptionType
    format::Union(ASCIIString, Nothing)
    size::Union(Int64, Nothing)
    importManifestUrl::Union(ASCIIString, Nothing)
    checksum::Union(ASCIIString, Nothing)

    DiskImageDescriptionType(format, size, importManifestUrl, checksum) = 
         new(format, size, importManifestUrl, checksum)
    DiskImageDescriptionType() = 
        new(nothing, nothing, nothing, nothing)
end
export DiskImageDescriptionType


type DescribeConversionTasksType
    conversionTaskIdSet::Union(Array{ASCIIString,1}, Nothing)

    DescribeConversionTasksType(conversionTaskIdSet) = 
         new(conversionTaskIdSet)
    DescribeConversionTasksType() = 
        new(nothing)
end
export DescribeConversionTasksType


type ConversionTaskIdItemType
    conversionTaskId::Union(ASCIIString, Nothing)

    ConversionTaskIdItemType(conversionTaskId) = 
         new(conversionTaskId)
    ConversionTaskIdItemType() = 
        new(nothing)
end
export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)

    CancelConversionTaskType(conversionTaskId) = 
         new(conversionTaskId)
    CancelConversionTaskType() = 
        new(nothing)
end
export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelConversionTaskResponseType(requestId, _return) = 
         new(requestId, _return)
    CancelConversionTaskResponseType() = 
        new(nothing, nothing)
end
export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    CreateInstanceExportTaskType(description, instanceId, targetEnvironment) = 
         new(description, instanceId, targetEnvironment)
    CreateInstanceExportTaskType() = 
        new(nothing, nothing, nothing)
end
export CreateInstanceExportTaskType


type ExportToS3TaskType
    diskImageFormat::Union(ASCIIString, Nothing)
    containerFormat::Union(ASCIIString, Nothing)
    s3Bucket::Union(ASCIIString, Nothing)
    s3Prefix::Union(ASCIIString, Nothing)

    ExportToS3TaskType(diskImageFormat, containerFormat, s3Bucket, s3Prefix) = 
         new(diskImageFormat, containerFormat, s3Bucket, s3Prefix)
    ExportToS3TaskType() = 
        new(nothing, nothing, nothing, nothing)
end
export ExportToS3TaskType


type DescribeExportTasksType
    exportTaskIdSet::Union(Array{ASCIIString,1}, Nothing)

    DescribeExportTasksType(exportTaskIdSet) = 
         new(exportTaskIdSet)
    DescribeExportTasksType() = 
        new(nothing)
end
export DescribeExportTasksType


type ExportTaskIdType
    exportTaskId::Union(ASCIIString, Nothing)

    ExportTaskIdType(exportTaskId) = 
         new(exportTaskId)
    ExportTaskIdType() = 
        new(nothing)
end
export ExportTaskIdType


type ExportTaskResponseType
    exportTaskId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)

    ExportTaskResponseType(exportTaskId, description, state, statusMessage) = 
         new(exportTaskId, description, state, statusMessage)
    ExportTaskResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    InstanceExportTaskResponseType(instanceId, targetEnvironment) = 
         new(instanceId, targetEnvironment)
    InstanceExportTaskResponseType() = 
        new(nothing, nothing)
end
export InstanceExportTaskResponseType


type ExportToS3TaskResponseType
    diskImageFormat::Union(ASCIIString, Nothing)
    containerFormat::Union(ASCIIString, Nothing)
    s3Bucket::Union(ASCIIString, Nothing)
    s3Key::Union(ASCIIString, Nothing)

    ExportToS3TaskResponseType(diskImageFormat, containerFormat, s3Bucket, s3Key) = 
         new(diskImageFormat, containerFormat, s3Bucket, s3Key)
    ExportToS3TaskResponseType() = 
        new(nothing, nothing, nothing, nothing)
end
export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::Union(ASCIIString, Nothing)

    CancelExportTaskType(exportTaskId) = 
         new(exportTaskId)
    CancelExportTaskType() = 
        new(nothing)
end
export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelExportTaskResponseType(requestId, _return) = 
         new(requestId, _return)
    CancelExportTaskResponseType() = 
        new(nothing, nothing)
end
export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    InternetGatewayAttachmentType(vpcId, state) = 
         new(vpcId, state)
    InternetGatewayAttachmentType() = 
        new(nothing, nothing)
end
export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::Union(ASCIIString, Nothing)

    InternetGatewayIdSetItemType(internetGatewayId) = 
         new(internetGatewayId)
    InternetGatewayIdSetItemType() = 
        new(nothing)
end
export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)

    DeleteInternetGatewayType(internetGatewayId) = 
         new(internetGatewayId)
    DeleteInternetGatewayType() = 
        new(nothing)
end
export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteInternetGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteInternetGatewayResponseType() = 
        new(nothing, nothing)
end
export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachInternetGatewayType(internetGatewayId, vpcId) = 
         new(internetGatewayId, vpcId)
    AttachInternetGatewayType() = 
        new(nothing, nothing)
end
export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AttachInternetGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    AttachInternetGatewayResponseType() = 
        new(nothing, nothing)
end
export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachInternetGatewayType(internetGatewayId, vpcId) = 
         new(internetGatewayId, vpcId)
    DetachInternetGatewayType() = 
        new(nothing, nothing)
end
export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachInternetGatewayResponseType(requestId, _return) = 
         new(requestId, _return)
    DetachInternetGatewayResponseType() = 
        new(nothing, nothing)
end
export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::Union(ASCIIString, Nothing)

    CreateRouteTableType(vpcId) = 
         new(vpcId)
    CreateRouteTableType() = 
        new(nothing)
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

    RouteType(destinationCidrBlock, gatewayId, instanceId, instanceOwnerId, networkInterfaceId, state, origin) = 
         new(destinationCidrBlock, gatewayId, instanceId, instanceOwnerId, networkInterfaceId, state, origin)
    RouteType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RouteType


type RouteTableAssociationType
    routeTableAssociationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableAssociationType(routeTableAssociationId, routeTableId) = 
         new(routeTableAssociationId, routeTableId)
    RouteTableAssociationType() = 
        new(nothing, nothing)
end
export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::Union(ASCIIString, Nothing)

    PropagatingVgwType(gatewayId) = 
         new(gatewayId)
    PropagatingVgwType() = 
        new(nothing)
end
export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableIdSetItemType(routeTableId) = 
         new(routeTableId)
    RouteTableIdSetItemType() = 
        new(nothing)
end
export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    EnableVgwRoutePropagationRequestType(routeTableId, gatewayId) = 
         new(routeTableId, gatewayId)
    EnableVgwRoutePropagationRequestType() = 
        new(nothing, nothing)
end
export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVgwRoutePropagationResponseType(requestId, _return) = 
         new(requestId, _return)
    EnableVgwRoutePropagationResponseType() = 
        new(nothing, nothing)
end
export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    DisableVgwRoutePropagationRequestType(routeTableId, gatewayId) = 
         new(routeTableId, gatewayId)
    DisableVgwRoutePropagationRequestType() = 
        new(nothing, nothing)
end
export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisableVgwRoutePropagationResponseType(requestId, _return) = 
         new(requestId, _return)
    DisableVgwRoutePropagationResponseType() = 
        new(nothing, nothing)
end
export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::Union(ASCIIString, Nothing)

    DeleteRouteTableType(routeTableId) = 
         new(routeTableId)
    DeleteRouteTableType() = 
        new(nothing)
end
export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteTableResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteRouteTableResponseType() = 
        new(nothing, nothing)
end
export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    AssociateRouteTableType(routeTableId, subnetId) = 
         new(routeTableId, subnetId)
    AssociateRouteTableType() = 
        new(nothing, nothing)
end
export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateRouteTableResponseType(requestId, associationId) = 
         new(requestId, associationId)
    AssociateRouteTableResponseType() = 
        new(nothing, nothing)
end
export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationType(associationId, routeTableId) = 
         new(associationId, routeTableId)
    ReplaceRouteTableAssociationType() = 
        new(nothing, nothing)
end
export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationResponseType(requestId, newAssociationId) = 
         new(requestId, newAssociationId)
    ReplaceRouteTableAssociationResponseType() = 
        new(nothing, nothing)
end
export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::Union(ASCIIString, Nothing)

    DisassociateRouteTableType(associationId) = 
         new(associationId)
    DisassociateRouteTableType() = 
        new(nothing)
end
export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateRouteTableResponseType(requestId, _return) = 
         new(requestId, _return)
    DisassociateRouteTableResponseType() = 
        new(nothing, nothing)
end
export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateRouteType(routeTableId, destinationCidrBlock) = 
         new(routeTableId, destinationCidrBlock)
    CreateRouteType() = 
        new(nothing, nothing)
end
export CreateRouteType


type CreateRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateRouteResponseType(requestId, _return) = 
         new(requestId, _return)
    CreateRouteResponseType() = 
        new(nothing, nothing)
end
export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    ReplaceRouteType(routeTableId, destinationCidrBlock) = 
         new(routeTableId, destinationCidrBlock)
    ReplaceRouteType() = 
        new(nothing, nothing)
end
export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceRouteResponseType(requestId, _return) = 
         new(requestId, _return)
    ReplaceRouteResponseType() = 
        new(nothing, nothing)
end
export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteRouteType(routeTableId, destinationCidrBlock) = 
         new(routeTableId, destinationCidrBlock)
    DeleteRouteType() = 
        new(nothing, nothing)
end
export DeleteRouteType


type DeleteRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteRouteResponseType() = 
        new(nothing, nothing)
end
export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::Union(ASCIIString, Nothing)

    CreateNetworkAclType(vpcId) = 
         new(vpcId)
    CreateNetworkAclType() = 
        new(nothing)
end
export CreateNetworkAclType


type IcmpTypeCodeType
    code::Union(Int32, Nothing)
    _type::Union(Int32, Nothing)

    IcmpTypeCodeType(code, _type) = 
         new(code, _type)
    IcmpTypeCodeType() = 
        new(nothing, nothing)
end
export IcmpTypeCodeType


type PortRangeType
    from::Union(Int32, Nothing)
    to::Union(Int32, Nothing)

    PortRangeType(from, to) = 
         new(from, to)
    PortRangeType() = 
        new(nothing, nothing)
end
export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    NetworkAclAssociationType(networkAclAssociationId, networkAclId, subnetId) = 
         new(networkAclAssociationId, networkAclId, subnetId)
    NetworkAclAssociationType() = 
        new(nothing, nothing, nothing)
end
export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::Union(ASCIIString, Nothing)

    NetworkAclIdSetItemType(networkAclId) = 
         new(networkAclId)
    NetworkAclIdSetItemType() = 
        new(nothing)
end
export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::Union(ASCIIString, Nothing)

    DeleteNetworkAclType(networkAclId) = 
         new(networkAclId)
    DeleteNetworkAclType() = 
        new(nothing)
end
export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteNetworkAclResponseType() = 
        new(nothing, nothing)
end
export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationType(associationId, networkAclId) = 
         new(associationId, networkAclId)
    ReplaceNetworkAclAssociationType() = 
        new(nothing, nothing)
end
export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationResponseType(requestId, newAssociationId) = 
         new(requestId, newAssociationId)
    ReplaceNetworkAclAssociationResponseType() = 
        new(nothing, nothing)
end
export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateNetworkAclEntryResponseType(requestId, _return) = 
         new(requestId, _return)
    CreateNetworkAclEntryResponseType() = 
        new(nothing, nothing)
end
export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceNetworkAclEntryResponseType(requestId, _return) = 
         new(requestId, _return)
    ReplaceNetworkAclEntryResponseType() = 
        new(nothing, nothing)
end
export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int32, Nothing)
    egress::Union(Bool, Nothing)

    DeleteNetworkAclEntryType(networkAclId, ruleNumber, egress) = 
         new(networkAclId, ruleNumber, egress)
    DeleteNetworkAclEntryType() = 
        new(nothing, nothing, nothing)
end
export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclEntryResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteNetworkAclEntryResponseType() = 
        new(nothing, nothing)
end
export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    impairedSince::Union(XSDateTime, Nothing)

    InstanceStatusDetailsSetItemType(name, status, impairedSince) = 
         new(name, status, impairedSince)
    InstanceStatusDetailsSetItemType() = 
        new(nothing, nothing, nothing)
end
export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    notBefore::Union(XSDateTime, Nothing)
    notAfter::Union(XSDateTime, Nothing)

    InstanceStatusEventType(code, description, notBefore, notAfter) = 
         new(code, description, notBefore, notAfter)
    InstanceStatusEventType() = 
        new(nothing, nothing, nothing, nothing)
end
export InstanceStatusEventType


type ReportInstanceStatusType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(XSDateTime, Nothing)
    endTime::Union(XSDateTime, Nothing)
    reasonCodesSet::Union(Array{ASCIIString,1}, Nothing)
    description::Union(ASCIIString, Nothing)

    ReportInstanceStatusType(instancesSet, status, startTime, endTime, reasonCodesSet, description) = 
         new(instancesSet, status, startTime, endTime, reasonCodesSet, description)
    ReportInstanceStatusType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export ReportInstanceStatusType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::Union(ASCIIString, Nothing)

    ReportInstanceStatusReasonCodeSetItemType(reasonCode) = 
         new(reasonCode)
    ReportInstanceStatusReasonCodeSetItemType() = 
        new(nothing)
end
export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReportInstanceStatusResponseType(requestId, _return) = 
         new(requestId, _return)
    ReportInstanceStatusResponseType() = 
        new(nothing, nothing)
end
export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::Union(ASCIIString, Nothing)

    NetworkInterfaceIdSetItemType(networkInterfaceId) = 
         new(networkInterfaceId)
    NetworkInterfaceIdSetItemType() = 
        new(nothing)
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

    NetworkInterfaceAttachmentType(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination) = 
         new(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination)
    NetworkInterfaceAttachmentType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export NetworkInterfaceAttachmentType


type NetworkInterfaceAssociationType
    publicIp::Union(ASCIIString, Nothing)
    publicDnsName::Union(ASCIIString, Nothing)
    ipOwnerId::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    NetworkInterfaceAssociationType(publicIp, publicDnsName, ipOwnerId, allocationId, associationId) = 
         new(publicIp, publicDnsName, ipOwnerId, allocationId, associationId)
    NetworkInterfaceAssociationType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DeleteNetworkInterfaceType(networkInterfaceId) = 
         new(networkInterfaceId)
    DeleteNetworkInterfaceType() = 
        new(nothing)
end
export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkInterfaceResponseType(requestId, _return) = 
         new(requestId, _return)
    DeleteNetworkInterfaceResponseType() = 
        new(nothing, nothing)
end
export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int32, Nothing)

    AttachNetworkInterfaceType(networkInterfaceId, instanceId, deviceIndex) = 
         new(networkInterfaceId, instanceId, deviceIndex)
    AttachNetworkInterfaceType() = 
        new(nothing, nothing, nothing)
end
export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    attachmentId::Union(ASCIIString, Nothing)

    AttachNetworkInterfaceResponseType(requestId, attachmentId) = 
         new(requestId, attachmentId)
    AttachNetworkInterfaceResponseType() = 
        new(nothing, nothing)
end
export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::Union(ASCIIString, Nothing)
    force::Union(Bool, Nothing)

    DetachNetworkInterfaceType(attachmentId, force) = 
         new(attachmentId, force)
    DetachNetworkInterfaceType() = 
        new(nothing, nothing)
end
export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachNetworkInterfaceResponseType(requestId, _return) = 
         new(requestId, _return)
    DetachNetworkInterfaceResponseType() = 
        new(nothing, nothing)
end
export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeType(networkInterfaceId) = 
         new(networkInterfaceId)
    DescribeNetworkInterfaceAttributeType() = 
        new(nothing)
end
export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeResponseType(requestId, networkInterfaceId) = 
         new(requestId, networkInterfaceId)
    DescribeNetworkInterfaceAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ModifyNetworkInterfaceAttributeType(networkInterfaceId) = 
         new(networkInterfaceId)
    ModifyNetworkInterfaceAttributeType() = 
        new(nothing)
end
export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttachmentType(attachmentId, deleteOnTermination) = 
         new(attachmentId, deleteOnTermination)
    ModifyNetworkInterfaceAttachmentType() = 
        new(nothing, nothing)
end
export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifyNetworkInterfaceAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ResetNetworkInterfaceAttributeType(networkInterfaceId) = 
         new(networkInterfaceId)
    ResetNetworkInterfaceAttributeType() = 
        new(nothing)
end
export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetNetworkInterfaceAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ResetNetworkInterfaceAttributeResponseType() = 
        new(nothing, nothing)
end
export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Array{ASCIIString,1}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)
    allowReassignment::Union(Bool, Nothing)

    AssignPrivateIpAddressesType(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment) = 
         new(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment)
    AssignPrivateIpAddressesType() = 
        new(nothing, nothing, nothing, nothing)
end
export AssignPrivateIpAddressesType


type AssignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssignPrivateIpAddressesResponseType(requestId, _return) = 
         new(requestId, _return)
    AssignPrivateIpAddressesResponseType() = 
        new(nothing, nothing)
end
export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Array{ASCIIString,1}, Nothing)

    UnassignPrivateIpAddressesType(networkInterfaceId, privateIpAddressesSet) = 
         new(networkInterfaceId, privateIpAddressesSet)
    UnassignPrivateIpAddressesType() = 
        new(nothing, nothing)
end
export UnassignPrivateIpAddressesType


type UnassignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    UnassignPrivateIpAddressesResponseType(requestId, _return) = 
         new(requestId, _return)
    UnassignPrivateIpAddressesResponseType() = 
        new(nothing, nothing)
end
export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)

    AssignPrivateIpAddressesSetItemRequestType(privateIpAddress) = 
         new(privateIpAddress)
    AssignPrivateIpAddressesSetItemRequestType() = 
        new(nothing)
end
export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)

    VolumeStatusDetailsItemType(name, status) = 
         new(name, status)
    VolumeStatusDetailsItemType() = 
        new(nothing, nothing)
end
export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::Union(ASCIIString, Nothing)
    notBefore::Union(XSDateTime, Nothing)
    notAfter::Union(XSDateTime, Nothing)
    eventId::Union(ASCIIString, Nothing)
    eventType::Union(ASCIIString, Nothing)

    VolumeStatusEventItemType(description, notBefore, notAfter, eventId, eventType) = 
         new(description, notBefore, notAfter, eventId, eventType)
    VolumeStatusEventItemType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export VolumeStatusEventItemType


type VolumeStatusActionItemType
    description::Union(ASCIIString, Nothing)
    code::Union(ASCIIString, Nothing)
    eventId::Union(ASCIIString, Nothing)
    eventType::Union(ASCIIString, Nothing)

    VolumeStatusActionItemType(description, code, eventId, eventType) = 
         new(description, code, eventId, eventType)
    VolumeStatusActionItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::Union(ASCIIString, Nothing)

    EnableVolumeIOType(volumeId) = 
         new(volumeId)
    EnableVolumeIOType() = 
        new(nothing)
end
export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVolumeIOResponseType(requestId, _return) = 
         new(requestId, _return)
    EnableVolumeIOResponseType() = 
        new(nothing, nothing)
end
export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    ModifyVolumeAttributeType(volumeId) = 
         new(volumeId)
    ModifyVolumeAttributeType() = 
        new(nothing)
end
export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVolumeAttributeResponseType(requestId, _return) = 
         new(requestId, _return)
    ModifyVolumeAttributeResponseType() = 
        new(nothing, nothing)
end
export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeType(volumeId) = 
         new(volumeId)
    DescribeVolumeAttributeType() = 
        new(nothing)
end
export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeResponseType(requestId, volumeId) = 
         new(requestId, volumeId)
    DescribeVolumeAttributeResponseType() = 
        new(nothing, nothing)
end
export DescribeVolumeAttributeResponseType


type PriceScheduleRequestSetType
    item::Union(Array{PriceScheduleRequestSetItemType,1}, Nothing)

    PriceScheduleRequestSetType(item) = 
         new(item)
    PriceScheduleRequestSetType() = 
        new(nothing)
end
export PriceScheduleRequestSetType


type DescribeAvailabilityZonesResponseType
    requestId::Union(ASCIIString, Nothing)
    availabilityZoneInfo::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    DescribeAvailabilityZonesResponseType(requestId, availabilityZoneInfo) = 
         new(requestId, availabilityZoneInfo)
    DescribeAvailabilityZonesResponseType() = 
        new(nothing, nothing)
end
export DescribeAvailabilityZonesResponseType


type VpnGatewayIdSetType
    item::Union(Array{VpnGatewayIdSetItemType,1}, Nothing)

    VpnGatewayIdSetType(item) = 
         new(item)
    VpnGatewayIdSetType() = 
        new(nothing)
end
export VpnGatewayIdSetType


type AvailabilityZoneMessageSetType
    item::Union(Array{AvailabilityZoneMessageType,1}, Nothing)

    AvailabilityZoneMessageSetType(item) = 
         new(item)
    AvailabilityZoneMessageSetType() = 
        new(nothing)
end
export AvailabilityZoneMessageSetType


type DescribeInternetGatewaysType
    internetGatewayIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeInternetGatewaysType(internetGatewayIdSet, filterSet) = 
         new(internetGatewayIdSet, filterSet)
    DescribeInternetGatewaysType() = 
        new(nothing, nothing)
end
export DescribeInternetGatewaysType


type DescribeSpotPriceHistoryResponseType
    requestId::Union(ASCIIString, Nothing)
    spotPriceHistorySet::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeSpotPriceHistoryResponseType(requestId, spotPriceHistorySet, nextToken) = 
         new(requestId, spotPriceHistorySet, nextToken)
    DescribeSpotPriceHistoryResponseType() = 
        new(nothing, nothing, nothing)
end
export DescribeSpotPriceHistoryResponseType


type CreateVolumePermissionOperationType
    add::Union(Array{CreateVolumePermissionItemType,1}, Nothing)
    remove::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionOperationType(add, remove) = 
         new(add, remove)
    CreateVolumePermissionOperationType() = 
        new(nothing, nothing)
end
export CreateVolumePermissionOperationType


type DescribeSecurityGroupsSetType
    item::Union(Array{DescribeSecurityGroupsSetItemType,1}, Nothing)

    DescribeSecurityGroupsSetType(item) = 
         new(item)
    DescribeSecurityGroupsSetType() = 
        new(nothing)
end
export DescribeSecurityGroupsSetType


type VgwTelemetryType
    item::Union(Array{VpnTunnelTelemetryType,1}, Nothing)

    VgwTelemetryType(item) = 
         new(item)
    VgwTelemetryType() = 
        new(nothing)
end
export VgwTelemetryType


type CreateReservedInstancesListingType
    reservedInstancesId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)
    priceSchedules::Union(Array{PriceScheduleRequestSetItemType,1}, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    CreateReservedInstancesListingType(reservedInstancesId, instanceCount, priceSchedules, clientToken) = 
         new(reservedInstancesId, instanceCount, priceSchedules, clientToken)
    CreateReservedInstancesListingType() = 
        new(nothing, nothing, nothing, nothing)
end
export CreateReservedInstancesListingType


type DescribeAddressesType
    publicIpsSet::Union(Array{ASCIIString,1}, Nothing)
    allocationIdsSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAddressesType(publicIpsSet, allocationIdsSet, filterSet) = 
         new(publicIpsSet, allocationIdsSet, filterSet)
    DescribeAddressesType() = 
        new(nothing, nothing, nothing)
end
export DescribeAddressesType


type UnavailableResultSetType
    item::Union(Array{UnavailableResultType,1}, Nothing)

    UnavailableResultSetType(item) = 
         new(item)
    UnavailableResultSetType() = 
        new(nothing)
end
export UnavailableResultSetType


type DescribeReservedInstancesListingSetType
    item::Union(Array{DescribeReservedInstancesListingSetItemType,1}, Nothing)

    DescribeReservedInstancesListingSetType(item) = 
         new(item)
    DescribeReservedInstancesListingSetType() = 
        new(nothing)
end
export DescribeReservedInstancesListingSetType


type ModifySnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)
    createVolumePermission::Union(CreateVolumePermissionOperationType, Nothing)

    ModifySnapshotAttributeType(snapshotId, createVolumePermission) = 
         new(snapshotId, createVolumePermission)
    ModifySnapshotAttributeType() = 
        new(nothing, nothing)
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

    NetworkAclEntryType(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange) = 
         new(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
    NetworkAclEntryType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export NetworkAclEntryType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpnGatewaysType(vpnGatewaySet, filterSet) = 
         new(vpnGatewaySet, filterSet)
    DescribeVpnGatewaysType() = 
        new(nothing, nothing)
end
export DescribeVpnGatewaysType


type BundleInstanceTaskStorageType
    S3::Union(BundleInstanceS3StorageType, Nothing)

    BundleInstanceTaskStorageType(S3) = 
         new(S3)
    BundleInstanceTaskStorageType() = 
        new(nothing)
end
export BundleInstanceTaskStorageType


type DescribeAddressesInfoType
    item::Union(Array{DescribeAddressesItemType,1}, Nothing)

    DescribeAddressesInfoType(item) = 
         new(item)
    DescribeAddressesInfoType() = 
        new(nothing)
end
export DescribeAddressesInfoType


type DescribeReservedInstancesType
    reservedInstancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    offeringType::Union(ASCIIString, Nothing)

    DescribeReservedInstancesType(reservedInstancesSet, filterSet, offeringType) = 
         new(reservedInstancesSet, filterSet, offeringType)
    DescribeReservedInstancesType() = 
        new(nothing, nothing, nothing)
end
export DescribeReservedInstancesType


type AttachmentSetType
    item::Union(Array{AttachmentType,1}, Nothing)

    AttachmentSetType(item) = 
         new(item)
    AttachmentSetType() = 
        new(nothing)
end
export AttachmentSetType


type ProductDescriptionSetType
    item::Union(Array{ProductDescriptionSetItemType,1}, Nothing)

    ProductDescriptionSetType(item) = 
         new(item)
    ProductDescriptionSetType() = 
        new(nothing)
end
export ProductDescriptionSetType


type CustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int32, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    CustomerGatewayType(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet) = 
         new(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet)
    CustomerGatewayType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export CustomerGatewayType


type ProductCodesSetType
    item::Union(Array{ProductCodesSetItemType,1}, Nothing)

    ProductCodesSetType(item) = 
         new(item)
    ProductCodesSetType() = 
        new(nothing)
end
export ProductCodesSetType


type DescribeRegionsSetType
    item::Union(Array{DescribeRegionsSetItemType,1}, Nothing)

    DescribeRegionsSetType(item) = 
         new(item)
    DescribeRegionsSetType() = 
        new(nothing)
end
export DescribeRegionsSetType


type InternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    attachmentSet::Union(Array{InternetGatewayAttachmentType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    InternetGatewayType(internetGatewayId, attachmentSet, tagSet) = 
         new(internetGatewayId, attachmentSet, tagSet)
    InternetGatewayType() = 
        new(nothing, nothing, nothing)
end
export InternetGatewayType


type ResourceIdSetType
    item::Union(Array{ResourceIdSetItemType,1}, Nothing)

    ResourceIdSetType(item) = 
         new(item)
    ResourceIdSetType() = 
        new(nothing)
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

    DescribeReservedInstancesOfferingsResponseSetItemType(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet) = 
         new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet)
    DescribeReservedInstancesOfferingsResponseSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
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

    ImportInstanceLaunchSpecificationType(architecture, groupSet, userData, instanceType, placement, monitoring, subnetId, instanceInitiatedShutdownBehavior, privateIpAddress) = 
         new(architecture, groupSet, userData, instanceType, placement, monitoring, subnetId, instanceInitiatedShutdownBehavior, privateIpAddress)
    ImportInstanceLaunchSpecificationType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export ImportInstanceLaunchSpecificationType


type PriceScheduleSetType
    item::Union(Array{PriceScheduleSetItemType,1}, Nothing)

    PriceScheduleSetType(item) = 
         new(item)
    PriceScheduleSetType() = 
        new(nothing)
end
export PriceScheduleSetType


type CreateTagsType
    resourcesSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    CreateTagsType(resourcesSet, tagSet) = 
         new(resourcesSet, tagSet)
    CreateTagsType() = 
        new(nothing, nothing)
end
export CreateTagsType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSpotInstanceRequestsType(spotInstanceRequestIdSet, filterSet) = 
         new(spotInstanceRequestIdSet, filterSet)
    DescribeSpotInstanceRequestsType() = 
        new(nothing, nothing)
end
export DescribeSpotInstanceRequestsType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeCustomerGatewaysType(customerGatewaySet, filterSet) = 
         new(customerGatewaySet, filterSet)
    DescribeCustomerGatewaysType() = 
        new(nothing, nothing)
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

    DescribeReservedInstancesOfferingsType(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults) = 
         new(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults)
    DescribeReservedInstancesOfferingsType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeReservedInstancesOfferingsType


type DescribeAvailabilityZonesType
    availabilityZoneSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAvailabilityZonesType(availabilityZoneSet, filterSet) = 
         new(availabilityZoneSet, filterSet)
    DescribeAvailabilityZonesType() = 
        new(nothing, nothing)
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

    ImportInstanceVolumeDetailItemType(bytesConverted, availabilityZone, image, description, volume, status, statusMessage) = 
         new(bytesConverted, availabilityZone, image, description, volume, status, statusMessage)
    ImportInstanceVolumeDetailItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export ImportInstanceVolumeDetailItemType


type CustomerGatewayIdSetType
    item::Union(Array{CustomerGatewayIdSetItemType,1}, Nothing)

    CustomerGatewayIdSetType(item) = 
         new(item)
    CustomerGatewayIdSetType() = 
        new(nothing)
end
export CustomerGatewayIdSetType


type ValueSetType
    item::Union(Array{ValueType,1}, Nothing)

    ValueSetType(item) = 
         new(item)
    ValueSetType() = 
        new(nothing)
end
export ValueSetType


type GroupSetType
    item::Union(Array{GroupItemType,1}, Nothing)

    GroupSetType(item) = 
         new(item)
    GroupSetType() = 
        new(nothing)
end
export GroupSetType


type DeleteTagsType
    resourcesSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsType(resourcesSet, tagSet) = 
         new(resourcesSet, tagSet)
    DeleteTagsType() = 
        new(nothing, nothing)
end
export DeleteTagsType


type InstanceStatusType
    status::Union(ASCIIString, Nothing)
    details::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusType(status, details) = 
         new(status, details)
    InstanceStatusType() = 
        new(nothing, nothing)
end
export InstanceStatusType


type DeleteTagsSetType
    item::Union(Array{DeleteTagsSetItemType,1}, Nothing)

    DeleteTagsSetType(item) = 
         new(item)
    DeleteTagsSetType() = 
        new(nothing)
end
export DeleteTagsSetType


type DescribeTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    tagSet::Union(Array{TagSetItemType,1}, Nothing)

    DescribeTagsResponseType(requestId, tagSet) = 
         new(requestId, tagSet)
    DescribeTagsResponseType() = 
        new(nothing, nothing)
end
export DescribeTagsResponseType


type DescribeKeyPairsInfoType
    item::Union(Array{DescribeKeyPairsItemType,1}, Nothing)

    DescribeKeyPairsInfoType(item) = 
         new(item)
    DescribeKeyPairsInfoType() = 
        new(nothing)
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

    DescribeReservedInstancesListingsResponseSetItemType(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken) = 
         new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken)
    DescribeReservedInstancesListingsResponseSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeReservedInstancesListingsResponseSetItemType


type DescribeLicensesType
    licenseIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeLicensesType(licenseIdSet, filterSet) = 
         new(licenseIdSet, filterSet)
    DescribeLicensesType() = 
        new(nothing, nothing)
end
export DescribeLicensesType


type DescribeSnapshotsType
    snapshotSet::Union(Array{ASCIIString,1}, Nothing)
    ownersSet::Union(Array{ASCIIString,1}, Nothing)
    restorableBySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSnapshotsType(snapshotSet, ownersSet, restorableBySet, filterSet) = 
         new(snapshotSet, ownersSet, restorableBySet, filterSet)
    DescribeSnapshotsType() = 
        new(nothing, nothing, nothing, nothing)
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

    DescribeReservedInstancesResponseSetItemType(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges) = 
         new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges)
    DescribeReservedInstancesResponseSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeReservedInstancesResponseSetItemType


type DescribeVolumesSetType
    item::Union(Array{DescribeVolumesSetItemType,1}, Nothing)

    DescribeVolumesSetType(item) = 
         new(item)
    DescribeVolumesSetType() = 
        new(nothing)
end
export DescribeVolumesSetType


type SpotPriceHistorySetType
    item::Union(Array{SpotPriceHistorySetItemType,1}, Nothing)

    SpotPriceHistorySetType(item) = 
         new(item)
    SpotPriceHistorySetType() = 
        new(nothing)
end
export SpotPriceHistorySetType


type DescribeReservedInstancesResponseSetType
    item::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseSetType(item) = 
         new(item)
    DescribeReservedInstancesResponseSetType() = 
        new(nothing)
end
export DescribeReservedInstancesResponseSetType


type IpPermissionType
    ipProtocol::Union(ASCIIString, Nothing)
    fromPort::Union(Int32, Nothing)
    toPort::Union(Int32, Nothing)
    groups::Union(Array{UserIdGroupPairType,1}, Nothing)
    ipRanges::Union(Array{ASCIIString,1}, Nothing)

    IpPermissionType(ipProtocol, fromPort, toPort, groups, ipRanges) = 
         new(ipProtocol, fromPort, toPort, groups, ipRanges)
    IpPermissionType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export IpPermissionType


type IpRangeSetType
    item::Union(Array{IpRangeItemType,1}, Nothing)

    IpRangeSetType(item) = 
         new(item)
    IpRangeSetType() = 
        new(nothing)
end
export IpRangeSetType


type DescribeKeyPairsResponseInfoType
    item::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseInfoType(item) = 
         new(item)
    DescribeKeyPairsResponseInfoType() = 
        new(nothing)
end
export DescribeKeyPairsResponseInfoType


type CreateVpnConnectionType
    _type::Union(ASCIIString, Nothing)
    customerGatewayId::Union(ASCIIString, Nothing)
    vpnGatewayId::Union(ASCIIString, Nothing)
    options::Union(VpnConnectionOptionsRequestType, Nothing)

    CreateVpnConnectionType(_type, customerGatewayId, vpnGatewayId, options) = 
         new(_type, customerGatewayId, vpnGatewayId, options)
    CreateVpnConnectionType() = 
        new(nothing, nothing, nothing, nothing)
end
export CreateVpnConnectionType


type LicenseSetItemType
    licenseId::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    pool::Union(ASCIIString, Nothing)
    capacitySet::Union(Array{LicenseCapacitySetItemType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    LicenseSetItemType(licenseId, _type, pool, capacitySet, tagSet) = 
         new(licenseId, _type, pool, capacitySet, tagSet)
    LicenseSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing)
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

    ReplaceNetworkAclEntryType(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
    ReplaceNetworkAclEntryType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export ReplaceNetworkAclEntryType


type DescribeAvailabilityZonesSetType
    item::Union(Array{DescribeAvailabilityZonesSetItemType,1}, Nothing)

    DescribeAvailabilityZonesSetType(item) = 
         new(item)
    DescribeAvailabilityZonesSetType() = 
        new(nothing)
end
export DescribeAvailabilityZonesSetType


type DescribeSnapshotsSetType
    item::Union(Array{DescribeSnapshotsSetItemType,1}, Nothing)

    DescribeSnapshotsSetType(item) = 
         new(item)
    DescribeSnapshotsSetType() = 
        new(nothing)
end
export DescribeSnapshotsSetType


type CancelReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    CancelReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) = 
         new(requestId, reservedInstancesListingsSet)
    CancelReservedInstancesListingResponseType() = 
        new(nothing, nothing)
end
export CancelReservedInstancesListingResponseType


type SubnetIdSetType
    item::Union(Array{SubnetIdSetItemType,1}, Nothing)

    SubnetIdSetType(item) = 
         new(item)
    SubnetIdSetType() = 
        new(nothing)
end
export SubnetIdSetType


type VpcIdSetType
    item::Union(Array{VpcIdSetItemType,1}, Nothing)

    VpcIdSetType(item) = 
         new(item)
    VpcIdSetType() = 
        new(nothing)
end
export VpcIdSetType


type ConversionTaskIdSetType
    item::Union(Array{ConversionTaskIdItemType,1}, Nothing)

    ConversionTaskIdSetType(item) = 
         new(item)
    ConversionTaskIdSetType() = 
        new(nothing)
end
export ConversionTaskIdSetType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpnConnectionsType(vpnConnectionSet, filterSet) = 
         new(vpnConnectionSet, filterSet)
    DescribeVpnConnectionsType() = 
        new(nothing, nothing)
end
export DescribeVpnConnectionsType


type PlacementGroupSetType
    item::Union(Array{PlacementGroupInfoType,1}, Nothing)

    PlacementGroupSetType(item) = 
         new(item)
    PlacementGroupSetType() = 
        new(nothing)
end
export PlacementGroupSetType


type SpotDatafeedSubscriptionType
    ownerId::Union(ASCIIString, Nothing)
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    fault::Union(SpotInstanceStateFaultType, Nothing)

    SpotDatafeedSubscriptionType(ownerId, bucket, prefix, state, fault) = 
         new(ownerId, bucket, prefix, state, fault)
    SpotDatafeedSubscriptionType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export SpotDatafeedSubscriptionType


type AllocationIdSetType
    item::Union(Array{AllocationIdSetItemType,1}, Nothing)

    AllocationIdSetType(item) = 
         new(item)
    AllocationIdSetType() = 
        new(nothing)
end
export AllocationIdSetType


type DescribeBundleTasksInfoType
    item::Union(Array{DescribeBundleTasksItemType,1}, Nothing)

    DescribeBundleTasksInfoType(item) = 
         new(item)
    DescribeBundleTasksInfoType() = 
        new(nothing)
end
export DescribeBundleTasksInfoType


type TagSetType
    item::Union(Array{TagSetItemType,1}, Nothing)

    TagSetType(item) = 
         new(item)
    TagSetType() = 
        new(nothing)
end
export TagSetType


type DescribeReservedInstancesListingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseType(requestId, reservedInstancesListingsSet) = 
         new(requestId, reservedInstancesListingsSet)
    DescribeReservedInstancesListingsResponseType() = 
        new(nothing, nothing)
end
export DescribeReservedInstancesListingsResponseType


type NetworkAclAssociationSetType
    item::Union(Array{NetworkAclAssociationType,1}, Nothing)

    NetworkAclAssociationSetType(item) = 
         new(item)
    NetworkAclAssociationSetType() = 
        new(nothing)
end
export NetworkAclAssociationSetType


type DescribeImagesType
    executableBySet::Union(Array{ASCIIString,1}, Nothing)
    imagesSet::Union(Array{ASCIIString,1}, Nothing)
    ownersSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeImagesType(executableBySet, imagesSet, ownersSet, filterSet) = 
         new(executableBySet, imagesSet, ownersSet, filterSet)
    DescribeImagesType() = 
        new(nothing, nothing, nothing, nothing)
end
export DescribeImagesType


type DescribeVpcsType
    vpcSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVpcsType(vpcSet, filterSet) = 
         new(vpcSet, filterSet)
    DescribeVpcsType() = 
        new(nothing, nothing)
end
export DescribeVpcsType


type LicenseSetType
    item::Union(Array{LicenseSetItemType,1}, Nothing)

    LicenseSetType(item) = 
         new(item)
    LicenseSetType() = 
        new(nothing)
end
export LicenseSetType


type CreateNetworkInterfaceType
    subnetId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    groupSet::Union(Array{ASCIIString,1}, Nothing)
    privateIpAddressesSet::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int32, Nothing)

    CreateNetworkInterfaceType(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount) = 
         new(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount)
    CreateNetworkInterfaceType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export CreateNetworkInterfaceType


type DescribeImagesInfoType
    item::Union(Array{DescribeImagesItemType,1}, Nothing)

    DescribeImagesInfoType(item) = 
         new(item)
    DescribeImagesInfoType() = 
        new(nothing)
end
export DescribeImagesInfoType


type NetworkInterfaceIdSetType
    item::Union(Array{NetworkInterfaceIdSetItemType,1}, Nothing)

    NetworkInterfaceIdSetType(item) = 
         new(item)
    NetworkInterfaceIdSetType() = 
        new(nothing)
end
export NetworkInterfaceIdSetType


type DescribeSnapshotsRestorableBySetType
    item::Union(Array{DescribeSnapshotsRestorableByType,1}, Nothing)

    DescribeSnapshotsRestorableBySetType(item) = 
         new(item)
    DescribeSnapshotsRestorableBySetType() = 
        new(nothing)
end
export DescribeSnapshotsRestorableBySetType


type CancelSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{CancelSpotInstanceRequestsResponseSetItemType,1}, Nothing)

    CancelSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) = 
         new(requestId, spotInstanceRequestSet)
    CancelSpotInstanceRequestsResponseType() = 
        new(nothing, nothing)
end
export CancelSpotInstanceRequestsResponseType


type DescribeReservedInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesSet::Union(Array{DescribeReservedInstancesResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesResponseType(requestId, reservedInstancesSet) = 
         new(requestId, reservedInstancesSet)
    DescribeReservedInstancesResponseType() = 
        new(nothing, nothing)
end
export DescribeReservedInstancesResponseType


type NetworkAclType
    networkAclId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    default::Union(Bool, Nothing)
    entrySet::Union(Array{NetworkAclEntryType,1}, Nothing)
    associationSet::Union(Array{NetworkAclAssociationType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    NetworkAclType(networkAclId, vpcId, default, entrySet, associationSet, tagSet) = 
         new(networkAclId, vpcId, default, entrySet, associationSet, tagSet)
    NetworkAclType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export NetworkAclType


type ImportVolumeType
    availabilityZone::Union(ASCIIString, Nothing)
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    ImportVolumeType(availabilityZone, image, description, volume) = 
         new(availabilityZone, image, description, volume)
    ImportVolumeType() = 
        new(nothing, nothing, nothing, nothing)
end
export ImportVolumeType


type RegionSetType
    item::Union(Array{RegionItemType,1}, Nothing)

    RegionSetType(item) = 
         new(item)
    RegionSetType() = 
        new(nothing)
end
export RegionSetType


type VpnConnectionIdSetType
    item::Union(Array{VpnConnectionIdSetItemType,1}, Nothing)

    VpnConnectionIdSetType(item) = 
         new(item)
    VpnConnectionIdSetType() = 
        new(nothing)
end
export VpnConnectionIdSetType


type VolumeStatusEventsSetType
    item::Union(Array{VolumeStatusEventItemType,1}, Nothing)

    VolumeStatusEventsSetType(item) = 
         new(item)
    VolumeStatusEventsSetType() = 
        new(nothing)
end
export VolumeStatusEventsSetType


type RebootInstancesInfoType
    item::Union(Array{RebootInstancesItemType,1}, Nothing)

    RebootInstancesInfoType(item) = 
         new(item)
    RebootInstancesInfoType() = 
        new(nothing)
end
export RebootInstancesInfoType


type VpnStaticRoutesSetType
    item::Union(Array{VpnStaticRouteType,1}, Nothing)

    VpnStaticRoutesSetType(item) = 
         new(item)
    VpnStaticRoutesSetType() = 
        new(nothing)
end
export VpnStaticRoutesSetType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeNetworkInterfacesType(networkInterfaceIdSet, filterSet) = 
         new(networkInterfaceIdSet, filterSet)
    DescribeNetworkInterfacesType() = 
        new(nothing, nothing)
end
export DescribeNetworkInterfacesType


type IpPermissionSetType
    item::Union(Array{IpPermissionType,1}, Nothing)

    IpPermissionSetType(item) = 
         new(item)
    IpPermissionSetType() = 
        new(nothing)
end
export IpPermissionSetType


type ExportTaskSetResponseType
    item::Union(Array{ExportTaskResponseType,1}, Nothing)

    ExportTaskSetResponseType(item) = 
         new(item)
    ExportTaskSetResponseType() = 
        new(nothing)
end
export ExportTaskSetResponseType


type RouteTableAssociationSetType
    item::Union(Array{RouteTableAssociationType,1}, Nothing)

    RouteTableAssociationSetType(item) = 
         new(item)
    RouteTableAssociationSetType() = 
        new(nothing)
end
export RouteTableAssociationSetType


type InstanceStatusItemType
    instanceId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    eventsSet::Union(Array{InstanceStatusEventType,1}, Nothing)
    instanceState::Union(InstanceStateType, Nothing)
    systemStatus::Union(InstanceStatusType, Nothing)
    instanceStatus::Union(InstanceStatusType, Nothing)

    InstanceStatusItemType(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus) = 
         new(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus)
    InstanceStatusItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export InstanceStatusItemType


type VolumeStatusActionsSetType
    item::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusActionsSetType(item) = 
         new(item)
    VolumeStatusActionsSetType() = 
        new(nothing)
end
export VolumeStatusActionsSetType


type DescribeInstancesType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeInstancesType(instancesSet, filterSet) = 
         new(instancesSet, filterSet)
    DescribeInstancesType() = 
        new(nothing, nothing)
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

    VpcType(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault) = 
         new(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault)
    VpcType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export VpcType


type DescribeImagesOwnersType
    item::Union(Array{DescribeImagesOwnerType,1}, Nothing)

    DescribeImagesOwnersType(item) = 
         new(item)
    DescribeImagesOwnersType() = 
        new(nothing)
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

    SubnetType(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet) = 
         new(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet)
    SubnetType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export SubnetType


type DescribePlacementGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    placementGroupSet::Union(Array{PlacementGroupInfoType,1}, Nothing)

    DescribePlacementGroupsResponseType(requestId, placementGroupSet) = 
         new(requestId, placementGroupSet)
    DescribePlacementGroupsResponseType() = 
        new(nothing, nothing)
end
export DescribePlacementGroupsResponseType


type SpotInstanceRequestIdSetType
    item::Union(Array{SpotInstanceRequestIdSetItemType,1}, Nothing)

    SpotInstanceRequestIdSetType(item) = 
         new(item)
    SpotInstanceRequestIdSetType() = 
        new(nothing)
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

    BundleInstanceTaskType(instanceId, bundleId, state, startTime, updateTime, storage, progress, error) = 
         new(instanceId, bundleId, state, startTime, updateTime, storage, progress, error)
    BundleInstanceTaskType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export BundleInstanceTaskType


type DescribeVolumesType
    volumeSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeVolumesType(volumeSet, filterSet) = 
         new(volumeSet, filterSet)
    DescribeVolumesType() = 
        new(nothing, nothing)
end
export DescribeVolumesType


type VpcSetType
    item::Union(Array{VpcType,1}, Nothing)

    VpcSetType(item) = 
         new(item)
    VpcSetType() = 
        new(nothing)
end
export VpcSetType


type DescribeLicensesResponseType
    requestId::Union(ASCIIString, Nothing)
    licenseSet::Union(Array{LicenseSetItemType,1}, Nothing)

    DescribeLicensesResponseType(requestId, licenseSet) = 
         new(requestId, licenseSet)
    DescribeLicensesResponseType() = 
        new(nothing, nothing)
end
export DescribeLicensesResponseType


type CreateInstanceExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTask::Union(ExportTaskResponseType, Nothing)

    CreateInstanceExportTaskResponseType(requestId, exportTask) = 
         new(requestId, exportTask)
    CreateInstanceExportTaskResponseType() = 
        new(nothing, nothing)
end
export CreateInstanceExportTaskResponseType


type VpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    attachments::Union(Array{AttachmentType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    VpnGatewayType(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet) = 
         new(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet)
    VpnGatewayType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export VpnGatewayType


type DescribeSubnetsType
    subnetSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSubnetsType(subnetSet, filterSet) = 
         new(subnetSet, filterSet)
    DescribeSubnetsType() = 
        new(nothing, nothing)
end
export DescribeSubnetsType


type CreateDhcpOptionsType
    dhcpConfigurationSet::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    CreateDhcpOptionsType(dhcpConfigurationSet) = 
         new(dhcpConfigurationSet)
    CreateDhcpOptionsType() = 
        new(nothing)
end
export CreateDhcpOptionsType


type DescribeVpcsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcSet::Union(Array{VpcType,1}, Nothing)

    DescribeVpcsResponseType(requestId, vpcSet) = 
         new(requestId, vpcSet)
    DescribeVpcsResponseType() = 
        new(nothing, nothing)
end
export DescribeVpcsResponseType


type InstanceIdSetType
    item::Union(Array{InstanceIdType,1}, Nothing)

    InstanceIdSetType(item) = 
         new(item)
    InstanceIdSetType() = 
        new(nothing)
end
export InstanceIdSetType


type LicenseCapacitySetType
    item::Union(Array{LicenseCapacitySetItemType,1}, Nothing)

    LicenseCapacitySetType(item) = 
         new(item)
    LicenseCapacitySetType() = 
        new(nothing)
end
export LicenseCapacitySetType


type InstanceBlockDeviceMappingType
    item::Union(Array{InstanceBlockDeviceMappingItemType,1}, Nothing)

    InstanceBlockDeviceMappingType(item) = 
         new(item)
    InstanceBlockDeviceMappingType() = 
        new(nothing)
end
export InstanceBlockDeviceMappingType


type DescribeReservedInstancesOfferingsResponseSetType
    item::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetType(item) = 
         new(item)
    DescribeReservedInstancesOfferingsResponseSetType() = 
        new(nothing)
end
export DescribeReservedInstancesOfferingsResponseSetType


type DescribeNetworkAclsType
    networkAclIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeNetworkAclsType(networkAclIdSet, filterSet) = 
         new(networkAclIdSet, filterSet)
    DescribeNetworkAclsType() = 
        new(nothing, nothing)
end
export DescribeNetworkAclsType


type RevokeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    RevokeSecurityGroupEgressType(groupId, ipPermissions) = 
         new(groupId, ipPermissions)
    RevokeSecurityGroupEgressType() = 
        new(nothing, nothing)
end
export RevokeSecurityGroupEgressType


type DhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    dhcpConfigurationSet::Union(Array{DhcpConfigurationItemType,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    DhcpOptionsType(dhcpOptionsId, dhcpConfigurationSet, tagSet) = 
         new(dhcpOptionsId, dhcpConfigurationSet, tagSet)
    DhcpOptionsType() = 
        new(nothing, nothing, nothing)
end
export DhcpOptionsType


type InstanceBlockDeviceMappingResponseType
    item::Union(Array{InstanceBlockDeviceMappingResponseItemType,1}, Nothing)

    InstanceBlockDeviceMappingResponseType(item) = 
         new(item)
    InstanceBlockDeviceMappingResponseType() = 
        new(nothing)
end
export InstanceBlockDeviceMappingResponseType


type InstanceStatusDetailsSetType
    item::Union(Array{InstanceStatusDetailsSetItemType,1}, Nothing)

    InstanceStatusDetailsSetType(item) = 
         new(item)
    InstanceStatusDetailsSetType() = 
        new(nothing)
end
export InstanceStatusDetailsSetType


type DescribeBundleTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTasksSet::Union(Array{BundleInstanceTaskType,1}, Nothing)

    DescribeBundleTasksResponseType(requestId, bundleInstanceTasksSet) = 
         new(requestId, bundleInstanceTasksSet)
    DescribeBundleTasksResponseType() = 
        new(nothing, nothing)
end
export DescribeBundleTasksResponseType


type VolumeStatusInfoType
    status::Union(ASCIIString, Nothing)
    details::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusInfoType(status, details) = 
         new(status, details)
    VolumeStatusInfoType() = 
        new(nothing, nothing)
end
export VolumeStatusInfoType


type RecurringChargesSetType
    item::Union(Array{RecurringChargesSetItemType,1}, Nothing)

    RecurringChargesSetType(item) = 
         new(item)
    RecurringChargesSetType() = 
        new(nothing)
end
export RecurringChargesSetType


type InternetGatewayIdSetType
    item::Union(Array{InternetGatewayIdSetItemType,1}, Nothing)

    InternetGatewayIdSetType(item) = 
         new(item)
    InternetGatewayIdSetType() = 
        new(nothing)
end
export InternetGatewayIdSetType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeAccountAttributesType(accountAttributeNameSet, filterSet) = 
         new(accountAttributeNameSet, filterSet)
    DescribeAccountAttributesType() = 
        new(nothing, nothing)
end
export DescribeAccountAttributesType


type CustomerGatewaySetType
    item::Union(Array{CustomerGatewayType,1}, Nothing)

    CustomerGatewaySetType(item) = 
         new(item)
    CustomerGatewaySetType() = 
        new(nothing)
end
export CustomerGatewaySetType


type LaunchPermissionOperationType
    add::Union(Array{LaunchPermissionItemType,1}, Nothing)
    remove::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionOperationType(add, remove) = 
         new(add, remove)
    LaunchPermissionOperationType() = 
        new(nothing, nothing)
end
export LaunchPermissionOperationType


type DescribePlacementGroupsType
    placementGroupSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribePlacementGroupsType(placementGroupSet, filterSet) = 
         new(placementGroupSet, filterSet)
    DescribePlacementGroupsType() = 
        new(nothing, nothing)
end
export DescribePlacementGroupsType


type DescribeExportTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTaskSet::Union(Array{ExportTaskResponseType,1}, Nothing)

    DescribeExportTasksResponseType(requestId, exportTaskSet) = 
         new(requestId, exportTaskSet)
    DescribeExportTasksResponseType() = 
        new(nothing, nothing)
end
export DescribeExportTasksResponseType


type DescribeInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceStatusSet::Union(Array{InstanceStatusItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeInstanceStatusResponseType(requestId, instanceStatusSet, nextToken) = 
         new(requestId, instanceStatusSet, nextToken)
    DescribeInstanceStatusResponseType() = 
        new(nothing, nothing, nothing)
end
export DescribeInstanceStatusResponseType


type BlockDeviceMappingType
    item::Union(Array{BlockDeviceMappingItemType,1}, Nothing)

    BlockDeviceMappingType(item) = 
         new(item)
    BlockDeviceMappingType() = 
        new(nothing)
end
export BlockDeviceMappingType


type DescribeRegionsResponseType
    requestId::Union(ASCIIString, Nothing)
    regionInfo::Union(Array{RegionItemType,1}, Nothing)

    DescribeRegionsResponseType(requestId, regionInfo) = 
         new(requestId, regionInfo)
    DescribeRegionsResponseType() = 
        new(nothing, nothing)
end
export DescribeRegionsResponseType


type RouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    routeSet::Union(Array{RouteType,1}, Nothing)
    associationSet::Union(Array{RouteTableAssociationType,1}, Nothing)
    propagatingVgwSet::Union(Array{ASCIIString,1}, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    RouteTableType(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet) = 
         new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet)
    RouteTableType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export RouteTableType


type AccountAttributeValueSetType
    item::Union(Array{AccountAttributeValueSetItemType,1}, Nothing)

    AccountAttributeValueSetType(item) = 
         new(item)
    AccountAttributeValueSetType() = 
        new(nothing)
end
export AccountAttributeValueSetType


type ExportTaskIdSetType
    item::Union(Array{ExportTaskIdType,1}, Nothing)

    ExportTaskIdSetType(item) = 
         new(item)
    ExportTaskIdSetType() = 
        new(nothing)
end
export ExportTaskIdSetType


type InstanceCountsSetType
    item::Union(Array{InstanceCountsSetItemType,1}, Nothing)

    InstanceCountsSetType(item) = 
         new(item)
    InstanceCountsSetType() = 
        new(nothing)
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

    VpnConnectionType(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes) = 
         new(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes)
    VpnConnectionType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export VpnConnectionType


type DescribeAddressesResponseInfoType
    item::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseInfoType(item) = 
         new(item)
    DescribeAddressesResponseInfoType() = 
        new(nothing)
end
export DescribeAddressesResponseInfoType


type DescribeKeyPairsResponseType
    requestId::Union(ASCIIString, Nothing)
    keySet::Union(Array{DescribeKeyPairsResponseItemType,1}, Nothing)

    DescribeKeyPairsResponseType(requestId, keySet) = 
         new(requestId, keySet)
    DescribeKeyPairsResponseType() = 
        new(nothing, nothing)
end
export DescribeKeyPairsResponseType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeDhcpOptionsType(dhcpOptionsSet, filterSet) = 
         new(dhcpOptionsSet, filterSet)
    DescribeDhcpOptionsType() = 
        new(nothing, nothing)
end
export DescribeDhcpOptionsType


type InternetGatewaySetType
    item::Union(Array{InternetGatewayType,1}, Nothing)

    InternetGatewaySetType(item) = 
         new(item)
    InternetGatewaySetType() = 
        new(nothing)
end
export InternetGatewaySetType


type DescribeReservedInstancesOfferingsSetType
    item::Union(Array{DescribeReservedInstancesOfferingsSetItemType,1}, Nothing)

    DescribeReservedInstancesOfferingsSetType(item) = 
         new(item)
    DescribeReservedInstancesOfferingsSetType() = 
        new(nothing)
end
export DescribeReservedInstancesOfferingsSetType


type LicenseIdSetType
    item::Union(Array{LicenseIdSetItemType,1}, Nothing)

    LicenseIdSetType(item) = 
         new(item)
    LicenseIdSetType() = 
        new(nothing)
end
export LicenseIdSetType


type InstanceStatusEventsSetType
    item::Union(Array{InstanceStatusEventType,1}, Nothing)

    InstanceStatusEventsSetType(item) = 
         new(item)
    InstanceStatusEventsSetType() = 
        new(nothing)
end
export InstanceStatusEventsSetType


type DescribeImagesExecutableBySetType
    item::Union(Array{DescribeImagesExecutableByType,1}, Nothing)

    DescribeImagesExecutableBySetType(item) = 
         new(item)
    DescribeImagesExecutableBySetType() = 
        new(nothing)
end
export DescribeImagesExecutableBySetType


type ImportInstanceTaskDetailsType
    volumes::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    platform::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    ImportInstanceTaskDetailsType(volumes, instanceId, platform, description) = 
         new(volumes, instanceId, platform, description)
    ImportInstanceTaskDetailsType() = 
        new(nothing, nothing, nothing, nothing)
end
export ImportInstanceTaskDetailsType


type RouteTableIdSetType
    item::Union(Array{RouteTableIdSetItemType,1}, Nothing)

    RouteTableIdSetType(item) = 
         new(item)
    RouteTableIdSetType() = 
        new(nothing)
end
export RouteTableIdSetType


type AssignPrivateIpAddressesSetRequestType
    item::Union(Array{AssignPrivateIpAddressesSetItemRequestType,1}, Nothing)

    AssignPrivateIpAddressesSetRequestType(item) = 
         new(item)
    AssignPrivateIpAddressesSetRequestType() = 
        new(nothing)
end
export AssignPrivateIpAddressesSetRequestType


type ImportVolumeTaskDetailsType
    bytesConverted::Union(Int64, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    image::Union(DiskImageDescriptionType, Nothing)
    volume::Union(DiskImageVolumeDescriptionType, Nothing)

    ImportVolumeTaskDetailsType(bytesConverted, availabilityZone, description, image, volume) = 
         new(bytesConverted, availabilityZone, description, image, volume)
    ImportVolumeTaskDetailsType() = 
        new(nothing, nothing, nothing, nothing, nothing)
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

    InstanceNetworkInterfaceSetItemRequestType(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount) = 
         new(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount)
    InstanceNetworkInterfaceSetItemRequestType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export InstanceNetworkInterfaceSetItemRequestType


type NetworkAclIdSetType
    item::Union(Array{NetworkAclIdSetItemType,1}, Nothing)

    NetworkAclIdSetType(item) = 
         new(item)
    NetworkAclIdSetType() = 
        new(nothing)
end
export NetworkAclIdSetType


type InstanceStatusSetType
    item::Union(Array{InstanceStatusItemType,1}, Nothing)

    InstanceStatusSetType(item) = 
         new(item)
    InstanceStatusSetType() = 
        new(nothing)
end
export InstanceStatusSetType


type DescribeInstancesInfoType
    item::Union(Array{DescribeInstancesItemType,1}, Nothing)

    DescribeInstancesInfoType(item) = 
         new(item)
    DescribeInstancesInfoType() = 
        new(nothing)
end
export DescribeInstancesInfoType


type ImportInstanceGroupSetType
    item::Union(Array{ImportInstanceGroupItemType,1}, Nothing)

    ImportInstanceGroupSetType(item) = 
         new(item)
    ImportInstanceGroupSetType() = 
        new(nothing)
end
export ImportInstanceGroupSetType


type MonitorInstancesSetType
    item::Union(Array{MonitorInstancesSetItemType,1}, Nothing)

    MonitorInstancesSetType(item) = 
         new(item)
    MonitorInstancesSetType() = 
        new(nothing)
end
export MonitorInstancesSetType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int32, Nothing)
    limitPrice::Union(ReservedInstanceLimitPriceType, Nothing)

    PurchaseReservedInstancesOfferingType(reservedInstancesOfferingId, instanceCount, limitPrice) = 
         new(reservedInstancesOfferingId, instanceCount, limitPrice)
    PurchaseReservedInstancesOfferingType() = 
        new(nothing, nothing, nothing)
end
export PurchaseReservedInstancesOfferingType


type DescribeReservedInstancesOfferingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesOfferingsSet::Union(Array{DescribeReservedInstancesOfferingsResponseSetItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsResponseType(requestId, reservedInstancesOfferingsSet, nextToken) = 
         new(requestId, reservedInstancesOfferingsSet, nextToken)
    DescribeReservedInstancesOfferingsResponseType() = 
        new(nothing, nothing, nothing)
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

    CreateNetworkAclEntryType(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
    CreateNetworkAclEntryType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export CreateNetworkAclEntryType


type RevokeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    RevokeSecurityGroupIngressType(userId, ipPermissions) = 
         new(userId, ipPermissions)
    RevokeSecurityGroupIngressType() = 
        new(nothing, nothing)
end
export RevokeSecurityGroupIngressType


type DescribeInstanceStatusType
    instancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)
    maxResults::Union(Int32, Nothing)
    includeAllInstances::Union(Bool, Nothing)

    DescribeInstanceStatusType(instancesSet, filterSet, nextToken, maxResults, includeAllInstances) = 
         new(instancesSet, filterSet, nextToken, maxResults, includeAllInstances)
    DescribeInstanceStatusType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export DescribeInstanceStatusType


type DescribeKeyPairsType
    keySet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeKeyPairsType(keySet, filterSet) = 
         new(keySet, filterSet)
    DescribeKeyPairsType() = 
        new(nothing, nothing)
end
export DescribeKeyPairsType


type PropagatingVgwSetType
    item::Union(Array{PropagatingVgwType,1}, Nothing)

    PropagatingVgwSetType(item) = 
         new(item)
    PropagatingVgwSetType() = 
        new(nothing)
end
export PropagatingVgwSetType


type AttachmentSetResponseType
    item::Union(Array{AttachmentSetItemResponseType,1}, Nothing)

    AttachmentSetResponseType(item) = 
         new(item)
    AttachmentSetResponseType() = 
        new(nothing)
end
export AttachmentSetResponseType


type DescribeCustomerGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGatewaySet::Union(Array{CustomerGatewayType,1}, Nothing)

    DescribeCustomerGatewaysResponseType(requestId, customerGatewaySet) = 
         new(requestId, customerGatewaySet)
    DescribeCustomerGatewaysResponseType() = 
        new(nothing, nothing)
end
export DescribeCustomerGatewaysResponseType


type PricingDetailsSetType
    item::Union(Array{PricingDetailsSetItemType,1}, Nothing)

    PricingDetailsSetType(item) = 
         new(item)
    PricingDetailsSetType() = 
        new(nothing)
end
export PricingDetailsSetType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union(Array{ASCIIString,1}, Nothing)
    reservedInstancesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeReservedInstancesListingsType(reservedInstancesListingSet, reservedInstancesSet, filterSet) = 
         new(reservedInstancesListingSet, reservedInstancesSet, filterSet)
    DescribeReservedInstancesListingsType() = 
        new(nothing, nothing, nothing)
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

    DescribeVolumesSetItemResponseType(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops) = 
         new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops)
    DescribeVolumesSetItemResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeVolumesSetItemResponseType


type ProductCodeListType
    item::Union(Array{ProductCodeItemType,1}, Nothing)

    ProductCodeListType(item) = 
         new(item)
    ProductCodeListType() = 
        new(nothing)
end
export ProductCodeListType


type CreateNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAcl::Union(NetworkAclType, Nothing)

    CreateNetworkAclResponseType(requestId, networkAcl) = 
         new(requestId, networkAcl)
    CreateNetworkAclResponseType() = 
        new(nothing, nothing)
end
export CreateNetworkAclResponseType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    DescribeSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) = 
         new(requestId, spotDatafeedSubscription)
    DescribeSpotDatafeedSubscriptionResponseType() = 
        new(nothing, nothing)
end
export DescribeSpotDatafeedSubscriptionResponseType


type DescribeSnapshotsOwnersType
    item::Union(Array{DescribeSnapshotsOwnerType,1}, Nothing)

    DescribeSnapshotsOwnersType(item) = 
         new(item)
    DescribeSnapshotsOwnersType() = 
        new(nothing)
end
export DescribeSnapshotsOwnersType


type DescribeTagsType
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeTagsType(filterSet) = 
         new(filterSet)
    DescribeTagsType() = 
        new(nothing)
end
export DescribeTagsType


type DescribeAccountAttributesResponseType
    requestId::Union(ASCIIString, Nothing)
    accountAttributeSet::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    DescribeAccountAttributesResponseType(requestId, accountAttributeSet) = 
         new(requestId, accountAttributeSet)
    DescribeAccountAttributesResponseType() = 
        new(nothing, nothing)
end
export DescribeAccountAttributesResponseType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    CreateSpotDatafeedSubscriptionResponseType(requestId, spotDatafeedSubscription) = 
         new(requestId, spotDatafeedSubscription)
    CreateSpotDatafeedSubscriptionResponseType() = 
        new(nothing, nothing)
end
export CreateSpotDatafeedSubscriptionResponseType


type DescribeSecurityGroupsIdSetType
    item::Union(Array{DescribeSecurityGroupsIdSetItemType,1}, Nothing)

    DescribeSecurityGroupsIdSetType(item) = 
         new(item)
    DescribeSecurityGroupsIdSetType() = 
        new(nothing)
end
export DescribeSecurityGroupsIdSetType


type DescribeVolumeStatusType
    volumeSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)
    maxResults::Union(Int, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusType(volumeSet, filterSet, maxResults, nextToken) = 
         new(volumeSet, filterSet, maxResults, nextToken)
    DescribeVolumeStatusType() = 
        new(nothing, nothing, nothing, nothing)
end
export DescribeVolumeStatusType


type DescribeReservedInstancesSetType
    item::Union(Array{DescribeReservedInstancesSetItemType,1}, Nothing)

    DescribeReservedInstancesSetType(item) = 
         new(item)
    DescribeReservedInstancesSetType() = 
        new(nothing)
end
export DescribeReservedInstancesSetType


type CreateCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGateway::Union(CustomerGatewayType, Nothing)

    CreateCustomerGatewayResponseType(requestId, customerGateway) = 
         new(requestId, customerGateway)
    CreateCustomerGatewayResponseType() = 
        new(nothing, nothing)
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

    DescribeSpotPriceHistoryType(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken) = 
         new(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken)
    DescribeSpotPriceHistoryType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeSpotPriceHistoryType


type DescribeReservedInstancesListingsResponseSetType
    item::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    DescribeReservedInstancesListingsResponseSetType(item) = 
         new(item)
    DescribeReservedInstancesListingsResponseSetType() = 
        new(nothing)
end
export DescribeReservedInstancesListingsResponseSetType


type CreateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptions::Union(DhcpOptionsType, Nothing)

    CreateDhcpOptionsResponseType(requestId, dhcpOptions) = 
         new(requestId, dhcpOptions)
    CreateDhcpOptionsResponseType() = 
        new(nothing, nothing)
end
export CreateDhcpOptionsResponseType


type CreateInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGateway::Union(InternetGatewayType, Nothing)

    CreateInternetGatewayResponseType(requestId, internetGateway) = 
         new(requestId, internetGateway)
    CreateInternetGatewayResponseType() = 
        new(nothing, nothing)
end
export CreateInternetGatewayResponseType


type FilterSetType
    item::Union(Array{FilterType,1}, Nothing)

    FilterSetType(item) = 
         new(item)
    FilterSetType() = 
        new(nothing)
end
export FilterSetType


type AvailabilityZoneSetType
    item::Union(Array{AvailabilityZoneItemType,1}, Nothing)

    AvailabilityZoneSetType(item) = 
         new(item)
    AvailabilityZoneSetType() = 
        new(nothing)
end
export AvailabilityZoneSetType


type CreateVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnection::Union(VpnConnectionType, Nothing)

    CreateVpnConnectionResponseType(requestId, vpnConnection) = 
         new(requestId, vpnConnection)
    CreateVpnConnectionResponseType() = 
        new(nothing, nothing)
end
export CreateVpnConnectionResponseType


type InstanceStateChangeType
    instanceId::Union(ASCIIString, Nothing)
    currentState::Union(InstanceStateType, Nothing)
    previousState::Union(InstanceStateType, Nothing)

    InstanceStateChangeType(instanceId, currentState, previousState) = 
         new(instanceId, currentState, previousState)
    InstanceStateChangeType() = 
        new(nothing, nothing, nothing)
end
export InstanceStateChangeType


type ReportInstanceStatusReasonCodesSetType
    item::Union(Array{ReportInstanceStatusReasonCodeSetItemType,1}, Nothing)

    ReportInstanceStatusReasonCodesSetType(item) = 
         new(item)
    ReportInstanceStatusReasonCodesSetType() = 
        new(nothing)
end
export ReportInstanceStatusReasonCodesSetType


type DescribeBundleTasksType
    bundlesSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeBundleTasksType(bundlesSet, filterSet) = 
         new(bundlesSet, filterSet)
    DescribeBundleTasksType() = 
        new(nothing, nothing)
end
export DescribeBundleTasksType


type DescribeRouteTablesType
    routeTableIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeRouteTablesType(routeTableIdSet, filterSet) = 
         new(routeTableIdSet, filterSet)
    DescribeRouteTablesType() = 
        new(nothing, nothing)
end
export DescribeRouteTablesType


type DescribeVpnGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGatewaySet::Union(Array{VpnGatewayType,1}, Nothing)

    DescribeVpnGatewaysResponseType(requestId, vpnGatewaySet) = 
         new(requestId, vpnGatewaySet)
    DescribeVpnGatewaysResponseType() = 
        new(nothing, nothing)
end
export DescribeVpnGatewaysResponseType


type DescribePlacementGroupsInfoType
    item::Union(Array{DescribePlacementGroupItemType,1}, Nothing)

    DescribePlacementGroupsInfoType(item) = 
         new(item)
    DescribePlacementGroupsInfoType() = 
        new(nothing)
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

    DescribeSnapshotsSetItemResponseType(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet) = 
         new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet)
    DescribeSnapshotsSetItemResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export DescribeSnapshotsSetItemResponseType


type DescribeSecurityGroupsType
    securityGroupSet::Union(Array{ASCIIString,1}, Nothing)
    securityGroupIdSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeSecurityGroupsType(securityGroupSet, securityGroupIdSet, filterSet) = 
         new(securityGroupSet, securityGroupIdSet, filterSet)
    DescribeSecurityGroupsType() = 
        new(nothing, nothing, nothing)
end
export DescribeSecurityGroupsType


type CancelBundleTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    CancelBundleTaskResponseType(requestId, bundleInstanceTask) = 
         new(requestId, bundleInstanceTask)
    CancelBundleTaskResponseType() = 
        new(nothing, nothing)
end
export CancelBundleTaskResponseType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)

    NetworkInterfacePrivateIpAddressesSetItemType(privateIpAddress, privateDnsName, primary, association) = 
         new(privateIpAddress, privateDnsName, primary, association)
    NetworkInterfacePrivateIpAddressesSetItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export NetworkInterfacePrivateIpAddressesSetItemType


type InstanceTypeSetType
    item::Union(Array{InstanceTypeSetItemType,1}, Nothing)

    InstanceTypeSetType(item) = 
         new(item)
    InstanceTypeSetType() = 
        new(nothing)
end
export InstanceTypeSetType


type DiskImageType
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    DiskImageType(image, description, volume) = 
         new(image, description, volume)
    DiskImageType() = 
        new(nothing, nothing, nothing)
end
export DiskImageType


type AccountAttributeSetType
    item::Union(Array{AccountAttributeSetItemType,1}, Nothing)

    AccountAttributeSetType(item) = 
         new(item)
    AccountAttributeSetType() = 
        new(nothing)
end
export AccountAttributeSetType


type UserIdGroupPairSetType
    item::Union(Array{UserIdGroupPairType,1}, Nothing)

    UserIdGroupPairSetType(item) = 
         new(item)
    UserIdGroupPairSetType() = 
        new(nothing)
end
export UserIdGroupPairSetType


type ResourceTagSetType
    item::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ResourceTagSetType(item) = 
         new(item)
    ResourceTagSetType() = 
        new(nothing)
end
export ResourceTagSetType


type NetworkAclEntrySetType
    item::Union(Array{NetworkAclEntryType,1}, Nothing)

    NetworkAclEntrySetType(item) = 
         new(item)
    NetworkAclEntrySetType() = 
        new(nothing)
end
export NetworkAclEntrySetType


type LaunchPermissionListType
    item::Union(Array{LaunchPermissionItemType,1}, Nothing)

    LaunchPermissionListType(item) = 
         new(item)
    LaunchPermissionListType() = 
        new(nothing)
end
export LaunchPermissionListType


type StartInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    StartInstancesResponseType(requestId, instancesSet) = 
         new(requestId, instancesSet)
    StartInstancesResponseType() = 
        new(nothing, nothing)
end
export StartInstancesResponseType


type SecurityGroupIdSetType
    item::Union(Array{SecurityGroupIdSetItemType,1}, Nothing)

    SecurityGroupIdSetType(item) = 
         new(item)
    SecurityGroupIdSetType() = 
        new(nothing)
end
export SecurityGroupIdSetType


type InternetGatewayAttachmentSetType
    item::Union(Array{InternetGatewayAttachmentType,1}, Nothing)

    InternetGatewayAttachmentSetType(item) = 
         new(item)
    InternetGatewayAttachmentSetType() = 
        new(nothing)
end
export InternetGatewayAttachmentSetType


type ConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)
    expirationTime::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    tagSet::Union(Array{ResourceTagSetItemType,1}, Nothing)

    ConversionTaskType(conversionTaskId, expirationTime, state, statusMessage, tagSet) = 
         new(conversionTaskId, expirationTime, state, statusMessage, tagSet)
    ConversionTaskType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export ConversionTaskType


type VolumeStatusDetailsSetType
    item::Union(Array{VolumeStatusDetailsItemType,1}, Nothing)

    VolumeStatusDetailsSetType(item) = 
         new(item)
    VolumeStatusDetailsSetType() = 
        new(nothing)
end
export VolumeStatusDetailsSetType


type AttachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    attachment::Union(AttachmentType, Nothing)

    AttachVpnGatewayResponseType(requestId, attachment) = 
         new(requestId, attachment)
    AttachVpnGatewayResponseType() = 
        new(nothing, nothing)
end
export AttachVpnGatewayResponseType


type MonitorInstancesResponseSetItemType
    instanceId::Union(ASCIIString, Nothing)
    monitoring::Union(InstanceMonitoringStateType, Nothing)

    MonitorInstancesResponseSetItemType(instanceId, monitoring) = 
         new(instanceId, monitoring)
    MonitorInstancesResponseSetItemType() = 
        new(nothing, nothing)
end
export MonitorInstancesResponseSetItemType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)

    InstancePrivateIpAddressesSetItemType(privateIpAddress, privateDnsName, primary, association) = 
         new(privateIpAddress, privateDnsName, primary, association)
    InstancePrivateIpAddressesSetItemType() = 
        new(nothing, nothing, nothing, nothing)
end
export InstancePrivateIpAddressesSetItemType


type DescribeDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptionsSet::Union(Array{DhcpOptionsType,1}, Nothing)

    DescribeDhcpOptionsResponseType(requestId, dhcpOptionsSet) = 
         new(requestId, dhcpOptionsSet)
    DescribeDhcpOptionsResponseType() = 
        new(nothing, nothing)
end
export DescribeDhcpOptionsResponseType


type AuthorizeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    AuthorizeSecurityGroupIngressType(userId, ipPermissions) = 
         new(userId, ipPermissions)
    AuthorizeSecurityGroupIngressType() = 
        new(nothing, nothing)
end
export AuthorizeSecurityGroupIngressType


type RouteSetType
    item::Union(Array{RouteType,1}, Nothing)

    RouteSetType(item) = 
         new(item)
    RouteSetType() = 
        new(nothing)
end
export RouteSetType


type RouteTableSetType
    item::Union(Array{RouteTableType,1}, Nothing)

    RouteTableSetType(item) = 
         new(item)
    RouteTableSetType() = 
        new(nothing)
end
export RouteTableSetType


type CreateVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGateway::Union(VpnGatewayType, Nothing)

    CreateVpnGatewayResponseType(requestId, vpnGateway) = 
         new(requestId, vpnGateway)
    CreateVpnGatewayResponseType() = 
        new(nothing, nothing)
end
export CreateVpnGatewayResponseType


type PrivateIpAddressesSetRequestType
    item::Union(Array{PrivateIpAddressesSetItemRequestType,1}, Nothing)

    PrivateIpAddressesSetRequestType(item) = 
         new(item)
    PrivateIpAddressesSetRequestType() = 
        new(nothing)
end
export PrivateIpAddressesSetRequestType


type CreateReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Array{DescribeReservedInstancesListingsResponseSetItemType,1}, Nothing)

    CreateReservedInstancesListingResponseType(requestId, reservedInstancesListingsSet) = 
         new(requestId, reservedInstancesListingsSet)
    CreateReservedInstancesListingResponseType() = 
        new(nothing, nothing)
end
export CreateReservedInstancesListingResponseType


type ImportInstanceVolumeDetailSetType
    item::Union(Array{ImportInstanceVolumeDetailItemType,1}, Nothing)

    ImportInstanceVolumeDetailSetType(item) = 
         new(item)
    ImportInstanceVolumeDetailSetType() = 
        new(nothing)
end
export ImportInstanceVolumeDetailSetType


type DhcpConfigurationItemSetType
    item::Union(Array{DhcpConfigurationItemType,1}, Nothing)

    DhcpConfigurationItemSetType(item) = 
         new(item)
    DhcpConfigurationItemSetType() = 
        new(nothing)
end
export DhcpConfigurationItemSetType


type DescribeRouteTablesResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTableSet::Union(Array{RouteTableType,1}, Nothing)

    DescribeRouteTablesResponseType(requestId, routeTableSet) = 
         new(requestId, routeTableSet)
    DescribeRouteTablesResponseType() = 
        new(nothing, nothing)
end
export DescribeRouteTablesResponseType


type DhcpOptionsIdSetType
    item::Union(Array{DhcpOptionsIdSetItemType,1}, Nothing)

    DhcpOptionsIdSetType(item) = 
         new(item)
    DhcpOptionsIdSetType() = 
        new(nothing)
end
export DhcpOptionsIdSetType


type DescribeRegionsType
    regionSet::Union(Array{ASCIIString,1}, Nothing)
    filterSet::Union(Array{FilterType,1}, Nothing)

    DescribeRegionsType(regionSet, filterSet) = 
         new(regionSet, filterSet)
    DescribeRegionsType() = 
        new(nothing, nothing)
end
export DescribeRegionsType


type DescribeInternetGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGatewaySet::Union(Array{InternetGatewayType,1}, Nothing)

    DescribeInternetGatewaysResponseType(requestId, internetGatewaySet) = 
         new(requestId, internetGatewaySet)
    DescribeInternetGatewaysResponseType() = 
        new(nothing, nothing)
end
export DescribeInternetGatewaysResponseType


type BundleInstanceType
    instanceId::Union(ASCIIString, Nothing)
    storage::Union(BundleInstanceTaskStorageType, Nothing)

    BundleInstanceType(instanceId, storage) = 
         new(instanceId, storage)
    BundleInstanceType() = 
        new(nothing, nothing)
end
export BundleInstanceType


type ImportInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportInstanceResponseType(requestId, conversionTask) = 
         new(requestId, conversionTask)
    ImportInstanceResponseType() = 
        new(nothing, nothing)
end
export ImportInstanceResponseType


type DescribeAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    addressesSet::Union(Array{DescribeAddressesResponseItemType,1}, Nothing)

    DescribeAddressesResponseType(requestId, addressesSet) = 
         new(requestId, addressesSet)
    DescribeAddressesResponseType() = 
        new(nothing, nothing)
end
export DescribeAddressesResponseType


type CancelSpotInstanceRequestsResponseSetType
    item::Union(Array{CancelSpotInstanceRequestsResponseSetItemType,1}, Nothing)

    CancelSpotInstanceRequestsResponseSetType(item) = 
         new(item)
    CancelSpotInstanceRequestsResponseSetType() = 
        new(nothing)
end
export CancelSpotInstanceRequestsResponseSetType


type DhcpValueSetType
    item::Union(Array{DhcpValueType,1}, Nothing)

    DhcpValueSetType(item) = 
         new(item)
    DhcpValueSetType() = 
        new(nothing)
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

    LaunchSpecificationResponseType(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized) = 
         new(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
    LaunchSpecificationResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export LaunchSpecificationResponseType


type CreateVolumePermissionListType
    item::Union(Array{CreateVolumePermissionItemType,1}, Nothing)

    CreateVolumePermissionListType(item) = 
         new(item)
    CreateVolumePermissionListType() = 
        new(nothing)
end
export CreateVolumePermissionListType


type AccountAttributeNameSetType
    item::Union(Array{AccountAttributeNameSetItemType,1}, Nothing)

    AccountAttributeNameSetType(item) = 
         new(item)
    AccountAttributeNameSetType() = 
        new(nothing)
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

    DescribeImagesResponseItemType(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor) = 
         new(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor)
    DescribeImagesResponseItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
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

    RunInstancesType(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized) = 
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
    RunInstancesType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
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

    LaunchSpecificationRequestType(imageId, keyName, groupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized) = 
         new(imageId, keyName, groupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
    LaunchSpecificationRequestType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export LaunchSpecificationRequestType


type DescribeVpnConnectionsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnectionSet::Union(Array{VpnConnectionType,1}, Nothing)

    DescribeVpnConnectionsResponseType(requestId, vpnConnectionSet) = 
         new(requestId, vpnConnectionSet)
    DescribeVpnConnectionsResponseType() = 
        new(nothing, nothing)
end
export DescribeVpnConnectionsResponseType


type VolumeStatusItemType
    volumeId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeStatus::Union(VolumeStatusInfoType, Nothing)
    eventsSet::Union(Array{VolumeStatusEventItemType,1}, Nothing)
    actionsSet::Union(Array{VolumeStatusActionItemType,1}, Nothing)

    VolumeStatusItemType(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet) = 
         new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
    VolumeStatusItemType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export VolumeStatusItemType


type VolumeStatusSetType
    item::Union(Array{VolumeStatusItemType,1}, Nothing)

    VolumeStatusSetType(item) = 
         new(item)
    VolumeStatusSetType() = 
        new(nothing)
end
export VolumeStatusSetType


type ImportInstanceType
    description::Union(ASCIIString, Nothing)
    launchSpecification::Union(ImportInstanceLaunchSpecificationType, Nothing)
    diskImageSet::Union(Array{DiskImageType,1}, Nothing)
    keepPartialImports::Union(Bool, Nothing)
    platform::Union(ASCIIString, Nothing)

    ImportInstanceType(description, launchSpecification, diskImageSet, keepPartialImports, platform) = 
         new(description, launchSpecification, diskImageSet, keepPartialImports, platform)
    ImportInstanceType() = 
        new(nothing, nothing, nothing, nothing, nothing)
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

    SpotInstanceRequestSetItemType(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone) = 
         new(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone)
    SpotInstanceRequestSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export SpotInstanceRequestSetItemType


type DescribeVolumesResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeSet::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesResponseType(requestId, volumeSet) = 
         new(requestId, volumeSet)
    DescribeVolumesResponseType() = 
        new(nothing, nothing)
end
export DescribeVolumesResponseType


type InstanceStateChangeSetType
    item::Union(Array{InstanceStateChangeType,1}, Nothing)

    InstanceStateChangeSetType(item) = 
         new(item)
    InstanceStateChangeSetType() = 
        new(nothing)
end
export InstanceStateChangeSetType


type DescribeVolumesSetResponseType
    item::Union(Array{DescribeVolumesSetItemResponseType,1}, Nothing)

    DescribeVolumesSetResponseType(item) = 
         new(item)
    DescribeVolumesSetResponseType() = 
        new(nothing)
end
export DescribeVolumesSetResponseType


type BundleInstanceTasksSetType
    item::Union(Array{BundleInstanceTaskType,1}, Nothing)

    BundleInstanceTasksSetType(item) = 
         new(item)
    BundleInstanceTasksSetType() = 
        new(nothing)
end
export BundleInstanceTasksSetType


type DescribeSnapshotsResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotSet::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsResponseType(requestId, snapshotSet) = 
         new(requestId, snapshotSet)
    DescribeSnapshotsResponseType() = 
        new(nothing, nothing)
end
export DescribeSnapshotsResponseType


type SpotInstanceRequestSetType
    item::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    SpotInstanceRequestSetType(item) = 
         new(item)
    SpotInstanceRequestSetType() = 
        new(nothing)
end
export SpotInstanceRequestSetType


type CreateSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    subnet::Union(SubnetType, Nothing)

    CreateSubnetResponseType(requestId, subnet) = 
         new(requestId, subnet)
    CreateSubnetResponseType() = 
        new(nothing, nothing)
end
export CreateSubnetResponseType


type TerminateInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    TerminateInstancesResponseType(requestId, instancesSet) = 
         new(requestId, instancesSet)
    TerminateInstancesResponseType() = 
        new(nothing, nothing)
end
export TerminateInstancesResponseType


type StopInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{InstanceStateChangeType,1}, Nothing)

    StopInstancesResponseType(requestId, instancesSet) = 
         new(requestId, instancesSet)
    StopInstancesResponseType() = 
        new(nothing, nothing)
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

    RequestSpotInstancesType(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification) = 
         new(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification)
    RequestSpotInstancesType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RequestSpotInstancesType


type CreateVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    vpc::Union(VpcType, Nothing)

    CreateVpcResponseType(requestId, vpc) = 
         new(requestId, vpc)
    CreateVpcResponseType() = 
        new(nothing, nothing)
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

    NetworkInterfaceType(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet) = 
         new(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet)
    NetworkInterfaceType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export NetworkInterfaceType


type VpnGatewaySetType
    item::Union(Array{VpnGatewayType,1}, Nothing)

    VpnGatewaySetType(item) = 
         new(item)
    VpnGatewaySetType() = 
        new(nothing)
end
export VpnGatewaySetType


type DiskImageSetType
    item::Union(Array{DiskImageType,1}, Nothing)

    DiskImageSetType(item) = 
         new(item)
    DiskImageSetType() = 
        new(nothing)
end
export DiskImageSetType


type InstanceNetworkInterfaceSetRequestType
    item::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)

    InstanceNetworkInterfaceSetRequestType(item) = 
         new(item)
    InstanceNetworkInterfaceSetRequestType() = 
        new(nothing)
end
export InstanceNetworkInterfaceSetRequestType


type ConversionTaskSetType
    item::Union(Array{ConversionTaskType,1}, Nothing)

    ConversionTaskSetType(item) = 
         new(item)
    ConversionTaskSetType() = 
        new(nothing)
end
export ConversionTaskSetType


type InstancePrivateIpAddressesSetType
    item::Union(Array{InstancePrivateIpAddressesSetItemType,1}, Nothing)

    InstancePrivateIpAddressesSetType(item) = 
         new(item)
    InstancePrivateIpAddressesSetType() = 
        new(nothing)
end
export InstancePrivateIpAddressesSetType


type NetworkAclSetType
    item::Union(Array{NetworkAclType,1}, Nothing)

    NetworkAclSetType(item) = 
         new(item)
    NetworkAclSetType() = 
        new(nothing)
end
export NetworkAclSetType


type DescribeSnapshotsSetResponseType
    item::Union(Array{DescribeSnapshotsSetItemResponseType,1}, Nothing)

    DescribeSnapshotsSetResponseType(item) = 
         new(item)
    DescribeSnapshotsSetResponseType() = 
        new(nothing)
end
export DescribeSnapshotsSetResponseType


type RequestSpotInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    RequestSpotInstancesResponseType(requestId, spotInstanceRequestSet) = 
         new(requestId, spotInstanceRequestSet)
    RequestSpotInstancesResponseType() = 
        new(nothing, nothing)
end
export RequestSpotInstancesResponseType


type DescribeSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Array{SpotInstanceRequestSetItemType,1}, Nothing)

    DescribeSpotInstanceRequestsResponseType(requestId, spotInstanceRequestSet) = 
         new(requestId, spotInstanceRequestSet)
    DescribeSpotInstanceRequestsResponseType() = 
        new(nothing, nothing)
end
export DescribeSpotInstanceRequestsResponseType


type DescribeNetworkAclsResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAclSet::Union(Array{NetworkAclType,1}, Nothing)

    DescribeNetworkAclsResponseType(requestId, networkAclSet) = 
         new(requestId, networkAclSet)
    DescribeNetworkAclsResponseType() = 
        new(nothing, nothing)
end
export DescribeNetworkAclsResponseType


type ImportVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportVolumeResponseType(requestId, conversionTask) = 
         new(requestId, conversionTask)
    ImportVolumeResponseType() = 
        new(nothing, nothing)
end
export ImportVolumeResponseType


type DescribeVolumeStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeStatusSet::Union(Array{VolumeStatusItemType,1}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusResponseType(requestId, volumeStatusSet, nextToken) = 
         new(requestId, volumeStatusSet, nextToken)
    DescribeVolumeStatusResponseType() = 
        new(nothing, nothing, nothing)
end
export DescribeVolumeStatusResponseType


type MonitorInstancesResponseSetType
    item::Union(Array{MonitorInstancesResponseSetItemType,1}, Nothing)

    MonitorInstancesResponseSetType(item) = 
         new(item)
    MonitorInstancesResponseSetType() = 
        new(nothing)
end
export MonitorInstancesResponseSetType


type DescribeImagesResponseType
    requestId::Union(ASCIIString, Nothing)
    imagesSet::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseType(requestId, imagesSet) = 
         new(requestId, imagesSet)
    DescribeImagesResponseType() = 
        new(nothing, nothing)
end
export DescribeImagesResponseType


type NetworkInterfacePrivateIpAddressesSetType
    item::Union(Array{NetworkInterfacePrivateIpAddressesSetItemType,1}, Nothing)

    NetworkInterfacePrivateIpAddressesSetType(item) = 
         new(item)
    NetworkInterfacePrivateIpAddressesSetType() = 
        new(nothing)
end
export NetworkInterfacePrivateIpAddressesSetType


type DescribeImagesResponseInfoType
    item::Union(Array{DescribeImagesResponseItemType,1}, Nothing)

    DescribeImagesResponseInfoType(item) = 
         new(item)
    DescribeImagesResponseInfoType() = 
        new(nothing)
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

    SecurityGroupItemType(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet) = 
         new(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet)
    SecurityGroupItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export SecurityGroupItemType


type MonitorInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Array{MonitorInstancesResponseSetItemType,1}, Nothing)

    MonitorInstancesResponseType(requestId, instancesSet) = 
         new(requestId, instancesSet)
    MonitorInstancesResponseType() = 
        new(nothing, nothing)
end
export MonitorInstancesResponseType


type DhcpOptionsSetType
    item::Union(Array{DhcpOptionsType,1}, Nothing)

    DhcpOptionsSetType(item) = 
         new(item)
    DhcpOptionsSetType() = 
        new(nothing)
end
export DhcpOptionsSetType


type AuthorizeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Array{IpPermissionType,1}, Nothing)

    AuthorizeSecurityGroupEgressType(groupId, ipPermissions) = 
         new(groupId, ipPermissions)
    AuthorizeSecurityGroupEgressType() = 
        new(nothing, nothing)
end
export AuthorizeSecurityGroupEgressType


type BundleInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    BundleInstanceResponseType(requestId, bundleInstanceTask) = 
         new(requestId, bundleInstanceTask)
    BundleInstanceResponseType() = 
        new(nothing, nothing)
end
export BundleInstanceResponseType


type SubnetSetType
    item::Union(Array{SubnetType,1}, Nothing)

    SubnetSetType(item) = 
         new(item)
    SubnetSetType() = 
        new(nothing)
end
export SubnetSetType


type DescribeNetworkInterfacesResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{NetworkInterfaceType,1}, Nothing)

    DescribeNetworkInterfacesResponseType(requestId, networkInterfaceSet) = 
         new(requestId, networkInterfaceSet)
    DescribeNetworkInterfacesResponseType() = 
        new(nothing, nothing)
end
export DescribeNetworkInterfacesResponseType


type VpnConnectionSetType
    item::Union(Array{VpnConnectionType,1}, Nothing)

    VpnConnectionSetType(item) = 
         new(item)
    VpnConnectionSetType() = 
        new(nothing)
end
export VpnConnectionSetType


type DescribeSubnetsResponseType
    requestId::Union(ASCIIString, Nothing)
    subnetSet::Union(Array{SubnetType,1}, Nothing)

    DescribeSubnetsResponseType(requestId, subnetSet) = 
         new(requestId, subnetSet)
    DescribeSubnetsResponseType() = 
        new(nothing, nothing)
end
export DescribeSubnetsResponseType


type CreateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTable::Union(RouteTableType, Nothing)

    CreateRouteTableResponseType(requestId, routeTable) = 
         new(requestId, routeTable)
    CreateRouteTableResponseType() = 
        new(nothing, nothing)
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

    InstanceNetworkInterfaceSetItemType(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet) = 
         new(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet)
    InstanceNetworkInterfaceSetItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export InstanceNetworkInterfaceSetItemType


type DescribeConversionTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTasks::Union(Array{ConversionTaskType,1}, Nothing)

    DescribeConversionTasksResponseType(requestId, conversionTasks) = 
         new(requestId, conversionTasks)
    DescribeConversionTasksResponseType() = 
        new(nothing, nothing)
end
export DescribeConversionTasksResponseType


type CreateNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterface::Union(NetworkInterfaceType, Nothing)

    CreateNetworkInterfaceResponseType(requestId, networkInterface) = 
         new(requestId, networkInterface)
    CreateNetworkInterfaceResponseType() = 
        new(nothing, nothing)
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

    RunningInstancesItemType(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized) = 
         new(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
    RunningInstancesItemType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
export RunningInstancesItemType


type RunningInstancesSetType
    item::Union(Array{RunningInstancesItemType,1}, Nothing)

    RunningInstancesSetType(item) = 
         new(item)
    RunningInstancesSetType() = 
        new(nothing)
end
export RunningInstancesSetType


type DescribeSecurityGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    securityGroupInfo::Union(Array{SecurityGroupItemType,1}, Nothing)

    DescribeSecurityGroupsResponseType(requestId, securityGroupInfo) = 
         new(requestId, securityGroupInfo)
    DescribeSecurityGroupsResponseType() = 
        new(nothing, nothing)
end
export DescribeSecurityGroupsResponseType


type InstanceNetworkInterfaceSetType
    item::Union(Array{InstanceNetworkInterfaceSetItemType,1}, Nothing)

    InstanceNetworkInterfaceSetType(item) = 
         new(item)
    InstanceNetworkInterfaceSetType() = 
        new(nothing)
end
export InstanceNetworkInterfaceSetType


type NetworkInterfaceSetType
    item::Union(Array{NetworkInterfaceType,1}, Nothing)

    NetworkInterfaceSetType(item) = 
         new(item)
    NetworkInterfaceSetType() = 
        new(nothing)
end
export NetworkInterfaceSetType


type SecurityGroupSetType
    item::Union(Array{SecurityGroupItemType,1}, Nothing)

    SecurityGroupSetType(item) = 
         new(item)
    SecurityGroupSetType() = 
        new(nothing)
end
export SecurityGroupSetType


type ReservationInfoType
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    instancesSet::Union(Array{RunningInstancesItemType,1}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    ReservationInfoType(reservationId, ownerId, groupSet, instancesSet, requesterId) = 
         new(reservationId, ownerId, groupSet, instancesSet, requesterId)
    ReservationInfoType() = 
        new(nothing, nothing, nothing, nothing, nothing)
end
export ReservationInfoType


type RunInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    instancesSet::Union(Array{RunningInstancesItemType,1}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    RunInstancesResponseType(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId) = 
         new(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId)
    RunInstancesResponseType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing)
end
export RunInstancesResponseType


type ReservationSetType
    item::Union(Array{ReservationInfoType,1}, Nothing)

    ReservationSetType(item) = 
         new(item)
    ReservationSetType() = 
        new(nothing)
end
export ReservationSetType


type DescribeInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationSet::Union(Array{ReservationInfoType,1}, Nothing)

    DescribeInstancesResponseType(requestId, reservationSet) = 
         new(requestId, reservationSet)
    DescribeInstancesResponseType() = 
        new(nothing, nothing)
end
export DescribeInstancesResponseType


