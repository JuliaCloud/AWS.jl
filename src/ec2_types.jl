type CreateImageResponseType
    requestId::Union{ASCIIString, Void}
    imageId::Union{ASCIIString, Void}

    CreateImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function CreateImageResponseType(pd::ETree)
    o = CreateImageResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export CreateImageResponseType


type RegisterImageResponseType
    requestId::Union{ASCIIString, Void}
    imageId::Union{ASCIIString, Void}

    RegisterImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function RegisterImageResponseType(pd::ETree)
    o = RegisterImageResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export RegisterImageResponseType


type DeregisterImageType
    imageId::Union{ASCIIString, Void}

    DeregisterImageType(; imageId=nothing) =
         new(imageId)
end
function DeregisterImageType(pd::ETree)
    o = DeregisterImageType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export DeregisterImageType


type DeregisterImageResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeregisterImageResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeregisterImageResponseType(pd::ETree)
    o = DeregisterImageResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeregisterImageResponseType


type CreateKeyPairType
    keyName::Union{ASCIIString, Void}

    CreateKeyPairType(; keyName=nothing) =
         new(keyName)
end
function CreateKeyPairType(pd::ETree)
    o = CreateKeyPairType()
    o.keyName = LibExpat.find(pd, "keyName#string")
    o
end

export CreateKeyPairType


type CreateKeyPairResponseType
    requestId::Union{ASCIIString, Void}
    keyName::Union{ASCIIString, Void}
    keyFingerprint::Union{ASCIIString, Void}
    keyMaterial::Union{ASCIIString, Void}

    CreateKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing, keyMaterial=nothing) =
         new(requestId, keyName, keyFingerprint, keyMaterial)
end
function CreateKeyPairResponseType(pd::ETree)
    o = CreateKeyPairResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.keyFingerprint = LibExpat.find(pd, "keyFingerprint#string")
    o.keyMaterial = LibExpat.find(pd, "keyMaterial#string")
    o
end

export CreateKeyPairResponseType


type ImportKeyPairType
    keyName::Union{ASCIIString, Void}
    publicKeyMaterial::Union{ASCIIString, Void}

    ImportKeyPairType(; keyName=nothing, publicKeyMaterial=nothing) =
         new(keyName, publicKeyMaterial)
end
function ImportKeyPairType(pd::ETree)
    o = ImportKeyPairType()
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.publicKeyMaterial = LibExpat.find(pd, "publicKeyMaterial#string")
    o
end

export ImportKeyPairType


type ImportKeyPairResponseType
    requestId::Union{ASCIIString, Void}
    keyName::Union{ASCIIString, Void}
    keyFingerprint::Union{ASCIIString, Void}

    ImportKeyPairResponseType(; requestId=nothing, keyName=nothing, keyFingerprint=nothing) =
         new(requestId, keyName, keyFingerprint)
end
function ImportKeyPairResponseType(pd::ETree)
    o = ImportKeyPairResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.keyFingerprint = LibExpat.find(pd, "keyFingerprint#string")
    o
end

export ImportKeyPairResponseType


type DeleteKeyPairType
    keyName::Union{ASCIIString, Void}

    DeleteKeyPairType(; keyName=nothing) =
         new(keyName)
end
function DeleteKeyPairType(pd::ETree)
    o = DeleteKeyPairType()
    o.keyName = LibExpat.find(pd, "keyName#string")
    o
end

export DeleteKeyPairType


type DeleteKeyPairResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteKeyPairResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteKeyPairResponseType(pd::ETree)
    o = DeleteKeyPairResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteKeyPairResponseType


type DescribeKeyPairsItemType
    keyName::Union{ASCIIString, Void}

    DescribeKeyPairsItemType(; keyName=nothing) =
         new(keyName)
end
function DescribeKeyPairsItemType(pd::ETree)
    o = DescribeKeyPairsItemType()
    o.keyName = LibExpat.find(pd, "keyName#string")
    o
end

export DescribeKeyPairsItemType


type DescribeKeyPairsResponseItemType
    keyName::Union{ASCIIString, Void}
    keyFingerprint::Union{ASCIIString, Void}

    DescribeKeyPairsResponseItemType(; keyName=nothing, keyFingerprint=nothing) =
         new(keyName, keyFingerprint)
end
function DescribeKeyPairsResponseItemType(pd::ETree)
    o = DescribeKeyPairsResponseItemType()
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.keyFingerprint = LibExpat.find(pd, "keyFingerprint#string")
    o
end

export DescribeKeyPairsResponseItemType


type IamInstanceProfileRequestType
    arn::Union{ASCIIString, Void}
    name::Union{ASCIIString, Void}

    IamInstanceProfileRequestType(; arn=nothing, name=nothing) =
         new(arn, name)
end
function IamInstanceProfileRequestType(pd::ETree)
    o = IamInstanceProfileRequestType()
    o.arn = LibExpat.find(pd, "arn#string")
    o.name = LibExpat.find(pd, "name#string")
    o
end

export IamInstanceProfileRequestType


type PrivateIpAddressesSetItemRequestType
    privateIpAddress::Union{ASCIIString, Void}
    primary::Union{Bool, Void}

    PrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing, primary=nothing) =
         new(privateIpAddress, primary)
end
function PrivateIpAddressesSetItemRequestType(pd::ETree)
    o = PrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.primary = AWS.safe_parse_as(Bool, LibExpat.find(pd, "primary#string"))
    o
end

export PrivateIpAddressesSetItemRequestType


type ImportInstanceGroupItemType
    groupId::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    ImportInstanceGroupItemType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function ImportInstanceGroupItemType(pd::ETree)
    o = ImportInstanceGroupItemType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export ImportInstanceGroupItemType


type GroupItemType
    groupId::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    GroupItemType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function GroupItemType(pd::ETree)
    o = GroupItemType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export GroupItemType


type UserDataType
    data::Union{ASCIIString, Void}

    UserDataType(; data=nothing) =
         new(data)
end
function UserDataType(pd::ETree)
    o = UserDataType()
    o.data = LibExpat.find(pd, "data#string")
    o
end

export UserDataType


type BlockDeviceMappingItemType
    deviceName::Union{ASCIIString, Void}

    BlockDeviceMappingItemType(; deviceName=nothing) =
         new(deviceName)
end
function BlockDeviceMappingItemType(pd::ETree)
    o = BlockDeviceMappingItemType()
    o.deviceName = LibExpat.find(pd, "deviceName#string")
    o
end

export BlockDeviceMappingItemType


type EbsBlockDeviceType
    snapshotId::Union{ASCIIString, Void}
    volumeSize::Union{Int64, Void}
    deleteOnTermination::Union{Bool, Void}
    volumeType::Union{ASCIIString, Void}
    iops::Union{Int64, Void}

    EbsBlockDeviceType(; snapshotId=nothing, volumeSize=nothing, deleteOnTermination=nothing, volumeType=nothing, iops=nothing) =
         new(snapshotId, volumeSize, deleteOnTermination, volumeType, iops)
end
function EbsBlockDeviceType(pd::ETree)
    o = EbsBlockDeviceType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.volumeSize = AWS.safe_parse_as(Int64, LibExpat.find(pd, "volumeSize#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o.volumeType = LibExpat.find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, LibExpat.find(pd, "iops#string"))
    o
end

export EbsBlockDeviceType


type PlacementRequestType
    availabilityZone::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}
    tenancy::Union{ASCIIString, Void}

    PlacementRequestType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) =
         new(availabilityZone, groupName, tenancy)
end
function PlacementRequestType(pd::ETree)
    o = PlacementRequestType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.tenancy = LibExpat.find(pd, "tenancy#string")
    o
end

export PlacementRequestType


type SpotPlacementRequestType
    availabilityZone::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    SpotPlacementRequestType(; availabilityZone=nothing, groupName=nothing) =
         new(availabilityZone, groupName)
end
function SpotPlacementRequestType(pd::ETree)
    o = SpotPlacementRequestType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export SpotPlacementRequestType


type InstancePlacementType
    availabilityZone::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    InstancePlacementType(; availabilityZone=nothing, groupName=nothing) =
         new(availabilityZone, groupName)
end
function InstancePlacementType(pd::ETree)
    o = InstancePlacementType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export InstancePlacementType


type MonitoringInstanceType
    enabled::Union{Bool, Void}

    MonitoringInstanceType(; enabled=nothing) =
         new(enabled)
end
function MonitoringInstanceType(pd::ETree)
    o = MonitoringInstanceType()
    o.enabled = AWS.safe_parse_as(Bool, LibExpat.find(pd, "enabled#string"))
    o
end

export MonitoringInstanceType


type InstanceLicenseRequestType
    pool::Union{ASCIIString, Void}

    InstanceLicenseRequestType(; pool=nothing) =
         new(pool)
end
function InstanceLicenseRequestType(pd::ETree)
    o = InstanceLicenseRequestType()
    o.pool = LibExpat.find(pd, "pool#string")
    o
end

export InstanceLicenseRequestType


type IamInstanceProfileResponseType
    arn::Union{ASCIIString, Void}
    id::Union{ASCIIString, Void}

    IamInstanceProfileResponseType(; arn=nothing, id=nothing) =
         new(arn, id)
end
function IamInstanceProfileResponseType(pd::ETree)
    o = IamInstanceProfileResponseType()
    o.arn = LibExpat.find(pd, "arn#string")
    o.id = LibExpat.find(pd, "id#string")
    o
end

export IamInstanceProfileResponseType


type InstanceNetworkInterfaceAttachmentType
    attachmentId::Union{ASCIIString, Void}
    deviceIndex::Union{Int64, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    InstanceNetworkInterfaceAttachmentType(; attachmentId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(attachmentId, deviceIndex, status, attachTime, deleteOnTermination)
end
function InstanceNetworkInterfaceAttachmentType(pd::ETree)
    o = InstanceNetworkInterfaceAttachmentType()
    o.attachmentId = LibExpat.find(pd, "attachmentId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, LibExpat.find(pd, "deviceIndex#string"))
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export InstanceNetworkInterfaceAttachmentType


type InstanceNetworkInterfaceAssociationType
    publicIp::Union{ASCIIString, Void}
    publicDnsName::Union{ASCIIString, Void}
    ipOwnerId::Union{ASCIIString, Void}

    InstanceNetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing) =
         new(publicIp, publicDnsName, ipOwnerId)
end
function InstanceNetworkInterfaceAssociationType(pd::ETree)
    o = InstanceNetworkInterfaceAssociationType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.publicDnsName = LibExpat.find(pd, "publicDnsName#string")
    o.ipOwnerId = LibExpat.find(pd, "ipOwnerId#string")
    o
end

export InstanceNetworkInterfaceAssociationType


type PlacementResponseType
    availabilityZone::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}
    tenancy::Union{ASCIIString, Void}

    PlacementResponseType(; availabilityZone=nothing, groupName=nothing, tenancy=nothing) =
         new(availabilityZone, groupName, tenancy)
end
function PlacementResponseType(pd::ETree)
    o = PlacementResponseType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.tenancy = LibExpat.find(pd, "tenancy#string")
    o
end

export PlacementResponseType


type StateReasonType
    code::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}

    StateReasonType(; code=nothing, message=nothing) =
         new(code, message)
end
function StateReasonType(pd::ETree)
    o = StateReasonType()
    o.code = LibExpat.find(pd, "code#string")
    o.message = LibExpat.find(pd, "message#string")
    o
end

export StateReasonType


type InstanceBlockDeviceMappingResponseItemType
    deviceName::Union{ASCIIString, Void}

    InstanceBlockDeviceMappingResponseItemType(; deviceName=nothing) =
         new(deviceName)
end
function InstanceBlockDeviceMappingResponseItemType(pd::ETree)
    o = InstanceBlockDeviceMappingResponseItemType()
    o.deviceName = LibExpat.find(pd, "deviceName#string")
    o
end

export InstanceBlockDeviceMappingResponseItemType


type EbsInstanceBlockDeviceMappingResponseType
    volumeId::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    EbsInstanceBlockDeviceMappingResponseType(; volumeId=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(volumeId, status, attachTime, deleteOnTermination)
end
function EbsInstanceBlockDeviceMappingResponseType(pd::ETree)
    o = EbsInstanceBlockDeviceMappingResponseType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export EbsInstanceBlockDeviceMappingResponseType


type InstanceLicenseResponseType
    pool::Union{ASCIIString, Void}

    InstanceLicenseResponseType(; pool=nothing) =
         new(pool)
end
function InstanceLicenseResponseType(pd::ETree)
    o = InstanceLicenseResponseType()
    o.pool = LibExpat.find(pd, "pool#string")
    o
end

export InstanceLicenseResponseType


type AccountAttributeNameSetItemType
    attributeName::Union{ASCIIString, Void}

    AccountAttributeNameSetItemType(; attributeName=nothing) =
         new(attributeName)
end
function AccountAttributeNameSetItemType(pd::ETree)
    o = AccountAttributeNameSetItemType()
    o.attributeName = LibExpat.find(pd, "attributeName#string")
    o
end

export AccountAttributeNameSetItemType


type AccountAttributeSetItemType
    attributeName::Union{ASCIIString, Void}
    attributeValueSet::Union{Vector{ASCIIString}, Void}

    AccountAttributeSetItemType(; attributeName=nothing, attributeValueSet=nothing) =
         new(attributeName, attributeValueSet)
end
function AccountAttributeSetItemType(pd::ETree)
    o = AccountAttributeSetItemType()
    o.attributeName = LibExpat.find(pd, "attributeName#string")
    o.attributeValueSet = AWS.parse_vector_as(ASCIIString, "attributeValue", LibExpat.find(pd, "item/attributeValue"))
    o
end

export AccountAttributeSetItemType


type AccountAttributeValueSetItemType
    attributeValue::Union{ASCIIString, Void}

    AccountAttributeValueSetItemType(; attributeValue=nothing) =
         new(attributeValue)
end
function AccountAttributeValueSetItemType(pd::ETree)
    o = AccountAttributeValueSetItemType()
    o.attributeValue = LibExpat.find(pd, "attributeValue#string")
    o
end

export AccountAttributeValueSetItemType


type DescribeVpcAttributeType
    vpcId::Union{ASCIIString, Void}

    DescribeVpcAttributeType(; vpcId=nothing) =
         new(vpcId)
end
function DescribeVpcAttributeType(pd::ETree)
    o = DescribeVpcAttributeType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export DescribeVpcAttributeType


type DescribeVpcAttributeResponseType
    requestId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    DescribeVpcAttributeResponseType(; requestId=nothing, vpcId=nothing) =
         new(requestId, vpcId)
end
function DescribeVpcAttributeResponseType(pd::ETree)
    o = DescribeVpcAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export DescribeVpcAttributeResponseType


type ModifyVpcAttributeType
    vpcId::Union{ASCIIString, Void}

    ModifyVpcAttributeType(; vpcId=nothing) =
         new(vpcId)
end
function ModifyVpcAttributeType(pd::ETree)
    o = ModifyVpcAttributeType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export ModifyVpcAttributeType


type ModifyVpcAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifyVpcAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyVpcAttributeResponseType(pd::ETree)
    o = ModifyVpcAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifyVpcAttributeResponseType


type VpcPeeringConnectionVpcInfoType
  ownerId::Union{ASCIIString, Void}
  vpcId::Union{ASCIIString, Void}
  cidrBlock::Union{ASCIIString, Void}

  VpcPeeringConnectionVpcInfoType(; ownerId=nothing, vpcId=nothing, cidrBlock=nothing) = new(ownerId, vpcId, cidrBlock)
end
function VpcPeeringConnectionVpcInfoType(pd::ETree)
  o = VpcPeeringConnectionVpcInfoType()
  o.ownerId = LibExpat.find(pd, "ownerId#string")
  o.vpcId = LibExpat.find(pd, "vpcId#string")
  o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
  o
end

export VpcPeeringConnectionVpcInfoType


type VpcPeeringConnectionStateReasonType
  code::Union{ASCIIString, Void}
  message::Union{ASCIIString, Void}

  VpcPeeringConnectionStateReasonType(; code=nothing, message=nothing) = new(code, message)
end
function VpcPeeringConnectionStateReasonType(pd::ETree)
  o = VpcPeeringConnectionStateReasonType()
  o.code = LibExpat.find(pd, "code#string")
  o.message = LibExpat.find(pd, "message#string")
  o
end

export VpcPeeringConnectionStateReasonType


type ResourceTagSetItemType
    key::Union{ASCIIString, Void}
    value::Union{ASCIIString, Void}

    ResourceTagSetItemType(; key=nothing, value=nothing) =
         new(key, value)
end
function ResourceTagSetItemType(pd::ETree)
    o = ResourceTagSetItemType()
    o.key = LibExpat.find(pd, "key#string")
    o.value = LibExpat.find(pd, "value#string")
    o
end

export ResourceTagSetItemType


type VpcPeeringConnectionType
  vpcPeeringConnectionId::Union{ASCIIString, Void}
  requesterVpcInfo::Union{Vector{VpcPeeringConnectionVpcInfoType}, Void}
  accepterVpcInfo::Union{Vector{VpcPeeringConnectionVpcInfoType}, Void}
  status::Union{Vector{VpcPeeringConnectionStateReasonType}, Void}
  expirationTime::Union{Base.Dates.DateTime, Void}
  tagSet::Union{Vector{ResourceTagSetItemType}, Void}

  VpcPeeringConnectionType(; vpcPeeringConnectionId=nothing, requesterVpcInfo=nothing, accepterVpcInfo=nothing, status=nothing,
                           expirationTime=nothing, tagSet=nothing) = new(vpcPeeringConnectionId, requesterVpcInfo,
                                                                         accepterVpcInfo, status, expirationTime, tagSet)
end
function VpcPeeringConnectionType(pd::ETree)
  o = VpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LibExpat.find(pd, "vpcPeeringConnectionId#string")
  o.requesterVpcInfo = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionVpcInfoType, LibExpat.find(pd, "requesterVpcInfo"))
  o.accepterVpcInfo = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionVpcInfoType, LibExpat.find(pd, "accepterVpcInfo"))
  o.status = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionStateReasonType, LibExpat.find(pd, "status"))
  o.expirationTime = AWS.safe_parse_as(DateTime, LibExpat.find(pd, "expirationTime#string"))
  o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
  o
end

export VpcPeeringConnectionType


type AcceptVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{ASCIIString, Void}

  AcceptVpcPeeringConnectionType(; vpcPeeringConnectionId=nothing) = new(vpcPeeringConnectionId)
end
function AcceptVpcPeeringConnectionType(pd::ETree)
  o = AcceptVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LibExpat.find(pd, "vpcPeeringConnectionId#string")
  o
end

export AcceptVpcPeeringConnectionType


type AcceptVpcPeeringConnectionResponseType
  requestID::Union{ASCIIString, Void}
  vpcPeeringConnection::Union{Vector{VpcPeeringConnectionType}, Void}

  AcceptVpcPeeringConnectionResponseType(; requestId=nothing, vpcPeeringConnection=nothing) = new(requestId, vpcPeeringConnection)
end
function AcceptVpcPeeringConnectionResponseType(pd::ETree)
  o = AcceptVPcPeeringConnectionResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.vpcPeeringConnection = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LibExpat.find(pd, "vpcPeeringConnection"))
  o
end

export AcceptVpcPeeringConnectionResponseType


type CreateVpcEndpointType
  clientToken::Union{ASCIIString, Void}
  policyDocument::Union{ASCIIString, Void}
  routeTableIdSet::Union{Vector{ASCIIString}, Void}
  serviceName::Union{ASCIIString, Void}
  vpcId::Union{ASCIIString, Void}

  CreateVpcEndpointType(; clientToken=nothing, policyDocument=nothing, routeTableIdSet=nothing, serviceName=nothing,
                        vpcId=nothing) = new(clientToken, policyDocument, routeTableId, serviceName, vpcId)
end
function CreateVpcEndpointType(pd::ETree)
  o = CreateVpcEndpointType()
  clientToken = LibExpat.find(pd, "clientToken#string")
  policyDocument = LibExpat.find(pd, "policyDocument#string")
  routeTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", LibExpat.find(pd, "item/routeTableId"))
  serviceName = LibExpat.find(pd, "serviceName#string")
  vpcId = LibExpat.find(pd, "vpcId#string")
  o
end

export CreateVpcEndpointType


type VpcEndpointType
  creationTimestamp::Union{Base.Dates.DateTime, Void}
  policyDocument::Union{ASCIIString, Void}
  routeTableIdSet::Union{Vector{ASCIIString}, Void}
  serviceName::Union{ASCIIString, Void}
  state::Union{ASCIIString, Void}
  vpcEndpointId::Union{ASCIIString, Void}
  vpcId::Union{ASCIIString, Void}

  VpcEndpointType(; creationTimestamp=nothing, policyDocument=nothing, routeTableIdSet=nothing, serviceName=nothing,
              state=nothing, vpcEndpointId=nothing, vpcId=nothing) = new(creationTimestamp, policyDocument,
                                                                         routeTableIdSet, serviceName, state, vpcEndpointId, vpcId)
end
function VpcEndpointType(pd::ETree)
  o = VpcEndpointType()
  o.creationTimestamp = AWS.safe_parse_as(DateTime, LibExpat.find(pd, "creationTimestamp#string"))
  o.policyDocument = LibExpat.find(pd, "policyDocument#string")
  o.routeTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", LibExpat.find(pd, "item/routeTableId"))
  o.serviceName = LibExpat.find(pd, "serviceName#string")
  o.state = LibExpat.find(pd, "state#string")
  o.vpcEndpointId = LibExpat.find(pd, "vpcEndpointId#string")
  o.vpcId = LibExpat.find(pd, "vpdId#string")
  o
end

export VpcEndpointType


type CreateVpcEndpointResponseType
  clientToken::Union{ASCIIString, Void}
  requestId::Union{ASCIIString, Void}
  vpcEndpoint::Union{Vector{VpcEndpointType}, Void}

  CreateVpcEndpointResponseType(; clientToken=nothing, requestId=nothing, vpcEndpoint=nothing) =
    new(clientToken, requestId, vpcEndpoint)
end
function CreateVpcEndpointResponseType(pd::ETree)
  o = CreateVpcEndpointResponseType()
  o.clientToken = LibExpat.find(pd, "clientToken#string")
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.vpcEndpoint = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LibExpat.find(pd, "vpcEndpoint"))
  o
end

export CreateVpcEndpointResponseType


type CreateVpcPeeringConnectionType
  vpcId::Union{ASCIIString, Void}
  peerVpcId::Union{ASCIIString, Void}
  peerOwnerId::Union{ASCIIString, Void}

  CreateVpcPeeringConnectionType(; vpcId=nothing, peerVpcId=nothing, peerOwnerId=nothing) =
    new(vpcId, peerVpcId, peerOwnerId)
end
function CreateVpcPeeringConnectionType(pd::ETree)
  o = CreateVpcPeeringConnectionType()
  o.vpcId = LibExpat.find(pd, "vpcId#string")
  o.peerVpcId = LibExpat.find(pd, "peerVpcId#string")
  o.peerOwnerId = LibExpat.find(pd, "peerOwnerId#string")
  o
end

export CreateVpcPeeringConnectionType


type CreateVpcPeeringConnectionResponseType
  requestId::Union{ASCIIString, Void}
  vpcPeeringConnection::Union{Vector{VpcPeeringConnectionType}, Void}

  CreateVpcPeeringConnectionResponseType(; requestId=nothing, vpcPeeringConnection=nothing) =
    new(requestId, vpcPeeringConnection)
end
function CreateVpcPeeringConnectionResponseType(pd::ETree)
  o = CreateVpcPeeringConnectionResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.vpcPeeringConnection = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LibExpat.find(pd, "vpcPeeringConnection"))
  o
end

export CreateVpcPeeringConnectionResponseType


type DeleteVpcEndpointsType
  vpcEndpointIdSet::Union{Vector{ASCIIString}, Void}

  DeleteVpcEndpointsType(; vpcEndpointIdSet=nothing) = new(vpcEndpointIdSet)
end
function DeleteVpcEndpointsType(pd::ETree)
  o = DeleteVpcEndpointsType()
  o.vpcEndpointIdSet = AWS.parse_vector_as(ASCIIString, "vpcEndpointId", LibExpat.find(pd, "item/vpcEndpointId"))
end

export DeleteVpcEndpointsType


type UnsuccessfulItemErrorType
  code::Union{ASCIIString, Void}
  message::Union{ASCIIString, Void}

  UnsuccessfulItemErrorType(; code=nothing, message=nothing) = new(code, message)
end
function UnsuccessfulItemErrorType(pd::ETree)
  o = UnsuccessfulItemErrorType()
  o.code = LibExpat.find(pd, "code#string")
  o.message = LibExpat.find(pd, "message#string")
  o
end

export UnsuccessfulItemErrorType


type UnsuccessfulItemType
  error::Union{Vector{UnsuccessfulItemErrorType}, Void}
  resourceId::Union{ASCIIString, Void}

  UnsuccessfulItemType(; error=nothing, resourceId=nothing) = new(error, resourceId)
end
function UnsuccessfulItemType(pd::ETree)
  o = UnsuccessfulItemType()
  o.error = AWS.@parse_vector(AWS.EC2.UnsuccessfulItemErrorType, LibExpat.find(pd, "error"))
  o.resourceId = LibExpat.find(pd, "resourceId#string")
  o
end

export UnsuccessfulItemType


type DeleteVpcEndpointsResponseType
  requestId::Union{ASCIIString, Void}
  unsuccessful::Union{Vector{UnsuccessfulItemType}, Void}

  DeleteVpcEndpointsResponseType(; requestId=nothing, unsucessful=nothing) = new(requestId, unsuccessful)
end
function DeleteVpcEndpointsResponseType(pd::ETree)
  o = DeleteVpcEndpointsResponseType()
  o.requestId = LibExpat.find("requestId#string")
  o.unsuccessful = AWS.@parse_vector(AWS.EC2.UnsuccessfulItemType, LibExpat.find(pd, "unsuccessful"))
end

export DeleteVpcEndpointsResponseType


type VpcEndpointIdSetItemType
    vpcEndpointId::Union{ASCIIString, Void}

    VpcEndpointIdSetItemType(; vpcEndpointId=nothing) =
         new(vpcEndpointId)
end
function VpcEndpointIdSetItemType(pd::ETree)
    o = VpcEndpointIdSetItemType()
    o.vpcEndpointId = LibExpat.find(pd, "vpcEndpointId#string")
    o
end

export VpcEndpointIdSetItemType


type DeleteVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{ASCIIString, Void}

  DeleteVpcPeeringConnectionType(; vpcPeeringConnectionID=nothing) = new(vpcPeeringConnectionId)
end
function DeleteVpcPeeringConnectionType(pd::ETree)
  o = DeleteVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LibExpat.find(pd, "vpcPeeringConnectionId#string")
  o
end

export DeleteVpcPeeringConnectionType


type DeleteVpcPeeringConnectionResponseType
  requestId::Union{ASCIIString, Void}
  _return::Union{Bool, Void}

  DeleteVpcPeeringConnectionResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function DeleteVpcPeeringConnectionResponseType(pd::ETree)
  o = DeleteVpcPeeringConnectionResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
  o
end

export DeleteVpcPeeringConnectionResponseType


type FilterType
    name::Union{ASCIIString, Void}
    valueSet::Union{Vector{ASCIIString}, Void}

    FilterType(; name=nothing, valueSet=nothing) =
         new(name, valueSet)
end
function FilterType(pd::ETree)
    o = FilterType()
    o.name = LibExpat.find(pd, "name#string")
    o.valueSet = AWS.parse_vector_as(ASCIIString, "value", LibExpat.find(pd, "item/value"))
    o
end

export FilterType


type DescribePrefixListsType
  filterSet::Union{Vector{FilterType}, Void}
  maxResults::Union{Int64, Void}
  nextToken::Union{ASCIIString, Void}
  prefixListIdSet::Union{Vector{ASCIIString}, Void}

  DescribePrefixListsType(; filterSet=nothing, maxResults=nothing, nextToken=nothing, prefixListIdSet=nothing) =
    new(filterSet, maxResults, nextToken, prefixListIdSet)
end
function DescribePrefixListsType(pd::ETree)
  o = DescribePrefixListsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
  o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o.prefixListIdSet = AWS.parse_vector_as(ASCIIString, "prefixListId", LibExpat.find(pd, "item/prefixListId"))
  o
end

export DescribePrefixListsType


type PrefixListType
  cidrs::Union{Vector{ASCIIString}, Void}
  prefixListId::Union{ASCIIString, Void}
  prefixListName::Union{ASCIIString, Void}

  PrefixListType(; cidrs=nothing, prefixListId=nothing, prefixListName=nothing) = new(cidrs, prefixListId, prefixListName)
end
function PrefixListType(pd::ETree)
  o = PrefixListType()
  o.cidrs = AWS.parse_vector_as(ASCIIString, "cidr", LibExpat.find(pd, "item/cidr"))
  o.prefixListId = LibExpat.find(pd, "prefixListId#string")
  o.prefixListName = LibExpat.find(pd, "prefixListName#string")
  o
end

export PrefixListType


type DescribePrefixListsResponseType
  nextToken::Union{ASCIIString, Void}
  prefixListSet::Union{Vector{PrefixListType}, Void}
  requestId::Union{ASCIIString, Void}

  DescribePrefixListsResponseType(; nextToken=nothing, prefixListSet=nothing, requestId=nothing) =
    new(nextToken, prefixListSet, requestId)
end
function DescribePrefixListsResponseType(pd::ETree)
  o = DescribePrefixListsResponseType()
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o.prefixListSet = AWS.parse_vector_as(ASCIIString, "prefixList", LibExpat.find(pd, "item/prefixList"))
  o
end

export DescribePrefixListsType


type DescribeVpcEndpointServicesType
  maxResults::Union{Int64, Void}
  nextToken::Union{ASCIIString, Void}

  DescribeVpcEndpointServicesType(; maxResults=nothing, nextToken=nothing) = new(maxResults, nextToken)
end
function DescribeVpcEndpointServicesType(pd::ETree)
  o = DescribeVpcEndpointServicesType()
  o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o
end

export DescribeVpcEndpointServicesType


type DescribeVpcEndpointServicesResponseType
  nextToken::Union{ASCIIString, Void}
  requestId::Union{ASCIIString, Void}
  serviceNameSet::Union{Vector{ASCIIString}, Void}

  DescribeVpcEndpointServicesResponseType(; nextToken=nothing, requestId=nothing, serviceNameSet=nothing) =
    new(nextToken, requestId, serviceNameSet)
end
function DescribeVpcEndpointServicesResponseType(pd::ETree)
  o = DescribeVpcEndpointServicesResponseType()
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.serviceNameSet = AWS.parse_vector_as(ASCIIString, "serviceName", LibExpat.find(pd, "item/serviceName"))
end

export DescribeVpcEndpointServicesResponseType


type DescribeVpcEndpointsType
  filterSet::Union{Vector{FilterType}, Void}
  maxResults::Union{Int64, Void}
  nextToken::Union{ASCIIString, Void}
  vpcEndpointIdSet::Union{Vector{ASCIIString}, Void}

  DescribeVpcEndpointsType(; filterSet=nothing, maxResults=nothing, nextToken=nothing, vpcEndpointIdSet=nothing) =
    new(filterSet, maxResults, nextToken, vpcEndpointIdSet)
end
function DescribeVpcEndpointsType(pd::ETree)
  o = DescribeVpcEndpointsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
  o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o.vpcEndpointIdSet = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LibExpat.find(pd, "vcpEndpointId/item"))
  o
end

export DescribeVpcEndpointsType


type DescribeVpcEndpointsResponseType
  nextToken::Union{ASCIIString, Void}
  requestId::Union{ASCIIString, Void}
  vpcEndpointIdSet::Union{Vector{ASCIIString}, Void}

  DescribeVpcEndpointsResponseType(; nextToken=nothing, requestId=nothing, vpcEndpointIdSet=nothing) =
    new(nextToken, requestId, vpcEndpointIdSet)
end
function DescribeVpcEndpointsResponseType(pd::ETree)
  o = DescribeVpcEndpointsResponseType()
  o.nextToken = LibExpat.find(pd, "nextToken#string")
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.vpcEndpointIdSet = AWS.@parse_vector(AWS.EC2.VpcEndpointType, LibExpat.find(pd, "vcpEndpointId/item"))
  o
end

export DescribeVpcEndpointsResponseType


type DescribeVpcPeeringConnectionsType
  filterSet::Union{Vector{FilterType}, Void}
  vpcPeeringConnectionIdSet::Union{Vector{ASCIIString}, Void}

  DescribeVpcPeeringConnectionsType(; filterSet=nothing, vpcPeeringConnectionIdSet=nothing) =
    new(filterSet, vpcPeeringConnectionIdSet)
end
function DescribeVpcPeeringConnectionsType(pd::ETree)
  o = DescribeVpcPeeringConnectionsType()
  o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
  o.vpcPeeringConnectionIdSet = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LibExpat.find(pd, "vcpPeeringConnectionId/item"))
  o
end

export DescribeVpcPeeringConnectionsType


type DescribeVpcPeeringConnectionsResponseType
  requestId::Union{ASCIIString, Void}
  vpcPeeringConnectionSet::Union{Vector{VpcPeeringConnectionType}, Void}

  DescribeVpcPeeringConnectionsResponseType(; responseId=nothing, vpcPeeringConnectionSet=nothing) =
    new(responseId, vpcPeeringConnectionSet)
end
function DescribeVpcPeeringConnectionsResponseType(pd::ETree)
  o = DescribeVpcPeeringConnectionsResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o.vpcPeeringConnectionSet = AWS.@parse_vector(AWS.EC2.VpcPeeringConnectionType, LibExpat.find(pd, "vcpPeeringConnection/item"))
  o
end

export DescribeVpcPeeringConnectionsResponseType


type ModifySubnetAttributeType
  mapPublicIpOnLaunch::Union{Bool, Void}
  subnetId::Union{ASCIIString, Void}

  ModifySubnetAttributeType(; mapPublicIpOnLaunch=nothing, subnetId=nothing) =
    new(mapPublicIpOnLaunch, subnetId)
