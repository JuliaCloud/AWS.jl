type CreateImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CreateImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
function CreateImageResponseType(pd::ETree)
    o = CreateImageResponseType()
    o.requestId = find(pd, "requestId#string")
    o.imageId = find(pd, "imageId#string")
    o
end

export CreateImageResponseType


type RegisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    RegisterImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
function RegisterImageResponseType(pd::ETree)
    o = RegisterImageResponseType()
    o.requestId = find(pd, "requestId#string")
    o.imageId = find(pd, "imageId#string")
    o
end

export RegisterImageResponseType


type DeregisterImageType
    imageId::Union(ASCIIString, Nothing)

    DeregisterImageType(; imageId=nothing) = 
         new(imageId)
end
function DeregisterImageType(pd::ETree)
    o = DeregisterImageType()
    o.imageId = find(pd, "imageId#string")
    o
end

export DeregisterImageType


type DeregisterImageResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeregisterImageResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeregisterImageResponseType(pd::ETree)
    o = DeregisterImageResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeregisterImageResponseType


type CreateKeyPairType
    keyName::Union(ASCIIString, Nothing)

    CreateKeyPairType(; keyName=nothing) = 
         new(keyName)
end
function CreateKeyPairType(pd::ETree)
    o = CreateKeyPairType()
    o.keyName = find(pd, "keyName#string")
    o
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
function CreateKeyPairResponseType(pd::ETree)
    o = CreateKeyPairResponseType()
    o.requestId = find(pd, "requestId#string")
    o.keyName = find(pd, "keyName#string")
    o.keyFingerprint = find(pd, "keyFingerprint#string")
    o.keyMaterial = find(pd, "keyMaterial#string")
    o
end

export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::Union(ASCIIString, Nothing)
    publicKeyMaterial::Union(ASCIIString, Nothing)

    ImportKeyPairType(; keyName=nothing, publicKeyMaterial=nothing) = 
         new(keyName, publicKeyMaterial)
end
function ImportKeyPairType(pd::ETree)
    o = ImportKeyPairType()
    o.keyName = find(pd, "keyName#string")
    o.publicKeyMaterial = find(pd, "publicKeyMaterial#string")
    o
end

export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    ImportKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing) = 
         new(requestId, keyName, keyFingerprint)
end
function ImportKeyPairResponseType(pd::ETree)
    o = ImportKeyPairResponseType()
    o.requestId = find(pd, "requestId#string")
    o.keyName = find(pd, "keyName#string")
    o.keyFingerprint = find(pd, "keyFingerprint#string")
    o
end

export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::Union(ASCIIString, Nothing)

    DeleteKeyPairType(; keyName=nothing) = 
         new(keyName)
end
function DeleteKeyPairType(pd::ETree)
    o = DeleteKeyPairType()
    o.keyName = find(pd, "keyName#string")
    o
end

export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteKeyPairResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteKeyPairResponseType(pd::ETree)
    o = DeleteKeyPairResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::Union(ASCIIString, Nothing)

    DescribeKeyPairsItemType(; keyName=nothing) = 
         new(keyName)
end
function DescribeKeyPairsItemType(pd::ETree)
    o = DescribeKeyPairsItemType()
    o.keyName = find(pd, "keyName#string")
    o
end

export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::Union(ASCIIString, Nothing)
    keyFingerprint::Union(ASCIIString, Nothing)

    DescribeKeyPairsResponseItemType(; keyName=nothing, keyFingerprint=nothing) = 
         new(keyName, keyFingerprint)
end
function DescribeKeyPairsResponseItemType(pd::ETree)
    o = DescribeKeyPairsResponseItemType()
    o.keyName = find(pd, "keyName#string")
    o.keyFingerprint = find(pd, "keyFingerprint#string")
    o
end

export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)

    IamInstanceProfileRequestType(; arn=nothing, name=nothing) = 
         new(arn, name)
end
function IamInstanceProfileRequestType(pd::ETree)
    o = IamInstanceProfileRequestType()
    o.arn = find(pd, "arn#string")
    o.name = find(pd, "name#string")
    o
end

export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)

    PrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing, primary=nothing) = 
         new(privateIpAddress, primary)
end
function PrivateIpAddressesSetItemRequestType(pd::ETree)
    o = PrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.primary = AWS.safe_parse_as(Bool, find(pd, "primary#string"))
    o
end

export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    ImportInstanceGroupItemType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
function ImportInstanceGroupItemType(pd::ETree)
    o = ImportInstanceGroupItemType()
    o.groupId = find(pd, "groupId#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    GroupItemType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
function GroupItemType(pd::ETree)
    o = GroupItemType()
    o.groupId = find(pd, "groupId#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export GroupItemType


type UserDataType
    data::Union(ASCIIString, Nothing)

    UserDataType(; data=nothing) = 
         new(data)
end
function UserDataType(pd::ETree)
    o = UserDataType()
    o.data = find(pd, "data#string")
    o
end

export UserDataType


type BlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    BlockDeviceMappingItemType(; deviceName=nothing) = 
         new(deviceName)
end
function BlockDeviceMappingItemType(pd::ETree)
    o = BlockDeviceMappingItemType()
    o.deviceName = find(pd, "deviceName#string")
    o
end

export BlockDeviceMappingItemType


type EbsBlockDeviceType
    snapshotId::Union(ASCIIString, Nothing)
    volumeSize::Union(Int64, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int64, Nothing)

    EbsBlockDeviceType(; snapshotId=nothing, volumeSize=nothing, deleteOnTermination=nothing, volumeType=nothing, iops=nothing) = 
         new(snapshotId, volumeSize, deleteOnTermination, volumeType, iops)
end
function EbsBlockDeviceType(pd::ETree)
    o = EbsBlockDeviceType()
    o.snapshotId = find(pd, "snapshotId#string")
    o.volumeSize = AWS.safe_parse_as(Int64, find(pd, "volumeSize#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o.volumeType = find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, find(pd, "iops#string"))
    o
end

export EbsBlockDeviceType


type PlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementRequestType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) = 
         new(availabilityZone, groupName, tenancy)
end
function PlacementRequestType(pd::ETree)
    o = PlacementRequestType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.groupName = find(pd, "groupName#string")
    o.tenancy = find(pd, "tenancy#string")
    o
end

export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    SpotPlacementRequestType(; availabilityZone=nothing, groupName=nothing) = 
         new(availabilityZone, groupName)
end
function SpotPlacementRequestType(pd::ETree)
    o = SpotPlacementRequestType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    InstancePlacementType(; availabilityZone=nothing, groupName=nothing) = 
         new(availabilityZone, groupName)
end
function InstancePlacementType(pd::ETree)
    o = InstancePlacementType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export InstancePlacementType


type MonitoringInstanceType
    enabled::Union(Bool, Nothing)

    MonitoringInstanceType(; enabled=nothing) = 
         new(enabled)
end
function MonitoringInstanceType(pd::ETree)
    o = MonitoringInstanceType()
    o.enabled = AWS.safe_parse_as(Bool, find(pd, "enabled#string"))
    o
end

export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseRequestType(; pool=nothing) = 
         new(pool)
end
function InstanceLicenseRequestType(pd::ETree)
    o = InstanceLicenseRequestType()
    o.pool = find(pd, "pool#string")
    o
end

export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::Union(ASCIIString, Nothing)
    id::Union(ASCIIString, Nothing)

    IamInstanceProfileResponseType(; arn=nothing, id=nothing) = 
         new(arn, id)
end
function IamInstanceProfileResponseType(pd::ETree)
    o = IamInstanceProfileResponseType()
    o.arn = find(pd, "arn#string")
    o.id = find(pd, "id#string")
    o
end

export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int64, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceNetworkInterfaceAttachmentType(; attachmentId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end
function InstanceNetworkInterfaceAttachmentType(pd::ETree)
    o = InstanceNetworkInterfaceAttachmentType()
    o.attachmentId = find(pd, "attachmentId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, find(pd, "deviceIndex#string"))
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
end

export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::Union(ASCIIString, Nothing)
    publicDnsName::Union(ASCIIString, Nothing)
    ipOwnerId::Union(ASCIIString, Nothing)

    InstanceNetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing) = 
         new(publicIp, publicDnsName, ipOwnerId)
end
function InstanceNetworkInterfaceAssociationType(pd::ETree)
    o = InstanceNetworkInterfaceAssociationType()
    o.publicIp = find(pd, "publicIp#string")
    o.publicDnsName = find(pd, "publicDnsName#string")
    o.ipOwnerId = find(pd, "ipOwnerId#string")
    o
end

export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    tenancy::Union(ASCIIString, Nothing)

    PlacementResponseType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) = 
         new(availabilityZone, groupName, tenancy)
end
function PlacementResponseType(pd::ETree)
    o = PlacementResponseType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.groupName = find(pd, "groupName#string")
    o.tenancy = find(pd, "tenancy#string")
    o
end

export PlacementResponseType


type StateReasonType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    StateReasonType(; code=nothing, message=nothing) = 
         new(code, message)
end
function StateReasonType(pd::ETree)
    o = StateReasonType()
    o.code = find(pd, "code#string")
    o.message = find(pd, "message#string")
    o
end

export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingResponseItemType(; deviceName=nothing) = 
         new(deviceName)
end
function InstanceBlockDeviceMappingResponseItemType(pd::ETree)
    o = InstanceBlockDeviceMappingResponseItemType()
    o.deviceName = find(pd, "deviceName#string")
    o
end

export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    EbsInstanceBlockDeviceMappingResponseType(; volumeId=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(volumeId, status, attachTime, deleteOnTermination)
end
function EbsInstanceBlockDeviceMappingResponseType(pd::ETree)
    o = EbsInstanceBlockDeviceMappingResponseType()
    o.volumeId = find(pd, "volumeId#string")
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
end

export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::Union(ASCIIString, Nothing)

    InstanceLicenseResponseType(; pool=nothing) = 
         new(pool)
end
function InstanceLicenseResponseType(pd::ETree)
    o = InstanceLicenseResponseType()
    o.pool = find(pd, "pool#string")
    o
end

export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::Union(ASCIIString, Nothing)

    AccountAttributeNameSetItemType(; attributeName=nothing) = 
         new(attributeName)
end
function AccountAttributeNameSetItemType(pd::ETree)
    o = AccountAttributeNameSetItemType()
    o.attributeName = find(pd, "attributeName#string")
    o
end

export AccountAttributeNameSetItemType


type AccountAttributeSetItemType
    attributeName::Union(ASCIIString, Nothing)
    attributeValueSet::Union(Vector{ASCIIString}, Nothing)

    AccountAttributeSetItemType(; attributeName=nothing, attributeValueSet=nothing) = 
         new(attributeName, attributeValueSet)
end
function AccountAttributeSetItemType(pd::ETree)
    o = AccountAttributeSetItemType()
    o.attributeName = find(pd, "attributeName#string")
    o.attributeValueSet = AWS.parse_vector_as(ASCIIString, "attributeValue", find(pd, "item/attributeValue"))
    o
end

export AccountAttributeSetItemType


type AccountAttributeValueSetItemType
    attributeValue::Union(ASCIIString, Nothing)

    AccountAttributeValueSetItemType(; attributeValue=nothing) = 
         new(attributeValue)
end
function AccountAttributeValueSetItemType(pd::ETree)
    o = AccountAttributeValueSetItemType()
    o.attributeValue = find(pd, "attributeValue#string")
    o
end

export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeType(; vpcId=nothing) = 
         new(vpcId)
end
function DescribeVpcAttributeType(pd::ETree)
    o = DescribeVpcAttributeType()
    o.vpcId = find(pd, "vpcId#string")
    o
end

export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DescribeVpcAttributeResponseType(; requestId=nothing, vpcId=nothing) = 
         new(requestId, vpcId)
end
function DescribeVpcAttributeResponseType(pd::ETree)
    o = DescribeVpcAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::Union(ASCIIString, Nothing)

    ModifyVpcAttributeType(; vpcId=nothing) = 
         new(vpcId)
end
function ModifyVpcAttributeType(pd::ETree)
    o = ModifyVpcAttributeType()
    o.vpcId = find(pd, "vpcId#string")
    o
end

export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVpcAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifyVpcAttributeResponseType(pd::ETree)
    o = ModifyVpcAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifyVpcAttributeResponseType


type GetConsoleOutputType
    instanceId::Union(ASCIIString, Nothing)

    GetConsoleOutputType(; instanceId=nothing) = 
         new(instanceId)
end
function GetConsoleOutputType(pd::ETree)
    o = GetConsoleOutputType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(CalendarTime, Nothing)
    output::Union(ASCIIString, Nothing)

    GetConsoleOutputResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, output=nothing) = 
         new(requestId, instanceId, timestamp, output)
end
function GetConsoleOutputResponseType(pd::ETree)
    o = GetConsoleOutputResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.timestamp = AWS.safe_parse_as(CalendarTime, find(pd, "timestamp#string"))
    o.output = find(pd, "output#string")
    o
end

export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::Union(ASCIIString, Nothing)

    GetPasswordDataType(; instanceId=nothing) = 
         new(instanceId)
end
function GetPasswordDataType(pd::ETree)
    o = GetPasswordDataType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    timestamp::Union(CalendarTime, Nothing)
    passwordData::Union(ASCIIString, Nothing)

    GetPasswordDataResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, passwordData=nothing) = 
         new(requestId, instanceId, timestamp, passwordData)
end
function GetPasswordDataResponseType(pd::ETree)
    o = GetPasswordDataResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.timestamp = AWS.safe_parse_as(CalendarTime, find(pd, "timestamp#string"))
    o.passwordData = find(pd, "passwordData#string")
    o
end

export GetPasswordDataResponseType


type InstanceIdType
    instanceId::Union(ASCIIString, Nothing)

    InstanceIdType(; instanceId=nothing) = 
         new(instanceId)
end
function InstanceIdType(pd::ETree)
    o = InstanceIdType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export InstanceIdType


type TerminateInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)

    TerminateInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
function TerminateInstancesType(pd::ETree)
    o = TerminateInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o
end

export TerminateInstancesType


type InstanceBlockDeviceMappingItemType
    deviceName::Union(ASCIIString, Nothing)

    InstanceBlockDeviceMappingItemType(; deviceName=nothing) = 
         new(deviceName)
end
function InstanceBlockDeviceMappingItemType(pd::ETree)
    o = InstanceBlockDeviceMappingItemType()
    o.deviceName = find(pd, "deviceName#string")
    o
end

export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    InstanceEbsBlockDeviceType(; volumeId=nothing, deleteOnTermination=nothing) = 
         new(volumeId, deleteOnTermination)
end
function InstanceEbsBlockDeviceType(pd::ETree)
    o = InstanceEbsBlockDeviceType()
    o.volumeId = find(pd, "volumeId#string")
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
end

export InstanceEbsBlockDeviceType


type StopInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)
    force::Union(Bool, Nothing)

    StopInstancesType(; instancesSet=nothing, force=nothing) = 
         new(instancesSet, force)
end
function StopInstancesType(pd::ETree)
    o = StopInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o.force = AWS.safe_parse_as(Bool, find(pd, "force#string"))
    o
end

export StopInstancesType


type StartInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)

    StartInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
function StartInstancesType(pd::ETree)
    o = StartInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o
end

export StartInstancesType


type RebootInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)

    RebootInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
function RebootInstancesType(pd::ETree)
    o = RebootInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o
end

export RebootInstancesType


type RebootInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    RebootInstancesItemType(; instanceId=nothing) = 
         new(instanceId)
end
function RebootInstancesItemType(pd::ETree)
    o = RebootInstancesItemType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RebootInstancesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function RebootInstancesResponseType(pd::ETree)
    o = RebootInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstancesItemType(; instanceId=nothing) = 
         new(instanceId)
end
function DescribeInstancesItemType(pd::ETree)
    o = DescribeInstancesItemType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::Union(ASCIIString, Nothing)

    UnavailableResultType(; availabilityZone=nothing) = 
         new(availabilityZone)
end
function UnavailableResultType(pd::ETree)
    o = UnavailableResultType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o
end

export UnavailableResultType


type DescribeImagesItemType
    imageId::Union(ASCIIString, Nothing)

    DescribeImagesItemType(; imageId=nothing) = 
         new(imageId)
end
function DescribeImagesItemType(pd::ETree)
    o = DescribeImagesItemType()
    o.imageId = find(pd, "imageId#string")
    o
end

export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeImagesOwnerType(; owner=nothing) = 
         new(owner)
end
function DescribeImagesOwnerType(pd::ETree)
    o = DescribeImagesOwnerType()
    o.owner = find(pd, "owner#string")
    o
end

export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::Union(ASCIIString, Nothing)

    DescribeImagesExecutableByType(; user=nothing) = 
         new(user)
end
function DescribeImagesExecutableByType(pd::ETree)
    o = DescribeImagesExecutableByType()
    o.user = find(pd, "user#string")
    o
end

export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::Union(ASCIIString, Nothing)
    groupDescription::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    CreateSecurityGroupType(; groupName=nothing, groupDescription=nothing, vpcId=nothing) = 
         new(groupName, groupDescription, vpcId)
end
function CreateSecurityGroupType(pd::ETree)
    o = CreateSecurityGroupType()
    o.groupName = find(pd, "groupName#string")
    o.groupDescription = find(pd, "groupDescription#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    groupId::Union(ASCIIString, Nothing)

    CreateSecurityGroupResponseType(; requestId=nothing, _return=nothing, groupId=nothing) = 
         new(requestId, _return, groupId)
end
function CreateSecurityGroupResponseType(pd::ETree)
    o = CreateSecurityGroupResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o.groupId = find(pd, "groupId#string")
    o
end

export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    DeleteSecurityGroupType(; groupId=nothing, groupName=nothing) = 
         new(groupId, groupName)
end
function DeleteSecurityGroupType(pd::ETree)
    o = DeleteSecurityGroupType()
    o.groupId = find(pd, "groupId#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSecurityGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteSecurityGroupResponseType(pd::ETree)
    o = DeleteSecurityGroupResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsSetItemType(; groupName=nothing) = 
         new(groupName)
end
function DescribeSecurityGroupsSetItemType(pd::ETree)
    o = DescribeSecurityGroupsSetItemType()
    o.groupName = find(pd, "groupName#string")
    o
end

export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    DescribeSecurityGroupsIdSetItemType(; groupId=nothing) = 
         new(groupId)
end
function DescribeSecurityGroupsIdSetItemType(pd::ETree)
    o = DescribeSecurityGroupsIdSetItemType()
    o.groupId = find(pd, "groupId#string")
    o
end

export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::Union(ASCIIString, Nothing)

    IpRangeItemType(; cidrIp=nothing) = 
         new(cidrIp)
end
function IpRangeItemType(pd::ETree)
    o = IpRangeItemType()
    o.cidrIp = find(pd, "cidrIp#string")
    o
end

export IpRangeItemType


type UserIdGroupPairType
    userId::Union(ASCIIString, Nothing)
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)

    UserIdGroupPairType(; userId=nothing, groupId=nothing, groupName=nothing) = 
         new(userId, groupId, groupName)
end
function UserIdGroupPairType(pd::ETree)
    o = UserIdGroupPairType()
    o.userId = find(pd, "userId#string")
    o.groupId = find(pd, "groupId#string")
    o.groupName = find(pd, "groupName#string")
    o
end

export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function AuthorizeSecurityGroupIngressResponseType(pd::ETree)
    o = AuthorizeSecurityGroupIngressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function RevokeSecurityGroupIngressResponseType(pd::ETree)
    o = RevokeSecurityGroupIngressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AuthorizeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function AuthorizeSecurityGroupEgressResponseType(pd::ETree)
    o = AuthorizeSecurityGroupEgressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    RevokeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function RevokeSecurityGroupEgressResponseType(pd::ETree)
    o = RevokeSecurityGroupEgressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Union(Int64, Nothing)
    name::Union(ASCIIString, Nothing)

    InstanceStateType(; code=nothing, name=nothing) = 
         new(code, name)
end
function InstanceStateType(pd::ETree)
    o = InstanceStateType()
    o.code = AWS.safe_parse_as(Int64, find(pd, "code#string"))
    o.name = find(pd, "name#string")
    o
end

export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ModifyInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
function ModifyInstanceAttributeType(pd::ETree)
    o = ModifyInstanceAttributeType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::Union(ASCIIString, Nothing)

    SecurityGroupIdSetItemType(; groupId=nothing) = 
         new(groupId)
end
function SecurityGroupIdSetItemType(pd::ETree)
    o = SecurityGroupIdSetItemType()
    o.groupId = find(pd, "groupId#string")
    o
end

export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyInstanceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifyInstanceAttributeResponseType(pd::ETree)
    o = ModifyInstanceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    ResetInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
function ResetInstanceAttributeType(pd::ETree)
    o = ResetInstanceAttributeType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetInstanceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ResetInstanceAttributeResponseType(pd::ETree)
    o = ResetInstanceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeType(; instanceId=nothing) = 
         new(instanceId)
end
function DescribeInstanceAttributeType(pd::ETree)
    o = DescribeInstanceAttributeType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    DescribeInstanceAttributeResponseType(; requestId=nothing, instanceId=nothing) = 
         new(requestId, instanceId)
end
function DescribeInstanceAttributeResponseType(pd::ETree)
    o = DescribeInstanceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instanceId = find(pd, "instanceId#string")
    o
end

export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ModifyImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
function ModifyImageAttributeType(pd::ETree)
    o = ModifyImageAttributeType()
    o.imageId = find(pd, "imageId#string")
    o
end

export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    LaunchPermissionItemType(; userId=nothing, group=nothing) = 
         new(userId, group)
end
function LaunchPermissionItemType(pd::ETree)
    o = LaunchPermissionItemType()
    o.userId = find(pd, "userId#string")
    o.group = find(pd, "group#string")
    o
end

export LaunchPermissionItemType


type ProductCodeItemType
    productCode::Union(ASCIIString, Nothing)

    ProductCodeItemType(; productCode=nothing) = 
         new(productCode)
end
function ProductCodeItemType(pd::ETree)
    o = ProductCodeItemType()
    o.productCode = find(pd, "productCode#string")
    o
end

export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyImageAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifyImageAttributeResponseType(pd::ETree)
    o = ModifyImageAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    ResetImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
function ResetImageAttributeType(pd::ETree)
    o = ResetImageAttributeType()
    o.imageId = find(pd, "imageId#string")
    o
end

export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetImageAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ResetImageAttributeResponseType(pd::ETree)
    o = ResetImageAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeType(; imageId=nothing) = 
         new(imageId)
end
function DescribeImageAttributeType(pd::ETree)
    o = DescribeImageAttributeType()
    o.imageId = find(pd, "imageId#string")
    o
end

export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    DescribeImageAttributeResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
function DescribeImageAttributeResponseType(pd::ETree)
    o = DescribeImageAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.imageId = find(pd, "imageId#string")
    o
end

export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union(ASCIIString, Nothing)

    NullableAttributeValueType(; value=nothing) = 
         new(value)
end
function NullableAttributeValueType(pd::ETree)
    o = NullableAttributeValueType()
    o.value = find(pd, "value#string")
    o
end

export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union(Bool, Nothing)

    NullableAttributeBooleanValueType(; value=nothing) = 
         new(value)
end
function NullableAttributeBooleanValueType(pd::ETree)
    o = NullableAttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, find(pd, "value#string"))
    o
end

export NullableAttributeBooleanValueType


type AttributeValueType
    value::Union(ASCIIString, Nothing)

    AttributeValueType(; value=nothing) = 
         new(value)
end
function AttributeValueType(pd::ETree)
    o = AttributeValueType()
    o.value = find(pd, "value#string")
    o
end

export AttributeValueType


type AttributeBooleanValueType
    value::Union(Bool, Nothing)

    AttributeBooleanValueType(; value=nothing) = 
         new(value)
end
function AttributeBooleanValueType(pd::ETree)
    o = AttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, find(pd, "value#string"))
    o
end

export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceType(; productCode=nothing, instanceId=nothing) = 
         new(productCode, instanceId)
end
function ConfirmProductInstanceType(pd::ETree)
    o = ConfirmProductInstanceType()
    o.productCode = find(pd, "productCode#string")
    o.instanceId = find(pd, "instanceId#string")
    o
end

export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)

    ProductCodesSetItemType(; productCode=nothing, _type=nothing) = 
         new(productCode, _type)
end
function ProductCodesSetItemType(pd::ETree)
    o = ProductCodesSetItemType()
    o.productCode = find(pd, "productCode#string")
    o._type = find(pd, "type#string")
    o
end

export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    ownerId::Union(ASCIIString, Nothing)

    ConfirmProductInstanceResponseType(; requestId=nothing, _return=nothing, ownerId=nothing) = 
         new(requestId, _return, ownerId)
end
function ConfirmProductInstanceResponseType(pd::ETree)
    o = ConfirmProductInstanceResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o.ownerId = find(pd, "ownerId#string")
    o
end

export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::Union(ASCIIString, Nothing)

    DescribeAvailabilityZonesSetItemType(; zoneName=nothing) = 
         new(zoneName)
end
function DescribeAvailabilityZonesSetItemType(pd::ETree)
    o = DescribeAvailabilityZonesSetItemType()
    o.zoneName = find(pd, "zoneName#string")
    o
end

export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::Union(ASCIIString, Nothing)

    AvailabilityZoneMessageType(; message=nothing) = 
         new(message)
end
function AvailabilityZoneMessageType(pd::ETree)
    o = AvailabilityZoneMessageType()
    o.message = find(pd, "message#string")
    o
