type CreateImageResponseType
    requestId::Union{String, Void}
    imageId::Union{String, Void}

    CreateImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
## function CreateImageResponseType(pd)
function CreateImageResponseType(pd)
    o = CreateImageResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export CreateImageResponseType


type RegisterImageResponseType
    requestId::Union{String, Void}
    imageId::Union{String, Void}

    RegisterImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
## function RegisterImageResponseType(pd)
function RegisterImageResponseType(pd)
    o = RegisterImageResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export RegisterImageResponseType


type DeregisterImageType
    imageId::Union{String, Void}

    DeregisterImageType(; imageId=nothing) =
         new(imageId)
end
## function DeregisterImageType(pd)
function DeregisterImageType(pd)
    o = DeregisterImageType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export DeregisterImageType


type DeregisterImageResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeregisterImageResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
## function DeregisterImageResponseType(pd)
function DeregisterImageResponseType(pd)
    o = DeregisterImageResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeregisterImageResponseType


type CreateKeyPairType
    keyName::Union{String, Void}

    CreateKeyPairType(; keyName=nothing) =
         new(keyName)
end
## function CreateKeyPairType(pd)
function CreateKeyPairType(pd)
    o = CreateKeyPairType()
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o
end

export CreateKeyPairType


type CreateKeyPairResponseType
    requestId::Union{String, Void}
    keyName::Union{String, Void}
    keyFingerprint::Union{String, Void}
    keyMaterial::Union{String, Void}

    CreateKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing, keyMaterial=nothing) =
         new(requestId, keyName, keyFingerprint, keyMaterial)
end
## function CreateKeyPairResponseType(pd)
function CreateKeyPairResponseType(pd)
    o = CreateKeyPairResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.keyFingerprint = LightXML.content(LightXML.find_element(pd, "keyFingerprint"))
    o.keyMaterial = LightXML.content(LightXML.find_element(pd, "keyMaterial"))
    o
end

export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::Union{String, Void}
    publicKeyMaterial::Union{String, Void}

    ImportKeyPairType(; keyName=nothing, publicKeyMaterial=nothing) =
         new(keyName, publicKeyMaterial)
end
## function ImportKeyPairType(pd)
function ImportKeyPairType(pd)
    o = ImportKeyPairType()
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.publicKeyMaterial = LightXML.content(LightXML.find_element(pd, "publicKeyMaterial"))
    o
end

export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::Union{String, Void}
    keyName::Union{String, Void}
    keyFingerprint::Union{String, Void}

    ImportKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing) =
         new(requestId, keyName, keyFingerprint)
end
function ImportKeyPairResponseType(pd)
    o = ImportKeyPairResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.keyFingerprint = LightXML.content(LightXML.find_element(pd, "keyFingerprint"))
    o
end

export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::Union{String, Void}

    DeleteKeyPairType(; keyName=nothing) =
         new(keyName)
end
function DeleteKeyPairType(pd)
    o = DeleteKeyPairType()
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o
end

export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteKeyPairResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteKeyPairResponseType(pd)
    o = DeleteKeyPairResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::Union{String, Void}

    DescribeKeyPairsItemType(; keyName=nothing) =
         new(keyName)
end
function DescribeKeyPairsItemType(pd)
    o = DescribeKeyPairsItemType()
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o
end

export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::Union{String, Void}
    keyFingerprint::Union{String, Void}

    DescribeKeyPairsResponseItemType(; keyName=nothing, keyFingerprint=nothing) =
         new(keyName, keyFingerprint)
end
function DescribeKeyPairsResponseItemType(pd)
    o = DescribeKeyPairsResponseItemType()
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.keyFingerprint = LightXML.content(LightXML.find_element(pd, "keyFingerprint"))
    o
end

export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union{String, Void}
    name::Union{String, Void}

    IamInstanceProfileRequestType(; arn=nothing, name=nothing) =
         new(arn, name)
end
function IamInstanceProfileRequestType(pd)
    o = IamInstanceProfileRequestType()
    o.arn = LightXML.content(LightXML.find_element(pd, "arn"))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o
end

export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::Union{String, Void}
    primary::Union{Bool, Void}

    PrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing, primary=nothing) =
         new(privateIpAddress, primary)
end
function PrivateIpAddressesSetItemRequestType(pd)
    o = PrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.primary = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "primary")))
    o
end

export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union{String, Void}
    groupName::Union{String, Void}

    ImportInstanceGroupItemType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function ImportInstanceGroupItemType(pd)
    o = ImportInstanceGroupItemType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union{String, Void}
    groupName::Union{String, Void}

    GroupItemType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function GroupItemType(pd)
    o = GroupItemType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export GroupItemType


type UserDataType
    data::Union{String, Void}

    UserDataType(; data=nothing) =
         new(data)
end
function UserDataType(pd)
    o = UserDataType()
    o.data = LightXML.content(LightXML.find_element(pd, "data"))
    o
end

export UserDataType




type EbsBlockDeviceType
    snapshotId::Union{String, Void}
    volumeSize::Union{Int64, Void}
    deleteOnTermination::Union{Bool, Void}
    volumeType::Union{String, Void}
    iops::Union{Int64, Void}

    EbsBlockDeviceType(; snapshotId=nothing, volumeSize=nothing, deleteOnTermination=nothing, volumeType=nothing, iops=nothing) =
         new(snapshotId, volumeSize, deleteOnTermination, volumeType, iops)
end
function EbsBlockDeviceType(pd)
    o = EbsBlockDeviceType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.volumeSize = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "volumeSize")))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o.volumeType = LightXML.content(LightXML.find_element(pd, "volumeType"))
    o.iops = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "iops")))
    o
end

export EbsBlockDeviceType

type BlockDeviceMappingItemType
    deviceName::Union{String, Void}
    virtualName::Union{String, Void}
    noDevice::Union{String, Void}
    ebs::Union{EbsBlockDeviceType, Void}

    BlockDeviceMappingItemType(; deviceName=nothing, virtualName=nothing, noDevice=nothing, ebs=nothing) =
         new(deviceName, virtualName, noDevice, ebs)
end
function BlockDeviceMappingItemType(pd)
    o = BlockDeviceMappingItemType()
    o.deviceName = LightXML.content(LightXML.find_element(pd, "deviceName"))
    o.virtualName = LightXML.content(LightXML.find_element(pd, "virtualName"))
    o.noDevice = LightXML.content(LightXML.find_element(pd, "noDevice"))
    ## o.ebs = length(pd["ebsBlockDevice"]) > 0 ?  EbsBlockDeviceType(LightXML.content(LightXML.find_element(pd,"ebsBlockDevice[1]")) : nothing
    o.ebs = LightXML.find_element(pd,"ebsBlockDevice") != nothing ? EbsBlockDeviceType(LightXML.find_element(pd,"ebsBlockDevice")) : nothing
    o
end

export BlockDeviceMappingItemType

type PlacementRequestType
    availabilityZone::Union{String, Void}
    groupName::Union{String, Void}
    tenancy::Union{String, Void}

    PlacementRequestType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) =
         new(availabilityZone, groupName, tenancy)
end
function PlacementRequestType(pd)
    o = PlacementRequestType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.tenancy = LightXML.content(LightXML.find_element(pd, "tenancy"))
    o
end

export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union{String, Void}
    groupName::Union{String, Void}

    SpotPlacementRequestType(; availabilityZone=nothing, groupName=nothing) =
         new(availabilityZone, groupName)
end
function SpotPlacementRequestType(pd)
    o = SpotPlacementRequestType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union{String, Void}
    groupName::Union{String, Void}

    InstancePlacementType(; availabilityZone=nothing, groupName=nothing) =
         new(availabilityZone, groupName)
end
function InstancePlacementType(pd)
    o = InstancePlacementType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export InstancePlacementType


type MonitoringInstanceType
    enabled::Union{Bool, Void}

    MonitoringInstanceType(; enabled=nothing) =
         new(enabled)
end
function MonitoringInstanceType(pd)
    o = MonitoringInstanceType()
    o.enabled = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "enabled")))
    o
end

export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::Union{String, Void}

    InstanceLicenseRequestType(; pool=nothing) =
         new(pool)
end
function InstanceLicenseRequestType(pd)
    o = InstanceLicenseRequestType()
    o.pool = LightXML.content(LightXML.find_element(pd, "pool"))
    o
end

export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::Union{String, Void}
    id::Union{String, Void}

    IamInstanceProfileResponseType(; arn=nothing, id=nothing) =
         new(arn, id)
end
function IamInstanceProfileResponseType(pd)
    o = IamInstanceProfileResponseType()
    o.arn = LightXML.content(LightXML.find_element(pd, "arn"))
    o.id = LightXML.content(LightXML.find_element(pd, "id"))
    o
end

export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::Union{String, Void}
    deviceIndex::Union{Int64, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    InstanceNetworkInterfaceAttachmentType(; attachmentId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end
function InstanceNetworkInterfaceAttachmentType(pd)
    o = InstanceNetworkInterfaceAttachmentType()
    o.attachmentId = LightXML.content(LightXML.find_element(pd, "attachmentId"))
    o.deviceIndex = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "deviceIndex")))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::Union{String, Void}
    publicDnsName::Union{String, Void}
    ipOwnerId::Union{String, Void}

    InstanceNetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing) =
         new(publicIp, publicDnsName, ipOwnerId)
end
function InstanceNetworkInterfaceAssociationType(pd)
    o = InstanceNetworkInterfaceAssociationType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.publicDnsName = LightXML.content(LightXML.find_element(pd, "publicDnsName"))
    o.ipOwnerId = LightXML.content(LightXML.find_element(pd, "ipOwnerId"))
    o
end

export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::Union{String, Void}
    groupName::Union{String, Void}
    tenancy::Union{String, Void}

    PlacementResponseType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) =
         new(availabilityZone, groupName, tenancy)
end
function PlacementResponseType(pd)
    o = PlacementResponseType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.tenancy = LightXML.content(LightXML.find_element(pd, "tenancy"))
    o
end

export PlacementResponseType


type StateReasonType
    code::Union{String, Void}
    message::Union{String, Void}

    StateReasonType(; code=nothing, message=nothing) =
         new(code, message)
end
function StateReasonType(pd)
    o = StateReasonType()
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.message = LightXML.content(LightXML.find_element(pd, "message"))
    o
end

export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::Union{String, Void}

    InstanceBlockDeviceMappingResponseItemType(; deviceName=nothing) =
         new(deviceName)
end
function InstanceBlockDeviceMappingResponseItemType(pd)
    o = InstanceBlockDeviceMappingResponseItemType()
    o.deviceName = LightXML.content(LightXML.find_element(pd, "deviceName"))
    o
end

export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::Union{String, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    EbsInstanceBlockDeviceMappingResponseType(; volumeId=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(volumeId, status, attachTime, deleteOnTermination)
end
function EbsInstanceBlockDeviceMappingResponseType(pd)
    o = EbsInstanceBlockDeviceMappingResponseType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::Union{String, Void}

    InstanceLicenseResponseType(; pool=nothing) =
         new(pool)
end
function InstanceLicenseResponseType(pd)
    o = InstanceLicenseResponseType()
    o.pool = LightXML.content(LightXML.find_element(pd, "pool"))
    o
end

export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::Union{String, Void}

    AccountAttributeNameSetItemType(; attributeName=nothing) =
         new(attributeName)
end
function AccountAttributeNameSetItemType(pd)
    o = AccountAttributeNameSetItemType()
    o.attributeName = LightXML.content(LightXML.find_element(pd, "attributeName"))
    o
end

export AccountAttributeNameSetItemType


type AccountAttributeSetItemType
    attributeName::Union{String, Void}
    attributeValueSet::Union{Vector{String}, Void}

    AccountAttributeSetItemType(; attributeName=nothing, attributeValueSet=nothing) =
         new(attributeName, attributeValueSet)
end
function AccountAttributeSetItemType(pd)
    o = AccountAttributeSetItemType()
    o.attributeName = LightXML.content(LightXML.find_element(pd, "attributeName"))
    o.attributeValueSet = AWS.parse_vector_as(String, "attributeValue", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "attributeValue"))
    o
end

export AccountAttributeSetItemType


type AccountAttributeValueSetItemType
    attributeValue::Union{String, Void}

    AccountAttributeValueSetItemType(; attributeValue=nothing) =
         new(attributeValue)
end
function AccountAttributeValueSetItemType(pd)
    o = AccountAttributeValueSetItemType()
    o.attributeValue = LightXML.content(LightXML.find_element(pd, "attributeValue"))
    o
end

export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::Union{String, Void}

    DescribeVpcAttributeType(; vpcId=nothing) =
         new(vpcId)
end
function DescribeVpcAttributeType(pd)
    o = DescribeVpcAttributeType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::Union{String, Void}
    vpcId::Union{String, Void}

    DescribeVpcAttributeResponseType(; requestId=nothing, vpcId=nothing) =
         new(requestId, vpcId)
end
function DescribeVpcAttributeResponseType(pd)
    o = DescribeVpcAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::Union{String, Void}

    ModifyVpcAttributeType(; vpcId=nothing) =
         new(vpcId)
end
function ModifyVpcAttributeType(pd)
    o = ModifyVpcAttributeType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifyVpcAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyVpcAttributeResponseType(pd)
    o = ModifyVpcAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifyVpcAttributeResponseType


type VpcPeeringConnectionVpcInfoType
  ownerId::Union{String, Void}
  vpcId::Union{String, Void}
  cidrBlock::Union{String, Void}

  VpcPeeringConnectionVpcInfoType(; ownerId=nothing, vpcId=nothing, cidrBlock=nothing) = new(ownerId, vpcId, cidrBlock)
end
function VpcPeeringConnectionVpcInfoType(pd)
  o = VpcPeeringConnectionVpcInfoType()
  o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
  o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
  o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
  o
end

export VpcPeeringConnectionVpcInfoType


type VpcPeeringConnectionStateReasonType
  code::Union{String, Void}
  message::Union{String, Void}

  VpcPeeringConnectionStateReasonType(; code=nothing, message=nothing) = new(code, message)
end
function VpcPeeringConnectionStateReasonType(pd)
  o = VpcPeeringConnectionStateReasonType()
  o.code = LightXML.content(LightXML.find_element(pd, "code"))
  o.message = LightXML.content(LightXML.find_element(pd, "message"))
  o
end

export VpcPeeringConnectionStateReasonType


type ResourceTagSetItemType
    key::Union{String, Void}
    value::Union{String, Void}

    ResourceTagSetItemType(; key=nothing, value=nothing) =
         new(key, value)
end
function ResourceTagSetItemType(pd)
    o = ResourceTagSetItemType()
    o.key = LightXML.content(LightXML.find_element(pd, "key"))
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export ResourceTagSetItemType


type VpcPeeringConnectionType
  vpcPeeringConnectionId::Union{String, Void}
  requesterVpcInfo::Union{Vector{VpcPeeringConnectionVpcInfoType}, Void}
  accepterVpcInfo::Union{Vector{VpcPeeringConnectionVpcInfoType}, Void}
  status::Union{Vector{VpcPeeringConnectionStateReasonType}, Void}
  expirationTime::Union{Base.Dates.DateTime, Void}
  tagSet::Union{Vector{ResourceTagSetItemType}, Void}

  VpcPeeringConnectionType(; vpcPeeringConnectionId=nothing, requesterVpcInfo=nothing, accepterVpcInfo=nothing, status=nothing,
                           expirationTime=nothing, tagSet=nothing) = new(vpcPeeringConnectionId, requesterVpcInfo,
                                                                         accepterVpcInfo, status, expirationTime, tagSet)
end
function VpcPeeringConnectionType(pd)
  o = VpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LightXML.content(LightXML.find_element(pd, "vpcPeeringConnectionId"))
  o.requesterVpcInfo = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionVpcInfoType, LightXML.get_elements_by_tagname(pd, "requesterVpcInfo"))
  o.accepterVpcInfo = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionVpcInfoType, LightXML.get_elements_by_tagname(pd, "accepterVpcInfo"))
  o.status = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionStateReasonType, LightXML.get_elements_by_tagname(pd, "status"))
  o.expirationTime = AWS.safe_parse_as(DateTime, LightXML.content(LightXML.find_element(pd, "expirationTime")))
  o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(LightXML.find_element(pd, "tagSet"), "item")))
  o
end

export VpcPeeringConnectionType


type AcceptVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{String, Void}

  AcceptVpcPeeringConnectionType(; vpcPeeringConnectionId=nothing) = new(vpcPeeringConnectionId)
end
function AcceptVpcPeeringConnectionType(pd)
  o = AcceptVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LightXML.content(LightXML.find_element(pd, "vpcPeeringConnectionId"))
  o
end

export AcceptVpcPeeringConnectionType


type AcceptVpcPeeringConnectionResponseType
  requestID::Union{String, Void}
  vpcPeeringConnection::Union{Vector{VpcPeeringConnectionType}, Void}

  AcceptVpcPeeringConnectionResponseType(; requestId=nothing, vpcPeeringConnection=nothing) = new(requestId, vpcPeeringConnection)
end
function AcceptVpcPeeringConnectionResponseType(pd)
  o = AcceptVPcPeeringConnectionResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.vpcPeeringConnection = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vpcPeeringConnection")))
  o
end

export AcceptVpcPeeringConnectionResponseType


type CreateVpcEndpointType
  clientToken::Union{String, Void}
  policyDocument::Union{String, Void}
  routeTableIdSet::Union{Vector{String}, Void}
  serviceName::Union{String, Void}
  vpcId::Union{String, Void}

  CreateVpcEndpointType(; clientToken=nothing, policyDocument=nothing, routeTableIdSet=nothing, serviceName=nothing,
                        vpcId=nothing) = new(clientToken, policyDocument, routeTableId, serviceName, vpcId)
end
function CreateVpcEndpointType(pd)
  o = CreateVpcEndpointType()
  clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
  policyDocument = LightXML.content(LightXML.find_element(pd, "policyDocument"))
  routeTableIdSet = AWS.parse_vector_as(String, "routeTableId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "routeTableId"))
  serviceName = LightXML.content(LightXML.find_element(pd, "serviceName"))
  vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
  o
end

export CreateVpcEndpointType


type VpcEndpointType
  creationTimestamp::Union{Base.Dates.DateTime, Void}
  policyDocument::Union{String, Void}
  routeTableIdSet::Union{Vector{String}, Void}
  serviceName::Union{String, Void}
  state::Union{String, Void}
  vpcEndpointId::Union{String, Void}
  vpcId::Union{String, Void}

  VpcEndpointType(; creationTimestamp=nothing, policyDocument=nothing, routeTableIdSet=nothing, serviceName=nothing,
              state=nothing, vpcEndpointId=nothing, vpcId=nothing) = new(creationTimestamp, policyDocument,
                                                                         routeTableIdSet, serviceName, state, vpcEndpointId, vpcId)
end
function VpcEndpointType(pd)
  o = VpcEndpointType()
  o.creationTimestamp = AWS.safe_parse_as(DateTime, LightXML.content(LightXML.find_element(pd, "creationTimestamp")))
  o.policyDocument = LightXML.content(LightXML.find_element(pd, "policyDocument"))
  o.routeTableIdSet = AWS.parse_vector_as(String, "routeTableId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "routeTableId"))
  o.serviceName = LightXML.content(LightXML.find_element(pd, "serviceName"))
  o.state = LightXML.content(LightXML.find_element(pd, "state"))
  o.vpcEndpointId = LightXML.content(LightXML.find_element(pd, "vpcEndpointId"))
  o.vpcId = LightXML.content(LightXML.find_element(pd, "vpdId"))
  o
end

export VpcEndpointType


type CreateVpcEndpointResponseType
  clientToken::Union{String, Void}
  requestId::Union{String, Void}
  vpcEndpoint::Union{Vector{VpcEndpointType}, Void}

  CreateVpcEndpointResponseType(; clientToken=nothing, requestId=nothing, vpcEndpoint=nothing) =
    new(clientToken, requestId, vpcEndpoint)
end
function CreateVpcEndpointResponseType(pd)
  o = CreateVpcEndpointResponseType()
  o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.vpcEndpoint = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LightXML.get_elements_by_tagname(pd, "vpcEndpoint"))
  o
end

export CreateVpcEndpointResponseType


type CreateVpcPeeringConnectionType
  vpcId::Union{String, Void}
  peerVpcId::Union{String, Void}
  peerOwnerId::Union{String, Void}

  CreateVpcPeeringConnectionType(; vpcId=nothing, peerVpcId=nothing, peerOwnerId=nothing) =
    new(vpcId, peerVpcId, peerOwnerId)
end
function CreateVpcPeeringConnectionType(pd)
  o = CreateVpcPeeringConnectionType()
  o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
  o.peerVpcId = LightXML.content(LightXML.find_element(pd, "peerVpcId"))
  o.peerOwnerId = LightXML.content(LightXML.find_element(pd, "peerOwnerId"))
  o
end

export CreateVpcPeeringConnectionType


type CreateVpcPeeringConnectionResponseType
  requestId::Union{String, Void}
  vpcPeeringConnection::Union{Vector{VpcPeeringConnectionType}, Void}

  CreateVpcPeeringConnectionResponseType(; requestId=nothing, vpcPeeringConnection=nothing) =
    new(requestId, vpcPeeringConnection)
end
function CreateVpcPeeringConnectionResponseType(pd)
  o = CreateVpcPeeringConnectionResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.vpcPeeringConnection = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LightXML.get_elements_by_tagname(pd, "vpcPeeringConnection"))
  o
end

export CreateVpcPeeringConnectionResponseType


type DeleteVpcEndpointsType
  vpcEndpointIdSet::Union{Vector{String}, Void}

  DeleteVpcEndpointsType(; vpcEndpointIdSet=nothing) = new(vpcEndpointIdSet)
end
function DeleteVpcEndpointsType(pd)
  o = DeleteVpcEndpointsType()
  o.vpcEndpointIdSet = AWS.parse_vector_as(String, "vpcEndpointId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "vpcEndpointId"))
end

export DeleteVpcEndpointsType


type UnsuccessfulItemErrorType
  code::Union{String, Void}
  message::Union{String, Void}

  UnsuccessfulItemErrorType(; code=nothing, message=nothing) = new(code, message)
end
function UnsuccessfulItemErrorType(pd)
  o = UnsuccessfulItemErrorType()
  o.code = LightXML.content(LightXML.find_element(pd, "code"))
  o.message = LightXML.content(LightXML.find_element(pd, "message"))
  o
end

export UnsuccessfulItemErrorType


type UnsuccessfulItemType
  error::Union{Vector{UnsuccessfulItemErrorType}, Void}
  resourceId::Union{String, Void}

  UnsuccessfulItemType(; error=nothing, resourceId=nothing) = new(error, resourceId)
end
function UnsuccessfulItemType(pd)
  o = UnsuccessfulItemType()
  o.error = AWS.@parse_vector(AWS.EC2.UnsuccessfulItemErrorType, LightXML.get_elements_by_tagname(pd, "error"))
  o.resourceId = LightXML.content(LightXML.find_element(pd, "resourceId"))
  o
end

export UnsuccessfulItemType


type DeleteVpcEndpointsResponseType
  requestId::Union{String, Void}
  unsuccessful::Union{Vector{UnsuccessfulItemType}, Void}

  DeleteVpcEndpointsResponseType(; requestId=nothing, unsucessful=nothing) = new(requestId, unsuccessful)
end
function DeleteVpcEndpointsResponseType(pd)
  o = DeleteVpcEndpointsResponseType()
  o.requestId = LightXML.content(LightXML.find_element("requestId"))
  o.unsuccessful = AWS.@parse_vector(AWS.EC2.UnsuccessfulItemType, LightXML.get_elements_by_tagname(pd, "unsuccessful"))
end

export DeleteVpcEndpointsResponseType


type VpcEndpointIdSetItemType
    vpcEndpointId::Union{String, Void}

    VpcEndpointIdSetItemType(; vpcEndpointId=nothing) =
         new(vpcEndpointId)
end
function VpcEndpointIdSetItemType(pd)
    o = VpcEndpointIdSetItemType()
    o.vpcEndpointId = LightXML.content(LightXML.find_element(pd, "vpcEndpointId"))
    o
end

export VpcEndpointIdSetItemType


type DeleteVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{String, Void}

  DeleteVpcPeeringConnectionType(; vpcPeeringConnectionID=nothing) = new(vpcPeeringConnectionId)
end
function DeleteVpcPeeringConnectionType(pd)
  o = DeleteVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LightXML.content(LightXML.find_element(pd, "vpcPeeringConnectionId"))
  o
end

export DeleteVpcPeeringConnectionType


type DeleteVpcPeeringConnectionResponseType
  requestId::Union{String, Void}
  _return::Union{Bool, Void}

  DeleteVpcPeeringConnectionResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function DeleteVpcPeeringConnectionResponseType(pd)
  o = DeleteVpcPeeringConnectionResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
  o
end

export DeleteVpcPeeringConnectionResponseType


type FilterType
    name::Union{String, Void}
    valueSet::Union{Vector{String}, Void}

    FilterType(; name=nothing, valueSet=nothing) =
         new(name, valueSet)
end
function FilterType(pd)
    o = FilterType()
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.valueSet = AWS.parse_vector_as(String, "value", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "value"))
    o
end

export FilterType


type DescribePrefixListsType
  filterSet::Union{Vector{FilterType}, Void}
  maxResults::Union{Int64, Void}
  nextToken::Union{String, Void}
  prefixListIdSet::Union{Vector{String}, Void}

  DescribePrefixListsType(; filterSet=nothing, maxResults=nothing, nextToken=nothing, prefixListIdSet=nothing) =
    new(filterSet, maxResults, nextToken, prefixListIdSet)
end
function DescribePrefixListsType(pd)
  o = DescribePrefixListsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
  o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o.prefixListIdSet = AWS.parse_vector_as(String, "prefixListId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "prefixListId"))
  o
end

export DescribePrefixListsType


type PrefixListType
  cidrs::Union{Vector{String}, Void}
  prefixListId::Union{String, Void}
  prefixListName::Union{String, Void}

  PrefixListType(; cidrs=nothing, prefixListId=nothing, prefixListName=nothing) = new(cidrs, prefixListId, prefixListName)
end
function PrefixListType(pd)
  o = PrefixListType()
  o.cidrs = AWS.parse_vector_as(String, "cidr", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "cidr"))
  o.prefixListId = LightXML.content(LightXML.find_element(pd, "prefixListId"))
  o.prefixListName = LightXML.content(LightXML.find_element(pd, "prefixListName"))
  o
end

export PrefixListType


type DescribePrefixListsResponseType
  nextToken::Union{String, Void}
  prefixListSet::Union{Vector{PrefixListType}, Void}
  requestId::Union{String, Void}

  DescribePrefixListsResponseType(; nextToken=nothing, prefixListSet=nothing, requestId=nothing) =
    new(nextToken, prefixListSet, requestId)
end
function DescribePrefixListsResponseType(pd)
  o = DescribePrefixListsResponseType()
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o.prefixListSet = AWS.parse_vector_as(String, "prefixList", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "prefixList"))
  o
end

export DescribePrefixListsType


type DescribeVpcEndpointServicesType
  maxResults::Union{Int64, Void}
  nextToken::Union{String, Void}

  DescribeVpcEndpointServicesType(; maxResults=nothing, nextToken=nothing) = new(maxResults, nextToken)
end
function DescribeVpcEndpointServicesType(pd)
  o = DescribeVpcEndpointServicesType()
  o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o
end

export DescribeVpcEndpointServicesType


type DescribeVpcEndpointServicesResponseType
  nextToken::Union{String, Void}
  requestId::Union{String, Void}
  serviceNameSet::Union{Vector{String}, Void}

  DescribeVpcEndpointServicesResponseType(; nextToken=nothing, requestId=nothing, serviceNameSet=nothing) =
    new(nextToken, requestId, serviceNameSet)
end
function DescribeVpcEndpointServicesResponseType(pd)
  o = DescribeVpcEndpointServicesResponseType()
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.serviceNameSet = AWS.parse_vector_as(String, "serviceName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "serviceName"))
end

export DescribeVpcEndpointServicesResponseType


type DescribeVpcEndpointsType
  filterSet::Union{Vector{FilterType}, Void}
  maxResults::Union{Int64, Void}
  nextToken::Union{String, Void}
  vpcEndpointIdSet::Union{Vector{String}, Void}

  DescribeVpcEndpointsType(; filterSet=nothing, maxResults=nothing, nextToken=nothing, vpcEndpointIdSet=nothing) =
    new(filterSet, maxResults, nextToken, vpcEndpointIdSet)
end
function DescribeVpcEndpointsType(pd)
  o = DescribeVpcEndpointsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
  o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o.vpcEndpointIdSet = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vcpEndpointId"), "item"))
  o
end

export DescribeVpcEndpointsType


type DescribeVpcEndpointsResponseType
  nextToken::Union{String, Void}
  requestId::Union{String, Void}
  vpcEndpointIdSet::Union{Vector{String}, Void}

  DescribeVpcEndpointsResponseType(; nextToken=nothing, requestId=nothing, vpcEndpointIdSet=nothing) =
    new(nextToken, requestId, vpcEndpointIdSet)
end
function DescribeVpcEndpointsResponseType(pd)
  o = DescribeVpcEndpointsResponseType()
  o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.vpcEndpointIdSet = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vcpEndpointId"), "item"))
  o
end

export DescribeVpcEndpointsResponseType


type DescribeVpcPeeringConnectionsType
  filterSet::Union{Vector{FilterType}, Void}
  vpcPeeringConnectionIdSet::Union{Vector{String}, Void}

  DescribeVpcPeeringConnectionsType(; filterSet=nothing, vpcPeeringConnectionIdSet=nothing) =
    new(filterSet, vpcPeeringConnectionIdSet)
end
function DescribeVpcPeeringConnectionsType(pd)
  o = DescribeVpcPeeringConnectionsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
  o.vpcPeeringConnectionIdSet = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vcpPeeringConnectionId"), "item"))
  o
end

export DescribeVpcPeeringConnectionsType


type DescribeVpcPeeringConnectionsResponseType
  requestId::Union{String, Void}
  vpcPeeringConnectionSet::Union{Vector{VpcPeeringConnectionType}, Void}

  DescribeVpcPeeringConnectionsResponseType(; responseId=nothing, vpcPeeringConnectionSet=nothing) =
    new(responseId, vpcPeeringConnectionSet)
end
function DescribeVpcPeeringConnectionsResponseType(pd)
  o = DescribeVpcPeeringConnectionsResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o.vpcPeeringConnectionSet = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vcpPeeringConnection"), "item"))
  o
end

export DescribeVpcPeeringConnectionsResponseType


type ModifySubnetAttributeType
  mapPublicIpOnLaunch::Union{Bool, Void}
  subnetId::Union{String, Void}

  ModifySubnetAttributeType(; mapPublicIpOnLaunch=nothing, subnetId=nothing) =
    new(mapPublicIpOnLaunch, subnetId)
end
function ModifySubnetAttributeType(pd)
  o = ModifySubnetAttributeType()
  o.mapPublicIpOnLaunch = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "mapPublicIpOnLaunch")))
  o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
  o