end
function ModifySubnetAttributeType(pd::ETree)
  o = ModifySubnetAttributeType()
  o.mapPublicIpOnLaunch = AWS.safe_parse_as(Bool, LibExpat.find(pd, "mapPublicIpOnLaunch#string"))
  o.subnetId = LibExpat.find(pd, "subnetId#string")
  o
end

export ModifySubnetAttributeType


type ModifySubnetAttributeResponseType
  requestId::Union{ASCIIString, Void}
  _return::Union{Bool, Void}

  ModifySubnetAttributeResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function ModifySubnetAttributeResponseType(pd::ETree)
  o = ModifySubnetAttributeResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o._return = AWS.safe_parse_as(bool, LibExpat.find(pd, "return#string"))
  o
end

export ModifySubnetAttributeResponseType


type ModifyVpcEndpointType
  addRouteTableIdSet::Union{Vector{ASCIIString}, Void}
  policyDocument::Union{ASCIIString, Void}
  removeRouteTableIdSet::Union{Vector{ASCIIString}, Void}
  resetPolicy::Union{Bool, Void}
  vpcEndpointId::Union{ASCIIString, Void}

  ModifyVpcEndpointType(; addRouteTableIdSet=nothing, policyDocument=nothing, removeRouteTableIdSet=nothing,
                        resetPolicy=nothing, vpcEndpointId=nothing) = new(addRouteTableIdSet, policyDocument,
                                                                          removeRouteTableIdSet, resetPolicy, vpcEndpointId)
end
function ModifyVpcEndpointType(pd::ETree)
  o = ModifyVpcEndpointType()
  o.addRouteTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", LibExpat.find(pd, "item/routeTableId"))
  o.policyDocument = LibExpat.find(pd, "policyDocument#string")
  o.removeRouteTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", LibExpat.find(pd, "item/routeTableId"))
  o.resetPolicy = AWS.safe_parse_as(Bool, LibExpat.find(pd, "resetPolicy"))
  o.vpcEndpointId = LibExpat.find(pd, "vpcEndpointId#string")
  o
end

export ModifyVpcEndpointType


type ModifyVpcEndpointResponseType
  requestId::Union{ASCIIString, Void}
  _return::Union{Bool, Void}

  ModifyVpcEndpointResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function ModifyVpcEndpointResponseType(pd::ETree)
  o = ModifyVpcEndpointResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o._return = AWS.safe_parse_as(bool, LibExpat.find(pd, "return#string"))
  o
end

export ModifyVpcEndpointResponseType


type RejectVpcPeeringConnectionType
  vpcPeeringConnectionId::Union{ASCIIString, Void}

  RejectVpcPeeringConnectionType(; vpcPeeringConnectionId=nothing) = new(vpcPeeringConnectionId)
end
function RejectVpcPeeringConnectionType(pd::ETree)
  o = RejectVpcPeeringConnectionType()
  o.vpcPeeringConnectionId = LibExpat.find(pd, "vpcPeeringConnectionId#string")
  o
end

export RejectVpcPeeringConnectionType


type RejectVpcPeeringConnectionResponseType
  requestId::Union{ASCIIString, Void}
  _return::Union{Bool, Void}

  RejectVpcPeeringConnectionResponseType(; requestId=nothing, _return=nothing) = new(requestId, _return)
end
function RejectVpcPeeringConnectionResponseType(pd::ETree)
  o = RejectVpcPeeringConnectionResponseType()
  o.requestId = LibExpat.find(pd, "requestId#string")
  o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
  o
end

export RejectVpcPeeringConnectionResponseType


type GetConsoleOutputType
    instanceId::Union{ASCIIString, Void}

    GetConsoleOutputType(; instanceId=nothing) =
         new(instanceId)
end
function GetConsoleOutputType(pd::ETree)
    o = GetConsoleOutputType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export GetConsoleOutputType


type GetConsoleOutputResponseType
    requestId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    output::Union{ASCIIString, Void}

    GetConsoleOutputResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, output=nothing) =
         new(requestId, instanceId, timestamp, output)
end
function GetConsoleOutputResponseType(pd::ETree)
    o = GetConsoleOutputResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "timestamp#string"))
    o.output = LibExpat.find(pd, "output#string")
    o
end

export GetConsoleOutputResponseType


type GetPasswordDataType
    instanceId::Union{ASCIIString, Void}

    GetPasswordDataType(; instanceId=nothing) =
         new(instanceId)
end
function GetPasswordDataType(pd::ETree)
    o = GetPasswordDataType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export GetPasswordDataType


type GetPasswordDataResponseType
    requestId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    passwordData::Union{ASCIIString, Void}

    GetPasswordDataResponseType(; requestId=nothing, instanceId=nothing, timestamp=nothing, passwordData=nothing) =
         new(requestId, instanceId, timestamp, passwordData)
end
function GetPasswordDataResponseType(pd::ETree)
    o = GetPasswordDataResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "timestamp#string"))
    o.passwordData = LibExpat.find(pd, "passwordData#string")
    o
end

export GetPasswordDataResponseType


type InstanceIdType
    instanceId::Union{ASCIIString, Void}

    InstanceIdType(; instanceId=nothing) =
         new(instanceId)
end
function InstanceIdType(pd::ETree)
    o = InstanceIdType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export InstanceIdType


type TerminateInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}

    TerminateInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function TerminateInstancesType(pd::ETree)
    o = TerminateInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o
end

export TerminateInstancesType


type InstanceBlockDeviceMappingItemType
    deviceName::Union{ASCIIString, Void}

    InstanceBlockDeviceMappingItemType(; deviceName=nothing) =
         new(deviceName)
end
function InstanceBlockDeviceMappingItemType(pd::ETree)
    o = InstanceBlockDeviceMappingItemType()
    o.deviceName = LibExpat.find(pd, "deviceName#string")
    o
end

export InstanceBlockDeviceMappingItemType


type InstanceEbsBlockDeviceType
    volumeId::Union{ASCIIString, Void}
    deleteOnTermination::Union{Bool, Void}

    InstanceEbsBlockDeviceType(; volumeId=nothing, deleteOnTermination=nothing) =
         new(volumeId, deleteOnTermination)
end
function InstanceEbsBlockDeviceType(pd::ETree)
    o = InstanceEbsBlockDeviceType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export InstanceEbsBlockDeviceType


type StopInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}
    force::Union{Bool, Void}

    StopInstancesType(; instancesSet=nothing, force=nothing) =
         new(instancesSet, force)
end
function StopInstancesType(pd::ETree)
    o = StopInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o.force = AWS.safe_parse_as(Bool, LibExpat.find(pd, "force#string"))
    o
end

export StopInstancesType


type StartInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}

    StartInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function StartInstancesType(pd::ETree)
    o = StartInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o
end

export StartInstancesType


type RebootInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}

    RebootInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function RebootInstancesType(pd::ETree)
    o = RebootInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o
end

export RebootInstancesType


type RebootInstancesItemType
    instanceId::Union{ASCIIString, Void}

    RebootInstancesItemType(; instanceId=nothing) =
         new(instanceId)
end
function RebootInstancesItemType(pd::ETree)
    o = RebootInstancesItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export RebootInstancesItemType


type RebootInstancesResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    RebootInstancesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RebootInstancesResponseType(pd::ETree)
    o = RebootInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export RebootInstancesResponseType


type DescribeInstancesItemType
    instanceId::Union{ASCIIString, Void}

    DescribeInstancesItemType(; instanceId=nothing) =
         new(instanceId)
end
function DescribeInstancesItemType(pd::ETree)
    o = DescribeInstancesItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export DescribeInstancesItemType


type UnavailableResultType
    availabilityZone::Union{ASCIIString, Void}

    UnavailableResultType(; availabilityZone=nothing) =
         new(availabilityZone)
end
function UnavailableResultType(pd::ETree)
    o = UnavailableResultType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o
end

export UnavailableResultType


type DescribeImagesItemType
    imageId::Union{ASCIIString, Void}

    DescribeImagesItemType(; imageId=nothing) =
         new(imageId)
end
function DescribeImagesItemType(pd::ETree)
    o = DescribeImagesItemType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export DescribeImagesItemType


type DescribeImagesOwnerType
    owner::Union{ASCIIString, Void}

    DescribeImagesOwnerType(; owner=nothing) =
         new(owner)
end
function DescribeImagesOwnerType(pd::ETree)
    o = DescribeImagesOwnerType()
    o.owner = LibExpat.find(pd, "owner#string")
    o
end

export DescribeImagesOwnerType


type DescribeImagesExecutableByType
    user::Union{ASCIIString, Void}

    DescribeImagesExecutableByType(; user=nothing) =
         new(user)
end
function DescribeImagesExecutableByType(pd::ETree)
    o = DescribeImagesExecutableByType()
    o.user = LibExpat.find(pd, "user#string")
    o
end

export DescribeImagesExecutableByType


type CreateSecurityGroupType
    groupName::Union{ASCIIString, Void}
    groupDescription::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    CreateSecurityGroupType(; groupName=nothing, groupDescription=nothing, vpcId=nothing) =
         new(groupName, groupDescription, vpcId)
end
function CreateSecurityGroupType(pd::ETree)
    o = CreateSecurityGroupType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.groupDescription = LibExpat.find(pd, "groupDescription#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export CreateSecurityGroupType


type CreateSecurityGroupResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}
    groupId::Union{ASCIIString, Void}

    CreateSecurityGroupResponseType(; requestId=nothing, _return=nothing, groupId=nothing) =
         new(requestId, _return, groupId)
end
function CreateSecurityGroupResponseType(pd::ETree)
    o = CreateSecurityGroupResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o.groupId = LibExpat.find(pd, "groupId#string")
    o
end

export CreateSecurityGroupResponseType


type DeleteSecurityGroupType
    groupId::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    DeleteSecurityGroupType(; groupId=nothing, groupName=nothing) =
         new(groupId, groupName)
end
function DeleteSecurityGroupType(pd::ETree)
    o = DeleteSecurityGroupType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export DeleteSecurityGroupType


type DeleteSecurityGroupResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteSecurityGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSecurityGroupResponseType(pd::ETree)
    o = DeleteSecurityGroupResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteSecurityGroupResponseType


type DescribeSecurityGroupsSetItemType
    groupName::Union{ASCIIString, Void}

    DescribeSecurityGroupsSetItemType(; groupName=nothing) =
         new(groupName)
end
function DescribeSecurityGroupsSetItemType(pd::ETree)
    o = DescribeSecurityGroupsSetItemType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export DescribeSecurityGroupsSetItemType


type DescribeSecurityGroupsIdSetItemType
    groupId::Union{ASCIIString, Void}

    DescribeSecurityGroupsIdSetItemType(; groupId=nothing) =
         new(groupId)
end
function DescribeSecurityGroupsIdSetItemType(pd::ETree)
    o = DescribeSecurityGroupsIdSetItemType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o
end

export DescribeSecurityGroupsIdSetItemType


type IpRangeItemType
    cidrIp::Union{ASCIIString, Void}

    IpRangeItemType(; cidrIp=nothing) =
         new(cidrIp)
end
function IpRangeItemType(pd::ETree)
    o = IpRangeItemType()
    o.cidrIp = LibExpat.find(pd, "cidrIp#string")
    o
end

export IpRangeItemType


type UserIdGroupPairType
    userId::Union{ASCIIString, Void}
    groupId::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}

    UserIdGroupPairType(; userId=nothing, groupId=nothing, groupName=nothing) =
         new(userId, groupId, groupName)
end
function UserIdGroupPairType(pd::ETree)
    o = UserIdGroupPairType()
    o.userId = LibExpat.find(pd, "userId#string")
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export UserIdGroupPairType


type AuthorizeSecurityGroupIngressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    AuthorizeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AuthorizeSecurityGroupIngressResponseType(pd::ETree)
    o = AuthorizeSecurityGroupIngressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export AuthorizeSecurityGroupIngressResponseType


type RevokeSecurityGroupIngressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    RevokeSecurityGroupIngressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RevokeSecurityGroupIngressResponseType(pd::ETree)
    o = RevokeSecurityGroupIngressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export RevokeSecurityGroupIngressResponseType


type AuthorizeSecurityGroupEgressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    AuthorizeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AuthorizeSecurityGroupEgressResponseType(pd::ETree)
    o = AuthorizeSecurityGroupEgressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export AuthorizeSecurityGroupEgressResponseType


type RevokeSecurityGroupEgressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    RevokeSecurityGroupEgressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function RevokeSecurityGroupEgressResponseType(pd::ETree)
    o = RevokeSecurityGroupEgressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export RevokeSecurityGroupEgressResponseType


type InstanceStateType
    code::Union{Int64, Void}
    name::Union{ASCIIString, Void}

    InstanceStateType(; code=nothing, name=nothing) =
         new(code, name)
end
function InstanceStateType(pd::ETree)
    o = InstanceStateType()
    o.code = AWS.safe_parse_as(Int64, LibExpat.find(pd, "code#string"))
    o.name = LibExpat.find(pd, "name#string")
    o
end

export InstanceStateType


type ModifyInstanceAttributeType
    instanceId::Union{ASCIIString, Void}

    ModifyInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function ModifyInstanceAttributeType(pd::ETree)
    o = ModifyInstanceAttributeType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export ModifyInstanceAttributeType


type SecurityGroupIdSetItemType
    groupId::Union{ASCIIString, Void}

    SecurityGroupIdSetItemType(; groupId=nothing) =
         new(groupId)
end
function SecurityGroupIdSetItemType(pd::ETree)
    o = SecurityGroupIdSetItemType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o
end

export SecurityGroupIdSetItemType


type ModifyInstanceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifyInstanceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyInstanceAttributeResponseType(pd::ETree)
    o = ModifyInstanceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifyInstanceAttributeResponseType


type ResetInstanceAttributeType
    instanceId::Union{ASCIIString, Void}

    ResetInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function ResetInstanceAttributeType(pd::ETree)
    o = ResetInstanceAttributeType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export ResetInstanceAttributeType


type ResetInstanceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ResetInstanceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetInstanceAttributeResponseType(pd::ETree)
    o = ResetInstanceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ResetInstanceAttributeResponseType


type DescribeInstanceAttributeType
    instanceId::Union{ASCIIString, Void}

    DescribeInstanceAttributeType(; instanceId=nothing) =
         new(instanceId)
end
function DescribeInstanceAttributeType(pd::ETree)
    o = DescribeInstanceAttributeType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export DescribeInstanceAttributeType


type DescribeInstanceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}

    DescribeInstanceAttributeResponseType(; requestId=nothing, instanceId=nothing) =
         new(requestId, instanceId)
end
function DescribeInstanceAttributeResponseType(pd::ETree)
    o = DescribeInstanceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export DescribeInstanceAttributeResponseType


type ModifyImageAttributeType
    imageId::Union{ASCIIString, Void}

    ModifyImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function ModifyImageAttributeType(pd::ETree)
    o = ModifyImageAttributeType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export ModifyImageAttributeType


type LaunchPermissionItemType
    userId::Union{ASCIIString, Void}
    group::Union{ASCIIString, Void}

    LaunchPermissionItemType(; userId=nothing, group=nothing) =
         new(userId, group)
end
function LaunchPermissionItemType(pd::ETree)
    o = LaunchPermissionItemType()
    o.userId = LibExpat.find(pd, "userId#string")
    o.group = LibExpat.find(pd, "group#string")
    o
end

export LaunchPermissionItemType


type ProductCodeItemType
    productCode::Union{ASCIIString, Void}

    ProductCodeItemType(; productCode=nothing) =
         new(productCode)
end
function ProductCodeItemType(pd::ETree)
    o = ProductCodeItemType()
    o.productCode = LibExpat.find(pd, "productCode#string")
    o
end

export ProductCodeItemType


type ModifyImageAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifyImageAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyImageAttributeResponseType(pd::ETree)
    o = ModifyImageAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifyImageAttributeResponseType


type ResetImageAttributeType
    imageId::Union{ASCIIString, Void}

    ResetImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function ResetImageAttributeType(pd::ETree)
    o = ResetImageAttributeType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export ResetImageAttributeType


type ResetImageAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ResetImageAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetImageAttributeResponseType(pd::ETree)
    o = ResetImageAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ResetImageAttributeResponseType


type DescribeImageAttributeType
    imageId::Union{ASCIIString, Void}

    DescribeImageAttributeType(; imageId=nothing) =
         new(imageId)
end
function DescribeImageAttributeType(pd::ETree)
    o = DescribeImageAttributeType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export DescribeImageAttributeType


type DescribeImageAttributeResponseType
    requestId::Union{ASCIIString, Void}
    imageId::Union{ASCIIString, Void}

    DescribeImageAttributeResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function DescribeImageAttributeResponseType(pd::ETree)
    o = DescribeImageAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export DescribeImageAttributeResponseType


type NullableAttributeValueType
    value::Union{ASCIIString, Void}

    NullableAttributeValueType(; value=nothing) =
         new(value)
end
function NullableAttributeValueType(pd::ETree)
    o = NullableAttributeValueType()
    o.value = LibExpat.find(pd, "value#string")
    o
end

export NullableAttributeValueType


type NullableAttributeBooleanValueType
    value::Union{Bool, Void}

    NullableAttributeBooleanValueType(; value=nothing) =
         new(value)
end
function NullableAttributeBooleanValueType(pd::ETree)
    o = NullableAttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, LibExpat.find(pd, "value#string"))
    o
end

export NullableAttributeBooleanValueType


type AttributeValueType
    value::Union{ASCIIString, Void}

    AttributeValueType(; value=nothing) =
         new(value)
end
function AttributeValueType(pd::ETree)
    o = AttributeValueType()
    o.value = LibExpat.find(pd, "value#string")
    o
end

export AttributeValueType


type AttributeBooleanValueType
    value::Union{Bool, Void}

    AttributeBooleanValueType(; value=nothing) =
         new(value)
end
function AttributeBooleanValueType(pd::ETree)
    o = AttributeBooleanValueType()
    o.value = AWS.safe_parse_as(Bool, LibExpat.find(pd, "value#string"))
    o
end

export AttributeBooleanValueType


type ConfirmProductInstanceType
    productCode::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}

    ConfirmProductInstanceType(; productCode=nothing, instanceId=nothing) =
         new(productCode, instanceId)
end
function ConfirmProductInstanceType(pd::ETree)
    o = ConfirmProductInstanceType()
    o.productCode = LibExpat.find(pd, "productCode#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export ConfirmProductInstanceType


type ProductCodesSetItemType
    productCode::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}

    ProductCodesSetItemType(; productCode=nothing, _type=nothing) =
         new(productCode, _type)
end
function ProductCodesSetItemType(pd::ETree)
    o = ProductCodesSetItemType()
    o.productCode = LibExpat.find(pd, "productCode#string")
    o._type = LibExpat.find(pd, "type#string")
    o
end

export ProductCodesSetItemType


type ConfirmProductInstanceResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}
    ownerId::Union{ASCIIString, Void}

    ConfirmProductInstanceResponseType(; requestId=nothing, _return=nothing, ownerId=nothing) =
         new(requestId, _return, ownerId)
end
function ConfirmProductInstanceResponseType(pd::ETree)
    o = ConfirmProductInstanceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o
end

export ConfirmProductInstanceResponseType


type DescribeAvailabilityZonesSetItemType
    zoneName::Union{ASCIIString, Void}

    DescribeAvailabilityZonesSetItemType(; zoneName=nothing) =
         new(zoneName)
end
function DescribeAvailabilityZonesSetItemType(pd::ETree)
    o = DescribeAvailabilityZonesSetItemType()
    o.zoneName = LibExpat.find(pd, "zoneName#string")
    o
end

export DescribeAvailabilityZonesSetItemType


type AvailabilityZoneMessageType
    message::Union{ASCIIString, Void}

    AvailabilityZoneMessageType(; message=nothing) =
         new(message)
end
function AvailabilityZoneMessageType(pd::ETree)
    o = AvailabilityZoneMessageType()
    o.message = LibExpat.find(pd, "message#string")
    o
end

export AvailabilityZoneMessageType


type AvailabilityZoneItemType
    zoneName::Union{ASCIIString, Void}
    zoneState::Union{ASCIIString, Void}
    regionName::Union{ASCIIString, Void}
    messageSet::Union{Vector{ASCIIString}, Void}

    AvailabilityZoneItemType(; zoneName=nothing, zoneState=nothing, regionName=nothing, messageSet=nothing) =
         new(zoneName, zoneState, regionName, messageSet)
end
function AvailabilityZoneItemType(pd::ETree)
    o = AvailabilityZoneItemType()
    o.zoneName = LibExpat.find(pd, "zoneName#string")
    o.zoneState = LibExpat.find(pd, "zoneState#string")
    o.regionName = LibExpat.find(pd, "regionName#string")
    o.messageSet = AWS.parse_vector_as(ASCIIString, "message", LibExpat.find(pd, "item/message"))
    o
end

export AvailabilityZoneItemType


type AllocateAddressType
    domain::Union{ASCIIString, Void}

    AllocateAddressType(; domain=nothing) =
         new(domain)
end
function AllocateAddressType(pd::ETree)
    o = AllocateAddressType()
    o.domain = LibExpat.find(pd, "domain#string")
    o
end

export AllocateAddressType


type AllocateAddressResponseType
    requestId::Union{ASCIIString, Void}
    publicIp::Union{ASCIIString, Void}
    domain::Union{ASCIIString, Void}
    allocationId::Union{ASCIIString, Void}

    AllocateAddressResponseType(; requestId=nothing, publicIp=nothing, domain=nothing, allocationId=nothing) =
         new(requestId, publicIp, domain, allocationId)
end
function AllocateAddressResponseType(pd::ETree)
    o = AllocateAddressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.domain = LibExpat.find(pd, "domain#string")
    o.allocationId = LibExpat.find(pd, "allocationId#string")
    o
end

export AllocateAddressResponseType


type ReleaseAddressType
    publicIp::Union{ASCIIString, Void}
    allocationId::Union{ASCIIString, Void}

    ReleaseAddressType(; publicIp=nothing, allocationId=nothing) =
         new(publicIp, allocationId)
end
function ReleaseAddressType(pd::ETree)
    o = ReleaseAddressType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.allocationId = LibExpat.find(pd, "allocationId#string")
    o
end

export ReleaseAddressType


type ReleaseAddressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ReleaseAddressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReleaseAddressResponseType(pd::ETree)
    o = ReleaseAddressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ReleaseAddressResponseType


type AllocationIdSetItemType
    allocationId::Union{ASCIIString, Void}

    AllocationIdSetItemType(; allocationId=nothing) =
         new(allocationId)
end
function AllocationIdSetItemType(pd::ETree)
    o = AllocationIdSetItemType()
    o.allocationId = LibExpat.find(pd, "allocationId#string")
    o
end

export AllocationIdSetItemType


type DescribeAddressesItemType
    publicIp::Union{ASCIIString, Void}

    DescribeAddressesItemType(; publicIp=nothing) =
         new(publicIp)
end
function DescribeAddressesItemType(pd::ETree)
    o = DescribeAddressesItemType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o
end

export DescribeAddressesItemType


type DescribeAddressesResponseItemType
    publicIp::Union{ASCIIString, Void}
    allocationId::Union{ASCIIString, Void}
    domain::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    associationId::Union{ASCIIString, Void}
    networkInterfaceId::Union{ASCIIString, Void}
    networkInterfaceOwnerId::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}

    DescribeAddressesResponseItemType(; publicIp=nothing, allocationId=nothing, domain=nothing, instanceId=nothing, associationId=nothing, networkInterfaceId=nothing, networkInterfaceOwnerId=nothing, privateIpAddress=nothing) =
         new(publicIp, allocationId, domain, instanceId, associationId, networkInterfaceId, networkInterfaceOwnerId, privateIpAddress)
end
function DescribeAddressesResponseItemType(pd::ETree)
    o = DescribeAddressesResponseItemType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.allocationId = LibExpat.find(pd, "allocationId#string")
    o.domain = LibExpat.find(pd, "domain#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.associationId = LibExpat.find(pd, "associationId#string")
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.networkInterfaceOwnerId = LibExpat.find(pd, "networkInterfaceOwnerId#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o
end

export DescribeAddressesResponseItemType


type AssociateAddressType
    privateIpAddress::Union{ASCIIString, Void}
    allowReassociation::Union{Bool, Void}

    AssociateAddressType(; privateIpAddress=nothing, allowReassociation=nothing) =
         new(privateIpAddress, allowReassociation)
end
function AssociateAddressType(pd::ETree)
    o = AssociateAddressType()
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.allowReassociation = AWS.safe_parse_as(Bool, LibExpat.find(pd, "allowReassociation#string"))
    o
end

export AssociateAddressType


type AssociateAddressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}
    associationId::Union{ASCIIString, Void}

    AssociateAddressResponseType(; requestId=nothing, _return=nothing, associationId=nothing) =
         new(requestId, _return, associationId)
end
function AssociateAddressResponseType(pd::ETree)
    o = AssociateAddressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o.associationId = LibExpat.find(pd, "associationId#string")
    o
end

export AssociateAddressResponseType


type DisassociateAddressType
    publicIp::Union{ASCIIString, Void}
    associationId::Union{ASCIIString, Void}

    DisassociateAddressType(; publicIp=nothing, associationId=nothing) =
         new(publicIp, associationId)
end
function DisassociateAddressType(pd::ETree)
    o = DisassociateAddressType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.associationId = LibExpat.find(pd, "associationId#string")
    o
end

export DisassociateAddressType


type DisassociateAddressResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DisassociateAddressResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisassociateAddressResponseType(pd::ETree)
    o = DisassociateAddressResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DisassociateAddressResponseType


type CreateVolumeType
    size::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    volumeType::Union{ASCIIString, Void}
    iops::Union{Int64, Void}

    CreateVolumeType(; size=nothing, snapshotId=nothing, availabilityZone=nothing, volumeType=nothing, iops=nothing) =
         new(size, snapshotId, availabilityZone, volumeType, iops)
end
function CreateVolumeType(pd::ETree)
    o = CreateVolumeType()
    o.size = LibExpat.find(pd, "size#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.volumeType = LibExpat.find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, LibExpat.find(pd, "iops#string"))
    o
end

export CreateVolumeType


type CreateVolumeResponseType
    requestId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}
    size::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    volumeType::Union{ASCIIString, Void}
    iops::Union{Int64, Void}

    CreateVolumeResponseType(; requestId=nothing, volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, volumeType=nothing, iops=nothing) =
         new(requestId, volumeId, size, snapshotId, availabilityZone, status, createTime, volumeType, iops)
end
function CreateVolumeResponseType(pd::ETree)
    o = CreateVolumeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.size = LibExpat.find(pd, "size#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.status = LibExpat.find(pd, "status#string")
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "createTime#string"))
    o.volumeType = LibExpat.find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, LibExpat.find(pd, "iops#string"))
    o
end

export CreateVolumeResponseType


type DeleteVolumeType
    volumeId::Union{ASCIIString, Void}

    DeleteVolumeType(; volumeId=nothing) =
         new(volumeId)
end
function DeleteVolumeType(pd::ETree)
    o = DeleteVolumeType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export DeleteVolumeType


type DeleteVolumeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteVolumeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVolumeResponseType(pd::ETree)
    o = DeleteVolumeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteVolumeResponseType


type DescribeVolumesSetItemType
    volumeId::Union{ASCIIString, Void}

    DescribeVolumesSetItemType(; volumeId=nothing) =
         new(volumeId)
end
function DescribeVolumesSetItemType(pd::ETree)
    o = DescribeVolumesSetItemType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export DescribeVolumesSetItemType


type AttachmentSetItemResponseType
    volumeId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    device::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    AttachmentSetItemResponseType(; volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(volumeId, instanceId, device, status, attachTime, deleteOnTermination)
end
function AttachmentSetItemResponseType(pd::ETree)
    o = AttachmentSetItemResponseType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.device = LibExpat.find(pd, "device#string")
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export AttachmentSetItemResponseType


type AttachVolumeType
    volumeId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    device::Union{ASCIIString, Void}

    AttachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing) =
         new(volumeId, instanceId, device)
end
function AttachVolumeType(pd::ETree)
    o = AttachVolumeType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.device = LibExpat.find(pd, "device#string")
    o
end

export AttachVolumeType


type AttachVolumeResponseType
    requestId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    device::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}

    AttachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) =
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function AttachVolumeResponseType(pd::ETree)
    o = AttachVolumeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.device = LibExpat.find(pd, "device#string")
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o
end

export AttachVolumeResponseType


type DetachVolumeType
    volumeId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    device::Union{ASCIIString, Void}
    force::Union{Bool, Void}

    DetachVolumeType(; volumeId=nothing, instanceId=nothing, device=nothing, force=nothing) =
         new(volumeId, instanceId, device, force)
end
function DetachVolumeType(pd::ETree)
    o = DetachVolumeType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.device = LibExpat.find(pd, "device#string")
    o.force = AWS.safe_parse_as(Bool, LibExpat.find(pd, "force#string"))
    o
end

export DetachVolumeType


type DetachVolumeResponseType
    requestId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    device::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}

    DetachVolumeResponseType(; requestId=nothing, volumeId=nothing, instanceId=nothing, device=nothing, status=nothing, attachTime=nothing) =
         new(requestId, volumeId, instanceId, device, status, attachTime)
end
function DetachVolumeResponseType(pd::ETree)
    o = DetachVolumeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.device = LibExpat.find(pd, "device#string")
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o
end

export DetachVolumeResponseType


type CreateSnapshotType
    volumeId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}

    CreateSnapshotType(; volumeId=nothing, description=nothing) =
         new(volumeId, description)
end
function CreateSnapshotType(pd::ETree)
    o = CreateSnapshotType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.description = LibExpat.find(pd, "description#string")
    o
end

export CreateSnapshotType


type CreateSnapshotResponseType
    requestId::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    progress::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    volumeSize::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}

    CreateSnapshotResponseType(; requestId=nothing, snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing) =
         new(requestId, snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description)
end
function CreateSnapshotResponseType(pd::ETree)
    o = CreateSnapshotResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.status = LibExpat.find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "startTime#string"))
    o.progress = LibExpat.find(pd, "progress#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.volumeSize = LibExpat.find(pd, "volumeSize#string")
    o.description = LibExpat.find(pd, "description#string")
    o
end

export CreateSnapshotResponseType


type CopySnapshotType
    sourceRegion::Union{ASCIIString, Void}
    sourceSnapshotId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}

    CopySnapshotType(; sourceRegion=nothing, sourceSnapshotId=nothing, description=nothing) =
         new(sourceRegion, sourceSnapshotId, description)
end
function CopySnapshotType(pd::ETree)
    o = CopySnapshotType()
    o.sourceRegion = LibExpat.find(pd, "sourceRegion#string")
    o.sourceSnapshotId = LibExpat.find(pd, "sourceSnapshotId#string")
    o.description = LibExpat.find(pd, "description#string")
    o
end

export CopySnapshotType


type CopySnapshotResponseType
    requestId::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}

    CopySnapshotResponseType(; requestId=nothing, snapshotId=nothing) =
         new(requestId, snapshotId)
end
function CopySnapshotResponseType(pd::ETree)
    o = CopySnapshotResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export CopySnapshotResponseType


type DeleteSnapshotType
    snapshotId::Union{ASCIIString, Void}

    DeleteSnapshotType(; snapshotId=nothing) =
         new(snapshotId)
end
function DeleteSnapshotType(pd::ETree)
    o = DeleteSnapshotType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export DeleteSnapshotType


type DeleteSnapshotResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteSnapshotResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSnapshotResponseType(pd::ETree)
    o = DeleteSnapshotResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteSnapshotResponseType


type DescribeSnapshotsSetItemType
    snapshotId::Union{ASCIIString, Void}

    DescribeSnapshotsSetItemType(; snapshotId=nothing) =
         new(snapshotId)
end
function DescribeSnapshotsSetItemType(pd::ETree)
    o = DescribeSnapshotsSetItemType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export DescribeSnapshotsSetItemType


type DescribeSnapshotsOwnerType
    owner::Union{ASCIIString, Void}

    DescribeSnapshotsOwnerType(; owner=nothing) =
         new(owner)
end
function DescribeSnapshotsOwnerType(pd::ETree)
    o = DescribeSnapshotsOwnerType()
    o.owner = LibExpat.find(pd, "owner#string")
    o
end

export DescribeSnapshotsOwnerType


type DescribeSnapshotsRestorableByType
    user::Union{ASCIIString, Void}

    DescribeSnapshotsRestorableByType(; user=nothing) =
         new(user)
end
function DescribeSnapshotsRestorableByType(pd::ETree)
    o = DescribeSnapshotsRestorableByType()
    o.user = LibExpat.find(pd, "user#string")
    o
end

export DescribeSnapshotsRestorableByType


type CreateVolumePermissionItemType
    userId::Union{ASCIIString, Void}
    group::Union{ASCIIString, Void}

    CreateVolumePermissionItemType(; userId=nothing, group=nothing) =
         new(userId, group)
end
function CreateVolumePermissionItemType(pd::ETree)
    o = CreateVolumePermissionItemType()
    o.userId = LibExpat.find(pd, "userId#string")
    o.group = LibExpat.find(pd, "group#string")
    o
end

export CreateVolumePermissionItemType


type ModifySnapshotAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifySnapshotAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifySnapshotAttributeResponseType(pd::ETree)
    o = ModifySnapshotAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifySnapshotAttributeResponseType


type ResetSnapshotAttributeType
    snapshotId::Union{ASCIIString, Void}

    ResetSnapshotAttributeType(; snapshotId=nothing) =
         new(snapshotId)
end
function ResetSnapshotAttributeType(pd::ETree)
    o = ResetSnapshotAttributeType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export ResetSnapshotAttributeType


type ResetSnapshotAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ResetSnapshotAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetSnapshotAttributeResponseType(pd::ETree)
    o = ResetSnapshotAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ResetSnapshotAttributeResponseType


type DescribeSnapshotAttributeType
    snapshotId::Union{ASCIIString, Void}

    DescribeSnapshotAttributeType(; snapshotId=nothing) =
         new(snapshotId)