end

export AvailabilityZoneMessageType


type AvailabilityZoneItemType
    zoneName::Union(ASCIIString, Nothing)
    zoneState::Union(ASCIIString, Nothing)
    regionName::Union(ASCIIString, Nothing)
    messageSet::Union(Vector{ASCIIString}, Nothing)

    AvailabilityZoneItemType(; zoneName=nothing, zoneState=nothing, regionName=nothing, messageSet=nothing) = 
         new(zoneName, zoneState, regionName, messageSet)
end
function AvailabilityZoneItemType(pd::ETree)
    o = AvailabilityZoneItemType()
    o.zoneName = find(pd, "zoneName#string")
    o.zoneState = find(pd, "zoneState#string")
    o.regionName = find(pd, "regionName#string")
    o.messageSet = AWS.parse_vector_as(ASCIIString, "message", find(pd, "item/message"))
    o
end

export AvailabilityZoneItemType


type AllocateAddressType
    domain::Union(ASCIIString, Nothing)

    AllocateAddressType(; domain=nothing) = 
         new(domain)
end
function AllocateAddressType(pd::ETree)
    o = AllocateAddressType()
    o.domain = find(pd, "domain#string")
    o
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
function AllocateAddressResponseType(pd::ETree)
    o = AllocateAddressResponseType()
    o.requestId = find(pd, "requestId#string")
    o.publicIp = find(pd, "publicIp#string")
    o.domain = find(pd, "domain#string")
    o.allocationId = find(pd, "allocationId#string")
    o
end

export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union(ASCIIString, Nothing)
    allocationId::Union(ASCIIString, Nothing)

    ReleaseAddressType(; publicIp=nothing, allocationId=nothing) = 
         new(publicIp, allocationId)
end
function ReleaseAddressType(pd::ETree)
    o = ReleaseAddressType()
    o.publicIp = find(pd, "publicIp#string")
    o.allocationId = find(pd, "allocationId#string")
    o
end

export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReleaseAddressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ReleaseAddressResponseType(pd::ETree)
    o = ReleaseAddressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::Union(ASCIIString, Nothing)

    AllocationIdSetItemType(; allocationId=nothing) = 
         new(allocationId)
end
function AllocationIdSetItemType(pd::ETree)
    o = AllocationIdSetItemType()
    o.allocationId = find(pd, "allocationId#string")
    o
end

export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::Union(ASCIIString, Nothing)

    DescribeAddressesItemType(; publicIp=nothing) = 
         new(publicIp)
end
function DescribeAddressesItemType(pd::ETree)
    o = DescribeAddressesItemType()
    o.publicIp = find(pd, "publicIp#string")
    o
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
function DescribeAddressesResponseItemType(pd::ETree)
    o = DescribeAddressesResponseItemType()
    o.publicIp = find(pd, "publicIp#string")
    o.allocationId = find(pd, "allocationId#string")
    o.domain = find(pd, "domain#string")
    o.instanceId = find(pd, "instanceId#string")
    o.associationId = find(pd, "associationId#string")
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.networkInterfaceOwnerId = find(pd, "networkInterfaceOwnerId#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o
end

export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union(ASCIIString, Nothing)
    allowReassociation::Union(Bool, Nothing)

    AssociateAddressType(; privateIpAddress=nothing, allowReassociation=nothing) = 
         new(privateIpAddress, allowReassociation)
end
function AssociateAddressType(pd::ETree)
    o = AssociateAddressType()
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.allowReassociation = AWS.safe_parse_as(Bool, find(pd, "allowReassociation#string"))
    o
end

export AssociateAddressType


type AssociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateAddressResponseType(; requestId=nothing, _return=nothing, associationId=nothing) = 
         new(requestId, _return, associationId)
end
function AssociateAddressResponseType(pd::ETree)
    o = AssociateAddressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o.associationId = find(pd, "associationId#string")
    o
end

export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    DisassociateAddressType(; publicIp=nothing, associationId=nothing) = 
         new(publicIp, associationId)
end
function DisassociateAddressType(pd::ETree)
    o = DisassociateAddressType()
    o.publicIp = find(pd, "publicIp#string")
    o.associationId = find(pd, "associationId#string")
    o
end

export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateAddressResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DisassociateAddressResponseType(pd::ETree)
    o = DisassociateAddressResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DisassociateAddressResponseType


type CreateVolumeType
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int64, Nothing)

    CreateVolumeType(; size=nothing, snapshotId=nothing, availabilityZone=nothing, volumeType=nothing, iops=nothing) = 
         new(size, snapshotId, availabilityZone, volumeType, iops)
end
function CreateVolumeType(pd::ETree)
    o = CreateVolumeType()
    o.size = find(pd, "size#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.volumeType = find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, find(pd, "iops#string"))
    o
end

export CreateVolumeType


type CreateVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    createTime::Union(CalendarTime, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int64, Nothing)

    CreateVolumeResponseType(; requestId=nothing, volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, volumeType=nothing, iops=nothing) = 
         new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops)
end
function CreateVolumeResponseType(pd::ETree)
    o = CreateVolumeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeId = find(pd, "volumeId#string")
    o.size = find(pd, "size#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.status = find(pd, "status#string")
    o.createTime = AWS.safe_parse_as(CalendarTime, find(pd, "createTime#string"))
    o.volumeType = find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, find(pd, "iops#string"))
    o
end

export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::Union(ASCIIString, Nothing)

    DeleteVolumeType(; volumeId=nothing) = 
         new(volumeId)
end
function DeleteVolumeType(pd::ETree)
    o = DeleteVolumeType()
    o.volumeId = find(pd, "volumeId#string")
    o
end

export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVolumeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteVolumeResponseType(pd::ETree)
    o = DeleteVolumeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumesSetItemType(; volumeId=nothing) = 
         new(volumeId)
end
function DescribeVolumesSetItemType(pd::ETree)
    o = DescribeVolumesSetItemType()
    o.volumeId = find(pd, "volumeId#string")
    o
end

export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    AttachmentSetItemResponseType(; volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end
function AttachmentSetItemResponseType(pd::ETree)
    o = AttachmentSetItemResponseType()
    o.volumeId = find(pd, "volumeId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.device = find(pd, "device#string")
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
end

export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)

    AttachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing) = 
         new(volumeId, instanceId, device)
end
function AttachVolumeType(pd::ETree)
    o = AttachVolumeType()
    o.volumeId = find(pd, "volumeId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.device = find(pd, "device#string")
    o
end

export AttachVolumeType


type AttachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)

    AttachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function AttachVolumeResponseType(pd::ETree)
    o = AttachVolumeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeId = find(pd, "volumeId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.device = find(pd, "device#string")
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o
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
function DetachVolumeType(pd::ETree)
    o = DetachVolumeType()
    o.volumeId = find(pd, "volumeId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.device = find(pd, "device#string")
    o.force = AWS.safe_parse_as(Bool, find(pd, "force#string"))
    o
end

export DetachVolumeType


type DetachVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    device::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)

    DetachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) = 
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function DetachVolumeResponseType(pd::ETree)
    o = DetachVolumeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeId = find(pd, "volumeId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.device = find(pd, "device#string")
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o
end

export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CreateSnapshotType(; volumeId=nothing, description=nothing) = 
         new(volumeId, description)
end
function CreateSnapshotType(pd::ETree)
    o = CreateSnapshotType()
    o.volumeId = find(pd, "volumeId#string")
    o.description = find(pd, "description#string")
    o
end

export CreateSnapshotType


type CreateSnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(CalendarTime, Nothing)
    progress::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    volumeSize::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CreateSnapshotResponseType(; requestId=nothing, snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing) = 
         new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description)
end
function CreateSnapshotResponseType(pd::ETree)
    o = CreateSnapshotResponseType()
    o.requestId = find(pd, "requestId#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o.volumeId = find(pd, "volumeId#string")
    o.status = find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(CalendarTime, find(pd, "startTime#string"))
    o.progress = find(pd, "progress#string")
    o.ownerId = find(pd, "ownerId#string")
    o.volumeSize = find(pd, "volumeSize#string")
    o.description = find(pd, "description#string")
    o
end

export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::Union(ASCIIString, Nothing)
    sourceSnapshotId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    CopySnapshotType(; sourceRegion=nothing, sourceSnapshotId=nothing, description=nothing) = 
         new(sourceRegion, sourceSnapshotId, description)
end
function CopySnapshotType(pd::ETree)
    o = CopySnapshotType()
    o.sourceRegion = find(pd, "sourceRegion#string")
    o.sourceSnapshotId = find(pd, "sourceSnapshotId#string")
    o.description = find(pd, "description#string")
    o
end

export CopySnapshotType


type CopySnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    CopySnapshotResponseType(; requestId=nothing, snapshotId=nothing) = 
         new(requestId, snapshotId)
end
function CopySnapshotResponseType(pd::ETree)
    o = CopySnapshotResponseType()
    o.requestId = find(pd, "requestId#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o
end

export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::Union(ASCIIString, Nothing)

    DeleteSnapshotType(; snapshotId=nothing) = 
         new(snapshotId)
end
function DeleteSnapshotType(pd::ETree)
    o = DeleteSnapshotType()
    o.snapshotId = find(pd, "snapshotId#string")
    o
end

export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSnapshotResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteSnapshotResponseType(pd::ETree)
    o = DeleteSnapshotResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotsSetItemType(; snapshotId=nothing) = 
         new(snapshotId)
end
function DescribeSnapshotsSetItemType(pd::ETree)
    o = DescribeSnapshotsSetItemType()
    o.snapshotId = find(pd, "snapshotId#string")
    o
end

export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::Union(ASCIIString, Nothing)

    DescribeSnapshotsOwnerType(; owner=nothing) = 
         new(owner)
end
function DescribeSnapshotsOwnerType(pd::ETree)
    o = DescribeSnapshotsOwnerType()
    o.owner = find(pd, "owner#string")
    o
end

export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::Union(ASCIIString, Nothing)

    DescribeSnapshotsRestorableByType(; user=nothing) = 
         new(user)
end
function DescribeSnapshotsRestorableByType(pd::ETree)
    o = DescribeSnapshotsRestorableByType()
    o.user = find(pd, "user#string")
    o
end

export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union(ASCIIString, Nothing)
    group::Union(ASCIIString, Nothing)

    CreateVolumePermissionItemType(; userId=nothing, group=nothing) = 
         new(userId, group)
end
function CreateVolumePermissionItemType(pd::ETree)
    o = CreateVolumePermissionItemType()
    o.userId = find(pd, "userId#string")
    o.group = find(pd, "group#string")
    o
end

export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifySnapshotAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifySnapshotAttributeResponseType(pd::ETree)
    o = ModifySnapshotAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    ResetSnapshotAttributeType(; snapshotId=nothing) = 
         new(snapshotId)
end
function ResetSnapshotAttributeType(pd::ETree)
    o = ResetSnapshotAttributeType()
    o.snapshotId = find(pd, "snapshotId#string")
    o
end

export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetSnapshotAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ResetSnapshotAttributeResponseType(pd::ETree)
    o = ResetSnapshotAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeType(; snapshotId=nothing) = 
         new(snapshotId)
end
function DescribeSnapshotAttributeType(pd::ETree)
    o = DescribeSnapshotAttributeType()
    o.snapshotId = find(pd, "snapshotId#string")
    o
end

export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)

    DescribeSnapshotAttributeResponseType(; requestId=nothing, snapshotId=nothing) = 
         new(requestId, snapshotId)
end
function DescribeSnapshotAttributeResponseType(pd::ETree)
    o = DescribeSnapshotAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o
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
function BundleInstanceS3StorageType(pd::ETree)
    o = BundleInstanceS3StorageType()
    o.bucket = find(pd, "bucket#string")
    o.prefix = find(pd, "prefix#string")
    o.awsAccessKeyId = find(pd, "awsAccessKeyId#string")
    o.uploadPolicy = find(pd, "uploadPolicy#string")
    o.uploadPolicySignature = find(pd, "uploadPolicySignature#string")
    o
end

export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    BundleInstanceTaskErrorType(; code=nothing, message=nothing) = 
         new(code, message)
end
function BundleInstanceTaskErrorType(pd::ETree)
    o = BundleInstanceTaskErrorType()
    o.code = find(pd, "code#string")
    o.message = find(pd, "message#string")
    o
end

export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::Union(ASCIIString, Nothing)

    DescribeBundleTasksItemType(; bundleId=nothing) = 
         new(bundleId)
end
function DescribeBundleTasksItemType(pd::ETree)
    o = DescribeBundleTasksItemType()
    o.bundleId = find(pd, "bundleId#string")
    o
end

export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::Union(ASCIIString, Nothing)

    CancelBundleTaskType(; bundleId=nothing) = 
         new(bundleId)
end
function CancelBundleTaskType(pd::ETree)
    o = CancelBundleTaskType()
    o.bundleId = find(pd, "bundleId#string")
    o
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
function CopyImageType(pd::ETree)
    o = CopyImageType()
    o.sourceRegion = find(pd, "sourceRegion#string")
    o.sourceImageId = find(pd, "sourceImageId#string")
    o.name = find(pd, "name#string")
    o.description = find(pd, "description#string")
    o.clientToken = find(pd, "clientToken#string")
    o
end

export CopyImageType


type CopyImageResponseType
    requestId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)

    CopyImageResponseType(; requestId=nothing, imageId=nothing) = 
         new(requestId, imageId)
end
function CopyImageResponseType(pd::ETree)
    o = CopyImageResponseType()
    o.requestId = find(pd, "requestId#string")
    o.imageId = find(pd, "imageId#string")
    o
end

export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::Union(ASCIIString, Nothing)

    DescribeRegionsSetItemType(; regionName=nothing) = 
         new(regionName)
end
function DescribeRegionsSetItemType(pd::ETree)
    o = DescribeRegionsSetItemType()
    o.regionName = find(pd, "regionName#string")
    o
end

export DescribeRegionsSetItemType


type RegionItemType
    regionName::Union(ASCIIString, Nothing)
    regionEndpoint::Union(ASCIIString, Nothing)

    RegionItemType(; regionName=nothing, regionEndpoint=nothing) = 
         new(regionName, regionEndpoint)
end
function RegionItemType(pd::ETree)
    o = RegionItemType()
    o.regionName = find(pd, "regionName#string")
    o.regionEndpoint = find(pd, "regionEndpoint#string")
    o
end

export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsSetItemType(; reservedInstancesOfferingId=nothing) = 
         new(reservedInstancesOfferingId)
end
function DescribeReservedInstancesOfferingsSetItemType(pd::ETree)
    o = DescribeReservedInstancesOfferingsSetItemType()
    o.reservedInstancesOfferingId = find(pd, "reservedInstancesOfferingId#string")
    o
end

export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::Union(ASCIIString, Nothing)
    amount::Union(Float64, Nothing)

    RecurringChargesSetItemType(; frequency=nothing, amount=nothing) = 
         new(frequency, amount)
end
function RecurringChargesSetItemType(pd::ETree)
    o = RecurringChargesSetItemType()
    o.frequency = find(pd, "frequency#string")
    o.amount = AWS.safe_parse_as(Float64, find(pd, "amount#string"))
    o
end

export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Union(Float64, Nothing)
    count::Union(Int64, Nothing)

    PricingDetailsSetItemType(; price=nothing, count=nothing) = 
         new(price, count)
end
function PricingDetailsSetItemType(pd::ETree)
    o = PricingDetailsSetItemType()
    o.price = AWS.safe_parse_as(Float64, find(pd, "price#string"))
    o.count = AWS.safe_parse_as(Int64, find(pd, "count#string"))
    o
end

export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    ReservedInstanceLimitPriceType(; amount=nothing, currencyCode=nothing) = 
         new(amount, currencyCode)
end
function ReservedInstanceLimitPriceType(pd::ETree)
    o = ReservedInstanceLimitPriceType()
    o.amount = AWS.safe_parse_as(Float64, find(pd, "amount#string"))
    o.currencyCode = find(pd, "currencyCode#string")
    o
end

export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesId::Union(ASCIIString, Nothing)

    PurchaseReservedInstancesOfferingResponseType(; requestId=nothing, reservedInstancesId=nothing) = 
         new(requestId, reservedInstancesId)
end
function PurchaseReservedInstancesOfferingResponseType(pd::ETree)
    o = PurchaseReservedInstancesOfferingResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesId = find(pd, "reservedInstancesId#string")
    o
end

export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesSetItemType(; reservedInstancesId=nothing) = 
         new(reservedInstancesId)
end
function DescribeReservedInstancesSetItemType(pd::ETree)
    o = DescribeReservedInstancesSetItemType()
    o.reservedInstancesId = find(pd, "reservedInstancesId#string")
    o
end

export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Union(Int64, Nothing)
    price::Union(Float64, Nothing)
    currencyCode::Union(ASCIIString, Nothing)

    PriceScheduleRequestSetItemType(; term=nothing, price=nothing, currencyCode=nothing) = 
         new(term, price, currencyCode)
end
function PriceScheduleRequestSetItemType(pd::ETree)
    o = PriceScheduleRequestSetItemType()
    o.term = AWS.safe_parse_as(Int64, find(pd, "term#string"))
    o.price = AWS.safe_parse_as(Float64, find(pd, "price#string"))
    o.currencyCode = find(pd, "currencyCode#string")
    o
end

export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    CancelReservedInstancesListingType(; reservedInstancesListingId=nothing) = 
         new(reservedInstancesListingId)
end
function CancelReservedInstancesListingType(pd::ETree)
    o = CancelReservedInstancesListingType()
    o.reservedInstancesListingId = find(pd, "reservedInstancesListingId#string")
    o
end

export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::Union(ASCIIString, Nothing)

    DescribeReservedInstancesListingSetItemType(; reservedInstancesListingId=nothing) = 
         new(reservedInstancesListingId)
end
function DescribeReservedInstancesListingSetItemType(pd::ETree)
    o = DescribeReservedInstancesListingSetItemType()
    o.reservedInstancesListingId = find(pd, "reservedInstancesListingId#string")
    o
end

export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::Union(ASCIIString, Nothing)
    instanceCount::Union(Int64, Nothing)

    InstanceCountsSetItemType(; state=nothing, instanceCount=nothing) = 
         new(state, instanceCount)
end
function InstanceCountsSetItemType(pd::ETree)
    o = InstanceCountsSetItemType()
    o.state = find(pd, "state#string")
    o.instanceCount = AWS.safe_parse_as(Int64, find(pd, "instanceCount#string"))
    o
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
function PriceScheduleSetItemType(pd::ETree)
    o = PriceScheduleSetItemType()
    o.term = AWS.safe_parse_as(Int64, find(pd, "term#string"))
    o.price = AWS.safe_parse_as(Float64, find(pd, "price#string"))
    o.currencyCode = find(pd, "currencyCode#string")
    o.active = AWS.safe_parse_as(Bool, find(pd, "active#string"))
    o
end

export PriceScheduleSetItemType


type MonitorInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)

    MonitorInstancesType(; instancesSet=nothing) = 
         new(instancesSet)
end
function MonitorInstancesType(pd::ETree)
    o = MonitorInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o
end

export MonitorInstancesType


type MonitorInstancesSetItemType
    instanceId::Union(ASCIIString, Nothing)

    MonitorInstancesSetItemType(; instanceId=nothing) = 
         new(instanceId)
end
function MonitorInstancesSetItemType(pd::ETree)
    o = MonitorInstancesSetItemType()
    o.instanceId = find(pd, "instanceId#string")
    o
end

export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::Union(ASCIIString, Nothing)

    InstanceMonitoringStateType(; state=nothing) = 
         new(state)
end
function InstanceMonitoringStateType(pd::ETree)
    o = InstanceMonitoringStateType()
    o.state = find(pd, "state#string")
    o
end

export InstanceMonitoringStateType


type AttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    AttachmentType(; vpcId=nothing, state=nothing) = 
         new(vpcId, state)
end
function AttachmentType(pd::ETree)
    o = AttachmentType()
    o.vpcId = find(pd, "vpcId#string")
    o.state = find(pd, "state#string")
    o
end

export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsResponseType(; staticRoutesOnly=nothing) = 
         new(staticRoutesOnly)
end
function VpnConnectionOptionsResponseType(pd::ETree)
    o = VpnConnectionOptionsResponseType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, find(pd, "staticRoutesOnly#string"))
    o
end

export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::Union(ASCIIString, Nothing)
    source::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    VpnStaticRouteType(; destinationCidrBlock=nothing, source=nothing, state=nothing) = 
         new(destinationCidrBlock, source, state)
end
function VpnStaticRouteType(pd::ETree)
    o = VpnStaticRouteType()
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o.source = find(pd, "source#string")
    o.state = find(pd, "state#string")
    o
end

export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    lastStatusChange::Union(CalendarTime, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    acceptedRouteCount::Union(Int64, Nothing)

    VpnTunnelTelemetryType(; outsideIpAddress=nothing, status=nothing, lastStatusChange=nothing, statusMessage=nothing, acceptedRouteCount=nothing) = 
         new(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount)
end
function VpnTunnelTelemetryType(pd::ETree)
    o = VpnTunnelTelemetryType()
    o.outsideIpAddress = find(pd, "outsideIpAddress#string")
    o.status = find(pd, "status#string")
    o.lastStatusChange = AWS.safe_parse_as(CalendarTime, find(pd, "lastStatusChange#string"))
    o.statusMessage = find(pd, "statusMessage#string")
    o.acceptedRouteCount = AWS.safe_parse_as(Int64, find(pd, "acceptedRouteCount#string"))
    o
end

export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::Union(ASCIIString, Nothing)

    CustomerGatewayIdSetItemType(; customerGatewayId=nothing) = 
         new(customerGatewayId)
end
function CustomerGatewayIdSetItemType(pd::ETree)
    o = CustomerGatewayIdSetItemType()
    o.customerGatewayId = find(pd, "customerGatewayId#string")
    o
end

export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::Union(ASCIIString, Nothing)

    VpnGatewayIdSetItemType(; vpnGatewayId=nothing) = 
         new(vpnGatewayId)
end
function VpnGatewayIdSetItemType(pd::ETree)
    o = VpnGatewayIdSetItemType()
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o
end

export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::Union(ASCIIString, Nothing)

    VpnConnectionIdSetItemType(; vpnConnectionId=nothing) = 
         new(vpnConnectionId)
end
function VpnConnectionIdSetItemType(pd::ETree)
    o = VpnConnectionIdSetItemType()
    o.vpnConnectionId = find(pd, "vpnConnectionId#string")
    o
end

export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::Union(ASCIIString, Nothing)

    VpcIdSetItemType(; vpcId=nothing) = 
         new(vpcId)
end
function VpcIdSetItemType(pd::ETree)
    o = VpcIdSetItemType()
    o.vpcId = find(pd, "vpcId#string")
    o
end

export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::Union(ASCIIString, Nothing)

    SubnetIdSetItemType(; subnetId=nothing) = 
         new(subnetId)
end
function SubnetIdSetItemType(pd::ETree)
    o = SubnetIdSetItemType()
    o.subnetId = find(pd, "subnetId#string")
    o
end

export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DhcpOptionsIdSetItemType(; dhcpOptionsId=nothing) = 
         new(dhcpOptionsId)
end
function DhcpOptionsIdSetItemType(pd::ETree)
    o = DhcpOptionsIdSetItemType()
    o.dhcpOptionsId = find(pd, "dhcpOptionsId#string")
    o
end

export DhcpOptionsIdSetItemType


type DhcpConfigurationItemType
    key::Union(ASCIIString, Nothing)
    valueSet::Union(Vector{ASCIIString}, Nothing)

    DhcpConfigurationItemType(; key=nothing, valueSet=nothing) = 
         new(key, valueSet)
end
function DhcpConfigurationItemType(pd::ETree)
    o = DhcpConfigurationItemType()
    o.key = find(pd, "key#string")
    o.valueSet = AWS.parse_vector_as(ASCIIString, "value", find(pd, "item/value"))
    o
end

export DhcpConfigurationItemType


type DhcpValueType
    value::Union(ASCIIString, Nothing)

    DhcpValueType(; value=nothing) = 
         new(value)
end
function DhcpValueType(pd::ETree)
    o = DhcpValueType()
    o.value = find(pd, "value#string")
    o
end

export DhcpValueType


type FilterType
    name::Union(ASCIIString, Nothing)
    valueSet::Union(Vector{ASCIIString}, Nothing)

    FilterType(; name=nothing, valueSet=nothing) = 
         new(name, valueSet)
end
function FilterType(pd::ETree)
    o = FilterType()
    o.name = find(pd, "name#string")
    o.valueSet = AWS.parse_vector_as(ASCIIString, "value", find(pd, "item/value"))
    o
end

export FilterType


type ValueType
    value::Union(ASCIIString, Nothing)

    ValueType(; value=nothing) = 
         new(value)
end
function ValueType(pd::ETree)
    o = ValueType()
    o.value = find(pd, "value#string")
    o
end

export ValueType


type CreateCustomerGatewayType
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int64, Nothing)

    CreateCustomerGatewayType(; _type=nothing, ipAddress=nothing, bgpAsn=nothing) = 
         new(_type, ipAddress, bgpAsn)
end
function CreateCustomerGatewayType(pd::ETree)
    o = CreateCustomerGatewayType()
    o._type = find(pd, "type#string")
    o.ipAddress = find(pd, "ipAddress#string")
    o.bgpAsn = AWS.safe_parse_as(Int64, find(pd, "bgpAsn#string"))
    o
end