end

export ModifySubnetAttributeType


type ModifySubnetAttributeResponseType
  requestId::Union{String, Void}
  _return::Union{Bool, Void}

  ModifySubnetAttributeResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function ModifySubnetAttributeResponseType(pd)
  o = ModifySubnetAttributeResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o._return = AWS.safe_parse_as(bool, LightXML.content(LightXML.find_element(pd, "return")))
  o
end

export ModifySubnetAttributeResponseType


type ModifyVpcEndpointType
  addRouteTableIdSet::Union{Vector{String}, Void}
  policyDocument::Union{String, Void}
  removeRouteTableIdSet::Union{Vector{String}, Void}
  resetPolicy::Union{Bool, Void}
  vpcEndpointId::Union{String, Void}

  ModifyVpcEndpointType(; addRouteTableIdSet=nothing, policyDocument=nothing, removeRouteTableIdSet=nothing,
                        resetPolicy=nothing, vpcEndpointId=nothing) = new(addRouteTableIdSet, policyDocument,
                                                                          removeRouteTableIdSet, resetPolicy, vpcEndpointId)
end
function ModifyVpcEndpointType(pd)
  o = ModifyVpcEndpointType()
  o.addRouteTableIdSet = AWS.parse_vector_as(String, "routeTableId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "routeTableId"))
  o.policyDocument = LightXML.content(LightXML.find_element(pd, "policyDocument"))
  o.removeRouteTableIdSet = AWS.parse_vector_as(String, "routeTableId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "routeTableId"))
  o.resetPolicy = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "resetPolicy")))
  o.vpcEndpointId = LightXML.content(LightXML.find_element(pd, "vpcEndpointId"))
  o
end

export ModifyVpcEndpointType


type ModifyVpcEndpointResponseType
  requestId::Union{String, Void}
  _return::Union{Bool, Void}

  ModifyVpcEndpointResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function ModifyVpcEndpointResponseType(pd)
  o = ModifyVpcEndpointResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o._return = AWS.safe_parse_as(bool, LightXML.content(LightXML.find_element(pd, "return")))
  o
end

export ModifyVpcEndpointResponseType


type RejectVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{String, Void}

  RejectVpcPeeringConnectionType(; vpcPeeringConnectionId=nothing) = new(vpcPeeringConnectionId)
end
function RejectVpcPeeringConnectionType(pd)
  o = RejectVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LightXML.content(LightXML.find_element(pd, "vpcPeeringConnectionId"))
  o
end

export RejectVpcPeeringConnectionType


type RejectVpcPeeringConnectionResponseType
  requestId::Union{String, Void}
  _return::Union{Bool, Void}

  RejectVpcPeeringConnectionResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function RejectVpcPeeringConnectionResponseType(pd)
  o = RejectVpcPeeringConnectionResponseType()
  o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
  o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
  o
end

export RejectVpcPeeringConnectionResponseType


type GetConsoleOutputType
    instanceId::Union{String, Void}

    GetConsoleOutputType(; instanceId=nothing) =
         new(instanceId)
end
function GetConsoleOutputType(pd)
    o = GetConsoleOutputType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::Union{String, Void}
    instanceId::Union{String, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    output::Union{String, Void}

    GetConsoleOutputResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, output=nothing) =
         new(requestId, instanceId, timestamp, output)
end
function GetConsoleOutputResponseType(pd)
    o = GetConsoleOutputResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "timestamp")))
    o.output = LightXML.content(LightXML.find_element(pd, "output"))
    o
end

export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::Union{String, Void}

    GetPasswordDataType(; instanceId=nothing) =
         new(instanceId)
end
function GetPasswordDataType(pd)
    o = GetPasswordDataType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::Union{String, Void}
    instanceId::Union{String, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    passwordData::Union{String, Void}

    GetPasswordDataResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, passwordData=nothing) =
         new(requestId, instanceId, timestamp, passwordData)
end
function GetPasswordDataResponseType(pd)
    o = GetPasswordDataResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "timestamp")))
    o.passwordData = LightXML.content(LightXML.find_element(pd, "passwordData"))
    o
end

export GetPasswordDataResponseType


type InstanceIdType
    instanceId::Union{String, Void}

    InstanceIdType(; instanceId=nothing) =
         new(instanceId)
end
function InstanceIdType(pd)
    o = InstanceIdType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export InstanceIdType


type TerminateInstancesType
    instancesSet::Union{Vector{String}, Void}

    TerminateInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function TerminateInstancesType(pd)
    o = TerminateInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o
end

export TerminateInstancesType


type InstanceBlockDeviceMappingItemType
    deviceName::Union{String, Void}

    InstanceBlockDeviceMappingItemType(; deviceName=nothing) =
         new(deviceName)
end
function InstanceBlockDeviceMappingItemType(pd)
    o = InstanceBlockDeviceMappingItemType()
    o.deviceName = LightXML.content(LightXML.find_element(pd, "deviceName"))
    o
end

export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::Union{String, Void}
    deleteOnTermination::Union{Bool, Void}

    InstanceEbsBlockDeviceType(; volumeId=nothing, deleteOnTermination=nothing) =
         new(volumeId, deleteOnTermination)
end
function InstanceEbsBlockDeviceType(pd)
    o = InstanceEbsBlockDeviceType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export InstanceEbsBlockDeviceType


type StopInstancesType
    instancesSet::Union{Vector{String}, Void}
    force::Union{Bool, Void}

    StopInstancesType(; instancesSet=nothing, force=nothing) =
         new(instancesSet, force)
end
function StopInstancesType(pd)
    o = StopInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o.force = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "force")))
    o
end

export StopInstancesType


type StartInstancesType
    instancesSet::Union{Vector{String}, Void}

    StartInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function StartInstancesType(pd)
    o = StartInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o
end

export StartInstancesType


type RebootInstancesType
    instancesSet::Union{Vector{String}, Void}

    RebootInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function RebootInstancesType(pd)
    o = RebootInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o
end

export RebootInstancesType


type RebootInstancesItemType
    instanceId::Union{String, Void}

    RebootInstancesItemType(; instanceId=nothing) =
         new(instanceId)
end
function RebootInstancesItemType(pd)
    o = RebootInstancesItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    RebootInstancesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RebootInstancesResponseType(pd)
    o = RebootInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::Union{String, Void}

    DescribeInstancesItemType(; instanceId=nothing) =
         new(instanceId)
end
function DescribeInstancesItemType(pd)
    o = DescribeInstancesItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::Union{String, Void}

    UnavailableResultType(; availabilityZone=nothing) =
         new(availabilityZone)
end
function UnavailableResultType(pd)
    o = UnavailableResultType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o
end

export UnavailableResultType


type DescribeImagesItemType
    imageId::Union{String, Void}

    DescribeImagesItemType(; imageId=nothing) =
         new(imageId)
end
function DescribeImagesItemType(pd)
    o = DescribeImagesItemType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::Union{String, Void}

    DescribeImagesOwnerType(; owner=nothing) =
         new(owner)
end
function DescribeImagesOwnerType(pd)
    o = DescribeImagesOwnerType()
    o.owner = LightXML.content(LightXML.find_element(pd, "owner"))
    o
end

export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::Union{String, Void}

    DescribeImagesExecutableByType(; user=nothing) =
         new(user)
end
function DescribeImagesExecutableByType(pd)
    o = DescribeImagesExecutableByType()
    o.user = LightXML.content(LightXML.find_element(pd, "user"))
    o
end

export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::Union{String, Void}
    groupDescription::Union{String, Void}
    vpcId::Union{String, Void}

    CreateSecurityGroupType(; groupName=nothing, groupDescription=nothing, vpcId=nothing) =
         new(groupName, groupDescription, vpcId)
end
function CreateSecurityGroupType(pd)
    o = CreateSecurityGroupType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.groupDescription = LightXML.content(LightXML.find_element(pd, "groupDescription"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}
    groupId::Union{String, Void}

    CreateSecurityGroupResponseType(; requestId=nothing, _return=nothing, groupId=nothing) =
         new(requestId, _return, groupId)
end
function CreateSecurityGroupResponseType(pd)
    o = CreateSecurityGroupResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o
end

export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union{String, Void}
    groupName::Union{String, Void}

    DeleteSecurityGroupType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function DeleteSecurityGroupType(pd)
    o = DeleteSecurityGroupType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteSecurityGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSecurityGroupResponseType(pd)
    o = DeleteSecurityGroupResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::Union{String, Void}

    DescribeSecurityGroupsSetItemType(; groupName=nothing) =
         new(groupName)
end
function DescribeSecurityGroupsSetItemType(pd)
    o = DescribeSecurityGroupsSetItemType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::Union{String, Void}

    DescribeSecurityGroupsIdSetItemType(; groupId=nothing) =
         new(groupId)
end
function DescribeSecurityGroupsIdSetItemType(pd)
    o = DescribeSecurityGroupsIdSetItemType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o
end

export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::Union{String, Void}

    IpRangeItemType(; cidrIp=nothing) =
         new(cidrIp)
end
function IpRangeItemType(pd)
    o = IpRangeItemType()
    o.cidrIp = LightXML.content(LightXML.find_element(pd, "cidrIp"))
    o
end

export IpRangeItemType


type UserIdGroupPairType
    userId::Union{String, Void}
    groupId::Union{String, Void}
    groupName::Union{String, Void}

    UserIdGroupPairType(; userId=nothing, groupId=nothing, groupName=nothing) =
         new(userId, groupId, groupName)
end
function UserIdGroupPairType(pd)
    o = UserIdGroupPairType()
    o.userId = LightXML.content(LightXML.find_element(pd, "userId"))
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    AuthorizeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AuthorizeSecurityGroupIngressResponseType(pd)
    o = AuthorizeSecurityGroupIngressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    RevokeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RevokeSecurityGroupIngressResponseType(pd)
    o = RevokeSecurityGroupIngressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    AuthorizeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AuthorizeSecurityGroupEgressResponseType(pd)
    o = AuthorizeSecurityGroupEgressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    RevokeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RevokeSecurityGroupEgressResponseType(pd)
    o = RevokeSecurityGroupEgressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Union{Int64, Void}
    name::Union{String, Void}

    InstanceStateType(; code=nothing, name=nothing) =
         new(code, name)
end
function InstanceStateType(pd)
    o = InstanceStateType()
    o.code = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "code")))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o
end

export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::Union{String, Void}

    ModifyInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function ModifyInstanceAttributeType(pd)
    o = ModifyInstanceAttributeType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::Union{String, Void}

    SecurityGroupIdSetItemType(; groupId=nothing) =
         new(groupId)
end
function SecurityGroupIdSetItemType(pd)
    o = SecurityGroupIdSetItemType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o
end

export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifyInstanceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyInstanceAttributeResponseType(pd)
    o = ModifyInstanceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::Union{String, Void}

    ResetInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function ResetInstanceAttributeType(pd)
    o = ResetInstanceAttributeType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ResetInstanceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetInstanceAttributeResponseType(pd)
    o = ResetInstanceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::Union{String, Void}

    DescribeInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function DescribeInstanceAttributeType(pd)
    o = DescribeInstanceAttributeType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::Union{String, Void}
    instanceId::Union{String, Void}

    DescribeInstanceAttributeResponseType(; requestId=nothing, instanceId=nothing) =
         new(requestId, instanceId)
end
function DescribeInstanceAttributeResponseType(pd)
    o = DescribeInstanceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::Union{String, Void}

    ModifyImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function ModifyImageAttributeType(pd)
    o = ModifyImageAttributeType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union{String, Void}
    group::Union{String, Void}

    LaunchPermissionItemType(; userId=nothing, group=nothing) =
         new(userId, group)
end
function LaunchPermissionItemType(pd)
    o = LaunchPermissionItemType()
    o.userId = LightXML.content(LightXML.find_element(pd, "userId"))
    o.group = LightXML.content(LightXML.find_element(pd, "group"))
    o
end

export LaunchPermissionItemType


type ProductCodeItemType
    productCode::Union{String, Void}

    ProductCodeItemType(; productCode=nothing) =
         new(productCode)
end
function ProductCodeItemType(pd)
    o = ProductCodeItemType()
    o.productCode = LightXML.content(LightXML.find_element(pd, "productCode"))
    o
end

export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifyImageAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyImageAttributeResponseType(pd)
    o = ModifyImageAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::Union{String, Void}

    ResetImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function ResetImageAttributeType(pd)
    o = ResetImageAttributeType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ResetImageAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetImageAttributeResponseType(pd)
    o = ResetImageAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::Union{String, Void}

    DescribeImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function DescribeImageAttributeType(pd)
    o = DescribeImageAttributeType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::Union{String, Void}
    imageId::Union{String, Void}

    DescribeImageAttributeResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function DescribeImageAttributeResponseType(pd)
    o = DescribeImageAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union{String, Void}

    NullableAttributeValueType(; value=nothing) =
         new(value)
end
function NullableAttributeValueType(pd)
    o = NullableAttributeValueType()
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union{Bool, Void}

    NullableAttributeBooleanValueType(; value=nothing) =
         new(value)
end
function NullableAttributeBooleanValueType(pd)
    o = NullableAttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "value")))
    o
end

export NullableAttributeBooleanValueType


type AttributeValueType
    value::Union{String, Void}

    AttributeValueType(; value=nothing) =
         new(value)
end
function AttributeValueType(pd)
    o = AttributeValueType()
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export AttributeValueType


type AttributeBooleanValueType
    value::Union{Bool, Void}

    AttributeBooleanValueType(; value=nothing) =
         new(value)
end
function AttributeBooleanValueType(pd)
    o = AttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "value")))
    o
end

export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::Union{String, Void}
    instanceId::Union{String, Void}

    ConfirmProductInstanceType(; productCode=nothing, instanceId=nothing) =
         new(productCode, instanceId)
end
function ConfirmProductInstanceType(pd)
    o = ConfirmProductInstanceType()
    o.productCode = LightXML.content(LightXML.find_element(pd, "productCode"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::Union{String, Void}
    _type::Union{String, Void}

    ProductCodesSetItemType(; productCode=nothing, _type=nothing) =
         new(productCode, _type)
end
function ProductCodesSetItemType(pd)
    o = ProductCodesSetItemType()
    o.productCode = LightXML.content(LightXML.find_element(pd, "productCode"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o
end

export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}
    ownerId::Union{String, Void}

    ConfirmProductInstanceResponseType(; requestId=nothing, _return=nothing, ownerId=nothing) =
         new(requestId, _return, ownerId)
end
function ConfirmProductInstanceResponseType(pd)
    o = ConfirmProductInstanceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o
end

export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::Union{String, Void}

    DescribeAvailabilityZonesSetItemType(; zoneName=nothing) =
         new(zoneName)
end
function DescribeAvailabilityZonesSetItemType(pd)
    o = DescribeAvailabilityZonesSetItemType()
    o.zoneName = LightXML.content(LightXML.find_element(pd, "zoneName"))
    o
end

export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::Union{String, Void}

    AvailabilityZoneMessageType(; message=nothing) =
         new(message)
end
function AvailabilityZoneMessageType(pd)
    o = AvailabilityZoneMessageType()
    o.message = LightXML.content(LightXML.find_element(pd, "message"))
    o
end

export AvailabilityZoneMessageType


type AvailabilityZoneItemType
    zoneName::Union{String, Void}
    zoneState::Union{String, Void}
    regionName::Union{String, Void}
    messageSet::Union{Vector{String}, Void}

    AvailabilityZoneItemType(; zoneName=nothing, zoneState=nothing, regionName=nothing, messageSet=nothing) =
         new(zoneName, zoneState, regionName, messageSet)
end
function AvailabilityZoneItemType(pd)
    o = AvailabilityZoneItemType()
    o.zoneName = LightXML.content(LightXML.find_element(pd, "zoneName"))
    o.zoneState = LightXML.content(LightXML.find_element(pd, "zoneState"))
    o.regionName = LightXML.content(LightXML.find_element(pd, "regionName"))
    o.messageSet = AWS.parse_vector_as(String, "message", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "message"))
    o
end

export AvailabilityZoneItemType


type AllocateAddressType
    domain::Union{String, Void}

    AllocateAddressType(; domain=nothing) =
         new(domain)
end
function AllocateAddressType(pd)
    o = AllocateAddressType()
    o.domain = LightXML.content(LightXML.find_element(pd, "domain"))
    o
end

export AllocateAddressType


type AllocateAddressResponseType
    requestId::Union{String, Void}
    publicIp::Union{String, Void}
    domain::Union{String, Void}
    allocationId::Union{String, Void}

    AllocateAddressResponseType(; requestId=nothing, publicIp=nothing, domain=nothing, allocationId=nothing) =
         new(requestId, publicIp, domain, allocationId)
end
function AllocateAddressResponseType(pd)
    o = AllocateAddressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.domain = LightXML.content(LightXML.find_element(pd, "domain"))
    o.allocationId = LightXML.content(LightXML.find_element(pd, "allocationId"))
    o
end

export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union{String, Void}
    allocationId::Union{String, Void}

    ReleaseAddressType(; publicIp=nothing, allocationId=nothing) =
         new(publicIp, allocationId)
end
function ReleaseAddressType(pd)
    o = ReleaseAddressType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.allocationId = LightXML.content(LightXML.find_element(pd, "allocationId"))
    o
end

export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ReleaseAddressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReleaseAddressResponseType(pd)
    o = ReleaseAddressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::Union{String, Void}

    AllocationIdSetItemType(; allocationId=nothing) =
         new(allocationId)
end
function AllocationIdSetItemType(pd)
    o = AllocationIdSetItemType()
    o.allocationId = LightXML.content(LightXML.find_element(pd, "allocationId"))
    o
end

export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::Union{String, Void}

    DescribeAddressesItemType(; publicIp=nothing) =
         new(publicIp)
end
function DescribeAddressesItemType(pd)
    o = DescribeAddressesItemType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o
end

export DescribeAddressesItemType


type DescribeAddressesResponseItemType
    publicIp::Union{String, Void}
    allocationId::Union{String, Void}
    domain::Union{String, Void}
    instanceId::Union{String, Void}
    associationId::Union{String, Void}
    networkInterfaceId::Union{String, Void}
    networkInterfaceOwnerId::Union{String, Void}
    privateIpAddress::Union{String, Void}

    DescribeAddressesResponseItemType(; publicIp=nothing, allocationId=nothing, domain=nothing, instanceId=nothing, associationId=nothing, networkInterfaceId=nothing, networkInterfaceOwnerId=nothing, privateIpAddress=nothing) =
         new(publicIp, allocationId, domain, instanceId, associationId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress)
end
function DescribeAddressesResponseItemType(pd)
    o = DescribeAddressesResponseItemType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.allocationId = LightXML.content(LightXML.find_element(pd, "allocationId"))
    o.domain = LightXML.content(LightXML.find_element(pd, "domain"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.networkInterfaceOwnerId = LightXML.content(LightXML.find_element(pd, "networkInterfaceOwnerId"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o
end

export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union{String, Void}
    allowReassociation::Union{Bool, Void}

    AssociateAddressType(; privateIpAddress=nothing, allowReassociation=nothing) =
         new(privateIpAddress, allowReassociation)
end
function AssociateAddressType(pd)
    o = AssociateAddressType()
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.allowReassociation = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "allowReassociation")))
    o
end

export AssociateAddressType


type AssociateAddressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}
    associationId::Union{String, Void}

    AssociateAddressResponseType(; requestId=nothing, _return=nothing, associationId=nothing) =
         new(requestId, _return, associationId)
end
function AssociateAddressResponseType(pd)
    o = AssociateAddressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o
end

export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union{String, Void}
    associationId::Union{String, Void}

    DisassociateAddressType(; publicIp=nothing, associationId=nothing) =
         new(publicIp, associationId)
end
function DisassociateAddressType(pd)
    o = DisassociateAddressType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o
end

export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DisassociateAddressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisassociateAddressResponseType(pd)
    o = DisassociateAddressResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DisassociateAddressResponseType


type CreateVolumeType
    size::Union{String, Void}
    snapshotId::Union{String, Void}
    availabilityZone::Union{String, Void}
    volumeType::Union{String, Void}
    iops::Union{Int64, Void}

    CreateVolumeType(; size=nothing, snapshotId=nothing, availabilityZone=nothing, volumeType=nothing, iops=nothing) =
         new(size, snapshotId, availabilityZone, volumeType, iops)
end
function CreateVolumeType(pd)
    o = CreateVolumeType()
    o.size = LightXML.content(LightXML.find_element(pd, "size"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.volumeType = LightXML.content(LightXML.find_element(pd, "volumeType"))
    o.iops = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "iops")))
    o
end

export CreateVolumeType


type CreateVolumeResponseType
    requestId::Union{String, Void}
    volumeId::Union{String, Void}
    size::Union{String, Void}
    snapshotId::Union{String, Void}
    availabilityZone::Union{String, Void}
    status::Union{String, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    volumeType::Union{String, Void}
    iops::Union{Int64, Void}

    CreateVolumeResponseType(; requestId=nothing, volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, volumeType=nothing, iops=nothing) =
         new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops)
end
function CreateVolumeResponseType(pd)
    o = CreateVolumeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.size = LightXML.content(LightXML.find_element(pd, "size"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "createTime")))
    o.volumeType = LightXML.content(LightXML.find_element(pd, "volumeType"))
    o.iops = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "iops")))
    o
end

export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::Union{String, Void}

    DeleteVolumeType(; volumeId=nothing) =
         new(volumeId)
end
function DeleteVolumeType(pd)
    o = DeleteVolumeType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteVolumeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVolumeResponseType(pd)
    o = DeleteVolumeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::Union{String, Void}

    DescribeVolumesSetItemType(; volumeId=nothing) =
         new(volumeId)
end
function DescribeVolumesSetItemType(pd)
    o = DescribeVolumesSetItemType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::Union{String, Void}
    instanceId::Union{String, Void}
    device::Union{String, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    AttachmentSetItemResponseType(; volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end
function AttachmentSetItemResponseType(pd)
    o = AttachmentSetItemResponseType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.device = LightXML.content(LightXML.find_element(pd, "device"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::Union{String, Void}
    instanceId::Union{String, Void}
    device::Union{String, Void}

    AttachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing) =
         new(volumeId, instanceId, device)
end
function AttachVolumeType(pd)
    o = AttachVolumeType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.device = LightXML.content(LightXML.find_element(pd, "device"))
    o
end

export AttachVolumeType


type AttachVolumeResponseType
    requestId::Union{String, Void}
    volumeId::Union{String, Void}
    instanceId::Union{String, Void}
    device::Union{String, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}

    AttachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) =
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function AttachVolumeResponseType(pd)
    o = AttachVolumeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.device = LightXML.content(LightXML.find_element(pd, "device"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o
end

export AttachVolumeResponseType


type DetachVolumeType
    volumeId::Union{String, Void}
    instanceId::Union{String, Void}
    device::Union{String, Void}
    force::Union{Bool, Void}

    DetachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing, force=nothing) =
         new(volumeId, instanceId, device, force)
end
function DetachVolumeType(pd)
    o = DetachVolumeType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.device = LightXML.content(LightXML.find_element(pd, "device"))
    o.force = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "force")))
    o
end

export DetachVolumeType


type DetachVolumeResponseType
    requestId::Union{String, Void}
    volumeId::Union{String, Void}
    instanceId::Union{String, Void}
    device::Union{String, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}

    DetachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) =
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function DetachVolumeResponseType(pd)
    o = DetachVolumeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.device = LightXML.content(LightXML.find_element(pd, "device"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o
end

export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::Union{String, Void}
    description::Union{String, Void}

    CreateSnapshotType(; volumeId=nothing, description=nothing) =
         new(volumeId, description)
end
function CreateSnapshotType(pd)
    o = CreateSnapshotType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o
end

export CreateSnapshotType


type CreateSnapshotResponseType
    requestId::Union{String, Void}
    snapshotId::Union{String, Void}
    volumeId::Union{String, Void}
    status::Union{String, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    progress::Union{String, Void}
    ownerId::Union{String, Void}
    volumeSize::Union{String, Void}
    description::Union{String, Void}

    CreateSnapshotResponseType(; requestId=nothing, snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing) =
         new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description)
end
function CreateSnapshotResponseType(pd)
    o = CreateSnapshotResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "startTime")))
    o.progress = LightXML.content(LightXML.find_element(pd, "progress"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.volumeSize = LightXML.content(LightXML.find_element(pd, "volumeSize"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o
end

export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::Union{String, Void}
    sourceSnapshotId::Union{String, Void}
    description::Union{String, Void}

    CopySnapshotType(; sourceRegion=nothing, sourceSnapshotId=nothing, description=nothing) =
         new(sourceRegion, sourceSnapshotId, description)
end
function CopySnapshotType(pd)
    o = CopySnapshotType()
    o.sourceRegion = LightXML.content(LightXML.find_element(pd, "sourceRegion"))
    o.sourceSnapshotId = LightXML.content(LightXML.find_element(pd, "sourceSnapshotId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o
end

export CopySnapshotType


type CopySnapshotResponseType
    requestId::Union{String, Void}
    snapshotId::Union{String, Void}

    CopySnapshotResponseType(; requestId=nothing, snapshotId=nothing) =
         new(requestId, snapshotId)
end
function CopySnapshotResponseType(pd)
    o = CopySnapshotResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::Union{String, Void}

    DeleteSnapshotType(; snapshotId=nothing) =
         new(snapshotId)
end
function DeleteSnapshotType(pd)
    o = DeleteSnapshotType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteSnapshotResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSnapshotResponseType(pd)
    o = DeleteSnapshotResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::Union{String, Void}

    DescribeSnapshotsSetItemType(; snapshotId=nothing) =
         new(snapshotId)
end
function DescribeSnapshotsSetItemType(pd)
    o = DescribeSnapshotsSetItemType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::Union{String, Void}

    DescribeSnapshotsOwnerType(; owner=nothing) =
         new(owner)
end
function DescribeSnapshotsOwnerType(pd)
    o = DescribeSnapshotsOwnerType()
    o.owner = LightXML.content(LightXML.find_element(pd, "owner"))
    o
end

export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::Union{String, Void}

    DescribeSnapshotsRestorableByType(; user=nothing) =
         new(user)
end
function DescribeSnapshotsRestorableByType(pd)
    o = DescribeSnapshotsRestorableByType()
    o.user = LightXML.content(LightXML.find_element(pd, "user"))
    o
end

export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union{String, Void}
    group::Union{String, Void}

    CreateVolumePermissionItemType(; userId=nothing, group=nothing) =
         new(userId, group)
end
function CreateVolumePermissionItemType(pd)
    o = CreateVolumePermissionItemType()
    o.userId = LightXML.content(LightXML.find_element(pd, "userId"))
    o.group = LightXML.content(LightXML.find_element(pd, "group"))
    o
end

export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifySnapshotAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifySnapshotAttributeResponseType(pd)
    o = ModifySnapshotAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::Union{String, Void}

    ResetSnapshotAttributeType(; snapshotId=nothing) =
         new(snapshotId)
end
function ResetSnapshotAttributeType(pd)
    o = ResetSnapshotAttributeType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ResetSnapshotAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetSnapshotAttributeResponseType(pd)
    o = ResetSnapshotAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::Union{String, Void}

    DescribeSnapshotAttributeType(; snapshotId=nothing) =
         new(snapshotId)
end
function DescribeSnapshotAttributeType(pd)
    o = DescribeSnapshotAttributeType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::Union{String, Void}
    snapshotId::Union{String, Void}

    DescribeSnapshotAttributeResponseType(; requestId=nothing, snapshotId=nothing) =
         new(requestId, snapshotId)
end
function DescribeSnapshotAttributeResponseType(pd)
    o = DescribeSnapshotAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o
end

export DescribeSnapshotAttributeResponseType


type BundleInstanceS3StorageType
    bucket::Union{String, Void}
    prefix::Union{String, Void}
    awsAccessKeyId::Union{String, Void}
    uploadPolicy::Union{String, Void}
    uploadPolicySignature::Union{String, Void}

    BundleInstanceS3StorageType(; bucket=nothing, prefix=nothing, awsAccessKeyId=nothing, uploadPolicy=nothing, uploadPolicySignature=nothing) =
         new(bucket, prefix, awsAccessKeyId, uploadPolicy, uploadPolicySignature)
end
function BundleInstanceS3StorageType(pd)
    o = BundleInstanceS3StorageType()
    o.bucket = LightXML.content(LightXML.find_element(pd, "bucket"))
    o.prefix = LightXML.content(LightXML.find_element(pd, "prefix"))
    o.awsAccessKeyId = LightXML.content(LightXML.find_element(pd, "awsAccessKeyId"))
    o.uploadPolicy = LightXML.content(LightXML.find_element(pd, "uploadPolicy"))
    o.uploadPolicySignature = LightXML.content(LightXML.find_element(pd, "uploadPolicySignature"))
    o
end

export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::Union{String, Void}
    message::Union{String, Void}

    BundleInstanceTaskErrorType(; code=nothing, message=nothing) =
         new(code, message)
end
function BundleInstanceTaskErrorType(pd)
    o = BundleInstanceTaskErrorType()
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.message = LightXML.content(LightXML.find_element(pd, "message"))
    o
end

export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::Union{String, Void}

    DescribeBundleTasksItemType(; bundleId=nothing) =
         new(bundleId)
end
function DescribeBundleTasksItemType(pd)
    o = DescribeBundleTasksItemType()
    o.bundleId = LightXML.content(LightXML.find_element(pd, "bundleId"))
    o
end

export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::Union{String, Void}

    CancelBundleTaskType(; bundleId=nothing) =
         new(bundleId)
end
function CancelBundleTaskType(pd)
    o = CancelBundleTaskType()
    o.bundleId = LightXML.content(LightXML.find_element(pd, "bundleId"))
    o
end

export CancelBundleTaskType


type CopyImageType
    sourceRegion::Union{String, Void}
    sourceImageId::Union{String, Void}
    name::Union{String, Void}
    description::Union{String, Void}
    clientToken::Union{String, Void}

    CopyImageType(; sourceRegion=nothing, sourceImageId=nothing, name=nothing, description=nothing, clientToken=nothing) =
         new(sourceRegion, sourceImageId, name, description, clientToken)
end
function CopyImageType(pd)
    o = CopyImageType()
    o.sourceRegion = LightXML.content(LightXML.find_element(pd, "sourceRegion"))
    o.sourceImageId = LightXML.content(LightXML.find_element(pd, "sourceImageId"))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
    o
end

export CopyImageType


type CopyImageResponseType
    requestId::Union{String, Void}
    imageId::Union{String, Void}

    CopyImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function CopyImageResponseType(pd)
    o = CopyImageResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o
end

export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::Union{String, Void}

    DescribeRegionsSetItemType(; regionName=nothing) =
         new(regionName)
end
function DescribeRegionsSetItemType(pd)
    o = DescribeRegionsSetItemType()
    o.regionName = LightXML.content(LightXML.find_element(pd, "regionName"))
    o
end

export DescribeRegionsSetItemType


type RegionItemType
    regionName::Union{String, Void}
    regionEndpoint::Union{String, Void}

    RegionItemType(; regionName=nothing, regionEndpoint=nothing) =
         new(regionName, regionEndpoint)
end
function RegionItemType(pd)
    o = RegionItemType()
    o.regionName = LightXML.content(LightXML.find_element(pd, "regionName"))
    o.regionEndpoint = LightXML.content(LightXML.find_element(pd, "regionEndpoint"))
    o
end

export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::Union{String, Void}

    DescribeReservedInstancesOfferingsSetItemType(; reservedInstancesOfferingId=nothing) =
         new(reservedInstancesOfferingId)
end
function DescribeReservedInstancesOfferingsSetItemType(pd)
    o = DescribeReservedInstancesOfferingsSetItemType()
    o.reservedInstancesOfferingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesOfferingId"))
    o
end

export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::Union{String, Void}
    amount::Union{Float64, Void}

    RecurringChargesSetItemType(; frequency=nothing, amount=nothing) =
         new(frequency, amount)
end
function RecurringChargesSetItemType(pd)
    o = RecurringChargesSetItemType()
    o.frequency = LightXML.content(LightXML.find_element(pd, "frequency"))
    o.amount = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "amount")))
    o
end

export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Union{Float64, Void}
    count::Union{Int64, Void}

    PricingDetailsSetItemType(; price=nothing, count=nothing) =
         new(price, count)
end
function PricingDetailsSetItemType(pd)
    o = PricingDetailsSetItemType()
    o.price = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "price")))
    o.count = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "count")))
    o