end
function DescribeSnapshotAttributeType(pd::ETree)
    o = DescribeSnapshotAttributeType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export DescribeSnapshotAttributeType


type DescribeSnapshotAttributeResponseType
    requestId::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}

    DescribeSnapshotAttributeResponseType(; requestId=nothing, snapshotId=nothing) =
         new(requestId, snapshotId)
end
function DescribeSnapshotAttributeResponseType(pd::ETree)
    o = DescribeSnapshotAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o
end

export DescribeSnapshotAttributeResponseType


type BundleInstanceS3StorageType
    bucket::Union{ASCIIString, Void}
    prefix::Union{ASCIIString, Void}
    awsAccessKeyId::Union{ASCIIString, Void}
    uploadPolicy::Union{ASCIIString, Void}
    uploadPolicySignature::Union{ASCIIString, Void}

    BundleInstanceS3StorageType(; bucket=nothing, prefix=nothing, awsAccessKeyId=nothing, uploadPolicy=nothing, uploadPolicySignature=nothing) =
         new(bucket, prefix, awsAccessKeyId, uploadPolicy, uploadPolicySignature)
end
function BundleInstanceS3StorageType(pd::ETree)
    o = BundleInstanceS3StorageType()
    o.bucket = LibExpat.find(pd, "bucket#string")
    o.prefix = LibExpat.find(pd, "prefix#string")
    o.awsAccessKeyId = LibExpat.find(pd, "awsAccessKeyId#string")
    o.uploadPolicy = LibExpat.find(pd, "uploadPolicy#string")
    o.uploadPolicySignature = LibExpat.find(pd, "uploadPolicySignature#string")
    o
end

export BundleInstanceS3StorageType


type BundleInstanceTaskErrorType
    code::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}

    BundleInstanceTaskErrorType(; code=nothing, message=nothing) =
         new(code, message)
end
function BundleInstanceTaskErrorType(pd::ETree)
    o = BundleInstanceTaskErrorType()
    o.code = LibExpat.find(pd, "code#string")
    o.message = LibExpat.find(pd, "message#string")
    o
end

export BundleInstanceTaskErrorType


type DescribeBundleTasksItemType
    bundleId::Union{ASCIIString, Void}

    DescribeBundleTasksItemType(; bundleId=nothing) =
         new(bundleId)
end
function DescribeBundleTasksItemType(pd::ETree)
    o = DescribeBundleTasksItemType()
    o.bundleId = LibExpat.find(pd, "bundleId#string")
    o
end

export DescribeBundleTasksItemType


type CancelBundleTaskType
    bundleId::Union{ASCIIString, Void}

    CancelBundleTaskType(; bundleId=nothing) =
         new(bundleId)
end
function CancelBundleTaskType(pd::ETree)
    o = CancelBundleTaskType()
    o.bundleId = LibExpat.find(pd, "bundleId#string")
    o
end

export CancelBundleTaskType


type CopyImageType
    sourceRegion::Union{ASCIIString, Void}
    sourceImageId::Union{ASCIIString, Void}
    name::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    clientToken::Union{ASCIIString, Void}

    CopyImageType(; sourceRegion=nothing, sourceImageId=nothing, name=nothing, description=nothing, clientToken=nothing) =
         new(sourceRegion, sourceImageId, name, description, clientToken)
end
function CopyImageType(pd::ETree)
    o = CopyImageType()
    o.sourceRegion = LibExpat.find(pd, "sourceRegion#string")
    o.sourceImageId = LibExpat.find(pd, "sourceImageId#string")
    o.name = LibExpat.find(pd, "name#string")
    o.description = LibExpat.find(pd, "description#string")
    o.clientToken = LibExpat.find(pd, "clientToken#string")
    o
end

export CopyImageType


type CopyImageResponseType
    requestId::Union{ASCIIString, Void}
    imageId::Union{ASCIIString, Void}

    CopyImageResponseType(; requestId=nothing, imageId=nothing) =
         new(requestId, imageId)
end
function CopyImageResponseType(pd::ETree)
    o = CopyImageResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.imageId = LibExpat.find(pd, "imageId#string")
    o
end

export CopyImageResponseType


type DescribeRegionsSetItemType
    regionName::Union{ASCIIString, Void}

    DescribeRegionsSetItemType(; regionName=nothing) =
         new(regionName)
end
function DescribeRegionsSetItemType(pd::ETree)
    o = DescribeRegionsSetItemType()
    o.regionName = LibExpat.find(pd, "regionName#string")
    o
end

export DescribeRegionsSetItemType


type RegionItemType
    regionName::Union{ASCIIString, Void}
    regionEndpoint::Union{ASCIIString, Void}

    RegionItemType(; regionName=nothing, regionEndpoint=nothing) =
         new(regionName, regionEndpoint)
end
function RegionItemType(pd::ETree)
    o = RegionItemType()
    o.regionName = LibExpat.find(pd, "regionName#string")
    o.regionEndpoint = LibExpat.find(pd, "regionEndpoint#string")
    o
end

export RegionItemType


type DescribeReservedInstancesOfferingsSetItemType
    reservedInstancesOfferingId::Union{ASCIIString, Void}

    DescribeReservedInstancesOfferingsSetItemType(; reservedInstancesOfferingId=nothing) =
         new(reservedInstancesOfferingId)
end
function DescribeReservedInstancesOfferingsSetItemType(pd::ETree)
    o = DescribeReservedInstancesOfferingsSetItemType()
    o.reservedInstancesOfferingId = LibExpat.find(pd, "reservedInstancesOfferingId#string")
    o
end

export DescribeReservedInstancesOfferingsSetItemType


type RecurringChargesSetItemType
    frequency::Union{ASCIIString, Void}
    amount::Union{Float64, Void}

    RecurringChargesSetItemType(; frequency=nothing, amount=nothing) =
         new(frequency, amount)
end
function RecurringChargesSetItemType(pd::ETree)
    o = RecurringChargesSetItemType()
    o.frequency = LibExpat.find(pd, "frequency#string")
    o.amount = AWS.safe_parse_as(Float64, LibExpat.find(pd, "amount#string"))
    o
end

export RecurringChargesSetItemType


type PricingDetailsSetItemType
    price::Union{Float64, Void}
    count::Union{Int64, Void}

    PricingDetailsSetItemType(; price=nothing, count=nothing) =
         new(price, count)
end
function PricingDetailsSetItemType(pd::ETree)
    o = PricingDetailsSetItemType()
    o.price = AWS.safe_parse_as(Float64, LibExpat.find(pd, "price#string"))
    o.count = AWS.safe_parse_as(Int64, LibExpat.find(pd, "count#string"))
    o
end

export PricingDetailsSetItemType


type ReservedInstanceLimitPriceType
    amount::Union{Float64, Void}
    currencyCode::Union{ASCIIString, Void}

    ReservedInstanceLimitPriceType(; amount=nothing, currencyCode=nothing) =
         new(amount, currencyCode)
end
function ReservedInstanceLimitPriceType(pd::ETree)
    o = ReservedInstanceLimitPriceType()
    o.amount = AWS.safe_parse_as(Float64, LibExpat.find(pd, "amount#string"))
    o.currencyCode = LibExpat.find(pd, "currencyCode#string")
    o
end

export ReservedInstanceLimitPriceType


type PurchaseReservedInstancesOfferingResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesId::Union{ASCIIString, Void}

    PurchaseReservedInstancesOfferingResponseType(; requestId=nothing, reservedInstancesId=nothing) =
         new(requestId, reservedInstancesId)
end
function PurchaseReservedInstancesOfferingResponseType(pd::ETree)
    o = PurchaseReservedInstancesOfferingResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesId = LibExpat.find(pd, "reservedInstancesId#string")
    o
end

export PurchaseReservedInstancesOfferingResponseType


type DescribeReservedInstancesSetItemType
    reservedInstancesId::Union{ASCIIString, Void}

    DescribeReservedInstancesSetItemType(; reservedInstancesId=nothing) =
         new(reservedInstancesId)
end
function DescribeReservedInstancesSetItemType(pd::ETree)
    o = DescribeReservedInstancesSetItemType()
    o.reservedInstancesId = LibExpat.find(pd, "reservedInstancesId#string")
    o
end

export DescribeReservedInstancesSetItemType


type PriceScheduleRequestSetItemType
    term::Union{Int64, Void}
    price::Union{Float64, Void}
    currencyCode::Union{ASCIIString, Void}

    PriceScheduleRequestSetItemType(; term=nothing, price=nothing, currencyCode=nothing) =
         new(term, price, currencyCode)
end
function PriceScheduleRequestSetItemType(pd::ETree)
    o = PriceScheduleRequestSetItemType()
    o.term = AWS.safe_parse_as(Int64, LibExpat.find(pd, "term#string"))
    o.price = AWS.safe_parse_as(Float64, LibExpat.find(pd, "price#string"))
    o.currencyCode = LibExpat.find(pd, "currencyCode#string")
    o
end

export PriceScheduleRequestSetItemType


type CancelReservedInstancesListingType
    reservedInstancesListingId::Union{ASCIIString, Void}

    CancelReservedInstancesListingType(; reservedInstancesListingId=nothing) =
         new(reservedInstancesListingId)
end
function CancelReservedInstancesListingType(pd::ETree)
    o = CancelReservedInstancesListingType()
    o.reservedInstancesListingId = LibExpat.find(pd, "reservedInstancesListingId#string")
    o
end

export CancelReservedInstancesListingType


type DescribeReservedInstancesListingSetItemType
    reservedInstancesListingId::Union{ASCIIString, Void}

    DescribeReservedInstancesListingSetItemType(; reservedInstancesListingId=nothing) =
         new(reservedInstancesListingId)
end
function DescribeReservedInstancesListingSetItemType(pd::ETree)
    o = DescribeReservedInstancesListingSetItemType()
    o.reservedInstancesListingId = LibExpat.find(pd, "reservedInstancesListingId#string")
    o
end

export DescribeReservedInstancesListingSetItemType


type InstanceCountsSetItemType
    state::Union{ASCIIString, Void}
    instanceCount::Union{Int64, Void}

    InstanceCountsSetItemType(; state=nothing, instanceCount=nothing) =
         new(state, instanceCount)
end
function InstanceCountsSetItemType(pd::ETree)
    o = InstanceCountsSetItemType()
    o.state = LibExpat.find(pd, "state#string")
    o.instanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCount#string"))
    o
end

export InstanceCountsSetItemType


type PriceScheduleSetItemType
    term::Union{Int64, Void}
    price::Union{Float64, Void}
    currencyCode::Union{ASCIIString, Void}
    active::Union{Bool, Void}

    PriceScheduleSetItemType(; term=nothing, price=nothing, currencyCode=nothing, active=nothing) =
         new(term, price, currencyCode, active)
end
function PriceScheduleSetItemType(pd::ETree)
    o = PriceScheduleSetItemType()
    o.term = AWS.safe_parse_as(Int64, LibExpat.find(pd, "term#string"))
    o.price = AWS.safe_parse_as(Float64, LibExpat.find(pd, "price#string"))
    o.currencyCode = LibExpat.find(pd, "currencyCode#string")
    o.active = AWS.safe_parse_as(Bool, LibExpat.find(pd, "active#string"))
    o
end

export PriceScheduleSetItemType


type MonitorInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}

    MonitorInstancesType(; instancesSet=nothing) =
         new(instancesSet)
end
function MonitorInstancesType(pd::ETree)
    o = MonitorInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o
end

export MonitorInstancesType


type MonitorInstancesSetItemType
    instanceId::Union{ASCIIString, Void}

    MonitorInstancesSetItemType(; instanceId=nothing) =
         new(instanceId)
end
function MonitorInstancesSetItemType(pd::ETree)
    o = MonitorInstancesSetItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o
end

export MonitorInstancesSetItemType


type InstanceMonitoringStateType
    state::Union{ASCIIString, Void}

    InstanceMonitoringStateType(; state=nothing) =
         new(state)
end
function InstanceMonitoringStateType(pd::ETree)
    o = InstanceMonitoringStateType()
    o.state = LibExpat.find(pd, "state#string")
    o
end

export InstanceMonitoringStateType


type AttachmentType
    vpcId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}

    AttachmentType(; vpcId=nothing, state=nothing) =
         new(vpcId, state)
end
function AttachmentType(pd::ETree)
    o = AttachmentType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.state = LibExpat.find(pd, "state#string")
    o
end

export AttachmentType


type VpnConnectionOptionsResponseType
    staticRoutesOnly::Union{Bool, Void}

    VpnConnectionOptionsResponseType(; staticRoutesOnly=nothing) =
         new(staticRoutesOnly)
end
function VpnConnectionOptionsResponseType(pd::ETree)
    o = VpnConnectionOptionsResponseType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, LibExpat.find(pd, "staticRoutesOnly#string"))
    o
end

export VpnConnectionOptionsResponseType


type VpnStaticRouteType
    destinationCidrBlock::Union{ASCIIString, Void}
    source::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}

    VpnStaticRouteType(; destinationCidrBlock=nothing, source=nothing, state=nothing) =
         new(destinationCidrBlock, source, state)
end
function VpnStaticRouteType(pd::ETree)
    o = VpnStaticRouteType()
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o.source = LibExpat.find(pd, "source#string")
    o.state = LibExpat.find(pd, "state#string")
    o
end

export VpnStaticRouteType


type VpnTunnelTelemetryType
    outsideIpAddress::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    lastStatusChange::Union{Base.Dates.DateTime, Void}
    statusMessage::Union{ASCIIString, Void}
    acceptedRouteCount::Union{Int64, Void}

    VpnTunnelTelemetryType(; outsideIpAddress=nothing, status=nothing, lastStatusChange=nothing, statusMessage=nothing, acceptedRouteCount=nothing) =
         new(outsideIpAddress, status, lastStatusChange, statusMessage, acceptedRouteCount)
end
function VpnTunnelTelemetryType(pd::ETree)
    o = VpnTunnelTelemetryType()
    o.outsideIpAddress = LibExpat.find(pd, "outsideIpAddress#string")
    o.status = LibExpat.find(pd, "status#string")
    o.lastStatusChange = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "lastStatusChange#string"))
    o.statusMessage = LibExpat.find(pd, "statusMessage#string")
    o.acceptedRouteCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "acceptedRouteCount#string"))
    o
end

export VpnTunnelTelemetryType


type CustomerGatewayIdSetItemType
    customerGatewayId::Union{ASCIIString, Void}

    CustomerGatewayIdSetItemType(; customerGatewayId=nothing) =
         new(customerGatewayId)
end
function CustomerGatewayIdSetItemType(pd::ETree)
    o = CustomerGatewayIdSetItemType()
    o.customerGatewayId = LibExpat.find(pd, "customerGatewayId#string")
    o
end

export CustomerGatewayIdSetItemType


type VpnGatewayIdSetItemType
    vpnGatewayId::Union{ASCIIString, Void}

    VpnGatewayIdSetItemType(; vpnGatewayId=nothing) =
         new(vpnGatewayId)
end
function VpnGatewayIdSetItemType(pd::ETree)
    o = VpnGatewayIdSetItemType()
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o
end

export VpnGatewayIdSetItemType


type VpnConnectionIdSetItemType
    vpnConnectionId::Union{ASCIIString, Void}

    VpnConnectionIdSetItemType(; vpnConnectionId=nothing) =
         new(vpnConnectionId)
end
function VpnConnectionIdSetItemType(pd::ETree)
    o = VpnConnectionIdSetItemType()
    o.vpnConnectionId = LibExpat.find(pd, "vpnConnectionId#string")
    o
end

export VpnConnectionIdSetItemType


type VpcIdSetItemType
    vpcId::Union{ASCIIString, Void}

    VpcIdSetItemType(; vpcId=nothing) =
         new(vpcId)
end
function VpcIdSetItemType(pd::ETree)
    o = VpcIdSetItemType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export VpcIdSetItemType


type SubnetIdSetItemType
    subnetId::Union{ASCIIString, Void}

    SubnetIdSetItemType(; subnetId=nothing) =
         new(subnetId)
end
function SubnetIdSetItemType(pd::ETree)
    o = SubnetIdSetItemType()
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o
end

export SubnetIdSetItemType


type DhcpOptionsIdSetItemType
    dhcpOptionsId::Union{ASCIIString, Void}

    DhcpOptionsIdSetItemType(; dhcpOptionsId=nothing) =
         new(dhcpOptionsId)
end
function DhcpOptionsIdSetItemType(pd::ETree)
    o = DhcpOptionsIdSetItemType()
    o.dhcpOptionsId = LibExpat.find(pd, "dhcpOptionsId#string")
    o
end

export DhcpOptionsIdSetItemType


type DhcpConfigurationItemType
    key::Union{ASCIIString, Void}
    valueSet::Union{Vector{ASCIIString}, Void}

    DhcpConfigurationItemType(; key=nothing, valueSet=nothing) =
         new(key, valueSet)
end
function DhcpConfigurationItemType(pd::ETree)
    o = DhcpConfigurationItemType()
    o.key = LibExpat.find(pd, "key#string")
    o.valueSet = AWS.parse_vector_as(ASCIIString, "value", LibExpat.find(pd, "item/value"))
    o
end

export DhcpConfigurationItemType


type DhcpValueType
    value::Union{ASCIIString, Void}

    DhcpValueType(; value=nothing) =
         new(value)
end
function DhcpValueType(pd::ETree)
    o = DhcpValueType()
    o.value = LibExpat.find(pd, "value#string")
    o
end

export DhcpValueType


type ValueType
    value::Union{ASCIIString, Void}

    ValueType(; value=nothing) =
         new(value)
end
function ValueType(pd::ETree)
    o = ValueType()
    o.value = LibExpat.find(pd, "value#string")
    o
end

export ValueType


type CreateCustomerGatewayType
    _type::Union{ASCIIString, Void}
    ipAddress::Union{ASCIIString, Void}
    bgpAsn::Union{Int64, Void}

    CreateCustomerGatewayType(; _type=nothing, ipAddress=nothing, bgpAsn=nothing) =
         new(_type, ipAddress, bgpAsn)
end
function CreateCustomerGatewayType(pd::ETree)
    o = CreateCustomerGatewayType()
    o._type = LibExpat.find(pd, "type#string")
    o.ipAddress = LibExpat.find(pd, "ipAddress#string")
    o.bgpAsn = AWS.safe_parse_as(Int64, LibExpat.find(pd, "bgpAsn#string"))
    o
end

export CreateCustomerGatewayType


type DeleteCustomerGatewayType
    customerGatewayId::Union{ASCIIString, Void}

    DeleteCustomerGatewayType(; customerGatewayId=nothing) =
         new(customerGatewayId)
end
function DeleteCustomerGatewayType(pd::ETree)
    o = DeleteCustomerGatewayType()
    o.customerGatewayId = LibExpat.find(pd, "customerGatewayId#string")
    o
end

export DeleteCustomerGatewayType


type DeleteCustomerGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteCustomerGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteCustomerGatewayResponseType(pd::ETree)
    o = DeleteCustomerGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteCustomerGatewayResponseType


type CreateVpnGatewayType
    _type::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}

    CreateVpnGatewayType(; _type=nothing, availabilityZone=nothing) =
         new(_type, availabilityZone)
end
function CreateVpnGatewayType(pd::ETree)
    o = CreateVpnGatewayType()
    o._type = LibExpat.find(pd, "type#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o
end

export CreateVpnGatewayType


type DeleteVpnGatewayType
    vpnGatewayId::Union{ASCIIString, Void}

    DeleteVpnGatewayType(; vpnGatewayId=nothing) =
         new(vpnGatewayId)
end
function DeleteVpnGatewayType(pd::ETree)
    o = DeleteVpnGatewayType()
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o
end

export DeleteVpnGatewayType


type DeleteVpnGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteVpnGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnGatewayResponseType(pd::ETree)
    o = DeleteVpnGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteVpnGatewayResponseType


type VpnConnectionOptionsRequestType
    staticRoutesOnly::Union{Bool, Void}

    VpnConnectionOptionsRequestType(; staticRoutesOnly=nothing) =
         new(staticRoutesOnly)
end
function VpnConnectionOptionsRequestType(pd::ETree)
    o = VpnConnectionOptionsRequestType()
    o.staticRoutesOnly = AWS.safe_parse_as(Bool, LibExpat.find(pd, "staticRoutesOnly#string"))
    o
end

export VpnConnectionOptionsRequestType


type CreateVpnConnectionRouteType
    vpnConnectionId::Union{ASCIIString, Void}
    destinationCidrBlock::Union{ASCIIString, Void}

    CreateVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) =
         new(vpnConnectionId, destinationCidrBlock)
end
function CreateVpnConnectionRouteType(pd::ETree)
    o = CreateVpnConnectionRouteType()
    o.vpnConnectionId = LibExpat.find(pd, "vpnConnectionId#string")
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o
end

export CreateVpnConnectionRouteType


type CreateVpnConnectionRouteResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CreateVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateVpnConnectionRouteResponseType(pd::ETree)
    o = CreateVpnConnectionRouteResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CreateVpnConnectionRouteResponseType


type DeleteVpnConnectionRouteType
    vpnConnectionId::Union{ASCIIString, Void}
    destinationCidrBlock::Union{ASCIIString, Void}

    DeleteVpnConnectionRouteType(; vpnConnectionId=nothing, destinationCidrBlock=nothing) =
         new(vpnConnectionId, destinationCidrBlock)
end
function DeleteVpnConnectionRouteType(pd::ETree)
    o = DeleteVpnConnectionRouteType()
    o.vpnConnectionId = LibExpat.find(pd, "vpnConnectionId#string")
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o
end

export DeleteVpnConnectionRouteType


type DeleteVpnConnectionRouteResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteVpnConnectionRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnConnectionRouteResponseType(pd::ETree)
    o = DeleteVpnConnectionRouteResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteVpnConnectionRouteResponseType


type DeleteVpnConnectionType
    vpnConnectionId::Union{ASCIIString, Void}

    DeleteVpnConnectionType(; vpnConnectionId=nothing) =
         new(vpnConnectionId)
end
function DeleteVpnConnectionType(pd::ETree)
    o = DeleteVpnConnectionType()
    o.vpnConnectionId = LibExpat.find(pd, "vpnConnectionId#string")
    o
end

export DeleteVpnConnectionType


type DeleteVpnConnectionResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteVpnConnectionResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpnConnectionResponseType(pd::ETree)
    o = DeleteVpnConnectionResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteVpnConnectionResponseType


type AttachVpnGatewayType
    vpnGatewayId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    AttachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) =
         new(vpnGatewayId, vpcId)
end
function AttachVpnGatewayType(pd::ETree)
    o = AttachVpnGatewayType()
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export AttachVpnGatewayType


type DetachVpnGatewayType
    vpnGatewayId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    DetachVpnGatewayType(; vpnGatewayId=nothing, vpcId=nothing) =
         new(vpnGatewayId, vpcId)
end
function DetachVpnGatewayType(pd::ETree)
    o = DetachVpnGatewayType()
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export DetachVpnGatewayType


type DetachVpnGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DetachVpnGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachVpnGatewayResponseType(pd::ETree)
    o = DetachVpnGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DetachVpnGatewayResponseType


type CreateVpcType
    cidrBlock::Union{ASCIIString, Void}
    instanceTenancy::Union{ASCIIString, Void}

    CreateVpcType(; cidrBlock=nothing, instanceTenancy=nothing) =
         new(cidrBlock, instanceTenancy)
end
function CreateVpcType(pd::ETree)
    o = CreateVpcType()
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.instanceTenancy = LibExpat.find(pd, "instanceTenancy#string")
    o
end

export CreateVpcType


type DeleteVpcType
    vpcId::Union{ASCIIString, Void}

    DeleteVpcType(; vpcId=nothing) =
         new(vpcId)
end
function DeleteVpcType(pd::ETree)
    o = DeleteVpcType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export DeleteVpcType


type DeleteVpcResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteVpcResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteVpcResponseType(pd::ETree)
    o = DeleteVpcResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteVpcResponseType


type CreateSubnetType
    vpcId::Union{ASCIIString, Void}
    cidrBlock::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}

    CreateSubnetType(; vpcId=nothing, cidrBlock=nothing, availabilityZone=nothing) =
         new(vpcId, cidrBlock, availabilityZone)
end
function CreateSubnetType(pd::ETree)
    o = CreateSubnetType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o
end

export CreateSubnetType


type DeleteSubnetType
    subnetId::Union{ASCIIString, Void}

    DeleteSubnetType(; subnetId=nothing) =
         new(subnetId)
end
function DeleteSubnetType(pd::ETree)
    o = DeleteSubnetType()
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o
end

export DeleteSubnetType


type DeleteSubnetResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteSubnetResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSubnetResponseType(pd::ETree)
    o = DeleteSubnetResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteSubnetResponseType


type DeleteDhcpOptionsType
    dhcpOptionsId::Union{ASCIIString, Void}

    DeleteDhcpOptionsType(; dhcpOptionsId=nothing) =
         new(dhcpOptionsId)
end
function DeleteDhcpOptionsType(pd::ETree)
    o = DeleteDhcpOptionsType()
    o.dhcpOptionsId = LibExpat.find(pd, "dhcpOptionsId#string")
    o
end

export DeleteDhcpOptionsType


type DeleteDhcpOptionsResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteDhcpOptionsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteDhcpOptionsResponseType(pd::ETree)
    o = DeleteDhcpOptionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteDhcpOptionsResponseType


type AssociateDhcpOptionsType
    dhcpOptionsId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    AssociateDhcpOptionsType(; dhcpOptionsId=nothing, vpcId=nothing) =
         new(dhcpOptionsId, vpcId)
end
function AssociateDhcpOptionsType(pd::ETree)
    o = AssociateDhcpOptionsType()
    o.dhcpOptionsId = LibExpat.find(pd, "dhcpOptionsId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export AssociateDhcpOptionsType


type AssociateDhcpOptionsResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    AssociateDhcpOptionsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AssociateDhcpOptionsResponseType(pd::ETree)
    o = AssociateDhcpOptionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export AssociateDhcpOptionsResponseType


type SpotInstanceStateFaultType
    code::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}

    SpotInstanceStateFaultType(; code=nothing, message=nothing) =
         new(code, message)
end
function SpotInstanceStateFaultType(pd::ETree)
    o = SpotInstanceStateFaultType()
    o.code = LibExpat.find(pd, "code#string")
    o.message = LibExpat.find(pd, "message#string")
    o
end

export SpotInstanceStateFaultType


type SpotInstanceStatusMessageType
    code::Union{ASCIIString, Void}
    updateTime::Union{Base.Dates.DateTime, Void}
    message::Union{ASCIIString, Void}

    SpotInstanceStatusMessageType(; code=nothing, updateTime=nothing, message=nothing) =
         new(code, updateTime, message)
end
function SpotInstanceStatusMessageType(pd::ETree)
    o = SpotInstanceStatusMessageType()
    o.code = LibExpat.find(pd, "code#string")
    o.updateTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "updateTime#string"))
    o.message = LibExpat.find(pd, "message#string")
    o
end

export SpotInstanceStatusMessageType


type SpotInstanceRequestIdSetItemType
    spotInstanceRequestId::Union{ASCIIString, Void}

    SpotInstanceRequestIdSetItemType(; spotInstanceRequestId=nothing) =
         new(spotInstanceRequestId)
end
function SpotInstanceRequestIdSetItemType(pd::ETree)
    o = SpotInstanceRequestIdSetItemType()
    o.spotInstanceRequestId = LibExpat.find(pd, "spotInstanceRequestId#string")
    o
end

export SpotInstanceRequestIdSetItemType


type CancelSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union{Vector{ASCIIString}, Void}

    CancelSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing) =
         new(spotInstanceRequestIdSet)
end
function CancelSpotInstanceRequestsType(pd::ETree)
    o = CancelSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(ASCIIString, "spotInstanceRequestId", LibExpat.find(pd, "item/spotInstanceRequestId"))
    o
end

export CancelSpotInstanceRequestsType


type CancelSpotInstanceRequestsResponseSetItemType
    spotInstanceRequestId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}

    CancelSpotInstanceRequestsResponseSetItemType(; spotInstanceRequestId=nothing, state=nothing) =
         new(spotInstanceRequestId, state)
end
function CancelSpotInstanceRequestsResponseSetItemType(pd::ETree)
    o = CancelSpotInstanceRequestsResponseSetItemType()
    o.spotInstanceRequestId = LibExpat.find(pd, "spotInstanceRequestId#string")
    o.state = LibExpat.find(pd, "state#string")
    o
end

export CancelSpotInstanceRequestsResponseSetItemType


type InstanceTypeSetItemType
    instanceType::Union{ASCIIString, Void}

    InstanceTypeSetItemType(; instanceType=nothing) =
         new(instanceType)
end
function InstanceTypeSetItemType(pd::ETree)
    o = InstanceTypeSetItemType()
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o
end

export InstanceTypeSetItemType


type ProductDescriptionSetItemType
    productDescription::Union{ASCIIString, Void}

    ProductDescriptionSetItemType(; productDescription=nothing) =
         new(productDescription)
end
function ProductDescriptionSetItemType(pd::ETree)
    o = ProductDescriptionSetItemType()
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o
end

export ProductDescriptionSetItemType


type SpotPriceHistorySetItemType
    instanceType::Union{ASCIIString, Void}
    productDescription::Union{ASCIIString, Void}
    spotPrice::Union{ASCIIString, Void}
    timestamp::Union{Base.Dates.DateTime, Void}
    availabilityZone::Union{ASCIIString, Void}

    SpotPriceHistorySetItemType(; instanceType=nothing, productDescription=nothing, spotPrice=nothing, timestamp=nothing, availabilityZone=nothing) =
         new(instanceType, productDescription, spotPrice, timestamp, availabilityZone)
end
function SpotPriceHistorySetItemType(pd::ETree)
    o = SpotPriceHistorySetItemType()
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o.spotPrice = LibExpat.find(pd, "spotPrice#string")
    o.timestamp = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "timestamp#string"))
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o
end

export SpotPriceHistorySetItemType


type CreateSpotDatafeedSubscriptionType
    bucket::Union{ASCIIString, Void}
    prefix::Union{ASCIIString, Void}

    CreateSpotDatafeedSubscriptionType(; bucket=nothing, prefix=nothing) =
         new(bucket, prefix)
end
function CreateSpotDatafeedSubscriptionType(pd::ETree)
    o = CreateSpotDatafeedSubscriptionType()
    o.bucket = LibExpat.find(pd, "bucket#string")
    o.prefix = LibExpat.find(pd, "prefix#string")
    o
end

export CreateSpotDatafeedSubscriptionType


type DeleteSpotDatafeedSubscriptionResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteSpotDatafeedSubscriptionResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = DeleteSpotDatafeedSubscriptionResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteSpotDatafeedSubscriptionResponseType


type LicenseIdSetItemType
    licenseId::Union{ASCIIString, Void}

    LicenseIdSetItemType(; licenseId=nothing) =
         new(licenseId)
end
function LicenseIdSetItemType(pd::ETree)
    o = LicenseIdSetItemType()
    o.licenseId = LibExpat.find(pd, "licenseId#string")
    o
end

export LicenseIdSetItemType


type LicenseCapacitySetItemType
    capacity::Union{Int64, Void}
    instanceCapacity::Union{Int64, Void}
    state::Union{ASCIIString, Void}
    earliestAllowedDeactivationTime::Union{Base.Dates.DateTime, Void}

    LicenseCapacitySetItemType(; capacity=nothing, instanceCapacity=nothing, state=nothing, earliestAllowedDeactivationTime=nothing) =
         new(capacity, instanceCapacity, state, earliestAllowedDeactivationTime)
end
function LicenseCapacitySetItemType(pd::ETree)
    o = LicenseCapacitySetItemType()
    o.capacity = AWS.safe_parse_as(Int64, LibExpat.find(pd, "capacity#string"))
    o.instanceCapacity = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCapacity#string"))
    o.state = LibExpat.find(pd, "state#string")
    o.earliestAllowedDeactivationTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "earliestAllowedDeactivationTime#string"))
    o
end

export LicenseCapacitySetItemType


type ActivateLicenseType
    licenseId::Union{ASCIIString, Void}
    capacity::Union{Int64, Void}

    ActivateLicenseType(; licenseId=nothing, capacity=nothing) =
         new(licenseId, capacity)
end
function ActivateLicenseType(pd::ETree)
    o = ActivateLicenseType()
    o.licenseId = LibExpat.find(pd, "licenseId#string")
    o.capacity = AWS.safe_parse_as(Int64, LibExpat.find(pd, "capacity#string"))
    o
end

export ActivateLicenseType


type ActivateLicenseResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ActivateLicenseResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ActivateLicenseResponseType(pd::ETree)
    o = ActivateLicenseResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ActivateLicenseResponseType


type DeactivateLicenseType
    licenseId::Union{ASCIIString, Void}
    capacity::Union{Int64, Void}

    DeactivateLicenseType(; licenseId=nothing, capacity=nothing) =
         new(licenseId, capacity)
end
function DeactivateLicenseType(pd::ETree)
    o = DeactivateLicenseType()
    o.licenseId = LibExpat.find(pd, "licenseId#string")
    o.capacity = AWS.safe_parse_as(Int64, LibExpat.find(pd, "capacity#string"))
    o
end

export DeactivateLicenseType


type DeactivateLicenseResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeactivateLicenseResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeactivateLicenseResponseType(pd::ETree)
    o = DeactivateLicenseResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeactivateLicenseResponseType


type CreatePlacementGroupType
    groupName::Union{ASCIIString, Void}
    strategy::Union{ASCIIString, Void}

    CreatePlacementGroupType(; groupName=nothing, strategy=nothing) =
         new(groupName, strategy)
end
function CreatePlacementGroupType(pd::ETree)
    o = CreatePlacementGroupType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.strategy = LibExpat.find(pd, "strategy#string")
    o
end

export CreatePlacementGroupType


type CreatePlacementGroupResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CreatePlacementGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreatePlacementGroupResponseType(pd::ETree)
    o = CreatePlacementGroupResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CreatePlacementGroupResponseType