export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)

    DeleteCustomerGatewayType(; customerGatewayId=nothing) = 
         new(customerGatewayId)
end
function DeleteCustomerGatewayType(pd::ETree)
    o = DeleteCustomerGatewayType()
    o.customerGatewayId = find(pd, "customerGatewayId#string")
    o
end

export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteCustomerGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteCustomerGatewayResponseType(pd::ETree)
    o = DeleteCustomerGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateVpnGatewayType(; _type=nothing, availabilityZone=nothing) = 
         new(_type, availabilityZone)
end
function CreateVpnGatewayType(pd::ETree)
    o = CreateVpnGatewayType()
    o._type = find(pd, "type#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o
end

export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)

    DeleteVpnGatewayType(; vpnGatewayId=nothing) = 
         new(vpnGatewayId)
end
function DeleteVpnGatewayType(pd::ETree)
    o = DeleteVpnGatewayType()
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o
end

export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteVpnGatewayResponseType(pd::ETree)
    o = DeleteVpnGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union(Bool, Nothing)

    VpnConnectionOptionsRequestType(; staticRoutesOnly=nothing) = 
         new(staticRoutesOnly)
end
function VpnConnectionOptionsRequestType(pd::ETree)
    o = VpnConnectionOptionsRequestType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, find(pd, "staticRoutesOnly#string"))
    o
end

export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) = 
         new(vpnConnectionId, destinationCidrBlock)
end
function CreateVpnConnectionRouteType(pd::ETree)
    o = CreateVpnConnectionRouteType()
    o.vpnConnectionId = find(pd, "vpnConnectionId#string")
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o
end

export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CreateVpnConnectionRouteResponseType(pd::ETree)
    o = CreateVpnConnectionRouteResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) = 
         new(vpnConnectionId, destinationCidrBlock)
end
function DeleteVpnConnectionRouteType(pd::ETree)
    o = DeleteVpnConnectionRouteType()
    o.vpnConnectionId = find(pd, "vpnConnectionId#string")
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o
end

export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteVpnConnectionRouteResponseType(pd::ETree)
    o = DeleteVpnConnectionRouteResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::Union(ASCIIString, Nothing)

    DeleteVpnConnectionType(; vpnConnectionId=nothing) = 
         new(vpnConnectionId)
end
function DeleteVpnConnectionType(pd::ETree)
    o = DeleteVpnConnectionType()
    o.vpnConnectionId = find(pd, "vpnConnectionId#string")
    o
end

export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpnConnectionResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteVpnConnectionResponseType(pd::ETree)
    o = DeleteVpnConnectionResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) = 
         new(vpnGatewayId, vpcId)
end
function AttachVpnGatewayType(pd::ETree)
    o = AttachVpnGatewayType()
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) = 
         new(vpnGatewayId, vpcId)
end
function DetachVpnGatewayType(pd::ETree)
    o = DetachVpnGatewayType()
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachVpnGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DetachVpnGatewayResponseType(pd::ETree)
    o = DetachVpnGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::Union(ASCIIString, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)

    CreateVpcType(; cidrBlock=nothing, instanceTenancy=nothing) = 
         new(cidrBlock, instanceTenancy)
end
function CreateVpcType(pd::ETree)
    o = CreateVpcType()
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.instanceTenancy = find(pd, "instanceTenancy#string")
    o
end

export CreateVpcType


type DeleteVpcType
    vpcId::Union(ASCIIString, Nothing)

    DeleteVpcType(; vpcId=nothing) = 
         new(vpcId)
end
function DeleteVpcType(pd::ETree)
    o = DeleteVpcType()
    o.vpcId = find(pd, "vpcId#string")
    o
end

export DeleteVpcType


type DeleteVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteVpcResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteVpcResponseType(pd::ETree)
    o = DeleteVpcResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteVpcResponseType


type CreateSubnetType
    vpcId::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    CreateSubnetType(; vpcId=nothing, cidrBlock=nothing, availabilityZone=nothing) = 
         new(vpcId, cidrBlock, availabilityZone)
end
function CreateSubnetType(pd::ETree)
    o = CreateSubnetType()
    o.vpcId = find(pd, "vpcId#string")
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o
end

export CreateSubnetType


type DeleteSubnetType
    subnetId::Union(ASCIIString, Nothing)

    DeleteSubnetType(; subnetId=nothing) = 
         new(subnetId)
end
function DeleteSubnetType(pd::ETree)
    o = DeleteSubnetType()
    o.subnetId = find(pd, "subnetId#string")
    o
end

export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSubnetResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteSubnetResponseType(pd::ETree)
    o = DeleteSubnetResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)

    DeleteDhcpOptionsType(; dhcpOptionsId=nothing) = 
         new(dhcpOptionsId)
end
function DeleteDhcpOptionsType(pd::ETree)
    o = DeleteDhcpOptionsType()
    o.dhcpOptionsId = find(pd, "dhcpOptionsId#string")
    o
end

export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteDhcpOptionsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteDhcpOptionsResponseType(pd::ETree)
    o = DeleteDhcpOptionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AssociateDhcpOptionsType(; dhcpOptionsId=nothing, vpcId=nothing) = 
         new(dhcpOptionsId, vpcId)
end
function AssociateDhcpOptionsType(pd::ETree)
    o = AssociateDhcpOptionsType()
    o.dhcpOptionsId = find(pd, "dhcpOptionsId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssociateDhcpOptionsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function AssociateDhcpOptionsResponseType(pd::ETree)
    o = AssociateDhcpOptionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::Union(ASCIIString, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStateFaultType(; code=nothing, message=nothing) = 
         new(code, message)
end
function SpotInstanceStateFaultType(pd::ETree)
    o = SpotInstanceStateFaultType()
    o.code = find(pd, "code#string")
    o.message = find(pd, "message#string")
    o
end

export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union(ASCIIString, Nothing)
    updateTime::Union(CalendarTime, Nothing)
    message::Union(ASCIIString, Nothing)

    SpotInstanceStatusMessageType(; code=nothing, updateTime=nothing, message=nothing) = 
         new(code, updateTime, message)
end
function SpotInstanceStatusMessageType(pd::ETree)
    o = SpotInstanceStatusMessageType()
    o.code = find(pd, "code#string")
    o.updateTime = AWS.safe_parse_as(CalendarTime, find(pd, "updateTime#string"))
    o.message = find(pd, "message#string")
    o
end

export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)

    SpotInstanceRequestIdSetItemType(; spotInstanceRequestId=nothing) = 
         new(spotInstanceRequestId)
end
function SpotInstanceRequestIdSetItemType(pd::ETree)
    o = SpotInstanceRequestIdSetItemType()
    o.spotInstanceRequestId = find(pd, "spotInstanceRequestId#string")
    o
end

export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Vector{ASCIIString}, Nothing)

    CancelSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing) = 
         new(spotInstanceRequestIdSet)
end
function CancelSpotInstanceRequestsType(pd::ETree)
    o = CancelSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(ASCIIString, "spotInstanceRequestId", find(pd, "item/spotInstanceRequestId"))
    o
end

export CancelSpotInstanceRequestsType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    CancelSpotInstanceRequestsResponseSetItemType(; spotInstanceRequestId=nothing, state=nothing) = 
         new(spotInstanceRequestId, state)
end
function CancelSpotInstanceRequestsResponseSetItemType(pd::ETree)
    o = CancelSpotInstanceRequestsResponseSetItemType()
    o.spotInstanceRequestId = find(pd, "spotInstanceRequestId#string")
    o.state = find(pd, "state#string")
    o
end

export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::Union(ASCIIString, Nothing)

    InstanceTypeSetItemType(; instanceType=nothing) = 
         new(instanceType)
end
function InstanceTypeSetItemType(pd::ETree)
    o = InstanceTypeSetItemType()
    o.instanceType = find(pd, "instanceType#string")
    o
end

export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::Union(ASCIIString, Nothing)

    ProductDescriptionSetItemType(; productDescription=nothing) = 
         new(productDescription)
end
function ProductDescriptionSetItemType(pd::ETree)
    o = ProductDescriptionSetItemType()
    o.productDescription = find(pd, "productDescription#string")
    o
end

export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::Union(ASCIIString, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    spotPrice::Union(ASCIIString, Nothing)
    timestamp::Union(CalendarTime, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)

    SpotPriceHistorySetItemType(; instanceType=nothing, productDescription=nothing, spotPrice=nothing, timestamp=nothing, availabilityZone=nothing) = 
         new(instanceType, productDescription, spotPrice, timestamp, availabilityZone)
end
function SpotPriceHistorySetItemType(pd::ETree)
    o = SpotPriceHistorySetItemType()
    o.instanceType = find(pd, "instanceType#string")
    o.productDescription = find(pd, "productDescription#string")
    o.spotPrice = find(pd, "spotPrice#string")
    o.timestamp = AWS.safe_parse_as(CalendarTime, find(pd, "timestamp#string"))
    o.availabilityZone = find(pd, "availabilityZone#string")
    o
end

export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)

    CreateSpotDatafeedSubscriptionType(; bucket=nothing, prefix=nothing) = 
         new(bucket, prefix)
end
function CreateSpotDatafeedSubscriptionType(pd::ETree)
    o = CreateSpotDatafeedSubscriptionType()
    o.bucket = find(pd, "bucket#string")
    o.prefix = find(pd, "prefix#string")
    o
end

export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteSpotDatafeedSubscriptionResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = DeleteSpotDatafeedSubscriptionResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::Union(ASCIIString, Nothing)

    LicenseIdSetItemType(; licenseId=nothing) = 
         new(licenseId)
end
function LicenseIdSetItemType(pd::ETree)
    o = LicenseIdSetItemType()
    o.licenseId = find(pd, "licenseId#string")
    o
end

export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Union(Int64, Nothing)
    instanceCapacity::Union(Int64, Nothing)
    state::Union(ASCIIString, Nothing)
    earliestAllowedDeactivationTime::Union(CalendarTime, Nothing)

    LicenseCapacitySetItemType(; capacity=nothing, instanceCapacity=nothing, state=nothing, earliestAllowedDeactivationTime=nothing) = 
         new(capacity, instanceCapacity, state, earliestAllowedDeactivationTime)
end
function LicenseCapacitySetItemType(pd::ETree)
    o = LicenseCapacitySetItemType()
    o.capacity = AWS.safe_parse_as(Int64, find(pd, "capacity#string"))
    o.instanceCapacity = AWS.safe_parse_as(Int64, find(pd, "instanceCapacity#string"))
    o.state = find(pd, "state#string")
    o.earliestAllowedDeactivationTime = AWS.safe_parse_as(CalendarTime, find(pd, "earliestAllowedDeactivationTime#string"))
    o
end

export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int64, Nothing)

    ActivateLicenseType(; licenseId=nothing, capacity=nothing) = 
         new(licenseId, capacity)
end
function ActivateLicenseType(pd::ETree)
    o = ActivateLicenseType()
    o.licenseId = find(pd, "licenseId#string")
    o.capacity = AWS.safe_parse_as(Int64, find(pd, "capacity#string"))
    o
end

export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ActivateLicenseResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ActivateLicenseResponseType(pd::ETree)
    o = ActivateLicenseResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::Union(ASCIIString, Nothing)
    capacity::Union(Int64, Nothing)

    DeactivateLicenseType(; licenseId=nothing, capacity=nothing) = 
         new(licenseId, capacity)
end
function DeactivateLicenseType(pd::ETree)
    o = DeactivateLicenseType()
    o.licenseId = find(pd, "licenseId#string")
    o.capacity = AWS.safe_parse_as(Int64, find(pd, "capacity#string"))
    o
end

export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeactivateLicenseResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeactivateLicenseResponseType(pd::ETree)
    o = DeactivateLicenseResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)

    CreatePlacementGroupType(; groupName=nothing, strategy=nothing) = 
         new(groupName, strategy)
end
function CreatePlacementGroupType(pd::ETree)
    o = CreatePlacementGroupType()
    o.groupName = find(pd, "groupName#string")
    o.strategy = find(pd, "strategy#string")
    o
end

export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreatePlacementGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CreatePlacementGroupResponseType(pd::ETree)
    o = CreatePlacementGroupResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::Union(ASCIIString, Nothing)

    DeletePlacementGroupType(; groupName=nothing) = 
         new(groupName)
end
function DeletePlacementGroupType(pd::ETree)
    o = DeletePlacementGroupType()
    o.groupName = find(pd, "groupName#string")
    o
end

export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeletePlacementGroupResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeletePlacementGroupResponseType(pd::ETree)
    o = DeletePlacementGroupResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::Union(ASCIIString, Nothing)

    DescribePlacementGroupItemType(; groupName=nothing) = 
         new(groupName)
end
function DescribePlacementGroupItemType(pd::ETree)
    o = DescribePlacementGroupItemType()
    o.groupName = find(pd, "groupName#string")
    o
end

export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::Union(ASCIIString, Nothing)
    strategy::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    PlacementGroupInfoType(; groupName=nothing, strategy=nothing, state=nothing) = 
         new(groupName, strategy, state)
end
function PlacementGroupInfoType(pd::ETree)
    o = PlacementGroupInfoType()
    o.groupName = find(pd, "groupName#string")
    o.strategy = find(pd, "strategy#string")
    o.state = find(pd, "state#string")
    o
end

export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::Union(ASCIIString, Nothing)

    ResourceIdSetItemType(; resourceId=nothing) = 
         new(resourceId)
end
function ResourceIdSetItemType(pd::ETree)
    o = ResourceIdSetItemType()
    o.resourceId = find(pd, "resourceId#string")
    o
end

export ResourceIdSetItemType


type ResourceTagSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    ResourceTagSetItemType(; key=nothing, value=nothing) = 
         new(key, value)
end
function ResourceTagSetItemType(pd::ETree)
    o = ResourceTagSetItemType()
    o.key = find(pd, "key#string")
    o.value = find(pd, "value#string")
    o
end

export ResourceTagSetItemType


type CreateTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateTagsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CreateTagsResponseType(pd::ETree)
    o = CreateTagsResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
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
function TagSetItemType(pd::ETree)
    o = TagSetItemType()
    o.resourceId = find(pd, "resourceId#string")
    o.resourceType = find(pd, "resourceType#string")
    o.key = find(pd, "key#string")
    o.value = find(pd, "value#string")
    o
end

export TagSetItemType


type DeleteTagsSetItemType
    key::Union(ASCIIString, Nothing)
    value::Union(ASCIIString, Nothing)

    DeleteTagsSetItemType(; key=nothing, value=nothing) = 
         new(key, value)
end
function DeleteTagsSetItemType(pd::ETree)
    o = DeleteTagsSetItemType()
    o.key = find(pd, "key#string")
    o.value = find(pd, "value#string")
    o
end

export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteTagsResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteTagsResponseType(pd::ETree)
    o = DeleteTagsResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteTagsResponseType


type DiskImageDetailType
    format::Union(ASCIIString, Nothing)
    bytes::Union(Int64, Nothing)
    importManifestUrl::Union(ASCIIString, Nothing)

    DiskImageDetailType(; format=nothing, bytes=nothing, importManifestUrl=nothing) = 
         new(format, bytes, importManifestUrl)
end
function DiskImageDetailType(pd::ETree)
    o = DiskImageDetailType()
    o.format = find(pd, "format#string")
    o.bytes = AWS.safe_parse_as(Int64, find(pd, "bytes#string"))
    o.importManifestUrl = find(pd, "importManifestUrl#string")
    o
end

export DiskImageDetailType


type DiskImageVolumeType
    size::Union(Int64, Nothing)

    DiskImageVolumeType(; size=nothing) = 
         new(size)
end
function DiskImageVolumeType(pd::ETree)
    o = DiskImageVolumeType()
    o.size = AWS.safe_parse_as(Int64, find(pd, "size#string"))
    o
end

export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Union(Int64, Nothing)
    id::Union(ASCIIString, Nothing)

    DiskImageVolumeDescriptionType(; size=nothing, id=nothing) = 
         new(size, id)
end
function DiskImageVolumeDescriptionType(pd::ETree)
    o = DiskImageVolumeDescriptionType()
    o.size = AWS.safe_parse_as(Int64, find(pd, "size#string"))
    o.id = find(pd, "id#string")
    o
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
function DiskImageDescriptionType(pd::ETree)
    o = DiskImageDescriptionType()
    o.format = find(pd, "format#string")
    o.size = AWS.safe_parse_as(Int64, find(pd, "size#string"))
    o.importManifestUrl = find(pd, "importManifestUrl#string")
    o.checksum = find(pd, "checksum#string")
    o
end

export DiskImageDescriptionType


type DescribeConversionTasksType
    conversionTaskIdSet::Union(Vector{ASCIIString}, Nothing)

    DescribeConversionTasksType(; conversionTaskIdSet=nothing) = 
         new(conversionTaskIdSet)
end
function DescribeConversionTasksType(pd::ETree)
    o = DescribeConversionTasksType()
    o.conversionTaskIdSet = AWS.parse_vector_as(ASCIIString, "conversionTaskId", find(pd, "item/conversionTaskId"))
    o
end

export DescribeConversionTasksType


type ConversionTaskIdItemType
    conversionTaskId::Union(ASCIIString, Nothing)

    ConversionTaskIdItemType(; conversionTaskId=nothing) = 
         new(conversionTaskId)
end
function ConversionTaskIdItemType(pd::ETree)
    o = ConversionTaskIdItemType()
    o.conversionTaskId = find(pd, "conversionTaskId#string")
    o
end

export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)

    CancelConversionTaskType(; conversionTaskId=nothing) = 
         new(conversionTaskId)
end
function CancelConversionTaskType(pd::ETree)
    o = CancelConversionTaskType()
    o.conversionTaskId = find(pd, "conversionTaskId#string")
    o
end

export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelConversionTaskResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CancelConversionTaskResponseType(pd::ETree)
    o = CancelConversionTaskResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    CreateInstanceExportTaskType(; description=nothing, instanceId=nothing, targetEnvironment=nothing) = 
         new(description, instanceId, targetEnvironment)
end
function CreateInstanceExportTaskType(pd::ETree)
    o = CreateInstanceExportTaskType()
    o.description = find(pd, "description#string")
    o.instanceId = find(pd, "instanceId#string")
    o.targetEnvironment = find(pd, "targetEnvironment#string")
    o
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
function ExportToS3TaskType(pd::ETree)
    o = ExportToS3TaskType()
    o.diskImageFormat = find(pd, "diskImageFormat#string")
    o.containerFormat = find(pd, "containerFormat#string")
    o.s3Bucket = find(pd, "s3Bucket#string")
    o.s3Prefix = find(pd, "s3Prefix#string")
    o
end

export ExportToS3TaskType


type DescribeExportTasksType
    exportTaskIdSet::Union(Vector{ASCIIString}, Nothing)

    DescribeExportTasksType(; exportTaskIdSet=nothing) = 
         new(exportTaskIdSet)
end
function DescribeExportTasksType(pd::ETree)
    o = DescribeExportTasksType()
    o.exportTaskIdSet = AWS.parse_vector_as(ASCIIString, "exportTaskId", find(pd, "item/exportTaskId"))
    o
end

export DescribeExportTasksType


type ExportTaskIdType
    exportTaskId::Union(ASCIIString, Nothing)

    ExportTaskIdType(; exportTaskId=nothing) = 
         new(exportTaskId)
end
function ExportTaskIdType(pd::ETree)
    o = ExportTaskIdType()
    o.exportTaskId = find(pd, "exportTaskId#string")
    o
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
function ExportTaskResponseType(pd::ETree)
    o = ExportTaskResponseType()
    o.exportTaskId = find(pd, "exportTaskId#string")
    o.description = find(pd, "description#string")
    o.state = find(pd, "state#string")
    o.statusMessage = find(pd, "statusMessage#string")
    o
end

export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::Union(ASCIIString, Nothing)
    targetEnvironment::Union(ASCIIString, Nothing)

    InstanceExportTaskResponseType(; instanceId=nothing, targetEnvironment=nothing) = 
         new(instanceId, targetEnvironment)
end
function InstanceExportTaskResponseType(pd::ETree)
    o = InstanceExportTaskResponseType()
    o.instanceId = find(pd, "instanceId#string")
    o.targetEnvironment = find(pd, "targetEnvironment#string")
    o
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
function ExportToS3TaskResponseType(pd::ETree)
    o = ExportToS3TaskResponseType()
    o.diskImageFormat = find(pd, "diskImageFormat#string")
    o.containerFormat = find(pd, "containerFormat#string")
    o.s3Bucket = find(pd, "s3Bucket#string")
    o.s3Key = find(pd, "s3Key#string")
    o
end

export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::Union(ASCIIString, Nothing)

    CancelExportTaskType(; exportTaskId=nothing) = 
         new(exportTaskId)
end
function CancelExportTaskType(pd::ETree)
    o = CancelExportTaskType()
    o.exportTaskId = find(pd, "exportTaskId#string")
    o
end

export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CancelExportTaskResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CancelExportTaskResponseType(pd::ETree)
    o = CancelExportTaskResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)

    InternetGatewayAttachmentType(; vpcId=nothing, state=nothing) = 
         new(vpcId, state)
end
function InternetGatewayAttachmentType(pd::ETree)
    o = InternetGatewayAttachmentType()
    o.vpcId = find(pd, "vpcId#string")
    o.state = find(pd, "state#string")
    o
end

export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::Union(ASCIIString, Nothing)

    InternetGatewayIdSetItemType(; internetGatewayId=nothing) = 
         new(internetGatewayId)
end
function InternetGatewayIdSetItemType(pd::ETree)
    o = InternetGatewayIdSetItemType()
    o.internetGatewayId = find(pd, "internetGatewayId#string")
    o
end

export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)

    DeleteInternetGatewayType(; internetGatewayId=nothing) = 
         new(internetGatewayId)
end
function DeleteInternetGatewayType(pd::ETree)
    o = DeleteInternetGatewayType()
    o.internetGatewayId = find(pd, "internetGatewayId#string")
    o
end

export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteInternetGatewayResponseType(pd::ETree)
    o = DeleteInternetGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    AttachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) = 
         new(internetGatewayId, vpcId)
end
function AttachInternetGatewayType(pd::ETree)
    o = AttachInternetGatewayType()
    o.internetGatewayId = find(pd, "internetGatewayId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AttachInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function AttachInternetGatewayResponseType(pd::ETree)
    o = AttachInternetGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)

    DetachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) = 
         new(internetGatewayId, vpcId)
end
function DetachInternetGatewayType(pd::ETree)
    o = DetachInternetGatewayType()
    o.internetGatewayId = find(pd, "internetGatewayId#string")
    o.vpcId = find(pd, "vpcId#string")
    o
end

export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachInternetGatewayResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DetachInternetGatewayResponseType(pd::ETree)
    o = DetachInternetGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::Union(ASCIIString, Nothing)

    CreateRouteTableType(; vpcId=nothing) = 
         new(vpcId)
end
function CreateRouteTableType(pd::ETree)
    o = CreateRouteTableType()
    o.vpcId = find(pd, "vpcId#string")
    o
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
function RouteType(pd::ETree)
    o = RouteType()
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o.gatewayId = find(pd, "gatewayId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.instanceOwnerId = find(pd, "instanceOwnerId#string")
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.state = find(pd, "state#string")
    o.origin = find(pd, "origin#string")
    o
end

export RouteType


type RouteTableAssociationType
    routeTableAssociationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableAssociationType(; routeTableAssociationId=nothing, routeTableId=nothing) = 
         new(routeTableAssociationId, routeTableId)
end
function RouteTableAssociationType(pd::ETree)
    o = RouteTableAssociationType()
    o.routeTableAssociationId = find(pd, "routeTableAssociationId#string")
    o.routeTableId = find(pd, "routeTableId#string")
    o
end

export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::Union(ASCIIString, Nothing)

    PropagatingVgwType(; gatewayId=nothing) = 
         new(gatewayId)
end
function PropagatingVgwType(pd::ETree)
    o = PropagatingVgwType()
    o.gatewayId = find(pd, "gatewayId#string")
    o
end

export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::Union(ASCIIString, Nothing)

    RouteTableIdSetItemType(; routeTableId=nothing) = 
         new(routeTableId)
end
function RouteTableIdSetItemType(pd::ETree)
    o = RouteTableIdSetItemType()
    o.routeTableId = find(pd, "routeTableId#string")
    o
end

export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    EnableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) = 
         new(routeTableId, gatewayId)
end
function EnableVgwRoutePropagationRequestType(pd::ETree)
    o = EnableVgwRoutePropagationRequestType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.gatewayId = find(pd, "gatewayId#string")
    o
end

export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function EnableVgwRoutePropagationResponseType(pd::ETree)
    o = EnableVgwRoutePropagationResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::Union(ASCIIString, Nothing)
    gatewayId::Union(ASCIIString, Nothing)

    DisableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) = 
         new(routeTableId, gatewayId)
end
function DisableVgwRoutePropagationRequestType(pd::ETree)
    o = DisableVgwRoutePropagationRequestType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.gatewayId = find(pd, "gatewayId#string")
    o
end

export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DisableVgwRoutePropagationResponseType(pd::ETree)
    o = DisableVgwRoutePropagationResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::Union(ASCIIString, Nothing)

    DeleteRouteTableType(; routeTableId=nothing) = 
         new(routeTableId)
end
function DeleteRouteTableType(pd::ETree)
    o = DeleteRouteTableType()
    o.routeTableId = find(pd, "routeTableId#string")
    o
end