end

export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Union{Float64, Void}
    currencyCode::Union{String, Void}

    ReservedInstanceLimitPriceType(; amount=nothing, currencyCode=nothing) =
         new(amount, currencyCode)
end
function ReservedInstanceLimitPriceType(pd)
    o = ReservedInstanceLimitPriceType()
    o.amount = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "amount")))
    o.currencyCode = LightXML.content(LightXML.find_element(pd, "currencyCode"))
    o
end

export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::Union{String, Void}
    reservedInstancesId::Union{String, Void}

    PurchaseReservedInstancesOfferingResponseType(; requestId=nothing, reservedInstancesId=nothing) =
         new(requestId, reservedInstancesId)
end
function PurchaseReservedInstancesOfferingResponseType(pd)
    o = PurchaseReservedInstancesOfferingResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesId = LightXML.content(LightXML.find_element(pd, "reservedInstancesId"))
    o
end

export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::Union{String, Void}

    DescribeReservedInstancesSetItemType(; reservedInstancesId=nothing) =
         new(reservedInstancesId)
end
function DescribeReservedInstancesSetItemType(pd)
    o = DescribeReservedInstancesSetItemType()
    o.reservedInstancesId = LightXML.content(LightXML.find_element(pd, "reservedInstancesId"))
    o
end

export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Union{Int64, Void}
    price::Union{Float64, Void}
    currencyCode::Union{String, Void}

    PriceScheduleRequestSetItemType(; term=nothing, price=nothing, currencyCode=nothing) =
         new(term, price, currencyCode)
end
function PriceScheduleRequestSetItemType(pd)
    o = PriceScheduleRequestSetItemType()
    o.term = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "term")))
    o.price = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "price")))
    o.currencyCode = LightXML.content(LightXML.find_element(pd, "currencyCode"))
    o
end

export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::Union{String, Void}

    CancelReservedInstancesListingType(; reservedInstancesListingId=nothing) =
         new(reservedInstancesListingId)
end
function CancelReservedInstancesListingType(pd)
    o = CancelReservedInstancesListingType()
    o.reservedInstancesListingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesListingId"))
    o
end

export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::Union{String, Void}

    DescribeReservedInstancesListingSetItemType(; reservedInstancesListingId=nothing) =
         new(reservedInstancesListingId)
end
function DescribeReservedInstancesListingSetItemType(pd)
    o = DescribeReservedInstancesListingSetItemType()
    o.reservedInstancesListingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesListingId"))
    o
end

export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::Union{String, Void}
    instanceCount::Union{Int64, Void}

    InstanceCountsSetItemType(; state=nothing, instanceCount=nothing) =
         new(state, instanceCount)
end
function InstanceCountsSetItemType(pd)
    o = InstanceCountsSetItemType()
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.instanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCount")))
    o
end

export InstanceCountsSetItemType


type PriceScheduleSetItemType
    term::Union{Int64, Void}
    price::Union{Float64, Void}
    currencyCode::Union{String, Void}
    active::Union{Bool, Void}

    PriceScheduleSetItemType(; term=nothing, price=nothing, currencyCode=nothing, active=nothing) =
         new(term, price, currencyCode, active)
end
function PriceScheduleSetItemType(pd)
    o = PriceScheduleSetItemType()
    o.term = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "term")))
    o.price = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "price")))
    o.currencyCode = LightXML.content(LightXML.find_element(pd, "currencyCode"))
    o.active = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "active")))
    o
end

export PriceScheduleSetItemType


type MonitorInstancesType
    instancesSet::Union{Vector{String}, Void}

    MonitorInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function MonitorInstancesType(pd)
    o = MonitorInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o
end

export MonitorInstancesType


type MonitorInstancesSetItemType
    instanceId::Union{String, Void}

    MonitorInstancesSetItemType(; instanceId=nothing) =
         new(instanceId)
end
function MonitorInstancesSetItemType(pd)
    o = MonitorInstancesSetItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o
end

export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::Union{String, Void}

    InstanceMonitoringStateType(; state=nothing) =
         new(state)
end
function InstanceMonitoringStateType(pd)
    o = InstanceMonitoringStateType()
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export InstanceMonitoringStateType


type AttachmentType
    vpcId::Union{String, Void}
    state::Union{String, Void}

    AttachmentType(; vpcId=nothing, state=nothing) =
         new(vpcId, state)
end
function AttachmentType(pd)
    o = AttachmentType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union{Bool, Void}

    VpnConnectionOptionsResponseType(; staticRoutesOnly=nothing) =
         new(staticRoutesOnly)
end
function VpnConnectionOptionsResponseType(pd)
    o = VpnConnectionOptionsResponseType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "staticRoutesOnly")))
    o
end

export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::Union{String, Void}
    source::Union{String, Void}
    state::Union{String, Void}

    VpnStaticRouteType(; destinationCidrBlock=nothing, source=nothing, state=nothing) =
         new(destinationCidrBlock, source, state)
end
function VpnStaticRouteType(pd)
    o = VpnStaticRouteType()
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o.source = LightXML.content(LightXML.find_element(pd, "source"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::Union{String, Void}
    status::Union{String, Void}
    lastStatusChange::Union{Base.Dates.DateTime, Void}
    statusMessage::Union{String, Void}
    acceptedRouteCount::Union{Int64, Void}

    VpnTunnelTelemetryType(; outsideIpAddress=nothing, status=nothing, lastStatusChange=nothing, statusMessage=nothing, acceptedRouteCount=nothing) =
         new(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount)
end
function VpnTunnelTelemetryType(pd)
    o = VpnTunnelTelemetryType()
    o.outsideIpAddress = LightXML.content(LightXML.find_element(pd, "outsideIpAddress"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.lastStatusChange = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "lastStatusChange")))
    o.statusMessage = LightXML.content(LightXML.find_element(pd, "statusMessage"))
    o.acceptedRouteCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "acceptedRouteCount")))
    o
end

export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::Union{String, Void}

    CustomerGatewayIdSetItemType(; customerGatewayId=nothing) =
         new(customerGatewayId)
end
function CustomerGatewayIdSetItemType(pd)
    o = CustomerGatewayIdSetItemType()
    o.customerGatewayId = LightXML.content(LightXML.find_element(pd, "customerGatewayId"))
    o
end

export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::Union{String, Void}

    VpnGatewayIdSetItemType(; vpnGatewayId=nothing) =
         new(vpnGatewayId)
end
function VpnGatewayIdSetItemType(pd)
    o = VpnGatewayIdSetItemType()
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o
end

export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::Union{String, Void}

    VpnConnectionIdSetItemType(; vpnConnectionId=nothing) =
         new(vpnConnectionId)
end
function VpnConnectionIdSetItemType(pd)
    o = VpnConnectionIdSetItemType()
    o.vpnConnectionId = LightXML.content(LightXML.find_element(pd, "vpnConnectionId"))
    o
end

export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::Union{String, Void}

    VpcIdSetItemType(; vpcId=nothing) =
         new(vpcId)
end
function VpcIdSetItemType(pd)
    o = VpcIdSetItemType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::Union{String, Void}

    SubnetIdSetItemType(; subnetId=nothing) =
         new(subnetId)
end
function SubnetIdSetItemType(pd)
    o = SubnetIdSetItemType()
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o
end

export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::Union{String, Void}

    DhcpOptionsIdSetItemType(; dhcpOptionsId=nothing) =
         new(dhcpOptionsId)
end
function DhcpOptionsIdSetItemType(pd)
    o = DhcpOptionsIdSetItemType()
    o.dhcpOptionsId = LightXML.content(LightXML.find_element(pd, "dhcpOptionsId"))
    o
end

export DhcpOptionsIdSetItemType


type DhcpConfigurationItemType
    key::Union{String, Void}
    valueSet::Union{Vector{String}, Void}

    DhcpConfigurationItemType(; key=nothing, valueSet=nothing) =
         new(key, valueSet)
end
function DhcpConfigurationItemType(pd)
    o = DhcpConfigurationItemType()
    o.key = LightXML.content(LightXML.find_element(pd, "key"))
    o.valueSet = AWS.parse_vector_as(String, "value", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "value"))
    o
end

export DhcpConfigurationItemType


type DhcpValueType
    value::Union{String, Void}

    DhcpValueType(; value=nothing) =
         new(value)
end
function DhcpValueType(pd)
    o = DhcpValueType()
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export DhcpValueType


type ValueType
    value::Union{String, Void}

    ValueType(; value=nothing) =
         new(value)
end
function ValueType(pd)
    o = ValueType()
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export ValueType


type CreateCustomerGatewayType
    _type::Union{String, Void}
    ipAddress::Union{String, Void}
    bgpAsn::Union{Int64, Void}

    CreateCustomerGatewayType(; _type=nothing, ipAddress=nothing, bgpAsn=nothing) =
         new(_type, ipAddress, bgpAsn)
end
function CreateCustomerGatewayType(pd)
    o = CreateCustomerGatewayType()
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.ipAddress = LightXML.content(LightXML.find_element(pd, "ipAddress"))
    o.bgpAsn = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "bgpAsn")))
    o
end

export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::Union{String, Void}

    DeleteCustomerGatewayType(; customerGatewayId=nothing) =
         new(customerGatewayId)
end
function DeleteCustomerGatewayType(pd)
    o = DeleteCustomerGatewayType()
    o.customerGatewayId = LightXML.content(LightXML.find_element(pd, "customerGatewayId"))
    o
end

export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteCustomerGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteCustomerGatewayResponseType(pd)
    o = DeleteCustomerGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::Union{String, Void}
    availabilityZone::Union{String, Void}

    CreateVpnGatewayType(; _type=nothing, availabilityZone=nothing) =
         new(_type, availabilityZone)
end
function CreateVpnGatewayType(pd)
    o = CreateVpnGatewayType()
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o
end

export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::Union{String, Void}

    DeleteVpnGatewayType(; vpnGatewayId=nothing) =
         new(vpnGatewayId)
end
function DeleteVpnGatewayType(pd)
    o = DeleteVpnGatewayType()
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o
end

export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteVpnGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnGatewayResponseType(pd)
    o = DeleteVpnGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union{Bool, Void}

    VpnConnectionOptionsRequestType(; staticRoutesOnly=nothing) =
         new(staticRoutesOnly)
end
function VpnConnectionOptionsRequestType(pd)
    o = VpnConnectionOptionsRequestType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "staticRoutesOnly")))
    o
end

export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::Union{String, Void}
    destinationCidrBlock::Union{String, Void}

    CreateVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) =
         new(vpnConnectionId, destinationCidrBlock)
end
function CreateVpnConnectionRouteType(pd)
    o = CreateVpnConnectionRouteType()
    o.vpnConnectionId = LightXML.content(LightXML.find_element(pd, "vpnConnectionId"))
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o
end

export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CreateVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateVpnConnectionRouteResponseType(pd)
    o = CreateVpnConnectionRouteResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::Union{String, Void}
    destinationCidrBlock::Union{String, Void}

    DeleteVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) =
         new(vpnConnectionId, destinationCidrBlock)
end
function DeleteVpnConnectionRouteType(pd)
    o = DeleteVpnConnectionRouteType()
    o.vpnConnectionId = LightXML.content(LightXML.find_element(pd, "vpnConnectionId"))
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o
end

export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnConnectionRouteResponseType(pd)
    o = DeleteVpnConnectionRouteResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::Union{String, Void}

    DeleteVpnConnectionType(; vpnConnectionId=nothing) =
         new(vpnConnectionId)
end
function DeleteVpnConnectionType(pd)
    o = DeleteVpnConnectionType()
    o.vpnConnectionId = LightXML.content(LightXML.find_element(pd, "vpnConnectionId"))
    o
end

export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteVpnConnectionResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnConnectionResponseType(pd)
    o = DeleteVpnConnectionResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::Union{String, Void}
    vpcId::Union{String, Void}

    AttachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) =
         new(vpnGatewayId, vpcId)
end
function AttachVpnGatewayType(pd)
    o = AttachVpnGatewayType()
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::Union{String, Void}
    vpcId::Union{String, Void}

    DetachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) =
         new(vpnGatewayId, vpcId)
end
function DetachVpnGatewayType(pd)
    o = DetachVpnGatewayType()
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DetachVpnGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachVpnGatewayResponseType(pd)
    o = DetachVpnGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::Union{String, Void}
    instanceTenancy::Union{String, Void}

    CreateVpcType(; cidrBlock=nothing, instanceTenancy=nothing) =
         new(cidrBlock, instanceTenancy)
end
function CreateVpcType(pd)
    o = CreateVpcType()
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    o.instanceTenancy = LightXML.content(LightXML.find_element(pd, "instanceTenancy"))
    o
end

export CreateVpcType


type DeleteVpcType
    vpcId::Union{String, Void}

    DeleteVpcType(; vpcId=nothing) =
         new(vpcId)
end
function DeleteVpcType(pd)
    o = DeleteVpcType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export DeleteVpcType


type DeleteVpcResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteVpcResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpcResponseType(pd)
    o = DeleteVpcResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteVpcResponseType


type CreateSubnetType
    vpcId::Union{String, Void}
    cidrBlock::Union{String, Void}
    availabilityZone::Union{String, Void}

    CreateSubnetType(; vpcId=nothing, cidrBlock=nothing, availabilityZone=nothing) =
         new(vpcId, cidrBlock, availabilityZone)
end
function CreateSubnetType(pd)
    o = CreateSubnetType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o
end

export CreateSubnetType


type DeleteSubnetType
    subnetId::Union{String, Void}

    DeleteSubnetType(; subnetId=nothing) =
         new(subnetId)
end
function DeleteSubnetType(pd)
    o = DeleteSubnetType()
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o
end

export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteSubnetResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSubnetResponseType(pd)
    o = DeleteSubnetResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::Union{String, Void}

    DeleteDhcpOptionsType(; dhcpOptionsId=nothing) =
         new(dhcpOptionsId)
end
function DeleteDhcpOptionsType(pd)
    o = DeleteDhcpOptionsType()
    o.dhcpOptionsId = LightXML.content(LightXML.find_element(pd, "dhcpOptionsId"))
    o
end

export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteDhcpOptionsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteDhcpOptionsResponseType(pd)
    o = DeleteDhcpOptionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::Union{String, Void}
    vpcId::Union{String, Void}

    AssociateDhcpOptionsType(; dhcpOptionsId=nothing, vpcId=nothing) =
         new(dhcpOptionsId, vpcId)
end
function AssociateDhcpOptionsType(pd)
    o = AssociateDhcpOptionsType()
    o.dhcpOptionsId = LightXML.content(LightXML.find_element(pd, "dhcpOptionsId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    AssociateDhcpOptionsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AssociateDhcpOptionsResponseType(pd)
    o = AssociateDhcpOptionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::Union{String, Void}
    message::Union{String, Void}

    SpotInstanceStateFaultType(; code=nothing, message=nothing) =
         new(code, message)
end
function SpotInstanceStateFaultType(pd)
    o = SpotInstanceStateFaultType()
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.message = LightXML.content(LightXML.find_element(pd, "message"))
    o
end

export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union{String, Void}
    updateTime::Union{Base.Dates.DateTime, Void}
    message::Union{String, Void}

    SpotInstanceStatusMessageType(; code=nothing, updateTime=nothing, message=nothing) =
         new(code, updateTime, message)
end
function SpotInstanceStatusMessageType(pd)
    o = SpotInstanceStatusMessageType()
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.updateTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "updateTime")))
    o.message = LightXML.content(LightXML.find_element(pd, "message"))
    o
end

export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::Union{String, Void}

    SpotInstanceRequestIdSetItemType(; spotInstanceRequestId=nothing) =
         new(spotInstanceRequestId)
end
function SpotInstanceRequestIdSetItemType(pd)
    o = SpotInstanceRequestIdSetItemType()
    o.spotInstanceRequestId = LightXML.content(LightXML.find_element(pd, "spotInstanceRequestId"))
    o
end

export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union{Vector{String}, Void}

    CancelSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing) =
         new(spotInstanceRequestIdSet)
end
function CancelSpotInstanceRequestsType(pd)
    o = CancelSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(String, "spotInstanceRequestId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "spotInstanceRequestId"))
    o
end

export CancelSpotInstanceRequestsType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::Union{String, Void}
    state::Union{String, Void}

    CancelSpotInstanceRequestsResponseSetItemType(; spotInstanceRequestId=nothing, state=nothing) =
         new(spotInstanceRequestId, state)
end
function CancelSpotInstanceRequestsResponseSetItemType(pd)
    o = CancelSpotInstanceRequestsResponseSetItemType()
    o.spotInstanceRequestId = LightXML.content(LightXML.find_element(pd, "spotInstanceRequestId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::Union{String, Void}

    InstanceTypeSetItemType(; instanceType=nothing) =
         new(instanceType)
end
function InstanceTypeSetItemType(pd)
    o = InstanceTypeSetItemType()
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o
end

export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::Union{String, Void}

    ProductDescriptionSetItemType(; productDescription=nothing) =
         new(productDescription)
end
function ProductDescriptionSetItemType(pd)
    o = ProductDescriptionSetItemType()
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o
end

export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::Union{String, Void}
    productDescription::Union{String, Void}
    spotPrice::Union{String, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    availabilityZone::Union{String, Void}

    SpotPriceHistorySetItemType(; instanceType=nothing, productDescription=nothing, spotPrice=nothing, timestamp=nothing, availabilityZone=nothing) =
         new(instanceType, productDescription, spotPrice, timestamp, availabilityZone)
end
function SpotPriceHistorySetItemType(pd)
    o = SpotPriceHistorySetItemType()
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o.spotPrice = LightXML.content(LightXML.find_element(pd, "spotPrice"))
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "timestamp")))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o
end

export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::Union{String, Void}
    prefix::Union{String, Void}

    CreateSpotDatafeedSubscriptionType(; bucket=nothing, prefix=nothing) =
         new(bucket, prefix)
end
function CreateSpotDatafeedSubscriptionType(pd)
    o = CreateSpotDatafeedSubscriptionType()
    o.bucket = LightXML.content(LightXML.find_element(pd, "bucket"))
    o.prefix = LightXML.content(LightXML.find_element(pd, "prefix"))
    o
end

export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteSpotDatafeedSubscriptionResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSpotDatafeedSubscriptionResponseType(pd)
    o = DeleteSpotDatafeedSubscriptionResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::Union{String, Void}

    LicenseIdSetItemType(; licenseId=nothing) =
         new(licenseId)
end
function LicenseIdSetItemType(pd)
    o = LicenseIdSetItemType()
    o.licenseId = LightXML.content(LightXML.find_element(pd, "licenseId"))
    o
end

export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Union{Int64, Void}
    instanceCapacity::Union{Int64, Void}
    state::Union{String, Void}
    earliestAllowedDeactivationTime::Union{Base.Dates.DateTime, Void}

    LicenseCapacitySetItemType(; capacity=nothing, instanceCapacity=nothing, state=nothing, earliestAllowedDeactivationTime=nothing) =
         new(capacity, instanceCapacity, state, earliestAllowedDeactivationTime)
end
function LicenseCapacitySetItemType(pd)
    o = LicenseCapacitySetItemType()
    o.capacity = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "capacity")))
    o.instanceCapacity = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCapacity")))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.earliestAllowedDeactivationTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "earliestAllowedDeactivationTime")))
    o
end

export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::Union{String, Void}
    capacity::Union{Int64, Void}

    ActivateLicenseType(; licenseId=nothing, capacity=nothing) =
         new(licenseId, capacity)
end
function ActivateLicenseType(pd)
    o = ActivateLicenseType()
    o.licenseId = LightXML.content(LightXML.find_element(pd, "licenseId"))
    o.capacity = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "capacity")))
    o
end

export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ActivateLicenseResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ActivateLicenseResponseType(pd)
    o = ActivateLicenseResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::Union{String, Void}
    capacity::Union{Int64, Void}

    DeactivateLicenseType(; licenseId=nothing, capacity=nothing) =
         new(licenseId, capacity)
end
function DeactivateLicenseType(pd)
    o = DeactivateLicenseType()
    o.licenseId = LightXML.content(LightXML.find_element(pd, "licenseId"))
    o.capacity = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "capacity")))
    o
end

export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeactivateLicenseResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeactivateLicenseResponseType(pd)
    o = DeactivateLicenseResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::Union{String, Void}
    strategy::Union{String, Void}

    CreatePlacementGroupType(; groupName=nothing, strategy=nothing) =
         new(groupName, strategy)
end
function CreatePlacementGroupType(pd)
    o = CreatePlacementGroupType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.strategy = LightXML.content(LightXML.find_element(pd, "strategy"))
    o
end

export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CreatePlacementGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreatePlacementGroupResponseType(pd)
    o = CreatePlacementGroupResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::Union{String, Void}

    DeletePlacementGroupType(; groupName=nothing) =
         new(groupName)
end
function DeletePlacementGroupType(pd)
    o = DeletePlacementGroupType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeletePlacementGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeletePlacementGroupResponseType(pd)
    o = DeletePlacementGroupResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::Union{String, Void}

    DescribePlacementGroupItemType(; groupName=nothing) =
         new(groupName)
end
function DescribePlacementGroupItemType(pd)
    o = DescribePlacementGroupItemType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o
end

export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::Union{String, Void}
    strategy::Union{String, Void}
    state::Union{String, Void}

    PlacementGroupInfoType(; groupName=nothing, strategy=nothing, state=nothing) =
         new(groupName, strategy, state)
end
function PlacementGroupInfoType(pd)
    o = PlacementGroupInfoType()
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.strategy = LightXML.content(LightXML.find_element(pd, "strategy"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::Union{String, Void}

    ResourceIdSetItemType(; resourceId=nothing) =
         new(resourceId)
end
function ResourceIdSetItemType(pd)
    o = ResourceIdSetItemType()
    o.resourceId = LightXML.content(LightXML.find_element(pd, "resourceId"))
    o
end

export ResourceIdSetItemType


type CreateTagsResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CreateTagsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateTagsResponseType(pd)
    o = CreateTagsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CreateTagsResponseType


type TagSetItemType
    resourceId::Union{String, Void}
    resourceType::Union{String, Void}
    key::Union{String, Void}
    value::Union{String, Void}

    TagSetItemType(; resourceId=nothing, resourceType=nothing, key=nothing, value=nothing) =
         new(resourceId, resourceType, key, value)
end
function TagSetItemType(pd)
    o = TagSetItemType()
    o.resourceId = LightXML.content(LightXML.find_element(pd, "resourceId"))
    o.resourceType = LightXML.content(LightXML.find_element(pd, "resourceType"))
    o.key = LightXML.content(LightXML.find_element(pd, "key"))
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export TagSetItemType


type DeleteTagsSetItemType
    key::Union{String, Void}
    value::Union{String, Void}

    DeleteTagsSetItemType(; key=nothing, value=nothing) =
         new(key, value)
end
function DeleteTagsSetItemType(pd)
    o = DeleteTagsSetItemType()
    o.key = LightXML.content(LightXML.find_element(pd, "key"))
    o.value = LightXML.content(LightXML.find_element(pd, "value"))
    o
end

export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteTagsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteTagsResponseType(pd)
    o = DeleteTagsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteTagsResponseType


type DiskImageDetailType
    format::Union{String, Void}
    bytes::Union{Int64, Void}
    importManifestUrl::Union{String, Void}

    DiskImageDetailType(; format=nothing, bytes=nothing, importManifestUrl=nothing) =
         new(format, bytes, importManifestUrl)
end
function DiskImageDetailType(pd)
    o = DiskImageDetailType()
    o.format = LightXML.content(LightXML.find_element(pd, "format"))
    o.bytes = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "bytes")))
    o.importManifestUrl = LightXML.content(LightXML.find_element(pd, "importManifestUrl"))
    o
end

export DiskImageDetailType


type DiskImageVolumeType
    size::Union{Int64, Void}

    DiskImageVolumeType(; size=nothing) =
         new(size)
end
function DiskImageVolumeType(pd)
    o = DiskImageVolumeType()
    o.size = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "size")))
    o
end

export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Union{Int64, Void}
    id::Union{String, Void}

    DiskImageVolumeDescriptionType(; size=nothing, id=nothing) =
         new(size, id)
end
function DiskImageVolumeDescriptionType(pd)
    o = DiskImageVolumeDescriptionType()
    o.size = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "size")))
    o.id = LightXML.content(LightXML.find_element(pd, "id"))
    o
end

export DiskImageVolumeDescriptionType


type DiskImageDescriptionType
    format::Union{String, Void}
    size::Union{Int64, Void}
    importManifestUrl::Union{String, Void}
    checksum::Union{String, Void}

    DiskImageDescriptionType(; format=nothing, size=nothing, importManifestUrl=nothing, checksum=nothing) =
         new(format, size, importManifestUrl, checksum)
end
function DiskImageDescriptionType(pd)
    o = DiskImageDescriptionType()
    o.format = LightXML.content(LightXML.find_element(pd, "format"))
    o.size = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "size")))
    o.importManifestUrl = LightXML.content(LightXML.find_element(pd, "importManifestUrl"))
    o.checksum = LightXML.content(LightXML.find_element(pd, "checksum"))
    o
end

export DiskImageDescriptionType


type DescribeConversionTasksType
    conversionTaskIdSet::Union{Vector{String}, Void}

    DescribeConversionTasksType(; conversionTaskIdSet=nothing) =
         new(conversionTaskIdSet)
end
function DescribeConversionTasksType(pd)
    o = DescribeConversionTasksType()
    o.conversionTaskIdSet = AWS.parse_vector_as(String, "conversionTaskId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "conversionTaskId"))
    o
end

export DescribeConversionTasksType


type ConversionTaskIdItemType
    conversionTaskId::Union{String, Void}

    ConversionTaskIdItemType(; conversionTaskId=nothing) =
         new(conversionTaskId)
end
function ConversionTaskIdItemType(pd)
    o = ConversionTaskIdItemType()
    o.conversionTaskId = LightXML.content(LightXML.find_element(pd, "conversionTaskId"))
    o
end

export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::Union{String, Void}

    CancelConversionTaskType(; conversionTaskId=nothing) =
         new(conversionTaskId)
end
function CancelConversionTaskType(pd)
    o = CancelConversionTaskType()
    o.conversionTaskId = LightXML.content(LightXML.find_element(pd, "conversionTaskId"))
    o
end

export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CancelConversionTaskResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CancelConversionTaskResponseType(pd)
    o = CancelConversionTaskResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union{String, Void}
    instanceId::Union{String, Void}
    targetEnvironment::Union{String, Void}

    CreateInstanceExportTaskType(; description=nothing, instanceId=nothing, targetEnvironment=nothing) =
         new(description, instanceId, targetEnvironment)
end
function CreateInstanceExportTaskType(pd)
    o = CreateInstanceExportTaskType()
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.targetEnvironment = LightXML.content(LightXML.find_element(pd, "targetEnvironment"))
    o
end

export CreateInstanceExportTaskType


type ExportToS3TaskType
    diskImageFormat::Union{String, Void}
    containerFormat::Union{String, Void}
    s3Bucket::Union{String, Void}
    s3Prefix::Union{String, Void}

    ExportToS3TaskType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Prefix=nothing) =
         new(diskImageFormat, containerFormat, s3Bucket, s3Prefix)