type DeletePlacementGroupType
    groupName::Union{ASCIIString, Void}

    DeletePlacementGroupType(; groupName=nothing) =
         new(groupName)
end
function DeletePlacementGroupType(pd::ETree)
    o = DeletePlacementGroupType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export DeletePlacementGroupType


type DeletePlacementGroupResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeletePlacementGroupResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeletePlacementGroupResponseType(pd::ETree)
    o = DeletePlacementGroupResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeletePlacementGroupResponseType


type DescribePlacementGroupItemType
    groupName::Union{ASCIIString, Void}

    DescribePlacementGroupItemType(; groupName=nothing) =
         new(groupName)
end
function DescribePlacementGroupItemType(pd::ETree)
    o = DescribePlacementGroupItemType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o
end

export DescribePlacementGroupItemType


type PlacementGroupInfoType
    groupName::Union{ASCIIString, Void}
    strategy::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}

    PlacementGroupInfoType(; groupName=nothing, strategy=nothing, state=nothing) =
         new(groupName, strategy, state)
end
function PlacementGroupInfoType(pd::ETree)
    o = PlacementGroupInfoType()
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.strategy = LibExpat.find(pd, "strategy#string")
    o.state = LibExpat.find(pd, "state#string")
    o
end

export PlacementGroupInfoType


type ResourceIdSetItemType
    resourceId::Union{ASCIIString, Void}

    ResourceIdSetItemType(; resourceId=nothing) =
         new(resourceId)
end
function ResourceIdSetItemType(pd::ETree)
    o = ResourceIdSetItemType()
    o.resourceId = LibExpat.find(pd, "resourceId#string")
    o
end

export ResourceIdSetItemType


type CreateTagsResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CreateTagsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateTagsResponseType(pd::ETree)
    o = CreateTagsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CreateTagsResponseType


type TagSetItemType
    resourceId::Union{ASCIIString, Void}
    resourceType::Union{ASCIIString, Void}
    key::Union{ASCIIString, Void}
    value::Union{ASCIIString, Void}

    TagSetItemType(; resourceId=nothing, resourceType=nothing, key=nothing, value=nothing) =
         new(resourceId, resourceType, key, value)
end
function TagSetItemType(pd::ETree)
    o = TagSetItemType()
    o.resourceId = LibExpat.find(pd, "resourceId#string")
    o.resourceType = LibExpat.find(pd, "resourceType#string")
    o.key = LibExpat.find(pd, "key#string")
    o.value = LibExpat.find(pd, "value#string")
    o
end

export TagSetItemType


type DeleteTagsSetItemType
    key::Union{ASCIIString, Void}
    value::Union{ASCIIString, Void}

    DeleteTagsSetItemType(; key=nothing, value=nothing) =
         new(key, value)
end
function DeleteTagsSetItemType(pd::ETree)
    o = DeleteTagsSetItemType()
    o.key = LibExpat.find(pd, "key#string")
    o.value = LibExpat.find(pd, "value#string")
    o
end

export DeleteTagsSetItemType


type DeleteTagsResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteTagsResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteTagsResponseType(pd::ETree)
    o = DeleteTagsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteTagsResponseType


type DiskImageDetailType
    format::Union{ASCIIString, Void}
    bytes::Union{Int64, Void}
    importManifestUrl::Union{ASCIIString, Void}

    DiskImageDetailType(; format=nothing, bytes=nothing, importManifestUrl=nothing) =
         new(format, bytes, importManifestUrl)
end
function DiskImageDetailType(pd::ETree)
    o = DiskImageDetailType()
    o.format = LibExpat.find(pd, "format#string")
    o.bytes = AWS.safe_parse_as(Int64, LibExpat.find(pd, "bytes#string"))
    o.importManifestUrl = LibExpat.find(pd, "importManifestUrl#string")
    o
end

export DiskImageDetailType


type DiskImageVolumeType
    size::Union{Int64, Void}

    DiskImageVolumeType(; size=nothing) =
         new(size)
end
function DiskImageVolumeType(pd::ETree)
    o = DiskImageVolumeType()
    o.size = AWS.safe_parse_as(Int64, LibExpat.find(pd, "size#string"))
    o
end

export DiskImageVolumeType


type DiskImageVolumeDescriptionType
    size::Union{Int64, Void}
    id::Union{ASCIIString, Void}

    DiskImageVolumeDescriptionType(; size=nothing, id=nothing) =
         new(size, id)
end
function DiskImageVolumeDescriptionType(pd::ETree)
    o = DiskImageVolumeDescriptionType()
    o.size = AWS.safe_parse_as(Int64, LibExpat.find(pd, "size#string"))
    o.id = LibExpat.find(pd, "id#string")
    o
end

export DiskImageVolumeDescriptionType


type DiskImageDescriptionType
    format::Union{ASCIIString, Void}
    size::Union{Int64, Void}
    importManifestUrl::Union{ASCIIString, Void}
    checksum::Union{ASCIIString, Void}

    DiskImageDescriptionType(; format=nothing, size=nothing, importManifestUrl=nothing, checksum=nothing) =
         new(format, size, importManifestUrl, checksum)
end
function DiskImageDescriptionType(pd::ETree)
    o = DiskImageDescriptionType()
    o.format = LibExpat.find(pd, "format#string")
    o.size = AWS.safe_parse_as(Int64, LibExpat.find(pd, "size#string"))
    o.importManifestUrl = LibExpat.find(pd, "importManifestUrl#string")
    o.checksum = LibExpat.find(pd, "checksum#string")
    o
end

export DiskImageDescriptionType


type DescribeConversionTasksType
    conversionTaskIdSet::Union{Vector{ASCIIString}, Void}

    DescribeConversionTasksType(; conversionTaskIdSet=nothing) =
         new(conversionTaskIdSet)
end
function DescribeConversionTasksType(pd::ETree)
    o = DescribeConversionTasksType()
    o.conversionTaskIdSet = AWS.parse_vector_as(ASCIIString, "conversionTaskId", LibExpat.find(pd, "item/conversionTaskId"))
    o
end

export DescribeConversionTasksType


type ConversionTaskIdItemType
    conversionTaskId::Union{ASCIIString, Void}

    ConversionTaskIdItemType(; conversionTaskId=nothing) =
         new(conversionTaskId)
end
function ConversionTaskIdItemType(pd::ETree)
    o = ConversionTaskIdItemType()
    o.conversionTaskId = LibExpat.find(pd, "conversionTaskId#string")
    o
end

export ConversionTaskIdItemType


type CancelConversionTaskType
    conversionTaskId::Union{ASCIIString, Void}

    CancelConversionTaskType(; conversionTaskId=nothing) =
         new(conversionTaskId)
end
function CancelConversionTaskType(pd::ETree)
    o = CancelConversionTaskType()
    o.conversionTaskId = LibExpat.find(pd, "conversionTaskId#string")
    o
end

export CancelConversionTaskType


type CancelConversionTaskResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CancelConversionTaskResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CancelConversionTaskResponseType(pd::ETree)
    o = CancelConversionTaskResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CancelConversionTaskResponseType


type CreateInstanceExportTaskType
    description::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    targetEnvironment::Union{ASCIIString, Void}

    CreateInstanceExportTaskType(; description=nothing, instanceId=nothing, targetEnvironment=nothing) =
         new(description, instanceId, targetEnvironment)
end
function CreateInstanceExportTaskType(pd::ETree)
    o = CreateInstanceExportTaskType()
    o.description = LibExpat.find(pd, "description#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.targetEnvironment = LibExpat.find(pd, "targetEnvironment#string")
    o
end

export CreateInstanceExportTaskType


type ExportToS3TaskType
    diskImageFormat::Union{ASCIIString, Void}
    containerFormat::Union{ASCIIString, Void}
    s3Bucket::Union{ASCIIString, Void}
    s3Prefix::Union{ASCIIString, Void}

    ExportToS3TaskType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Prefix=nothing) =
         new(diskImageFormat, containerFormat, s3Bucket, s3Prefix)
end
function ExportToS3TaskType(pd::ETree)
    o = ExportToS3TaskType()
    o.diskImageFormat = LibExpat.find(pd, "diskImageFormat#string")
    o.containerFormat = LibExpat.find(pd, "containerFormat#string")
    o.s3Bucket = LibExpat.find(pd, "s3Bucket#string")
    o.s3Prefix = LibExpat.find(pd, "s3Prefix#string")
    o
end

export ExportToS3TaskType


type DescribeExportTasksType
    exportTaskIdSet::Union{Vector{ASCIIString}, Void}

    DescribeExportTasksType(; exportTaskIdSet=nothing) =
         new(exportTaskIdSet)
end
function DescribeExportTasksType(pd::ETree)
    o = DescribeExportTasksType()
    o.exportTaskIdSet = AWS.parse_vector_as(ASCIIString, "exportTaskId", LibExpat.find(pd, "item/exportTaskId"))
    o
end

export DescribeExportTasksType


type ExportTaskIdType
    exportTaskId::Union{ASCIIString, Void}

    ExportTaskIdType(; exportTaskId=nothing) =
         new(exportTaskId)
end
function ExportTaskIdType(pd::ETree)
    o = ExportTaskIdType()
    o.exportTaskId = LibExpat.find(pd, "exportTaskId#string")
    o
end

export ExportTaskIdType


type ExportTaskResponseType
    exportTaskId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    statusMessage::Union{ASCIIString, Void}

    ExportTaskResponseType(; exportTaskId=nothing, description=nothing, state=nothing, statusMessage=nothing) =
         new(exportTaskId, description, state, statusMessage)
end
function ExportTaskResponseType(pd::ETree)
    o = ExportTaskResponseType()
    o.exportTaskId = LibExpat.find(pd, "exportTaskId#string")
    o.description = LibExpat.find(pd, "description#string")
    o.state = LibExpat.find(pd, "state#string")
    o.statusMessage = LibExpat.find(pd, "statusMessage#string")
    o
end

export ExportTaskResponseType


type InstanceExportTaskResponseType
    instanceId::Union{ASCIIString, Void}
    targetEnvironment::Union{ASCIIString, Void}

    InstanceExportTaskResponseType(; instanceId=nothing, targetEnvironment=nothing) =
         new(instanceId, targetEnvironment)
end
function InstanceExportTaskResponseType(pd::ETree)
    o = InstanceExportTaskResponseType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.targetEnvironment = LibExpat.find(pd, "targetEnvironment#string")
    o
end

export InstanceExportTaskResponseType


type ExportToS3TaskResponseType
    diskImageFormat::Union{ASCIIString, Void}
    containerFormat::Union{ASCIIString, Void}
    s3Bucket::Union{ASCIIString, Void}
    s3Key::Union{ASCIIString, Void}

    ExportToS3TaskResponseType(; diskImageFormat=nothing, containerFormat=nothing, s3Bucket=nothing, s3Key=nothing) =
         new(diskImageFormat, containerFormat, s3Bucket, s3Key)
end
function ExportToS3TaskResponseType(pd::ETree)
    o = ExportToS3TaskResponseType()
    o.diskImageFormat = LibExpat.find(pd, "diskImageFormat#string")
    o.containerFormat = LibExpat.find(pd, "containerFormat#string")
    o.s3Bucket = LibExpat.find(pd, "s3Bucket#string")
    o.s3Key = LibExpat.find(pd, "s3Key#string")
    o
end

export ExportToS3TaskResponseType


type CancelExportTaskType
    exportTaskId::Union{ASCIIString, Void}

    CancelExportTaskType(; exportTaskId=nothing) =
         new(exportTaskId)
end
function CancelExportTaskType(pd::ETree)
    o = CancelExportTaskType()
    o.exportTaskId = LibExpat.find(pd, "exportTaskId#string")
    o
end

export CancelExportTaskType


type CancelExportTaskResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CancelExportTaskResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CancelExportTaskResponseType(pd::ETree)
    o = CancelExportTaskResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CancelExportTaskResponseType


type InternetGatewayAttachmentType
    vpcId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}

    InternetGatewayAttachmentType(; vpcId=nothing, state=nothing) =
         new(vpcId, state)
end
function InternetGatewayAttachmentType(pd::ETree)
    o = InternetGatewayAttachmentType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.state = LibExpat.find(pd, "state#string")
    o
end

export InternetGatewayAttachmentType


type InternetGatewayIdSetItemType
    internetGatewayId::Union{ASCIIString, Void}

    InternetGatewayIdSetItemType(; internetGatewayId=nothing) =
         new(internetGatewayId)
end
function InternetGatewayIdSetItemType(pd::ETree)
    o = InternetGatewayIdSetItemType()
    o.internetGatewayId = LibExpat.find(pd, "internetGatewayId#string")
    o
end

export InternetGatewayIdSetItemType


type DeleteInternetGatewayType
    internetGatewayId::Union{ASCIIString, Void}

    DeleteInternetGatewayType(; internetGatewayId=nothing) =
         new(internetGatewayId)
end
function DeleteInternetGatewayType(pd::ETree)
    o = DeleteInternetGatewayType()
    o.internetGatewayId = LibExpat.find(pd, "internetGatewayId#string")
    o
end

export DeleteInternetGatewayType


type DeleteInternetGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteInternetGatewayResponseType(pd::ETree)
    o = DeleteInternetGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteInternetGatewayResponseType


type AttachInternetGatewayType
    internetGatewayId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    AttachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) =
         new(internetGatewayId, vpcId)
end
function AttachInternetGatewayType(pd::ETree)
    o = AttachInternetGatewayType()
    o.internetGatewayId = LibExpat.find(pd, "internetGatewayId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export AttachInternetGatewayType


type AttachInternetGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    AttachInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AttachInternetGatewayResponseType(pd::ETree)
    o = AttachInternetGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export AttachInternetGatewayResponseType


type DetachInternetGatewayType
    internetGatewayId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}

    DetachInternetGatewayType(; internetGatewayId=nothing, vpcId=nothing) =
         new(internetGatewayId, vpcId)
end
function DetachInternetGatewayType(pd::ETree)
    o = DetachInternetGatewayType()
    o.internetGatewayId = LibExpat.find(pd, "internetGatewayId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export DetachInternetGatewayType


type DetachInternetGatewayResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DetachInternetGatewayResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachInternetGatewayResponseType(pd::ETree)
    o = DetachInternetGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DetachInternetGatewayResponseType


type CreateRouteTableType
    vpcId::Union{ASCIIString, Void}

    CreateRouteTableType(; vpcId=nothing) =
         new(vpcId)
end
function CreateRouteTableType(pd::ETree)
    o = CreateRouteTableType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export CreateRouteTableType


type RouteType
    destinationCidrBlock::Union{ASCIIString, Void}
    gatewayId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    instanceOwnerId::Union{ASCIIString, Void}
    networkInterfaceId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    origin::Union{ASCIIString, Void}

    RouteType(; destinationCidrBlock=nothing, gatewayId=nothing, instanceId=nothing, instanceOwnerId=nothing, networkInterfaceId=nothing, state=nothing, origin=nothing) =
         new(destinationCidrBlock, gatewayId, instanceId, instanceOwnerId, networkInterfaceId, state, origin)
end
function RouteType(pd::ETree)
    o = RouteType()
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o.gatewayId = LibExpat.find(pd, "gatewayId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.instanceOwnerId = LibExpat.find(pd, "instanceOwnerId#string")
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.state = LibExpat.find(pd, "state#string")
    o.origin = LibExpat.find(pd, "origin#string")
    o
end

export RouteType


type RouteTableAssociationType
    routeTableAssociationId::Union{ASCIIString, Void}
    routeTableId::Union{ASCIIString, Void}

    RouteTableAssociationType(; routeTableAssociationId=nothing, routeTableId=nothing) =
         new(routeTableAssociationId, routeTableId)
end
function RouteTableAssociationType(pd::ETree)
    o = RouteTableAssociationType()
    o.routeTableAssociationId = LibExpat.find(pd, "routeTableAssociationId#string")
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o
end

export RouteTableAssociationType


type PropagatingVgwType
    gatewayId::Union{ASCIIString, Void}

    PropagatingVgwType(; gatewayId=nothing) =
         new(gatewayId)
end
function PropagatingVgwType(pd::ETree)
    o = PropagatingVgwType()
    o.gatewayId = LibExpat.find(pd, "gatewayId#string")
    o
end

export PropagatingVgwType


type RouteTableIdSetItemType
    routeTableId::Union{ASCIIString, Void}

    RouteTableIdSetItemType(; routeTableId=nothing) =
         new(routeTableId)
end
function RouteTableIdSetItemType(pd::ETree)
    o = RouteTableIdSetItemType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o
end

export RouteTableIdSetItemType


type EnableVgwRoutePropagationRequestType
    routeTableId::Union{ASCIIString, Void}
    gatewayId::Union{ASCIIString, Void}

    EnableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) =
         new(routeTableId, gatewayId)
end
function EnableVgwRoutePropagationRequestType(pd::ETree)
    o = EnableVgwRoutePropagationRequestType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.gatewayId = LibExpat.find(pd, "gatewayId#string")
    o
end

export EnableVgwRoutePropagationRequestType


type EnableVgwRoutePropagationResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    EnableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function EnableVgwRoutePropagationResponseType(pd::ETree)
    o = EnableVgwRoutePropagationResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export EnableVgwRoutePropagationResponseType


type DisableVgwRoutePropagationRequestType
    routeTableId::Union{ASCIIString, Void}
    gatewayId::Union{ASCIIString, Void}

    DisableVgwRoutePropagationRequestType(; routeTableId=nothing, gatewayId=nothing) =
         new(routeTableId, gatewayId)
end
function DisableVgwRoutePropagationRequestType(pd::ETree)
    o = DisableVgwRoutePropagationRequestType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.gatewayId = LibExpat.find(pd, "gatewayId#string")
    o
end

export DisableVgwRoutePropagationRequestType


type DisableVgwRoutePropagationResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DisableVgwRoutePropagationResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisableVgwRoutePropagationResponseType(pd::ETree)
    o = DisableVgwRoutePropagationResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DisableVgwRoutePropagationResponseType


type DeleteRouteTableType
    routeTableId::Union{ASCIIString, Void}

    DeleteRouteTableType(; routeTableId=nothing) =
         new(routeTableId)
end
function DeleteRouteTableType(pd::ETree)
    o = DeleteRouteTableType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o
end

export DeleteRouteTableType


type DeleteRouteTableResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteRouteTableResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteRouteTableResponseType(pd::ETree)
    o = DeleteRouteTableResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteRouteTableResponseType


type AssociateRouteTableType
    routeTableId::Union{ASCIIString, Void}
    subnetId::Union{ASCIIString, Void}

    AssociateRouteTableType(; routeTableId=nothing, subnetId=nothing) =
         new(routeTableId, subnetId)
end
function AssociateRouteTableType(pd::ETree)
    o = AssociateRouteTableType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o
end

export AssociateRouteTableType


type AssociateRouteTableResponseType
    requestId::Union{ASCIIString, Void}
    associationId::Union{ASCIIString, Void}

    AssociateRouteTableResponseType(; requestId=nothing, associationId=nothing) =
         new(requestId, associationId)
end
function AssociateRouteTableResponseType(pd::ETree)
    o = AssociateRouteTableResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.associationId = LibExpat.find(pd, "associationId#string")
    o
end

export AssociateRouteTableResponseType


type ReplaceRouteTableAssociationType
    associationId::Union{ASCIIString, Void}
    routeTableId::Union{ASCIIString, Void}

    ReplaceRouteTableAssociationType(; associationId=nothing, routeTableId=nothing) =
         new(associationId, routeTableId)
end
function ReplaceRouteTableAssociationType(pd::ETree)
    o = ReplaceRouteTableAssociationType()
    o.associationId = LibExpat.find(pd, "associationId#string")
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o
end

export ReplaceRouteTableAssociationType


type ReplaceRouteTableAssociationResponseType
    requestId::Union{ASCIIString, Void}
    newAssociationId::Union{ASCIIString, Void}

    ReplaceRouteTableAssociationResponseType(; requestId=nothing, newAssociationId=nothing) =
         new(requestId, newAssociationId)
end
function ReplaceRouteTableAssociationResponseType(pd::ETree)
    o = ReplaceRouteTableAssociationResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.newAssociationId = LibExpat.find(pd, "newAssociationId#string")
    o
end

export ReplaceRouteTableAssociationResponseType


type DisassociateRouteTableType
    associationId::Union{ASCIIString, Void}

    DisassociateRouteTableType(; associationId=nothing) =
         new(associationId)
end
function DisassociateRouteTableType(pd::ETree)
    o = DisassociateRouteTableType()
    o.associationId = LibExpat.find(pd, "associationId#string")
    o
end

export DisassociateRouteTableType


type DisassociateRouteTableResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DisassociateRouteTableResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DisassociateRouteTableResponseType(pd::ETree)
    o = DisassociateRouteTableResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DisassociateRouteTableResponseType


type CreateRouteType
    routeTableId::Union{ASCIIString, Void}
    destinationCidrBlock::Union{ASCIIString, Void}

    CreateRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function CreateRouteType(pd::ETree)
    o = CreateRouteType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o
end

export CreateRouteType


type CreateRouteResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CreateRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateRouteResponseType(pd::ETree)
    o = CreateRouteResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CreateRouteResponseType


type ReplaceRouteType
    routeTableId::Union{ASCIIString, Void}
    destinationCidrBlock::Union{ASCIIString, Void}

    ReplaceRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function ReplaceRouteType(pd::ETree)
    o = ReplaceRouteType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o
end

export ReplaceRouteType


type ReplaceRouteResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ReplaceRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReplaceRouteResponseType(pd::ETree)
    o = ReplaceRouteResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ReplaceRouteResponseType


type DeleteRouteType
    routeTableId::Union{ASCIIString, Void}
    destinationCidrBlock::Union{ASCIIString, Void}

    DeleteRouteType(; routeTableId=nothing, destinationCidrBlock=nothing) =
         new(routeTableId, destinationCidrBlock)
end
function DeleteRouteType(pd::ETree)
    o = DeleteRouteType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.destinationCidrBlock = LibExpat.find(pd, "destinationCidrBlock#string")
    o
end

export DeleteRouteType


type DeleteRouteResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteRouteResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteRouteResponseType(pd::ETree)
    o = DeleteRouteResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteRouteResponseType


type CreateNetworkAclType
    vpcId::Union{ASCIIString, Void}

    CreateNetworkAclType(; vpcId=nothing) =
         new(vpcId)
end
function CreateNetworkAclType(pd::ETree)
    o = CreateNetworkAclType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o
end

export CreateNetworkAclType


type IcmpTypeCodeType
    code::Union{Int64, Void}
    _type::Union{Int64, Void}

    IcmpTypeCodeType(; code=nothing, _type=nothing) =
         new(code, _type)
end
function IcmpTypeCodeType(pd::ETree)
    o = IcmpTypeCodeType()
    o.code = AWS.safe_parse_as(Int64, LibExpat.find(pd, "code#string"))
    o._type = AWS.safe_parse_as(Int64, LibExpat.find(pd, "type#string"))
    o
end

export IcmpTypeCodeType


type PortRangeType
    from::Union{Int64, Void}
    to::Union{Int64, Void}

    PortRangeType(; from=nothing, to=nothing) =
         new(from, to)
end
function PortRangeType(pd::ETree)
    o = PortRangeType()
    o.from = AWS.safe_parse_as(Int64, LibExpat.find(pd, "from#string"))
    o.to = AWS.safe_parse_as(Int64, LibExpat.find(pd, "to#string"))
    o
end

export PortRangeType


type NetworkAclAssociationType
    networkAclAssociationId::Union{ASCIIString, Void}
    networkAclId::Union{ASCIIString, Void}
    subnetId::Union{ASCIIString, Void}

    NetworkAclAssociationType(; networkAclAssociationId=nothing, networkAclId=nothing, subnetId=nothing) =
         new(networkAclAssociationId, networkAclId, subnetId)
end
function NetworkAclAssociationType(pd::ETree)
    o = NetworkAclAssociationType()
    o.networkAclAssociationId = LibExpat.find(pd, "networkAclAssociationId#string")
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o
end

export NetworkAclAssociationType


type NetworkAclIdSetItemType
    networkAclId::Union{ASCIIString, Void}

    NetworkAclIdSetItemType(; networkAclId=nothing) =
         new(networkAclId)
end
function NetworkAclIdSetItemType(pd::ETree)
    o = NetworkAclIdSetItemType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o
end

export NetworkAclIdSetItemType


type DeleteNetworkAclType
    networkAclId::Union{ASCIIString, Void}

    DeleteNetworkAclType(; networkAclId=nothing) =
         new(networkAclId)
end
function DeleteNetworkAclType(pd::ETree)
    o = DeleteNetworkAclType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o
end

export DeleteNetworkAclType


type DeleteNetworkAclResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteNetworkAclResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkAclResponseType(pd::ETree)
    o = DeleteNetworkAclResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteNetworkAclResponseType


type ReplaceNetworkAclAssociationType
    associationId::Union{ASCIIString, Void}
    networkAclId::Union{ASCIIString, Void}

    ReplaceNetworkAclAssociationType(; associationId=nothing, networkAclId=nothing) =
         new(associationId, networkAclId)
end
function ReplaceNetworkAclAssociationType(pd::ETree)
    o = ReplaceNetworkAclAssociationType()
    o.associationId = LibExpat.find(pd, "associationId#string")
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o
end

export ReplaceNetworkAclAssociationType


type ReplaceNetworkAclAssociationResponseType
    requestId::Union{ASCIIString, Void}
    newAssociationId::Union{ASCIIString, Void}

    ReplaceNetworkAclAssociationResponseType(; requestId=nothing, newAssociationId=nothing) =
         new(requestId, newAssociationId)
end
function ReplaceNetworkAclAssociationResponseType(pd::ETree)
    o = ReplaceNetworkAclAssociationResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.newAssociationId = LibExpat.find(pd, "newAssociationId#string")
    o
end

export ReplaceNetworkAclAssociationResponseType


type CreateNetworkAclEntryResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    CreateNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function CreateNetworkAclEntryResponseType(pd::ETree)
    o = CreateNetworkAclEntryResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export CreateNetworkAclEntryResponseType


type ReplaceNetworkAclEntryResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ReplaceNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReplaceNetworkAclEntryResponseType(pd::ETree)
    o = ReplaceNetworkAclEntryResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ReplaceNetworkAclEntryResponseType


type DeleteNetworkAclEntryType
    networkAclId::Union{ASCIIString, Void}
    ruleNumber::Union{Int64, Void}
    egress::Union{Bool, Void}

    DeleteNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, egress=nothing) =
         new(networkAclId, ruleNumber, egress)
end
function DeleteNetworkAclEntryType(pd::ETree)
    o = DeleteNetworkAclEntryType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, LibExpat.find(pd, "ruleNumber#string"))
    o.egress = AWS.safe_parse_as(Bool, LibExpat.find(pd, "egress#string"))
    o
end

export DeleteNetworkAclEntryType


type DeleteNetworkAclEntryResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteNetworkAclEntryResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkAclEntryResponseType(pd::ETree)
    o = DeleteNetworkAclEntryResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteNetworkAclEntryResponseType


type InstanceStatusDetailsSetItemType
    name::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    impairedSince::Union{Base.Dates.DateTime, Void}

    InstanceStatusDetailsSetItemType(; name=nothing, status=nothing, impairedSince=nothing) =
         new(name, status, impairedSince)
end
function InstanceStatusDetailsSetItemType(pd::ETree)
    o = InstanceStatusDetailsSetItemType()
    o.name = LibExpat.find(pd, "name#string")
    o.status = LibExpat.find(pd, "status#string")
    o.impairedSince = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "impairedSince#string"))
    o
end

export InstanceStatusDetailsSetItemType


type InstanceStatusEventType
    code::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    notBefore::Union{Base.Dates.DateTime, Void}
    notAfter::Union{Base.Dates.DateTime, Void}

    InstanceStatusEventType(; code=nothing, description=nothing, notBefore=nothing, notAfter=nothing) =
         new(code, description, notBefore, notAfter)
end
function InstanceStatusEventType(pd::ETree)
    o = InstanceStatusEventType()
    o.code = LibExpat.find(pd, "code#string")
    o.description = LibExpat.find(pd, "description#string")
    o.notBefore = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "notBefore#string"))
    o.notAfter = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "notAfter#string"))
    o
end

export InstanceStatusEventType


type ReportInstanceStatusType
    instancesSet::Union{Vector{ASCIIString}, Void}
    status::Union{ASCIIString, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    endTime::Union{Base.Dates.DateTime, Void}
    reasonCodesSet::Union{Vector{ASCIIString}, Void}
    description::Union{ASCIIString, Void}

    ReportInstanceStatusType(; instancesSet=nothing, status=nothing, startTime=nothing, endTime=nothing, reasonCodesSet=nothing, description=nothing) =
         new(instancesSet, status, startTime, endTime, reasonCodesSet, description)
end
function ReportInstanceStatusType(pd::ETree)
    o = ReportInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o.status = LibExpat.find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "startTime#string"))
    o.endTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "endTime#string"))
    o.reasonCodesSet = AWS.parse_vector_as(ASCIIString, "reasonCode", LibExpat.find(pd, "item/reasonCode"))
    o.description = LibExpat.find(pd, "description#string")
    o
end

export ReportInstanceStatusType


type ReportInstanceStatusReasonCodeSetItemType
    reasonCode::Union{ASCIIString, Void}

    ReportInstanceStatusReasonCodeSetItemType(; reasonCode=nothing) =
         new(reasonCode)
end
function ReportInstanceStatusReasonCodeSetItemType(pd::ETree)
    o = ReportInstanceStatusReasonCodeSetItemType()
    o.reasonCode = LibExpat.find(pd, "reasonCode#string")
    o
end

export ReportInstanceStatusReasonCodeSetItemType


type ReportInstanceStatusResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ReportInstanceStatusResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ReportInstanceStatusResponseType(pd::ETree)
    o = ReportInstanceStatusResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ReportInstanceStatusResponseType


type NetworkInterfaceIdSetItemType
    networkInterfaceId::Union{ASCIIString, Void}

    NetworkInterfaceIdSetItemType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function NetworkInterfaceIdSetItemType(pd::ETree)
    o = NetworkInterfaceIdSetItemType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export NetworkInterfaceIdSetItemType


type NetworkInterfaceAttachmentType
    attachmentId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    instanceOwnerId::Union{ASCIIString, Void}
    deviceIndex::Union{Int64, Void}
    status::Union{ASCIIString, Void}
    attachTime::Union{Base.Dates.DateTime, Void}
    deleteOnTermination::Union{Bool, Void}

    NetworkInterfaceAttachmentType(; attachmentId=nothing, instanceId=nothing, instanceOwnerId=nothing, deviceIndex=nothing, status=nothing, attachTime=nothing, deleteOnTermination=nothing) =
         new(attachmentId, instanceId, instanceOwnerId, deviceIndex, status, attachTime, deleteOnTermination)
end
function NetworkInterfaceAttachmentType(pd::ETree)
    o = NetworkInterfaceAttachmentType()
    o.attachmentId = LibExpat.find(pd, "attachmentId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.instanceOwnerId = LibExpat.find(pd, "instanceOwnerId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, LibExpat.find(pd, "deviceIndex#string"))
    o.status = LibExpat.find(pd, "status#string")
    o.attachTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "attachTime#string"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export NetworkInterfaceAttachmentType


type NetworkInterfaceAssociationType
    publicIp::Union{ASCIIString, Void}
    publicDnsName::Union{ASCIIString, Void}
    ipOwnerId::Union{ASCIIString, Void}
    allocationId::Union{ASCIIString, Void}
    associationId::Union{ASCIIString, Void}

    NetworkInterfaceAssociationType(; publicIp=nothing, publicDnsName=nothing, ipOwnerId=nothing, allocationId=nothing, associationId=nothing) =
         new(publicIp, publicDnsName, ipOwnerId, allocationId, associationId)
end
function NetworkInterfaceAssociationType(pd::ETree)
    o = NetworkInterfaceAssociationType()
    o.publicIp = LibExpat.find(pd, "publicIp#string")
    o.publicDnsName = LibExpat.find(pd, "publicDnsName#string")
    o.ipOwnerId = LibExpat.find(pd, "ipOwnerId#string")
    o.allocationId = LibExpat.find(pd, "allocationId#string")
    o.associationId = LibExpat.find(pd, "associationId#string")
    o
end

export NetworkInterfaceAssociationType


type DeleteNetworkInterfaceType
    networkInterfaceId::Union{ASCIIString, Void}

    DeleteNetworkInterfaceType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function DeleteNetworkInterfaceType(pd::ETree)
    o = DeleteNetworkInterfaceType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export DeleteNetworkInterfaceType


type DeleteNetworkInterfaceResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DeleteNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DeleteNetworkInterfaceResponseType(pd::ETree)
    o = DeleteNetworkInterfaceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DeleteNetworkInterfaceResponseType


type AttachNetworkInterfaceType
    networkInterfaceId::Union{ASCIIString, Void}
    instanceId::Union{ASCIIString, Void}
    deviceIndex::Union{Int64, Void}

    AttachNetworkInterfaceType(; networkInterfaceId=nothing, instanceId=nothing, deviceIndex=nothing) =
         new(networkInterfaceId, instanceId, deviceIndex)
end
function AttachNetworkInterfaceType(pd::ETree)
    o = AttachNetworkInterfaceType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, LibExpat.find(pd, "deviceIndex#string"))
    o
end

export AttachNetworkInterfaceType


type AttachNetworkInterfaceResponseType
    requestId::Union{ASCIIString, Void}
    attachmentId::Union{ASCIIString, Void}

    AttachNetworkInterfaceResponseType(; requestId=nothing, attachmentId=nothing) =
         new(requestId, attachmentId)
end
function AttachNetworkInterfaceResponseType(pd::ETree)
    o = AttachNetworkInterfaceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.attachmentId = LibExpat.find(pd, "attachmentId#string")
    o
end

export AttachNetworkInterfaceResponseType


type DetachNetworkInterfaceType
    attachmentId::Union{ASCIIString, Void}
    force::Union{Bool, Void}

    DetachNetworkInterfaceType(; attachmentId=nothing, force=nothing) =
         new(attachmentId, force)