export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteTableResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteRouteTableResponseType(pd::ETree)
    o = DeleteRouteTableResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    AssociateRouteTableType(; routeTableId=nothing, subnetId=nothing) = 
         new(routeTableId, subnetId)
end
function AssociateRouteTableType(pd::ETree)
    o = AssociateRouteTableType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.subnetId = find(pd, "subnetId#string")
    o
end

export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    associationId::Union(ASCIIString, Nothing)

    AssociateRouteTableResponseType(; requestId=nothing, associationId=nothing) = 
         new(requestId, associationId)
end
function AssociateRouteTableResponseType(pd::ETree)
    o = AssociateRouteTableResponseType()
    o.requestId = find(pd, "requestId#string")
    o.associationId = find(pd, "associationId#string")
    o
end

export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::Union(ASCIIString, Nothing)
    routeTableId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationType(; associationId=nothing, routeTableId=nothing) = 
         new(associationId, routeTableId)
end
function ReplaceRouteTableAssociationType(pd::ETree)
    o = ReplaceRouteTableAssociationType()
    o.associationId = find(pd, "associationId#string")
    o.routeTableId = find(pd, "routeTableId#string")
    o
end

export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceRouteTableAssociationResponseType(; requestId=nothing, newAssociationId=nothing) = 
         new(requestId, newAssociationId)
end
function ReplaceRouteTableAssociationResponseType(pd::ETree)
    o = ReplaceRouteTableAssociationResponseType()
    o.requestId = find(pd, "requestId#string")
    o.newAssociationId = find(pd, "newAssociationId#string")
    o
end

export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::Union(ASCIIString, Nothing)

    DisassociateRouteTableType(; associationId=nothing) = 
         new(associationId)
end
function DisassociateRouteTableType(pd::ETree)
    o = DisassociateRouteTableType()
    o.associationId = find(pd, "associationId#string")
    o
end

export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DisassociateRouteTableResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DisassociateRouteTableResponseType(pd::ETree)
    o = DisassociateRouteTableResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    CreateRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
function CreateRouteType(pd::ETree)
    o = CreateRouteType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o
end

export CreateRouteType


type CreateRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CreateRouteResponseType(pd::ETree)
    o = CreateRouteResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    ReplaceRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
function ReplaceRouteType(pd::ETree)
    o = ReplaceRouteType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o
end

export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ReplaceRouteResponseType(pd::ETree)
    o = ReplaceRouteResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::Union(ASCIIString, Nothing)
    destinationCidrBlock::Union(ASCIIString, Nothing)

    DeleteRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) = 
         new(routeTableId, destinationCidrBlock)
end
function DeleteRouteType(pd::ETree)
    o = DeleteRouteType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.destinationCidrBlock = find(pd, "destinationCidrBlock#string")
    o
end

export DeleteRouteType


type DeleteRouteResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteRouteResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteRouteResponseType(pd::ETree)
    o = DeleteRouteResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::Union(ASCIIString, Nothing)

    CreateNetworkAclType(; vpcId=nothing) = 
         new(vpcId)
end
function CreateNetworkAclType(pd::ETree)
    o = CreateNetworkAclType()
    o.vpcId = find(pd, "vpcId#string")
    o
end

export CreateNetworkAclType


type IcmpTypeCodeType
    code::Union(Int64, Nothing)
    _type::Union(Int64, Nothing)

    IcmpTypeCodeType(; code=nothing, _type=nothing) = 
         new(code, _type)
end
function IcmpTypeCodeType(pd::ETree)
    o = IcmpTypeCodeType()
    o.code = AWS.safe_parse_as(Int64, find(pd, "code#string"))
    o._type = AWS.safe_parse_as(Int64, find(pd, "type#string"))
    o
end

export IcmpTypeCodeType


type PortRangeType
    from::Union(Int64, Nothing)
    to::Union(Int64, Nothing)

    PortRangeType(; from=nothing, to=nothing) = 
         new(from, to)
end
function PortRangeType(pd::ETree)
    o = PortRangeType()
    o.from = AWS.safe_parse_as(Int64, find(pd, "from#string"))
    o.to = AWS.safe_parse_as(Int64, find(pd, "to#string"))
    o
end

export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)
    subnetId::Union(ASCIIString, Nothing)

    NetworkAclAssociationType(; networkAclAssociationId=nothing, networkAclId=nothing, subnetId=nothing) = 
         new(networkAclAssociationId, networkAclId, subnetId)
end
function NetworkAclAssociationType(pd::ETree)
    o = NetworkAclAssociationType()
    o.networkAclAssociationId = find(pd, "networkAclAssociationId#string")
    o.networkAclId = find(pd, "networkAclId#string")
    o.subnetId = find(pd, "subnetId#string")
    o
end

export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::Union(ASCIIString, Nothing)

    NetworkAclIdSetItemType(; networkAclId=nothing) = 
         new(networkAclId)
end
function NetworkAclIdSetItemType(pd::ETree)
    o = NetworkAclIdSetItemType()
    o.networkAclId = find(pd, "networkAclId#string")
    o
end

export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::Union(ASCIIString, Nothing)

    DeleteNetworkAclType(; networkAclId=nothing) = 
         new(networkAclId)
end
function DeleteNetworkAclType(pd::ETree)
    o = DeleteNetworkAclType()
    o.networkAclId = find(pd, "networkAclId#string")
    o
end

export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteNetworkAclResponseType(pd::ETree)
    o = DeleteNetworkAclResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::Union(ASCIIString, Nothing)
    networkAclId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationType(; associationId=nothing, networkAclId=nothing) = 
         new(associationId, networkAclId)
end
function ReplaceNetworkAclAssociationType(pd::ETree)
    o = ReplaceNetworkAclAssociationType()
    o.associationId = find(pd, "associationId#string")
    o.networkAclId = find(pd, "networkAclId#string")
    o
end

export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::Union(ASCIIString, Nothing)
    newAssociationId::Union(ASCIIString, Nothing)

    ReplaceNetworkAclAssociationResponseType(; requestId=nothing, newAssociationId=nothing) = 
         new(requestId, newAssociationId)
end
function ReplaceNetworkAclAssociationResponseType(pd::ETree)
    o = ReplaceNetworkAclAssociationResponseType()
    o.requestId = find(pd, "requestId#string")
    o.newAssociationId = find(pd, "newAssociationId#string")
    o
end

export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    CreateNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function CreateNetworkAclEntryResponseType(pd::ETree)
    o = CreateNetworkAclEntryResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReplaceNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ReplaceNetworkAclEntryResponseType(pd::ETree)
    o = ReplaceNetworkAclEntryResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int64, Nothing)
    egress::Union(Bool, Nothing)

    DeleteNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, egress=nothing) = 
         new(networkAclId, ruleNumber, egress)
end
function DeleteNetworkAclEntryType(pd::ETree)
    o = DeleteNetworkAclEntryType()
    o.networkAclId = find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, find(pd, "ruleNumber#string"))
    o.egress = AWS.safe_parse_as(Bool, find(pd, "egress#string"))
    o
end

export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteNetworkAclEntryResponseType(pd::ETree)
    o = DeleteNetworkAclEntryResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    impairedSince::Union(CalendarTime, Nothing)

    InstanceStatusDetailsSetItemType(; name=nothing, status=nothing, impairedSince=nothing) = 
         new(name, status, impairedSince)
end
function InstanceStatusDetailsSetItemType(pd::ETree)
    o = InstanceStatusDetailsSetItemType()
    o.name = find(pd, "name#string")
    o.status = find(pd, "status#string")
    o.impairedSince = AWS.safe_parse_as(CalendarTime, find(pd, "impairedSince#string"))
    o
end

export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    notBefore::Union(CalendarTime, Nothing)
    notAfter::Union(CalendarTime, Nothing)

    InstanceStatusEventType(; code=nothing, description=nothing, notBefore=nothing, notAfter=nothing) = 
         new(code, description, notBefore, notAfter)
end
function InstanceStatusEventType(pd::ETree)
    o = InstanceStatusEventType()
    o.code = find(pd, "code#string")
    o.description = find(pd, "description#string")
    o.notBefore = AWS.safe_parse_as(CalendarTime, find(pd, "notBefore#string"))
    o.notAfter = AWS.safe_parse_as(CalendarTime, find(pd, "notAfter#string"))
    o
end

export InstanceStatusEventType


type ReportInstanceStatusType
    instancesSet::Union(Vector{ASCIIString}, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(CalendarTime, Nothing)
    endTime::Union(CalendarTime, Nothing)
    reasonCodesSet::Union(Vector{ASCIIString}, Nothing)
    description::Union(ASCIIString, Nothing)

    ReportInstanceStatusType(; instancesSet=nothing, status=nothing, startTime=nothing, endTime=nothing, reasonCodesSet=nothing, description=nothing) = 
         new(instancesSet, status, startTime, endTime, reasonCodesSet, description)
end
function ReportInstanceStatusType(pd::ETree)
    o = ReportInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o.status = find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(CalendarTime, find(pd, "startTime#string"))
    o.endTime = AWS.safe_parse_as(CalendarTime, find(pd, "endTime#string"))
    o.reasonCodesSet = AWS.parse_vector_as(ASCIIString, "reasonCode", find(pd, "item/reasonCode"))
    o.description = find(pd, "description#string")
    o
end

export ReportInstanceStatusType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::Union(ASCIIString, Nothing)

    ReportInstanceStatusReasonCodeSetItemType(; reasonCode=nothing) = 
         new(reasonCode)
end
function ReportInstanceStatusReasonCodeSetItemType(pd::ETree)
    o = ReportInstanceStatusReasonCodeSetItemType()
    o.reasonCode = find(pd, "reasonCode#string")
    o
end

export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ReportInstanceStatusResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ReportInstanceStatusResponseType(pd::ETree)
    o = ReportInstanceStatusResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::Union(ASCIIString, Nothing)

    NetworkInterfaceIdSetItemType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
function NetworkInterfaceIdSetItemType(pd::ETree)
    o = NetworkInterfaceIdSetItemType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export NetworkInterfaceIdSetItemType


type NetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    instanceOwnerId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int64, Nothing)
    status::Union(ASCIIString, Nothing)
    attachTime::Union(CalendarTime, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    NetworkInterfaceAttachmentType(; attachmentId=nothing, instanceId=nothing, instanceOwnerId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination)
end
function NetworkInterfaceAttachmentType(pd::ETree)
    o = NetworkInterfaceAttachmentType()
    o.attachmentId = find(pd, "attachmentId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.instanceOwnerId = find(pd, "instanceOwnerId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, find(pd, "deviceIndex#string"))
    o.status = find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(CalendarTime, find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
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
function NetworkInterfaceAssociationType(pd::ETree)
    o = NetworkInterfaceAssociationType()
    o.publicIp = find(pd, "publicIp#string")
    o.publicDnsName = find(pd, "publicDnsName#string")
    o.ipOwnerId = find(pd, "ipOwnerId#string")
    o.allocationId = find(pd, "allocationId#string")
    o.associationId = find(pd, "associationId#string")
    o
end

export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DeleteNetworkInterfaceType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
function DeleteNetworkInterfaceType(pd::ETree)
    o = DeleteNetworkInterfaceType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DeleteNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DeleteNetworkInterfaceResponseType(pd::ETree)
    o = DeleteNetworkInterfaceResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::Union(ASCIIString, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int64, Nothing)

    AttachNetworkInterfaceType(; networkInterfaceId=nothing, instanceId=nothing, deviceIndex=nothing) = 
         new(networkInterfaceId, instanceId, deviceIndex)
end
function AttachNetworkInterfaceType(pd::ETree)
    o = AttachNetworkInterfaceType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.instanceId = find(pd, "instanceId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, find(pd, "deviceIndex#string"))
    o
end

export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    attachmentId::Union(ASCIIString, Nothing)

    AttachNetworkInterfaceResponseType(; requestId=nothing, attachmentId=nothing) = 
         new(requestId, attachmentId)
end
function AttachNetworkInterfaceResponseType(pd::ETree)
    o = AttachNetworkInterfaceResponseType()
    o.requestId = find(pd, "requestId#string")
    o.attachmentId = find(pd, "attachmentId#string")
    o
end

export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::Union(ASCIIString, Nothing)
    force::Union(Bool, Nothing)

    DetachNetworkInterfaceType(; attachmentId=nothing, force=nothing) = 
         new(attachmentId, force)
end
function DetachNetworkInterfaceType(pd::ETree)
    o = DetachNetworkInterfaceType()
    o.attachmentId = find(pd, "attachmentId#string")
    o.force = AWS.safe_parse_as(Bool, find(pd, "force#string"))
    o
end

export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    DetachNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function DetachNetworkInterfaceResponseType(pd::ETree)
    o = DetachNetworkInterfaceResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeType(pd::ETree)
    o = DescribeNetworkInterfaceAttributeType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceId::Union(ASCIIString, Nothing)

    DescribeNetworkInterfaceAttributeResponseType(; requestId=nothing, networkInterfaceId=nothing) = 
         new(requestId, networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeResponseType(pd::ETree)
    o = DescribeNetworkInterfaceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ModifyNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
function ModifyNetworkInterfaceAttributeType(pd::ETree)
    o = ModifyNetworkInterfaceAttributeType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::Union(ASCIIString, Nothing)
    deleteOnTermination::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttachmentType(; attachmentId=nothing, deleteOnTermination=nothing) = 
         new(attachmentId, deleteOnTermination)
end
function ModifyNetworkInterfaceAttachmentType(pd::ETree)
    o = ModifyNetworkInterfaceAttachmentType()
    o.attachmentId = find(pd, "attachmentId#string")
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o
end

export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifyNetworkInterfaceAttributeResponseType(pd::ETree)
    o = ModifyNetworkInterfaceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::Union(ASCIIString, Nothing)

    ResetNetworkInterfaceAttributeType(; networkInterfaceId=nothing) = 
         new(networkInterfaceId)
end
function ResetNetworkInterfaceAttributeType(pd::ETree)
    o = ResetNetworkInterfaceAttributeType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o
end

export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ResetNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ResetNetworkInterfaceAttributeResponseType(pd::ETree)
    o = ResetNetworkInterfaceAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Vector{ASCIIString}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int64, Nothing)
    allowReassignment::Union(Bool, Nothing)

    AssignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing, allowReassignment=nothing) = 
         new(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment)
end
function AssignPrivateIpAddressesType(pd::ETree)
    o = AssignPrivateIpAddressesType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.privateIpAddressesSet = AWS.parse_vector_as(ASCIIString, "privateIpAddress", find(pd, "item/privateIpAddress"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, find(pd, "secondaryPrivateIpAddressCount#string"))
    o.allowReassignment = AWS.safe_parse_as(Bool, find(pd, "allowReassignment#string"))
    o
end

export AssignPrivateIpAddressesType


type AssignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    AssignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function AssignPrivateIpAddressesResponseType(pd::ETree)
    o = AssignPrivateIpAddressesResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesType
    networkInterfaceId::Union(ASCIIString, Nothing)
    privateIpAddressesSet::Union(Vector{ASCIIString}, Nothing)

    UnassignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, privateIpAddressesSet)
end
function UnassignPrivateIpAddressesType(pd::ETree)
    o = UnassignPrivateIpAddressesType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.privateIpAddressesSet = AWS.parse_vector_as(ASCIIString, "privateIpAddress", find(pd, "item/privateIpAddress"))
    o
end

export UnassignPrivateIpAddressesType


type UnassignPrivateIpAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    UnassignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function UnassignPrivateIpAddressesResponseType(pd::ETree)
    o = UnassignPrivateIpAddressesResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::Union(ASCIIString, Nothing)

    AssignPrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing) = 
         new(privateIpAddress)
end
function AssignPrivateIpAddressesSetItemRequestType(pd::ETree)
    o = AssignPrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o
end

export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)

    VolumeStatusDetailsItemType(; name=nothing, status=nothing) = 
         new(name, status)
end
function VolumeStatusDetailsItemType(pd::ETree)
    o = VolumeStatusDetailsItemType()
    o.name = find(pd, "name#string")
    o.status = find(pd, "status#string")
    o
end

export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::Union(ASCIIString, Nothing)
    notBefore::Union(CalendarTime, Nothing)
    notAfter::Union(CalendarTime, Nothing)
    eventId::Union(ASCIIString, Nothing)
    eventType::Union(ASCIIString, Nothing)

    VolumeStatusEventItemType(; description=nothing, notBefore=nothing, notAfter=nothing, eventId=nothing, eventType=nothing) = 
         new(description, notBefore, notAfter, eventId, eventType)
end
function VolumeStatusEventItemType(pd::ETree)
    o = VolumeStatusEventItemType()
    o.description = find(pd, "description#string")
    o.notBefore = AWS.safe_parse_as(CalendarTime, find(pd, "notBefore#string"))
    o.notAfter = AWS.safe_parse_as(CalendarTime, find(pd, "notAfter#string"))
    o.eventId = find(pd, "eventId#string")
    o.eventType = find(pd, "eventType#string")
    o
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
function VolumeStatusActionItemType(pd::ETree)
    o = VolumeStatusActionItemType()
    o.description = find(pd, "description#string")
    o.code = find(pd, "code#string")
    o.eventId = find(pd, "eventId#string")
    o.eventType = find(pd, "eventType#string")
    o
end

export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::Union(ASCIIString, Nothing)

    EnableVolumeIOType(; volumeId=nothing) = 
         new(volumeId)
end
function EnableVolumeIOType(pd::ETree)
    o = EnableVolumeIOType()
    o.volumeId = find(pd, "volumeId#string")
    o
end

export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    EnableVolumeIOResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function EnableVolumeIOResponseType(pd::ETree)
    o = EnableVolumeIOResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    ModifyVolumeAttributeType(; volumeId=nothing) = 
         new(volumeId)
end
function ModifyVolumeAttributeType(pd::ETree)
    o = ModifyVolumeAttributeType()
    o.volumeId = find(pd, "volumeId#string")
    o
end

export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    _return::Union(Bool, Nothing)

    ModifyVolumeAttributeResponseType(; requestId=nothing, _return=nothing) = 
         new(requestId, _return)
end
function ModifyVolumeAttributeResponseType(pd::ETree)
    o = ModifyVolumeAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, find(pd, "return#string"))
    o
end

export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeType(; volumeId=nothing) = 
         new(volumeId)
end
function DescribeVolumeAttributeType(pd::ETree)
    o = DescribeVolumeAttributeType()
    o.volumeId = find(pd, "volumeId#string")
    o
end

export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)

    DescribeVolumeAttributeResponseType(; requestId=nothing, volumeId=nothing) = 
         new(requestId, volumeId)
end
function DescribeVolumeAttributeResponseType(pd::ETree)
    o = DescribeVolumeAttributeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeId = find(pd, "volumeId#string")
    o
end

export DescribeVolumeAttributeResponseType


type DescribeLicensesType
    licenseIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeLicensesType(; licenseIdSet=nothing, filterSet=nothing) = 
         new(licenseIdSet, filterSet)
end
function DescribeLicensesType(pd::ETree)
    o = DescribeLicensesType()
    o.licenseIdSet = AWS.parse_vector_as(ASCIIString, "licenseId", find(pd, "item/licenseId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeLicensesType


type CreateNetworkInterfaceType
    subnetId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{ASCIIString}, Nothing)
    privateIpAddressesSet::Union(Vector{PrivateIpAddressesSetItemRequestType}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int64, Nothing)

    CreateNetworkInterfaceType(; subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) = 
         new(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function CreateNetworkInterfaceType(pd::ETree)
    o = CreateNetworkInterfaceType()
    o.subnetId = find(pd, "subnetId#string")
    o.description = find(pd, "description#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.groupSet = AWS.parse_vector_as(ASCIIString, "groupId", find(pd, "item/groupId"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, find(pd, "privateIpAddressesSet/item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, find(pd, "secondaryPrivateIpAddressCount#string"))
    o
end

export CreateNetworkInterfaceType


type DescribeAccountAttributesResponseType
    requestId::Union(ASCIIString, Nothing)
    accountAttributeSet::Union(Vector{AccountAttributeSetItemType}, Nothing)

    DescribeAccountAttributesResponseType(; requestId=nothing, accountAttributeSet=nothing) = 
         new(requestId, accountAttributeSet)
end
function DescribeAccountAttributesResponseType(pd::ETree)
    o = DescribeAccountAttributesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.accountAttributeSet = AWS.@parse_vector(AWS.EC2.AccountAttributeSetItemType, find(pd, "accountAttributeSet/item"))
    o
end

export DescribeAccountAttributesResponseType


type InstanceStateChangeType
    instanceId::Union(ASCIIString, Nothing)
    currentState::Union(InstanceStateType, Nothing)
    previousState::Union(InstanceStateType, Nothing)

    InstanceStateChangeType(; instanceId=nothing, currentState=nothing, previousState=nothing) = 
         new(instanceId, currentState, previousState)
end
function InstanceStateChangeType(pd::ETree)
    o = InstanceStateChangeType()
    o.instanceId = find(pd, "instanceId#string")
    o.currentState = length(pd["currentState"]) > 0 ?  InstanceStateType(find(pd,"currentState[1]")) : nothing
    o.previousState = length(pd["previousState"]) > 0 ?  InstanceStateType(find(pd,"previousState[1]")) : nothing
    o
end

export InstanceStateChangeType


type IpPermissionType
    ipProtocol::Union(ASCIIString, Nothing)
    fromPort::Union(Int64, Nothing)
    toPort::Union(Int64, Nothing)
    groups::Union(Vector{UserIdGroupPairType}, Nothing)
    ipRanges::Union(Vector{ASCIIString}, Nothing)

    IpPermissionType(; ipProtocol=nothing, fromPort=nothing, toPort=nothing, groups=nothing, ipRanges=nothing) = 
         new(ipProtocol, fromPort, toPort, groups, ipRanges)
end
function IpPermissionType(pd::ETree)
    o = IpPermissionType()
    o.ipProtocol = find(pd, "ipProtocol#string")
    o.fromPort = AWS.safe_parse_as(Int64, find(pd, "fromPort#string"))
    o.toPort = AWS.safe_parse_as(Int64, find(pd, "toPort#string"))
    o.groups = AWS.@parse_vector(AWS.EC2.UserIdGroupPairType, find(pd, "groups/item"))
    o.ipRanges = AWS.parse_vector_as(ASCIIString, "cidrIp", find(pd, "item/cidrIp"))
    o
end

export IpPermissionType


type RevokeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Vector{IpPermissionType}, Nothing)

    RevokeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) = 
         new(groupId, ipPermissions)
end
function RevokeSecurityGroupEgressType(pd::ETree)
    o = RevokeSecurityGroupEgressType()
    o.groupId = find(pd, "groupId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissions/item"))
    o
end

export RevokeSecurityGroupEgressType