end
function ExportToS3TaskType(pd)
    o = ExportToS3TaskType()
    o.diskImageFormat = LightXML.content(LightXML.find_element(pd, "diskImageFormat"))
    o.containerFormat = LightXML.content(LightXML.find_element(pd, "containerFormat"))
    o.s3Bucket = LightXML.content(LightXML.find_element(pd, "s3Bucket"))
    o.s3Prefix = LightXML.content(LightXML.find_element(pd, "s3Prefix"))
    o
end

export ExportToS3TaskType


type DescribeExportTasksType
    exportTaskIdSet::Union{Vector{String}, Void}

    DescribeExportTasksType(; exportTaskIdSet=nothing) =
         new(exportTaskIdSet)
end
function DescribeExportTasksType(pd)
    o = DescribeExportTasksType()
    o.exportTaskIdSet = AWS.parse_vector_as(String, "exportTaskId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "exportTaskId"))
    o
end

export DescribeExportTasksType


type ExportTaskIdType
    exportTaskId::Union{String, Void}

    ExportTaskIdType(; exportTaskId=nothing) =
         new(exportTaskId)
end
function ExportTaskIdType(pd)
    o = ExportTaskIdType()
    o.exportTaskId = LightXML.content(LightXML.find_element(pd, "exportTaskId"))
    o
end

export ExportTaskIdType


type ExportTaskResponseType
    exportTaskId::Union{String, Void}
    description::Union{String, Void}
    state::Union{String, Void}
    statusMessage::Union{String, Void}

    ExportTaskResponseType(; exportTaskId=nothing, description=nothing, state=nothing, statusMessage=nothing) =
         new(exportTaskId, description, state, statusMessage)
end
function ExportTaskResponseType(pd)
    o = ExportTaskResponseType()
    o.exportTaskId = LightXML.content(LightXML.find_element(pd, "exportTaskId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.statusMessage = LightXML.content(LightXML.find_element(pd, "statusMessage"))
    o
end

export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::Union{String, Void}
    targetEnvironment::Union{String, Void}

    InstanceExportTaskResponseType(; instanceId=nothing, targetEnvironment=nothing) =
         new(instanceId, targetEnvironment)
end
function InstanceExportTaskResponseType(pd)
    o = InstanceExportTaskResponseType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.targetEnvironment = LightXML.content(LightXML.find_element(pd, "targetEnvironment"))
    o
end

export InstanceExportTaskResponseType


type ExportToS3TaskResponseType
    diskImageFormat::Union{String, Void}
    containerFormat::Union{String, Void}
    s3Bucket::Union{String, Void}
    s3Key::Union{String, Void}

    ExportToS3TaskResponseType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Key=nothing) =
         new(diskImageFormat, containerFormat, s3Bucket, s3Key)
end
function ExportToS3TaskResponseType(pd)
    o = ExportToS3TaskResponseType()
    o.diskImageFormat = LightXML.content(LightXML.find_element(pd, "diskImageFormat"))
    o.containerFormat = LightXML.content(LightXML.find_element(pd, "containerFormat"))
    o.s3Bucket = LightXML.content(LightXML.find_element(pd, "s3Bucket"))
    o.s3Key = LightXML.content(LightXML.find_element(pd, "s3Key"))
    o
end

export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::Union{String, Void}

    CancelExportTaskType(; exportTaskId=nothing) =
         new(exportTaskId)
end
function CancelExportTaskType(pd)
    o = CancelExportTaskType()
    o.exportTaskId = LightXML.content(LightXML.find_element(pd, "exportTaskId"))
    o
end

export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CancelExportTaskResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CancelExportTaskResponseType(pd)
    o = CancelExportTaskResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::Union{String, Void}
    state::Union{String, Void}

    InternetGatewayAttachmentType(; vpcId=nothing, state=nothing) =
         new(vpcId, state)
end
function InternetGatewayAttachmentType(pd)
    o = InternetGatewayAttachmentType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o
end

export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::Union{String, Void}

    InternetGatewayIdSetItemType(; internetGatewayId=nothing) =
         new(internetGatewayId)
end
function InternetGatewayIdSetItemType(pd)
    o = InternetGatewayIdSetItemType()
    o.internetGatewayId = LightXML.content(LightXML.find_element(pd, "internetGatewayId"))
    o
end

export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::Union{String, Void}

    DeleteInternetGatewayType(; internetGatewayId=nothing) =
         new(internetGatewayId)
end
function DeleteInternetGatewayType(pd)
    o = DeleteInternetGatewayType()
    o.internetGatewayId = LightXML.content(LightXML.find_element(pd, "internetGatewayId"))
    o
end

export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteInternetGatewayResponseType(pd)
    o = DeleteInternetGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::Union{String, Void}
    vpcId::Union{String, Void}

    AttachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) =
         new(internetGatewayId, vpcId)
end
function AttachInternetGatewayType(pd)
    o = AttachInternetGatewayType()
    o.internetGatewayId = LightXML.content(LightXML.find_element(pd, "internetGatewayId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    AttachInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AttachInternetGatewayResponseType(pd)
    o = AttachInternetGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::Union{String, Void}
    vpcId::Union{String, Void}

    DetachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) =
         new(internetGatewayId, vpcId)
end
function DetachInternetGatewayType(pd)
    o = DetachInternetGatewayType()
    o.internetGatewayId = LightXML.content(LightXML.find_element(pd, "internetGatewayId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DetachInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachInternetGatewayResponseType(pd)
    o = DetachInternetGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::Union{String, Void}

    CreateRouteTableType(; vpcId=nothing) =
         new(vpcId)
end
function CreateRouteTableType(pd)
    o = CreateRouteTableType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export CreateRouteTableType


type RouteType
    destinationCidrBlock::Union{String, Void}
    gatewayId::Union{String, Void}
    instanceId::Union{String, Void}
    instanceOwnerId::Union{String, Void}
    networkInterfaceId::Union{String, Void}
    state::Union{String, Void}
    origin::Union{String, Void}

    RouteType(; destinationCidrBlock=nothing, gatewayId=nothing, instanceId=nothing, instanceOwnerId=nothing, networkInterfaceId=nothing, state=nothing, origin=nothing) =
         new(destinationCidrBlock, gatewayId, instanceId, instanceOwnerId, networkInterfaceId, state, origin)
end
function RouteType(pd)
    o = RouteType()
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o.gatewayId = LightXML.content(LightXML.find_element(pd, "gatewayId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.instanceOwnerId = LightXML.content(LightXML.find_element(pd, "instanceOwnerId"))
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.origin = LightXML.content(LightXML.find_element(pd, "origin"))
    o
end

export RouteType


type RouteTableAssociationType
    routeTableAssociationId::Union{String, Void}
    routeTableId::Union{String, Void}

    RouteTableAssociationType(; routeTableAssociationId=nothing, routeTableId=nothing) =
         new(routeTableAssociationId, routeTableId)
end
function RouteTableAssociationType(pd)
    o = RouteTableAssociationType()
    o.routeTableAssociationId = LightXML.content(LightXML.find_element(pd, "routeTableAssociationId"))
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o
end

export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::Union{String, Void}

    PropagatingVgwType(; gatewayId=nothing) =
         new(gatewayId)
end
function PropagatingVgwType(pd)
    o = PropagatingVgwType()
    o.gatewayId = LightXML.content(LightXML.find_element(pd, "gatewayId"))
    o
end

export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::Union{String, Void}

    RouteTableIdSetItemType(; routeTableId=nothing) =
         new(routeTableId)
end
function RouteTableIdSetItemType(pd)
    o = RouteTableIdSetItemType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o
end

export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::Union{String, Void}
    gatewayId::Union{String, Void}

    EnableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) =
         new(routeTableId, gatewayId)
end
function EnableVgwRoutePropagationRequestType(pd)
    o = EnableVgwRoutePropagationRequestType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.gatewayId = LightXML.content(LightXML.find_element(pd, "gatewayId"))
    o
end

export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    EnableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function EnableVgwRoutePropagationResponseType(pd)
    o = EnableVgwRoutePropagationResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::Union{String, Void}
    gatewayId::Union{String, Void}

    DisableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) =
         new(routeTableId, gatewayId)
end
function DisableVgwRoutePropagationRequestType(pd)
    o = DisableVgwRoutePropagationRequestType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.gatewayId = LightXML.content(LightXML.find_element(pd, "gatewayId"))
    o
end

export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DisableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisableVgwRoutePropagationResponseType(pd)
    o = DisableVgwRoutePropagationResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::Union{String, Void}

    DeleteRouteTableType(; routeTableId=nothing) =
         new(routeTableId)
end
function DeleteRouteTableType(pd)
    o = DeleteRouteTableType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o
end

export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteRouteTableResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteRouteTableResponseType(pd)
    o = DeleteRouteTableResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::Union{String, Void}
    subnetId::Union{String, Void}

    AssociateRouteTableType(; routeTableId=nothing, subnetId=nothing) =
         new(routeTableId, subnetId)
end
function AssociateRouteTableType(pd)
    o = AssociateRouteTableType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o
end

export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::Union{String, Void}
    associationId::Union{String, Void}

    AssociateRouteTableResponseType(; requestId=nothing, associationId=nothing) =
         new(requestId, associationId)
end
function AssociateRouteTableResponseType(pd)
    o = AssociateRouteTableResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o
end

export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::Union{String, Void}
    routeTableId::Union{String, Void}

    ReplaceRouteTableAssociationType(; associationId=nothing, routeTableId=nothing) =
         new(associationId, routeTableId)
end
function ReplaceRouteTableAssociationType(pd)
    o = ReplaceRouteTableAssociationType()
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o
end

export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::Union{String, Void}
    newAssociationId::Union{String, Void}

    ReplaceRouteTableAssociationResponseType(; requestId=nothing, newAssociationId=nothing) =
         new(requestId, newAssociationId)
end
function ReplaceRouteTableAssociationResponseType(pd)
    o = ReplaceRouteTableAssociationResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.newAssociationId = LightXML.content(LightXML.find_element(pd, "newAssociationId"))
    o
end

export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::Union{String, Void}

    DisassociateRouteTableType(; associationId=nothing) =
         new(associationId)
end
function DisassociateRouteTableType(pd)
    o = DisassociateRouteTableType()
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o
end

export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DisassociateRouteTableResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisassociateRouteTableResponseType(pd)
    o = DisassociateRouteTableResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::Union{String, Void}
    destinationCidrBlock::Union{String, Void}

    CreateRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function CreateRouteType(pd)
    o = CreateRouteType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o
end

export CreateRouteType


type CreateRouteResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CreateRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateRouteResponseType(pd)
    o = CreateRouteResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::Union{String, Void}
    destinationCidrBlock::Union{String, Void}

    ReplaceRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function ReplaceRouteType(pd)
    o = ReplaceRouteType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o
end

export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ReplaceRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReplaceRouteResponseType(pd)
    o = ReplaceRouteResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::Union{String, Void}
    destinationCidrBlock::Union{String, Void}

    DeleteRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function DeleteRouteType(pd)
    o = DeleteRouteType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.destinationCidrBlock = LightXML.content(LightXML.find_element(pd, "destinationCidrBlock"))
    o
end

export DeleteRouteType


type DeleteRouteResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteRouteResponseType(pd)
    o = DeleteRouteResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::Union{String, Void}

    CreateNetworkAclType(; vpcId=nothing) =
         new(vpcId)
end
function CreateNetworkAclType(pd)
    o = CreateNetworkAclType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o
end

export CreateNetworkAclType


type IcmpTypeCodeType
    code::Union{Int64, Void}
    _type::Union{Int64, Void}

    IcmpTypeCodeType(; code=nothing, _type=nothing) =
         new(code, _type)
end
function IcmpTypeCodeType(pd)
    o = IcmpTypeCodeType()
    o.code = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "code")))
    o._type = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "type")))
    o
end

export IcmpTypeCodeType


type PortRangeType
    from::Union{Int64, Void}
    to::Union{Int64, Void}

    PortRangeType(; from=nothing, to=nothing) =
         new(from, to)
end
function PortRangeType(pd)
    o = PortRangeType()
    o.from = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "from")))
    o.to = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "to")))
    o
end

export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::Union{String, Void}
    networkAclId::Union{String, Void}
    subnetId::Union{String, Void}

    NetworkAclAssociationType(; networkAclAssociationId=nothing, networkAclId=nothing, subnetId=nothing) =
         new(networkAclAssociationId, networkAclId, subnetId)
end
function NetworkAclAssociationType(pd)
    o = NetworkAclAssociationType()
    o.networkAclAssociationId = LightXML.content(LightXML.find_element(pd, "networkAclAssociationId"))
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o
end

export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::Union{String, Void}

    NetworkAclIdSetItemType(; networkAclId=nothing) =
         new(networkAclId)
end
function NetworkAclIdSetItemType(pd)
    o = NetworkAclIdSetItemType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o
end

export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::Union{String, Void}

    DeleteNetworkAclType(; networkAclId=nothing) =
         new(networkAclId)
end
function DeleteNetworkAclType(pd)
    o = DeleteNetworkAclType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o
end

export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteNetworkAclResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkAclResponseType(pd)
    o = DeleteNetworkAclResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::Union{String, Void}
    networkAclId::Union{String, Void}

    ReplaceNetworkAclAssociationType(; associationId=nothing, networkAclId=nothing) =
         new(associationId, networkAclId)
end
function ReplaceNetworkAclAssociationType(pd)
    o = ReplaceNetworkAclAssociationType()
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o
end

export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::Union{String, Void}
    newAssociationId::Union{String, Void}

    ReplaceNetworkAclAssociationResponseType(; requestId=nothing, newAssociationId=nothing) =
         new(requestId, newAssociationId)
end
function ReplaceNetworkAclAssociationResponseType(pd)
    o = ReplaceNetworkAclAssociationResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.newAssociationId = LightXML.content(LightXML.find_element(pd, "newAssociationId"))
    o
end

export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    CreateNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateNetworkAclEntryResponseType(pd)
    o = CreateNetworkAclEntryResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ReplaceNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReplaceNetworkAclEntryResponseType(pd)
    o = ReplaceNetworkAclEntryResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::Union{String, Void}
    ruleNumber::Union{Int64, Void}
    egress::Union{Bool, Void}

    DeleteNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, egress=nothing) =
         new(networkAclId, ruleNumber, egress)
end
function DeleteNetworkAclEntryType(pd)
    o = DeleteNetworkAclEntryType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o.ruleNumber = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "ruleNumber")))
    o.egress = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "egress")))
    o
end

export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkAclEntryResponseType(pd)
    o = DeleteNetworkAclEntryResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::Union{String, Void}
    status::Union{String, Void}
    impairedSince::Union{Base.Dates.DateTime, Void}

    InstanceStatusDetailsSetItemType(; name=nothing, status=nothing, impairedSince=nothing) =
         new(name, status, impairedSince)
end
function InstanceStatusDetailsSetItemType(pd)
    o = InstanceStatusDetailsSetItemType()
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.impairedSince = LightXML.find_element(pd, "impairedSince") != nothing ? AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "impairedSince"))) : nothing
    o
end

export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::Union{String, Void}
    description::Union{String, Void}
    notBefore::Union{Base.Dates.DateTime, Void}
    notAfter::Union{Base.Dates.DateTime, Void}

    InstanceStatusEventType(; code=nothing, description=nothing, notBefore=nothing, notAfter=nothing) =
         new(code, description, notBefore, notAfter)
end
function InstanceStatusEventType(pd)
    o = InstanceStatusEventType()
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.notBefore = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "notBefore")))
    o.notAfter = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "notAfter")))
    o
end

export InstanceStatusEventType


type ReportInstanceStatusType
    instancesSet::Union{Vector{String}, Void}
    status::Union{String, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    endTime::Union{Base.Dates.DateTime, Void}
    reasonCodesSet::Union{Vector{String}, Void}
    description::Union{String, Void}

    ReportInstanceStatusType(; instancesSet=nothing, status=nothing, startTime=nothing, endTime=nothing, reasonCodesSet=nothing, description=nothing) =
         new(instancesSet, status, startTime, endTime, reasonCodesSet, description)
end
function ReportInstanceStatusType(pd)
    o = ReportInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "startTime")))
    o.endTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "endTime")))
    o.reasonCodesSet = AWS.parse_vector_as(String, "reasonCode", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "reasonCode"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o
end

export ReportInstanceStatusType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::Union{String, Void}

    ReportInstanceStatusReasonCodeSetItemType(; reasonCode=nothing) =
         new(reasonCode)
end
function ReportInstanceStatusReasonCodeSetItemType(pd)
    o = ReportInstanceStatusReasonCodeSetItemType()
    o.reasonCode = LightXML.content(LightXML.find_element(pd, "reasonCode"))
    o
end

export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ReportInstanceStatusResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReportInstanceStatusResponseType(pd)
    o = ReportInstanceStatusResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::Union{String, Void}

    NetworkInterfaceIdSetItemType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function NetworkInterfaceIdSetItemType(pd)
    o = NetworkInterfaceIdSetItemType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export NetworkInterfaceIdSetItemType


type NetworkInterfaceAttachmentType
    attachmentId::Union{String, Void}
    instanceId::Union{String, Void}
    instanceOwnerId::Union{String, Void}
    deviceIndex::Union{Int64, Void}
    status::Union{String, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    NetworkInterfaceAttachmentType(; attachmentId=nothing, instanceId=nothing, instanceOwnerId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination)
end
function NetworkInterfaceAttachmentType(pd)
    o = NetworkInterfaceAttachmentType()
    o.attachmentId = LightXML.content(LightXML.find_element(pd, "attachmentId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.instanceOwnerId = LightXML.content(LightXML.find_element(pd, "instanceOwnerId"))
    o.deviceIndex = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "deviceIndex")))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "attachTime")))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export NetworkInterfaceAttachmentType


type NetworkInterfaceAssociationType
    publicIp::Union{String, Void}
    publicDnsName::Union{String, Void}
    ipOwnerId::Union{String, Void}
    allocationId::Union{String, Void}
    associationId::Union{String, Void}

    NetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing, allocationId=nothing, associationId=nothing) =
         new(publicIp, publicDnsName, ipOwnerId, allocationId, associationId)
end
function NetworkInterfaceAssociationType(pd)
    o = NetworkInterfaceAssociationType()
    o.publicIp = LightXML.content(LightXML.find_element(pd, "publicIp"))
    o.publicDnsName = LightXML.content(LightXML.find_element(pd, "publicDnsName"))
    o.ipOwnerId = LightXML.content(LightXML.find_element(pd, "ipOwnerId"))
    o.allocationId = LightXML.content(LightXML.find_element(pd, "allocationId"))
    o.associationId = LightXML.content(LightXML.find_element(pd, "associationId"))
    o
end

export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::Union{String, Void}

    DeleteNetworkInterfaceType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function DeleteNetworkInterfaceType(pd)
    o = DeleteNetworkInterfaceType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DeleteNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkInterfaceResponseType(pd)
    o = DeleteNetworkInterfaceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::Union{String, Void}
    instanceId::Union{String, Void}
    deviceIndex::Union{Int64, Void}

    AttachNetworkInterfaceType(; networkInterfaceId=nothing, instanceId=nothing, deviceIndex=nothing) =
         new(networkInterfaceId, instanceId, deviceIndex)
end
function AttachNetworkInterfaceType(pd)
    o = AttachNetworkInterfaceType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.deviceIndex = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "deviceIndex")))
    o
end

export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::Union{String, Void}
    attachmentId::Union{String, Void}

    AttachNetworkInterfaceResponseType(; requestId=nothing, attachmentId=nothing) =
         new(requestId, attachmentId)
end
function AttachNetworkInterfaceResponseType(pd)
    o = AttachNetworkInterfaceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.attachmentId = LightXML.content(LightXML.find_element(pd, "attachmentId"))
    o
end

export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::Union{String, Void}
    force::Union{Bool, Void}

    DetachNetworkInterfaceType(; attachmentId=nothing, force=nothing) =
         new(attachmentId, force)
end
function DetachNetworkInterfaceType(pd)
    o = DetachNetworkInterfaceType()
    o.attachmentId = LightXML.content(LightXML.find_element(pd, "attachmentId"))
    o.force = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "force")))
    o
end

export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    DetachNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachNetworkInterfaceResponseType(pd)
    o = DetachNetworkInterfaceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::Union{String, Void}

    DescribeNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeType(pd)
    o = DescribeNetworkInterfaceAttributeType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::Union{String, Void}
    networkInterfaceId::Union{String, Void}

    DescribeNetworkInterfaceAttributeResponseType(; requestId=nothing, networkInterfaceId=nothing) =
         new(requestId, networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeResponseType(pd)
    o = DescribeNetworkInterfaceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::Union{String, Void}

    ModifyNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function ModifyNetworkInterfaceAttributeType(pd)
    o = ModifyNetworkInterfaceAttributeType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::Union{String, Void}
    deleteOnTermination::Union{Bool, Void}

    ModifyNetworkInterfaceAttachmentType(; attachmentId=nothing, deleteOnTermination=nothing) =
         new(attachmentId, deleteOnTermination)
end
function ModifyNetworkInterfaceAttachmentType(pd)
    o = ModifyNetworkInterfaceAttachmentType()
    o.attachmentId = LightXML.content(LightXML.find_element(pd, "attachmentId"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o
end

export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifyNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyNetworkInterfaceAttributeResponseType(pd)
    o = ModifyNetworkInterfaceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::Union{String, Void}

    ResetNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function ResetNetworkInterfaceAttributeType(pd)
    o = ResetNetworkInterfaceAttributeType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o
end

export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ResetNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetNetworkInterfaceAttributeResponseType(pd)
    o = ResetNetworkInterfaceAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::Union{String, Void}
    privateIpAddressesSet::Union{Vector{String}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}
    allowReassignment::Union{Bool, Void}

    AssignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing, allowReassignment=nothing) =
         new(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment)
end
function AssignPrivateIpAddressesType(pd)
    o = AssignPrivateIpAddressesType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.privateIpAddressesSet = AWS.parse_vector_as(String, "privateIpAddress", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "privateIpAddress"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "secondaryPrivateIpAddressCount")))
    o.allowReassignment = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "allowReassignment")))
    o
end

export AssignPrivateIpAddressesType


type AssignPrivateIpAddressesResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    AssignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AssignPrivateIpAddressesResponseType(pd)
    o = AssignPrivateIpAddressesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesType
    networkInterfaceId::Union{String, Void}
    privateIpAddressesSet::Union{Vector{String}, Void}

    UnassignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, privateIpAddressesSet)
end
function UnassignPrivateIpAddressesType(pd)
    o = UnassignPrivateIpAddressesType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.privateIpAddressesSet = AWS.parse_vector_as(String, "privateIpAddress", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "privateIpAddress"))
    o
end

export UnassignPrivateIpAddressesType


type UnassignPrivateIpAddressesResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    UnassignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function UnassignPrivateIpAddressesResponseType(pd)
    o = UnassignPrivateIpAddressesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::Union{String, Void}

    AssignPrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing) =
         new(privateIpAddress)
end
function AssignPrivateIpAddressesSetItemRequestType(pd)
    o = AssignPrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o
end

export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::Union{String, Void}
    status::Union{String, Void}

    VolumeStatusDetailsItemType(; name=nothing, status=nothing) =
         new(name, status)
end
function VolumeStatusDetailsItemType(pd)
    o = VolumeStatusDetailsItemType()
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o
end

export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::Union{String, Void}
    notBefore::Union{Base.Dates.DateTime, Void}
    notAfter::Union{Base.Dates.DateTime, Void}
    eventId::Union{String, Void}
    eventType::Union{String, Void}

    VolumeStatusEventItemType(; description=nothing, notBefore=nothing, notAfter=nothing, eventId=nothing, eventType=nothing) =
         new(description, notBefore, notAfter, eventId, eventType)
end
function VolumeStatusEventItemType(pd)
    o = VolumeStatusEventItemType()
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.notBefore = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "notBefore")))
    o.notAfter = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "notAfter")))
    o.eventId = LightXML.content(LightXML.find_element(pd, "eventId"))
    o.eventType = LightXML.content(LightXML.find_element(pd, "eventType"))
    o
end

export VolumeStatusEventItemType


type VolumeStatusActionItemType
    description::Union{String, Void}
    code::Union{String, Void}
    eventId::Union{String, Void}
    eventType::Union{String, Void}

    VolumeStatusActionItemType(; description=nothing, code=nothing, eventId=nothing, eventType=nothing) =
         new(description, code, eventId, eventType)
end
function VolumeStatusActionItemType(pd)
    o = VolumeStatusActionItemType()
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.code = LightXML.content(LightXML.find_element(pd, "code"))
    o.eventId = LightXML.content(LightXML.find_element(pd, "eventId"))
    o.eventType = LightXML.content(LightXML.find_element(pd, "eventType"))
    o
end

export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::Union{String, Void}

    EnableVolumeIOType(; volumeId=nothing) =
         new(volumeId)
end
function EnableVolumeIOType(pd)
    o = EnableVolumeIOType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    EnableVolumeIOResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function EnableVolumeIOResponseType(pd)
    o = EnableVolumeIOResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::Union{String, Void}

    ModifyVolumeAttributeType(; volumeId=nothing) =
         new(volumeId)
end
function ModifyVolumeAttributeType(pd)
    o = ModifyVolumeAttributeType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::Union{String, Void}
    _return::Union{Bool, Void}

    ModifyVolumeAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyVolumeAttributeResponseType(pd)
    o = ModifyVolumeAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o._return = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "return")))
    o
end

export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::Union{String, Void}

    DescribeVolumeAttributeType(; volumeId=nothing) =
         new(volumeId)
end
function DescribeVolumeAttributeType(pd)
    o = DescribeVolumeAttributeType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::Union{String, Void}
    volumeId::Union{String, Void}

    DescribeVolumeAttributeResponseType(; requestId=nothing, volumeId=nothing) =
         new(requestId, volumeId)
end
function DescribeVolumeAttributeResponseType(pd)
    o = DescribeVolumeAttributeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o
end

export DescribeVolumeAttributeResponseType


type LaunchPermissionOperationType
    add::Union{Vector{LaunchPermissionItemType}, Void}
    remove::Union{Vector{LaunchPermissionItemType}, Void}

    LaunchPermissionOperationType(; add=nothing, remove=nothing) =
         new(add, remove)
end
function LaunchPermissionOperationType(pd)
    o = LaunchPermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "add"), "item"))
    o.remove = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "remove"), "item"))
    o
end

export LaunchPermissionOperationType


type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::Union{String, Void}
    instanceType::Union{String, Void}
    availabilityZone::Union{String, Void}
    start::Union{Base.Dates.DateTime, Void}
    duration::Union{Int64, Void}
    fixedPrice::Union{Float64, Void}
    usagePrice::Union{Float64, Void}
    instanceCount::Union{Int64, Void}
    productDescription::Union{String, Void}
    state::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    instanceTenancy::Union{String, Void}
    currencyCode::Union{String, Void}
    offeringType::Union{String, Void}
    recurringCharges::Union{Vector{RecurringChargesSetItemType}, Void}

    DescribeReservedInstancesResponseSetItemType(; reservedInstancesId=nothing, instanceType=nothing, availabilityZone=nothing, start=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, instanceCount=nothing, productDescription=nothing, state=nothing, tagSet=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing) =
         new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges)
end
function DescribeReservedInstancesResponseSetItemType(pd)
    o = DescribeReservedInstancesResponseSetItemType()
    o.reservedInstancesId = LightXML.content(LightXML.find_element(pd, "reservedInstancesId"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.start = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "start")))
    o.duration = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "duration")))
    o.fixedPrice = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "fixedPrice")))
    o.usagePrice = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "usagePrice")))
    o.instanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCount")))
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.instanceTenancy = LightXML.content(LightXML.find_element(pd, "instanceTenancy"))
    o.currencyCode = LightXML.content(LightXML.find_element(pd, "currencyCode"))
    o.offeringType = LightXML.content(LightXML.find_element(pd, "offeringType"))
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "recurringCharges"), "item"))
    o
end

export DescribeReservedInstancesResponseSetItemType


type CancelSpotInstanceRequestsResponseType
    requestId::Union{String, Void}
    spotInstanceRequestSet::Union{Vector{CancelSpotInstanceRequestsResponseSetItemType}, Void}

    CancelSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function CancelSpotInstanceRequestsResponseType(pd)
    o = CancelSpotInstanceRequestsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.CancelSpotInstanceRequestsResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "spotInstanceRequestSet"), "item"))
    o
end

export CancelSpotInstanceRequestsResponseType


type CreateDhcpOptionsType
    dhcpConfigurationSet::Union{Vector{DhcpConfigurationItemType}, Void}

    CreateDhcpOptionsType(; dhcpConfigurationSet=nothing) =
         new(dhcpConfigurationSet)
end
function CreateDhcpOptionsType(pd)
    o = CreateDhcpOptionsType()
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "dhcpConfigurationSet"), "item"))
    o
end

export CreateDhcpOptionsType


type DescribeInstanceStatusType
    instancesSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    nextToken::Union{String, Void}
    maxResults::Union{Int64, Void}
    includeAllInstances::Union{Bool, Void}

    DescribeInstanceStatusType(; instancesSet=nothing, filterSet=nothing, nextToken=nothing, maxResults=nothing, includeAllInstances=nothing) =
         new(instancesSet, filterSet, nextToken, maxResults, includeAllInstances)
end
function DescribeInstanceStatusType(pd)
    o = DescribeInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
    o.includeAllInstances = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "includeAllInstances")))
    o
end

export DescribeInstanceStatusType


type DescribePlacementGroupsType
    placementGroupSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribePlacementGroupsType(; placementGroupSet=nothing, filterSet=nothing) =
         new(placementGroupSet, filterSet)