end
function DetachNetworkInterfaceType(pd::ETree)
    o = DetachNetworkInterfaceType()
    o.attachmentId = LibExpat.find(pd, "attachmentId#string")
    o.force = AWS.safe_parse_as(Bool, LibExpat.find(pd, "force#string"))
    o
end

export DetachNetworkInterfaceType


type DetachNetworkInterfaceResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    DetachNetworkInterfaceResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function DetachNetworkInterfaceResponseType(pd::ETree)
    o = DetachNetworkInterfaceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export DetachNetworkInterfaceResponseType


type DescribeNetworkInterfaceAttributeType
    networkInterfaceId::Union{ASCIIString, Void}

    DescribeNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeType(pd::ETree)
    o = DescribeNetworkInterfaceAttributeType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export DescribeNetworkInterfaceAttributeType


type DescribeNetworkInterfaceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    networkInterfaceId::Union{ASCIIString, Void}

    DescribeNetworkInterfaceAttributeResponseType(; requestId=nothing, networkInterfaceId=nothing) =
         new(requestId, networkInterfaceId)
end
function DescribeNetworkInterfaceAttributeResponseType(pd::ETree)
    o = DescribeNetworkInterfaceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export DescribeNetworkInterfaceAttributeResponseType


type ModifyNetworkInterfaceAttributeType
    networkInterfaceId::Union{ASCIIString, Void}

    ModifyNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function ModifyNetworkInterfaceAttributeType(pd::ETree)
    o = ModifyNetworkInterfaceAttributeType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export ModifyNetworkInterfaceAttributeType


type ModifyNetworkInterfaceAttachmentType
    attachmentId::Union{ASCIIString, Void}
    deleteOnTermination::Union{Bool, Void}

    ModifyNetworkInterfaceAttachmentType(; attachmentId=nothing, deleteOnTermination=nothing) =
         new(attachmentId, deleteOnTermination)
end
function ModifyNetworkInterfaceAttachmentType(pd::ETree)
    o = ModifyNetworkInterfaceAttachmentType()
    o.attachmentId = LibExpat.find(pd, "attachmentId#string")
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o
end

export ModifyNetworkInterfaceAttachmentType


type ModifyNetworkInterfaceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifyNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyNetworkInterfaceAttributeResponseType(pd::ETree)
    o = ModifyNetworkInterfaceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifyNetworkInterfaceAttributeResponseType


type ResetNetworkInterfaceAttributeType
    networkInterfaceId::Union{ASCIIString, Void}

    ResetNetworkInterfaceAttributeType(; networkInterfaceId=nothing) =
         new(networkInterfaceId)
end
function ResetNetworkInterfaceAttributeType(pd::ETree)
    o = ResetNetworkInterfaceAttributeType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o
end

export ResetNetworkInterfaceAttributeType


type ResetNetworkInterfaceAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ResetNetworkInterfaceAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ResetNetworkInterfaceAttributeResponseType(pd::ETree)
    o = ResetNetworkInterfaceAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ResetNetworkInterfaceAttributeResponseType


type AssignPrivateIpAddressesType
    networkInterfaceId::Union{ASCIIString, Void}
    privateIpAddressesSet::Union{Vector{ASCIIString}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}
    allowReassignment::Union{Bool, Void}

    AssignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing, allowReassignment=nothing) =
         new(networkInterfaceId, privateIpAddressesSet, secondaryPrivateIpAddressCount, allowReassignment)
end
function AssignPrivateIpAddressesType(pd::ETree)
    o = AssignPrivateIpAddressesType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.privateIpAddressesSet = AWS.parse_vector_as(ASCIIString, "privateIpAddress", LibExpat.find(pd, "item/privateIpAddress"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "secondaryPrivateIpAddressCount#string"))
    o.allowReassignment = AWS.safe_parse_as(Bool, LibExpat.find(pd, "allowReassignment#string"))
    o
end

export AssignPrivateIpAddressesType


type AssignPrivateIpAddressesResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    AssignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function AssignPrivateIpAddressesResponseType(pd::ETree)
    o = AssignPrivateIpAddressesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export AssignPrivateIpAddressesResponseType


type UnassignPrivateIpAddressesType
    networkInterfaceId::Union{ASCIIString, Void}
    privateIpAddressesSet::Union{Vector{ASCIIString}, Void}

    UnassignPrivateIpAddressesType(; networkInterfaceId=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, privateIpAddressesSet)
end
function UnassignPrivateIpAddressesType(pd::ETree)
    o = UnassignPrivateIpAddressesType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.privateIpAddressesSet = AWS.parse_vector_as(ASCIIString, "privateIpAddress", LibExpat.find(pd, "item/privateIpAddress"))
    o
end

export UnassignPrivateIpAddressesType


type UnassignPrivateIpAddressesResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    UnassignPrivateIpAddressesResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function UnassignPrivateIpAddressesResponseType(pd::ETree)
    o = UnassignPrivateIpAddressesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export UnassignPrivateIpAddressesResponseType


type AssignPrivateIpAddressesSetItemRequestType
    privateIpAddress::Union{ASCIIString, Void}

    AssignPrivateIpAddressesSetItemRequestType(; privateIpAddress=nothing) =
         new(privateIpAddress)
end
function AssignPrivateIpAddressesSetItemRequestType(pd::ETree)
    o = AssignPrivateIpAddressesSetItemRequestType()
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o
end

export AssignPrivateIpAddressesSetItemRequestType


type VolumeStatusDetailsItemType
    name::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}

    VolumeStatusDetailsItemType(; name=nothing, status=nothing) =
         new(name, status)
end
function VolumeStatusDetailsItemType(pd::ETree)
    o = VolumeStatusDetailsItemType()
    o.name = LibExpat.find(pd, "name#string")
    o.status = LibExpat.find(pd, "status#string")
    o
end

export VolumeStatusDetailsItemType


type VolumeStatusEventItemType
    description::Union{ASCIIString, Void}
    notBefore::Union{Base.Dates.DateTime, Void}
    notAfter::Union{Base.Dates.DateTime, Void}
    eventId::Union{ASCIIString, Void}
    eventType::Union{ASCIIString, Void}

    VolumeStatusEventItemType(; description=nothing, notBefore=nothing, notAfter=nothing, eventId=nothing, eventType=nothing) =
         new(description, notBefore, notAfter, eventId, eventType)
end
function VolumeStatusEventItemType(pd::ETree)
    o = VolumeStatusEventItemType()
    o.description = LibExpat.find(pd, "description#string")
    o.notBefore = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "notBefore#string"))
    o.notAfter = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "notAfter#string"))
    o.eventId = LibExpat.find(pd, "eventId#string")
    o.eventType = LibExpat.find(pd, "eventType#string")
    o
end

export VolumeStatusEventItemType


type VolumeStatusActionItemType
    description::Union{ASCIIString, Void}
    code::Union{ASCIIString, Void}
    eventId::Union{ASCIIString, Void}
    eventType::Union{ASCIIString, Void}

    VolumeStatusActionItemType(; description=nothing, code=nothing, eventId=nothing, eventType=nothing) =
         new(description, code, eventId, eventType)
end
function VolumeStatusActionItemType(pd::ETree)
    o = VolumeStatusActionItemType()
    o.description = LibExpat.find(pd, "description#string")
    o.code = LibExpat.find(pd, "code#string")
    o.eventId = LibExpat.find(pd, "eventId#string")
    o.eventType = LibExpat.find(pd, "eventType#string")
    o
end

export VolumeStatusActionItemType


type EnableVolumeIOType
    volumeId::Union{ASCIIString, Void}

    EnableVolumeIOType(; volumeId=nothing) =
         new(volumeId)
end
function EnableVolumeIOType(pd::ETree)
    o = EnableVolumeIOType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export EnableVolumeIOType


type EnableVolumeIOResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    EnableVolumeIOResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function EnableVolumeIOResponseType(pd::ETree)
    o = EnableVolumeIOResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export EnableVolumeIOResponseType


type ModifyVolumeAttributeType
    volumeId::Union{ASCIIString, Void}

    ModifyVolumeAttributeType(; volumeId=nothing) =
         new(volumeId)
end
function ModifyVolumeAttributeType(pd::ETree)
    o = ModifyVolumeAttributeType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export ModifyVolumeAttributeType


type ModifyVolumeAttributeResponseType
    requestId::Union{ASCIIString, Void}
    _return::Union{Bool, Void}

    ModifyVolumeAttributeResponseType(; requestId=nothing, _return=nothing) =
         new(requestId, _return)
end
function ModifyVolumeAttributeResponseType(pd::ETree)
    o = ModifyVolumeAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o._return = AWS.safe_parse_as(Bool, LibExpat.find(pd, "return#string"))
    o
end

export ModifyVolumeAttributeResponseType


type DescribeVolumeAttributeType
    volumeId::Union{ASCIIString, Void}

    DescribeVolumeAttributeType(; volumeId=nothing) =
         new(volumeId)
end
function DescribeVolumeAttributeType(pd::ETree)
    o = DescribeVolumeAttributeType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export DescribeVolumeAttributeType


type DescribeVolumeAttributeResponseType
    requestId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}

    DescribeVolumeAttributeResponseType(; requestId=nothing, volumeId=nothing) =
         new(requestId, volumeId)
end
function DescribeVolumeAttributeResponseType(pd::ETree)
    o = DescribeVolumeAttributeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o
end

export DescribeVolumeAttributeResponseType


type LaunchPermissionOperationType
    add::Union{Vector{LaunchPermissionItemType}, Void}
    remove::Union{Vector{LaunchPermissionItemType}, Void}

    LaunchPermissionOperationType(; add=nothing, remove=nothing) =
         new(add, remove)
end
function LaunchPermissionOperationType(pd::ETree)
    o = LaunchPermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, LibExpat.find(pd, "add/item"))
    o.remove = AWS.@parse_vector(AWS.EC2.LaunchPermissionItemType, LibExpat.find(pd, "remove/item"))
    o
end

export LaunchPermissionOperationType


type DescribeReservedInstancesResponseSetItemType
    reservedInstancesId::Union{ASCIIString, Void}
    instanceType::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    start::Union{Base.Dates.DateTime, Void}
    duration::Union{Int64, Void}
    fixedPrice::Union{Float64, Void}
    usagePrice::Union{Float64, Void}
    instanceCount::Union{Int64, Void}
    productDescription::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    instanceTenancy::Union{ASCIIString, Void}
    currencyCode::Union{ASCIIString, Void}
    offeringType::Union{ASCIIString, Void}
    recurringCharges::Union{Vector{RecurringChargesSetItemType}, Void}

    DescribeReservedInstancesResponseSetItemType(; reservedInstancesId=nothing, instanceType=nothing, availabilityZone=nothing, start=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, instanceCount=nothing, productDescription=nothing, state=nothing, tagSet=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing) =
         new(reservedInstancesId, instanceType, availabilityZone, start, duration, fixedPrice, usagePrice, instanceCount, productDescription, state, tagSet, instanceTenancy, currencyCode, offeringType, recurringCharges)
end
function DescribeReservedInstancesResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesResponseSetItemType()
    o.reservedInstancesId = LibExpat.find(pd, "reservedInstancesId#string")
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.start = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "start#string"))
    o.duration = AWS.safe_parse_as(Int64, LibExpat.find(pd, "duration#string"))
    o.fixedPrice = AWS.safe_parse_as(Float64, LibExpat.find(pd, "fixedPrice#string"))
    o.usagePrice = AWS.safe_parse_as(Float64, LibExpat.find(pd, "usagePrice#string"))
    o.instanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCount#string"))
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o.state = LibExpat.find(pd, "state#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.instanceTenancy = LibExpat.find(pd, "instanceTenancy#string")
    o.currencyCode = LibExpat.find(pd, "currencyCode#string")
    o.offeringType = LibExpat.find(pd, "offeringType#string")
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, LibExpat.find(pd, "recurringCharges/item"))
    o
end

export DescribeReservedInstancesResponseSetItemType


type CancelSpotInstanceRequestsResponseType
    requestId::Union{ASCIIString, Void}
    spotInstanceRequestSet::Union{Vector{CancelSpotInstanceRequestsResponseSetItemType}, Void}

    CancelSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function CancelSpotInstanceRequestsResponseType(pd::ETree)
    o = CancelSpotInstanceRequestsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.CancelSpotInstanceRequestsResponseSetItemType, LibExpat.find(pd, "spotInstanceRequestSet/item"))
    o
end

export CancelSpotInstanceRequestsResponseType


type CreateDhcpOptionsType
    dhcpConfigurationSet::Union{Vector{DhcpConfigurationItemType}, Void}

    CreateDhcpOptionsType(; dhcpConfigurationSet=nothing) =
         new(dhcpConfigurationSet)
end
function CreateDhcpOptionsType(pd::ETree)
    o = CreateDhcpOptionsType()
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, LibExpat.find(pd, "dhcpConfigurationSet/item"))
    o
end

export CreateDhcpOptionsType


type DescribeInstanceStatusType
    instancesSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    nextToken::Union{ASCIIString, Void}
    maxResults::Union{Int64, Void}
    includeAllInstances::Union{Bool, Void}

    DescribeInstanceStatusType(; instancesSet=nothing, filterSet=nothing, nextToken=nothing, maxResults=nothing, includeAllInstances=nothing) =
         new(instancesSet, filterSet, nextToken, maxResults, includeAllInstances)
end
function DescribeInstanceStatusType(pd::ETree)
    o = DescribeInstanceStatusType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
    o.includeAllInstances = AWS.safe_parse_as(Bool, LibExpat.find(pd, "includeAllInstances#string"))
    o
end

export DescribeInstanceStatusType


type DescribePlacementGroupsType
    placementGroupSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribePlacementGroupsType(; placementGroupSet=nothing, filterSet=nothing) =
         new(placementGroupSet, filterSet)