type InternetGatewayType
    internetGatewayId::Union(ASCIIString, Nothing)
    attachmentSet::Union(Vector{InternetGatewayAttachmentType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    InternetGatewayType(; internetGatewayId=nothing, attachmentSet=nothing, tagSet=nothing) = 
         new(internetGatewayId, attachmentSet, tagSet)
end
function InternetGatewayType(pd::ETree)
    o = InternetGatewayType()
    o.internetGatewayId = find(pd, "internetGatewayId#string")
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.InternetGatewayAttachmentType, find(pd, "attachmentSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export InternetGatewayType


type NetworkAclEntryType
    ruleNumber::Union(Int64, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    NetworkAclEntryType(; ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function NetworkAclEntryType(pd::ETree)
    o = NetworkAclEntryType()
    o.ruleNumber = AWS.safe_parse_as(Int64, find(pd, "ruleNumber#string"))
    o.protocol = find(pd, "protocol#string")
    o.ruleAction = find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, find(pd, "egress#string"))
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(find(pd,"portRange[1]")) : nothing
    o
end

export NetworkAclEntryType


type CustomerGatewayType
    customerGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    ipAddress::Union(ASCIIString, Nothing)
    bgpAsn::Union(Int64, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    CustomerGatewayType(; customerGatewayId=nothing, state=nothing, _type=nothing, ipAddress=nothing, bgpAsn=nothing, tagSet=nothing) = 
         new(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet)
end
function CustomerGatewayType(pd::ETree)
    o = CustomerGatewayType()
    o.customerGatewayId = find(pd, "customerGatewayId#string")
    o.state = find(pd, "state#string")
    o._type = find(pd, "type#string")
    o.ipAddress = find(pd, "ipAddress#string")
    o.bgpAsn = AWS.safe_parse_as(Int64, find(pd, "bgpAsn#string"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export CustomerGatewayType


type RouteTableType
    routeTableId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    routeSet::Union(Vector{RouteType}, Nothing)
    associationSet::Union(Vector{RouteTableAssociationType}, Nothing)
    propagatingVgwSet::Union(Vector{ASCIIString}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    RouteTableType(; routeTableId=nothing, vpcId=nothing, routeSet=nothing, associationSet=nothing, propagatingVgwSet=nothing, tagSet=nothing) = 
         new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet)
end
function RouteTableType(pd::ETree)
    o = RouteTableType()
    o.routeTableId = find(pd, "routeTableId#string")
    o.vpcId = find(pd, "vpcId#string")
    o.routeSet = AWS.@parse_vector(AWS.EC2.RouteType, find(pd, "routeSet/item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.RouteTableAssociationType, find(pd, "associationSet/item"))
    o.propagatingVgwSet = AWS.parse_vector_as(ASCIIString, "gatewayId", find(pd, "item/gatewayId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export RouteTableType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)

    InstancePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) = 
         new(privateIpAddress, privateDnsName, primary, association)
end
function InstancePrivateIpAddressesSetItemType(pd::ETree)
    o = InstancePrivateIpAddressesSetItemType()
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.privateDnsName = find(pd, "privateDnsName#string")
    o.primary = AWS.safe_parse_as(Bool, find(pd, "primary#string"))
    o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(find(pd,"association[1]")) : nothing
    o
end

export InstancePrivateIpAddressesSetItemType


type DescribeTagsResponseType
    requestId::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{TagSetItemType}, Nothing)

    DescribeTagsResponseType(; requestId=nothing, tagSet=nothing) = 
         new(requestId, tagSet)
end
function DescribeTagsResponseType(pd::ETree)
    o = DescribeTagsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.TagSetItemType, find(pd, "tagSet/item"))
    o
end

export DescribeTagsResponseType


type CreateRouteTableResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTable::Union(RouteTableType, Nothing)

    CreateRouteTableResponseType(; requestId=nothing, routeTable=nothing) = 
         new(requestId, routeTable)
end
function CreateRouteTableResponseType(pd::ETree)
    o = CreateRouteTableResponseType()
    o.requestId = find(pd, "requestId#string")
    o.routeTable = length(pd["routeTable"]) > 0 ?  RouteTableType(find(pd,"routeTable[1]")) : nothing
    o
end

export CreateRouteTableResponseType


type DescribeAvailabilityZonesResponseType
    requestId::Union(ASCIIString, Nothing)
    availabilityZoneInfo::Union(Vector{AvailabilityZoneItemType}, Nothing)

    DescribeAvailabilityZonesResponseType(; requestId=nothing, availabilityZoneInfo=nothing) = 
         new(requestId, availabilityZoneInfo)
end
function DescribeAvailabilityZonesResponseType(pd::ETree)
    o = DescribeAvailabilityZonesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.availabilityZoneInfo = AWS.@parse_vector(AWS.EC2.AvailabilityZoneItemType, find(pd, "availabilityZoneInfo/item"))
    o
end

export DescribeAvailabilityZonesResponseType


type DescribeVolumesType
    volumeSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeVolumesType(; volumeSet=nothing, filterSet=nothing) = 
         new(volumeSet, filterSet)
end
function DescribeVolumesType(pd::ETree)
    o = DescribeVolumesType()
    o.volumeSet = AWS.parse_vector_as(ASCIIString, "volumeId", find(pd, "item/volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeVolumesType


type RegisterImageType
    imageLocation::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    architecture::Union(ASCIIString, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    rootDeviceName::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)

    RegisterImageType(; imageLocation=nothing, name=nothing, description=nothing, architecture=nothing, kernelId=nothing, ramdiskId=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing) = 
         new(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping)
end
function RegisterImageType(pd::ETree)
    o = RegisterImageType()
    o.imageLocation = find(pd, "imageLocation#string")
    o.name = find(pd, "name#string")
    o.description = find(pd, "description#string")
    o.architecture = find(pd, "architecture#string")
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.rootDeviceName = find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o
end

export RegisterImageType


type SubnetType
    subnetId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    availableIpAddressCount::Union(Int64, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    defaultForAz::Union(Bool, Nothing)
    mapPublicIpOnLaunch::Union(Bool, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    SubnetType(; subnetId=nothing, state=nothing, vpcId=nothing, cidrBlock=nothing, availableIpAddressCount=nothing, availabilityZone=nothing, defaultForAz=nothing, mapPublicIpOnLaunch=nothing, tagSet=nothing) = 
         new(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet)
end
function SubnetType(pd::ETree)
    o = SubnetType()
    o.subnetId = find(pd, "subnetId#string")
    o.state = find(pd, "state#string")
    o.vpcId = find(pd, "vpcId#string")
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.availableIpAddressCount = AWS.safe_parse_as(Int64, find(pd, "availableIpAddressCount#string"))
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.defaultForAz = AWS.safe_parse_as(Bool, find(pd, "defaultForAz#string"))
    o.mapPublicIpOnLaunch = AWS.safe_parse_as(Bool, find(pd, "mapPublicIpOnLaunch#string"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export SubnetType


type CreateInstanceExportTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTask::Union(ExportTaskResponseType, Nothing)

    CreateInstanceExportTaskResponseType(; requestId=nothing, exportTask=nothing) = 
         new(requestId, exportTask)
end
function CreateInstanceExportTaskResponseType(pd::ETree)
    o = CreateInstanceExportTaskResponseType()
    o.requestId = find(pd, "requestId#string")
    o.exportTask = length(pd["exportTask"]) > 0 ?  ExportTaskResponseType(find(pd,"exportTask[1]")) : nothing
    o
end

export CreateInstanceExportTaskResponseType


type DiskImageType
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    DiskImageType(; image=nothing, description=nothing, volume=nothing) = 
         new(image, description, volume)
end
function DiskImageType(pd::ETree)
    o = DiskImageType()
    o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(find(pd,"image[1]")) : nothing
    o.description = find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(find(pd,"volume[1]")) : nothing
    o
end

export DiskImageType


type DescribeKeyPairsType
    keySet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeKeyPairsType(; keySet=nothing, filterSet=nothing) = 
         new(keySet, filterSet)
end
function DescribeKeyPairsType(pd::ETree)
    o = DescribeKeyPairsType()
    o.keySet = AWS.parse_vector_as(ASCIIString, "keyName", find(pd, "item/keyName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeKeyPairsType


type DescribeReservedInstancesOfferingsType
    reservedInstancesOfferingsSet::Union(Vector{ASCIIString}, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    offeringType::Union(ASCIIString, Nothing)
    includeMarketplace::Union(Bool, Nothing)
    minDuration::Union(Int64, Nothing)
    maxDuration::Union(Int64, Nothing)
    maxInstanceCount::Union(Int64, Nothing)
    nextToken::Union(ASCIIString, Nothing)
    maxResults::Union(Int64, Nothing)

    DescribeReservedInstancesOfferingsType(; reservedInstancesOfferingsSet=nothing, instanceType=nothing, availabilityZone=nothing, productDescription=nothing, filterSet=nothing, instanceTenancy=nothing, offeringType=nothing, includeMarketplace=nothing, minDuration=nothing, maxDuration=nothing, maxInstanceCount=nothing, nextToken=nothing, maxResults=nothing) = 
         new(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults)
end
function DescribeReservedInstancesOfferingsType(pd::ETree)
    o = DescribeReservedInstancesOfferingsType()
    o.reservedInstancesOfferingsSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesOfferingId", find(pd, "item/reservedInstancesOfferingId"))
    o.instanceType = find(pd, "instanceType#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.productDescription = find(pd, "productDescription#string")
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o.instanceTenancy = find(pd, "instanceTenancy#string")
    o.offeringType = find(pd, "offeringType#string")
    o.includeMarketplace = AWS.safe_parse_as(Bool, find(pd, "includeMarketplace#string"))
    o.minDuration = AWS.safe_parse_as(Int64, find(pd, "minDuration#string"))
    o.maxDuration = AWS.safe_parse_as(Int64, find(pd, "maxDuration#string"))
    o.maxInstanceCount = AWS.safe_parse_as(Int64, find(pd, "maxInstanceCount#string"))
    o.nextToken = find(pd, "nextToken#string")
    o.maxResults = AWS.safe_parse_as(Int64, find(pd, "maxResults#string"))
    o
end

export DescribeReservedInstancesOfferingsType


type DescribeRouteTablesType
    routeTableIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeRouteTablesType(; routeTableIdSet=nothing, filterSet=nothing) = 
         new(routeTableIdSet, filterSet)
end
function DescribeRouteTablesType(pd::ETree)
    o = DescribeRouteTablesType()
    o.routeTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", find(pd, "item/routeTableId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeRouteTablesType


type DescribeSnapshotsSetItemResponseType
    snapshotId::Union(ASCIIString, Nothing)
    volumeId::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    startTime::Union(CalendarTime, Nothing)
    progress::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    volumeSize::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    ownerAlias::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    DescribeSnapshotsSetItemResponseType(; snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing, ownerAlias=nothing, tagSet=nothing) = 
         new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet)
end
function DescribeSnapshotsSetItemResponseType(pd::ETree)
    o = DescribeSnapshotsSetItemResponseType()
    o.snapshotId = find(pd, "snapshotId#string")
    o.volumeId = find(pd, "volumeId#string")
    o.status = find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(CalendarTime, find(pd, "startTime#string"))
    o.progress = find(pd, "progress#string")
    o.ownerId = find(pd, "ownerId#string")
    o.volumeSize = find(pd, "volumeSize#string")
    o.description = find(pd, "description#string")
    o.ownerAlias = find(pd, "ownerAlias#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export DescribeSnapshotsSetItemResponseType


type DescribeAvailabilityZonesType
    availabilityZoneSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeAvailabilityZonesType(; availabilityZoneSet=nothing, filterSet=nothing) = 
         new(availabilityZoneSet, filterSet)
end
function DescribeAvailabilityZonesType(pd::ETree)
    o = DescribeAvailabilityZonesType()
    o.availabilityZoneSet = AWS.parse_vector_as(ASCIIString, "zoneName", find(pd, "item/zoneName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeAvailabilityZonesType


type DescribePlacementGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    placementGroupSet::Union(Vector{PlacementGroupInfoType}, Nothing)

    DescribePlacementGroupsResponseType(; requestId=nothing, placementGroupSet=nothing) = 
         new(requestId, placementGroupSet)
end
function DescribePlacementGroupsResponseType(pd::ETree)
    o = DescribePlacementGroupsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.placementGroupSet = AWS.@parse_vector(AWS.EC2.PlacementGroupInfoType, find(pd, "placementGroupSet/item"))
    o
end

export DescribePlacementGroupsResponseType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing, filterSet=nothing) = 
         new(spotInstanceRequestIdSet, filterSet)
end
function DescribeSpotInstanceRequestsType(pd::ETree)
    o = DescribeSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(ASCIIString, "spotInstanceRequestId", find(pd, "item/spotInstanceRequestId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeSpotInstanceRequestsType


type CreateNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int64, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    CreateNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function CreateNetworkAclEntryType(pd::ETree)
    o = CreateNetworkAclEntryType()
    o.networkAclId = find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, find(pd, "ruleNumber#string"))
    o.protocol = find(pd, "protocol#string")
    o.ruleAction = find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, find(pd, "egress#string"))
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(find(pd,"portRange[1]")) : nothing
    o
end

export CreateNetworkAclEntryType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeDhcpOptionsType(; dhcpOptionsSet=nothing, filterSet=nothing) = 
         new(dhcpOptionsSet, filterSet)
end
function DescribeDhcpOptionsType(pd::ETree)
    o = DescribeDhcpOptionsType()
    o.dhcpOptionsSet = AWS.parse_vector_as(ASCIIString, "dhcpOptionsId", find(pd, "item/dhcpOptionsId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeDhcpOptionsType


type ImportVolumeTaskDetailsType
    bytesConverted::Union(Int64, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    image::Union(DiskImageDescriptionType, Nothing)
    volume::Union(DiskImageVolumeDescriptionType, Nothing)

    ImportVolumeTaskDetailsType(; bytesConverted=nothing, availabilityZone=nothing, description=nothing, image=nothing, volume=nothing) = 
         new(bytesConverted, availabilityZone, description, image, volume)
end
function ImportVolumeTaskDetailsType(pd::ETree)
    o = ImportVolumeTaskDetailsType()
    o.bytesConverted = AWS.safe_parse_as(Int64, find(pd, "bytesConverted#string"))
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.description = find(pd, "description#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(find(pd,"image[1]")) : nothing
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(find(pd,"volume[1]")) : nothing
    o
end

export ImportVolumeTaskDetailsType


type AuthorizeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Vector{IpPermissionType}, Nothing)

    AuthorizeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) = 
         new(userId, ipPermissions)
end
function AuthorizeSecurityGroupIngressType(pd::ETree)
    o = AuthorizeSecurityGroupIngressType()
    o.userId = find(pd, "userId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissions/item"))
    o
end

export AuthorizeSecurityGroupIngressType


type VolumeStatusInfoType
    status::Union(ASCIIString, Nothing)
    details::Union(Vector{VolumeStatusDetailsItemType}, Nothing)

    VolumeStatusInfoType(; status=nothing, details=nothing) = 
         new(status, details)
end
function VolumeStatusInfoType(pd::ETree)
    o = VolumeStatusInfoType()
    o.status = find(pd, "status#string")
    o.details = AWS.@parse_vector(AWS.EC2.VolumeStatusDetailsItemType, find(pd, "details/item"))
    o
end

export VolumeStatusInfoType


type DescribeImagesResponseItemType
    imageId::Union(ASCIIString, Nothing)
    imageLocation::Union(ASCIIString, Nothing)
    imageState::Union(ASCIIString, Nothing)
    imageOwnerId::Union(ASCIIString, Nothing)
    isPublic::Union(Bool, Nothing)
    productCodes::Union(Vector{ProductCodesSetItemType}, Nothing)
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
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)
    virtualizationType::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    hypervisor::Union(ASCIIString, Nothing)

    DescribeImagesResponseItemType(; imageId=nothing, imageLocation=nothing, imageState=nothing, imageOwnerId=nothing, isPublic=nothing, productCodes=nothing, architecture=nothing, imageType=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, stateReason=nothing, imageOwnerAlias=nothing, name=nothing, description=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, virtualizationType=nothing, tagSet=nothing, hypervisor=nothing) = 
         new(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor)
end
function DescribeImagesResponseItemType(pd::ETree)
    o = DescribeImagesResponseItemType()
    o.imageId = find(pd, "imageId#string")
    o.imageLocation = find(pd, "imageLocation#string")
    o.imageState = find(pd, "imageState#string")
    o.imageOwnerId = find(pd, "imageOwnerId#string")
    o.isPublic = AWS.safe_parse_as(Bool, find(pd, "isPublic#string"))
    o.productCodes = AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, find(pd, "productCodes/item"))
    o.architecture = find(pd, "architecture#string")
    o.imageType = find(pd, "imageType#string")
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.platform = find(pd, "platform#string")
    o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(find(pd,"stateReason[1]")) : nothing
    o.imageOwnerAlias = find(pd, "imageOwnerAlias#string")
    o.name = find(pd, "name#string")
    o.description = find(pd, "description#string")
    o.rootDeviceType = find(pd, "rootDeviceType#string")
    o.rootDeviceName = find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o.virtualizationType = find(pd, "virtualizationType#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.hypervisor = find(pd, "hypervisor#string")
    o
end

export DescribeImagesResponseItemType


type TerminateInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Vector{InstanceStateChangeType}, Nothing)

    TerminateInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
function TerminateInstancesResponseType(pd::ETree)
    o = TerminateInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, find(pd, "instancesSet/item"))
    o
end

export TerminateInstancesResponseType


type DescribeKeyPairsResponseType
    requestId::Union(ASCIIString, Nothing)
    keySet::Union(Vector{DescribeKeyPairsResponseItemType}, Nothing)

    DescribeKeyPairsResponseType(; requestId=nothing, keySet=nothing) = 
         new(requestId, keySet)
end
function DescribeKeyPairsResponseType(pd::ETree)
    o = DescribeKeyPairsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.keySet = AWS.@parse_vector(AWS.EC2.DescribeKeyPairsResponseItemType, find(pd, "keySet/item"))
    o
end

export DescribeKeyPairsResponseType


type RevokeSecurityGroupIngressType
    userId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Vector{IpPermissionType}, Nothing)

    RevokeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) = 
         new(userId, ipPermissions)
end
function RevokeSecurityGroupIngressType(pd::ETree)
    o = RevokeSecurityGroupIngressType()
    o.userId = find(pd, "userId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissions/item"))
    o
end

export RevokeSecurityGroupIngressType


type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    start::Union(CalendarTime, Nothing)
    duration::Union(Int64, Nothing)
    fixedPrice::Union(Float64, Nothing)
    usagePrice::Union(Float64, Nothing)
    instanceCount::Union(Int64, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    currencyCode::Union(ASCIIString, Nothing)
    offeringType::Union(ASCIIString, Nothing)
    recurringCharges::Union(Vector{RecurringChargesSetItemType}, Nothing)

    DescribeReservedInstancesResponseSetItemType(; reservedInstancesId=nothing, instanceType=nothing, availabilityZone=nothing, start=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, instanceCount=nothing, productDescription=nothing, state=nothing, tagSet=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing) = 
         new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges)
end
function DescribeReservedInstancesResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesResponseSetItemType()
    o.reservedInstancesId = find(pd, "reservedInstancesId#string")
    o.instanceType = find(pd, "instanceType#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.start = AWS.safe_parse_as(CalendarTime, find(pd, "start#string"))
    o.duration = AWS.safe_parse_as(Int64, find(pd, "duration#string"))
    o.fixedPrice = AWS.safe_parse_as(Float64, find(pd, "fixedPrice#string"))
    o.usagePrice = AWS.safe_parse_as(Float64, find(pd, "usagePrice#string"))
    o.instanceCount = AWS.safe_parse_as(Int64, find(pd, "instanceCount#string"))
    o.productDescription = find(pd, "productDescription#string")
    o.state = find(pd, "state#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.instanceTenancy = find(pd, "instanceTenancy#string")
    o.currencyCode = find(pd, "currencyCode#string")
    o.offeringType = find(pd, "offeringType#string")
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, find(pd, "recurringCharges/item"))
    o
end

export DescribeReservedInstancesResponseSetItemType


type CreateTagsType
    resourcesSet::Union(Vector{ASCIIString}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    CreateTagsType(; resourcesSet=nothing, tagSet=nothing) = 
         new(resourcesSet, tagSet)
end
function CreateTagsType(pd::ETree)
    o = CreateTagsType()
    o.resourcesSet = AWS.parse_vector_as(ASCIIString, "resourceId", find(pd, "item/resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export CreateTagsType


type DescribeNetworkAclsType
    networkAclIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeNetworkAclsType(; networkAclIdSet=nothing, filterSet=nothing) = 
         new(networkAclIdSet, filterSet)
end
function DescribeNetworkAclsType(pd::ETree)
    o = DescribeNetworkAclsType()
    o.networkAclIdSet = AWS.parse_vector_as(ASCIIString, "networkAclId", find(pd, "item/networkAclId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeNetworkAclsType


type NetworkAclType
    networkAclId::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    default::Union(Bool, Nothing)
    entrySet::Union(Vector{NetworkAclEntryType}, Nothing)
    associationSet::Union(Vector{NetworkAclAssociationType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    NetworkAclType(; networkAclId=nothing, vpcId=nothing, default=nothing, entrySet=nothing, associationSet=nothing, tagSet=nothing) = 
         new(networkAclId, vpcId, default, entrySet, associationSet, tagSet)
end
function NetworkAclType(pd::ETree)
    o = NetworkAclType()
    o.networkAclId = find(pd, "networkAclId#string")
    o.vpcId = find(pd, "vpcId#string")
    o.default = AWS.safe_parse_as(Bool, find(pd, "default#string"))
    o.entrySet = AWS.@parse_vector(AWS.EC2.NetworkAclEntryType, find(pd, "entrySet/item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.NetworkAclAssociationType, find(pd, "associationSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export NetworkAclType


type DescribeExportTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    exportTaskSet::Union(Vector{ExportTaskResponseType}, Nothing)

    DescribeExportTasksResponseType(; requestId=nothing, exportTaskSet=nothing) = 
         new(requestId, exportTaskSet)
end
function DescribeExportTasksResponseType(pd::ETree)
    o = DescribeExportTasksResponseType()
    o.requestId = find(pd, "requestId#string")
    o.exportTaskSet = AWS.@parse_vector(AWS.EC2.ExportTaskResponseType, find(pd, "exportTaskSet/item"))
    o
end

export DescribeExportTasksResponseType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int64, Nothing)
    limitPrice::Union(ReservedInstanceLimitPriceType, Nothing)

    PurchaseReservedInstancesOfferingType(; reservedInstancesOfferingId=nothing, instanceCount=nothing, limitPrice=nothing) = 
         new(reservedInstancesOfferingId, instanceCount, limitPrice)
end
function PurchaseReservedInstancesOfferingType(pd::ETree)
    o = PurchaseReservedInstancesOfferingType()
    o.reservedInstancesOfferingId = find(pd, "reservedInstancesOfferingId#string")
    o.instanceCount = AWS.safe_parse_as(Int64, find(pd, "instanceCount#string"))
    o.limitPrice = length(pd["limitPrice"]) > 0 ?  ReservedInstanceLimitPriceType(find(pd,"limitPrice[1]")) : nothing
    o
end

export PurchaseReservedInstancesOfferingType


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
    groupSet::Union(Vector{GroupItemType}, Nothing)
    attachment::Union(InstanceNetworkInterfaceAttachmentType, Nothing)
    association::Union(InstanceNetworkInterfaceAssociationType, Nothing)
    privateIpAddressesSet::Union(Vector{InstancePrivateIpAddressesSetItemType}, Nothing)

    InstanceNetworkInterfaceSetItemType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, description=nothing, ownerId=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet)
end
function InstanceNetworkInterfaceSetItemType(pd::ETree)
    o = InstanceNetworkInterfaceSetItemType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.subnetId = find(pd, "subnetId#string")
    o.vpcId = find(pd, "vpcId#string")
    o.description = find(pd, "description#string")
    o.ownerId = find(pd, "ownerId#string")
    o.status = find(pd, "status#string")
    o.macAddress = find(pd, "macAddress#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.privateDnsName = find(pd, "privateDnsName#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.attachment = length(pd["attachment"]) > 0 ?  InstanceNetworkInterfaceAttachmentType(find(pd,"attachment[1]")) : nothing
    o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(find(pd,"association[1]")) : nothing
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.InstancePrivateIpAddressesSetItemType, find(pd, "privateIpAddressesSet/item"))
    o
end

export InstanceNetworkInterfaceSetItemType


type DescribeSecurityGroupsType
    securityGroupSet::Union(Vector{ASCIIString}, Nothing)
    securityGroupIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeSecurityGroupsType(; securityGroupSet=nothing, securityGroupIdSet=nothing, filterSet=nothing) = 
         new(securityGroupSet, securityGroupIdSet, filterSet)
end
function DescribeSecurityGroupsType(pd::ETree)
    o = DescribeSecurityGroupsType()
    o.securityGroupSet = AWS.parse_vector_as(ASCIIString, "groupName", find(pd, "item/groupName"))
    o.securityGroupIdSet = AWS.parse_vector_as(ASCIIString, "groupId", find(pd, "item/groupId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeSecurityGroupsType


type StopInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Vector{InstanceStateChangeType}, Nothing)

    StopInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
function StopInstancesResponseType(pd::ETree)
    o = StopInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, find(pd, "instancesSet/item"))
    o
end

export StopInstancesResponseType


type CreateImageType
    instanceId::Union(ASCIIString, Nothing)
    name::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    noReboot::Union(Bool, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)

    CreateImageType(; instanceId=nothing, name=nothing, description=nothing, noReboot=nothing, blockDeviceMapping=nothing) = 
         new(instanceId, name, description, noReboot, blockDeviceMapping)
end
function CreateImageType(pd::ETree)
    o = CreateImageType()
    o.instanceId = find(pd, "instanceId#string")
    o.name = find(pd, "name#string")
    o.description = find(pd, "description#string")
    o.noReboot = AWS.safe_parse_as(Bool, find(pd, "noReboot#string"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o
end

export CreateImageType


type DescribeVpcsType
    vpcSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeVpcsType(; vpcSet=nothing, filterSet=nothing) = 
         new(vpcSet, filterSet)
end
function DescribeVpcsType(pd::ETree)
    o = DescribeVpcsType()
    o.vpcSet = AWS.parse_vector_as(ASCIIString, "vpcId", find(pd, "item/vpcId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeVpcsType


type CreateDhcpOptionsType
    dhcpConfigurationSet::Union(Vector{DhcpConfigurationItemType}, Nothing)

    CreateDhcpOptionsType(; dhcpConfigurationSet=nothing) = 
         new(dhcpConfigurationSet)
end
function CreateDhcpOptionsType(pd::ETree)
    o = CreateDhcpOptionsType()
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, find(pd, "dhcpConfigurationSet/item"))
    o
end

export CreateDhcpOptionsType


type CreateVolumePermissionOperationType
    add::Union(Vector{CreateVolumePermissionItemType}, Nothing)
    remove::Union(Vector{CreateVolumePermissionItemType}, Nothing)

    CreateVolumePermissionOperationType(; add=nothing, remove=nothing) = 
         new(add, remove)
end
function CreateVolumePermissionOperationType(pd::ETree)
    o = CreateVolumePermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, find(pd, "add/item"))
    o.remove = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, find(pd, "remove/item"))
    o
end

export CreateVolumePermissionOperationType


type SpotDatafeedSubscriptionType
    ownerId::Union(ASCIIString, Nothing)
    bucket::Union(ASCIIString, Nothing)
    prefix::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    fault::Union(SpotInstanceStateFaultType, Nothing)

    SpotDatafeedSubscriptionType(; ownerId=nothing, bucket=nothing, prefix=nothing, state=nothing, fault=nothing) = 
         new(ownerId, bucket, prefix, state, fault)
end
function SpotDatafeedSubscriptionType(pd::ETree)
    o = SpotDatafeedSubscriptionType()
    o.ownerId = find(pd, "ownerId#string")
    o.bucket = find(pd, "bucket#string")
    o.prefix = find(pd, "prefix#string")
    o.state = find(pd, "state#string")
    o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(find(pd,"fault[1]")) : nothing
    o
end

export SpotDatafeedSubscriptionType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    DescribeSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) = 
         new(requestId, spotDatafeedSubscription)
end
function DescribeSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = DescribeSpotDatafeedSubscriptionResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(find(pd,"spotDatafeedSubscription[1]")) : nothing
    o
end

export DescribeSpotDatafeedSubscriptionResponseType


type DescribeInternetGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGatewaySet::Union(Vector{InternetGatewayType}, Nothing)

    DescribeInternetGatewaysResponseType(; requestId=nothing, internetGatewaySet=nothing) = 
         new(requestId, internetGatewaySet)
end
function DescribeInternetGatewaysResponseType(pd::ETree)
    o = DescribeInternetGatewaysResponseType()
    o.requestId = find(pd, "requestId#string")
    o.internetGatewaySet = AWS.@parse_vector(AWS.EC2.InternetGatewayType, find(pd, "internetGatewaySet/item"))
    o
end

export DescribeInternetGatewaysResponseType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeNetworkInterfacesType(; networkInterfaceIdSet=nothing, filterSet=nothing) = 
         new(networkInterfaceIdSet, filterSet)
end
function DescribeNetworkInterfacesType(pd::ETree)
    o = DescribeNetworkInterfacesType()
    o.networkInterfaceIdSet = AWS.parse_vector_as(ASCIIString, "networkInterfaceId", find(pd, "item/networkInterfaceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeNetworkInterfacesType


type DescribeInstancesType
    instancesSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeInstancesType(; instancesSet=nothing, filterSet=nothing) = 
         new(instancesSet, filterSet)
end
function DescribeInstancesType(pd::ETree)
    o = DescribeInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeInstancesType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeCustomerGatewaysType(; customerGatewaySet=nothing, filterSet=nothing) = 
         new(customerGatewaySet, filterSet)
end
function DescribeCustomerGatewaysType(pd::ETree)
    o = DescribeCustomerGatewaysType()
    o.customerGatewaySet = AWS.parse_vector_as(ASCIIString, "customerGatewayId", find(pd, "item/customerGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeCustomerGatewaysType


type ImportVolumeType
    availabilityZone::Union(ASCIIString, Nothing)
    image::Union(DiskImageDetailType, Nothing)
    description::Union(ASCIIString, Nothing)
    volume::Union(DiskImageVolumeType, Nothing)

    ImportVolumeType(; availabilityZone=nothing, image=nothing, description=nothing, volume=nothing) = 
         new(availabilityZone, image, description, volume)
end
function ImportVolumeType(pd::ETree)
    o = ImportVolumeType()
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(find(pd,"image[1]")) : nothing
    o.description = find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(find(pd,"volume[1]")) : nothing
    o
end

export ImportVolumeType


type DescribeSubnetsResponseType
    requestId::Union(ASCIIString, Nothing)
    subnetSet::Union(Vector{SubnetType}, Nothing)

    DescribeSubnetsResponseType(; requestId=nothing, subnetSet=nothing) = 
         new(requestId, subnetSet)
end
function DescribeSubnetsResponseType(pd::ETree)
    o = DescribeSubnetsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.subnetSet = AWS.@parse_vector(AWS.EC2.SubnetType, find(pd, "subnetSet/item"))
    o
end

export DescribeSubnetsResponseType


type DescribePlacementGroupsType
    placementGroupSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribePlacementGroupsType(; placementGroupSet=nothing, filterSet=nothing) = 
         new(placementGroupSet, filterSet)
end
function DescribePlacementGroupsType(pd::ETree)
    o = DescribePlacementGroupsType()
    o.placementGroupSet = AWS.parse_vector_as(ASCIIString, "groupName", find(pd, "item/groupName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribePlacementGroupsType


type DescribeRegionsResponseType
    requestId::Union(ASCIIString, Nothing)
    regionInfo::Union(Vector{RegionItemType}, Nothing)

    DescribeRegionsResponseType(; requestId=nothing, regionInfo=nothing) = 
         new(requestId, regionInfo)
end
function DescribeRegionsResponseType(pd::ETree)
    o = DescribeRegionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.regionInfo = AWS.@parse_vector(AWS.EC2.RegionItemType, find(pd, "regionInfo/item"))
    o
end

export DescribeRegionsResponseType


type DescribeVolumesSetItemResponseType
    volumeId::Union(ASCIIString, Nothing)
    size::Union(ASCIIString, Nothing)
    snapshotId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    status::Union(ASCIIString, Nothing)
    createTime::Union(CalendarTime, Nothing)
    attachmentSet::Union(Vector{AttachmentSetItemResponseType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    volumeType::Union(ASCIIString, Nothing)
    iops::Union(Int64, Nothing)

    DescribeVolumesSetItemResponseType(; volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, attachmentSet=nothing, tagSet=nothing, volumeType=nothing, iops=nothing) = 
         new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops)
end
function DescribeVolumesSetItemResponseType(pd::ETree)
    o = DescribeVolumesSetItemResponseType()
    o.volumeId = find(pd, "volumeId#string")
    o.size = find(pd, "size#string")
    o.snapshotId = find(pd, "snapshotId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.status = find(pd, "status#string")
    o.createTime = AWS.safe_parse_as(CalendarTime, find(pd, "createTime#string"))
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.AttachmentSetItemResponseType, find(pd, "attachmentSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.volumeType = find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, find(pd, "iops#string"))
    o
end

export DescribeVolumesSetItemResponseType


type DescribeSubnetsType
    subnetSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeSubnetsType(; subnetSet=nothing, filterSet=nothing) = 
         new(subnetSet, filterSet)
end
function DescribeSubnetsType(pd::ETree)
    o = DescribeSubnetsType()
    o.subnetSet = AWS.parse_vector_as(ASCIIString, "subnetId", find(pd, "item/subnetId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeSubnetsType


type CreateReservedInstancesListingType
    reservedInstancesId::Union(ASCIIString, Nothing)
    instanceCount::Union(Int64, Nothing)
    priceSchedules::Union(Vector{PriceScheduleRequestSetItemType}, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    CreateReservedInstancesListingType(; reservedInstancesId=nothing, instanceCount=nothing, priceSchedules=nothing, clientToken=nothing) = 
         new(reservedInstancesId, instanceCount, priceSchedules, clientToken)
end
function CreateReservedInstancesListingType(pd::ETree)
    o = CreateReservedInstancesListingType()
    o.reservedInstancesId = find(pd, "reservedInstancesId#string")
    o.instanceCount = AWS.safe_parse_as(Int64, find(pd, "instanceCount#string"))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleRequestSetItemType, find(pd, "priceSchedules/item"))
    o.clientToken = find(pd, "clientToken#string")
    o
end

export CreateReservedInstancesListingType


type DescribeAddressesType
    publicIpsSet::Union(Vector{ASCIIString}, Nothing)
    allocationIdsSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeAddressesType(; publicIpsSet=nothing, allocationIdsSet=nothing, filterSet=nothing) = 
         new(publicIpsSet, allocationIdsSet, filterSet)
end
function DescribeAddressesType(pd::ETree)
    o = DescribeAddressesType()
    o.publicIpsSet = AWS.parse_vector_as(ASCIIString, "publicIp", find(pd, "item/publicIp"))
    o.allocationIdsSet = AWS.parse_vector_as(ASCIIString, "allocationId", find(pd, "item/allocationId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeAddressesType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeVpnConnectionsType(; vpnConnectionSet=nothing, filterSet=nothing) = 
         new(vpnConnectionSet, filterSet)
end
function DescribeVpnConnectionsType(pd::ETree)
    o = DescribeVpnConnectionsType()
    o.vpnConnectionSet = AWS.parse_vector_as(ASCIIString, "vpnConnectionId", find(pd, "item/vpnConnectionId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeVpnConnectionsType


type DescribeReservedInstancesType
    reservedInstancesSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)
    offeringType::Union(ASCIIString, Nothing)

    DescribeReservedInstancesType(; reservedInstancesSet=nothing, filterSet=nothing, offeringType=nothing) = 
         new(reservedInstancesSet, filterSet, offeringType)
end
function DescribeReservedInstancesType(pd::ETree)
    o = DescribeReservedInstancesType()
    o.reservedInstancesSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesId", find(pd, "item/reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o.offeringType = find(pd, "offeringType#string")
    o
end

export DescribeReservedInstancesType


type ImportInstanceLaunchSpecificationType
    architecture::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{ImportInstanceGroupItemType}, Nothing)
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
function ImportInstanceLaunchSpecificationType(pd::ETree)
    o = ImportInstanceLaunchSpecificationType()
    o.architecture = find(pd, "architecture#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.ImportInstanceGroupItemType, find(pd, "groupSet/item"))
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(find(pd,"userData[1]")) : nothing
    o.instanceType = find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  InstancePlacementType(find(pd,"placement[1]")) : nothing
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(find(pd,"monitoring[1]")) : nothing
    o.subnetId = find(pd, "subnetId#string")
    o.instanceInitiatedShutdownBehavior = find(pd, "instanceInitiatedShutdownBehavior#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o
end

export ImportInstanceLaunchSpecificationType


type DeleteTagsType
    resourcesSet::Union(Vector{ASCIIString}, Nothing)
    tagSet::Union(Vector{DeleteTagsSetItemType}, Nothing)

    DeleteTagsType(; resourcesSet=nothing, tagSet=nothing) = 
         new(resourcesSet, tagSet)
end
function DeleteTagsType(pd::ETree)
    o = DeleteTagsType()
    o.resourcesSet = AWS.parse_vector_as(ASCIIString, "resourceId", find(pd, "item/resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.DeleteTagsSetItemType, find(pd, "tagSet/item"))
    o
end

export DeleteTagsType


type ReplaceNetworkAclEntryType
    networkAclId::Union(ASCIIString, Nothing)
    ruleNumber::Union(Int64, Nothing)
    protocol::Union(ASCIIString, Nothing)
    ruleAction::Union(ASCIIString, Nothing)
    egress::Union(Bool, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    icmpTypeCode::Union(IcmpTypeCodeType, Nothing)
    portRange::Union(PortRangeType, Nothing)

    ReplaceNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) = 
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function ReplaceNetworkAclEntryType(pd::ETree)
    o = ReplaceNetworkAclEntryType()
    o.networkAclId = find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, find(pd, "ruleNumber#string"))
    o.protocol = find(pd, "protocol#string")
    o.ruleAction = find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, find(pd, "egress#string"))
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(find(pd,"portRange[1]")) : nothing
    o
end

export ReplaceNetworkAclEntryType


type DescribeRegionsType
    regionSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeRegionsType(; regionSet=nothing, filterSet=nothing) = 
         new(regionSet, filterSet)
end
function DescribeRegionsType(pd::ETree)
    o = DescribeRegionsType()
    o.regionSet = AWS.parse_vector_as(ASCIIString, "regionName", find(pd, "item/regionName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeRegionsType


type VpcType
    vpcId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    cidrBlock::Union(ASCIIString, Nothing)
    dhcpOptionsId::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    instanceTenancy::Union(ASCIIString, Nothing)
    isDefault::Union(Bool, Nothing)

    VpcType(; vpcId=nothing, state=nothing, cidrBlock=nothing, dhcpOptionsId=nothing, tagSet=nothing, instanceTenancy=nothing, isDefault=nothing) = 
         new(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault)
end
function VpcType(pd::ETree)
    o = VpcType()
    o.vpcId = find(pd, "vpcId#string")
    o.state = find(pd, "state#string")
    o.cidrBlock = find(pd, "cidrBlock#string")
    o.dhcpOptionsId = find(pd, "dhcpOptionsId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.instanceTenancy = find(pd, "instanceTenancy#string")
    o.isDefault = AWS.safe_parse_as(Bool, find(pd, "isDefault#string"))
    o
end

export VpcType


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
function ImportInstanceVolumeDetailItemType(pd::ETree)
    o = ImportInstanceVolumeDetailItemType()
    o.bytesConverted = AWS.safe_parse_as(Int64, find(pd, "bytesConverted#string"))
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(find(pd,"image[1]")) : nothing
    o.description = find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(find(pd,"volume[1]")) : nothing
    o.status = find(pd, "status#string")
    o.statusMessage = find(pd, "statusMessage#string")
    o
end

export ImportInstanceVolumeDetailItemType


type CreateVpnConnectionType
    _type::Union(ASCIIString, Nothing)
    customerGatewayId::Union(ASCIIString, Nothing)
    vpnGatewayId::Union(ASCIIString, Nothing)
    options::Union(VpnConnectionOptionsRequestType, Nothing)

    CreateVpnConnectionType(; _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, options=nothing) = 
         new(_type, customerGatewayId, vpnGatewayId, options)
end
function CreateVpnConnectionType(pd::ETree)
    o = CreateVpnConnectionType()
    o._type = find(pd, "type#string")
    o.customerGatewayId = find(pd, "customerGatewayId#string")
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsRequestType(find(pd,"options[1]")) : nothing
    o
end

export CreateVpnConnectionType


type ModifySnapshotAttributeType
    snapshotId::Union(ASCIIString, Nothing)
    createVolumePermission::Union(CreateVolumePermissionOperationType, Nothing)

    ModifySnapshotAttributeType(; snapshotId=nothing, createVolumePermission=nothing) = 
         new(snapshotId, createVolumePermission)
end
function ModifySnapshotAttributeType(pd::ETree)
    o = ModifySnapshotAttributeType()
    o.snapshotId = find(pd, "snapshotId#string")
    o.createVolumePermission = length(pd["createVolumePermission"]) > 0 ?  CreateVolumePermissionOperationType(find(pd,"createVolumePermission[1]")) : nothing
    o
end

export ModifySnapshotAttributeType


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
    recurringCharges::Union(Vector{RecurringChargesSetItemType}, Nothing)
    marketplace::Union(Bool, Nothing)
    pricingDetailsSet::Union(Vector{PricingDetailsSetItemType}, Nothing)

    DescribeReservedInstancesOfferingsResponseSetItemType(; reservedInstancesOfferingId=nothing, instanceType=nothing, availabilityZone=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, productDescription=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing, marketplace=nothing, pricingDetailsSet=nothing) = 
         new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet)
end
function DescribeReservedInstancesOfferingsResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesOfferingsResponseSetItemType()
    o.reservedInstancesOfferingId = find(pd, "reservedInstancesOfferingId#string")
    o.instanceType = find(pd, "instanceType#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.duration = AWS.safe_parse_as(Int64, find(pd, "duration#string"))
    o.fixedPrice = AWS.safe_parse_as(Float64, find(pd, "fixedPrice#string"))
    o.usagePrice = AWS.safe_parse_as(Float64, find(pd, "usagePrice#string"))
    o.productDescription = find(pd, "productDescription#string")
    o.instanceTenancy = find(pd, "instanceTenancy#string")
    o.currencyCode = find(pd, "currencyCode#string")
    o.offeringType = find(pd, "offeringType#string")
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, find(pd, "recurringCharges/item"))
    o.marketplace = AWS.safe_parse_as(Bool, find(pd, "marketplace#string"))
    o.pricingDetailsSet = AWS.@parse_vector(AWS.EC2.PricingDetailsSetItemType, find(pd, "pricingDetailsSet/item"))
    o
end

export DescribeReservedInstancesOfferingsResponseSetItemType


type DescribeVolumeStatusType
    volumeSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)
    maxResults::Union(Int64, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusType(; volumeSet=nothing, filterSet=nothing, maxResults=nothing, nextToken=nothing) = 
         new(volumeSet, filterSet, maxResults, nextToken)
end
function DescribeVolumeStatusType(pd::ETree)
    o = DescribeVolumeStatusType()
    o.volumeSet = AWS.parse_vector_as(ASCIIString, "volumeId", find(pd, "item/volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o.maxResults = AWS.safe_parse_as(Int64, find(pd, "maxResults#string"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeVolumeStatusType


type VolumeStatusItemType
    volumeId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    volumeStatus::Union(VolumeStatusInfoType, Nothing)
    eventsSet::Union(Vector{VolumeStatusEventItemType}, Nothing)
    actionsSet::Union(Vector{VolumeStatusActionItemType}, Nothing)

    VolumeStatusItemType(; volumeId=nothing, availabilityZone=nothing, volumeStatus=nothing, eventsSet=nothing, actionsSet=nothing) = 
         new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end
function VolumeStatusItemType(pd::ETree)
    o = VolumeStatusItemType()
    o.volumeId = find(pd, "volumeId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.volumeStatus = length(pd["volumeStatus"]) > 0 ?  VolumeStatusInfoType(find(pd,"volumeStatus[1]")) : nothing
    o.eventsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusEventItemType, find(pd, "eventsSet/item"))
    o.actionsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusActionItemType, find(pd, "actionsSet/item"))
    o
end

export VolumeStatusItemType


type DescribeSpotPriceHistoryType
    startTime::Union(CalendarTime, Nothing)
    endTime::Union(CalendarTime, Nothing)
    instanceTypeSet::Union(Vector{ASCIIString}, Nothing)
    productDescriptionSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    maxResults::Union(Int64, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeSpotPriceHistoryType(; startTime=nothing, endTime=nothing, instanceTypeSet=nothing, productDescriptionSet=nothing, filterSet=nothing, availabilityZone=nothing, maxResults=nothing, nextToken=nothing) = 
         new(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken)
end
function DescribeSpotPriceHistoryType(pd::ETree)
    o = DescribeSpotPriceHistoryType()
    o.startTime = AWS.safe_parse_as(CalendarTime, find(pd, "startTime#string"))
    o.endTime = AWS.safe_parse_as(CalendarTime, find(pd, "endTime#string"))
    o.instanceTypeSet = AWS.parse_vector_as(ASCIIString, "instanceType", find(pd, "item/instanceType"))
    o.productDescriptionSet = AWS.parse_vector_as(ASCIIString, "productDescription", find(pd, "item/productDescription"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.maxResults = AWS.safe_parse_as(Int64, find(pd, "maxResults#string"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeSpotPriceHistoryType


type DescribeSpotPriceHistoryResponseType
    requestId::Union(ASCIIString, Nothing)
    spotPriceHistorySet::Union(Vector{SpotPriceHistorySetItemType}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeSpotPriceHistoryResponseType(; requestId=nothing, spotPriceHistorySet=nothing, nextToken=nothing) = 
         new(requestId, spotPriceHistorySet, nextToken)
end
function DescribeSpotPriceHistoryResponseType(pd::ETree)
    o = DescribeSpotPriceHistoryResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotPriceHistorySet = AWS.@parse_vector(AWS.EC2.SpotPriceHistorySetItemType, find(pd, "spotPriceHistorySet/item"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeSpotPriceHistoryResponseType


type ImportInstanceTaskDetailsType
    volumes::Union(Vector{ImportInstanceVolumeDetailItemType}, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    platform::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)

    ImportInstanceTaskDetailsType(; volumes=nothing, instanceId=nothing, platform=nothing, description=nothing) = 
         new(volumes, instanceId, platform, description)
end
function ImportInstanceTaskDetailsType(pd::ETree)
    o = ImportInstanceTaskDetailsType()
    o.volumes = AWS.@parse_vector(AWS.EC2.ImportInstanceVolumeDetailItemType, find(pd, "volumes/item"))
    o.instanceId = find(pd, "instanceId#string")
    o.platform = find(pd, "platform#string")
    o.description = find(pd, "description#string")
    o
end

export ImportInstanceTaskDetailsType


type DescribeCustomerGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGatewaySet::Union(Vector{CustomerGatewayType}, Nothing)

    DescribeCustomerGatewaysResponseType(; requestId=nothing, customerGatewaySet=nothing) = 
         new(requestId, customerGatewaySet)
end
function DescribeCustomerGatewaysResponseType(pd::ETree)
    o = DescribeCustomerGatewaysResponseType()
    o.requestId = find(pd, "requestId#string")
    o.customerGatewaySet = AWS.@parse_vector(AWS.EC2.CustomerGatewayType, find(pd, "customerGatewaySet/item"))
    o
end

export DescribeCustomerGatewaysResponseType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeVpnGatewaysType(; vpnGatewaySet=nothing, filterSet=nothing) = 
         new(vpnGatewaySet, filterSet)
end
function DescribeVpnGatewaysType(pd::ETree)
    o = DescribeVpnGatewaysType()
    o.vpnGatewaySet = AWS.parse_vector_as(ASCIIString, "vpnGatewayId", find(pd, "item/vpnGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeVpnGatewaysType


type DescribeVpcsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpcSet::Union(Vector{VpcType}, Nothing)

    DescribeVpcsResponseType(; requestId=nothing, vpcSet=nothing) = 
         new(requestId, vpcSet)
end
function DescribeVpcsResponseType(pd::ETree)
    o = DescribeVpcsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpcSet = AWS.@parse_vector(AWS.EC2.VpcType, find(pd, "vpcSet/item"))
    o
end

export DescribeVpcsResponseType


type DescribeRouteTablesResponseType
    requestId::Union(ASCIIString, Nothing)
    routeTableSet::Union(Vector{RouteTableType}, Nothing)

    DescribeRouteTablesResponseType(; requestId=nothing, routeTableSet=nothing) = 
         new(requestId, routeTableSet)
end
function DescribeRouteTablesResponseType(pd::ETree)
    o = DescribeRouteTablesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.routeTableSet = AWS.@parse_vector(AWS.EC2.RouteTableType, find(pd, "routeTableSet/item"))
    o
end

export DescribeRouteTablesResponseType


type DescribeTagsType
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeTagsType(; filterSet=nothing) = 
         new(filterSet)
end
function DescribeTagsType(pd::ETree)
    o = DescribeTagsType()
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeTagsType


type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::Union(ASCIIString, Nothing)
    reservedInstancesId::Union(ASCIIString, Nothing)
    createDate::Union(CalendarTime, Nothing)
    updateDate::Union(CalendarTime, Nothing)
    status::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    instanceCounts::Union(Vector{InstanceCountsSetItemType}, Nothing)
    priceSchedules::Union(Vector{PriceScheduleSetItemType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    clientToken::Union(ASCIIString, Nothing)

    DescribeReservedInstancesListingsResponseSetItemType(; reservedInstancesListingId=nothing, reservedInstancesId=nothing, createDate=nothing, updateDate=nothing, status=nothing, statusMessage=nothing, instanceCounts=nothing, priceSchedules=nothing, tagSet=nothing, clientToken=nothing) = 
         new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken)
end
function DescribeReservedInstancesListingsResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesListingsResponseSetItemType()
    o.reservedInstancesListingId = find(pd, "reservedInstancesListingId#string")
    o.reservedInstancesId = find(pd, "reservedInstancesId#string")
    o.createDate = AWS.safe_parse_as(CalendarTime, find(pd, "createDate#string"))
    o.updateDate = AWS.safe_parse_as(CalendarTime, find(pd, "updateDate#string"))
    o.status = find(pd, "status#string")
    o.statusMessage = find(pd, "statusMessage#string")
    o.instanceCounts = AWS.@parse_vector(AWS.EC2.InstanceCountsSetItemType, find(pd, "instanceCounts/item"))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleSetItemType, find(pd, "priceSchedules/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.clientToken = find(pd, "clientToken#string")
    o
end

export DescribeReservedInstancesListingsResponseSetItemType


type DescribeImagesType
    executableBySet::Union(Vector{ASCIIString}, Nothing)
    imagesSet::Union(Vector{ASCIIString}, Nothing)
    ownersSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeImagesType(; executableBySet=nothing, imagesSet=nothing, ownersSet=nothing, filterSet=nothing) = 
         new(executableBySet, imagesSet, ownersSet, filterSet)
end
function DescribeImagesType(pd::ETree)
    o = DescribeImagesType()
    o.executableBySet = AWS.parse_vector_as(ASCIIString, "user", find(pd, "item/user"))
    o.imagesSet = AWS.parse_vector_as(ASCIIString, "imageId", find(pd, "item/imageId"))
    o.ownersSet = AWS.parse_vector_as(ASCIIString, "owner", find(pd, "item/owner"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeImagesType


type CancelReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Vector{DescribeReservedInstancesListingsResponseSetItemType}, Nothing)

    CancelReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
function CancelReservedInstancesListingResponseType(pd::ETree)
    o = CancelReservedInstancesListingResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, find(pd, "reservedInstancesListingsSet/item"))
    o
end

export CancelReservedInstancesListingResponseType


type MonitorInstancesResponseSetItemType
    instanceId::Union(ASCIIString, Nothing)
    monitoring::Union(InstanceMonitoringStateType, Nothing)

    MonitorInstancesResponseSetItemType(; instanceId=nothing, monitoring=nothing) = 
         new(instanceId, monitoring)
end
function MonitorInstancesResponseSetItemType(pd::ETree)
    o = MonitorInstancesResponseSetItemType()
    o.instanceId = find(pd, "instanceId#string")
    o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(find(pd,"monitoring[1]")) : nothing
    o
end

export MonitorInstancesResponseSetItemType


type DescribeNetworkAclsResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAclSet::Union(Vector{NetworkAclType}, Nothing)

    DescribeNetworkAclsResponseType(; requestId=nothing, networkAclSet=nothing) = 
         new(requestId, networkAclSet)
end
function DescribeNetworkAclsResponseType(pd::ETree)
    o = DescribeNetworkAclsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.networkAclSet = AWS.@parse_vector(AWS.EC2.NetworkAclType, find(pd, "networkAclSet/item"))
    o
end

export DescribeNetworkAclsResponseType


type DescribeBundleTasksType
    bundlesSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeBundleTasksType(; bundlesSet=nothing, filterSet=nothing) = 
         new(bundlesSet, filterSet)
end
function DescribeBundleTasksType(pd::ETree)
    o = DescribeBundleTasksType()
    o.bundlesSet = AWS.parse_vector_as(ASCIIString, "bundleId", find(pd, "item/bundleId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeBundleTasksType


type DescribeReservedInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesSet::Union(Vector{DescribeReservedInstancesResponseSetItemType}, Nothing)

    DescribeReservedInstancesResponseType(; requestId=nothing, reservedInstancesSet=nothing) = 
         new(requestId, reservedInstancesSet)
end
function DescribeReservedInstancesResponseType(pd::ETree)
    o = DescribeReservedInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesResponseSetItemType, find(pd, "reservedInstancesSet/item"))
    o
end

export DescribeReservedInstancesResponseType


type DhcpOptionsType
    dhcpOptionsId::Union(ASCIIString, Nothing)
    dhcpConfigurationSet::Union(Vector{DhcpConfigurationItemType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    DhcpOptionsType(; dhcpOptionsId=nothing, dhcpConfigurationSet=nothing, tagSet=nothing) = 
         new(dhcpOptionsId, dhcpConfigurationSet, tagSet)
end
function DhcpOptionsType(pd::ETree)
    o = DhcpOptionsType()
    o.dhcpOptionsId = find(pd, "dhcpOptionsId#string")
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, find(pd, "dhcpConfigurationSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export DhcpOptionsType


type DescribeSnapshotsType
    snapshotSet::Union(Vector{ASCIIString}, Nothing)
    ownersSet::Union(Vector{ASCIIString}, Nothing)
    restorableBySet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeSnapshotsType(; snapshotSet=nothing, ownersSet=nothing, restorableBySet=nothing, filterSet=nothing) = 
         new(snapshotSet, ownersSet, restorableBySet, filterSet)
end
function DescribeSnapshotsType(pd::ETree)
    o = DescribeSnapshotsType()
    o.snapshotSet = AWS.parse_vector_as(ASCIIString, "snapshotId", find(pd, "item/snapshotId"))
    o.ownersSet = AWS.parse_vector_as(ASCIIString, "owner", find(pd, "item/owner"))
    o.restorableBySet = AWS.parse_vector_as(ASCIIString, "user", find(pd, "item/user"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeSnapshotsType


type AuthorizeSecurityGroupEgressType
    groupId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Vector{IpPermissionType}, Nothing)

    AuthorizeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) = 
         new(groupId, ipPermissions)
end
function AuthorizeSecurityGroupEgressType(pd::ETree)
    o = AuthorizeSecurityGroupEgressType()
    o.groupId = find(pd, "groupId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissions/item"))
    o
end

export AuthorizeSecurityGroupEgressType


type ConversionTaskType
    conversionTaskId::Union(ASCIIString, Nothing)
    expirationTime::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    statusMessage::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    ConversionTaskType(; conversionTaskId=nothing, expirationTime=nothing, state=nothing, statusMessage=nothing, tagSet=nothing) = 
         new(conversionTaskId, expirationTime, state, statusMessage, tagSet)
end
function ConversionTaskType(pd::ETree)
    o = ConversionTaskType()
    o.conversionTaskId = find(pd, "conversionTaskId#string")
    o.expirationTime = find(pd, "expirationTime#string")
    o.state = find(pd, "state#string")
    o.statusMessage = find(pd, "statusMessage#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export ConversionTaskType


type StartInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Vector{InstanceStateChangeType}, Nothing)

    StartInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
function StartInstancesResponseType(pd::ETree)
    o = StartInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, find(pd, "instancesSet/item"))
    o
end

export StartInstancesResponseType


type BundleInstanceTaskStorageType
    S3::Union(BundleInstanceS3StorageType, Nothing)

    BundleInstanceTaskStorageType(; S3=nothing) = 
         new(S3)
end
function BundleInstanceTaskStorageType(pd::ETree)
    o = BundleInstanceTaskStorageType()
    o.S3 = length(pd["S3"]) > 0 ?  BundleInstanceS3StorageType(find(pd,"S3[1]")) : nothing
    o
end

export BundleInstanceTaskStorageType


type AttachVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    attachment::Union(AttachmentType, Nothing)

    AttachVpnGatewayResponseType(; requestId=nothing, attachment=nothing) = 
         new(requestId, attachment)
end
function AttachVpnGatewayResponseType(pd::ETree)
    o = AttachVpnGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o.attachment = length(pd["attachment"]) > 0 ?  AttachmentType(find(pd,"attachment[1]")) : nothing
    o
end

export AttachVpnGatewayResponseType


type DescribeAddressesResponseType
    requestId::Union(ASCIIString, Nothing)
    addressesSet::Union(Vector{DescribeAddressesResponseItemType}, Nothing)

    DescribeAddressesResponseType(; requestId=nothing, addressesSet=nothing) = 
         new(requestId, addressesSet)
end
function DescribeAddressesResponseType(pd::ETree)
    o = DescribeAddressesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.addressesSet = AWS.@parse_vector(AWS.EC2.DescribeAddressesResponseItemType, find(pd, "addressesSet/item"))
    o
end

export DescribeAddressesResponseType


type InstanceStatusType
    status::Union(ASCIIString, Nothing)
    details::Union(Vector{InstanceStatusDetailsSetItemType}, Nothing)

    InstanceStatusType(; status=nothing, details=nothing) = 
         new(status, details)
end
function InstanceStatusType(pd::ETree)
    o = InstanceStatusType()
    o.status = find(pd, "status#string")
    o.details = AWS.@parse_vector(AWS.EC2.InstanceStatusDetailsSetItemType, find(pd, "details/item"))
    o
end

export InstanceStatusType


type DescribeInternetGatewaysType
    internetGatewayIdSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeInternetGatewaysType(; internetGatewayIdSet=nothing, filterSet=nothing) = 
         new(internetGatewayIdSet, filterSet)
end
function DescribeInternetGatewaysType(pd::ETree)
    o = DescribeInternetGatewaysType()
    o.internetGatewayIdSet = AWS.parse_vector_as(ASCIIString, "internetGatewayId", find(pd, "item/internetGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeInternetGatewaysType


type CreateSubnetResponseType
    requestId::Union(ASCIIString, Nothing)
    subnet::Union(SubnetType, Nothing)

    CreateSubnetResponseType(; requestId=nothing, subnet=nothing) = 
         new(requestId, subnet)
end
function CreateSubnetResponseType(pd::ETree)
    o = CreateSubnetResponseType()
    o.requestId = find(pd, "requestId#string")
    o.subnet = length(pd["subnet"]) > 0 ?  SubnetType(find(pd,"subnet[1]")) : nothing
    o
end

export CreateSubnetResponseType


type DescribeImagesResponseType
    requestId::Union(ASCIIString, Nothing)
    imagesSet::Union(Vector{DescribeImagesResponseItemType}, Nothing)

    DescribeImagesResponseType(; requestId=nothing, imagesSet=nothing) = 
         new(requestId, imagesSet)
end
function DescribeImagesResponseType(pd::ETree)
    o = DescribeImagesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.imagesSet = AWS.@parse_vector(AWS.EC2.DescribeImagesResponseItemType, find(pd, "imagesSet/item"))
    o
end

export DescribeImagesResponseType


type CancelSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Vector{CancelSpotInstanceRequestsResponseSetItemType}, Nothing)

    CancelSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
function CancelSpotInstanceRequestsResponseType(pd::ETree)
    o = CancelSpotInstanceRequestsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.CancelSpotInstanceRequestsResponseSetItemType, find(pd, "spotInstanceRequestSet/item"))
    o
end

export CancelSpotInstanceRequestsResponseType


type InstanceNetworkInterfaceSetItemRequestType
    networkInterfaceId::Union(ASCIIString, Nothing)
    deviceIndex::Union(Int64, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    description::Union(ASCIIString, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{ASCIIString}, Nothing)
    deleteOnTermination::Union(Bool, Nothing)
    privateIpAddressesSet::Union(Vector{PrivateIpAddressesSetItemRequestType}, Nothing)
    secondaryPrivateIpAddressCount::Union(Int64, Nothing)

    InstanceNetworkInterfaceSetItemRequestType(; networkInterfaceId=nothing, deviceIndex=nothing, subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, deleteOnTermination=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) = 
         new(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function InstanceNetworkInterfaceSetItemRequestType(pd::ETree)
    o = InstanceNetworkInterfaceSetItemRequestType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, find(pd, "deviceIndex#string"))
    o.subnetId = find(pd, "subnetId#string")
    o.description = find(pd, "description#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.groupSet = AWS.parse_vector_as(ASCIIString, "groupId", find(pd, "item/groupId"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, find(pd, "deleteOnTermination#string"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, find(pd, "privateIpAddressesSet/item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, find(pd, "secondaryPrivateIpAddressCount#string"))
    o
end

export InstanceNetworkInterfaceSetItemRequestType


type DescribeInstanceStatusType
    instancesSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)
    nextToken::Union(ASCIIString, Nothing)
    maxResults::Union(Int64, Nothing)
    includeAllInstances::Union(Bool, Nothing)

    DescribeInstanceStatusType(; instancesSet=nothing, filterSet=nothing, nextToken=nothing, maxResults=nothing, includeAllInstances=nothing) = 
         new(instancesSet, filterSet, nextToken, maxResults, includeAllInstances)
end
function DescribeInstanceStatusType(pd::ETree)
    o = DescribeInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", find(pd, "item/instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o.nextToken = find(pd, "nextToken#string")
    o.maxResults = AWS.safe_parse_as(Int64, find(pd, "maxResults#string"))
    o.includeAllInstances = AWS.safe_parse_as(Bool, find(pd, "includeAllInstances#string"))
    o
end

export DescribeInstanceStatusType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::Union(ASCIIString, Nothing)
    spotDatafeedSubscription::Union(SpotDatafeedSubscriptionType, Nothing)

    CreateSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) = 
         new(requestId, spotDatafeedSubscription)
end
function CreateSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = CreateSpotDatafeedSubscriptionResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(find(pd,"spotDatafeedSubscription[1]")) : nothing
    o
end

export CreateSpotDatafeedSubscriptionResponseType


type LicenseSetItemType
    licenseId::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    pool::Union(ASCIIString, Nothing)
    capacitySet::Union(Vector{LicenseCapacitySetItemType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    LicenseSetItemType(; licenseId=nothing, _type=nothing, pool=nothing, capacitySet=nothing, tagSet=nothing) = 
         new(licenseId, _type, pool, capacitySet, tagSet)
end
function LicenseSetItemType(pd::ETree)
    o = LicenseSetItemType()
    o.licenseId = find(pd, "licenseId#string")
    o._type = find(pd, "type#string")
    o.pool = find(pd, "pool#string")
    o.capacitySet = AWS.@parse_vector(AWS.EC2.LicenseCapacitySetItemType, find(pd, "capacitySet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export LicenseSetItemType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeAccountAttributesType(; accountAttributeNameSet=nothing, filterSet=nothing) = 
         new(accountAttributeNameSet, filterSet)
end
function DescribeAccountAttributesType(pd::ETree)
    o = DescribeAccountAttributesType()
    o.accountAttributeNameSet = AWS.parse_vector_as(ASCIIString, "attributeName", find(pd, "item/attributeName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeAccountAttributesType


type MonitorInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    instancesSet::Union(Vector{MonitorInstancesResponseSetItemType}, Nothing)

    MonitorInstancesResponseType(; requestId=nothing, instancesSet=nothing) = 
         new(requestId, instancesSet)
end
function MonitorInstancesResponseType(pd::ETree)
    o = MonitorInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.MonitorInstancesResponseSetItemType, find(pd, "instancesSet/item"))
    o
end

export MonitorInstancesResponseType


type VpnConnectionType
    vpnConnectionId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    customerGatewayConfiguration::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    customerGatewayId::Union(ASCIIString, Nothing)
    vpnGatewayId::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    vgwTelemetry::Union(Vector{VpnTunnelTelemetryType}, Nothing)
    options::Union(VpnConnectionOptionsResponseType, Nothing)
    routes::Union(Vector{VpnStaticRouteType}, Nothing)

    VpnConnectionType(; vpnConnectionId=nothing, state=nothing, customerGatewayConfiguration=nothing, _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, tagSet=nothing, vgwTelemetry=nothing, options=nothing, routes=nothing) = 
         new(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes)
end
function VpnConnectionType(pd::ETree)
    o = VpnConnectionType()
    o.vpnConnectionId = find(pd, "vpnConnectionId#string")
    o.state = find(pd, "state#string")
    o.customerGatewayConfiguration = find(pd, "customerGatewayConfiguration#string")
    o._type = find(pd, "type#string")
    o.customerGatewayId = find(pd, "customerGatewayId#string")
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.vgwTelemetry = AWS.@parse_vector(AWS.EC2.VpnTunnelTelemetryType, find(pd, "vgwTelemetry/item"))
    o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsResponseType(find(pd,"options[1]")) : nothing
    o.routes = AWS.@parse_vector(AWS.EC2.VpnStaticRouteType, find(pd, "routes/item"))
    o
end

export VpnConnectionType


type VpnGatewayType
    vpnGatewayId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    attachments::Union(Vector{AttachmentType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    VpnGatewayType(; vpnGatewayId=nothing, state=nothing, _type=nothing, availabilityZone=nothing, attachments=nothing, tagSet=nothing) = 
         new(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet)
end
function VpnGatewayType(pd::ETree)
    o = VpnGatewayType()
    o.vpnGatewayId = find(pd, "vpnGatewayId#string")
    o.state = find(pd, "state#string")
    o._type = find(pd, "type#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.attachments = AWS.@parse_vector(AWS.EC2.AttachmentType, find(pd, "attachments/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export VpnGatewayType


type LaunchPermissionOperationType
    add::Union(Vector{LaunchPermissionItemType}, Nothing)
    remove::Union(Vector{LaunchPermissionItemType}, Nothing)

    LaunchPermissionOperationType(; add=nothing, remove=nothing) = 
         new(add, remove)
end
function LaunchPermissionOperationType(pd::ETree)
    o = LaunchPermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, find(pd, "add/item"))
    o.remove = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, find(pd, "remove/item"))
    o
end

export LaunchPermissionOperationType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::Union(ASCIIString, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    primary::Union(Bool, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)

    NetworkInterfacePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) = 
         new(privateIpAddress, privateDnsName, primary, association)
end
function NetworkInterfacePrivateIpAddressesSetItemType(pd::ETree)
    o = NetworkInterfacePrivateIpAddressesSetItemType()
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.privateDnsName = find(pd, "privateDnsName#string")
    o.primary = AWS.safe_parse_as(Bool, find(pd, "primary#string"))
    o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(find(pd,"association[1]")) : nothing
    o
end

export NetworkInterfacePrivateIpAddressesSetItemType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union(Vector{ASCIIString}, Nothing)
    reservedInstancesSet::Union(Vector{ASCIIString}, Nothing)
    filterSet::Union(Vector{FilterType}, Nothing)

    DescribeReservedInstancesListingsType(; reservedInstancesListingSet=nothing, reservedInstancesSet=nothing, filterSet=nothing) = 
         new(reservedInstancesListingSet, reservedInstancesSet, filterSet)
end
function DescribeReservedInstancesListingsType(pd::ETree)
    o = DescribeReservedInstancesListingsType()
    o.reservedInstancesListingSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesListingId", find(pd, "item/reservedInstancesListingId"))
    o.reservedInstancesSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesId", find(pd, "item/reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, find(pd, "filterSet/item"))
    o
end

export DescribeReservedInstancesListingsType


type CreateCustomerGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    customerGateway::Union(CustomerGatewayType, Nothing)

    CreateCustomerGatewayResponseType(; requestId=nothing, customerGateway=nothing) = 
         new(requestId, customerGateway)
end
function CreateCustomerGatewayResponseType(pd::ETree)
    o = CreateCustomerGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o.customerGateway = length(pd["customerGateway"]) > 0 ?  CustomerGatewayType(find(pd,"customerGateway[1]")) : nothing
    o
end

export CreateCustomerGatewayResponseType


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
    groupSet::Union(Vector{GroupItemType}, Nothing)
    attachment::Union(NetworkInterfaceAttachmentType, Nothing)
    association::Union(NetworkInterfaceAssociationType, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    privateIpAddressesSet::Union(Vector{NetworkInterfacePrivateIpAddressesSetItemType}, Nothing)

    NetworkInterfaceType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, availabilityZone=nothing, description=nothing, ownerId=nothing, requesterId=nothing, requesterManaged=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, tagSet=nothing, privateIpAddressesSet=nothing) = 
         new(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet)
end
function NetworkInterfaceType(pd::ETree)
    o = NetworkInterfaceType()
    o.networkInterfaceId = find(pd, "networkInterfaceId#string")
    o.subnetId = find(pd, "subnetId#string")
    o.vpcId = find(pd, "vpcId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.description = find(pd, "description#string")
    o.ownerId = find(pd, "ownerId#string")
    o.requesterId = find(pd, "requesterId#string")
    o.requesterManaged = AWS.safe_parse_as(Bool, find(pd, "requesterManaged#string"))
    o.status = find(pd, "status#string")
    o.macAddress = find(pd, "macAddress#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.privateDnsName = find(pd, "privateDnsName#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.attachment = length(pd["attachment"]) > 0 ?  NetworkInterfaceAttachmentType(find(pd,"attachment[1]")) : nothing
    o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(find(pd,"association[1]")) : nothing
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.NetworkInterfacePrivateIpAddressesSetItemType, find(pd, "privateIpAddressesSet/item"))
    o
end

export NetworkInterfaceType


type BundleInstanceTaskType
    instanceId::Union(ASCIIString, Nothing)
    bundleId::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    startTime::Union(CalendarTime, Nothing)
    updateTime::Union(CalendarTime, Nothing)
    storage::Union(BundleInstanceTaskStorageType, Nothing)
    progress::Union(ASCIIString, Nothing)
    error::Union(BundleInstanceTaskErrorType, Nothing)

    BundleInstanceTaskType(; instanceId=nothing, bundleId=nothing, state=nothing, startTime=nothing, updateTime=nothing, storage=nothing, progress=nothing, error=nothing) = 
         new(instanceId, bundleId, state, startTime, updateTime, storage, progress, error)
end
function BundleInstanceTaskType(pd::ETree)
    o = BundleInstanceTaskType()
    o.instanceId = find(pd, "instanceId#string")
    o.bundleId = find(pd, "bundleId#string")
    o.state = find(pd, "state#string")
    o.startTime = AWS.safe_parse_as(CalendarTime, find(pd, "startTime#string"))
    o.updateTime = AWS.safe_parse_as(CalendarTime, find(pd, "updateTime#string"))
    o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(find(pd,"storage[1]")) : nothing
    o.progress = find(pd, "progress#string")
    o.error = length(pd["error"]) > 0 ?  BundleInstanceTaskErrorType(find(pd,"error[1]")) : nothing
    o
end

export BundleInstanceTaskType


type CreateInternetGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    internetGateway::Union(InternetGatewayType, Nothing)

    CreateInternetGatewayResponseType(; requestId=nothing, internetGateway=nothing) = 
         new(requestId, internetGateway)
end
function CreateInternetGatewayResponseType(pd::ETree)
    o = CreateInternetGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o.internetGateway = length(pd["internetGateway"]) > 0 ?  InternetGatewayType(find(pd,"internetGateway[1]")) : nothing
    o
end

export CreateInternetGatewayResponseType


type DescribeVpnGatewaysResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGatewaySet::Union(Vector{VpnGatewayType}, Nothing)

    DescribeVpnGatewaysResponseType(; requestId=nothing, vpnGatewaySet=nothing) = 
         new(requestId, vpnGatewaySet)
end
function DescribeVpnGatewaysResponseType(pd::ETree)
    o = DescribeVpnGatewaysResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpnGatewaySet = AWS.@parse_vector(AWS.EC2.VpnGatewayType, find(pd, "vpnGatewaySet/item"))
    o
end

export DescribeVpnGatewaysResponseType


type ImportInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportInstanceResponseType(; requestId=nothing, conversionTask=nothing) = 
         new(requestId, conversionTask)
end
function ImportInstanceResponseType(pd::ETree)
    o = ImportInstanceResponseType()
    o.requestId = find(pd, "requestId#string")
    o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(find(pd,"conversionTask[1]")) : nothing
    o
end

export ImportInstanceResponseType


type BundleInstanceResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    BundleInstanceResponseType(; requestId=nothing, bundleInstanceTask=nothing) = 
         new(requestId, bundleInstanceTask)
end
function BundleInstanceResponseType(pd::ETree)
    o = BundleInstanceResponseType()
    o.requestId = find(pd, "requestId#string")
    o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(find(pd,"bundleInstanceTask[1]")) : nothing
    o
end

export BundleInstanceResponseType


type LaunchSpecificationRequestType
    imageId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{GroupItemType}, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{InstanceNetworkInterfaceSetItemRequestType}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationRequestType(; imageId=nothing, keyName=nothing, groupSet=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, keyName, groupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationRequestType(pd::ETree)
    o = LaunchSpecificationRequestType()
    o.imageId = find(pd, "imageId#string")
    o.keyName = find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(find(pd,"userData[1]")) : nothing
    o.addressingType = find(pd, "addressingType#string")
    o.instanceType = find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(find(pd,"placement[1]")) : nothing
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(find(pd,"monitoring[1]")) : nothing
    o.subnetId = find(pd, "subnetId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, find(pd, "ebsOptimized#string"))
    o
end

export LaunchSpecificationRequestType


type DescribeLicensesResponseType
    requestId::Union(ASCIIString, Nothing)
    licenseSet::Union(Vector{LicenseSetItemType}, Nothing)

    DescribeLicensesResponseType(; requestId=nothing, licenseSet=nothing) = 
         new(requestId, licenseSet)
end
function DescribeLicensesResponseType(pd::ETree)
    o = DescribeLicensesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.licenseSet = AWS.@parse_vector(AWS.EC2.LicenseSetItemType, find(pd, "licenseSet/item"))
    o
end

export DescribeLicensesResponseType


type SecurityGroupItemType
    ownerId::Union(ASCIIString, Nothing)
    groupId::Union(ASCIIString, Nothing)
    groupName::Union(ASCIIString, Nothing)
    groupDescription::Union(ASCIIString, Nothing)
    vpcId::Union(ASCIIString, Nothing)
    ipPermissions::Union(Vector{IpPermissionType}, Nothing)
    ipPermissionsEgress::Union(Vector{IpPermissionType}, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)

    SecurityGroupItemType(; ownerId=nothing, groupId=nothing, groupName=nothing, groupDescription=nothing, vpcId=nothing, ipPermissions=nothing, ipPermissionsEgress=nothing, tagSet=nothing) = 
         new(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet)
end
function SecurityGroupItemType(pd::ETree)
    o = SecurityGroupItemType()
    o.ownerId = find(pd, "ownerId#string")
    o.groupId = find(pd, "groupId#string")
    o.groupName = find(pd, "groupName#string")
    o.groupDescription = find(pd, "groupDescription#string")
    o.vpcId = find(pd, "vpcId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissions/item"))
    o.ipPermissionsEgress = AWS.@parse_vector(AWS.EC2.IpPermissionType, find(pd, "ipPermissionsEgress/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o
end

export SecurityGroupItemType


type ImportVolumeResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTask::Union(ConversionTaskType, Nothing)

    ImportVolumeResponseType(; requestId=nothing, conversionTask=nothing) = 
         new(requestId, conversionTask)
end
function ImportVolumeResponseType(pd::ETree)
    o = ImportVolumeResponseType()
    o.requestId = find(pd, "requestId#string")
    o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(find(pd,"conversionTask[1]")) : nothing
    o
end

export ImportVolumeResponseType


type CreateVpnGatewayResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnGateway::Union(VpnGatewayType, Nothing)

    CreateVpnGatewayResponseType(; requestId=nothing, vpnGateway=nothing) = 
         new(requestId, vpnGateway)
end
function CreateVpnGatewayResponseType(pd::ETree)
    o = CreateVpnGatewayResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpnGateway = length(pd["vpnGateway"]) > 0 ?  VpnGatewayType(find(pd,"vpnGateway[1]")) : nothing
    o
end

export CreateVpnGatewayResponseType


type CreateVpcResponseType
    requestId::Union(ASCIIString, Nothing)
    vpc::Union(VpcType, Nothing)

    CreateVpcResponseType(; requestId=nothing, vpc=nothing) = 
         new(requestId, vpc)
end
function CreateVpcResponseType(pd::ETree)
    o = CreateVpcResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpc = length(pd["vpc"]) > 0 ?  VpcType(find(pd,"vpc[1]")) : nothing
    o
end

export CreateVpcResponseType


type DescribeBundleTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTasksSet::Union(Vector{BundleInstanceTaskType}, Nothing)

    DescribeBundleTasksResponseType(; requestId=nothing, bundleInstanceTasksSet=nothing) = 
         new(requestId, bundleInstanceTasksSet)
end
function DescribeBundleTasksResponseType(pd::ETree)
    o = DescribeBundleTasksResponseType()
    o.requestId = find(pd, "requestId#string")
    o.bundleInstanceTasksSet = AWS.@parse_vector(AWS.EC2.BundleInstanceTaskType, find(pd, "bundleInstanceTasksSet/item"))
    o
end

export DescribeBundleTasksResponseType


type RequestSpotInstancesType
    spotPrice::Union(ASCIIString, Nothing)
    instanceCount::Union(Int64, Nothing)
    _type::Union(ASCIIString, Nothing)
    validFrom::Union(CalendarTime, Nothing)
    validUntil::Union(CalendarTime, Nothing)
    launchGroup::Union(ASCIIString, Nothing)
    availabilityZoneGroup::Union(ASCIIString, Nothing)
    launchSpecification::Union(LaunchSpecificationRequestType, Nothing)

    RequestSpotInstancesType(; spotPrice=nothing, instanceCount=nothing, _type=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing) = 
         new(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification)
end
function RequestSpotInstancesType(pd::ETree)
    o = RequestSpotInstancesType()
    o.spotPrice = find(pd, "spotPrice#string")
    o.instanceCount = AWS.safe_parse_as(Int64, find(pd, "instanceCount#string"))
    o._type = find(pd, "type#string")
    o.validFrom = AWS.safe_parse_as(CalendarTime, find(pd, "validFrom#string"))
    o.validUntil = AWS.safe_parse_as(CalendarTime, find(pd, "validUntil#string"))
    o.launchGroup = find(pd, "launchGroup#string")
    o.availabilityZoneGroup = find(pd, "availabilityZoneGroup#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationRequestType(find(pd,"launchSpecification[1]")) : nothing
    o
end

export RequestSpotInstancesType


type BundleInstanceType
    instanceId::Union(ASCIIString, Nothing)
    storage::Union(BundleInstanceTaskStorageType, Nothing)

    BundleInstanceType(; instanceId=nothing, storage=nothing) = 
         new(instanceId, storage)
end
function BundleInstanceType(pd::ETree)
    o = BundleInstanceType()
    o.instanceId = find(pd, "instanceId#string")
    o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(find(pd,"storage[1]")) : nothing
    o
end

export BundleInstanceType


type DescribeConversionTasksResponseType
    requestId::Union(ASCIIString, Nothing)
    conversionTasks::Union(Vector{ConversionTaskType}, Nothing)

    DescribeConversionTasksResponseType(; requestId=nothing, conversionTasks=nothing) = 
         new(requestId, conversionTasks)
end
function DescribeConversionTasksResponseType(pd::ETree)
    o = DescribeConversionTasksResponseType()
    o.requestId = find(pd, "requestId#string")
    o.conversionTasks = AWS.@parse_vector(AWS.EC2.ConversionTaskType, find(pd, "conversionTasks/item"))
    o
end

export DescribeConversionTasksResponseType


type CreateDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptions::Union(DhcpOptionsType, Nothing)

    CreateDhcpOptionsResponseType(; requestId=nothing, dhcpOptions=nothing) = 
         new(requestId, dhcpOptions)
end
function CreateDhcpOptionsResponseType(pd::ETree)
    o = CreateDhcpOptionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.dhcpOptions = length(pd["dhcpOptions"]) > 0 ?  DhcpOptionsType(find(pd,"dhcpOptions[1]")) : nothing
    o
end

export CreateDhcpOptionsResponseType


type RunInstancesType
    imageId::Union(ASCIIString, Nothing)
    minCount::Union(Int64, Nothing)
    maxCount::Union(Int64, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{GroupItemType}, Nothing)
    additionalInfo::Union(ASCIIString, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(PlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    disableApiTermination::Union(Bool, Nothing)
    instanceInitiatedShutdownBehavior::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseRequestType, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{InstanceNetworkInterfaceSetItemRequestType}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, groupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunInstancesType(pd::ETree)
    o = RunInstancesType()
    o.imageId = find(pd, "imageId#string")
    o.minCount = AWS.safe_parse_as(Int64, find(pd, "minCount#string"))
    o.maxCount = AWS.safe_parse_as(Int64, find(pd, "maxCount#string"))
    o.keyName = find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.additionalInfo = find(pd, "additionalInfo#string")
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(find(pd,"userData[1]")) : nothing
    o.addressingType = find(pd, "addressingType#string")
    o.instanceType = find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  PlacementRequestType(find(pd,"placement[1]")) : nothing
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(find(pd,"monitoring[1]")) : nothing
    o.subnetId = find(pd, "subnetId#string")
    o.disableApiTermination = AWS.safe_parse_as(Bool, find(pd, "disableApiTermination#string"))
    o.instanceInitiatedShutdownBehavior = find(pd, "instanceInitiatedShutdownBehavior#string")
    o.license = length(pd["license"]) > 0 ?  InstanceLicenseRequestType(find(pd,"license[1]")) : nothing
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.clientToken = find(pd, "clientToken#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, find(pd, "ebsOptimized#string"))
    o
end

export RunInstancesType


type DescribeDhcpOptionsResponseType
    requestId::Union(ASCIIString, Nothing)
    dhcpOptionsSet::Union(Vector{DhcpOptionsType}, Nothing)

    DescribeDhcpOptionsResponseType(; requestId=nothing, dhcpOptionsSet=nothing) = 
         new(requestId, dhcpOptionsSet)
end
function DescribeDhcpOptionsResponseType(pd::ETree)
    o = DescribeDhcpOptionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.dhcpOptionsSet = AWS.@parse_vector(AWS.EC2.DhcpOptionsType, find(pd, "dhcpOptionsSet/item"))
    o
end

export DescribeDhcpOptionsResponseType


type DescribeReservedInstancesListingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Vector{DescribeReservedInstancesListingsResponseSetItemType}, Nothing)

    DescribeReservedInstancesListingsResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
function DescribeReservedInstancesListingsResponseType(pd::ETree)
    o = DescribeReservedInstancesListingsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, find(pd, "reservedInstancesListingsSet/item"))
    o
end

export DescribeReservedInstancesListingsResponseType


type DescribeSecurityGroupsResponseType
    requestId::Union(ASCIIString, Nothing)
    securityGroupInfo::Union(Vector{SecurityGroupItemType}, Nothing)

    DescribeSecurityGroupsResponseType(; requestId=nothing, securityGroupInfo=nothing) = 
         new(requestId, securityGroupInfo)
end
function DescribeSecurityGroupsResponseType(pd::ETree)
    o = DescribeSecurityGroupsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.securityGroupInfo = AWS.@parse_vector(AWS.EC2.SecurityGroupItemType, find(pd, "securityGroupInfo/item"))
    o
end

export DescribeSecurityGroupsResponseType


type DescribeVpnConnectionsResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnectionSet::Union(Vector{VpnConnectionType}, Nothing)

    DescribeVpnConnectionsResponseType(; requestId=nothing, vpnConnectionSet=nothing) = 
         new(requestId, vpnConnectionSet)
end
function DescribeVpnConnectionsResponseType(pd::ETree)
    o = DescribeVpnConnectionsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpnConnectionSet = AWS.@parse_vector(AWS.EC2.VpnConnectionType, find(pd, "vpnConnectionSet/item"))
    o
end

export DescribeVpnConnectionsResponseType


type ImportInstanceType
    description::Union(ASCIIString, Nothing)
    launchSpecification::Union(ImportInstanceLaunchSpecificationType, Nothing)
    diskImageSet::Union(Vector{DiskImageType}, Nothing)
    keepPartialImports::Union(Bool, Nothing)
    platform::Union(ASCIIString, Nothing)

    ImportInstanceType(; description=nothing, launchSpecification=nothing, diskImageSet=nothing, keepPartialImports=nothing, platform=nothing) = 
         new(description, launchSpecification, diskImageSet, keepPartialImports, platform)
end
function ImportInstanceType(pd::ETree)
    o = ImportInstanceType()
    o.description = find(pd, "description#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  ImportInstanceLaunchSpecificationType(find(pd,"launchSpecification[1]")) : nothing
    o.diskImageSet = AWS.@parse_vector(AWS.EC2.DiskImageType, find(pd, "diskImageSet/item"))
    o.keepPartialImports = AWS.safe_parse_as(Bool, find(pd, "keepPartialImports#string"))
    o.platform = find(pd, "platform#string")
    o
end

export ImportInstanceType


type RunningInstancesItemType
    instanceId::Union(ASCIIString, Nothing)
    imageId::Union(ASCIIString, Nothing)
    instanceState::Union(InstanceStateType, Nothing)
    privateDnsName::Union(ASCIIString, Nothing)
    dnsName::Union(ASCIIString, Nothing)
    reason::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    amiLaunchIndex::Union(ASCIIString, Nothing)
    productCodes::Union(Vector{ProductCodesSetItemType}, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    launchTime::Union(CalendarTime, Nothing)
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
    groupSet::Union(Vector{GroupItemType}, Nothing)
    stateReason::Union(StateReasonType, Nothing)
    architecture::Union(ASCIIString, Nothing)
    rootDeviceType::Union(ASCIIString, Nothing)
    rootDeviceName::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{InstanceBlockDeviceMappingResponseItemType}, Nothing)
    instanceLifecycle::Union(ASCIIString, Nothing)
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseResponseType, Nothing)
    virtualizationType::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    hypervisor::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{InstanceNetworkInterfaceSetItemType}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileResponseType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunningInstancesItemType(; instanceId=nothing, imageId=nothing, instanceState=nothing, privateDnsName=nothing, dnsName=nothing, reason=nothing, keyName=nothing, amiLaunchIndex=nothing, productCodes=nothing, instanceType=nothing, launchTime=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, monitoring=nothing, subnetId=nothing, vpcId=nothing, privateIpAddress=nothing, ipAddress=nothing, sourceDestCheck=nothing, groupSet=nothing, stateReason=nothing, architecture=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, instanceLifecycle=nothing, spotInstanceRequestId=nothing, license=nothing, virtualizationType=nothing, clientToken=nothing, tagSet=nothing, hypervisor=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunningInstancesItemType(pd::ETree)
    o = RunningInstancesItemType()
    o.instanceId = find(pd, "instanceId#string")
    o.imageId = find(pd, "imageId#string")
    o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(find(pd,"instanceState[1]")) : nothing
    o.privateDnsName = find(pd, "privateDnsName#string")
    o.dnsName = find(pd, "dnsName#string")
    o.reason = find(pd, "reason#string")
    o.keyName = find(pd, "keyName#string")
    o.amiLaunchIndex = find(pd, "amiLaunchIndex#string")
    o.productCodes = AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, find(pd, "productCodes/item"))
    o.instanceType = find(pd, "instanceType#string")
    o.launchTime = AWS.safe_parse_as(CalendarTime, find(pd, "launchTime#string"))
    o.placement = length(pd["placement"]) > 0 ?  PlacementResponseType(find(pd,"placement[1]")) : nothing
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.platform = find(pd, "platform#string")
    o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(find(pd,"monitoring[1]")) : nothing
    o.subnetId = find(pd, "subnetId#string")
    o.vpcId = find(pd, "vpcId#string")
    o.privateIpAddress = find(pd, "privateIpAddress#string")
    o.ipAddress = find(pd, "ipAddress#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(find(pd,"stateReason[1]")) : nothing
    o.architecture = find(pd, "architecture#string")
    o.rootDeviceType = find(pd, "rootDeviceType#string")
    o.rootDeviceName = find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.InstanceBlockDeviceMappingResponseItemType, find(pd, "blockDeviceMapping/item"))
    o.instanceLifecycle = find(pd, "instanceLifecycle#string")
    o.spotInstanceRequestId = find(pd, "spotInstanceRequestId#string")
    o.license = length(pd["license"]) > 0 ?  InstanceLicenseResponseType(find(pd,"license[1]")) : nothing
    o.virtualizationType = find(pd, "virtualizationType#string")
    o.clientToken = find(pd, "clientToken#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.hypervisor = find(pd, "hypervisor#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemType, find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileResponseType(find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, find(pd, "ebsOptimized#string"))
    o
end

export RunningInstancesItemType


type DescribeVolumesResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeSet::Union(Vector{DescribeVolumesSetItemResponseType}, Nothing)

    DescribeVolumesResponseType(; requestId=nothing, volumeSet=nothing) = 
         new(requestId, volumeSet)
end
function DescribeVolumesResponseType(pd::ETree)
    o = DescribeVolumesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeSet = AWS.@parse_vector(AWS.EC2.DescribeVolumesSetItemResponseType, find(pd, "volumeSet/item"))
    o
end

export DescribeVolumesResponseType


type CreateReservedInstancesListingResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesListingsSet::Union(Vector{DescribeReservedInstancesListingsResponseSetItemType}, Nothing)

    CreateReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) = 
         new(requestId, reservedInstancesListingsSet)
end
function CreateReservedInstancesListingResponseType(pd::ETree)
    o = CreateReservedInstancesListingResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, find(pd, "reservedInstancesListingsSet/item"))
    o
end

export CreateReservedInstancesListingResponseType


type CreateVpnConnectionResponseType
    requestId::Union(ASCIIString, Nothing)
    vpnConnection::Union(VpnConnectionType, Nothing)

    CreateVpnConnectionResponseType(; requestId=nothing, vpnConnection=nothing) = 
         new(requestId, vpnConnection)
end
function CreateVpnConnectionResponseType(pd::ETree)
    o = CreateVpnConnectionResponseType()
    o.requestId = find(pd, "requestId#string")
    o.vpnConnection = length(pd["vpnConnection"]) > 0 ?  VpnConnectionType(find(pd,"vpnConnection[1]")) : nothing
    o
end

export CreateVpnConnectionResponseType


type CancelBundleTaskResponseType
    requestId::Union(ASCIIString, Nothing)
    bundleInstanceTask::Union(BundleInstanceTaskType, Nothing)

    CancelBundleTaskResponseType(; requestId=nothing, bundleInstanceTask=nothing) = 
         new(requestId, bundleInstanceTask)
end
function CancelBundleTaskResponseType(pd::ETree)
    o = CancelBundleTaskResponseType()
    o.requestId = find(pd, "requestId#string")
    o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(find(pd,"bundleInstanceTask[1]")) : nothing
    o
end

export CancelBundleTaskResponseType


type DescribeVolumeStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    volumeStatusSet::Union(Vector{VolumeStatusItemType}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeVolumeStatusResponseType(; requestId=nothing, volumeStatusSet=nothing, nextToken=nothing) = 
         new(requestId, volumeStatusSet, nextToken)
end
function DescribeVolumeStatusResponseType(pd::ETree)
    o = DescribeVolumeStatusResponseType()
    o.requestId = find(pd, "requestId#string")
    o.volumeStatusSet = AWS.@parse_vector(AWS.EC2.VolumeStatusItemType, find(pd, "volumeStatusSet/item"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeVolumeStatusResponseType


type InstanceStatusItemType
    instanceId::Union(ASCIIString, Nothing)
    availabilityZone::Union(ASCIIString, Nothing)
    eventsSet::Union(Vector{InstanceStatusEventType}, Nothing)
    instanceState::Union(InstanceStateType, Nothing)
    systemStatus::Union(InstanceStatusType, Nothing)
    instanceStatus::Union(InstanceStatusType, Nothing)

    InstanceStatusItemType(; instanceId=nothing, availabilityZone=nothing, eventsSet=nothing, instanceState=nothing, systemStatus=nothing, instanceStatus=nothing) = 
         new(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus)
end
function InstanceStatusItemType(pd::ETree)
    o = InstanceStatusItemType()
    o.instanceId = find(pd, "instanceId#string")
    o.availabilityZone = find(pd, "availabilityZone#string")
    o.eventsSet = AWS.@parse_vector(AWS.EC2.InstanceStatusEventType, find(pd, "eventsSet/item"))
    o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(find(pd,"instanceState[1]")) : nothing
    o.systemStatus = length(pd["systemStatus"]) > 0 ?  InstanceStatusType(find(pd,"systemStatus[1]")) : nothing
    o.instanceStatus = length(pd["instanceStatus"]) > 0 ?  InstanceStatusType(find(pd,"instanceStatus[1]")) : nothing
    o
end

export InstanceStatusItemType


type DescribeSnapshotsResponseType
    requestId::Union(ASCIIString, Nothing)
    snapshotSet::Union(Vector{DescribeSnapshotsSetItemResponseType}, Nothing)

    DescribeSnapshotsResponseType(; requestId=nothing, snapshotSet=nothing) = 
         new(requestId, snapshotSet)
end
function DescribeSnapshotsResponseType(pd::ETree)
    o = DescribeSnapshotsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.snapshotSet = AWS.@parse_vector(AWS.EC2.DescribeSnapshotsSetItemResponseType, find(pd, "snapshotSet/item"))
    o
end

export DescribeSnapshotsResponseType


type CreateNetworkAclResponseType
    requestId::Union(ASCIIString, Nothing)
    networkAcl::Union(NetworkAclType, Nothing)

    CreateNetworkAclResponseType(; requestId=nothing, networkAcl=nothing) = 
         new(requestId, networkAcl)
end
function CreateNetworkAclResponseType(pd::ETree)
    o = CreateNetworkAclResponseType()
    o.requestId = find(pd, "requestId#string")
    o.networkAcl = length(pd["networkAcl"]) > 0 ?  NetworkAclType(find(pd,"networkAcl[1]")) : nothing
    o
end

export CreateNetworkAclResponseType


type DescribeNetworkInterfacesResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{NetworkInterfaceType}, Nothing)

    DescribeNetworkInterfacesResponseType(; requestId=nothing, networkInterfaceSet=nothing) = 
         new(requestId, networkInterfaceSet)
end
function DescribeNetworkInterfacesResponseType(pd::ETree)
    o = DescribeNetworkInterfacesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.NetworkInterfaceType, find(pd, "networkInterfaceSet/item"))
    o
end

export DescribeNetworkInterfacesResponseType


type LaunchSpecificationResponseType
    imageId::Union(ASCIIString, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{GroupItemType}, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(SpotPlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{InstanceNetworkInterfaceSetItemRequestType}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    LaunchSpecificationResponseType(; imageId=nothing, keyName=nothing, groupSet=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationResponseType(pd::ETree)
    o = LaunchSpecificationResponseType()
    o.imageId = find(pd, "imageId#string")
    o.keyName = find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.addressingType = find(pd, "addressingType#string")
    o.instanceType = find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(find(pd,"placement[1]")) : nothing
    o.kernelId = find(pd, "kernelId#string")
    o.ramdiskId = find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(find(pd,"monitoring[1]")) : nothing
    o.subnetId = find(pd, "subnetId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, find(pd, "ebsOptimized#string"))
    o
end

export LaunchSpecificationResponseType


type SpotInstanceRequestSetItemType
    spotInstanceRequestId::Union(ASCIIString, Nothing)
    spotPrice::Union(ASCIIString, Nothing)
    _type::Union(ASCIIString, Nothing)
    state::Union(ASCIIString, Nothing)
    fault::Union(SpotInstanceStateFaultType, Nothing)
    status::Union(SpotInstanceStatusMessageType, Nothing)
    validFrom::Union(CalendarTime, Nothing)
    validUntil::Union(CalendarTime, Nothing)
    launchGroup::Union(ASCIIString, Nothing)
    availabilityZoneGroup::Union(ASCIIString, Nothing)
    launchSpecification::Union(LaunchSpecificationResponseType, Nothing)
    instanceId::Union(ASCIIString, Nothing)
    createTime::Union(CalendarTime, Nothing)
    productDescription::Union(ASCIIString, Nothing)
    tagSet::Union(Vector{ResourceTagSetItemType}, Nothing)
    launchedAvailabilityZone::Union(ASCIIString, Nothing)

    SpotInstanceRequestSetItemType(; spotInstanceRequestId=nothing, spotPrice=nothing, _type=nothing, state=nothing, fault=nothing, status=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing, instanceId=nothing, createTime=nothing, productDescription=nothing, tagSet=nothing, launchedAvailabilityZone=nothing) = 
         new(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone)
end
function SpotInstanceRequestSetItemType(pd::ETree)
    o = SpotInstanceRequestSetItemType()
    o.spotInstanceRequestId = find(pd, "spotInstanceRequestId#string")
    o.spotPrice = find(pd, "spotPrice#string")
    o._type = find(pd, "type#string")
    o.state = find(pd, "state#string")
    o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(find(pd,"fault[1]")) : nothing
    o.status = length(pd["status"]) > 0 ?  SpotInstanceStatusMessageType(find(pd,"status[1]")) : nothing
    o.validFrom = AWS.safe_parse_as(CalendarTime, find(pd, "validFrom#string"))
    o.validUntil = AWS.safe_parse_as(CalendarTime, find(pd, "validUntil#string"))
    o.launchGroup = find(pd, "launchGroup#string")
    o.availabilityZoneGroup = find(pd, "availabilityZoneGroup#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationResponseType(find(pd,"launchSpecification[1]")) : nothing
    o.instanceId = find(pd, "instanceId#string")
    o.createTime = AWS.safe_parse_as(CalendarTime, find(pd, "createTime#string"))
    o.productDescription = find(pd, "productDescription#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, find(pd, "tagSet/item"))
    o.launchedAvailabilityZone = find(pd, "launchedAvailabilityZone#string")
    o
end

export SpotInstanceRequestSetItemType


type DescribeReservedInstancesOfferingsResponseType
    requestId::Union(ASCIIString, Nothing)
    reservedInstancesOfferingsSet::Union(Vector{DescribeReservedInstancesOfferingsResponseSetItemType}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeReservedInstancesOfferingsResponseType(; requestId=nothing, reservedInstancesOfferingsSet=nothing, nextToken=nothing) = 
         new(requestId, reservedInstancesOfferingsSet, nextToken)
end
function DescribeReservedInstancesOfferingsResponseType(pd::ETree)
    o = DescribeReservedInstancesOfferingsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservedInstancesOfferingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesOfferingsResponseSetItemType, find(pd, "reservedInstancesOfferingsSet/item"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeReservedInstancesOfferingsResponseType


type CreateNetworkInterfaceResponseType
    requestId::Union(ASCIIString, Nothing)
    networkInterface::Union(NetworkInterfaceType, Nothing)

    CreateNetworkInterfaceResponseType(; requestId=nothing, networkInterface=nothing) = 
         new(requestId, networkInterface)
end
function CreateNetworkInterfaceResponseType(pd::ETree)
    o = CreateNetworkInterfaceResponseType()
    o.requestId = find(pd, "requestId#string")
    o.networkInterface = length(pd["networkInterface"]) > 0 ?  NetworkInterfaceType(find(pd,"networkInterface[1]")) : nothing
    o
end

export CreateNetworkInterfaceResponseType


type ReservationInfoType
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{GroupItemType}, Nothing)
    instancesSet::Union(Vector{RunningInstancesItemType}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    ReservationInfoType(; reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) = 
         new(reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function ReservationInfoType(pd::ETree)
    o = ReservationInfoType()
    o.reservationId = find(pd, "reservationId#string")
    o.ownerId = find(pd, "ownerId#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, find(pd, "instancesSet/item"))
    o.requesterId = find(pd, "requesterId#string")
    o
end

export ReservationInfoType


type DescribeSpotInstanceRequestsResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Vector{SpotInstanceRequestSetItemType}, Nothing)

    DescribeSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
function DescribeSpotInstanceRequestsResponseType(pd::ETree)
    o = DescribeSpotInstanceRequestsResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, find(pd, "spotInstanceRequestSet/item"))
    o
end

export DescribeSpotInstanceRequestsResponseType


type DescribeInstanceStatusResponseType
    requestId::Union(ASCIIString, Nothing)
    instanceStatusSet::Union(Vector{InstanceStatusItemType}, Nothing)
    nextToken::Union(ASCIIString, Nothing)

    DescribeInstanceStatusResponseType(; requestId=nothing, instanceStatusSet=nothing, nextToken=nothing) = 
         new(requestId, instanceStatusSet, nextToken)
end
function DescribeInstanceStatusResponseType(pd::ETree)
    o = DescribeInstanceStatusResponseType()
    o.requestId = find(pd, "requestId#string")
    o.instanceStatusSet = AWS.@parse_vector(AWS.EC2.InstanceStatusItemType, find(pd, "instanceStatusSet/item"))
    o.nextToken = find(pd, "nextToken#string")
    o
end

export DescribeInstanceStatusResponseType


type RequestSpotInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    spotInstanceRequestSet::Union(Vector{SpotInstanceRequestSetItemType}, Nothing)

    RequestSpotInstancesResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) = 
         new(requestId, spotInstanceRequestSet)
end
function RequestSpotInstancesResponseType(pd::ETree)
    o = RequestSpotInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, find(pd, "spotInstanceRequestSet/item"))
    o
end

export RequestSpotInstancesResponseType


type DescribeInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationSet::Union(Vector{ReservationInfoType}, Nothing)

    DescribeInstancesResponseType(; requestId=nothing, reservationSet=nothing) = 
         new(requestId, reservationSet)
end
function DescribeInstancesResponseType(pd::ETree)
    o = DescribeInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservationSet = AWS.@parse_vector(AWS.EC2.ReservationInfoType, find(pd, "reservationSet/item"))
    o
end

export DescribeInstancesResponseType


type RunInstancesResponseType
    requestId::Union(ASCIIString, Nothing)
    reservationId::Union(ASCIIString, Nothing)
    ownerId::Union(ASCIIString, Nothing)
    groupSet::Union(Vector{GroupItemType}, Nothing)
    instancesSet::Union(Vector{RunningInstancesItemType}, Nothing)
    requesterId::Union(ASCIIString, Nothing)

    RunInstancesResponseType(; requestId=nothing, reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) = 
         new(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function RunInstancesResponseType(pd::ETree)
    o = RunInstancesResponseType()
    o.requestId = find(pd, "requestId#string")
    o.reservationId = find(pd, "reservationId#string")
    o.ownerId = find(pd, "ownerId#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, find(pd, "groupSet/item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, find(pd, "instancesSet/item"))
    o.requesterId = find(pd, "requesterId#string")
    o
end

export RunInstancesResponseType