end
function DescribePlacementGroupsType(pd)
    o = DescribePlacementGroupsType()
    o.placementGroupSet = AWS.parse_vector_as(String, "groupName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "groupName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribePlacementGroupsType


type RegisterImageType
    imageLocation::Union{String, Void}
    name::Union{String, Void}
    description::Union{String, Void}
    architecture::Union{String, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    rootDeviceName::Union{String, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}

    RegisterImageType(; imageLocation=nothing, name=nothing, description=nothing, architecture=nothing, kernelId=nothing, ramdiskId=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing) =
         new(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping)
end
function RegisterImageType(pd)
    o = RegisterImageType()
    o.imageLocation = LightXML.content(LightXML.find_element(pd, "imageLocation"))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.architecture = LightXML.content(LightXML.find_element(pd, "architecture"))
    o.kernelId = LightXML.content(LightXML.find_element(pd, "kernelId"))
    o.ramdiskId = LightXML.content(LightXML.find_element(pd, "ramdiskId"))
    o.rootDeviceName = LightXML.content(LightXML.find_element(pd, "rootDeviceName"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    o
end

export RegisterImageType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeNetworkInterfacesType(; networkInterfaceIdSet=nothing, filterSet=nothing) =
         new(networkInterfaceIdSet, filterSet)
end
function DescribeNetworkInterfacesType(pd)
    o = DescribeNetworkInterfacesType()
    o.networkInterfaceIdSet = AWS.parse_vector_as(String, "networkInterfaceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "networkInterfaceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeNetworkInterfacesType


type CreateReservedInstancesListingType
    reservedInstancesId::Union{String, Void}
    instanceCount::Union{Int64, Void}
    priceSchedules::Union{Vector{PriceScheduleRequestSetItemType}, Void}
    clientToken::Union{String, Void}

    CreateReservedInstancesListingType(; reservedInstancesId=nothing, instanceCount=nothing, priceSchedules=nothing, clientToken=nothing) =
         new(reservedInstancesId, instanceCount, priceSchedules, clientToken)
end
function CreateReservedInstancesListingType(pd)
    o = CreateReservedInstancesListingType()
    o.reservedInstancesId = LightXML.content(LightXML.find_element(pd, "reservedInstancesId"))
    o.instanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCount")))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleRequestSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "priceSchedules"), "item"))
    o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
    o
end

export CreateReservedInstancesListingType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpnGatewaysType(; vpnGatewaySet=nothing, filterSet=nothing) =
         new(vpnGatewaySet, filterSet)
end
function DescribeVpnGatewaysType(pd)
    o = DescribeVpnGatewaysType()
    o.vpnGatewaySet = AWS.parse_vector_as(String, "vpnGatewayId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "vpnGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeVpnGatewaysType


type DescribeVolumeStatusType
    volumeSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    maxResults::Union{Int64, Void}
    nextToken::Union{String, Void}

    DescribeVolumeStatusType(; volumeSet=nothing, filterSet=nothing, maxResults=nothing, nextToken=nothing) =
         new(volumeSet, filterSet, maxResults, nextToken)
end
function DescribeVolumeStatusType(pd)
    o = DescribeVolumeStatusType()
    o.volumeSet = AWS.parse_vector_as(String, "volumeId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o
end

export DescribeVolumeStatusType


type DhcpOptionsType
    dhcpOptionsId::Union{String, Void}
    dhcpConfigurationSet::Union{Vector{DhcpConfigurationItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    DhcpOptionsType(; dhcpOptionsId=nothing, dhcpConfigurationSet=nothing, tagSet=nothing) =
         new(dhcpOptionsId, dhcpConfigurationSet, tagSet)
end
function DhcpOptionsType(pd)
    o = DhcpOptionsType()
    o.dhcpOptionsId = LightXML.content(LightXML.find_element(pd, "dhcpOptionsId"))
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "dhcpConfigurationSet"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export DhcpOptionsType


type ImportInstanceVolumeDetailItemType
    bytesConverted::Union{Int64, Void}
    availabilityZone::Union{String, Void}
    image::Union{DiskImageDescriptionType, Void}
    description::Union{String, Void}
    volume::Union{DiskImageVolumeDescriptionType, Void}
    status::Union{String, Void}
    statusMessage::Union{String, Void}

    ImportInstanceVolumeDetailItemType(; bytesConverted=nothing, availabilityZone=nothing, image=nothing, description=nothing, volume=nothing, status=nothing, statusMessage=nothing) =
         new(bytesConverted, availabilityZone, image, description, volume, status, statusMessage)
end
function ImportInstanceVolumeDetailItemType(pd)
    o = ImportInstanceVolumeDetailItemType()
    o.bytesConverted = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "bytesConverted")))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    ## o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(LightXML.content(LightXML.find_element(pd,"image[1]")) : nothing
    o.image = LightXML.find_element(pd,"image") != nothing ? DiskImageDescriptionType(LightXML.find_element(pd,"image")) : nothing
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    ## o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(LightXML.content(LightXML.find_element(pd,"volume[1]")) : nothing
    o.volume = LightXML.find_element(pd,"volume") != nothing ? DiskImageVolumeDescriptionType(LightXML.find_element(pd,"volume")) : nothing
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.statusMessage = LightXML.content(LightXML.find_element(pd, "statusMessage"))
    o
end

export ImportInstanceVolumeDetailItemType


type DescribeExportTasksResponseType
    requestId::Union{String, Void}
    exportTaskSet::Union{Vector{ExportTaskResponseType}, Void}

    DescribeExportTasksResponseType(; requestId=nothing, exportTaskSet=nothing) =
         new(requestId, exportTaskSet)
end
function DescribeExportTasksResponseType(pd)
    o = DescribeExportTasksResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.exportTaskSet = AWS.@parse_vector(AWS.EC2.ExportTaskResponseType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "exportTaskSet"), "item"))
    o
end

export DescribeExportTasksResponseType


type DescribeSecurityGroupsType
    securityGroupSet::Union{Vector{String}, Void}
    securityGroupIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSecurityGroupsType(; securityGroupSet=nothing, securityGroupIdSet=nothing, filterSet=nothing) =
         new(securityGroupSet, securityGroupIdSet, filterSet)
end
function DescribeSecurityGroupsType(pd)
    o = DescribeSecurityGroupsType()
    o.securityGroupSet = AWS.parse_vector_as(String, "groupName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "groupName"))
    o.securityGroupIdSet = AWS.parse_vector_as(String, "groupId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "groupId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeSecurityGroupsType


type InstanceStatusType
    status::Union{String, Void}
    details::Union{Vector{InstanceStatusDetailsSetItemType}, Void}

    InstanceStatusType(; status=nothing, details=nothing) =
         new(status, details)
end
function InstanceStatusType(pd)
    o = InstanceStatusType()
    o.status = LightXML.find_element(pd, "status") != nothing ? LightXML.content(LightXML.find_element(pd, "status")) : nothing
    o.details = LightXML.find_element(pd, "details") != nothing ? AWS.@parse_vector(AWS.EC2.InstanceStatusDetailsSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "details"), "item")) : nothing
    o
end

export InstanceStatusType


type DescribeImagesResponseItemType
    imageId::Union{String, Void}
    imageLocation::Union{String, Void}
    imageState::Union{String, Void}
    imageOwnerId::Union{String, Void}
    isPublic::Union{Bool, Void}
    productCodes::Union{Vector{ProductCodesSetItemType}, Void}
    architecture::Union{String, Void}
    imageType::Union{String, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    platform::Union{String, Void}
    stateReason::Union{StateReasonType, Void}
    imageOwnerAlias::Union{String, Void}
    name::Union{String, Void}
    description::Union{String, Void}
    rootDeviceType::Union{String, Void}
    rootDeviceName::Union{String, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    virtualizationType::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    hypervisor::Union{String, Void}

    DescribeImagesResponseItemType(; imageId=nothing, imageLocation=nothing, imageState=nothing, imageOwnerId=nothing, isPublic=nothing, productCodes=nothing, architecture=nothing, imageType=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, stateReason=nothing, imageOwnerAlias=nothing, name=nothing, description=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, virtualizationType=nothing, tagSet=nothing, hypervisor=nothing) =
         new(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor)
end
function DescribeImagesResponseItemType(pd)
    o = DescribeImagesResponseItemType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o.imageLocation = LightXML.content(LightXML.find_element(pd, "imageLocation"))
    o.imageState = LightXML.content(LightXML.find_element(pd, "imageState"))
    o.imageOwnerId = LightXML.content(LightXML.find_element(pd, "imageOwnerId"))
    o.isPublic = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "isPublic")))
    o.productCodes = AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "productCodes"), "item"))
    o.architecture = LightXML.content(LightXML.find_element(pd, "architecture"))
    o.imageType = LightXML.content(LightXML.find_element(pd, "imageType"))
    o.kernelId = LightXML.content(LightXML.find_element(pd, "kernelId"))
    o.ramdiskId = LightXML.content(LightXML.find_element(pd, "ramdiskId"))
    o.platform = LightXML.content(LightXML.find_element(pd, "platform"))
    ## o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(LightXML.find_element(pd,"stateReason[1]")) : nothing
    o.stateReason = LightXML.find_element(pd,"stateReason") != nothing ? StateReasonType(LightXML.find_element(pd,"stateReason")) : nothing
    o.imageOwnerAlias = LightXML.content(LightXML.find_element(pd, "imageOwnerAlias"))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.rootDeviceType = LightXML.content(LightXML.find_element(pd, "rootDeviceType"))
    o.rootDeviceName = LightXML.content(LightXML.find_element(pd, "rootDeviceName"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    o.virtualizationType = LightXML.content(LightXML.find_element(pd, "virtualizationType"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.hypervisor = LightXML.content(LightXML.find_element(pd, "hypervisor"))
    o
end

export DescribeImagesResponseItemType


type DescribeBundleTasksType
    bundlesSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeBundleTasksType(; bundlesSet=nothing, filterSet=nothing) =
         new(bundlesSet, filterSet)
end
function DescribeBundleTasksType(pd)
    o = DescribeBundleTasksType()
    o.bundlesSet = AWS.parse_vector_as(String, "bundleId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "bundleId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeBundleTasksType


type DeleteTagsType
    resourcesSet::Union{Vector{String}, Void}
    tagSet::Union{Vector{DeleteTagsSetItemType}, Void}

    DeleteTagsType(; resourcesSet=nothing, tagSet=nothing) =
         new(resourcesSet, tagSet)
end
function DeleteTagsType(pd)
    o = DeleteTagsType()
    o.resourcesSet = AWS.parse_vector_as(String, "resourceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.DeleteTagsSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export DeleteTagsType


type SpotDatafeedSubscriptionType
    ownerId::Union{String, Void}
    bucket::Union{String, Void}
    prefix::Union{String, Void}
    state::Union{String, Void}
    fault::Union{SpotInstanceStateFaultType, Void}

    SpotDatafeedSubscriptionType(; ownerId=nothing, bucket=nothing, prefix=nothing, state=nothing, fault=nothing) =
         new(ownerId, bucket, prefix, state, fault)
end
function SpotDatafeedSubscriptionType(pd)
    o = SpotDatafeedSubscriptionType()
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.bucket = LightXML.content(LightXML.find_element(pd, "bucket"))
    o.prefix = LightXML.content(LightXML.find_element(pd, "prefix"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    ## o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(LightXML.find_element(pd,"fault[1]")) : nothing
    o.fault = LightXML.find_element(pd,"fault") != nothing ? SpotInstanceStateFaultType(LightXML.find_element(pd,"fault")) : nothing
    o
end

export SpotDatafeedSubscriptionType


type DescribeNetworkAclsType
    networkAclIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeNetworkAclsType(; networkAclIdSet=nothing, filterSet=nothing) =
         new(networkAclIdSet, filterSet)
end
function DescribeNetworkAclsType(pd)
    o = DescribeNetworkAclsType()
    o.networkAclIdSet = AWS.parse_vector_as(String, "networkAclId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "networkAclId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeNetworkAclsType


type DescribeVolumesSetItemResponseType
    volumeId::Union{String, Void}
    size::Union{String, Void}
    snapshotId::Union{String, Void}
    availabilityZone::Union{String, Void}
    status::Union{String, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    attachmentSet::Union{Vector{AttachmentSetItemResponseType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    volumeType::Union{String, Void}
    iops::Union{Int64, Void}

    DescribeVolumesSetItemResponseType(; volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, attachmentSet=nothing, tagSet=nothing, volumeType=nothing, iops=nothing) =
         new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops)
end
function DescribeVolumesSetItemResponseType(pd)
    o = DescribeVolumesSetItemResponseType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.size = LightXML.content(LightXML.find_element(pd, "size"))
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "createTime")))
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.AttachmentSetItemResponseType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "attachmentSet"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.volumeType = LightXML.content(LightXML.find_element(pd, "volumeType"))
    o.iops = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "iops")))
    o
end

export DescribeVolumesSetItemResponseType


type DescribeVolumesType
    volumeSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVolumesType(; volumeSet=nothing, filterSet=nothing) =
         new(volumeSet, filterSet)
end
function DescribeVolumesType(pd)
    o = DescribeVolumesType()
    o.volumeSet = AWS.parse_vector_as(String, "volumeId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeVolumesType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeDhcpOptionsType(; dhcpOptionsSet=nothing, filterSet=nothing) =
         new(dhcpOptionsSet, filterSet)
end
function DescribeDhcpOptionsType(pd)
    o = DescribeDhcpOptionsType()
    o.dhcpOptionsSet = AWS.parse_vector_as(String, "dhcpOptionsId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "dhcpOptionsId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeDhcpOptionsType


type CreateTagsType
    resourcesSet::Union{Vector{String}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    CreateTagsType(; resourcesSet=nothing, tagSet=nothing) =
         new(resourcesSet, tagSet)
end
function CreateTagsType(pd)
    o = CreateTagsType()
    o.resourcesSet = AWS.parse_vector_as(String, "resourceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export CreateTagsType


type ImportInstanceTaskDetailsType
    volumes::Union{Vector{ImportInstanceVolumeDetailItemType}, Void}
    instanceId::Union{String, Void}
    platform::Union{String, Void}
    description::Union{String, Void}

    ImportInstanceTaskDetailsType(; volumes=nothing, instanceId=nothing, platform=nothing, description=nothing) =
         new(volumes, instanceId, platform, description)
end
function ImportInstanceTaskDetailsType(pd)
    o = ImportInstanceTaskDetailsType()
    o.volumes = AWS.@parse_vector(AWS.EC2.ImportInstanceVolumeDetailItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "volumes"), "item"))
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.platform = LightXML.content(LightXML.find_element(pd, "platform"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o
end

export ImportInstanceTaskDetailsType


type ConversionTaskType
    conversionTaskId::Union{String, Void}
    expirationTime::Union{String, Void}
    state::Union{String, Void}
    statusMessage::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    ConversionTaskType(; conversionTaskId=nothing, expirationTime=nothing, state=nothing, statusMessage=nothing, tagSet=nothing) =
         new(conversionTaskId, expirationTime, state, statusMessage, tagSet)
end
function ConversionTaskType(pd)
    o = ConversionTaskType()
    o.conversionTaskId = LightXML.content(LightXML.find_element(pd, "conversionTaskId"))
    o.expirationTime = LightXML.content(LightXML.find_element(pd, "expirationTime"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.statusMessage = LightXML.content(LightXML.find_element(pd, "statusMessage"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export ConversionTaskType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::Union{String, Void}
    spotDatafeedSubscription::Union{SpotDatafeedSubscriptionType, Void}

    CreateSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) =
         new(requestId, spotDatafeedSubscription)
end
function CreateSpotDatafeedSubscriptionResponseType(pd)
    o = CreateSpotDatafeedSubscriptionResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(LightXML.find_element(pd,"spotDatafeedSubscription[1]")) : nothing
    o.spotDatafeedSubscription = LightXML.find_element(pd,"spotDatafeedSubscription") != nothing ?  SpotDatafeedSubscriptionType(LightXML.content(LightXML.find_element(pd,"spotDatafeedSubscription"))) : nothing
    o
end

export CreateSpotDatafeedSubscriptionResponseType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeCustomerGatewaysType(; customerGatewaySet=nothing, filterSet=nothing) =
         new(customerGatewaySet, filterSet)
end
function DescribeCustomerGatewaysType(pd)
    o = DescribeCustomerGatewaysType()
    o.customerGatewaySet = AWS.parse_vector_as(String, "customerGatewayId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "customerGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeCustomerGatewaysType


type DescribePlacementGroupsResponseType
    requestId::Union{String, Void}
    placementGroupSet::Union{Vector{PlacementGroupInfoType}, Void}

    DescribePlacementGroupsResponseType(; requestId=nothing, placementGroupSet=nothing) =
         new(requestId, placementGroupSet)
end
function DescribePlacementGroupsResponseType(pd)
    o = DescribePlacementGroupsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.placementGroupSet = AWS.@parse_vector(AWS.EC2.PlacementGroupInfoType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "placementGroupSet"), "item"))
    o
end

export DescribePlacementGroupsResponseType


type DescribeReservedInstancesResponseType
    requestId::Union{String, Void}
    reservedInstancesSet::Union{Vector{DescribeReservedInstancesResponseSetItemType}, Void}

    DescribeReservedInstancesResponseType(; requestId=nothing, reservedInstancesSet=nothing) =
         new(requestId, reservedInstancesSet)
end
function DescribeReservedInstancesResponseType(pd)
    o = DescribeReservedInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservedInstancesSet"), "item"))
    o
end

export DescribeReservedInstancesResponseType


type ReplaceNetworkAclEntryType
    networkAclId::Union{String, Void}
    ruleNumber::Union{Int64, Void}
    protocol::Union{String, Void}
    ruleAction::Union{String, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{String, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    ReplaceNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function ReplaceNetworkAclEntryType(pd)
    o = ReplaceNetworkAclEntryType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o.ruleNumber = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "ruleNumber")))
    o.protocol = LightXML.content(LightXML.find_element(pd, "protocol"))
    o.ruleAction = LightXML.content(LightXML.find_element(pd, "ruleAction"))
    o.egress = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "egress")))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    ## o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode[1]")) : nothing
    o.icmpTypeCode = LightXML.find_element(pd,"icmpTypeCode") != nothing ? IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode")) : nothing
    ## o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LightXML.find_element(pd,"portRange[1]")) : nothing
    o.portRange = LightXML.find_element(pd,"portRange") != nothing ? PortRangeType(LightXML.find_element(pd,"portRange")) : nothing
    o
end

export ReplaceNetworkAclEntryType


type NetworkAclEntryType
    ruleNumber::Union{Int64, Void}
    protocol::Union{String, Void}
    ruleAction::Union{String, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{String, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    NetworkAclEntryType(; ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function NetworkAclEntryType(pd)
    o = NetworkAclEntryType()
    o.ruleNumber = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "ruleNumber")))
    o.protocol = LightXML.content(LightXML.find_element(pd, "protocol"))
    o.ruleAction = LightXML.content(LightXML.find_element(pd, "ruleAction"))
    o.egress = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "egress")))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    ## o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode[1]")) : nothing
    o.icmpTypeCode = LightXML.find_element(pd,"icmpTypeCode") != nothing ? IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode")) : nothing
    ## o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LightXML.find_element(pd,"portRange[1]")) : nothing
    o.portRange = LightXML.find_element(pd,"portRange") != nothing ? PortRangeType(LightXML.find_element(pd,"portRange")) : nothing
    o
end

export NetworkAclEntryType


type InternetGatewayType
    internetGatewayId::Union{String, Void}
    attachmentSet::Union{Vector{InternetGatewayAttachmentType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    InternetGatewayType(; internetGatewayId=nothing, attachmentSet=nothing, tagSet=nothing) =
         new(internetGatewayId, attachmentSet, tagSet)
end
function InternetGatewayType(pd)
    o = InternetGatewayType()
    o.internetGatewayId = LightXML.content(LightXML.find_element(pd, "internetGatewayId"))
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.InternetGatewayAttachmentType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "attachmentSet"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export InternetGatewayType


type DescribeRegionsType
    regionSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeRegionsType(; regionSet=nothing, filterSet=nothing) =
         new(regionSet, filterSet)
end
function DescribeRegionsType(pd)
    o = DescribeRegionsType()
    o.regionSet = AWS.parse_vector_as(String, "regionName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "regionName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeRegionsType


type DescribeSnapshotsType
    snapshotSet::Union{Vector{String}, Void}
    ownersSet::Union{Vector{String}, Void}
    restorableBySet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSnapshotsType(; snapshotSet=nothing, ownersSet=nothing, restorableBySet=nothing, filterSet=nothing) =
         new(snapshotSet, ownersSet, restorableBySet, filterSet)
end
function DescribeSnapshotsType(pd)
    o = DescribeSnapshotsType()
    o.snapshotSet = AWS.parse_vector_as(String, "snapshotId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "snapshotId"))
    o.ownersSet = AWS.parse_vector_as(String, "owner", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "owner"))
    o.restorableBySet = AWS.parse_vector_as(String, "user", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "user"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeSnapshotsType


type DescribeKeyPairsResponseType
    requestId::Union{String, Void}
    keySet::Union{Vector{DescribeKeyPairsResponseItemType}, Void}

    DescribeKeyPairsResponseType(; requestId=nothing, keySet=nothing) =
         new(requestId, keySet)
end
function DescribeKeyPairsResponseType(pd)
    o = DescribeKeyPairsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.keySet = AWS.@parse_vector(AWS.EC2.DescribeKeyPairsResponseItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "keySet"), "item"))
    o
end

export DescribeKeyPairsResponseType


type DescribeAvailabilityZonesResponseType
    requestId::Union{String, Void}
    availabilityZoneInfo::Union{Vector{AvailabilityZoneItemType}, Void}

    DescribeAvailabilityZonesResponseType(; requestId=nothing, availabilityZoneInfo=nothing) =
         new(requestId, availabilityZoneInfo)
end
function DescribeAvailabilityZonesResponseType(pd)
    o = DescribeAvailabilityZonesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.availabilityZoneInfo = AWS.@parse_vector(AWS.EC2.AvailabilityZoneItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "availabilityZoneInfo"), "item"))
    o
end

export DescribeAvailabilityZonesResponseType


type VpcType
    vpcId::Union{String, Void}
    state::Union{String, Void}
    cidrBlock::Union{String, Void}
    dhcpOptionsId::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    instanceTenancy::Union{String, Void}
    isDefault::Union{Bool, Void}

    VpcType(; vpcId=nothing, state=nothing, cidrBlock=nothing, dhcpOptionsId=nothing, tagSet=nothing, instanceTenancy=nothing, isDefault=nothing) =
         new(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault)
end
function VpcType(pd)
    o = VpcType()
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    o.dhcpOptionsId = LightXML.content(LightXML.find_element(pd, "dhcpOptionsId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.instanceTenancy = LightXML.content(LightXML.find_element(pd, "instanceTenancy"))
    o.isDefault = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "isDefault")))
    o
end

export VpcType


type DescribeSubnetsType
    subnetSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSubnetsType(; subnetSet=nothing, filterSet=nothing) =
         new(subnetSet, filterSet)
end
function DescribeSubnetsType(pd)
    o = DescribeSubnetsType()
    o.subnetSet = AWS.parse_vector_as(String, "subnetId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "subnetId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeSubnetsType


type DescribeRegionsResponseType
    requestId::Union{String, Void}
    regionInfo::Union{Vector{RegionItemType}, Void}

    DescribeRegionsResponseType(; requestId=nothing, regionInfo=nothing) =
         new(requestId, regionInfo)
end
function DescribeRegionsResponseType(pd)
    o = DescribeRegionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.regionInfo = AWS.@parse_vector(AWS.EC2.RegionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "regionInfo"), "item"))
    o
end

export DescribeRegionsResponseType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::Union{String, Void}
    spotDatafeedSubscription::Union{SpotDatafeedSubscriptionType, Void}

    DescribeSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) =
         new(requestId, spotDatafeedSubscription)
end
function DescribeSpotDatafeedSubscriptionResponseType(pd)
    o = DescribeSpotDatafeedSubscriptionResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(LightXML.find_element(pd,"spotDatafeedSubscription[1]")) : nothing
    o.spotDatafeedSubscription = LightXML.find_element(pd,"spotDatafeedSubscription") != nothing ? SpotDatafeedSubscriptionType(LightXML.find_element(pd,"spotDatafeedSubscription")) : nothing
    o
end

export DescribeSpotDatafeedSubscriptionResponseType


type DescribeReservedInstancesType
    reservedInstancesSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    offeringType::Union{String, Void}

    DescribeReservedInstancesType(; reservedInstancesSet=nothing, filterSet=nothing, offeringType=nothing) =
         new(reservedInstancesSet, filterSet, offeringType)
end
function DescribeReservedInstancesType(pd)
    o = DescribeReservedInstancesType()
    o.reservedInstancesSet = AWS.parse_vector_as(String, "reservedInstancesId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o.offeringType = LightXML.content(LightXML.find_element(pd, "offeringType"))
    o
end

export DescribeReservedInstancesType


type DescribeReservedInstancesOfferingsType
    reservedInstancesOfferingsSet::Union{Vector{String}, Void}
    instanceType::Union{String, Void}
    availabilityZone::Union{String, Void}
    productDescription::Union{String, Void}
    filterSet::Union{Vector{FilterType}, Void}
    instanceTenancy::Union{String, Void}
    offeringType::Union{String, Void}
    includeMarketplace::Union{Bool, Void}
    minDuration::Union{Int64, Void}
    maxDuration::Union{Int64, Void}
    maxInstanceCount::Union{Int64, Void}
    nextToken::Union{String, Void}
    maxResults::Union{Int64, Void}

    DescribeReservedInstancesOfferingsType(; reservedInstancesOfferingsSet=nothing, instanceType=nothing, availabilityZone=nothing, productDescription=nothing, filterSet=nothing, instanceTenancy=nothing, offeringType=nothing, includeMarketplace=nothing, minDuration=nothing, maxDuration=nothing, maxInstanceCount=nothing, nextToken=nothing, maxResults=nothing) =
         new(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults)
end
function DescribeReservedInstancesOfferingsType(pd)
    o = DescribeReservedInstancesOfferingsType()
    o.reservedInstancesOfferingsSet = AWS.parse_vector_as(String, "reservedInstancesOfferingId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "reservedInstancesOfferingId"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o.instanceTenancy = LightXML.content(LightXML.find_element(pd, "instanceTenancy"))
    o.offeringType = LightXML.content(LightXML.find_element(pd, "offeringType"))
    o.includeMarketplace = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "includeMarketplace")))
    o.minDuration = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "minDuration")))
    o.maxDuration = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxDuration")))
    o.maxInstanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxInstanceCount")))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
    o
end

export DescribeReservedInstancesOfferingsType


type DescribeImagesType
    executableBySet::Union{Vector{String}, Void}
    imagesSet::Union{Vector{String}, Void}
    ownersSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeImagesType(; executableBySet=nothing, imagesSet=nothing, ownersSet=nothing, filterSet=nothing) =
         new(executableBySet, imagesSet, ownersSet, filterSet)
end
function DescribeImagesType(pd)
    o = DescribeImagesType()
    o.executableBySet = AWS.parse_vector_as(String, "user", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "user"))
    o.imagesSet = AWS.parse_vector_as(String, "imageId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "imageId"))
    o.ownersSet = AWS.parse_vector_as(String, "owner", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "owner"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeImagesType


type DescribeConversionTasksResponseType
    requestId::Union{String, Void}
    conversionTasks::Union{Vector{ConversionTaskType}, Void}

    DescribeConversionTasksResponseType(; requestId=nothing, conversionTasks=nothing) =
         new(requestId, conversionTasks)
end
function DescribeConversionTasksResponseType(pd)
    o = DescribeConversionTasksResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.conversionTasks = AWS.@parse_vector(AWS.EC2.ConversionTaskType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "conversionTasks"), "item"))
    o
end

export DescribeConversionTasksResponseType


type DescribeAccountAttributesResponseType
    requestId::Union{String, Void}
    accountAttributeSet::Union{Vector{AccountAttributeSetItemType}, Void}

    DescribeAccountAttributesResponseType(; requestId=nothing, accountAttributeSet=nothing) =
         new(requestId, accountAttributeSet)
end
function DescribeAccountAttributesResponseType(pd)
    o = DescribeAccountAttributesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.accountAttributeSet = AWS.@parse_vector(AWS.EC2.AccountAttributeSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "accountAttributeSet"), "item"))
    o
end

export DescribeAccountAttributesResponseType


type CreateNetworkAclEntryType
    networkAclId::Union{String, Void}
    ruleNumber::Union{Int64, Void}
    protocol::Union{String, Void}
    ruleAction::Union{String, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{String, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    CreateNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function CreateNetworkAclEntryType(pd)
    o = CreateNetworkAclEntryType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o.ruleNumber = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "ruleNumber")))
    o.protocol = LightXML.content(LightXML.find_element(pd, "protocol"))
    o.ruleAction = LightXML.content(LightXML.find_element(pd, "ruleAction"))
    o.egress = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "egress")))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    ## o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode[1]")) : nothing
    o.icmpTypeCode = LightXML.find_element(pd,"icmpTypeCode") != nothing ? IcmpTypeCodeType(LightXML.find_element(pd,"icmpTypeCode")) : nothing
    ## o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LightXML.find_element(pd,"portRange[1]")) : nothing
    o.portRange = LightXML.find_element(pd,"portRange") != nothing ? PortRangeType(LightXML.find_element(pd,"portRange")) : nothing
    o
end

export CreateNetworkAclEntryType


type DescribeSnapshotsSetItemResponseType
    snapshotId::Union{String, Void}
    volumeId::Union{String, Void}
    status::Union{String, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    progress::Union{String, Void}
    ownerId::Union{String, Void}
    volumeSize::Union{String, Void}
    description::Union{String, Void}
    ownerAlias::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    DescribeSnapshotsSetItemResponseType(; snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing, ownerAlias=nothing, tagSet=nothing) =
         new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet)