end
function DescribePlacementGroupsType(pd::ETree)
    o = DescribePlacementGroupsType()
    o.placementGroupSet = AWS.parse_vector_as(ASCIIString, "groupName", LibExpat.find(pd, "item/groupName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribePlacementGroupsType


type RegisterImageType
    imageLocation::Union{ASCIIString, Void}
    name::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    architecture::Union{ASCIIString, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    rootDeviceName::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}

    RegisterImageType(; imageLocation=nothing, name=nothing, description=nothing, architecture=nothing, kernelId=nothing, ramdiskId=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing) =
         new(imageLocation, name, description, architecture, kernelId, ramdiskId, rootDeviceName, blockDeviceMapping)
end
function RegisterImageType(pd::ETree)
    o = RegisterImageType()
    o.imageLocation = LibExpat.find(pd, "imageLocation#string")
    o.name = LibExpat.find(pd, "name#string")
    o.description = LibExpat.find(pd, "description#string")
    o.architecture = LibExpat.find(pd, "architecture#string")
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.rootDeviceName = LibExpat.find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o
end

export RegisterImageType


type DescribeNetworkInterfacesType
    networkInterfaceIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeNetworkInterfacesType(; networkInterfaceIdSet=nothing, filterSet=nothing) =
         new(networkInterfaceIdSet, filterSet)
end
function DescribeNetworkInterfacesType(pd::ETree)
    o = DescribeNetworkInterfacesType()
    o.networkInterfaceIdSet = AWS.parse_vector_as(ASCIIString, "networkInterfaceId", LibExpat.find(pd, "item/networkInterfaceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeNetworkInterfacesType


type CreateReservedInstancesListingType
    reservedInstancesId::Union{ASCIIString, Void}
    instanceCount::Union{Int64, Void}
    priceSchedules::Union{Vector{PriceScheduleRequestSetItemType}, Void}
    clientToken::Union{ASCIIString, Void}

    CreateReservedInstancesListingType(; reservedInstancesId=nothing, instanceCount=nothing, priceSchedules=nothing, clientToken=nothing) =
         new(reservedInstancesId, instanceCount, priceSchedules, clientToken)
end
function CreateReservedInstancesListingType(pd::ETree)
    o = CreateReservedInstancesListingType()
    o.reservedInstancesId = LibExpat.find(pd, "reservedInstancesId#string")
    o.instanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCount#string"))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleRequestSetItemType, LibExpat.find(pd, "priceSchedules/item"))
    o.clientToken = LibExpat.find(pd, "clientToken#string")
    o
end

export CreateReservedInstancesListingType


type DescribeVpnGatewaysType
    vpnGatewaySet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpnGatewaysType(; vpnGatewaySet=nothing, filterSet=nothing) =
         new(vpnGatewaySet, filterSet)
end
function DescribeVpnGatewaysType(pd::ETree)
    o = DescribeVpnGatewaysType()
    o.vpnGatewaySet = AWS.parse_vector_as(ASCIIString, "vpnGatewayId", LibExpat.find(pd, "item/vpnGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeVpnGatewaysType


type DescribeVolumeStatusType
    volumeSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    maxResults::Union{Int64, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeVolumeStatusType(; volumeSet=nothing, filterSet=nothing, maxResults=nothing, nextToken=nothing) =
         new(volumeSet, filterSet, maxResults, nextToken)
end
function DescribeVolumeStatusType(pd::ETree)
    o = DescribeVolumeStatusType()
    o.volumeSet = AWS.parse_vector_as(ASCIIString, "volumeId", LibExpat.find(pd, "item/volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeVolumeStatusType


type DhcpOptionsType
    dhcpOptionsId::Union{ASCIIString, Void}
    dhcpConfigurationSet::Union{Vector{DhcpConfigurationItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    DhcpOptionsType(; dhcpOptionsId=nothing, dhcpConfigurationSet=nothing, tagSet=nothing) =
         new(dhcpOptionsId, dhcpConfigurationSet, tagSet)
end
function DhcpOptionsType(pd::ETree)
    o = DhcpOptionsType()
    o.dhcpOptionsId = LibExpat.find(pd, "dhcpOptionsId#string")
    o.dhcpConfigurationSet = AWS.@parse_vector(AWS.EC2.DhcpConfigurationItemType, LibExpat.find(pd, "dhcpConfigurationSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export DhcpOptionsType


type ImportInstanceVolumeDetailItemType
    bytesConverted::Union{Int64, Void}
    availabilityZone::Union{ASCIIString, Void}
    image::Union{DiskImageDescriptionType, Void}
    description::Union{ASCIIString, Void}
    volume::Union{DiskImageVolumeDescriptionType, Void}
    status::Union{ASCIIString, Void}
    statusMessage::Union{ASCIIString, Void}

    ImportInstanceVolumeDetailItemType(; bytesConverted=nothing, availabilityZone=nothing, image=nothing, description=nothing, volume=nothing, status=nothing, statusMessage=nothing) =
         new(bytesConverted, availabilityZone, image, description, volume, status, statusMessage)
end
function ImportInstanceVolumeDetailItemType(pd::ETree)
    o = ImportInstanceVolumeDetailItemType()
    o.bytesConverted = AWS.safe_parse_as(Int64, LibExpat.find(pd, "bytesConverted#string"))
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(LibExpat.find(pd,"image[1]")) : nothing
    o.description = LibExpat.find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(LibExpat.find(pd,"volume[1]")) : nothing
    o.status = LibExpat.find(pd, "status#string")
    o.statusMessage = LibExpat.find(pd, "statusMessage#string")
    o
end

export ImportInstanceVolumeDetailItemType


type DescribeExportTasksResponseType
    requestId::Union{ASCIIString, Void}
    exportTaskSet::Union{Vector{ExportTaskResponseType}, Void}

    DescribeExportTasksResponseType(; requestId=nothing, exportTaskSet=nothing) =
         new(requestId, exportTaskSet)
end
function DescribeExportTasksResponseType(pd::ETree)
    o = DescribeExportTasksResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.exportTaskSet = AWS.@parse_vector(AWS.EC2.ExportTaskResponseType, LibExpat.find(pd, "exportTaskSet/item"))
    o
end

export DescribeExportTasksResponseType


type DescribeSecurityGroupsType
    securityGroupSet::Union{Vector{ASCIIString}, Void}
    securityGroupIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSecurityGroupsType(; securityGroupSet=nothing, securityGroupIdSet=nothing, filterSet=nothing) =
         new(securityGroupSet, securityGroupIdSet, filterSet)
end
function DescribeSecurityGroupsType(pd::ETree)
    o = DescribeSecurityGroupsType()
    o.securityGroupSet = AWS.parse_vector_as(ASCIIString, "groupName", LibExpat.find(pd, "item/groupName"))
    o.securityGroupIdSet = AWS.parse_vector_as(ASCIIString, "groupId", LibExpat.find(pd, "item/groupId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeSecurityGroupsType


type InstanceStatusType
    status::Union{ASCIIString, Void}
    details::Union{Vector{InstanceStatusDetailsSetItemType}, Void}

    InstanceStatusType(; status=nothing, details=nothing) =
         new(status, details)
end
function InstanceStatusType(pd::ETree)
    o = InstanceStatusType()
    o.status = LibExpat.find(pd, "status#string")
    o.details = AWS.@parse_vector(AWS.EC2.InstanceStatusDetailsSetItemType, LibExpat.find(pd, "details/item"))
    o
end

export InstanceStatusType


type DescribeImagesResponseItemType
    imageId::Union{ASCIIString, Void}
    imageLocation::Union{ASCIIString, Void}
    imageState::Union{ASCIIString, Void}
    imageOwnerId::Union{ASCIIString, Void}
    isPublic::Union{Bool, Void}
    productCodes::Union{Vector{ProductCodesSetItemType}, Void}
    architecture::Union{ASCIIString, Void}
    imageType::Union{ASCIIString, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    platform::Union{ASCIIString, Void}
    stateReason::Union{StateReasonType, Void}
    imageOwnerAlias::Union{ASCIIString, Void}
    name::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    rootDeviceType::Union{ASCIIString, Void}
    rootDeviceName::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    virtualizationType::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    hypervisor::Union{ASCIIString, Void}

    DescribeImagesResponseItemType(; imageId=nothing, imageLocation=nothing, imageState=nothing, imageOwnerId=nothing, isPublic=nothing, productCodes=nothing, architecture=nothing, imageType=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, stateReason=nothing, imageOwnerAlias=nothing, name=nothing, description=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, virtualizationType=nothing, tagSet=nothing, hypervisor=nothing) =
         new(imageId, imageLocation, imageState, imageOwnerId, isPublic, productCodes, architecture, imageType, kernelId, ramdiskId, platform, stateReason, imageOwnerAlias, name, description, rootDeviceType, rootDeviceName, blockDeviceMapping, virtualizationType, tagSet, hypervisor)
end
function DescribeImagesResponseItemType(pd::ETree)
    o = DescribeImagesResponseItemType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o.imageLocation = LibExpat.find(pd, "imageLocation#string")
    o.imageState = LibExpat.find(pd, "imageState#string")
    o.imageOwnerId = LibExpat.find(pd, "imageOwnerId#string")
    o.isPublic = AWS.safe_parse_as(Bool, LibExpat.find(pd, "isPublic#string"))
    o.productCodes = AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, LibExpat.find(pd, "productCodes/item"))
    o.architecture = LibExpat.find(pd, "architecture#string")
    o.imageType = LibExpat.find(pd, "imageType#string")
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.platform = LibExpat.find(pd, "platform#string")
    o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(LibExpat.find(pd,"stateReason[1]")) : nothing
    o.imageOwnerAlias = LibExpat.find(pd, "imageOwnerAlias#string")
    o.name = LibExpat.find(pd, "name#string")
    o.description = LibExpat.find(pd, "description#string")
    o.rootDeviceType = LibExpat.find(pd, "rootDeviceType#string")
    o.rootDeviceName = LibExpat.find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o.virtualizationType = LibExpat.find(pd, "virtualizationType#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.hypervisor = LibExpat.find(pd, "hypervisor#string")
    o
end

export DescribeImagesResponseItemType


type DescribeBundleTasksType
    bundlesSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeBundleTasksType(; bundlesSet=nothing, filterSet=nothing) =
         new(bundlesSet, filterSet)
end
function DescribeBundleTasksType(pd::ETree)
    o = DescribeBundleTasksType()
    o.bundlesSet = AWS.parse_vector_as(ASCIIString, "bundleId", LibExpat.find(pd, "item/bundleId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeBundleTasksType


type DeleteTagsType
    resourcesSet::Union{Vector{ASCIIString}, Void}
    tagSet::Union{Vector{DeleteTagsSetItemType}, Void}

    DeleteTagsType(; resourcesSet=nothing, tagSet=nothing) =
         new(resourcesSet, tagSet)
end
function DeleteTagsType(pd::ETree)
    o = DeleteTagsType()
    o.resourcesSet = AWS.parse_vector_as(ASCIIString, "resourceId", LibExpat.find(pd, "item/resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.DeleteTagsSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export DeleteTagsType


type SpotDatafeedSubscriptionType
    ownerId::Union{ASCIIString, Void}
    bucket::Union{ASCIIString, Void}
    prefix::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    fault::Union{SpotInstanceStateFaultType, Void}

    SpotDatafeedSubscriptionType(; ownerId=nothing, bucket=nothing, prefix=nothing, state=nothing, fault=nothing) =
         new(ownerId, bucket, prefix, state, fault)
end
function SpotDatafeedSubscriptionType(pd::ETree)
    o = SpotDatafeedSubscriptionType()
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.bucket = LibExpat.find(pd, "bucket#string")
    o.prefix = LibExpat.find(pd, "prefix#string")
    o.state = LibExpat.find(pd, "state#string")
    o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(LibExpat.find(pd,"fault[1]")) : nothing
    o
end

export SpotDatafeedSubscriptionType


type DescribeNetworkAclsType
    networkAclIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeNetworkAclsType(; networkAclIdSet=nothing, filterSet=nothing) =
         new(networkAclIdSet, filterSet)
end
function DescribeNetworkAclsType(pd::ETree)
    o = DescribeNetworkAclsType()
    o.networkAclIdSet = AWS.parse_vector_as(ASCIIString, "networkAclId", LibExpat.find(pd, "item/networkAclId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeNetworkAclsType


type DescribeVolumesSetItemResponseType
    volumeId::Union{ASCIIString, Void}
    size::Union{ASCIIString, Void}
    snapshotId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    attachmentSet::Union{Vector{AttachmentSetItemResponseType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    volumeType::Union{ASCIIString, Void}
    iops::Union{Int64, Void}

    DescribeVolumesSetItemResponseType(; volumeId=nothing, size=nothing, snapshotId=nothing, availabilityZone=nothing, status=nothing, createTime=nothing, attachmentSet=nothing, tagSet=nothing, volumeType=nothing, iops=nothing) =
         new(volumeId, size, snapshotId, availabilityZone, status, createTime, attachmentSet, tagSet, volumeType, iops)
end
function DescribeVolumesSetItemResponseType(pd::ETree)
    o = DescribeVolumesSetItemResponseType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.size = LibExpat.find(pd, "size#string")
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.status = LibExpat.find(pd, "status#string")
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "createTime#string"))
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.AttachmentSetItemResponseType, LibExpat.find(pd, "attachmentSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.volumeType = LibExpat.find(pd, "volumeType#string")
    o.iops = AWS.safe_parse_as(Int64, LibExpat.find(pd, "iops#string"))
    o
end

export DescribeVolumesSetItemResponseType


type DescribeVolumesType
    volumeSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVolumesType(; volumeSet=nothing, filterSet=nothing) =
         new(volumeSet, filterSet)
end
function DescribeVolumesType(pd::ETree)
    o = DescribeVolumesType()
    o.volumeSet = AWS.parse_vector_as(ASCIIString, "volumeId", LibExpat.find(pd, "item/volumeId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeVolumesType


type DescribeDhcpOptionsType
    dhcpOptionsSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeDhcpOptionsType(; dhcpOptionsSet=nothing, filterSet=nothing) =
         new(dhcpOptionsSet, filterSet)
end
function DescribeDhcpOptionsType(pd::ETree)
    o = DescribeDhcpOptionsType()
    o.dhcpOptionsSet = AWS.parse_vector_as(ASCIIString, "dhcpOptionsId", LibExpat.find(pd, "item/dhcpOptionsId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeDhcpOptionsType


type CreateTagsType
    resourcesSet::Union{Vector{ASCIIString}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    CreateTagsType(; resourcesSet=nothing, tagSet=nothing) =
         new(resourcesSet, tagSet)
end
function CreateTagsType(pd::ETree)
    o = CreateTagsType()
    o.resourcesSet = AWS.parse_vector_as(ASCIIString, "resourceId", LibExpat.find(pd, "item/resourceId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export CreateTagsType


type ImportInstanceTaskDetailsType
    volumes::Union{Vector{ImportInstanceVolumeDetailItemType}, Void}
    instanceId::Union{ASCIIString, Void}
    platform::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}

    ImportInstanceTaskDetailsType(; volumes=nothing, instanceId=nothing, platform=nothing, description=nothing) =
         new(volumes, instanceId, platform, description)
end
function ImportInstanceTaskDetailsType(pd::ETree)
    o = ImportInstanceTaskDetailsType()
    o.volumes = AWS.@parse_vector(AWS.EC2.ImportInstanceVolumeDetailItemType, LibExpat.find(pd, "volumes/item"))
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.platform = LibExpat.find(pd, "platform#string")
    o.description = LibExpat.find(pd, "description#string")
    o
end

export ImportInstanceTaskDetailsType


type ConversionTaskType
    conversionTaskId::Union{ASCIIString, Void}
    expirationTime::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    statusMessage::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    ConversionTaskType(; conversionTaskId=nothing, expirationTime=nothing, state=nothing, statusMessage=nothing, tagSet=nothing) =
         new(conversionTaskId, expirationTime, state, statusMessage, tagSet)
end
function ConversionTaskType(pd::ETree)
    o = ConversionTaskType()
    o.conversionTaskId = LibExpat.find(pd, "conversionTaskId#string")
    o.expirationTime = LibExpat.find(pd, "expirationTime#string")
    o.state = LibExpat.find(pd, "state#string")
    o.statusMessage = LibExpat.find(pd, "statusMessage#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export ConversionTaskType


type CreateSpotDatafeedSubscriptionResponseType
    requestId::Union{ASCIIString, Void}
    spotDatafeedSubscription::Union{SpotDatafeedSubscriptionType, Void}

    CreateSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) =
         new(requestId, spotDatafeedSubscription)
end
function CreateSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = CreateSpotDatafeedSubscriptionResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(LibExpat.find(pd,"spotDatafeedSubscription[1]")) : nothing
    o
end

export CreateSpotDatafeedSubscriptionResponseType


type DescribeCustomerGatewaysType
    customerGatewaySet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeCustomerGatewaysType(; customerGatewaySet=nothing, filterSet=nothing) =
         new(customerGatewaySet, filterSet)
end
function DescribeCustomerGatewaysType(pd::ETree)
    o = DescribeCustomerGatewaysType()
    o.customerGatewaySet = AWS.parse_vector_as(ASCIIString, "customerGatewayId", LibExpat.find(pd, "item/customerGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeCustomerGatewaysType


type DescribePlacementGroupsResponseType
    requestId::Union{ASCIIString, Void}
    placementGroupSet::Union{Vector{PlacementGroupInfoType}, Void}

    DescribePlacementGroupsResponseType(; requestId=nothing, placementGroupSet=nothing) =
         new(requestId, placementGroupSet)
end
function DescribePlacementGroupsResponseType(pd::ETree)
    o = DescribePlacementGroupsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.placementGroupSet = AWS.@parse_vector(AWS.EC2.PlacementGroupInfoType, LibExpat.find(pd, "placementGroupSet/item"))
    o
end

export DescribePlacementGroupsResponseType


type DescribeReservedInstancesResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesSet::Union{Vector{DescribeReservedInstancesResponseSetItemType}, Void}

    DescribeReservedInstancesResponseType(; requestId=nothing, reservedInstancesSet=nothing) =
         new(requestId, reservedInstancesSet)
end
function DescribeReservedInstancesResponseType(pd::ETree)
    o = DescribeReservedInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesResponseSetItemType, LibExpat.find(pd, "reservedInstancesSet/item"))
    o
end

export DescribeReservedInstancesResponseType


type ReplaceNetworkAclEntryType
    networkAclId::Union{ASCIIString, Void}
    ruleNumber::Union{Int64, Void}
    protocol::Union{ASCIIString, Void}
    ruleAction::Union{ASCIIString, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{ASCIIString, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    ReplaceNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function ReplaceNetworkAclEntryType(pd::ETree)
    o = ReplaceNetworkAclEntryType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, LibExpat.find(pd, "ruleNumber#string"))
    o.protocol = LibExpat.find(pd, "protocol#string")
    o.ruleAction = LibExpat.find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, LibExpat.find(pd, "egress#string"))
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LibExpat.find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LibExpat.find(pd,"portRange[1]")) : nothing
    o
end

export ReplaceNetworkAclEntryType


type NetworkAclEntryType
    ruleNumber::Union{Int64, Void}
    protocol::Union{ASCIIString, Void}
    ruleAction::Union{ASCIIString, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{ASCIIString, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    NetworkAclEntryType(; ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function NetworkAclEntryType(pd::ETree)
    o = NetworkAclEntryType()
    o.ruleNumber = AWS.safe_parse_as(Int64, LibExpat.find(pd, "ruleNumber#string"))
    o.protocol = LibExpat.find(pd, "protocol#string")
    o.ruleAction = LibExpat.find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, LibExpat.find(pd, "egress#string"))
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LibExpat.find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LibExpat.find(pd,"portRange[1]")) : nothing
    o
end

export NetworkAclEntryType


type InternetGatewayType
    internetGatewayId::Union{ASCIIString, Void}
    attachmentSet::Union{Vector{InternetGatewayAttachmentType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    InternetGatewayType(; internetGatewayId=nothing, attachmentSet=nothing, tagSet=nothing) =
         new(internetGatewayId, attachmentSet, tagSet)
end
function InternetGatewayType(pd::ETree)
    o = InternetGatewayType()
    o.internetGatewayId = LibExpat.find(pd, "internetGatewayId#string")
    o.attachmentSet = AWS.@parse_vector(AWS.EC2.InternetGatewayAttachmentType, LibExpat.find(pd, "attachmentSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export InternetGatewayType


type DescribeRegionsType
    regionSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeRegionsType(; regionSet=nothing, filterSet=nothing) =
         new(regionSet, filterSet)
end
function DescribeRegionsType(pd::ETree)
    o = DescribeRegionsType()
    o.regionSet = AWS.parse_vector_as(ASCIIString, "regionName", LibExpat.find(pd, "item/regionName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeRegionsType


type DescribeSnapshotsType
    snapshotSet::Union{Vector{ASCIIString}, Void}
    ownersSet::Union{Vector{ASCIIString}, Void}
    restorableBySet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSnapshotsType(; snapshotSet=nothing, ownersSet=nothing, restorableBySet=nothing, filterSet=nothing) =
         new(snapshotSet, ownersSet, restorableBySet, filterSet)
end
function DescribeSnapshotsType(pd::ETree)
    o = DescribeSnapshotsType()
    o.snapshotSet = AWS.parse_vector_as(ASCIIString, "snapshotId", LibExpat.find(pd, "item/snapshotId"))
    o.ownersSet = AWS.parse_vector_as(ASCIIString, "owner", LibExpat.find(pd, "item/owner"))
    o.restorableBySet = AWS.parse_vector_as(ASCIIString, "user", LibExpat.find(pd, "item/user"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeSnapshotsType


type DescribeKeyPairsResponseType
    requestId::Union{ASCIIString, Void}
    keySet::Union{Vector{DescribeKeyPairsResponseItemType}, Void}

    DescribeKeyPairsResponseType(; requestId=nothing, keySet=nothing) =
         new(requestId, keySet)
end
function DescribeKeyPairsResponseType(pd::ETree)
    o = DescribeKeyPairsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.keySet = AWS.@parse_vector(AWS.EC2.DescribeKeyPairsResponseItemType, LibExpat.find(pd, "keySet/item"))
    o
end

export DescribeKeyPairsResponseType


type DescribeAvailabilityZonesResponseType
    requestId::Union{ASCIIString, Void}
    availabilityZoneInfo::Union{Vector{AvailabilityZoneItemType}, Void}

    DescribeAvailabilityZonesResponseType(; requestId=nothing, availabilityZoneInfo=nothing) =
         new(requestId, availabilityZoneInfo)
end
function DescribeAvailabilityZonesResponseType(pd::ETree)
    o = DescribeAvailabilityZonesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.availabilityZoneInfo = AWS.@parse_vector(AWS.EC2.AvailabilityZoneItemType, LibExpat.find(pd, "availabilityZoneInfo/item"))
    o
end

export DescribeAvailabilityZonesResponseType


type VpcType
    vpcId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    cidrBlock::Union{ASCIIString, Void}
    dhcpOptionsId::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    instanceTenancy::Union{ASCIIString, Void}
    isDefault::Union{Bool, Void}

    VpcType(; vpcId=nothing, state=nothing, cidrBlock=nothing, dhcpOptionsId=nothing, tagSet=nothing, instanceTenancy=nothing, isDefault=nothing) =
         new(vpcId, state, cidrBlock, dhcpOptionsId, tagSet, instanceTenancy, isDefault)
end
function VpcType(pd::ETree)
    o = VpcType()
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.state = LibExpat.find(pd, "state#string")
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.dhcpOptionsId = LibExpat.find(pd, "dhcpOptionsId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.instanceTenancy = LibExpat.find(pd, "instanceTenancy#string")
    o.isDefault = AWS.safe_parse_as(Bool, LibExpat.find(pd, "isDefault#string"))
    o
end

export VpcType


type DescribeSubnetsType
    subnetSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSubnetsType(; subnetSet=nothing, filterSet=nothing) =
         new(subnetSet, filterSet)
end
function DescribeSubnetsType(pd::ETree)
    o = DescribeSubnetsType()
    o.subnetSet = AWS.parse_vector_as(ASCIIString, "subnetId", LibExpat.find(pd, "item/subnetId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeSubnetsType


type DescribeRegionsResponseType
    requestId::Union{ASCIIString, Void}
    regionInfo::Union{Vector{RegionItemType}, Void}

    DescribeRegionsResponseType(; requestId=nothing, regionInfo=nothing) =
         new(requestId, regionInfo)
end
function DescribeRegionsResponseType(pd::ETree)
    o = DescribeRegionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.regionInfo = AWS.@parse_vector(AWS.EC2.RegionItemType, LibExpat.find(pd, "regionInfo/item"))
    o
end

export DescribeRegionsResponseType


type DescribeSpotDatafeedSubscriptionResponseType
    requestId::Union{ASCIIString, Void}
    spotDatafeedSubscription::Union{SpotDatafeedSubscriptionType, Void}

    DescribeSpotDatafeedSubscriptionResponseType(; requestId=nothing, spotDatafeedSubscription=nothing) =
         new(requestId, spotDatafeedSubscription)
end
function DescribeSpotDatafeedSubscriptionResponseType(pd::ETree)
    o = DescribeSpotDatafeedSubscriptionResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotDatafeedSubscription = length(pd["spotDatafeedSubscription"]) > 0 ?  SpotDatafeedSubscriptionType(LibExpat.find(pd,"spotDatafeedSubscription[1]")) : nothing
    o
end

export DescribeSpotDatafeedSubscriptionResponseType


type DescribeReservedInstancesType
    reservedInstancesSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    offeringType::Union{ASCIIString, Void}

    DescribeReservedInstancesType(; reservedInstancesSet=nothing, filterSet=nothing, offeringType=nothing) =
         new(reservedInstancesSet, filterSet, offeringType)
end
function DescribeReservedInstancesType(pd::ETree)
    o = DescribeReservedInstancesType()
    o.reservedInstancesSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesId", LibExpat.find(pd, "item/reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o.offeringType = LibExpat.find(pd, "offeringType#string")
    o
end

export DescribeReservedInstancesType


type DescribeReservedInstancesOfferingsType
    reservedInstancesOfferingsSet::Union{Vector{ASCIIString}, Void}
    instanceType::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    productDescription::Union{ASCIIString, Void}
    filterSet::Union{Vector{FilterType}, Void}
    instanceTenancy::Union{ASCIIString, Void}
    offeringType::Union{ASCIIString, Void}
    includeMarketplace::Union{Bool, Void}
    minDuration::Union{Int64, Void}
    maxDuration::Union{Int64, Void}
    maxInstanceCount::Union{Int64, Void}
    nextToken::Union{ASCIIString, Void}
    maxResults::Union{Int64, Void}

    DescribeReservedInstancesOfferingsType(; reservedInstancesOfferingsSet=nothing, instanceType=nothing, availabilityZone=nothing, productDescription=nothing, filterSet=nothing, instanceTenancy=nothing, offeringType=nothing, includeMarketplace=nothing, minDuration=nothing, maxDuration=nothing, maxInstanceCount=nothing, nextToken=nothing, maxResults=nothing) =
         new(reservedInstancesOfferingsSet, instanceType, availabilityZone, productDescription, filterSet, instanceTenancy, offeringType, includeMarketplace, minDuration, maxDuration, maxInstanceCount, nextToken, maxResults)
end
function DescribeReservedInstancesOfferingsType(pd::ETree)
    o = DescribeReservedInstancesOfferingsType()
    o.reservedInstancesOfferingsSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesOfferingId", LibExpat.find(pd, "item/reservedInstancesOfferingId"))
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o.instanceTenancy = LibExpat.find(pd, "instanceTenancy#string")
    o.offeringType = LibExpat.find(pd, "offeringType#string")
    o.includeMarketplace = AWS.safe_parse_as(Bool, LibExpat.find(pd, "includeMarketplace#string"))
    o.minDuration = AWS.safe_parse_as(Int64, LibExpat.find(pd, "minDuration#string"))
    o.maxDuration = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxDuration#string"))
    o.maxInstanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxInstanceCount#string"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
    o
end

export DescribeReservedInstancesOfferingsType


type DescribeImagesType
    executableBySet::Union{Vector{ASCIIString}, Void}
    imagesSet::Union{Vector{ASCIIString}, Void}
    ownersSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeImagesType(; executableBySet=nothing, imagesSet=nothing, ownersSet=nothing, filterSet=nothing) =
         new(executableBySet, imagesSet, ownersSet, filterSet)
end
function DescribeImagesType(pd::ETree)
    o = DescribeImagesType()
    o.executableBySet = AWS.parse_vector_as(ASCIIString, "user", LibExpat.find(pd, "item/user"))
    o.imagesSet = AWS.parse_vector_as(ASCIIString, "imageId", LibExpat.find(pd, "item/imageId"))
    o.ownersSet = AWS.parse_vector_as(ASCIIString, "owner", LibExpat.find(pd, "item/owner"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeImagesType


type DescribeConversionTasksResponseType
    requestId::Union{ASCIIString, Void}
    conversionTasks::Union{Vector{ConversionTaskType}, Void}

    DescribeConversionTasksResponseType(; requestId=nothing, conversionTasks=nothing) =
         new(requestId, conversionTasks)
end
function DescribeConversionTasksResponseType(pd::ETree)
    o = DescribeConversionTasksResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.conversionTasks = AWS.@parse_vector(AWS.EC2.ConversionTaskType, LibExpat.find(pd, "conversionTasks/item"))
    o
end

export DescribeConversionTasksResponseType


type DescribeAccountAttributesResponseType
    requestId::Union{ASCIIString, Void}
    accountAttributeSet::Union{Vector{AccountAttributeSetItemType}, Void}

    DescribeAccountAttributesResponseType(; requestId=nothing, accountAttributeSet=nothing) =
         new(requestId, accountAttributeSet)
end
function DescribeAccountAttributesResponseType(pd::ETree)
    o = DescribeAccountAttributesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.accountAttributeSet = AWS.@parse_vector(AWS.EC2.AccountAttributeSetItemType, LibExpat.find(pd, "accountAttributeSet/item"))
    o
end

export DescribeAccountAttributesResponseType


type CreateNetworkAclEntryType
    networkAclId::Union{ASCIIString, Void}
    ruleNumber::Union{Int64, Void}
    protocol::Union{ASCIIString, Void}
    ruleAction::Union{ASCIIString, Void}
    egress::Union{Bool, Void}
    cidrBlock::Union{ASCIIString, Void}
    icmpTypeCode::Union{IcmpTypeCodeType, Void}
    portRange::Union{PortRangeType, Void}

    CreateNetworkAclEntryType(; networkAclId=nothing, ruleNumber=nothing, protocol=nothing, ruleAction=nothing, egress=nothing, cidrBlock=nothing, icmpTypeCode=nothing, portRange=nothing) =
         new(networkAclId, ruleNumber, protocol, ruleAction, egress, cidrBlock, icmpTypeCode, portRange)
end
function CreateNetworkAclEntryType(pd::ETree)
    o = CreateNetworkAclEntryType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o.ruleNumber = AWS.safe_parse_as(Int64, LibExpat.find(pd, "ruleNumber#string"))
    o.protocol = LibExpat.find(pd, "protocol#string")
    o.ruleAction = LibExpat.find(pd, "ruleAction#string")
    o.egress = AWS.safe_parse_as(Bool, LibExpat.find(pd, "egress#string"))
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.icmpTypeCode = length(pd["icmpTypeCode"]) > 0 ?  IcmpTypeCodeType(LibExpat.find(pd,"icmpTypeCode[1]")) : nothing
    o.portRange = length(pd["portRange"]) > 0 ?  PortRangeType(LibExpat.find(pd,"portRange[1]")) : nothing
    o
end

export CreateNetworkAclEntryType


type DescribeSnapshotsSetItemResponseType
    snapshotId::Union{ASCIIString, Void}
    volumeId::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    progress::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    volumeSize::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    ownerAlias::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    DescribeSnapshotsSetItemResponseType(; snapshotId=nothing, volumeId=nothing, status=nothing, startTime=nothing, progress=nothing, ownerId=nothing, volumeSize=nothing, description=nothing, ownerAlias=nothing, tagSet=nothing) =
         new(snapshotId, volumeId, status, startTime, progress, ownerId, volumeSize, description, ownerAlias, tagSet)
end
function DescribeSnapshotsSetItemResponseType(pd::ETree)
    o = DescribeSnapshotsSetItemResponseType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.status = LibExpat.find(pd, "status#string")
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "startTime#string"))
    o.progress = LibExpat.find(pd, "progress#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.volumeSize = LibExpat.find(pd, "volumeSize#string")
    o.description = LibExpat.find(pd, "description#string")
    o.ownerAlias = LibExpat.find(pd, "ownerAlias#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export DescribeSnapshotsSetItemResponseType


type BundleInstanceTaskStorageType
    S3::Union{BundleInstanceS3StorageType, Void}

    BundleInstanceTaskStorageType(; S3=nothing) =
         new(S3)
end
function BundleInstanceTaskStorageType(pd::ETree)
    o = BundleInstanceTaskStorageType()
    o.S3 = length(pd["S3"]) > 0 ?  BundleInstanceS3StorageType(LibExpat.find(pd,"S3[1]")) : nothing
    o
end

export BundleInstanceTaskStorageType


type InstanceStatusItemType
    instanceId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    eventsSet::Union{Vector{InstanceStatusEventType}, Void}
    instanceState::Union{InstanceStateType, Void}
    systemStatus::Union{InstanceStatusType, Void}
    instanceStatus::Union{InstanceStatusType, Void}

    InstanceStatusItemType(; instanceId=nothing, availabilityZone=nothing, eventsSet=nothing, instanceState=nothing, systemStatus=nothing, instanceStatus=nothing) =
         new(instanceId, availabilityZone, eventsSet, instanceState, systemStatus, instanceStatus)
end
function InstanceStatusItemType(pd::ETree)
    o = InstanceStatusItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.eventsSet = AWS.@parse_vector(AWS.EC2.InstanceStatusEventType, LibExpat.find(pd, "eventsSet/item"))
    o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(LibExpat.find(pd,"instanceState[1]")) : nothing
    o.systemStatus = length(pd["systemStatus"]) > 0 ?  InstanceStatusType(LibExpat.find(pd,"systemStatus[1]")) : nothing
    o.instanceStatus = length(pd["instanceStatus"]) > 0 ?  InstanceStatusType(LibExpat.find(pd,"instanceStatus[1]")) : nothing
    o
end

export InstanceStatusItemType


type InstanceNetworkInterfaceSetItemRequestType
    networkInterfaceId::Union{ASCIIString, Void}
    deviceIndex::Union{Int64, Void}
    subnetId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}
    groupSet::Union{Vector{ASCIIString}, Void}
    deleteOnTermination::Union{Bool, Void}
    privateIpAddressesSet::Union{Vector{PrivateIpAddressesSetItemRequestType}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}

    InstanceNetworkInterfaceSetItemRequestType(; networkInterfaceId=nothing, deviceIndex=nothing, subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, deleteOnTermination=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) =
         new(networkInterfaceId, deviceIndex, subnetId, description, privateIpAddress, groupSet, deleteOnTermination, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function InstanceNetworkInterfaceSetItemRequestType(pd::ETree)
    o = InstanceNetworkInterfaceSetItemRequestType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.deviceIndex = AWS.safe_parse_as(Int64, LibExpat.find(pd, "deviceIndex#string"))
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.description = LibExpat.find(pd, "description#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.groupSet = AWS.parse_vector_as(ASCIIString, "groupId", LibExpat.find(pd, "item/groupId"))
    o.deleteOnTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "deleteOnTermination#string"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, LibExpat.find(pd, "privateIpAddressesSet/item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "secondaryPrivateIpAddressCount#string"))
    o
end

export InstanceNetworkInterfaceSetItemRequestType


type DescribeReservedInstancesListingsType
    reservedInstancesListingSet::Union{Vector{ASCIIString}, Void}
    reservedInstancesSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeReservedInstancesListingsType(; reservedInstancesListingSet=nothing, reservedInstancesSet=nothing, filterSet=nothing) =
         new(reservedInstancesListingSet, reservedInstancesSet, filterSet)
end
function DescribeReservedInstancesListingsType(pd::ETree)
    o = DescribeReservedInstancesListingsType()
    o.reservedInstancesListingSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesListingId", LibExpat.find(pd, "item/reservedInstancesListingId"))
    o.reservedInstancesSet = AWS.parse_vector_as(ASCIIString, "reservedInstancesId", LibExpat.find(pd, "item/reservedInstancesId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeReservedInstancesListingsType


type DescribeSpotPriceHistoryType
    startTime::Union{Base.Dates.DateTime, Void}
    endTime::Union{Base.Dates.DateTime, Void}
    instanceTypeSet::Union{Vector{ASCIIString}, Void}
    productDescriptionSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}
    availabilityZone::Union{ASCIIString, Void}
    maxResults::Union{Int64, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeSpotPriceHistoryType(; startTime=nothing, endTime=nothing, instanceTypeSet=nothing, productDescriptionSet=nothing, filterSet=nothing, availabilityZone=nothing, maxResults=nothing, nextToken=nothing) =
         new(startTime, endTime, instanceTypeSet, productDescriptionSet, filterSet, availabilityZone, maxResults, nextToken)
end
function DescribeSpotPriceHistoryType(pd::ETree)
    o = DescribeSpotPriceHistoryType()
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "startTime#string"))
    o.endTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "endTime#string"))
    o.instanceTypeSet = AWS.parse_vector_as(ASCIIString, "instanceType", LibExpat.find(pd, "item/instanceType"))
    o.productDescriptionSet = AWS.parse_vector_as(ASCIIString, "productDescription", LibExpat.find(pd, "item/productDescription"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.maxResults = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxResults#string"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeSpotPriceHistoryType


type DescribeReservedInstancesOfferingsResponseSetItemType
    reservedInstancesOfferingId::Union{ASCIIString, Void}
    instanceType::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    duration::Union{Int64, Void}
    fixedPrice::Union{Float64, Void}
    usagePrice::Union{Float64, Void}
    productDescription::Union{ASCIIString, Void}
    instanceTenancy::Union{ASCIIString, Void}
    currencyCode::Union{ASCIIString, Void}
    offeringType::Union{ASCIIString, Void}
    recurringCharges::Union{Vector{RecurringChargesSetItemType}, Void}
    marketplace::Union{Bool, Void}
    pricingDetailsSet::Union{Vector{PricingDetailsSetItemType}, Void}

    DescribeReservedInstancesOfferingsResponseSetItemType(; reservedInstancesOfferingId=nothing, instanceType=nothing, availabilityZone=nothing, duration=nothing, fixedPrice=nothing, usagePrice=nothing, productDescription=nothing, instanceTenancy=nothing, currencyCode=nothing, offeringType=nothing, recurringCharges=nothing, marketplace=nothing, pricingDetailsSet=nothing) =
         new(reservedInstancesOfferingId, instanceType, availabilityZone, duration, fixedPrice, usagePrice, productDescription, instanceTenancy, currencyCode, offeringType, recurringCharges, marketplace, pricingDetailsSet)
end
function DescribeReservedInstancesOfferingsResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesOfferingsResponseSetItemType()
    o.reservedInstancesOfferingId = LibExpat.find(pd, "reservedInstancesOfferingId#string")
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.duration = AWS.safe_parse_as(Int64, LibExpat.find(pd, "duration#string"))
    o.fixedPrice = AWS.safe_parse_as(Float64, LibExpat.find(pd, "fixedPrice#string"))
    o.usagePrice = AWS.safe_parse_as(Float64, LibExpat.find(pd, "usagePrice#string"))
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o.instanceTenancy = LibExpat.find(pd, "instanceTenancy#string")
    o.currencyCode = LibExpat.find(pd, "currencyCode#string")
    o.offeringType = LibExpat.find(pd, "offeringType#string")
    o.recurringCharges = AWS.@parse_vector(AWS.EC2.RecurringChargesSetItemType, LibExpat.find(pd, "recurringCharges/item"))
    o.marketplace = AWS.safe_parse_as(Bool, LibExpat.find(pd, "marketplace#string"))
    o.pricingDetailsSet = AWS.@parse_vector(AWS.EC2.PricingDetailsSetItemType, LibExpat.find(pd, "pricingDetailsSet/item"))
    o
end

export DescribeReservedInstancesOfferingsResponseSetItemType


type IpPermissionType
    ipProtocol::Union{ASCIIString, Void}
    fromPort::Union{Int64, Void}
    toPort::Union{Int64, Void}
    groups::Union{Vector{UserIdGroupPairType}, Void}
    ipRanges::Union{Vector{ASCIIString}, Void}

    IpPermissionType(; ipProtocol=nothing, fromPort=nothing, toPort=nothing, groups=nothing, ipRanges=nothing) =
         new(ipProtocol, fromPort, toPort, groups, ipRanges)
end
function IpPermissionType(pd::ETree)
    o = IpPermissionType()
    o.ipProtocol = LibExpat.find(pd, "ipProtocol#string")
    o.fromPort = AWS.safe_parse_as(Int64, LibExpat.find(pd, "fromPort#string"))
    o.toPort = AWS.safe_parse_as(Int64, LibExpat.find(pd, "toPort#string"))
    o.groups = AWS.@parse_vector(AWS.EC2.UserIdGroupPairType, LibExpat.find(pd, "groups/item"))
    o.ipRanges = AWS.parse_vector_as(ASCIIString, "cidrIp", LibExpat.find(pd, "item/cidrIp"))
    o
end

export IpPermissionType


type DescribeVolumesResponseType
    requestId::Union{ASCIIString, Void}
    volumeSet::Union{Vector{DescribeVolumesSetItemResponseType}, Void}

    DescribeVolumesResponseType(; requestId=nothing, volumeSet=nothing) =
         new(requestId, volumeSet)
end
function DescribeVolumesResponseType(pd::ETree)
    o = DescribeVolumesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeSet = AWS.@parse_vector(AWS.EC2.DescribeVolumesSetItemResponseType, LibExpat.find(pd, "volumeSet/item"))
    o
end

export DescribeVolumesResponseType


type DescribeSpotPriceHistoryResponseType
    requestId::Union{ASCIIString, Void}
    spotPriceHistorySet::Union{Vector{SpotPriceHistorySetItemType}, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeSpotPriceHistoryResponseType(; requestId=nothing, spotPriceHistorySet=nothing, nextToken=nothing) =
         new(requestId, spotPriceHistorySet, nextToken)
end
function DescribeSpotPriceHistoryResponseType(pd::ETree)
    o = DescribeSpotPriceHistoryResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotPriceHistorySet = AWS.@parse_vector(AWS.EC2.SpotPriceHistorySetItemType, LibExpat.find(pd, "spotPriceHistorySet/item"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeSpotPriceHistoryResponseType


type DescribeSpotInstanceRequestsType
    spotInstanceRequestIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeSpotInstanceRequestsType(; spotInstanceRequestIdSet=nothing, filterSet=nothing) =
         new(spotInstanceRequestIdSet, filterSet)
end
function DescribeSpotInstanceRequestsType(pd::ETree)
    o = DescribeSpotInstanceRequestsType()
    o.spotInstanceRequestIdSet = AWS.parse_vector_as(ASCIIString, "spotInstanceRequestId", LibExpat.find(pd, "item/spotInstanceRequestId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeSpotInstanceRequestsType


type CreateDhcpOptionsResponseType
    requestId::Union{ASCIIString, Void}
    dhcpOptions::Union{DhcpOptionsType, Void}

    CreateDhcpOptionsResponseType(; requestId=nothing, dhcpOptions=nothing) =
         new(requestId, dhcpOptions)
end
function CreateDhcpOptionsResponseType(pd::ETree)
    o = CreateDhcpOptionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.dhcpOptions = length(pd["dhcpOptions"]) > 0 ?  DhcpOptionsType(LibExpat.find(pd,"dhcpOptions[1]")) : nothing
    o
end

export CreateDhcpOptionsResponseType


type DescribeRouteTablesType
    routeTableIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeRouteTablesType(; routeTableIdSet=nothing, filterSet=nothing) =
         new(routeTableIdSet, filterSet)
end
function DescribeRouteTablesType(pd::ETree)
    o = DescribeRouteTablesType()
    o.routeTableIdSet = AWS.parse_vector_as(ASCIIString, "routeTableId", LibExpat.find(pd, "item/routeTableId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeRouteTablesType


type DescribeInternetGatewaysResponseType
    requestId::Union{ASCIIString, Void}
    internetGatewaySet::Union{Vector{InternetGatewayType}, Void}

    DescribeInternetGatewaysResponseType(; requestId=nothing, internetGatewaySet=nothing) =
         new(requestId, internetGatewaySet)
end
function DescribeInternetGatewaysResponseType(pd::ETree)
    o = DescribeInternetGatewaysResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.internetGatewaySet = AWS.@parse_vector(AWS.EC2.InternetGatewayType, LibExpat.find(pd, "internetGatewaySet/item"))
    o
end

export DescribeInternetGatewaysResponseType


type CreateInstanceExportTaskResponseType
    requestId::Union{ASCIIString, Void}
    exportTask::Union{ExportTaskResponseType, Void}

    CreateInstanceExportTaskResponseType(; requestId=nothing, exportTask=nothing) =
         new(requestId, exportTask)
end
function CreateInstanceExportTaskResponseType(pd::ETree)
    o = CreateInstanceExportTaskResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.exportTask = length(pd["exportTask"]) > 0 ?  ExportTaskResponseType(LibExpat.find(pd,"exportTask[1]")) : nothing
    o
end

export CreateInstanceExportTaskResponseType


type CreateImageType
    instanceId::Union{ASCIIString, Void}
    name::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    noReboot::Union{Bool, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}

    CreateImageType(; instanceId=nothing, name=nothing, description=nothing, noReboot=nothing, blockDeviceMapping=nothing) =
         new(instanceId, name, description, noReboot, blockDeviceMapping)
end
function CreateImageType(pd::ETree)
    o = CreateImageType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.name = LibExpat.find(pd, "name#string")
    o.description = LibExpat.find(pd, "description#string")
    o.noReboot = AWS.safe_parse_as(Bool, LibExpat.find(pd, "noReboot#string"))
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o
end

export CreateImageType


type DescribeInternetGatewaysType
    internetGatewayIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeInternetGatewaysType(; internetGatewayIdSet=nothing, filterSet=nothing) =
         new(internetGatewayIdSet, filterSet)
end
function DescribeInternetGatewaysType(pd::ETree)
    o = DescribeInternetGatewaysType()
    o.internetGatewayIdSet = AWS.parse_vector_as(ASCIIString, "internetGatewayId", LibExpat.find(pd, "item/internetGatewayId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeInternetGatewaysType


type InstanceStateChangeType
    instanceId::Union{ASCIIString, Void}
    currentState::Union{InstanceStateType, Void}
    previousState::Union{InstanceStateType, Void}

    InstanceStateChangeType(; instanceId=nothing, currentState=nothing, previousState=nothing) =
         new(instanceId, currentState, previousState)
end
function InstanceStateChangeType(pd::ETree)
    o = InstanceStateChangeType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.currentState = length(pd["currentState"]) > 0 ?  InstanceStateType(LibExpat.find(pd,"currentState[1]")) : nothing
    o.previousState = length(pd["previousState"]) > 0 ?  InstanceStateType(LibExpat.find(pd,"previousState[1]")) : nothing
    o
end

export InstanceStateChangeType


type PurchaseReservedInstancesOfferingType
    reservedInstancesOfferingId::Union{ASCIIString, Void}
    instanceCount::Union{Int64, Void}
    limitPrice::Union{ReservedInstanceLimitPriceType, Void}

    PurchaseReservedInstancesOfferingType(; reservedInstancesOfferingId=nothing, instanceCount=nothing, limitPrice=nothing) =
         new(reservedInstancesOfferingId, instanceCount, limitPrice)
end
function PurchaseReservedInstancesOfferingType(pd::ETree)
    o = PurchaseReservedInstancesOfferingType()
    o.reservedInstancesOfferingId = LibExpat.find(pd, "reservedInstancesOfferingId#string")
    o.instanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCount#string"))
    o.limitPrice = length(pd["limitPrice"]) > 0 ?  ReservedInstanceLimitPriceType(LibExpat.find(pd,"limitPrice[1]")) : nothing
    o
end

export PurchaseReservedInstancesOfferingType


type RouteTableType
    routeTableId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    routeSet::Union{Vector{RouteType}, Void}
    associationSet::Union{Vector{RouteTableAssociationType}, Void}
    propagatingVgwSet::Union{Vector{ASCIIString}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    RouteTableType(; routeTableId=nothing, vpcId=nothing, routeSet=nothing, associationSet=nothing, propagatingVgwSet=nothing, tagSet=nothing) =
         new(routeTableId, vpcId, routeSet, associationSet, propagatingVgwSet, tagSet)
end
function RouteTableType(pd::ETree)
    o = RouteTableType()
    o.routeTableId = LibExpat.find(pd, "routeTableId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.routeSet = AWS.@parse_vector(AWS.EC2.RouteType, LibExpat.find(pd, "routeSet/item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.RouteTableAssociationType, LibExpat.find(pd, "associationSet/item"))
    o.propagatingVgwSet = AWS.parse_vector_as(ASCIIString, "gatewayId", LibExpat.find(pd, "item/gatewayId"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export RouteTableType


type DescribeVpnConnectionsType
    vpnConnectionSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpnConnectionsType(; vpnConnectionSet=nothing, filterSet=nothing) =
         new(vpnConnectionSet, filterSet)
end
function DescribeVpnConnectionsType(pd::ETree)
    o = DescribeVpnConnectionsType()
    o.vpnConnectionSet = AWS.parse_vector_as(ASCIIString, "vpnConnectionId", LibExpat.find(pd, "item/vpnConnectionId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeVpnConnectionsType


type CreateNetworkInterfaceType
    subnetId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}
    groupSet::Union{Vector{ASCIIString}, Void}
    privateIpAddressesSet::Union{Vector{PrivateIpAddressesSetItemRequestType}, Void}
    secondaryPrivateIpAddressCount::Union{Int64, Void}

    CreateNetworkInterfaceType(; subnetId=nothing, description=nothing, privateIpAddress=nothing, groupSet=nothing, privateIpAddressesSet=nothing, secondaryPrivateIpAddressCount=nothing) =
         new(subnetId, description, privateIpAddress, groupSet, privateIpAddressesSet, secondaryPrivateIpAddressCount)
end
function CreateNetworkInterfaceType(pd::ETree)
    o = CreateNetworkInterfaceType()
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.description = LibExpat.find(pd, "description#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.groupSet = AWS.parse_vector_as(ASCIIString, "groupId", LibExpat.find(pd, "item/groupId"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.PrivateIpAddressesSetItemRequestType, LibExpat.find(pd, "privateIpAddressesSet/item"))
    o.secondaryPrivateIpAddressCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "secondaryPrivateIpAddressCount#string"))
    o
end

export CreateNetworkInterfaceType


type DescribeVpcsResponseType
    requestId::Union{ASCIIString, Void}
    vpcSet::Union{Vector{VpcType}, Void}

    DescribeVpcsResponseType(; requestId=nothing, vpcSet=nothing) =
         new(requestId, vpcSet)
end
function DescribeVpcsResponseType(pd::ETree)
    o = DescribeVpcsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpcSet = AWS.@parse_vector(AWS.EC2.VpcType, LibExpat.find(pd, "vpcSet/item"))
    o
end

export DescribeVpcsResponseType


type DescribeReservedInstancesListingsResponseSetItemType
    reservedInstancesListingId::Union{ASCIIString, Void}
    reservedInstancesId::Union{ASCIIString, Void}
    createDate::Union{Base.Dates.DateTime, Void}
    updateDate::Union{Base.Dates.DateTime, Void}
    status::Union{ASCIIString, Void}
    statusMessage::Union{ASCIIString, Void}
    instanceCounts::Union{Vector{InstanceCountsSetItemType}, Void}
    priceSchedules::Union{Vector{PriceScheduleSetItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    clientToken::Union{ASCIIString, Void}

    DescribeReservedInstancesListingsResponseSetItemType(; reservedInstancesListingId=nothing, reservedInstancesId=nothing, createDate=nothing, updateDate=nothing, status=nothing, statusMessage=nothing, instanceCounts=nothing, priceSchedules=nothing, tagSet=nothing, clientToken=nothing) =
         new(reservedInstancesListingId, reservedInstancesId, createDate, updateDate, status, statusMessage, instanceCounts, priceSchedules, tagSet, clientToken)
end
function DescribeReservedInstancesListingsResponseSetItemType(pd::ETree)
    o = DescribeReservedInstancesListingsResponseSetItemType()
    o.reservedInstancesListingId = LibExpat.find(pd, "reservedInstancesListingId#string")
    o.reservedInstancesId = LibExpat.find(pd, "reservedInstancesId#string")
    o.createDate = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "createDate#string"))
    o.updateDate = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "updateDate#string"))
    o.status = LibExpat.find(pd, "status#string")
    o.statusMessage = LibExpat.find(pd, "statusMessage#string")
    o.instanceCounts = AWS.@parse_vector(AWS.EC2.InstanceCountsSetItemType, LibExpat.find(pd, "instanceCounts/item"))
    o.priceSchedules = AWS.@parse_vector(AWS.EC2.PriceScheduleSetItemType, LibExpat.find(pd, "priceSchedules/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.clientToken = LibExpat.find(pd, "clientToken#string")
    o
end

export DescribeReservedInstancesListingsResponseSetItemType


type DescribeVpcsType
    vpcSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeVpcsType(; vpcSet=nothing, filterSet=nothing) =
         new(vpcSet, filterSet)
end
function DescribeVpcsType(pd::ETree)
    o = DescribeVpcsType()
    o.vpcSet = AWS.parse_vector_as(ASCIIString, "vpcId", LibExpat.find(pd, "item/vpcId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeVpcsType


type DescribeDhcpOptionsResponseType
    requestId::Union{ASCIIString, Void}
    dhcpOptionsSet::Union{Vector{DhcpOptionsType}, Void}

    DescribeDhcpOptionsResponseType(; requestId=nothing, dhcpOptionsSet=nothing) =
         new(requestId, dhcpOptionsSet)
end
function DescribeDhcpOptionsResponseType(pd::ETree)
    o = DescribeDhcpOptionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.dhcpOptionsSet = AWS.@parse_vector(AWS.EC2.DhcpOptionsType, LibExpat.find(pd, "dhcpOptionsSet/item"))
    o
end

export DescribeDhcpOptionsResponseType


type DescribeTagsType
    filterSet::Union{Vector{FilterType}, Void}

    DescribeTagsType(; filterSet=nothing) =
         new(filterSet)
end
function DescribeTagsType(pd::ETree)
    o = DescribeTagsType()
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeTagsType


type MonitorInstancesResponseSetItemType
    instanceId::Union{ASCIIString, Void}
    monitoring::Union{InstanceMonitoringStateType, Void}

    MonitorInstancesResponseSetItemType(; instanceId=nothing, monitoring=nothing) =
         new(instanceId, monitoring)
end
function MonitorInstancesResponseSetItemType(pd::ETree)
    o = MonitorInstancesResponseSetItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o
end

export MonitorInstancesResponseSetItemType


type DescribeRouteTablesResponseType
    requestId::Union{ASCIIString, Void}
    routeTableSet::Union{Vector{RouteTableType}, Void}

    DescribeRouteTablesResponseType(; requestId=nothing, routeTableSet=nothing) =
         new(requestId, routeTableSet)
end
function DescribeRouteTablesResponseType(pd::ETree)
    o = DescribeRouteTablesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.routeTableSet = AWS.@parse_vector(AWS.EC2.RouteTableType, LibExpat.find(pd, "routeTableSet/item"))
    o
end

export DescribeRouteTablesResponseType


type DescribeAccountAttributesType
    accountAttributeNameSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAccountAttributesType(; accountAttributeNameSet=nothing, filterSet=nothing) =
         new(accountAttributeNameSet, filterSet)
end
function DescribeAccountAttributesType(pd::ETree)
    o = DescribeAccountAttributesType()
    o.accountAttributeNameSet = AWS.parse_vector_as(ASCIIString, "attributeName", LibExpat.find(pd, "item/attributeName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeAccountAttributesType


type DescribeInstanceStatusResponseType
    requestId::Union{ASCIIString, Void}
    instanceStatusSet::Union{Vector{InstanceStatusItemType}, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeInstanceStatusResponseType(; requestId=nothing, instanceStatusSet=nothing, nextToken=nothing) =
         new(requestId, instanceStatusSet, nextToken)
end
function DescribeInstanceStatusResponseType(pd::ETree)
    o = DescribeInstanceStatusResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instanceStatusSet = AWS.@parse_vector(AWS.EC2.InstanceStatusItemType, LibExpat.find(pd, "instanceStatusSet/item"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeInstanceStatusResponseType


type VpnGatewayType
    vpnGatewayId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    attachments::Union{Vector{AttachmentType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    VpnGatewayType(; vpnGatewayId=nothing, state=nothing, _type=nothing, availabilityZone=nothing, attachments=nothing, tagSet=nothing) =
         new(vpnGatewayId, state, _type, availabilityZone, attachments, tagSet)
end
function VpnGatewayType(pd::ETree)
    o = VpnGatewayType()
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o.state = LibExpat.find(pd, "state#string")
    o._type = LibExpat.find(pd, "type#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.attachments = AWS.@parse_vector(AWS.EC2.AttachmentType, LibExpat.find(pd, "attachments/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export VpnGatewayType


type DescribeKeyPairsType
    keySet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeKeyPairsType(; keySet=nothing, filterSet=nothing) =
         new(keySet, filterSet)
end
function DescribeKeyPairsType(pd::ETree)
    o = DescribeKeyPairsType()
    o.keySet = AWS.parse_vector_as(ASCIIString, "keyName", LibExpat.find(pd, "item/keyName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeKeyPairsType


type BundleInstanceType
    instanceId::Union{ASCIIString, Void}
    storage::Union{BundleInstanceTaskStorageType, Void}

    BundleInstanceType(; instanceId=nothing, storage=nothing) =
         new(instanceId, storage)
end
function BundleInstanceType(pd::ETree)
    o = BundleInstanceType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(LibExpat.find(pd,"storage[1]")) : nothing
    o
end

export BundleInstanceType


type InstancePrivateIpAddressesSetItemType
    privateIpAddress::Union{ASCIIString, Void}
    privateDnsName::Union{ASCIIString, Void}
    primary::Union{Bool, Void}
    association::Union{InstanceNetworkInterfaceAssociationType, Void}

    InstancePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) =
         new(privateIpAddress, privateDnsName, primary, association)
end
function InstancePrivateIpAddressesSetItemType(pd::ETree)
    o = InstancePrivateIpAddressesSetItemType()
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.privateDnsName = LibExpat.find(pd, "privateDnsName#string")
    o.primary = AWS.safe_parse_as(Bool, LibExpat.find(pd, "primary#string"))
    o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(LibExpat.find(pd,"association[1]")) : nothing
    o
end

export InstancePrivateIpAddressesSetItemType


type ImportInstanceLaunchSpecificationType
    architecture::Union{ASCIIString, Void}
    groupSet::Union{Vector{ImportInstanceGroupItemType}, Void}
    userData::Union{UserDataType, Void}
    instanceType::Union{ASCIIString, Void}
    placement::Union{InstancePlacementType, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{ASCIIString, Void}
    instanceInitiatedShutdownBehavior::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}

    ImportInstanceLaunchSpecificationType(; architecture=nothing, groupSet=nothing, userData=nothing, instanceType=nothing, placement=nothing, monitoring=nothing, subnetId=nothing, instanceInitiatedShutdownBehavior=nothing, privateIpAddress=nothing) =
         new(architecture, groupSet, userData, instanceType, placement, monitoring, subnetId, instanceInitiatedShutdownBehavior, privateIpAddress)
end
function ImportInstanceLaunchSpecificationType(pd::ETree)
    o = ImportInstanceLaunchSpecificationType()
    o.architecture = LibExpat.find(pd, "architecture#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.ImportInstanceGroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(LibExpat.find(pd,"userData[1]")) : nothing
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  InstancePlacementType(LibExpat.find(pd,"placement[1]")) : nothing
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.instanceInitiatedShutdownBehavior = LibExpat.find(pd, "instanceInitiatedShutdownBehavior#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o
end

export ImportInstanceLaunchSpecificationType


type DescribeAddressesType
    publicIpsSet::Union{Vector{ASCIIString}, Void}
    allocationIdsSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAddressesType(; publicIpsSet=nothing, allocationIdsSet=nothing, filterSet=nothing) =
         new(publicIpsSet, allocationIdsSet, filterSet)
end
function DescribeAddressesType(pd::ETree)
    o = DescribeAddressesType()
    o.publicIpsSet = AWS.parse_vector_as(ASCIIString, "publicIp", LibExpat.find(pd, "item/publicIp"))
    o.allocationIdsSet = AWS.parse_vector_as(ASCIIString, "allocationId", LibExpat.find(pd, "item/allocationId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeAddressesType


type VolumeStatusInfoType
    status::Union{ASCIIString, Void}
    details::Union{Vector{VolumeStatusDetailsItemType}, Void}

    VolumeStatusInfoType(; status=nothing, details=nothing) =
         new(status, details)
end
function VolumeStatusInfoType(pd::ETree)
    o = VolumeStatusInfoType()
    o.status = LibExpat.find(pd, "status#string")
    o.details = AWS.@parse_vector(AWS.EC2.VolumeStatusDetailsItemType, LibExpat.find(pd, "details/item"))
    o
end

export VolumeStatusInfoType


type StartInstancesResponseType
    requestId::Union{ASCIIString, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    StartInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function StartInstancesResponseType(pd::ETree)
    o = StartInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LibExpat.find(pd, "instancesSet/item"))
    o
end

export StartInstancesResponseType


type CreateVpnConnectionType
    _type::Union{ASCIIString, Void}
    customerGatewayId::Union{ASCIIString, Void}
    vpnGatewayId::Union{ASCIIString, Void}
    options::Union{VpnConnectionOptionsRequestType, Void}

    CreateVpnConnectionType(; _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, options=nothing) =
         new(_type, customerGatewayId, vpnGatewayId, options)
end
function CreateVpnConnectionType(pd::ETree)
    o = CreateVpnConnectionType()
    o._type = LibExpat.find(pd, "type#string")
    o.customerGatewayId = LibExpat.find(pd, "customerGatewayId#string")
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsRequestType(LibExpat.find(pd,"options[1]")) : nothing
    o
end

export CreateVpnConnectionType


type AuthorizeSecurityGroupEgressType
    groupId::Union{ASCIIString, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    AuthorizeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) =
         new(groupId, ipPermissions)
end
function AuthorizeSecurityGroupEgressType(pd::ETree)
    o = AuthorizeSecurityGroupEgressType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissions/item"))
    o
end

export AuthorizeSecurityGroupEgressType


type CreateReservedInstancesListingResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    CreateReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function CreateReservedInstancesListingResponseType(pd::ETree)
    o = CreateReservedInstancesListingResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LibExpat.find(pd, "reservedInstancesListingsSet/item"))
    o
end

export CreateReservedInstancesListingResponseType


type NetworkAclType
    networkAclId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    default::Union{Bool, Void}
    entrySet::Union{Vector{NetworkAclEntryType}, Void}
    associationSet::Union{Vector{NetworkAclAssociationType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    NetworkAclType(; networkAclId=nothing, vpcId=nothing, default=nothing, entrySet=nothing, associationSet=nothing, tagSet=nothing) =
         new(networkAclId, vpcId, default, entrySet, associationSet, tagSet)
end
function NetworkAclType(pd::ETree)
    o = NetworkAclType()
    o.networkAclId = LibExpat.find(pd, "networkAclId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.default = AWS.safe_parse_as(Bool, LibExpat.find(pd, "default#string"))
    o.entrySet = AWS.@parse_vector(AWS.EC2.NetworkAclEntryType, LibExpat.find(pd, "entrySet/item"))
    o.associationSet = AWS.@parse_vector(AWS.EC2.NetworkAclAssociationType, LibExpat.find(pd, "associationSet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export NetworkAclType


type DescribeAddressesResponseType
    requestId::Union{ASCIIString, Void}
    addressesSet::Union{Vector{DescribeAddressesResponseItemType}, Void}

    DescribeAddressesResponseType(; requestId=nothing, addressesSet=nothing) =
         new(requestId, addressesSet)
end
function DescribeAddressesResponseType(pd::ETree)
    o = DescribeAddressesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.addressesSet = AWS.@parse_vector(AWS.EC2.DescribeAddressesResponseItemType, LibExpat.find(pd, "addressesSet/item"))
    o
end

export DescribeAddressesResponseType


type TerminateInstancesResponseType
    requestId::Union{ASCIIString, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    TerminateInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function TerminateInstancesResponseType(pd::ETree)
    o = TerminateInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LibExpat.find(pd, "instancesSet/item"))
    o
end

export TerminateInstancesResponseType


type DiskImageType
    image::Union{DiskImageDetailType, Void}
    description::Union{ASCIIString, Void}
    volume::Union{DiskImageVolumeType, Void}

    DiskImageType(; image=nothing, description=nothing, volume=nothing) =
         new(image, description, volume)
end
function DiskImageType(pd::ETree)
    o = DiskImageType()
    o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(LibExpat.find(pd,"image[1]")) : nothing
    o.description = LibExpat.find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(LibExpat.find(pd,"volume[1]")) : nothing
    o
end

export DiskImageType


type RunInstancesType
    imageId::Union{ASCIIString, Void}
    minCount::Union{Int64, Void}
    maxCount::Union{Int64, Void}
    keyName::Union{ASCIIString, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    additionalInfo::Union{ASCIIString, Void}
    userData::Union{UserDataType, Void}
    addressingType::Union{ASCIIString, Void}
    instanceType::Union{ASCIIString, Void}
    placement::Union{PlacementRequestType, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{ASCIIString, Void}
    disableApiTermination::Union{Bool, Void}
    instanceInitiatedShutdownBehavior::Union{ASCIIString, Void}
    license::Union{InstanceLicenseRequestType, Void}
    privateIpAddress::Union{ASCIIString, Void}
    clientToken::Union{ASCIIString, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, groupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunInstancesType(pd::ETree)
    o = RunInstancesType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o.minCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "minCount#string"))
    o.maxCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "maxCount#string"))
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.additionalInfo = LibExpat.find(pd, "additionalInfo#string")
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(LibExpat.find(pd,"userData[1]")) : nothing
    o.addressingType = LibExpat.find(pd, "addressingType#string")
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  PlacementRequestType(LibExpat.find(pd,"placement[1]")) : nothing
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.disableApiTermination = AWS.safe_parse_as(Bool, LibExpat.find(pd, "disableApiTermination#string"))
    o.instanceInitiatedShutdownBehavior = LibExpat.find(pd, "instanceInitiatedShutdownBehavior#string")
    o.license = length(pd["license"]) > 0 ?  InstanceLicenseRequestType(LibExpat.find(pd,"license[1]")) : nothing
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.clientToken = LibExpat.find(pd, "clientToken#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LibExpat.find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LibExpat.find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LibExpat.find(pd, "ebsOptimized#string"))
    o
end

export RunInstancesType


type DescribeAvailabilityZonesType
    availabilityZoneSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeAvailabilityZonesType(; availabilityZoneSet=nothing, filterSet=nothing) =
         new(availabilityZoneSet, filterSet)
end
function DescribeAvailabilityZonesType(pd::ETree)
    o = DescribeAvailabilityZonesType()
    o.availabilityZoneSet = AWS.parse_vector_as(ASCIIString, "zoneName", LibExpat.find(pd, "item/zoneName"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeAvailabilityZonesType


type CreateVolumePermissionOperationType
    add::Union{Vector{CreateVolumePermissionItemType}, Void}
    remove::Union{Vector{CreateVolumePermissionItemType}, Void}

    CreateVolumePermissionOperationType(; add=nothing, remove=nothing) =
         new(add, remove)
end
function CreateVolumePermissionOperationType(pd::ETree)
    o = CreateVolumePermissionOperationType()
    o.add = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, LibExpat.find(pd, "add/item"))
    o.remove = AWS.@parse_vector(AWS.EC2.CreateVolumePermissionItemType, LibExpat.find(pd, "remove/item"))
    o
end

export CreateVolumePermissionOperationType


type InstanceNetworkInterfaceSetItemType
    networkInterfaceId::Union{ASCIIString, Void}
    subnetId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    status::Union{ASCIIString, Void}
    macAddress::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}
    privateDnsName::Union{ASCIIString, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    attachment::Union{InstanceNetworkInterfaceAttachmentType, Void}
    association::Union{InstanceNetworkInterfaceAssociationType, Void}
    privateIpAddressesSet::Union{Vector{InstancePrivateIpAddressesSetItemType}, Void}

    InstanceNetworkInterfaceSetItemType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, description=nothing, ownerId=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, subnetId, vpcId, description, ownerId, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, privateIpAddressesSet)
end
function InstanceNetworkInterfaceSetItemType(pd::ETree)
    o = InstanceNetworkInterfaceSetItemType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.description = LibExpat.find(pd, "description#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.status = LibExpat.find(pd, "status#string")
    o.macAddress = LibExpat.find(pd, "macAddress#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.privateDnsName = LibExpat.find(pd, "privateDnsName#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, LibExpat.find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.attachment = length(pd["attachment"]) > 0 ?  InstanceNetworkInterfaceAttachmentType(LibExpat.find(pd,"attachment[1]")) : nothing
    o.association = length(pd["association"]) > 0 ?  InstanceNetworkInterfaceAssociationType(LibExpat.find(pd,"association[1]")) : nothing
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.InstancePrivateIpAddressesSetItemType, LibExpat.find(pd, "privateIpAddressesSet/item"))
    o
end

export InstanceNetworkInterfaceSetItemType


type LicenseSetItemType
    licenseId::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}
    pool::Union{ASCIIString, Void}
    capacitySet::Union{Vector{LicenseCapacitySetItemType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    LicenseSetItemType(; licenseId=nothing, _type=nothing, pool=nothing, capacitySet=nothing, tagSet=nothing) =
         new(licenseId, _type, pool, capacitySet, tagSet)
end
function LicenseSetItemType(pd::ETree)
    o = LicenseSetItemType()
    o.licenseId = LibExpat.find(pd, "licenseId#string")
    o._type = LibExpat.find(pd, "type#string")
    o.pool = LibExpat.find(pd, "pool#string")
    o.capacitySet = AWS.@parse_vector(AWS.EC2.LicenseCapacitySetItemType, LibExpat.find(pd, "capacitySet/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export LicenseSetItemType


type ImportVolumeTaskDetailsType
    bytesConverted::Union{Int64, Void}
    availabilityZone::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    image::Union{DiskImageDescriptionType, Void}
    volume::Union{DiskImageVolumeDescriptionType, Void}

    ImportVolumeTaskDetailsType(; bytesConverted=nothing, availabilityZone=nothing, description=nothing, image=nothing, volume=nothing) =
         new(bytesConverted, availabilityZone, description, image, volume)
end
function ImportVolumeTaskDetailsType(pd::ETree)
    o = ImportVolumeTaskDetailsType()
    o.bytesConverted = AWS.safe_parse_as(Int64, LibExpat.find(pd, "bytesConverted#string"))
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.description = LibExpat.find(pd, "description#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDescriptionType(LibExpat.find(pd,"image[1]")) : nothing
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeDescriptionType(LibExpat.find(pd,"volume[1]")) : nothing
    o
end

export ImportVolumeTaskDetailsType


type DescribeReservedInstancesListingsResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    DescribeReservedInstancesListingsResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function DescribeReservedInstancesListingsResponseType(pd::ETree)
    o = DescribeReservedInstancesListingsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LibExpat.find(pd, "reservedInstancesListingsSet/item"))
    o
end

export DescribeReservedInstancesListingsResponseType


type RevokeSecurityGroupIngressType
    userId::Union{ASCIIString, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    RevokeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) =
         new(userId, ipPermissions)
end
function RevokeSecurityGroupIngressType(pd::ETree)
    o = RevokeSecurityGroupIngressType()
    o.userId = LibExpat.find(pd, "userId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissions/item"))
    o
end

export RevokeSecurityGroupIngressType


type StopInstancesResponseType
    requestId::Union{ASCIIString, Void}
    instancesSet::Union{Vector{InstanceStateChangeType}, Void}

    StopInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function StopInstancesResponseType(pd::ETree)
    o = StopInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.InstanceStateChangeType, LibExpat.find(pd, "instancesSet/item"))
    o
end

export StopInstancesResponseType


type ImportVolumeType
    availabilityZone::Union{ASCIIString, Void}
    image::Union{DiskImageDetailType, Void}
    description::Union{ASCIIString, Void}
    volume::Union{DiskImageVolumeType, Void}

    ImportVolumeType(; availabilityZone=nothing, image=nothing, description=nothing, volume=nothing) =
         new(availabilityZone, image, description, volume)
end
function ImportVolumeType(pd::ETree)
    o = ImportVolumeType()
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.image = length(pd["image"]) > 0 ?  DiskImageDetailType(LibExpat.find(pd,"image[1]")) : nothing
    o.description = LibExpat.find(pd, "description#string")
    o.volume = length(pd["volume"]) > 0 ?  DiskImageVolumeType(LibExpat.find(pd,"volume[1]")) : nothing
    o
end

export ImportVolumeType


type VpnConnectionType
    vpnConnectionId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    customerGatewayConfiguration::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}
    customerGatewayId::Union{ASCIIString, Void}
    vpnGatewayId::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    vgwTelemetry::Union{Vector{VpnTunnelTelemetryType}, Void}
    options::Union{VpnConnectionOptionsResponseType, Void}
    routes::Union{Vector{VpnStaticRouteType}, Void}

    VpnConnectionType(; vpnConnectionId=nothing, state=nothing, customerGatewayConfiguration=nothing, _type=nothing, customerGatewayId=nothing, vpnGatewayId=nothing, tagSet=nothing, vgwTelemetry=nothing, options=nothing, routes=nothing) =
         new(vpnConnectionId, state, customerGatewayConfiguration, _type, customerGatewayId, vpnGatewayId, tagSet, vgwTelemetry, options, routes)
end
function VpnConnectionType(pd::ETree)
    o = VpnConnectionType()
    o.vpnConnectionId = LibExpat.find(pd, "vpnConnectionId#string")
    o.state = LibExpat.find(pd, "state#string")
    o.customerGatewayConfiguration = LibExpat.find(pd, "customerGatewayConfiguration#string")
    o._type = LibExpat.find(pd, "type#string")
    o.customerGatewayId = LibExpat.find(pd, "customerGatewayId#string")
    o.vpnGatewayId = LibExpat.find(pd, "vpnGatewayId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.vgwTelemetry = AWS.@parse_vector(AWS.EC2.VpnTunnelTelemetryType, LibExpat.find(pd, "vgwTelemetry/item"))
    o.options = length(pd["options"]) > 0 ?  VpnConnectionOptionsResponseType(LibExpat.find(pd,"options[1]")) : nothing
    o.routes = AWS.@parse_vector(AWS.EC2.VpnStaticRouteType, LibExpat.find(pd, "routes/item"))
    o
end

export VpnConnectionType


type DescribeInstancesType
    instancesSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeInstancesType(; instancesSet=nothing, filterSet=nothing) =
         new(instancesSet, filterSet)
end
function DescribeInstancesType(pd::ETree)
    o = DescribeInstancesType()
    o.instancesSet = AWS.parse_vector_as(ASCIIString, "instanceId", LibExpat.find(pd, "item/instanceId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeInstancesType


type DescribeImagesResponseType
    requestId::Union{ASCIIString, Void}
    imagesSet::Union{Vector{DescribeImagesResponseItemType}, Void}

    DescribeImagesResponseType(; requestId=nothing, imagesSet=nothing) =
         new(requestId, imagesSet)
end
function DescribeImagesResponseType(pd::ETree)
    o = DescribeImagesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.imagesSet = AWS.@parse_vector(AWS.EC2.DescribeImagesResponseItemType, LibExpat.find(pd, "imagesSet/item"))
    o
end

export DescribeImagesResponseType


type CustomerGatewayType
    customerGatewayId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}
    ipAddress::Union{ASCIIString, Void}
    bgpAsn::Union{Int64, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    CustomerGatewayType(; customerGatewayId=nothing, state=nothing, _type=nothing, ipAddress=nothing, bgpAsn=nothing, tagSet=nothing) =
         new(customerGatewayId, state, _type, ipAddress, bgpAsn, tagSet)
end
function CustomerGatewayType(pd::ETree)
    o = CustomerGatewayType()
    o.customerGatewayId = LibExpat.find(pd, "customerGatewayId#string")
    o.state = LibExpat.find(pd, "state#string")
    o._type = LibExpat.find(pd, "type#string")
    o.ipAddress = LibExpat.find(pd, "ipAddress#string")
    o.bgpAsn = AWS.safe_parse_as(Int64, LibExpat.find(pd, "bgpAsn#string"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export CustomerGatewayType


type SubnetType
    subnetId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    cidrBlock::Union{ASCIIString, Void}
    availableIpAddressCount::Union{Int64, Void}
    availabilityZone::Union{ASCIIString, Void}
    defaultForAz::Union{Bool, Void}
    mapPublicIpOnLaunch::Union{Bool, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    SubnetType(; subnetId=nothing, state=nothing, vpcId=nothing, cidrBlock=nothing, availableIpAddressCount=nothing, availabilityZone=nothing, defaultForAz=nothing, mapPublicIpOnLaunch=nothing, tagSet=nothing) =
         new(subnetId, state, vpcId, cidrBlock, availableIpAddressCount, availabilityZone, defaultForAz, mapPublicIpOnLaunch, tagSet)
end
function SubnetType(pd::ETree)
    o = SubnetType()
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.state = LibExpat.find(pd, "state#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.cidrBlock = LibExpat.find(pd, "cidrBlock#string")
    o.availableIpAddressCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "availableIpAddressCount#string"))
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.defaultForAz = AWS.safe_parse_as(Bool, LibExpat.find(pd, "defaultForAz#string"))
    o.mapPublicIpOnLaunch = AWS.safe_parse_as(Bool, LibExpat.find(pd, "mapPublicIpOnLaunch#string"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export SubnetType


type DescribeLicensesResponseType
    requestId::Union{ASCIIString, Void}
    licenseSet::Union{Vector{LicenseSetItemType}, Void}

    DescribeLicensesResponseType(; requestId=nothing, licenseSet=nothing) =
         new(requestId, licenseSet)
end
function DescribeLicensesResponseType(pd::ETree)
    o = DescribeLicensesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.licenseSet = AWS.@parse_vector(AWS.EC2.LicenseSetItemType, LibExpat.find(pd, "licenseSet/item"))
    o
end

export DescribeLicensesResponseType


type NetworkInterfacePrivateIpAddressesSetItemType
    privateIpAddress::Union{ASCIIString, Void}
    privateDnsName::Union{ASCIIString, Void}
    primary::Union{Bool, Void}
    association::Union{NetworkInterfaceAssociationType, Void}

    NetworkInterfacePrivateIpAddressesSetItemType(; privateIpAddress=nothing, privateDnsName=nothing, primary=nothing, association=nothing) =
         new(privateIpAddress, privateDnsName, primary, association)
end
function NetworkInterfacePrivateIpAddressesSetItemType(pd::ETree)
    o = NetworkInterfacePrivateIpAddressesSetItemType()
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.privateDnsName = LibExpat.find(pd, "privateDnsName#string")
    o.primary = AWS.safe_parse_as(Bool, LibExpat.find(pd, "primary#string"))
    o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(LibExpat.find(pd,"association[1]")) : nothing
    o
end

export NetworkInterfacePrivateIpAddressesSetItemType


type CreateVpnConnectionResponseType
    requestId::Union{ASCIIString, Void}
    vpnConnection::Union{VpnConnectionType, Void}

    CreateVpnConnectionResponseType(; requestId=nothing, vpnConnection=nothing) =
         new(requestId, vpnConnection)
end
function CreateVpnConnectionResponseType(pd::ETree)
    o = CreateVpnConnectionResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpnConnection = length(pd["vpnConnection"]) > 0 ?  VpnConnectionType(LibExpat.find(pd,"vpnConnection[1]")) : nothing
    o
end

export CreateVpnConnectionResponseType


type DescribeTagsResponseType
    requestId::Union{ASCIIString, Void}
    tagSet::Union{Vector{TagSetItemType}, Void}

    DescribeTagsResponseType(; requestId=nothing, tagSet=nothing) =
         new(requestId, tagSet)
end
function DescribeTagsResponseType(pd::ETree)
    o = DescribeTagsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.TagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export DescribeTagsResponseType


type CreateInternetGatewayResponseType
    requestId::Union{ASCIIString, Void}
    internetGateway::Union{InternetGatewayType, Void}

    CreateInternetGatewayResponseType(; requestId=nothing, internetGateway=nothing) =
         new(requestId, internetGateway)
end
function CreateInternetGatewayResponseType(pd::ETree)
    o = CreateInternetGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.internetGateway = length(pd["internetGateway"]) > 0 ?  InternetGatewayType(LibExpat.find(pd,"internetGateway[1]")) : nothing
    o
end

export CreateInternetGatewayResponseType


type AttachVpnGatewayResponseType
    requestId::Union{ASCIIString, Void}
    attachment::Union{AttachmentType, Void}

    AttachVpnGatewayResponseType(; requestId=nothing, attachment=nothing) =
         new(requestId, attachment)
end
function AttachVpnGatewayResponseType(pd::ETree)
    o = AttachVpnGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.attachment = length(pd["attachment"]) > 0 ?  AttachmentType(LibExpat.find(pd,"attachment[1]")) : nothing
    o
end

export AttachVpnGatewayResponseType


type DescribeLicensesType
    licenseIdSet::Union{Vector{ASCIIString}, Void}
    filterSet::Union{Vector{FilterType}, Void}

    DescribeLicensesType(; licenseIdSet=nothing, filterSet=nothing) =
         new(licenseIdSet, filterSet)
end
function DescribeLicensesType(pd::ETree)
    o = DescribeLicensesType()
    o.licenseIdSet = AWS.parse_vector_as(ASCIIString, "licenseId", LibExpat.find(pd, "item/licenseId"))
    o.filterSet = AWS.@parse_vector(AWS.EC2.FilterType, LibExpat.find(pd, "filterSet/item"))
    o
end

export DescribeLicensesType


type AuthorizeSecurityGroupIngressType
    userId::Union{ASCIIString, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    AuthorizeSecurityGroupIngressType(; userId=nothing, ipPermissions=nothing) =
         new(userId, ipPermissions)
end
function AuthorizeSecurityGroupIngressType(pd::ETree)
    o = AuthorizeSecurityGroupIngressType()
    o.userId = LibExpat.find(pd, "userId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissions/item"))
    o
end

export AuthorizeSecurityGroupIngressType


type CreateSubnetResponseType
    requestId::Union{ASCIIString, Void}
    subnet::Union{SubnetType, Void}

    CreateSubnetResponseType(; requestId=nothing, subnet=nothing) =
         new(requestId, subnet)
end
function CreateSubnetResponseType(pd::ETree)
    o = CreateSubnetResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.subnet = length(pd["subnet"]) > 0 ?  SubnetType(LibExpat.find(pd,"subnet[1]")) : nothing
    o
end

export CreateSubnetResponseType


type NetworkInterfaceType
    networkInterfaceId::Union{ASCIIString, Void}
    subnetId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    description::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    requesterId::Union{ASCIIString, Void}
    requesterManaged::Union{Bool, Void}
    status::Union{ASCIIString, Void}
    macAddress::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}
    privateDnsName::Union{ASCIIString, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    attachment::Union{NetworkInterfaceAttachmentType, Void}
    association::Union{NetworkInterfaceAssociationType, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    privateIpAddressesSet::Union{Vector{NetworkInterfacePrivateIpAddressesSetItemType}, Void}

    NetworkInterfaceType(; networkInterfaceId=nothing, subnetId=nothing, vpcId=nothing, availabilityZone=nothing, description=nothing, ownerId=nothing, requesterId=nothing, requesterManaged=nothing, status=nothing, macAddress=nothing, privateIpAddress=nothing, privateDnsName=nothing, sourceDestCheck=nothing, groupSet=nothing, attachment=nothing, association=nothing, tagSet=nothing, privateIpAddressesSet=nothing) =
         new(networkInterfaceId, subnetId, vpcId, availabilityZone, description, ownerId, requesterId, requesterManaged, status, macAddress, privateIpAddress, privateDnsName, sourceDestCheck, groupSet, attachment, association, tagSet, privateIpAddressesSet)
end
function NetworkInterfaceType(pd::ETree)
    o = NetworkInterfaceType()
    o.networkInterfaceId = LibExpat.find(pd, "networkInterfaceId#string")
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.description = LibExpat.find(pd, "description#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.requesterId = LibExpat.find(pd, "requesterId#string")
    o.requesterManaged = AWS.safe_parse_as(Bool, LibExpat.find(pd, "requesterManaged#string"))
    o.status = LibExpat.find(pd, "status#string")
    o.macAddress = LibExpat.find(pd, "macAddress#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.privateDnsName = LibExpat.find(pd, "privateDnsName#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, LibExpat.find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.attachment = length(pd["attachment"]) > 0 ?  NetworkInterfaceAttachmentType(LibExpat.find(pd,"attachment[1]")) : nothing
    o.association = length(pd["association"]) > 0 ?  NetworkInterfaceAssociationType(LibExpat.find(pd,"association[1]")) : nothing
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.privateIpAddressesSet = AWS.@parse_vector(AWS.EC2.NetworkInterfacePrivateIpAddressesSetItemType, LibExpat.find(pd, "privateIpAddressesSet/item"))
    o
end

export NetworkInterfaceType


type ImportVolumeResponseType
    requestId::Union{ASCIIString, Void}
    conversionTask::Union{ConversionTaskType, Void}

    ImportVolumeResponseType(; requestId=nothing, conversionTask=nothing) =
         new(requestId, conversionTask)
end
function ImportVolumeResponseType(pd::ETree)
    o = ImportVolumeResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(LibExpat.find(pd,"conversionTask[1]")) : nothing
    o
end

export ImportVolumeResponseType


type ModifySnapshotAttributeType
    snapshotId::Union{ASCIIString, Void}
    createVolumePermission::Union{CreateVolumePermissionOperationType, Void}

    ModifySnapshotAttributeType(; snapshotId=nothing, createVolumePermission=nothing) =
         new(snapshotId, createVolumePermission)
end
function ModifySnapshotAttributeType(pd::ETree)
    o = ModifySnapshotAttributeType()
    o.snapshotId = LibExpat.find(pd, "snapshotId#string")
    o.createVolumePermission = length(pd["createVolumePermission"]) > 0 ?  CreateVolumePermissionOperationType(LibExpat.find(pd,"createVolumePermission[1]")) : nothing
    o
end

export ModifySnapshotAttributeType


type CreateNetworkInterfaceResponseType
    requestId::Union{ASCIIString, Void}
    networkInterface::Union{NetworkInterfaceType, Void}

    CreateNetworkInterfaceResponseType(; requestId=nothing, networkInterface=nothing) =
         new(requestId, networkInterface)
end
function CreateNetworkInterfaceResponseType(pd::ETree)
    o = CreateNetworkInterfaceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.networkInterface = length(pd["networkInterface"]) > 0 ?  NetworkInterfaceType(LibExpat.find(pd,"networkInterface[1]")) : nothing
    o
end

export CreateNetworkInterfaceResponseType


type CancelReservedInstancesListingResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesListingsSet::Union{Vector{DescribeReservedInstancesListingsResponseSetItemType}, Void}

    CancelReservedInstancesListingResponseType(; requestId=nothing, reservedInstancesListingsSet=nothing) =
         new(requestId, reservedInstancesListingsSet)
end
function CancelReservedInstancesListingResponseType(pd::ETree)
    o = CancelReservedInstancesListingResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesListingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesListingsResponseSetItemType, LibExpat.find(pd, "reservedInstancesListingsSet/item"))
    o
end

export CancelReservedInstancesListingResponseType


type MonitorInstancesResponseType
    requestId::Union{ASCIIString, Void}
    instancesSet::Union{Vector{MonitorInstancesResponseSetItemType}, Void}

    MonitorInstancesResponseType(; requestId=nothing, instancesSet=nothing) =
         new(requestId, instancesSet)
end
function MonitorInstancesResponseType(pd::ETree)
    o = MonitorInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.instancesSet = AWS.@parse_vector(AWS.EC2.MonitorInstancesResponseSetItemType, LibExpat.find(pd, "instancesSet/item"))
    o
end

export MonitorInstancesResponseType


type CreateCustomerGatewayResponseType
    requestId::Union{ASCIIString, Void}
    customerGateway::Union{CustomerGatewayType, Void}

    CreateCustomerGatewayResponseType(; requestId=nothing, customerGateway=nothing) =
         new(requestId, customerGateway)
end
function CreateCustomerGatewayResponseType(pd::ETree)
    o = CreateCustomerGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.customerGateway = length(pd["customerGateway"]) > 0 ?  CustomerGatewayType(LibExpat.find(pd,"customerGateway[1]")) : nothing
    o
end

export CreateCustomerGatewayResponseType


type DescribeVpnConnectionsResponseType
    requestId::Union{ASCIIString, Void}
    vpnConnectionSet::Union{Vector{VpnConnectionType}, Void}

    DescribeVpnConnectionsResponseType(; requestId=nothing, vpnConnectionSet=nothing) =
         new(requestId, vpnConnectionSet)
end
function DescribeVpnConnectionsResponseType(pd::ETree)
    o = DescribeVpnConnectionsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpnConnectionSet = AWS.@parse_vector(AWS.EC2.VpnConnectionType, LibExpat.find(pd, "vpnConnectionSet/item"))
    o
end

export DescribeVpnConnectionsResponseType


type RunningInstancesItemType
    instanceId::Union{ASCIIString, Void}
    imageId::Union{ASCIIString, Void}
    instanceState::Union{InstanceStateType, Void}
    privateDnsName::Union{ASCIIString, Void}
    dnsName::Union{ASCIIString, Void}
    reason::Union{ASCIIString, Void}
    keyName::Union{ASCIIString, Void}
    amiLaunchIndex::Union{ASCIIString, Void}
    productCodes::Union{Vector{ProductCodesSetItemType}, Void}
    instanceType::Union{ASCIIString, Void}
    launchTime::Union{Base.Dates.DateTime, Void}
    placement::Union{PlacementResponseType, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    platform::Union{ASCIIString, Void}
    monitoring::Union{InstanceMonitoringStateType, Void}
    subnetId::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    privateIpAddress::Union{ASCIIString, Void}
    ipAddress::Union{ASCIIString, Void}
    sourceDestCheck::Union{Bool, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    stateReason::Union{StateReasonType, Void}
    architecture::Union{ASCIIString, Void}
    rootDeviceType::Union{ASCIIString, Void}
    rootDeviceName::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{InstanceBlockDeviceMappingResponseItemType}, Void}
    instanceLifecycle::Union{ASCIIString, Void}
    spotInstanceRequestId::Union{ASCIIString, Void}
    license::Union{InstanceLicenseResponseType, Void}
    virtualizationType::Union{ASCIIString, Void}
    clientToken::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    hypervisor::Union{ASCIIString, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileResponseType, Void}
    ebsOptimized::Union{Bool, Void}

    RunningInstancesItemType(; instanceId=nothing, imageId=nothing, instanceState=nothing, privateDnsName=nothing, dnsName=nothing, reason=nothing, keyName=nothing, amiLaunchIndex=nothing, productCodes=nothing, instanceType=nothing, launchTime=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, platform=nothing, monitoring=nothing, subnetId=nothing, vpcId=nothing, privateIpAddress=nothing, ipAddress=nothing, sourceDestCheck=nothing, groupSet=nothing, stateReason=nothing, architecture=nothing, rootDeviceType=nothing, rootDeviceName=nothing, blockDeviceMapping=nothing, instanceLifecycle=nothing, spotInstanceRequestId=nothing, license=nothing, virtualizationType=nothing, clientToken=nothing, tagSet=nothing, hypervisor=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(instanceId, imageId, instanceState, privateDnsName, dnsName, reason, keyName, amiLaunchIndex, productCodes, instanceType, launchTime, placement, kernelId, ramdiskId, platform, monitoring, subnetId, vpcId, privateIpAddress, ipAddress, sourceDestCheck, groupSet, stateReason, architecture, rootDeviceType, rootDeviceName, blockDeviceMapping, instanceLifecycle, spotInstanceRequestId, license, virtualizationType, clientToken, tagSet, hypervisor, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function RunningInstancesItemType(pd::ETree)
    o = RunningInstancesItemType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.imageId = LibExpat.find(pd, "imageId#string")
    o.instanceState = length(pd["instanceState"]) > 0 ?  InstanceStateType(LibExpat.find(pd,"instanceState[1]")) : nothing
    o.privateDnsName = LibExpat.find(pd, "privateDnsName#string")
    o.dnsName = LibExpat.find(pd, "dnsName#string")
    o.reason = LibExpat.find(pd, "reason#string")
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.amiLaunchIndex = LibExpat.find(pd, "amiLaunchIndex#string")
    o.productCodes = AWS.@parse_vector(AWS.EC2.ProductCodesSetItemType, LibExpat.find(pd, "productCodes/item"))
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.launchTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "launchTime#string"))
    o.placement = length(pd["placement"]) > 0 ?  PlacementResponseType(LibExpat.find(pd,"placement[1]")) : nothing
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.platform = LibExpat.find(pd, "platform#string")
    o.monitoring = length(pd["monitoring"]) > 0 ?  InstanceMonitoringStateType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.privateIpAddress = LibExpat.find(pd, "privateIpAddress#string")
    o.ipAddress = LibExpat.find(pd, "ipAddress#string")
    o.sourceDestCheck = AWS.safe_parse_as(Bool, LibExpat.find(pd, "sourceDestCheck#string"))
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.stateReason = length(pd["stateReason"]) > 0 ?  StateReasonType(LibExpat.find(pd,"stateReason[1]")) : nothing
    o.architecture = LibExpat.find(pd, "architecture#string")
    o.rootDeviceType = LibExpat.find(pd, "rootDeviceType#string")
    o.rootDeviceName = LibExpat.find(pd, "rootDeviceName#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.InstanceBlockDeviceMappingResponseItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o.instanceLifecycle = LibExpat.find(pd, "instanceLifecycle#string")
    o.spotInstanceRequestId = LibExpat.find(pd, "spotInstanceRequestId#string")
    o.license = length(pd["license"]) > 0 ?  InstanceLicenseResponseType(LibExpat.find(pd,"license[1]")) : nothing
    o.virtualizationType = LibExpat.find(pd, "virtualizationType#string")
    o.clientToken = LibExpat.find(pd, "clientToken#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.hypervisor = LibExpat.find(pd, "hypervisor#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemType, LibExpat.find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileResponseType(LibExpat.find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LibExpat.find(pd, "ebsOptimized#string"))
    o
end

export RunningInstancesItemType


type DescribeSnapshotsResponseType
    requestId::Union{ASCIIString, Void}
    snapshotSet::Union{Vector{DescribeSnapshotsSetItemResponseType}, Void}

    DescribeSnapshotsResponseType(; requestId=nothing, snapshotSet=nothing) =
         new(requestId, snapshotSet)
end
function DescribeSnapshotsResponseType(pd::ETree)
    o = DescribeSnapshotsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.snapshotSet = AWS.@parse_vector(AWS.EC2.DescribeSnapshotsSetItemResponseType, LibExpat.find(pd, "snapshotSet/item"))
    o
end

export DescribeSnapshotsResponseType


type CreateVpcResponseType
    requestId::Union{ASCIIString, Void}
    vpc::Union{VpcType, Void}

    CreateVpcResponseType(; requestId=nothing, vpc=nothing) =
         new(requestId, vpc)
end
function CreateVpcResponseType(pd::ETree)
    o = CreateVpcResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpc = length(pd["vpc"]) > 0 ?  VpcType(LibExpat.find(pd,"vpc[1]")) : nothing
    o
end

export CreateVpcResponseType


type ImportInstanceType
    description::Union{ASCIIString, Void}
    launchSpecification::Union{ImportInstanceLaunchSpecificationType, Void}
    diskImageSet::Union{Vector{DiskImageType}, Void}
    keepPartialImports::Union{Bool, Void}
    platform::Union{ASCIIString, Void}

    ImportInstanceType(; description=nothing, launchSpecification=nothing, diskImageSet=nothing, keepPartialImports=nothing, platform=nothing) =
         new(description, launchSpecification, diskImageSet, keepPartialImports, platform)
end
function ImportInstanceType(pd::ETree)
    o = ImportInstanceType()
    o.description = LibExpat.find(pd, "description#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  ImportInstanceLaunchSpecificationType(LibExpat.find(pd,"launchSpecification[1]")) : nothing
    o.diskImageSet = AWS.@parse_vector(AWS.EC2.DiskImageType, LibExpat.find(pd, "diskImageSet/item"))
    o.keepPartialImports = AWS.safe_parse_as(Bool, LibExpat.find(pd, "keepPartialImports#string"))
    o.platform = LibExpat.find(pd, "platform#string")
    o
end

export ImportInstanceType


type BundleInstanceTaskType
    instanceId::Union{ASCIIString, Void}
    bundleId::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    startTime::Union{Base.Dates.DateTime, Void}
    updateTime::Union{Base.Dates.DateTime, Void}
    storage::Union{BundleInstanceTaskStorageType, Void}
    progress::Union{ASCIIString, Void}
    error::Union{BundleInstanceTaskErrorType, Void}

    BundleInstanceTaskType(; instanceId=nothing, bundleId=nothing, state=nothing, startTime=nothing, updateTime=nothing, storage=nothing, progress=nothing, error=nothing) =
         new(instanceId, bundleId, state, startTime, updateTime, storage, progress, error)
end
function BundleInstanceTaskType(pd::ETree)
    o = BundleInstanceTaskType()
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.bundleId = LibExpat.find(pd, "bundleId#string")
    o.state = LibExpat.find(pd, "state#string")
    o.startTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "startTime#string"))
    o.updateTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "updateTime#string"))
    o.storage = length(pd["storage"]) > 0 ?  BundleInstanceTaskStorageType(LibExpat.find(pd,"storage[1]")) : nothing
    o.progress = LibExpat.find(pd, "progress#string")
    o.error = length(pd["error"]) > 0 ?  BundleInstanceTaskErrorType(LibExpat.find(pd,"error[1]")) : nothing
    o
end

export BundleInstanceTaskType


type CancelBundleTaskResponseType
    requestId::Union{ASCIIString, Void}
    bundleInstanceTask::Union{BundleInstanceTaskType, Void}

    CancelBundleTaskResponseType(; requestId=nothing, bundleInstanceTask=nothing) =
         new(requestId, bundleInstanceTask)
end
function CancelBundleTaskResponseType(pd::ETree)
    o = CancelBundleTaskResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(LibExpat.find(pd,"bundleInstanceTask[1]")) : nothing
    o
end

export CancelBundleTaskResponseType


type LaunchSpecificationResponseType
    imageId::Union{ASCIIString, Void}
    keyName::Union{ASCIIString, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    addressingType::Union{ASCIIString, Void}
    instanceType::Union{ASCIIString, Void}
    placement::Union{SpotPlacementRequestType, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{ASCIIString, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    LaunchSpecificationResponseType(; imageId=nothing, keyName=nothing, groupSet=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, keyName, groupSet, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationResponseType(pd::ETree)
    o = LaunchSpecificationResponseType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.addressingType = LibExpat.find(pd, "addressingType#string")
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(LibExpat.find(pd,"placement[1]")) : nothing
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LibExpat.find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LibExpat.find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LibExpat.find(pd, "ebsOptimized#string"))
    o
end

export LaunchSpecificationResponseType


type SecurityGroupItemType
    ownerId::Union{ASCIIString, Void}
    groupId::Union{ASCIIString, Void}
    groupName::Union{ASCIIString, Void}
    groupDescription::Union{ASCIIString, Void}
    vpcId::Union{ASCIIString, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}
    ipPermissionsEgress::Union{Vector{IpPermissionType}, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}

    SecurityGroupItemType(; ownerId=nothing, groupId=nothing, groupName=nothing, groupDescription=nothing, vpcId=nothing, ipPermissions=nothing, ipPermissionsEgress=nothing, tagSet=nothing) =
         new(ownerId, groupId, groupName, groupDescription, vpcId, ipPermissions, ipPermissionsEgress, tagSet)
end
function SecurityGroupItemType(pd::ETree)
    o = SecurityGroupItemType()
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.groupName = LibExpat.find(pd, "groupName#string")
    o.groupDescription = LibExpat.find(pd, "groupDescription#string")
    o.vpcId = LibExpat.find(pd, "vpcId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissions/item"))
    o.ipPermissionsEgress = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissionsEgress/item"))
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o
end

export SecurityGroupItemType


type CreateNetworkAclResponseType
    requestId::Union{ASCIIString, Void}
    networkAcl::Union{NetworkAclType, Void}

    CreateNetworkAclResponseType(; requestId=nothing, networkAcl=nothing) =
         new(requestId, networkAcl)
end
function CreateNetworkAclResponseType(pd::ETree)
    o = CreateNetworkAclResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.networkAcl = length(pd["networkAcl"]) > 0 ?  NetworkAclType(LibExpat.find(pd,"networkAcl[1]")) : nothing
    o
end

export CreateNetworkAclResponseType


type CreateVpnGatewayResponseType
    requestId::Union{ASCIIString, Void}
    vpnGateway::Union{VpnGatewayType, Void}

    CreateVpnGatewayResponseType(; requestId=nothing, vpnGateway=nothing) =
         new(requestId, vpnGateway)
end
function CreateVpnGatewayResponseType(pd::ETree)
    o = CreateVpnGatewayResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpnGateway = length(pd["vpnGateway"]) > 0 ?  VpnGatewayType(LibExpat.find(pd,"vpnGateway[1]")) : nothing
    o
end

export CreateVpnGatewayResponseType


type RunInstancesResponseType
    requestId::Union{ASCIIString, Void}
    reservationId::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    instancesSet::Union{Vector{RunningInstancesItemType}, Void}
    requesterId::Union{ASCIIString, Void}

    RunInstancesResponseType(; requestId=nothing, reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) =
         new(requestId, reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function RunInstancesResponseType(pd::ETree)
    o = RunInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservationId = LibExpat.find(pd, "reservationId#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, LibExpat.find(pd, "instancesSet/item"))
    o.requesterId = LibExpat.find(pd, "requesterId#string")
    o
end

export RunInstancesResponseType


type RevokeSecurityGroupEgressType
    groupId::Union{ASCIIString, Void}
    ipPermissions::Union{Vector{IpPermissionType}, Void}

    RevokeSecurityGroupEgressType(; groupId=nothing, ipPermissions=nothing) =
         new(groupId, ipPermissions)
end
function RevokeSecurityGroupEgressType(pd::ETree)
    o = RevokeSecurityGroupEgressType()
    o.groupId = LibExpat.find(pd, "groupId#string")
    o.ipPermissions = AWS.@parse_vector(AWS.EC2.IpPermissionType, LibExpat.find(pd, "ipPermissions/item"))
    o
end

export RevokeSecurityGroupEgressType


type DescribeNetworkAclsResponseType
    requestId::Union{ASCIIString, Void}
    networkAclSet::Union{Vector{NetworkAclType}, Void}

    DescribeNetworkAclsResponseType(; requestId=nothing, networkAclSet=nothing) =
         new(requestId, networkAclSet)
end
function DescribeNetworkAclsResponseType(pd::ETree)
    o = DescribeNetworkAclsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.networkAclSet = AWS.@parse_vector(AWS.EC2.NetworkAclType, LibExpat.find(pd, "networkAclSet/item"))
    o
end

export DescribeNetworkAclsResponseType


type DescribeNetworkInterfacesResponseType
    requestId::Union{ASCIIString, Void}
    networkInterfaceSet::Union{Vector{NetworkInterfaceType}, Void}

    DescribeNetworkInterfacesResponseType(; requestId=nothing, networkInterfaceSet=nothing) =
         new(requestId, networkInterfaceSet)
end
function DescribeNetworkInterfacesResponseType(pd::ETree)
    o = DescribeNetworkInterfacesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.NetworkInterfaceType, LibExpat.find(pd, "networkInterfaceSet/item"))
    o
end

export DescribeNetworkInterfacesResponseType


type DescribeReservedInstancesOfferingsResponseType
    requestId::Union{ASCIIString, Void}
    reservedInstancesOfferingsSet::Union{Vector{DescribeReservedInstancesOfferingsResponseSetItemType}, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeReservedInstancesOfferingsResponseType(; requestId=nothing, reservedInstancesOfferingsSet=nothing, nextToken=nothing) =
         new(requestId, reservedInstancesOfferingsSet, nextToken)
end
function DescribeReservedInstancesOfferingsResponseType(pd::ETree)
    o = DescribeReservedInstancesOfferingsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservedInstancesOfferingsSet = AWS.@parse_vector(AWS.EC2.DescribeReservedInstancesOfferingsResponseSetItemType, LibExpat.find(pd, "reservedInstancesOfferingsSet/item"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeReservedInstancesOfferingsResponseType


type SpotInstanceRequestSetItemType
    spotInstanceRequestId::Union{ASCIIString, Void}
    spotPrice::Union{ASCIIString, Void}
    _type::Union{ASCIIString, Void}
    state::Union{ASCIIString, Void}
    fault::Union{SpotInstanceStateFaultType, Void}
    status::Union{SpotInstanceStatusMessageType, Void}
    validFrom::Union{Base.Dates.DateTime, Void}
    validUntil::Union{Base.Dates.DateTime, Void}
    launchGroup::Union{ASCIIString, Void}
    availabilityZoneGroup::Union{ASCIIString, Void}
    launchSpecification::Union{LaunchSpecificationResponseType, Void}
    instanceId::Union{ASCIIString, Void}
    createTime::Union{Base.Dates.DateTime, Void}
    productDescription::Union{ASCIIString, Void}
    tagSet::Union{Vector{ResourceTagSetItemType}, Void}
    launchedAvailabilityZone::Union{ASCIIString, Void}

    SpotInstanceRequestSetItemType(; spotInstanceRequestId=nothing, spotPrice=nothing, _type=nothing, state=nothing, fault=nothing, status=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing, instanceId=nothing, createTime=nothing, productDescription=nothing, tagSet=nothing, launchedAvailabilityZone=nothing) =
         new(spotInstanceRequestId, spotPrice, _type, state, fault, status, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification, instanceId, createTime, productDescription, tagSet, launchedAvailabilityZone)
end
function SpotInstanceRequestSetItemType(pd::ETree)
    o = SpotInstanceRequestSetItemType()
    o.spotInstanceRequestId = LibExpat.find(pd, "spotInstanceRequestId#string")
    o.spotPrice = LibExpat.find(pd, "spotPrice#string")
    o._type = LibExpat.find(pd, "type#string")
    o.state = LibExpat.find(pd, "state#string")
    o.fault = length(pd["fault"]) > 0 ?  SpotInstanceStateFaultType(LibExpat.find(pd,"fault[1]")) : nothing
    o.status = length(pd["status"]) > 0 ?  SpotInstanceStatusMessageType(LibExpat.find(pd,"status[1]")) : nothing
    o.validFrom = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "validFrom#string"))
    o.validUntil = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "validUntil#string"))
    o.launchGroup = LibExpat.find(pd, "launchGroup#string")
    o.availabilityZoneGroup = LibExpat.find(pd, "availabilityZoneGroup#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationResponseType(LibExpat.find(pd,"launchSpecification[1]")) : nothing
    o.instanceId = LibExpat.find(pd, "instanceId#string")
    o.createTime = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "createTime#string"))
    o.productDescription = LibExpat.find(pd, "productDescription#string")
    o.tagSet = AWS.@parse_vector(AWS.EC2.ResourceTagSetItemType, LibExpat.find(pd, "tagSet/item"))
    o.launchedAvailabilityZone = LibExpat.find(pd, "launchedAvailabilityZone#string")
    o
end

export SpotInstanceRequestSetItemType


type ImportInstanceResponseType
    requestId::Union{ASCIIString, Void}
    conversionTask::Union{ConversionTaskType, Void}

    ImportInstanceResponseType(; requestId=nothing, conversionTask=nothing) =
         new(requestId, conversionTask)
end
function ImportInstanceResponseType(pd::ETree)
    o = ImportInstanceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.conversionTask = length(pd["conversionTask"]) > 0 ?  ConversionTaskType(LibExpat.find(pd,"conversionTask[1]")) : nothing
    o
end

export ImportInstanceResponseType


type VolumeStatusItemType
    volumeId::Union{ASCIIString, Void}
    availabilityZone::Union{ASCIIString, Void}
    volumeStatus::Union{VolumeStatusInfoType, Void}
    eventsSet::Union{Vector{VolumeStatusEventItemType}, Void}
    actionsSet::Union{Vector{VolumeStatusActionItemType}, Void}

    VolumeStatusItemType(; volumeId=nothing, availabilityZone=nothing, volumeStatus=nothing, eventsSet=nothing, actionsSet=nothing) =
         new(volumeId, availabilityZone, volumeStatus, eventsSet, actionsSet)
end
function VolumeStatusItemType(pd::ETree)
    o = VolumeStatusItemType()
    o.volumeId = LibExpat.find(pd, "volumeId#string")
    o.availabilityZone = LibExpat.find(pd, "availabilityZone#string")
    o.volumeStatus = length(pd["volumeStatus"]) > 0 ?  VolumeStatusInfoType(LibExpat.find(pd,"volumeStatus[1]")) : nothing
    o.eventsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusEventItemType, LibExpat.find(pd, "eventsSet/item"))
    o.actionsSet = AWS.@parse_vector(AWS.EC2.VolumeStatusActionItemType, LibExpat.find(pd, "actionsSet/item"))
    o
end

export VolumeStatusItemType


type DescribeSpotInstanceRequestsResponseType
    requestId::Union{ASCIIString, Void}
    spotInstanceRequestSet::Union{Vector{SpotInstanceRequestSetItemType}, Void}

    DescribeSpotInstanceRequestsResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function DescribeSpotInstanceRequestsResponseType(pd::ETree)
    o = DescribeSpotInstanceRequestsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, LibExpat.find(pd, "spotInstanceRequestSet/item"))
    o
end

export DescribeSpotInstanceRequestsResponseType


type DescribeCustomerGatewaysResponseType
    requestId::Union{ASCIIString, Void}
    customerGatewaySet::Union{Vector{CustomerGatewayType}, Void}

    DescribeCustomerGatewaysResponseType(; requestId=nothing, customerGatewaySet=nothing) =
         new(requestId, customerGatewaySet)
end
function DescribeCustomerGatewaysResponseType(pd::ETree)
    o = DescribeCustomerGatewaysResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.customerGatewaySet = AWS.@parse_vector(AWS.EC2.CustomerGatewayType, LibExpat.find(pd, "customerGatewaySet/item"))
    o
end

export DescribeCustomerGatewaysResponseType


type DescribeVolumeStatusResponseType
    requestId::Union{ASCIIString, Void}
    volumeStatusSet::Union{Vector{VolumeStatusItemType}, Void}
    nextToken::Union{ASCIIString, Void}

    DescribeVolumeStatusResponseType(; requestId=nothing, volumeStatusSet=nothing, nextToken=nothing) =
         new(requestId, volumeStatusSet, nextToken)
end
function DescribeVolumeStatusResponseType(pd::ETree)
    o = DescribeVolumeStatusResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.volumeStatusSet = AWS.@parse_vector(AWS.EC2.VolumeStatusItemType, LibExpat.find(pd, "volumeStatusSet/item"))
    o.nextToken = LibExpat.find(pd, "nextToken#string")
    o
end

export DescribeVolumeStatusResponseType


type DescribeVpnGatewaysResponseType
    requestId::Union{ASCIIString, Void}
    vpnGatewaySet::Union{Vector{VpnGatewayType}, Void}

    DescribeVpnGatewaysResponseType(; requestId=nothing, vpnGatewaySet=nothing) =
         new(requestId, vpnGatewaySet)
end
function DescribeVpnGatewaysResponseType(pd::ETree)
    o = DescribeVpnGatewaysResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.vpnGatewaySet = AWS.@parse_vector(AWS.EC2.VpnGatewayType, LibExpat.find(pd, "vpnGatewaySet/item"))
    o
end

export DescribeVpnGatewaysResponseType


type LaunchSpecificationRequestType
    imageId::Union{ASCIIString, Void}
    keyName::Union{ASCIIString, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    userData::Union{UserDataType, Void}
    addressingType::Union{ASCIIString, Void}
    instanceType::Union{ASCIIString, Void}
    placement::Union{SpotPlacementRequestType, Void}
    kernelId::Union{ASCIIString, Void}
    ramdiskId::Union{ASCIIString, Void}
    blockDeviceMapping::Union{Vector{BlockDeviceMappingItemType}, Void}
    monitoring::Union{MonitoringInstanceType, Void}
    subnetId::Union{ASCIIString, Void}
    networkInterfaceSet::Union{Vector{InstanceNetworkInterfaceSetItemRequestType}, Void}
    iamInstanceProfile::Union{IamInstanceProfileRequestType, Void}
    ebsOptimized::Union{Bool, Void}

    LaunchSpecificationRequestType(; imageId=nothing, keyName=nothing, groupSet=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, keyName, groupSet, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
function LaunchSpecificationRequestType(pd::ETree)
    o = LaunchSpecificationRequestType()
    o.imageId = LibExpat.find(pd, "imageId#string")
    o.keyName = LibExpat.find(pd, "keyName#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.userData = length(pd["userData"]) > 0 ?  UserDataType(LibExpat.find(pd,"userData[1]")) : nothing
    o.addressingType = LibExpat.find(pd, "addressingType#string")
    o.instanceType = LibExpat.find(pd, "instanceType#string")
    o.placement = length(pd["placement"]) > 0 ?  SpotPlacementRequestType(LibExpat.find(pd,"placement[1]")) : nothing
    o.kernelId = LibExpat.find(pd, "kernelId#string")
    o.ramdiskId = LibExpat.find(pd, "ramdiskId#string")
    o.blockDeviceMapping = AWS.@parse_vector(AWS.EC2.BlockDeviceMappingItemType, LibExpat.find(pd, "blockDeviceMapping/item"))
    o.monitoring = length(pd["monitoring"]) > 0 ?  MonitoringInstanceType(LibExpat.find(pd,"monitoring[1]")) : nothing
    o.subnetId = LibExpat.find(pd, "subnetId#string")
    o.networkInterfaceSet = AWS.@parse_vector(AWS.EC2.InstanceNetworkInterfaceSetItemRequestType, LibExpat.find(pd, "networkInterfaceSet/item"))
    o.iamInstanceProfile = length(pd["iamInstanceProfile"]) > 0 ?  IamInstanceProfileRequestType(LibExpat.find(pd,"iamInstanceProfile[1]")) : nothing
    o.ebsOptimized = AWS.safe_parse_as(Bool, LibExpat.find(pd, "ebsOptimized#string"))
    o
end

export LaunchSpecificationRequestType


type ReservationInfoType
    reservationId::Union{ASCIIString, Void}
    ownerId::Union{ASCIIString, Void}
    groupSet::Union{Vector{GroupItemType}, Void}
    instancesSet::Union{Vector{RunningInstancesItemType}, Void}
    requesterId::Union{ASCIIString, Void}

    ReservationInfoType(; reservationId=nothing, ownerId=nothing, groupSet=nothing, instancesSet=nothing, requesterId=nothing) =
         new(reservationId, ownerId, groupSet, instancesSet, requesterId)
end
function ReservationInfoType(pd::ETree)
    o = ReservationInfoType()
    o.reservationId = LibExpat.find(pd, "reservationId#string")
    o.ownerId = LibExpat.find(pd, "ownerId#string")
    o.groupSet = AWS.@parse_vector(AWS.EC2.GroupItemType, LibExpat.find(pd, "groupSet/item"))
    o.instancesSet = AWS.@parse_vector(AWS.EC2.RunningInstancesItemType, LibExpat.find(pd, "instancesSet/item"))
    o.requesterId = LibExpat.find(pd, "requesterId#string")
    o
end

export ReservationInfoType


type DescribeBundleTasksResponseType
    requestId::Union{ASCIIString, Void}
    bundleInstanceTasksSet::Union{Vector{BundleInstanceTaskType}, Void}

    DescribeBundleTasksResponseType(; requestId=nothing, bundleInstanceTasksSet=nothing) =
         new(requestId, bundleInstanceTasksSet)
end
function DescribeBundleTasksResponseType(pd::ETree)
    o = DescribeBundleTasksResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.bundleInstanceTasksSet = AWS.@parse_vector(AWS.EC2.BundleInstanceTaskType, LibExpat.find(pd, "bundleInstanceTasksSet/item"))
    o
end

export DescribeBundleTasksResponseType


type CreateRouteTableResponseType
    requestId::Union{ASCIIString, Void}
    routeTable::Union{RouteTableType, Void}

    CreateRouteTableResponseType(; requestId=nothing, routeTable=nothing) =
         new(requestId, routeTable)
end
function CreateRouteTableResponseType(pd::ETree)
    o = CreateRouteTableResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.routeTable = length(pd["routeTable"]) > 0 ?  RouteTableType(LibExpat.find(pd,"routeTable[1]")) : nothing
    o
end

export CreateRouteTableResponseType


type RequestSpotInstancesResponseType
    requestId::Union{ASCIIString, Void}
    spotInstanceRequestSet::Union{Vector{SpotInstanceRequestSetItemType}, Void}

    RequestSpotInstancesResponseType(; requestId=nothing, spotInstanceRequestSet=nothing) =
         new(requestId, spotInstanceRequestSet)
end
function RequestSpotInstancesResponseType(pd::ETree)
    o = RequestSpotInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.spotInstanceRequestSet = AWS.@parse_vector(AWS.EC2.SpotInstanceRequestSetItemType, LibExpat.find(pd, "spotInstanceRequestSet/item"))
    o
end

export RequestSpotInstancesResponseType


type DescribeSubnetsResponseType
    requestId::Union{ASCIIString, Void}
    subnetSet::Union{Vector{SubnetType}, Void}

    DescribeSubnetsResponseType(; requestId=nothing, subnetSet=nothing) =
         new(requestId, subnetSet)
end
function DescribeSubnetsResponseType(pd::ETree)
    o = DescribeSubnetsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.subnetSet = AWS.@parse_vector(AWS.EC2.SubnetType, LibExpat.find(pd, "subnetSet/item"))
    o
end

export DescribeSubnetsResponseType


type RequestSpotInstancesType
    spotPrice::Union{ASCIIString, Void}
    instanceCount::Union{Int64, Void}
    _type::Union{ASCIIString, Void}
    validFrom::Union{Base.Dates.DateTime, Void}
    validUntil::Union{Base.Dates.DateTime, Void}
    launchGroup::Union{ASCIIString, Void}
    availabilityZoneGroup::Union{ASCIIString, Void}
    launchSpecification::Union{LaunchSpecificationRequestType, Void}

    RequestSpotInstancesType(; spotPrice=nothing, instanceCount=nothing, _type=nothing, validFrom=nothing, validUntil=nothing, launchGroup=nothing, availabilityZoneGroup=nothing, launchSpecification=nothing) =
         new(spotPrice, instanceCount, _type, validFrom, validUntil, launchGroup, availabilityZoneGroup, launchSpecification)
end
function RequestSpotInstancesType(pd::ETree)
    o = RequestSpotInstancesType()
    o.spotPrice = LibExpat.find(pd, "spotPrice#string")
    o.instanceCount = AWS.safe_parse_as(Int64, LibExpat.find(pd, "instanceCount#string"))
    o._type = LibExpat.find(pd, "type#string")
    o.validFrom = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "validFrom#string"))
    o.validUntil = AWS.safe_parse_as(Base.Dates.DateTime, LibExpat.find(pd, "validUntil#string"))
    o.launchGroup = LibExpat.find(pd, "launchGroup#string")
    o.availabilityZoneGroup = LibExpat.find(pd, "availabilityZoneGroup#string")
    o.launchSpecification = length(pd["launchSpecification"]) > 0 ?  LaunchSpecificationRequestType(LibExpat.find(pd,"launchSpecification[1]")) : nothing
    o
end

export RequestSpotInstancesType


type BundleInstanceResponseType
    requestId::Union{ASCIIString, Void}
    bundleInstanceTask::Union{BundleInstanceTaskType, Void}

    BundleInstanceResponseType(; requestId=nothing, bundleInstanceTask=nothing) =
         new(requestId, bundleInstanceTask)
end
function BundleInstanceResponseType(pd::ETree)
    o = BundleInstanceResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.bundleInstanceTask = length(pd["bundleInstanceTask"]) > 0 ?  BundleInstanceTaskType(LibExpat.find(pd,"bundleInstanceTask[1]")) : nothing
    o
end

export BundleInstanceResponseType


type DescribeInstancesResponseType
    requestId::Union{ASCIIString, Void}
    reservationSet::Union{Vector{ReservationInfoType}, Void}

    DescribeInstancesResponseType(; requestId=nothing, reservationSet=nothing) =
         new(requestId, reservationSet)
end
function DescribeInstancesResponseType(pd::ETree)
    o = DescribeInstancesResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.reservationSet = AWS.@parse_vector(AWS.EC2.ReservationInfoType, LibExpat.find(pd, "reservationSet/item"))
    o
end

export DescribeInstancesResponseType


type DescribeSecurityGroupsResponseType
    requestId::Union{ASCIIString, Void}
    securityGroupInfo::Union{Vector{SecurityGroupItemType}, Void}

    DescribeSecurityGroupsResponseType(; requestId=nothing, securityGroupInfo=nothing) =
         new(requestId, securityGroupInfo)
end
function DescribeSecurityGroupsResponseType(pd::ETree)
    o = DescribeSecurityGroupsResponseType()
    o.requestId = LibExpat.find(pd, "requestId#string")
    o.securityGroupInfo = AWS.@parse_vector(AWS.EC2.SecurityGroupItemType, LibExpat.find(pd, "securityGroupInfo/item"))
    o
end

export DescribeSecurityGroupsResponseType