end
function DescribeSnapshotsSetItemResponseType(pd)
    o = DescribeSnapshotsSetItemResponseType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "startTime")))
    o.progress = LightXML.content(LightXML.find_element(pd, "progress"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.volumeSize = LightXML.content(LightXML.find_element(pd, "volumeSize"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.ownerAlias = LightXML.content(LightXML.find_element(pd, "ownerAlias"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export DescribeSnapshotsSetItemResponseType


type BundleInstanceTaskStorageType
    S3::Union{BundleInstanceS3StorageType, Void}

    BundleInstanceTaskStorageType(; S3=nothing) =
         new(S3)
end
function BundleInstanceTaskStorageType(pd)
    o = BundleInstanceTaskStorageType()
    ## o.S3 = length(pd["S3"]) > 0 ?  BundleInstanceS3StorageType(LightXML.find_element(pd,"S3[1]")) : nothing
    o.S3 = LightXML.find_element(pd,"S3") != nothing ? BundleInstanceS3StorageType(LightXML.find_element(pd,"S3")) : nothing
    o
end

export BundleInstanceTaskStorageType


type InstanceStatusItemType
    instanceId::Union{String, Void}
    availabilityZone::Union{String, Void}
    eventsSet::Union{Vector{InstanceStatusEventType}, Void}
    instanceState::Union{InstanceStateType, Void}
    systemStatus::Union{InstanceStatusType, Void}
    instanceStatus::Union{InstanceStatusType, Void}

    InstanceStatusItemType(; instanceId=nothing, availabilityZone=nothing, eventsSet=nothing, instanceState=nothing, systemStatus=nothing, instanceStatus=nothing) =
         new(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus)
end
function InstanceStatusItemType(pd)
    o = InstanceStatusItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.eventsSet = LightXML.find_element(pd, "eventsSet") != nothing ?AWS.@parse_vector(AWS.EC2.InstanceStatusEventType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "eventsSet"), "item")) : nothing
    ## o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(LightXML.find_element(pd,"instanceState[1]")) : nothing
    o.instanceState = LightXML.find_element(pd,"instanceState") != nothing ?  InstanceStateType(LightXML.find_element(pd,"instanceState")) : nothing
    ## o.systemStatus = length(pd["systemStatus"]) > 0 ?  InstanceStatusType(LightXML.find_element(pd,"systemStatus[1]")) : nothing
    o.systemStatus = LightXML.find_element(pd,"systemStatus") != nothing ?  InstanceStatusType(LightXML.find_element(pd,"systemStatus")) : nothing
    ## o.instanceStatus = length(pd["instanceStatus"]) > 0 ?  InstanceStatusType(LightXML.find_element(pd,"instanceStatus[1]")) : nothing
    o.instanceStatus = LightXML.find_element(pd,"instanceStatus") != nothing ?  InstanceStatusType(LightXML.find_element(pd,"instanceStatus")) : nothing
    o
end

export InstanceStatusItemType


type InstanceNetworkInterfaceSetItemRequestType
    networkInterfaceId::Union{String, Void}
    deviceIndex::Union{Int64, Void}
    subnetId::Union{String, Void}
    description::Union{String, Void}
    privateIpAddress::Union{String, Void}
    groupSet::Union{Vector{String}, Void}
    deleteOnTermination::Union{Bool, Void}
    privateIpAddressesSet::Union{Vector{PrivateIpAddressesSetItemRequestType}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}

    InstanceNetworkInterfaceSetItemRequestType(; networkInterfaceId=nothing, deviceIndex=nothing, subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, deleteOnTermination=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) =
         new(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function InstanceNetworkInterfaceSetItemRequestType(pd)
    o = InstanceNetworkInterfaceSetItemRequestType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.deviceIndex = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "deviceIndex")))
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.groupSet = AWS.parse_vector_as(String, "groupId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "groupId"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "deleteOnTermination")))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "privateIpAddressesSet"), "item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "secondaryPrivateIpAddressCount")))
    o
end

export InstanceNetworkInterfaceSetItemRequestType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union{Vector{String}, Void}
    reservedInstancesSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeReservedInstancesListingsType(; reservedInstancesListingSet=nothing, reservedInstancesSet=nothing, filterSet=nothing) =
         new(reservedInstancesListingSet, reservedInstancesSet, filterSet)
end
function DescribeReservedInstancesListingsType(pd)
    o = DescribeReservedInstancesListingsType()
    o.reservedInstancesListingSet = AWS.parse_vector_as(String, "reservedInstancesListingId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "reservedInstancesListingId"))
    o.reservedInstancesSet = AWS.parse_vector_as(String, "reservedInstancesId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeReservedInstancesListingsType


type DescribeSpotPriceHistoryType
    startTime::Union{Base.Dates.DateTime, Void}
    endTime::Union{Base.Dates.DateTime, Void}
    instanceTypeSet::Union{Vector{String}, Void}
    productDescriptionSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    availabilityZone::Union{String, Void}
    maxResults::Union{Int64, Void}
    nextToken::Union{String, Void}

    DescribeSpotPriceHistoryType(; startTime=nothing, endTime=nothing, instanceTypeSet=nothing, productDescriptionSet=nothing, filterSet=nothing, availabilityZone=nothing, maxResults=nothing, nextToken=nothing) =
         new(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken)
end
function DescribeSpotPriceHistoryType(pd)
    o = DescribeSpotPriceHistoryType()
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "startTime")))
    o.endTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "endTime")))
    o.instanceTypeSet = AWS.parse_vector_as(String, "instanceType", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceType"))
    o.productDescriptionSet = AWS.parse_vector_as(String, "productDescription", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "productDescription"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.maxResults = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxResults")))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o
end

export DescribeSpotPriceHistoryType


type DescribeReservedInstancesOfferingsResponseSetItemType
    reservedInstancesOfferingId::Union{String, Void}
    instanceType::Union{String, Void}
    availabilityZone::Union{String, Void}
    duration::Union{Int64, Void}
    fixedPrice::Union{Float64, Void}
    usagePrice::Union{Float64, Void}
    productDescription::Union{String, Void}
    instanceTenancy::Union{String, Void}
    currencyCode::Union{String, Void}
    offeringType::Union{String, Void}
    recurringCharges::Union{Vector{RecurringChargesSetItemType}, Void}
    marketplace::Union{Bool, Void}
    pricingDetailsSet::Union{Vector{PricingDetailsSetItemType}, Void}

    DescribeReservedInstancesOfferingsResponseSetItemType(; reservedInstancesOfferingId=nothing, instanceType=nothing, availabilityZone=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, productDescription=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing, marketplace=nothing, pricingDetailsSet=nothing) =
         new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet)
end
function DescribeReservedInstancesOfferingsResponseSetItemType(pd)
    o = DescribeReservedInstancesOfferingsResponseSetItemType()
    o.reservedInstancesOfferingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesOfferingId"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.duration = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "duration")))
    o.fixedPrice = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "fixedPrice")))
    o.usagePrice = AWS.safe_parse_as(Float64, LightXML.content(LightXML.find_element(pd, "usagePrice")))
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o.instanceTenancy = LightXML.content(LightXML.find_element(pd, "instanceTenancy"))
    o.currencyCode = LightXML.content(LightXML.find_element(pd, "currencyCode"))
    o.offeringType = LightXML.content(LightXML.find_element(pd, "offeringType"))
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "recurringCharges"), "item"))
    o.marketplace = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "marketplace")))
    o.pricingDetailsSet = AWS.@parse_vector(AWS.EC2.PricingDetailsSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "pricingDetailsSet"), "item"))
    o
end

export DescribeReservedInstancesOfferingsResponseSetItemType


type IpPermissionType
    ipProtocol::Union{String, Void}
    fromPort::Union{Int64, Void}
    toPort::Union{Int64, Void}
    groups::Union{Vector{UserIdGroupPairType}, Void}
    ipRanges::Union{Vector{String}, Void}

    IpPermissionType(; ipProtocol=nothing, fromPort=nothing, toPort=nothing, groups=nothing, ipRanges=nothing) =
         new(ipProtocol, fromPort, toPort, groups, ipRanges)
end
function IpPermissionType(pd)
    o = IpPermissionType()
    o.ipProtocol = LightXML.content(LightXML.find_element(pd, "ipProtocol"))
    o.fromPort = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "fromPort")))
    o.toPort = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "toPort")))
    o.groups = AWS.@parse_vector(AWS.EC2.UserIdGroupPairType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groups"), "item"))
    o.ipRanges = AWS.parse_vector_as(String, "cidrIp", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "cidrIp"))
    o
end

export IpPermissionType


type DescribeVolumesResponseType
    requestId::Union{String, Void}
    volumeSet::Union{Vector{DescribeVolumesSetItemResponseType}, Void}

    DescribeVolumesResponseType(; requestId=nothing, volumeSet=nothing) =
         new(requestId, volumeSet)
end
function DescribeVolumesResponseType(pd)
    o = DescribeVolumesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeSet = AWS.@parse_vector(AWS.EC2.DescribeVolumesSetItemResponseType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "volumeSet"), "item"))
    o
end

export DescribeVolumesResponseType


type DescribeSpotPriceHistoryResponseType
    requestId::Union{String, Void}
    spotPriceHistorySet::Union{Vector{SpotPriceHistorySetItemType}, Void}
    nextToken::Union{String, Void}

    DescribeSpotPriceHistoryResponseType(; requestId=nothing, spotPriceHistorySet=nothing, nextToken=nothing) =
         new(requestId, spotPriceHistorySet, nextToken)
end
function DescribeSpotPriceHistoryResponseType(pd)
    o = DescribeSpotPriceHistoryResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.spotPriceHistorySet = AWS.@parse_vector(AWS.EC2.SpotPriceHistorySetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "spotPriceHistorySet"), "item"))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o
end

export DescribeSpotPriceHistoryResponseType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing, filterSet=nothing) =
         new(spotInstanceRequestIdSet, filterSet)
end
function DescribeSpotInstanceRequestsType(pd)
    o = DescribeSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(String, "spotInstanceRequestId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "spotInstanceRequestId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeSpotInstanceRequestsType


type CreateDhcpOptionsResponseType
    requestId::Union{String, Void}
    dhcpOptions::Union{DhcpOptionsType, Void}

    CreateDhcpOptionsResponseType(; requestId=nothing, dhcpOptions=nothing) =
         new(requestId, dhcpOptions)
end
function CreateDhcpOptionsResponseType(pd)
    o = CreateDhcpOptionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.dhcpOptions = length(pd["dhcpOptions"]) > 0 ?  DhcpOptionsType(LightXML.find_element(pd,"dhcpOptions[1]")) : nothing
    o.dhcpOptions = LightXML.find_element(pd,"dhcpOptions") != nothing ? DhcpOptionsType(LightXML.find_element(pd,"dhcpOptions")) : nothing
    o
end

export CreateDhcpOptionsResponseType


type DescribeRouteTablesType
    routeTableIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeRouteTablesType(; routeTableIdSet=nothing, filterSet=nothing) =
         new(routeTableIdSet, filterSet)
end
function DescribeRouteTablesType(pd)
    o = DescribeRouteTablesType()
    o.routeTableIdSet = AWS.parse_vector_as(String, "routeTableId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "routeTableId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeRouteTablesType


type DescribeInternetGatewaysResponseType
    requestId::Union{String, Void}
    internetGatewaySet::Union{Vector{InternetGatewayType}, Void}

    DescribeInternetGatewaysResponseType(; requestId=nothing, internetGatewaySet=nothing) =
         new(requestId, internetGatewaySet)
end
function DescribeInternetGatewaysResponseType(pd)
    o = DescribeInternetGatewaysResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.internetGatewaySet = AWS.@parse_vector(AWS.EC2.InternetGatewayType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "internetGatewaySet"), "item"))
    o
end

export DescribeInternetGatewaysResponseType


type CreateInstanceExportTaskResponseType
    requestId::Union{String, Void}
    exportTask::Union{ExportTaskResponseType, Void}

    CreateInstanceExportTaskResponseType(; requestId=nothing, exportTask=nothing) =
         new(requestId, exportTask)
end
function CreateInstanceExportTaskResponseType(pd)
    o = CreateInstanceExportTaskResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.exportTask = length(pd["exportTask"]) > 0 ?  ExportTaskResponseType(LightXML.find_element(pd,"exportTask[1]")) : nothing
    o.exportTask = LightXML.find_element(pd,"exportTask") != nothing ? ExportTaskResponseType(LightXML.find_element(pd,"exportTask")) : nothing
    o
end

export CreateInstanceExportTaskResponseType


type CreateImageType
    instanceId::Union{String, Void}
    name::Union{String, Void}
    description::Union{String, Void}
    noReboot::Union{Bool, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}

    CreateImageType(; instanceId=nothing, name=nothing, description=nothing, noReboot=nothing, blockDeviceMapping=nothing) =
         new(instanceId, name, description, noReboot, blockDeviceMapping)
end
function CreateImageType(pd)
    o = CreateImageType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.name = LightXML.content(LightXML.find_element(pd, "name"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.noReboot = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "noReboot")))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    o
end

export CreateImageType


type DescribeInternetGatewaysType
    internetGatewayIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeInternetGatewaysType(; internetGatewayIdSet=nothing, filterSet=nothing) =
         new(internetGatewayIdSet, filterSet)
end
function DescribeInternetGatewaysType(pd)
    o = DescribeInternetGatewaysType()
    o.internetGatewayIdSet = AWS.parse_vector_as(String, "internetGatewayId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "internetGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeInternetGatewaysType


type InstanceStateChangeType
    instanceId::Union{String, Void}
    currentState::Union{InstanceStateType, Void}
    previousState::Union{InstanceStateType, Void}

    InstanceStateChangeType(; instanceId=nothing, currentState=nothing, previousState=nothing) =
         new(instanceId, currentState, previousState)
end
function InstanceStateChangeType(pd)
    o = InstanceStateChangeType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    ## o.currentState = length(pd["currentState"]) > 0 ?  InstanceStateType(LightXML.find_element(pd,"currentState[1]")) : nothing
    o.currentState = LightXML.find_element(pd,"currentState") != nothing ?  InstanceStateType(LightXML.find_element(pd,"currentState")) : nothing
    ## o.previousState = length(pd["previousState"]) > 0 ?  InstanceStateType(LightXML.find_element(pd,"previousState[1]")) : nothing
    o.previousState = LightXML.find_element(pd,"previousState") != nothing ?  InstanceStateType(LightXML.find_element(pd,"previousState")) : nothing
    o
end

export InstanceStateChangeType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::Union{String, Void}
    instanceCount::Union{Int64, Void}
    limitPrice::Union{ReservedInstanceLimitPriceType, Void}

    PurchaseReservedInstancesOfferingType(; reservedInstancesOfferingId=nothing, instanceCount=nothing, limitPrice=nothing) =
         new(reservedInstancesOfferingId, instanceCount, limitPrice)
end
function PurchaseReservedInstancesOfferingType(pd)
    o = PurchaseReservedInstancesOfferingType()
    o.reservedInstancesOfferingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesOfferingId"))
    o.instanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCount")))
    ## o.limitPrice = length(pd["limitPrice"]) > 0 ?  ReservedInstanceLimitPriceType(LightXML.find_element(pd,"limitPrice[1]")) : nothing
    o.limitPrice = LightXML.find_element(pd,"limitPrice") != nothing ? ReservedInstanceLimitPriceType(LightXML.find_element(pd,"limitPrice")) : nothing
    o
end

export PurchaseReservedInstancesOfferingType


type RouteTableType
    routeTableId::Union{String, Void}
    vpcId::Union{String, Void}
    routeSet::Union{Vector{RouteType}, Void}
    associationSet::Union{Vector{RouteTableAssociationType}, Void}
    propagatingVgwSet::Union{Vector{String}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    RouteTableType(; routeTableId=nothing, vpcId=nothing, routeSet=nothing, associationSet=nothing, propagatingVgwSet=nothing, tagSet=nothing) =
         new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet)
end
function RouteTableType(pd)
    o = RouteTableType()
    o.routeTableId = LightXML.content(LightXML.find_element(pd, "routeTableId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.routeSet = AWS.@parse_vector(AWS.EC2.RouteType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "routeSet"), "item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.RouteTableAssociationType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "associationSet"), "item"))
    o.propagatingVgwSet = AWS.parse_vector_as(String, "gatewayId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "gatewayId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export RouteTableType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpnConnectionsType(; vpnConnectionSet=nothing, filterSet=nothing) =
         new(vpnConnectionSet, filterSet)
end
function DescribeVpnConnectionsType(pd)
    o = DescribeVpnConnectionsType()
    o.vpnConnectionSet = AWS.parse_vector_as(String, "vpnConnectionId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "vpnConnectionId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeVpnConnectionsType


type CreateNetworkInterfaceType
    subnetId::Union{String, Void}
    description::Union{String, Void}
    privateIpAddress::Union{String, Void}
    groupSet::Union{Vector{String}, Void}
    privateIpAddressesSet::Union{Vector{PrivateIpAddressesSetItemRequestType}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}

    CreateNetworkInterfaceType(; subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) =
         new(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function CreateNetworkInterfaceType(pd)
    o = CreateNetworkInterfaceType()
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.groupSet = AWS.parse_vector_as(String, "groupId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "groupId"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "privateIpAddressesSet"), "item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "secondaryPrivateIpAddressCount")))
    o
end

export CreateNetworkInterfaceType


type DescribeVpcsResponseType
    requestId::Union{String, Void}
    vpcSet::Union{Vector{VpcType}, Void}

    DescribeVpcsResponseType(; requestId=nothing, vpcSet=nothing) =
         new(requestId, vpcSet)
end
function DescribeVpcsResponseType(pd)
    o = DescribeVpcsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.vpcSet = AWS.@parse_vector(AWS.EC2.VpcType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vpcSet"), "item"))
    o
end

export DescribeVpcsResponseType


type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::Union{String, Void}
    reservedInstancesId::Union{String, Void}
    createDate::Union{Base.Dates.DateTime, Void}
    updateDate::Union{Base.Dates.DateTime, Void}
    status::Union{String, Void}
    statusMessage::Union{String, Void}
    instanceCounts::Union{Vector{InstanceCountsSetItemType}, Void}
    priceSchedules::Union{Vector{PriceScheduleSetItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    clientToken::Union{String, Void}

    DescribeReservedInstancesListingsResponseSetItemType(; reservedInstancesListingId=nothing, reservedInstancesId=nothing, createDate=nothing, updateDate=nothing, status=nothing, statusMessage=nothing, instanceCounts=nothing, priceSchedules=nothing, tagSet=nothing, clientToken=nothing) =
         new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken)
end
function DescribeReservedInstancesListingsResponseSetItemType(pd)
    o = DescribeReservedInstancesListingsResponseSetItemType()
    o.reservedInstancesListingId = LightXML.content(LightXML.find_element(pd, "reservedInstancesListingId"))
    o.reservedInstancesId = LightXML.content(LightXML.find_element(pd, "reservedInstancesId"))
    o.createDate = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "createDate")))
    o.updateDate = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "updateDate")))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.statusMessage = LightXML.content(LightXML.find_element(pd, "statusMessage"))
    o.instanceCounts = AWS.@parse_vector(AWS.EC2.InstanceCountsSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instanceCounts"), "item"))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "priceSchedules"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
    o
end

export DescribeReservedInstancesListingsResponseSetItemType


type DescribeVpcsType
    vpcSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpcsType(; vpcSet=nothing, filterSet=nothing) =
         new(vpcSet, filterSet)
end
function DescribeVpcsType(pd)
    o = DescribeVpcsType()
    o.vpcSet = AWS.parse_vector_as(String, "vpcId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "vpcId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeVpcsType


type DescribeDhcpOptionsResponseType
    requestId::Union{String, Void}
    dhcpOptionsSet::Union{Vector{DhcpOptionsType}, Void}

    DescribeDhcpOptionsResponseType(; requestId=nothing, dhcpOptionsSet=nothing) =
         new(requestId, dhcpOptionsSet)
end
function DescribeDhcpOptionsResponseType(pd)
    o = DescribeDhcpOptionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.dhcpOptionsSet = AWS.@parse_vector(AWS.EC2.DhcpOptionsType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "dhcpOptionsSet"), "item"))
    o
end

export DescribeDhcpOptionsResponseType


type DescribeTagsType
    filterSet::Union{Vector{FilterType}, Void}

    DescribeTagsType(; filterSet=nothing) =
         new(filterSet)
end
function DescribeTagsType(pd)
    o = DescribeTagsType()
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeTagsType


type MonitorInstancesResponseSetItemType
    instanceId::Union{String, Void}
    monitoring::Union{InstanceMonitoringStateType, Void}

    MonitorInstancesResponseSetItemType(; instanceId=nothing, monitoring=nothing) =
         new(instanceId, monitoring)
end
function MonitorInstancesResponseSetItemType(pd)
    o = MonitorInstancesResponseSetItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ? InstanceMonitoringStateType(LightXML.find_element(pd,"monitoring")) : nothing
    o
end

export MonitorInstancesResponseSetItemType


type DescribeRouteTablesResponseType
    requestId::Union{String, Void}
    routeTableSet::Union{Vector{RouteTableType}, Void}

    DescribeRouteTablesResponseType(; requestId=nothing, routeTableSet=nothing) =
         new(requestId, routeTableSet)
end
function DescribeRouteTablesResponseType(pd)
    o = DescribeRouteTablesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.routeTableSet = AWS.@parse_vector(AWS.EC2.RouteTableType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "routeTableSet"), "item"))
    o
end

export DescribeRouteTablesResponseType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAccountAttributesType(; accountAttributeNameSet=nothing, filterSet=nothing) =
         new(accountAttributeNameSet, filterSet)
end
function DescribeAccountAttributesType(pd)
    o = DescribeAccountAttributesType()
    o.accountAttributeNameSet = AWS.parse_vector_as(String, "attributeName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "attributeName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeAccountAttributesType


type DescribeInstanceStatusResponseType
    requestId::Union{String, Void}
    instanceStatusSet::Union{Vector{InstanceStatusItemType}, Void}
    nextToken::Union{String, Void}

    DescribeInstanceStatusResponseType(; requestId=nothing, instanceStatusSet=nothing, nextToken=nothing) =
         new(requestId, instanceStatusSet, nextToken)
end
function DescribeInstanceStatusResponseType(pd)
    o = DescribeInstanceStatusResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instanceStatusSet = LightXML.find_element(pd, "instanceStatusSet") != nothing ? AWS.@parse_vector(AWS.EC2.InstanceStatusItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instanceStatusSet"), "item")) : nothing
    o.nextToken = LightXML.find_element(pd, "nextToken") != nothing ? LightXML.content(LightXML.find_element(pd, "nextToken")) : nothing
    o
end

export DescribeInstanceStatusResponseType


type VpnGatewayType
    vpnGatewayId::Union{String, Void}
    state::Union{String, Void}
    _type::Union{String, Void}
    availabilityZone::Union{String, Void}
    attachments::Union{Vector{AttachmentType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    VpnGatewayType(; vpnGatewayId=nothing, state=nothing, _type=nothing, availabilityZone=nothing, attachments=nothing, tagSet=nothing) =
         new(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet)
end
function VpnGatewayType(pd)
    o = VpnGatewayType()
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.attachments = AWS.@parse_vector(AWS.EC2.AttachmentType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "attachments"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export VpnGatewayType


type DescribeKeyPairsType
    keySet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeKeyPairsType(; keySet=nothing, filterSet=nothing) =
         new(keySet, filterSet)
end
function DescribeKeyPairsType(pd)
    o = DescribeKeyPairsType()
    o.keySet = AWS.parse_vector_as(String, "keyName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "keyName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeKeyPairsType


type BundleInstanceType
    instanceId::Union{String, Void}
    storage::Union{BundleInstanceTaskStorageType, Void}

    BundleInstanceType(; instanceId=nothing, storage=nothing) =
         new(instanceId, storage)
end
function BundleInstanceType(pd)
    o = BundleInstanceType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    ## o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(LightXML.find_element(pd,"storage[1]")) : nothing
    o.storage = LightXML.find_element(pd,"storage") != nothing ? BundleInstanceTaskStorageType(LightXML.find_element(pd,"storage")) : nothing
    o
end

export BundleInstanceType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union{String, Void}
    privateDnsName::Union{String, Void}
    primary::Union{Bool, Void}
    association::Union{InstanceNetworkInterfaceAssociationType, Void}

    InstancePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) =
         new(privateIpAddress, privateDnsName, primary, association)
end
function InstancePrivateIpAddressesSetItemType(pd)
    o = InstancePrivateIpAddressesSetItemType()
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.privateDnsName = LightXML.find_element(pd, "privateDnsName") != nothing ? LightXML.content(LightXML.find_element(pd, "privateDnsName")) : nothing
    o.primary = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "primary")))
    ## o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(LightXML.find_element(pd,"association[1]")) : nothing
    o.association = LightXML.find_element(pd,"association") != nothing ? InstanceNetworkInterfaceAssociationType(LightXML.find_element(pd,"association")) : nothing
    o
end

export InstancePrivateIpAddressesSetItemType


type ImportInstanceLaunchSpecificationType
    architecture::Union{String, Void}
    groupSet::Union{Vector{ImportInstanceGroupItemType}, Void}
    userData::Union{UserDataType, Void}
    instanceType::Union{String, Void}
    placement::Union{InstancePlacementType, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{String, Void}
    instanceInitiatedShutdownBehavior::Union{String, Void}
    privateIpAddress::Union{String, Void}

    ImportInstanceLaunchSpecificationType(; architecture=nothing, groupSet=nothing, userData=nothing, instanceType=nothing, placement=nothing, monitoring=nothing, subnetId=nothing, instanceInitiatedShutdownBehavior=nothing, privateIpAddress=nothing) =
         new(architecture, groupSet, userData, instanceType, placement, monitoring, subnetId, instanceInitiatedShutdownBehavior, privateIpAddress)
end
function ImportInstanceLaunchSpecificationType(pd)
    o = ImportInstanceLaunchSpecificationType()
    o.architecture = LightXML.content(LightXML.find_element(pd, "architecture"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.ImportInstanceGroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    ## o.userData = length(pd["userData"]) > 0 ?  UserDataType(LightXML.find_element(pd,"userData[1]")) : nothing
    o.userData = LightXML.find_element(pd,"userData") != nothing ?  UserDataType(LightXML.find_element(pd,"userData")) : nothing
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    ## o.placement = length(pd["placement"]) > 0 ?  InstancePlacementType(LightXML.find_element(pd,"placement[1]")) : nothing
    o.placement = LightXML.find_element(pd,"placement") != nothing ?  InstancePlacementType(LightXML.find_element(pd,"placement")) : nothing
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring")) : nothing
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.instanceInitiatedShutdownBehavior = LightXML.content(LightXML.find_element(pd, "instanceInitiatedShutdownBehavior"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o
end

export ImportInstanceLaunchSpecificationType


type DescribeAddressesType
    publicIpsSet::Union{Vector{String}, Void}
    allocationIdsSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAddressesType(; publicIpsSet=nothing, allocationIdsSet=nothing, filterSet=nothing) =
         new(publicIpsSet, allocationIdsSet, filterSet)
end
function DescribeAddressesType(pd)
    o = DescribeAddressesType()
    o.publicIpsSet = AWS.parse_vector_as(String, "publicIp", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "publicIp"))
    o.allocationIdsSet = AWS.parse_vector_as(String, "allocationId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "allocationId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeAddressesType


type VolumeStatusInfoType
    status::Union{String, Void}
    details::Union{Vector{VolumeStatusDetailsItemType}, Void}

    VolumeStatusInfoType(; status=nothing, details=nothing) =
         new(status, details)
end
function VolumeStatusInfoType(pd)
    o = VolumeStatusInfoType()
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.details = AWS.@parse_vector(AWS.EC2.VolumeStatusDetailsItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "details"), "item"))
    o
end

export VolumeStatusInfoType


type StartInstancesResponseType
    requestId::Union{String, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    StartInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function StartInstancesResponseType(pd)
    o = StartInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    o
end

export StartInstancesResponseType


type CreateVpnConnectionType
    _type::Union{String, Void}
    customerGatewayId::Union{String, Void}
    vpnGatewayId::Union{String, Void}
    options::Union{VpnConnectionOptionsRequestType, Void}

    CreateVpnConnectionType(; _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, options=nothing) =
         new(_type, customerGatewayId, vpnGatewayId, options)
end
function CreateVpnConnectionType(pd)
    o = CreateVpnConnectionType()
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.customerGatewayId = LightXML.content(LightXML.find_element(pd, "customerGatewayId"))
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    ## o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsRequestType(LightXML.find_element(pd,"options[1]")) : nothing
    o.options = LightXML.find_element(pd,"options") != nothing ? VpnConnectionOptionsRequestType(LightXML.find_element(pd,"options")) : nothing
    o
end

export CreateVpnConnectionType


type AuthorizeSecurityGroupEgressType
    groupId::Union{String, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    AuthorizeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) =
         new(groupId, ipPermissions)
end
function AuthorizeSecurityGroupEgressType(pd)
    o = AuthorizeSecurityGroupEgressType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissions"), "item"))
    o
end

export AuthorizeSecurityGroupEgressType


type CreateReservedInstancesListingResponseType
    requestId::Union{String, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    CreateReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function CreateReservedInstancesListingResponseType(pd)
    o = CreateReservedInstancesListingResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservedInstancesListingsSet"), "item"))
    o
end

export CreateReservedInstancesListingResponseType


type NetworkAclType
    networkAclId::Union{String, Void}
    vpcId::Union{String, Void}
    default::Union{Bool, Void}
    entrySet::Union{Vector{NetworkAclEntryType}, Void}
    associationSet::Union{Vector{NetworkAclAssociationType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    NetworkAclType(; networkAclId=nothing, vpcId=nothing, default=nothing, entrySet=nothing, associationSet=nothing, tagSet=nothing) =
         new(networkAclId, vpcId, default, entrySet, associationSet, tagSet)
end
function NetworkAclType(pd)
    o = NetworkAclType()
    o.networkAclId = LightXML.content(LightXML.find_element(pd, "networkAclId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.default = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "default")))
    o.entrySet = AWS.@parse_vector(AWS.EC2.NetworkAclEntryType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "entrySet"), "item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.NetworkAclAssociationType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "associationSet"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export NetworkAclType


type DescribeAddressesResponseType
    requestId::Union{String, Void}
    addressesSet::Union{Vector{DescribeAddressesResponseItemType}, Void}

    DescribeAddressesResponseType(; requestId=nothing, addressesSet=nothing) =
         new(requestId, addressesSet)
end
function DescribeAddressesResponseType(pd)
    o = DescribeAddressesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.addressesSet = AWS.@parse_vector(AWS.EC2.DescribeAddressesResponseItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "addressesSet"), "item"))
    o
end

export DescribeAddressesResponseType


type TerminateInstancesResponseType
    requestId::Union{String, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    TerminateInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function TerminateInstancesResponseType(pd)
    o = TerminateInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    o
end

export TerminateInstancesResponseType


type DiskImageType
    image::Union{DiskImageDetailType, Void}
    description::Union{String, Void}
    volume::Union{DiskImageVolumeType, Void}

    DiskImageType(; image=nothing, description=nothing, volume=nothing) =
         new(image, description, volume)
end
function DiskImageType(pd)
    o = DiskImageType()
    ## o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(LightXML.find_element(pd,"image[1]")) : nothing
    o.image = LightXML.find_element(pd,"image") != nothing ? DiskImageDetailType(LightXML.find_element(pd,"image")) : nothing
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    ## o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(LightXML.find_element(pd,"volume[1]")) : nothing
    o.volume = LightXML.find_element(pd,"volume") != nothing ? DiskImageVolumeType(LightXML.find_element(pd,"volume")) : nothing
    o
end

export DiskImageType


type RunInstancesType
    imageId::Union{String, Void}
    minCount::Union{Int64, Void}
    maxCount::Union{Int64, Void}
    keyName::Union{String, Void}
    securityGroupIdSet::Union{Vector{String}, Void}
    securityGroupSet::Union{Vector{String}, Void}
    additionalInfo::Union{String, Void}
    userData::Union{UserDataType, Void}
    addressingType::Union{String, Void}
    instanceType::Union{String, Void}
    placement::Union{PlacementRequestType, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{String, Void}
    disableApiTermination::Union{Bool, Void}
    instanceInitiatedShutdownBehavior::Union{String, Void}
    license::Union{InstanceLicenseRequestType, Void}
    privateIpAddress::Union{String, Void}
    clientToken::Union{String, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, securityGroupIdSet=nothing, securityGroupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, minCount, maxCount, keyName, securityGroupIdSet, securityGroupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunInstancesType(pd)
    o = RunInstancesType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o.minCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "minCount")))
    o.maxCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "maxCount")))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.securityGroupIdSet = AWS.parse_vector_as(String, "securityGroupId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "securityGroupId"))
    o.securityGroupSet = AWS.parse_vector_as(String, "securityGroup", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "securityGroup"))
    o.additionalInfo = LightXML.content(LightXML.find_element(pd, "additionalInfo"))
    ## o.userData = length(pd["userData"]) > 0 ?  UserDataType(LightXML.find_element(pd,"userData[1]")) : nothing
    o.userData = LightXML.find_element(pd,"userData") != nothing ?  UserDataType(LightXML.find_element(pd,"userData")) : nothing
    o.addressingType = LightXML.content(LightXML.find_element(pd, "addressingType"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    ## o.placement = length(pd["placement"]) > 0 ?  PlacementRequestType(LightXML.find_element(pd,"placement[1]")) : nothing
    o.placement = LightXML.find_element(pd,"placement") != nothing ?  PlacementRequestType(LightXML.find_element(pd,"placement")) : nothing
    o.kernelId = LightXML.content(LightXML.find_element(pd, "kernelId"))
    o.ramdiskId = LightXML.content(LightXML.find_element(pd, "ramdiskId"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring")) : nothing
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.disableApiTermination = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "disableApiTermination")))
    o.instanceInitiatedShutdownBehavior = LightXML.content(LightXML.find_element(pd, "instanceInitiatedShutdownBehavior"))
    ## o.license = length(pd["license"]) > 0 ?  InstanceLicenseRequestType(LightXML.find_element(pd,"license[1]")) : nothing
    o.license = LightXML.find_element(pd,"license") != nothing ?  InstanceLicenseRequestType(LightXML.find_element(pd,"license")) : nothing
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkInterfaceSet"), "item"))
    ## o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile[1]")) : nothing
    o.iamInstanceProfile = LightXML.find_element(pd,"iamInstanceProfile") ?  IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "ebsOptimized")))
    o
end

export RunInstancesType


type DescribeAvailabilityZonesType
    availabilityZoneSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAvailabilityZonesType(; availabilityZoneSet=nothing, filterSet=nothing) =
         new(availabilityZoneSet, filterSet)
end
function DescribeAvailabilityZonesType(pd)
    o = DescribeAvailabilityZonesType()
    o.availabilityZoneSet = AWS.parse_vector_as(String, "zoneName", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "zoneName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeAvailabilityZonesType


type CreateVolumePermissionOperationType
    add::Union{Vector{CreateVolumePermissionItemType}, Void}
    remove::Union{Vector{CreateVolumePermissionItemType}, Void}

    CreateVolumePermissionOperationType(; add=nothing, remove=nothing) =
         new(add, remove)
end
function CreateVolumePermissionOperationType(pd)
    o = CreateVolumePermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "add"), "item"))
    o.remove = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "remove"), "item"))
    o
end

export CreateVolumePermissionOperationType


type InstanceNetworkInterfaceSetItemType
    networkInterfaceId::Union{String, Void}
    subnetId::Union{String, Void}
    vpcId::Union{String, Void}
    description::Union{String, Void}
    ownerId::Union{String, Void}
    status::Union{String, Void}
    macAddress::Union{String, Void}
    privateIpAddress::Union{String, Void}
    privateDnsName::Union{String, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    attachment::Union{InstanceNetworkInterfaceAttachmentType, Void}
    association::Union{InstanceNetworkInterfaceAssociationType, Void}
    privateIpAddressesSet::Union{Vector{InstancePrivateIpAddressesSetItemType}, Void}

    InstanceNetworkInterfaceSetItemType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, description=nothing, ownerId=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet)
end
function InstanceNetworkInterfaceSetItemType(pd)
    o = InstanceNetworkInterfaceSetItemType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.macAddress = LightXML.content(LightXML.find_element(pd, "macAddress"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.privateDnsName = LightXML.find_element(pd, "privateDnsName") != nothing ? LightXML.content(LightXML.find_element(pd, "privateDnsName")) : nothing
    o.sourceDestCheck = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "sourceDestCheck")))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    ## o.attachment = length(pd["attachment"]) > 0 ?  InstanceNetworkInterfaceAttachmentType(LightXML.find_element(pd,"attachment[1]")) : nothing
    o.attachment = LightXML.find_element(pd,"attachment") != nothing ?  InstanceNetworkInterfaceAttachmentType(LightXML.find_element(pd,"attachment")) : nothing
    ## o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(LightXML.find_element(pd,"association[1]")) : nothing
    o.association = LightXML.find_element(pd,"association") != nothing ?  InstanceNetworkInterfaceAssociationType(LightXML.find_element(pd,"association")) : nothing
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.InstancePrivateIpAddressesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "privateIpAddressesSet"), "item"))
    o
end

export InstanceNetworkInterfaceSetItemType


type LicenseSetItemType
    licenseId::Union{String, Void}
    _type::Union{String, Void}
    pool::Union{String, Void}
    capacitySet::Union{Vector{LicenseCapacitySetItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    LicenseSetItemType(; licenseId=nothing, _type=nothing, pool=nothing, capacitySet=nothing, tagSet=nothing) =
         new(licenseId, _type, pool, capacitySet, tagSet)
end
function LicenseSetItemType(pd)
    o = LicenseSetItemType()
    o.licenseId = LightXML.content(LightXML.find_element(pd, "licenseId"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.pool = LightXML.content(LightXML.find_element(pd, "pool"))
    o.capacitySet = AWS.@parse_vector(AWS.EC2.LicenseCapacitySetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "capacitySet"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export LicenseSetItemType


type ImportVolumeTaskDetailsType
    bytesConverted::Union{Int64, Void}
    availabilityZone::Union{String, Void}
    description::Union{String, Void}
    image::Union{DiskImageDescriptionType, Void}
    volume::Union{DiskImageVolumeDescriptionType, Void}

    ImportVolumeTaskDetailsType(; bytesConverted=nothing, availabilityZone=nothing, description=nothing, image=nothing, volume=nothing) =
         new(bytesConverted, availabilityZone, description, image, volume)
end
function ImportVolumeTaskDetailsType(pd)
    o = ImportVolumeTaskDetailsType()
    o.bytesConverted = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "bytesConverted")))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    ## o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(LightXML.find_element(pd,"image[1]")) : nothing
    o.image = LightXML.find_element(pd,"image") != nothing ?  DiskImageDescriptionType(LightXML.find_element(pd,"image")) : nothing
    ## o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(LightXML.find_element(pd,"volume[1]")) : nothing
    o.volume = LightXML.find_element(pd,"volume") != nothing ?  DiskImageVolumeDescriptionType(LightXML.find_element(pd,"volume")) : nothing
    o
end

export ImportVolumeTaskDetailsType


type DescribeReservedInstancesListingsResponseType
    requestId::Union{String, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    DescribeReservedInstancesListingsResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function DescribeReservedInstancesListingsResponseType(pd)
    o = DescribeReservedInstancesListingsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservedInstancesListingsSet"), "item"))
    o
end

export DescribeReservedInstancesListingsResponseType


type RevokeSecurityGroupIngressType
    userId::Union{String, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    RevokeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) =
         new(userId, ipPermissions)
end
function RevokeSecurityGroupIngressType(pd)
    o = RevokeSecurityGroupIngressType()
    o.userId = LightXML.content(LightXML.find_element(pd, "userId"))
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissions"), "item"))
    o
end

export RevokeSecurityGroupIngressType


type StopInstancesResponseType
    requestId::Union{String, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    StopInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function StopInstancesResponseType(pd)
    o = StopInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    o
end

export StopInstancesResponseType


type ImportVolumeType
    availabilityZone::Union{String, Void}
    image::Union{DiskImageDetailType, Void}
    description::Union{String, Void}
    volume::Union{DiskImageVolumeType, Void}

    ImportVolumeType(; availabilityZone=nothing, image=nothing, description=nothing, volume=nothing) =
         new(availabilityZone, image, description, volume)
end
function ImportVolumeType(pd)
    o = ImportVolumeType()
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    ## o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(LightXML.find_element(pd,"image[1]")) : nothing
    o.image = LightXML.find_element(pd,"image") != nothing ?  DiskImageDetailType(LightXML.find_element(pd,"image")) : nothing
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    ## o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(LightXML.find_element(pd,"volume[1]")) : nothing
    o.volume = LightXML.find_element(pd,"volume") != nothing ? DiskImageVolumeType(LightXML.find_element(pd,"volume")) : nothing
    o
end

export ImportVolumeType


type VpnConnectionType
    vpnConnectionId::Union{String, Void}
    state::Union{String, Void}
    customerGatewayConfiguration::Union{String, Void}
    _type::Union{String, Void}
    customerGatewayId::Union{String, Void}
    vpnGatewayId::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    vgwTelemetry::Union{Vector{VpnTunnelTelemetryType}, Void}
    options::Union{VpnConnectionOptionsResponseType, Void}
    routes::Union{Vector{VpnStaticRouteType}, Void}

    VpnConnectionType(; vpnConnectionId=nothing, state=nothing, customerGatewayConfiguration=nothing, _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, tagSet=nothing, vgwTelemetry=nothing, options=nothing, routes=nothing) =
         new(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes)
end
function VpnConnectionType(pd)
    o = VpnConnectionType()
    o.vpnConnectionId = LightXML.content(LightXML.find_element(pd, "vpnConnectionId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.customerGatewayConfiguration = LightXML.content(LightXML.find_element(pd, "customerGatewayConfiguration"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.customerGatewayId = LightXML.content(LightXML.find_element(pd, "customerGatewayId"))
    o.vpnGatewayId = LightXML.content(LightXML.find_element(pd, "vpnGatewayId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.vgwTelemetry = AWS.@parse_vector(AWS.EC2.VpnTunnelTelemetryType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vgwTelemetry"), "item"))
    ## o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsResponseType(LightXML.find_element(pd,"options[1]")) : nothing
    o.options = LightXML.find_element(pd,"options") != nothing ? VpnConnectionOptionsResponseType(LightXML.find_element(pd,"options")) : nothing
    o.routes = AWS.@parse_vector(AWS.EC2.VpnStaticRouteType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "routes"), "item"))
    o
end

export VpnConnectionType


type DescribeInstancesType
    instancesSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeInstancesType(; instancesSet=nothing, filterSet=nothing) =
         new(instancesSet, filterSet)
end
function DescribeInstancesType(pd)
    o = DescribeInstancesType()
    o.instancesSet = AWS.parse_vector_as(String, "instanceId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeInstancesType


type DescribeImagesResponseType
    requestId::Union{String, Void}
    imagesSet::Union{Vector{DescribeImagesResponseItemType}, Void}

    DescribeImagesResponseType(; requestId=nothing, imagesSet=nothing) =
         new(requestId, imagesSet)
end
function DescribeImagesResponseType(pd)
    o = DescribeImagesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.imagesSet = AWS.@parse_vector(AWS.EC2.DescribeImagesResponseItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "imagesSet"), "item"))
    o
end

export DescribeImagesResponseType


type CustomerGatewayType
    customerGatewayId::Union{String, Void}
    state::Union{String, Void}
    _type::Union{String, Void}
    ipAddress::Union{String, Void}
    bgpAsn::Union{Int64, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    CustomerGatewayType(; customerGatewayId=nothing, state=nothing, _type=nothing, ipAddress=nothing, bgpAsn=nothing, tagSet=nothing) =
         new(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet)
end
function CustomerGatewayType(pd)
    o = CustomerGatewayType()
    o.customerGatewayId = LightXML.content(LightXML.find_element(pd, "customerGatewayId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.ipAddress = LightXML.content(LightXML.find_element(pd, "ipAddress"))
    o.bgpAsn = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "bgpAsn")))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export CustomerGatewayType


type SubnetType
    subnetId::Union{String, Void}
    state::Union{String, Void}
    vpcId::Union{String, Void}
    cidrBlock::Union{String, Void}
    availableIpAddressCount::Union{Int64, Void}
    availabilityZone::Union{String, Void}
    defaultForAz::Union{Bool, Void}
    mapPublicIpOnLaunch::Union{Bool, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    SubnetType(; subnetId=nothing, state=nothing, vpcId=nothing, cidrBlock=nothing, availableIpAddressCount=nothing, availabilityZone=nothing, defaultForAz=nothing, mapPublicIpOnLaunch=nothing, tagSet=nothing) =
         new(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet)
end
function SubnetType(pd)
    o = SubnetType()
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.cidrBlock = LightXML.content(LightXML.find_element(pd, "cidrBlock"))
    o.availableIpAddressCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "availableIpAddressCount")))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.defaultForAz = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "defaultForAz")))
    o.mapPublicIpOnLaunch = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "mapPublicIpOnLaunch")))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export SubnetType


type DescribeLicensesResponseType
    requestId::Union{String, Void}
    licenseSet::Union{Vector{LicenseSetItemType}, Void}

    DescribeLicensesResponseType(; requestId=nothing, licenseSet=nothing) =
         new(requestId, licenseSet)
end
function DescribeLicensesResponseType(pd)
    o = DescribeLicensesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.licenseSet = AWS.@parse_vector(AWS.EC2.LicenseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "licenseSet"), "item"))
    o
end

export DescribeLicensesResponseType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::Union{String, Void}
    privateDnsName::Union{String, Void}
    primary::Union{Bool, Void}
    association::Union{NetworkInterfaceAssociationType, Void}

    NetworkInterfacePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) =
         new(privateIpAddress, privateDnsName, primary, association)
end
function NetworkInterfacePrivateIpAddressesSetItemType(pd)
    o = NetworkInterfacePrivateIpAddressesSetItemType()
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.privateDnsName = LightXML.content(LightXML.find_element(pd, "privateDnsName"))
    o.primary = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "primary")))
    ## o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(LightXML.find_element(pd,"association[1]")) : nothing
    o.association = LightXML.find_element(pd,"association") != nothing ? NetworkInterfaceAssociationType(LightXML.find_element(pd,"association")) : nothing
    o
end

export NetworkInterfacePrivateIpAddressesSetItemType


type CreateVpnConnectionResponseType
    requestId::Union{String, Void}
    vpnConnection::Union{VpnConnectionType, Void}

    CreateVpnConnectionResponseType(; requestId=nothing, vpnConnection=nothing) =
         new(requestId, vpnConnection)
end
function CreateVpnConnectionResponseType(pd)
    o = CreateVpnConnectionResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.vpnConnection = length(pd["vpnConnection"]) > 0 ?  VpnConnectionType(LightXML.find_element(pd,"vpnConnection[1]")) : nothing
    o.vpnConnection = LightXML.find_element(pd,"vpnConnection") != nothing ? VpnConnectionType(LightXML.find_element(pd,"vpnConnection")) : nothing
    o
end

export CreateVpnConnectionResponseType


type DescribeTagsResponseType
    requestId::Union{String, Void}
    tagSet::Union{Vector{TagSetItemType}, Void}

    DescribeTagsResponseType(; requestId=nothing, tagSet=nothing) =
         new(requestId, tagSet)
end
function DescribeTagsResponseType(pd)
    o = DescribeTagsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.TagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export DescribeTagsResponseType


type CreateInternetGatewayResponseType
    requestId::Union{String, Void}
    internetGateway::Union{InternetGatewayType, Void}

    CreateInternetGatewayResponseType(; requestId=nothing, internetGateway=nothing) =
         new(requestId, internetGateway)
end
function CreateInternetGatewayResponseType(pd)
    o = CreateInternetGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.internetGateway = length(pd["internetGateway"]) > 0 ?  InternetGatewayType(LightXML.find_element(pd,"internetGateway[1]")) : nothing
    o.internetGateway = LightXML.find_element(pd,"internetGateway") != nothing ? InternetGatewayType(LightXML.find_element(pd,"internetGateway")) : nothing
    o
end

export CreateInternetGatewayResponseType


type AttachVpnGatewayResponseType
    requestId::Union{String, Void}
    attachment::Union{AttachmentType, Void}

    AttachVpnGatewayResponseType(; requestId=nothing, attachment=nothing) =
         new(requestId, attachment)
end
function AttachVpnGatewayResponseType(pd)
    o = AttachVpnGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.attachment = length(pd["attachment"]) > 0 ?  AttachmentType(LightXML.find_element(pd,"attachment[1]")) : nothing
    o.attachment = LightXML.find_element(pd,"attachment") != nothing ? AttachmentType(LightXML.find_element(pd,"attachment")) : nothing
    o
end

export AttachVpnGatewayResponseType


type DescribeLicensesType
    licenseIdSet::Union{Vector{String}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeLicensesType(; licenseIdSet=nothing, filterSet=nothing) =
         new(licenseIdSet, filterSet)
end
function DescribeLicensesType(pd)
    o = DescribeLicensesType()
    o.licenseIdSet = AWS.parse_vector_as(String, "licenseId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "licenseId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "filterSet"), "item"))
    o
end

export DescribeLicensesType


type AuthorizeSecurityGroupIngressType
    userId::Union{String, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    AuthorizeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) =
         new(userId, ipPermissions)
end
function AuthorizeSecurityGroupIngressType(pd)
    o = AuthorizeSecurityGroupIngressType()
    o.userId = LightXML.content(LightXML.find_element(pd, "userId"))
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissions"), "item"))
    o
end

export AuthorizeSecurityGroupIngressType


type CreateSubnetResponseType
    requestId::Union{String, Void}
    subnet::Union{SubnetType, Void}

    CreateSubnetResponseType(; requestId=nothing, subnet=nothing) =
         new(requestId, subnet)
end
function CreateSubnetResponseType(pd)
    o = CreateSubnetResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.subnet = length(pd["subnet"]) > 0 ?  SubnetType(LightXML.find_element(pd,"subnet[1]")) : nothing
    o.subnet = LightXML.find_element(pd,"subnet") != nothing ? SubnetType(LightXML.find_element(pd,"subnet")) : nothing
    o
end

export CreateSubnetResponseType


type NetworkInterfaceType
    networkInterfaceId::Union{String, Void}
    subnetId::Union{String, Void}
    vpcId::Union{String, Void}
    availabilityZone::Union{String, Void}
    description::Union{String, Void}
    ownerId::Union{String, Void}
    requesterId::Union{String, Void}
    requesterManaged::Union{Bool, Void}
    status::Union{String, Void}
    macAddress::Union{String, Void}
    privateIpAddress::Union{String, Void}
    privateDnsName::Union{String, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    attachment::Union{NetworkInterfaceAttachmentType, Void}
    association::Union{NetworkInterfaceAssociationType, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    privateIpAddressesSet::Union{Vector{NetworkInterfacePrivateIpAddressesSetItemType}, Void}

    NetworkInterfaceType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, availabilityZone=nothing, description=nothing, ownerId=nothing, requesterId=nothing, requesterManaged=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, tagSet=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet)
end
function NetworkInterfaceType(pd)
    o = NetworkInterfaceType()
    o.networkInterfaceId = LightXML.content(LightXML.find_element(pd, "networkInterfaceId"))
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.requesterId = LightXML.content(LightXML.find_element(pd, "requesterId"))
    o.requesterManaged = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "requesterManaged")))
    o.status = LightXML.content(LightXML.find_element(pd, "status"))
    o.macAddress = LightXML.content(LightXML.find_element(pd, "macAddress"))
    o.privateIpAddress = LightXML.content(LightXML.find_element(pd, "privateIpAddress"))
    o.privateDnsName = LightXML.content(LightXML.find_element(pd, "privateDnsName"))
    o.sourceDestCheck = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "sourceDestCheck")))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    ## o.attachment = length(pd["attachment"]) > 0 ?  NetworkInterfaceAttachmentType(LightXML.find_element(pd,"attachment[1]")) : nothing
    o.attachment = LightXML.find_element(pd,"attachment") != nothing ?  NetworkInterfaceAttachmentType(LightXML.find_element(pd,"attachment")) : nothing
    ## o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(LightXML.find_element(pd,"association[1]")) : nothing
    o.association = LightXML.find_element(pd,"association") != nothing ? NetworkInterfaceAssociationType(LightXML.find_element(pd,"association")) : nothing
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.NetworkInterfacePrivateIpAddressesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "privateIpAddressesSet"), "item"))
    o
end

export NetworkInterfaceType


type ImportVolumeResponseType
    requestId::Union{String, Void}
    conversionTask::Union{ConversionTaskType, Void}

    ImportVolumeResponseType(; requestId=nothing, conversionTask=nothing) =
         new(requestId, conversionTask)
end
function ImportVolumeResponseType(pd)
    o = ImportVolumeResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(LightXML.find_element(pd,"conversionTask[1]")) : nothing
    o.conversionTask = LightXML.find_element(pd,"conversionTask") != nothing ? ConversionTaskType(LightXML.find_element(pd,"conversionTask")) : nothing
    o
end

export ImportVolumeResponseType


type ModifySnapshotAttributeType
    snapshotId::Union{String, Void}
    createVolumePermission::Union{CreateVolumePermissionOperationType, Void}

    ModifySnapshotAttributeType(; snapshotId=nothing, createVolumePermission=nothing) =
         new(snapshotId, createVolumePermission)
end
function ModifySnapshotAttributeType(pd)
    o = ModifySnapshotAttributeType()
    o.snapshotId = LightXML.content(LightXML.find_element(pd, "snapshotId"))
    ## o.createVolumePermission = length(pd["createVolumePermission"]) > 0 ?  CreateVolumePermissionOperationType(LightXML.find_element(pd,"createVolumePermission[1]")) : nothing
    o.createVolumePermission = LightXML.find_element(pd,"createVolumePermission") != nothing ? CreateVolumePermissionOperationType(LightXML.find_element(pd,"createVolumePermission")) : nothing
    o
end

export ModifySnapshotAttributeType


type CreateNetworkInterfaceResponseType
    requestId::Union{String, Void}
    networkInterface::Union{NetworkInterfaceType, Void}

    CreateNetworkInterfaceResponseType(; requestId=nothing, networkInterface=nothing) =
         new(requestId, networkInterface)
end
function CreateNetworkInterfaceResponseType(pd)
    o = CreateNetworkInterfaceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.networkInterface = length(pd["networkInterface"]) > 0 ?  NetworkInterfaceType(LightXML.find_element(pd,"networkInterface[1]")) : nothing
    o.networkInterface = LightXML.find_element(pd,"networkInterface") != nothing ? NetworkInterfaceType(LightXML.find_element(pd,"networkInterface")) : nothing
    o
end

export CreateNetworkInterfaceResponseType


type CancelReservedInstancesListingResponseType
    requestId::Union{String, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    CancelReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function CancelReservedInstancesListingResponseType(pd)
    o = CancelReservedInstancesListingResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservedInstancesListingsSet"), "item"))
    o
end

export CancelReservedInstancesListingResponseType


type MonitorInstancesResponseType
    requestId::Union{String, Void}
    instancesSet::Union{Vector{MonitorInstancesResponseSetItemType}, Void}

    MonitorInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function MonitorInstancesResponseType(pd)
    o = MonitorInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.MonitorInstancesResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    o
end

export MonitorInstancesResponseType


type CreateCustomerGatewayResponseType
    requestId::Union{String, Void}
    customerGateway::Union{CustomerGatewayType, Void}

    CreateCustomerGatewayResponseType(; requestId=nothing, customerGateway=nothing) =
         new(requestId, customerGateway)
end
function CreateCustomerGatewayResponseType(pd)
    o = CreateCustomerGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.customerGateway = length(pd["customerGateway"]) > 0 ?  CustomerGatewayType(LightXML.find_element(pd,"customerGateway[1]")) : nothing
    o.customerGateway = LightXML.find_element(pd,"customerGateway") != nothing ?  CustomerGatewayType(LightXML.find_element(pd,"customerGateway")) : nothing
    o
end

export CreateCustomerGatewayResponseType


type DescribeVpnConnectionsResponseType
    requestId::Union{String, Void}
    vpnConnectionSet::Union{Vector{VpnConnectionType}, Void}

    DescribeVpnConnectionsResponseType(; requestId=nothing, vpnConnectionSet=nothing) =
         new(requestId, vpnConnectionSet)
end
function DescribeVpnConnectionsResponseType(pd)
    o = DescribeVpnConnectionsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.vpnConnectionSet = AWS.@parse_vector(AWS.EC2.VpnConnectionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vpnConnectionSet"), "item"))
    o
end

export DescribeVpnConnectionsResponseType


type RunningInstancesItemType
    instanceId::Union{String, Void}
    imageId::Union{String, Void}
    instanceState::Union{InstanceStateType, Void}
    privateDnsName::Union{String, Void}
    dnsName::Union{String, Void}
    reason::Union{String, Void}
    keyName::Union{String, Void}
    amiLaunchIndex::Union{String, Void}
    productCodes::Union{Vector{ProductCodesSetItemType}, Void}
    instanceType::Union{String, Void}
    launchTime::Union{Base.Dates.DateTime, Void}
    placement::Union{PlacementResponseType, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    platform::Union{String, Void}
    monitoring::Union{InstanceMonitoringStateType, Void}
    subnetId::Union{String, Void}
    vpcId::Union{String, Void}
    privateIpAddress::Union{String, Void}
    ipAddress::Union{String, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    stateReason::Union{StateReasonType, Void}
    architecture::Union{String, Void}
    rootDeviceType::Union{String, Void}
    rootDeviceName::Union{String, Void}
    blockDeviceMapping::Union{Vector{InstanceBlockDeviceMappingResponseItemType}, Void}
    instanceLifecycle::Union{String, Void}
    spotInstanceRequestId::Union{String, Void}
    license::Union{InstanceLicenseResponseType, Void}
    virtualizationType::Union{String, Void}
    clientToken::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    hypervisor::Union{String, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileResponseType, Void}
    ebsOptimized::Union{Bool, Void}

    RunningInstancesItemType(; instanceId=nothing, imageId=nothing, instanceState=nothing, privateDnsName=nothing, dnsName=nothing, reason=nothing, keyName=nothing, amiLaunchIndex=nothing, productCodes=nothing, instanceType=nothing, launchTime=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, monitoring=nothing, subnetId=nothing, vpcId=nothing, privateIpAddress=nothing, ipAddress=nothing, sourceDestCheck=nothing, groupSet=nothing, stateReason=nothing, architecture=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, instanceLifecycle=nothing, spotInstanceRequestId=nothing, license=nothing, virtualizationType=nothing, clientToken=nothing, tagSet=nothing, hypervisor=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunningInstancesItemType(pd)
    o = RunningInstancesItemType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    ## o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(LightXML.find_element(pd,"instanceState[1]")) : nothing
    o.instanceState = LightXML.find_element(pd,"instanceState") != nothing ?  InstanceStateType(LightXML.find_element(pd,"instanceState")) : nothing
    o.privateDnsName = LightXML.content(LightXML.find_element(pd, "privateDnsName"))
    o.dnsName = LightXML.content(LightXML.find_element(pd, "dnsName"))
    o.reason = LightXML.content(LightXML.find_element(pd, "reason"))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.amiLaunchIndex = LightXML.content(LightXML.find_element(pd, "amiLaunchIndex"))
    o.productCodes = LightXML.find_element(pd, "productCodes") != nothing ? AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "productCodes"), "item")) : nothing
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    o.launchTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "launchTime")))
    ## o.placement = length(pd["placement"]) > 0 ?  PlacementResponseType(LightXML.find_element(pd,"placement[1]")) : nothing
    o.placement = LightXML.find_element(pd,"placement") != nothing ?  PlacementResponseType(LightXML.find_element(pd,"placement")) : nothing
    
    o.ramdiskId = LightXML.find_element(pd, "ramdiskId") != nothing ?LightXML.content(LightXML.find_element(pd, "ramdiskId")) : nothing
    o.platform = LightXML.find_element(pd, "platform") != nothing ?LightXML.content(LightXML.find_element(pd, "platform")) : nothing
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ?  InstanceMonitoringStateType(LightXML.find_element(pd,"monitoring")) : nothing
    o.subnetId = LightXML.find_element(pd, "subnetId") != nothing ? LightXML.content(LightXML.find_element(pd, "subnetId")) : nothing
    o.vpcId = LightXML.find_element(pd, "vpcId") != nothing ?LightXML.content(LightXML.find_element(pd, "vpcId")) : nothing
    o.privateIpAddress = LightXML.find_element(pd, "privateIpAddress") != nothing ?LightXML.content(LightXML.find_element(pd, "privateIpAddress")) : nothing
    o.ipAddress = LightXML.find_element(pd, "ipAddress") != nothing ? LightXML.content(LightXML.find_element(pd, "ipAddress")) : nothing
    o.sourceDestCheck = LightXML.find_element(pd, "sourceDestCheck") != nothing ? AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "sourceDestCheck"))) : nothing
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    ## o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(LightXML.find_element(pd,"stateReason[1]")) : nothing
    o.stateReason = LightXML.find_element(pd,"stateReason") != nothing ?  StateReasonType(LightXML.find_element(pd,"stateReason")) : nothing
    o.architecture = LightXML.content(LightXML.find_element(pd, "architecture"))
    o.rootDeviceType = LightXML.content(LightXML.find_element(pd, "rootDeviceType"))
    
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.InstanceBlockDeviceMappingResponseItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    o.instanceLifecycle = LightXML.find_element(pd, "instanceLifecycle") != nothing ? LightXML.content(LightXML.find_element(pd, "instanceLifecycle")) : nothing
    o.spotInstanceRequestId = LightXML.find_element(pd, "spotInstanceRequestId") != nothing ? LightXML.content(LightXML.find_element(pd, "spotInstanceRequestId")) : nothing
    ## o.license = length(pd["license"]) > 0 ?  InstanceLicenseResponseType(LightXML.find_element(pd,"license[1]")) : nothing
    o.license = LightXML.find_element(pd,"license") != nothing ?  InstanceLicenseResponseType(LightXML.find_element(pd,"license")) : nothing
    o.virtualizationType = LightXML.content(LightXML.find_element(pd, "virtualizationType"))
    o.clientToken = LightXML.content(LightXML.find_element(pd, "clientToken"))
    o.tagSet = LightXML.find_element(pd, "tagSet") != nothing ? AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item")) : nothing
    o.hypervisor = LightXML.content(LightXML.find_element(pd, "hypervisor"))
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkInterfaceSet"), "item"))
    ## o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileResponseType(LightXML.find_element(pd,"iamInstanceProfile[1]")) : nothing
    o.iamInstanceProfile = LightXML.find_element(pd,"iamInstanceProfile") != nothing ?  IamInstanceProfileResponseType(LightXML.find_element(pd,"iamInstanceProfile")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "ebsOptimized")))
    o
end

export RunningInstancesItemType


type DescribeSnapshotsResponseType
    requestId::Union{String, Void}
    snapshotSet::Union{Vector{DescribeSnapshotsSetItemResponseType}, Void}

    DescribeSnapshotsResponseType(; requestId=nothing, snapshotSet=nothing) =
         new(requestId, snapshotSet)
end
function DescribeSnapshotsResponseType(pd)
    o = DescribeSnapshotsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.snapshotSet = AWS.@parse_vector(AWS.EC2.DescribeSnapshotsSetItemResponseType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "snapshotSet"), "item"))
    o
end

export DescribeSnapshotsResponseType


type CreateVpcResponseType
    requestId::Union{String, Void}
    vpc::Union{VpcType, Void}

    CreateVpcResponseType(; requestId=nothing, vpc=nothing) =
         new(requestId, vpc)
end
function CreateVpcResponseType(pd)
    o = CreateVpcResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.vpc = length(pd["vpc"]) > 0 ?  VpcType(LightXML.find_element(pd,"vpc[1]")) : nothing
    o.vpc = LightXML.find_element(pd,"vpc") != nothing ? VpcType(LightXML.find_element(pd,"vpc")) : nothing
    o
end

export CreateVpcResponseType


type ImportInstanceType
    description::Union{String, Void}
    launchSpecification::Union{ImportInstanceLaunchSpecificationType, Void}
    diskImageSet::Union{Vector{DiskImageType}, Void}
    keepPartialImports::Union{Bool, Void}
    platform::Union{String, Void}

    ImportInstanceType(; description=nothing, launchSpecification=nothing, diskImageSet=nothing, keepPartialImports=nothing, platform=nothing) =
         new(description, launchSpecification, diskImageSet, keepPartialImports, platform)
end
function ImportInstanceType(pd)
    o = ImportInstanceType()
    o.description = LightXML.content(LightXML.find_element(pd, "description"))
    ## o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  ImportInstanceLaunchSpecificationType(LightXML.find_element(pd,"launchSpecification[1]")) : nothing
    o.launchSpecification = LightXML.find_element(pd,"launchSpecification") ? ImportInstanceLaunchSpecificationType(LightXML.find_element(pd,"launchSpecification")) : nothing
    o.diskImageSet = AWS.@parse_vector(AWS.EC2.DiskImageType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "diskImageSet"), "item"))
    o.keepPartialImports = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "keepPartialImports")))
    o.platform = LightXML.content(LightXML.find_element(pd, "platform"))
    o
end

export ImportInstanceType


type BundleInstanceTaskType
    instanceId::Union{String, Void}
    bundleId::Union{String, Void}
    state::Union{String, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    updateTime::Union{Base.Dates.DateTime, Void}
    storage::Union{BundleInstanceTaskStorageType, Void}
    progress::Union{String, Void}
    error::Union{BundleInstanceTaskErrorType, Void}

    BundleInstanceTaskType(; instanceId=nothing, bundleId=nothing, state=nothing, startTime=nothing, updateTime=nothing, storage=nothing, progress=nothing, error=nothing) =
         new(instanceId, bundleId, state, startTime, updateTime, storage, progress, error)
end
function BundleInstanceTaskType(pd)
    o = BundleInstanceTaskType()
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.bundleId = LightXML.content(LightXML.find_element(pd, "bundleId"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "startTime")))
    o.updateTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "updateTime")))
    ## o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(LightXML.find_element(pd,"storage[1]")) : nothing
    o.storage = LightXML.find_element(pd,"storage") != nothing ? BundleInstanceTaskStorageType(LightXML.find_element(pd,"storage")) : nothing
    o.progress = LightXML.content(LightXML.find_element(pd, "progress"))
    ## o.error = length(pd["error"]) > 0 ?  BundleInstanceTaskErrorType(LightXML.find_element(pd,"error[1]")) : nothing
    o.error = LightXML.find_element(pd,"error") != nothing ?  BundleInstanceTaskErrorType(LightXML.find_element(pd,"error")) : nothing
    o
end

export BundleInstanceTaskType


type CancelBundleTaskResponseType
    requestId::Union{String, Void}
    bundleInstanceTask::Union{BundleInstanceTaskType, Void}

    CancelBundleTaskResponseType(; requestId=nothing, bundleInstanceTask=nothing) =
         new(requestId, bundleInstanceTask)
end
function CancelBundleTaskResponseType(pd)
    o = CancelBundleTaskResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(LightXML.find_element(pd,"bundleInstanceTask[1]")) : nothing
    o.bundleInstanceTask = LightXML.find_element(pd,"bundleInstanceTask") != nothing ? BundleInstanceTaskType(LightXML.find_element(pd,"bundleInstanceTask")) : nothing
    o
end

export CancelBundleTaskResponseType


type LaunchSpecificationResponseType
    imageId::Union{String, Void}
    keyName::Union{String, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    addressingType::Union{String, Void}
    instanceType::Union{String, Void}
    placement::Union{SpotPlacementRequestType, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{String, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    LaunchSpecificationResponseType(; imageId=nothing, keyName=nothing, groupSet=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationResponseType(pd)
    o = LaunchSpecificationResponseType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    o.addressingType = LightXML.content(LightXML.find_element(pd, "addressingType"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    ## o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(LightXML.find_element(pd,"placement[1]")) : nothing
    o.placement = LightXML.find_element(pd,"placement") != nothing ? SpotPlacementRequestType(LightXML.find_element(pd,"placement")) : nothing
    o.kernelId = LightXML.content(LightXML.find_element(pd, "kernelId"))
    o.ramdiskId = LightXML.content(LightXML.find_element(pd, "ramdiskId"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ? MonitoringInstanceType(LightXML.find_element(pd,"monitoring")) : nothing
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkInterfaceSet"), "item"))
    ## o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile[1]")) : nothing
    o.iamInstanceProfile = LightXML.find_element(pd,"iamInstanceProfile") != nothing ? IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "ebsOptimized")))
    o
end

export LaunchSpecificationResponseType


type SecurityGroupItemType
    ownerId::Union{String, Void}
    groupId::Union{String, Void}
    groupName::Union{String, Void}
    groupDescription::Union{String, Void}
    vpcId::Union{String, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}
    ipPermissionsEgress::Union{Vector{IpPermissionType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    SecurityGroupItemType(; ownerId=nothing, groupId=nothing, groupName=nothing, groupDescription=nothing, vpcId=nothing, ipPermissions=nothing, ipPermissionsEgress=nothing, tagSet=nothing) =
         new(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet)
end
function SecurityGroupItemType(pd)
    o = SecurityGroupItemType()
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.groupName = LightXML.content(LightXML.find_element(pd, "groupName"))
    o.groupDescription = LightXML.content(LightXML.find_element(pd, "groupDescription"))
    o.vpcId = LightXML.content(LightXML.find_element(pd, "vpcId"))
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissions"), "item"))
    o.ipPermissionsEgress = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissionsEgress"), "item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o
end

export SecurityGroupItemType


type CreateNetworkAclResponseType
    requestId::Union{String, Void}
    networkAcl::Union{NetworkAclType, Void}

    CreateNetworkAclResponseType(; requestId=nothing, networkAcl=nothing) =
         new(requestId, networkAcl)
end
function CreateNetworkAclResponseType(pd)
    o = CreateNetworkAclResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.networkAcl = length(pd["networkAcl"]) > 0 ?  NetworkAclType(LightXML.find_element(pd,"networkAcl[1]")) : nothing
    o.networkAcl = LightXML.find_element(pd,"networkAcl") != nothing ? NetworkAclType(LightXML.find_element(pd,"networkAcl")) : nothing
    o
end

export CreateNetworkAclResponseType


type CreateVpnGatewayResponseType
    requestId::Union{String, Void}
    vpnGateway::Union{VpnGatewayType, Void}

    CreateVpnGatewayResponseType(; requestId=nothing, vpnGateway=nothing) =
         new(requestId, vpnGateway)
end
function CreateVpnGatewayResponseType(pd)
    o = CreateVpnGatewayResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.vpnGateway = length(pd["vpnGateway"]) > 0 ?  VpnGatewayType(LightXML.find_element(pd,"vpnGateway[1]")) : nothing
    o.vpnGateway = LightXML.find_element(pd,"vpnGateway") != nothing ? VpnGatewayType(LightXML.find_element(pd,"vpnGateway")) : nothing
    o
end

export CreateVpnGatewayResponseType


type RunInstancesResponseType
    requestId::Union{String, Void}
    reservationId::Union{String, Void}
    ownerId::Union{String, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    instancesSet::Union{Vector{RunningInstancesItemType}, Void}
    requesterId::Union{String, Void}

    RunInstancesResponseType(; requestId=nothing, reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) =
         new(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function RunInstancesResponseType(pd)
    o = RunInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservationId = LightXML.content(LightXML.find_element(pd, "reservationId"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    ## MDP TODO o.requesterId = LightXML.content(LightXML.find_element(pd, "requesterId"))
    o
end

export RunInstancesResponseType


type RevokeSecurityGroupEgressType
    groupId::Union{String, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    RevokeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) =
         new(groupId, ipPermissions)
end
function RevokeSecurityGroupEgressType(pd)
    o = RevokeSecurityGroupEgressType()
    o.groupId = LightXML.content(LightXML.find_element(pd, "groupId"))
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ipPermissions"), "item"))
    o
end

export RevokeSecurityGroupEgressType


type DescribeNetworkAclsResponseType
    requestId::Union{String, Void}
    networkAclSet::Union{Vector{NetworkAclType}, Void}

    DescribeNetworkAclsResponseType(; requestId=nothing, networkAclSet=nothing) =
         new(requestId, networkAclSet)
end
function DescribeNetworkAclsResponseType(pd)
    o = DescribeNetworkAclsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.networkAclSet = AWS.@parse_vector(AWS.EC2.NetworkAclType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkAclSet"), "item"))
    o
end

export DescribeNetworkAclsResponseType


type DescribeNetworkInterfacesResponseType
    requestId::Union{String, Void}
    networkInterfaceSet::Union{Vector{NetworkInterfaceType}, Void}

    DescribeNetworkInterfacesResponseType(; requestId=nothing, networkInterfaceSet=nothing) =
         new(requestId, networkInterfaceSet)
end
function DescribeNetworkInterfacesResponseType(pd)
    o = DescribeNetworkInterfacesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.NetworkInterfaceType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkInterfaceSet"), "item"))
    o
end

export DescribeNetworkInterfacesResponseType


type DescribeReservedInstancesOfferingsResponseType
    requestId::Union{String, Void}
    reservedInstancesOfferingsSet::Union{Vector{DescribeReservedInstancesOfferingsResponseSetItemType}, Void}
    nextToken::Union{String, Void}

    DescribeReservedInstancesOfferingsResponseType(; requestId=nothing, reservedInstancesOfferingsSet=nothing, nextToken=nothing) =
         new(requestId, reservedInstancesOfferingsSet, nextToken)
end
function DescribeReservedInstancesOfferingsResponseType(pd)
    o = DescribeReservedInstancesOfferingsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservedInstancesOfferingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesOfferingsResponseSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservedInstancesOfferingsSet"), "item"))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o
end

export DescribeReservedInstancesOfferingsResponseType


type SpotInstanceRequestSetItemType
    spotInstanceRequestId::Union{String, Void}
    spotPrice::Union{String, Void}
    _type::Union{String, Void}
    state::Union{String, Void}
    fault::Union{SpotInstanceStateFaultType, Void}
    status::Union{SpotInstanceStatusMessageType, Void}
    validFrom::Union{Base.Dates.DateTime, Void}
    validUntil::Union{Base.Dates.DateTime, Void}
    launchGroup::Union{String, Void}
    availabilityZoneGroup::Union{String, Void}
    launchSpecification::Union{LaunchSpecificationResponseType, Void}
    instanceId::Union{String, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    productDescription::Union{String, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    launchedAvailabilityZone::Union{String, Void}

    SpotInstanceRequestSetItemType(; spotInstanceRequestId=nothing, spotPrice=nothing, _type=nothing, state=nothing, fault=nothing, status=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing, instanceId=nothing, createTime=nothing, productDescription=nothing, tagSet=nothing, launchedAvailabilityZone=nothing) =
         new(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone)
end
function SpotInstanceRequestSetItemType(pd)
    o = SpotInstanceRequestSetItemType()
    o.spotInstanceRequestId = LightXML.content(LightXML.find_element(pd, "spotInstanceRequestId"))
    o.spotPrice = LightXML.content(LightXML.find_element(pd, "spotPrice"))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.state = LightXML.content(LightXML.find_element(pd, "state"))
    ## o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(LightXML.find_element(pd,"fault[1]")) : nothing
    o.fault = LightXML.find_element(pd,"fault") != nothing ? SpotInstanceStateFaultType(LightXML.find_element(pd,"fault")) : nothing
    o.status = LightXML.find_element(pd,"status") != nothing ? SpotInstanceStatusMessageType(LightXML.find_element(pd,"status")) : nothing
    o.validFrom = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "validFrom")))
    o.validUntil = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "validUntil")))
    o.launchGroup = LightXML.content(LightXML.find_element(pd, "launchGroup"))
    o.availabilityZoneGroup = LightXML.content(LightXML.find_element(pd, "availabilityZoneGroup"))
    ## o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationResponseType(LightXML.find_element(pd,"launchSpecification[1]")) : nothing
    o.launchSpecification = LightXML.find_element(pd,"launchSpecification") != nothing ? LaunchSpecificationResponseType(LightXML.find_element(pd,"launchSpecification")) : nothing
    o.instanceId = LightXML.content(LightXML.find_element(pd, "instanceId"))
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "createTime")))
    o.productDescription = LightXML.content(LightXML.find_element(pd, "productDescription"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "tagSet"), "item"))
    o.launchedAvailabilityZone = LightXML.content(LightXML.find_element(pd, "launchedAvailabilityZone"))
    o
end

export SpotInstanceRequestSetItemType


type ImportInstanceResponseType
    requestId::Union{String, Void}
    conversionTask::Union{ConversionTaskType, Void}

    ImportInstanceResponseType(; requestId=nothing, conversionTask=nothing) =
         new(requestId, conversionTask)
end
function ImportInstanceResponseType(pd)
    o = ImportInstanceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(LightXML.find_element(pd,"conversionTask[1]")) : nothing
    o.conversionTask = LightXML.find_element(pd,"conversionTask") != nothing ? ConversionTaskType(LightXML.find_element(pd,"conversionTask")) : nothing
    o
end

export ImportInstanceResponseType


type VolumeStatusItemType
    volumeId::Union{String, Void}
    availabilityZone::Union{String, Void}
    volumeStatus::Union{VolumeStatusInfoType, Void}
    eventsSet::Union{Vector{VolumeStatusEventItemType}, Void}
    actionsSet::Union{Vector{VolumeStatusActionItemType}, Void}

    VolumeStatusItemType(; volumeId=nothing, availabilityZone=nothing, volumeStatus=nothing, eventsSet=nothing, actionsSet=nothing) =
         new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end
function VolumeStatusItemType(pd)
    o = VolumeStatusItemType()
    o.volumeId = LightXML.content(LightXML.find_element(pd, "volumeId"))
    o.availabilityZone = LightXML.content(LightXML.find_element(pd, "availabilityZone"))
    ## o.volumeStatus = length(pd["volumeStatus"]) > 0 ?  VolumeStatusInfoType(LightXML.find_element(pd,"volumeStatus[1]")) : nothing
    o.volumeStatus = LightXML.find_element(pd,"volumeStatus") != nothing ? VolumeStatusInfoType(LightXML.find_element(pd,"volumeStatus")) : nothing
    o.eventsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusEventItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "eventsSet"), "item"))
    o.actionsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusActionItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "actionsSet"), "item"))
    o
end

export VolumeStatusItemType


type DescribeSpotInstanceRequestsResponseType
    requestId::Union{String, Void}
    spotInstanceRequestSet::Union{Vector{SpotInstanceRequestSetItemType}, Void}

    DescribeSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function DescribeSpotInstanceRequestsResponseType(pd)
    o = DescribeSpotInstanceRequestsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "spotInstanceRequestSet"), "item"))
    o
end

export DescribeSpotInstanceRequestsResponseType


type DescribeCustomerGatewaysResponseType
    requestId::Union{String, Void}
    customerGatewaySet::Union{Vector{CustomerGatewayType}, Void}

    DescribeCustomerGatewaysResponseType(; requestId=nothing, customerGatewaySet=nothing) =
         new(requestId, customerGatewaySet)
end
function DescribeCustomerGatewaysResponseType(pd)
    o = DescribeCustomerGatewaysResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.customerGatewaySet = AWS.@parse_vector(AWS.EC2.CustomerGatewayType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "customerGatewaySet"), "item"))
    o
end

export DescribeCustomerGatewaysResponseType


type DescribeVolumeStatusResponseType
    requestId::Union{String, Void}
    volumeStatusSet::Union{Vector{VolumeStatusItemType}, Void}
    nextToken::Union{String, Void}

    DescribeVolumeStatusResponseType(; requestId=nothing, volumeStatusSet=nothing, nextToken=nothing) =
         new(requestId, volumeStatusSet, nextToken)
end
function DescribeVolumeStatusResponseType(pd)
    o = DescribeVolumeStatusResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.volumeStatusSet = AWS.@parse_vector(AWS.EC2.VolumeStatusItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "volumeStatusSet"), "item"))
    o.nextToken = LightXML.content(LightXML.find_element(pd, "nextToken"))
    o
end

export DescribeVolumeStatusResponseType


type DescribeVpnGatewaysResponseType
    requestId::Union{String, Void}
    vpnGatewaySet::Union{Vector{VpnGatewayType}, Void}

    DescribeVpnGatewaysResponseType(; requestId=nothing, vpnGatewaySet=nothing) =
         new(requestId, vpnGatewaySet)
end
function DescribeVpnGatewaysResponseType(pd)
    o = DescribeVpnGatewaysResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.vpnGatewaySet = AWS.@parse_vector(AWS.EC2.VpnGatewayType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "vpnGatewaySet"), "item"))
    o
end

export DescribeVpnGatewaysResponseType


type LaunchSpecificationRequestType
    imageId::Union{String, Void}
    keyName::Union{String, Void}
    securityGroupIdSet::Union{Vector{String}, Void}
    securityGroupSet::Union{Vector{String}, Void}
    userData::Union{UserDataType, Void}
    addressingType::Union{String, Void}
    instanceType::Union{String, Void}
    placement::Union{SpotPlacementRequestType, Void}
    kernelId::Union{String, Void}
    ramdiskId::Union{String, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{String, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    LaunchSpecificationRequestType(; imageId=nothing, keyName=nothing, securityGroupIdSet=nothing, securityGroupSet=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, keyName, securityGroupIdSet, securityGroupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationRequestType(pd)
    o = LaunchSpecificationRequestType()
    o.imageId = LightXML.content(LightXML.find_element(pd, "imageId"))
    o.keyName = LightXML.content(LightXML.find_element(pd, "keyName"))
    o.securityGroupIdSet = AWS.parse_vector_as(String, "securityGroupId", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "securityGroupId"))
    o.securityGroupSet = AWS.parse_vector_as(String, "securityGroup", LightXML.get_elements_by_tagname(LightXML.find_element(pd, "item"), "securityGroup"))
    ## o.userData = length(pd["userData"]) > 0 ?  UserDataType(LightXML.find_element(pd,"userData[1]")) : nothing
    o.userData = LightXML.find_element(pd,"userData") != nothing ? UserDataType(LightXML.find_element(pd,"userData")) : nothing
    o.addressingType = LightXML.content(LightXML.find_element(pd, "addressingType"))
    o.instanceType = LightXML.content(LightXML.find_element(pd, "instanceType"))
    ## o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(LightXML.find_element(pd,"placement[1]")) : nothing
    o.placement = LightXML.find_element(pd,"placement") != nothing ? SpotPlacementRequestType(LightXML.find_element(pd,"placement")) : nothing
    o.kernelId = LightXML.content(LightXML.find_element(pd, "kernelId"))
    o.ramdiskId = LightXML.content(LightXML.find_element(pd, "ramdiskId"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "blockDeviceMapping"), "item"))
    ## o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LightXML.find_element(pd,"monitoring[1]")) : nothing
    o.monitoring = LightXML.find_element(pd,"monitoring") != nothing ? MonitoringInstanceType(LightXML.find_element(pd,"monitoring")) : nothing
    o.subnetId = LightXML.content(LightXML.find_element(pd, "subnetId"))
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "networkInterfaceSet"), "item"))
    ## o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile[1]")) : nothing
    o.iamInstanceProfile = LightXML.find_element(pd,"iamInstanceProfile") != nothing ? IamInstanceProfileRequestType(LightXML.find_element(pd,"iamInstanceProfile")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LightXML.content(LightXML.find_element(pd, "ebsOptimized")))
    o
end

export LaunchSpecificationRequestType


type ReservationInfoType
    reservationId::Union{String, Void}
    ownerId::Union{String, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    instancesSet::Union{Vector{RunningInstancesItemType}, Void}
    requesterId::Union{String, Void}

    ReservationInfoType(; reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) =
         new(reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function ReservationInfoType(pd)
    o = ReservationInfoType()
    o.reservationId = LightXML.content(LightXML.find_element(pd, "reservationId"))
    o.ownerId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "groupSet"), "item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "instancesSet"), "item"))
    ## MDP TODO o.requesterId = LightXML.content(LightXML.find_element(pd, "requesterId"))
    o.requesterId = LightXML.content(LightXML.find_element(pd, "ownerId"))
    o
end

export ReservationInfoType


type DescribeBundleTasksResponseType
    requestId::Union{String, Void}
    bundleInstanceTasksSet::Union{Vector{BundleInstanceTaskType}, Void}

    DescribeBundleTasksResponseType(; requestId=nothing, bundleInstanceTasksSet=nothing) =
         new(requestId, bundleInstanceTasksSet)
end
function DescribeBundleTasksResponseType(pd)
    o = DescribeBundleTasksResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.bundleInstanceTasksSet = AWS.@parse_vector(AWS.EC2.BundleInstanceTaskType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "bundleInstanceTasksSet"), "item"))
    o
end

export DescribeBundleTasksResponseType


type CreateRouteTableResponseType
    requestId::Union{String, Void}
    routeTable::Union{RouteTableType, Void}

    CreateRouteTableResponseType(; requestId=nothing, routeTable=nothing) =
         new(requestId, routeTable)
end
function CreateRouteTableResponseType(pd)
    o = CreateRouteTableResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.routeTable = length(pd["routeTable"]) > 0 ?  RouteTableType(LightXML.find_element(pd,"routeTable[1]")) : nothing
    o.routeTable = LightXML.find_element(pd,"routeTable") != nothing ? RouteTableType(LightXML.find_element(pd,"routeTable")) : nothing
    o
end

export CreateRouteTableResponseType


type RequestSpotInstancesResponseType
    requestId::Union{String, Void}
    spotInstanceRequestSet::Union{Vector{SpotInstanceRequestSetItemType}, Void}

    RequestSpotInstancesResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function RequestSpotInstancesResponseType(pd)
    o = RequestSpotInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "spotInstanceRequestSet"), "item"))
    o
end

export RequestSpotInstancesResponseType


type DescribeSubnetsResponseType
    requestId::Union{String, Void}
    subnetSet::Union{Vector{SubnetType}, Void}

    DescribeSubnetsResponseType(; requestId=nothing, subnetSet=nothing) =
         new(requestId, subnetSet)
end
function DescribeSubnetsResponseType(pd)
    o = DescribeSubnetsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.subnetSet = AWS.@parse_vector(AWS.EC2.SubnetType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "subnetSet"), "item"))
    o
end

export DescribeSubnetsResponseType


type RequestSpotInstancesType
    spotPrice::Union{String, Void}
    instanceCount::Union{Int64, Void}
    _type::Union{String, Void}
    validFrom::Union{Base.Dates.DateTime, Void}
    validUntil::Union{Base.Dates.DateTime, Void}
    launchGroup::Union{String, Void}
    availabilityZoneGroup::Union{String, Void}
    launchSpecification::Union{LaunchSpecificationRequestType, Void}

    RequestSpotInstancesType(; spotPrice=nothing, instanceCount=nothing, _type=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing) =
         new(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification)
end
function RequestSpotInstancesType(pd)
    o = RequestSpotInstancesType()
    o.spotPrice = LightXML.content(LightXML.find_element(pd, "spotPrice"))
    o.instanceCount = AWS.safe_parse_as(Int64, LightXML.content(LightXML.find_element(pd, "instanceCount")))
    o._type = LightXML.content(LightXML.find_element(pd, "type"))
    o.validFrom = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "validFrom")))
    o.validUntil = AWS.safe_parse_as(Base.Dates.DateTime, LightXML.content(LightXML.find_element(pd, "validUntil")))
    o.launchGroup = LightXML.content(LightXML.find_element(pd, "launchGroup"))
    o.availabilityZoneGroup = LightXML.content(LightXML.find_element(pd, "availabilityZoneGroup"))
    ## o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationRequestType(LightXML.find_element(pd,"launchSpecification[1]")) : nothing
    o.launchSpecification = LightXML.find_element(pd,"launchSpecification") != nothing ? LaunchSpecificationRequestType(LightXML.find_element(pd,"launchSpecification")) : nothing
    o
end

export RequestSpotInstancesType


type BundleInstanceResponseType
    requestId::Union{String, Void}
    bundleInstanceTask::Union{BundleInstanceTaskType, Void}

    BundleInstanceResponseType(; requestId=nothing, bundleInstanceTask=nothing) =
         new(requestId, bundleInstanceTask)
end
function BundleInstanceResponseType(pd)
    o = BundleInstanceResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    ## o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(LightXML.find_element(pd,"bundleInstanceTask[1]")) : nothing
    o.bundleInstanceTask = LightXML.find_element(pd,"bundleInstanceTask") != nothing ? BundleInstanceTaskType(LightXML.find_element(pd,"bundleInstanceTask")) : nothing
    o
end

export BundleInstanceResponseType


type DescribeInstancesResponseType
    requestId::Union{String, Void}
    reservationSet::Union{Vector{ReservationInfoType}, Void}

    DescribeInstancesResponseType(; requestId=nothing, reservationSet=nothing) =
         new(requestId, reservationSet)
end
function DescribeInstancesResponseType(pd)
    o = DescribeInstancesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.reservationSet = LightXML.find_element(pd, "reservationSet") != nothing ? AWS.@parse_vector(AWS.EC2.ReservationInfoType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "reservationSet"), "item")) : nothing
    o
end

export DescribeInstancesResponseType


type DescribeSecurityGroupsResponseType
    requestId::Union{String, Void}
    securityGroupInfo::Union{Vector{SecurityGroupItemType}, Void}

    DescribeSecurityGroupsResponseType(; requestId=nothing, securityGroupInfo=nothing) =
         new(requestId, securityGroupInfo)
end
function DescribeSecurityGroupsResponseType(pd)
    o = DescribeSecurityGroupsResponseType()
    o.requestId = LightXML.content(LightXML.find_element(pd, "requestId"))
    o.securityGroupInfo = AWS.@parse_vector(AWS.EC2.SecurityGroupItemType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "securityGroupInfo"), "item"))
    o
end

export DescribeSecurityGroupsResponseType


