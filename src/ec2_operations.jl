function ActivateLicense(env::AWSEnv, msg::ActivateLicenseType)
    ec2resp::EC2Response = call_ec2(env, "ActivateLicense" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ActivateLicenseResponseType(ec2resp.pd)
    end
    ec2resp
end
function ActivateLicense(env::AWSEnv; kwargs...)
    msg=ActivateLicenseType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ActivateLicense(env, msg)
end
export ActivateLicense


function AllocateAddress(env::AWSEnv, msg::AllocateAddressType)
    ec2resp::EC2Response = call_ec2(env, "AllocateAddress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AllocateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
function AllocateAddress(env::AWSEnv; kwargs...)
    msg=AllocateAddressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AllocateAddress(env, msg)
end
export AllocateAddress


function AssignPrivateIpAddresses(env::AWSEnv, msg::AssignPrivateIpAddressesType)
    ec2resp::EC2Response = call_ec2(env, "AssignPrivateIpAddresses" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AssignPrivateIpAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
function AssignPrivateIpAddresses(env::AWSEnv; kwargs...)
    msg=AssignPrivateIpAddressesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AssignPrivateIpAddresses(env, msg)
end
export AssignPrivateIpAddresses


function AssociateAddress(env::AWSEnv, msg::AssociateAddressType)
    ec2resp::EC2Response = call_ec2(env, "AssociateAddress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AssociateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
function AssociateAddress(env::AWSEnv; kwargs...)
    msg=AssociateAddressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AssociateAddress(env, msg)
end
export AssociateAddress


function AssociateDhcpOptions(env::AWSEnv, msg::AssociateDhcpOptionsType)
    ec2resp::EC2Response = call_ec2(env, "AssociateDhcpOptions" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AssociateDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function AssociateDhcpOptions(env::AWSEnv; kwargs...)
    msg=AssociateDhcpOptionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AssociateDhcpOptions(env, msg)
end
export AssociateDhcpOptions


function AssociateRouteTable(env::AWSEnv, msg::AssociateRouteTableType)
    ec2resp::EC2Response = call_ec2(env, "AssociateRouteTable" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AssociateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
function AssociateRouteTable(env::AWSEnv; kwargs...)
    msg=AssociateRouteTableType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AssociateRouteTable(env, msg)
end
export AssociateRouteTable


function AttachInternetGateway(env::AWSEnv, msg::AttachInternetGatewayType)
    ec2resp::EC2Response = call_ec2(env, "AttachInternetGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AttachInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function AttachInternetGateway(env::AWSEnv; kwargs...)
    msg=AttachInternetGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AttachInternetGateway(env, msg)
end
export AttachInternetGateway


function AttachNetworkInterface(env::AWSEnv, msg::AttachNetworkInterfaceType)
    ec2resp::EC2Response = call_ec2(env, "AttachNetworkInterface" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AttachNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
function AttachNetworkInterface(env::AWSEnv; kwargs...)
    msg=AttachNetworkInterfaceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AttachNetworkInterface(env, msg)
end
export AttachNetworkInterface


function AttachVolume(env::AWSEnv, msg::AttachVolumeType)
    ec2resp::EC2Response = call_ec2(env, "AttachVolume" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AttachVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
function AttachVolume(env::AWSEnv; kwargs...)
    msg=AttachVolumeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AttachVolume(env, msg)
end
export AttachVolume


function AttachVpnGateway(env::AWSEnv, msg::AttachVpnGatewayType)
    ec2resp::EC2Response = call_ec2(env, "AttachVpnGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AttachVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function AttachVpnGateway(env::AWSEnv; kwargs...)
    msg=AttachVpnGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AttachVpnGateway(env, msg)
end
export AttachVpnGateway


function AuthorizeSecurityGroupEgress(env::AWSEnv, msg::AuthorizeSecurityGroupEgressType)
    ec2resp::EC2Response = call_ec2(env, "AuthorizeSecurityGroupEgress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AuthorizeSecurityGroupEgressResponseType(ec2resp.pd)
    end
    ec2resp
end
function AuthorizeSecurityGroupEgress(env::AWSEnv; kwargs...)
    msg=AuthorizeSecurityGroupEgressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AuthorizeSecurityGroupEgress(env, msg)
end
export AuthorizeSecurityGroupEgress


function AuthorizeSecurityGroupIngress(env::AWSEnv, msg::AuthorizeSecurityGroupIngressType)
    ec2resp::EC2Response = call_ec2(env, "AuthorizeSecurityGroupIngress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = AuthorizeSecurityGroupIngressResponseType(ec2resp.pd)
    end
    ec2resp
end
function AuthorizeSecurityGroupIngress(env::AWSEnv; kwargs...)
    msg=AuthorizeSecurityGroupIngressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AuthorizeSecurityGroupIngress(env, msg)
end
export AuthorizeSecurityGroupIngress


function BundleInstance(env::AWSEnv, msg::BundleInstanceType)
    ec2resp::EC2Response = call_ec2(env, "BundleInstance" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = BundleInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
function BundleInstance(env::AWSEnv; kwargs...)
    msg=BundleInstanceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    BundleInstance(env, msg)
end
export BundleInstance


function CancelBundleTask(env::AWSEnv, msg::CancelBundleTaskType)
    ec2resp::EC2Response = call_ec2(env, "CancelBundleTask" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CancelBundleTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
function CancelBundleTask(env::AWSEnv; kwargs...)
    msg=CancelBundleTaskType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CancelBundleTask(env, msg)
end
export CancelBundleTask


function CancelConversionTask(env::AWSEnv, msg::CancelConversionTaskType)
    ec2resp::EC2Response = call_ec2(env, "CancelConversionTask" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CancelConversionTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
function CancelConversionTask(env::AWSEnv; kwargs...)
    msg=CancelConversionTaskType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CancelConversionTask(env, msg)
end
export CancelConversionTask


function CancelExportTask(env::AWSEnv, msg::CancelExportTaskType)
    ec2resp::EC2Response = call_ec2(env, "CancelExportTask" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CancelExportTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
function CancelExportTask(env::AWSEnv; kwargs...)
    msg=CancelExportTaskType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CancelExportTask(env, msg)
end
export CancelExportTask


function CancelReservedInstancesListing(env::AWSEnv, msg::CancelReservedInstancesListingType)
    ec2resp::EC2Response = call_ec2(env, "CancelReservedInstancesListing" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CancelReservedInstancesListingResponseType(ec2resp.pd)
    end
    ec2resp
end
function CancelReservedInstancesListing(env::AWSEnv; kwargs...)
    msg=CancelReservedInstancesListingType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CancelReservedInstancesListing(env, msg)
end
export CancelReservedInstancesListing


function CancelSpotInstanceRequests(env::AWSEnv, msg::CancelSpotInstanceRequestsType)
    ec2resp::EC2Response = call_ec2(env, "CancelSpotInstanceRequests" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CancelSpotInstanceRequestsResponseType(ec2resp.pd)
    end
    ec2resp
end
function CancelSpotInstanceRequests(env::AWSEnv; kwargs...)
    msg=CancelSpotInstanceRequestsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CancelSpotInstanceRequests(env, msg)
end
export CancelSpotInstanceRequests


function ConfirmProductInstance(env::AWSEnv, msg::ConfirmProductInstanceType)
    ec2resp::EC2Response = call_ec2(env, "ConfirmProductInstance" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ConfirmProductInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
function ConfirmProductInstance(env::AWSEnv; kwargs...)
    msg=ConfirmProductInstanceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ConfirmProductInstance(env, msg)
end
export ConfirmProductInstance


function CopyImage(env::AWSEnv, msg::CopyImageType)
    ec2resp::EC2Response = call_ec2(env, "CopyImage" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CopyImageResponseType(ec2resp.pd)
    end
    ec2resp
end
function CopyImage(env::AWSEnv; kwargs...)
    msg=CopyImageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CopyImage(env, msg)
end
export CopyImage


function CopySnapshot(env::AWSEnv, msg::CopySnapshotType)
    ec2resp::EC2Response = call_ec2(env, "CopySnapshot" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CopySnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
function CopySnapshot(env::AWSEnv; kwargs...)
    msg=CopySnapshotType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CopySnapshot(env, msg)
end
export CopySnapshot


function CreateCustomerGateway(env::AWSEnv, msg::CreateCustomerGatewayType)
    ec2resp::EC2Response = call_ec2(env, "CreateCustomerGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateCustomerGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateCustomerGateway(env::AWSEnv; kwargs...)
    msg=CreateCustomerGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateCustomerGateway(env, msg)
end
export CreateCustomerGateway


function CreateDhcpOptions(env::AWSEnv, msg::CreateDhcpOptionsType)
    ec2resp::EC2Response = call_ec2(env, "CreateDhcpOptions" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateDhcpOptions(env::AWSEnv; kwargs...)
    msg=CreateDhcpOptionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateDhcpOptions(env, msg)
end
export CreateDhcpOptions


function CreateImage(env::AWSEnv, msg::CreateImageType)
    ec2resp::EC2Response = call_ec2(env, "CreateImage" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateImageResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateImage(env::AWSEnv; kwargs...)
    msg=CreateImageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateImage(env, msg)
end
export CreateImage


function CreateInstanceExportTask(env::AWSEnv, msg::CreateInstanceExportTaskType)
    ec2resp::EC2Response = call_ec2(env, "CreateInstanceExportTask" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateInstanceExportTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateInstanceExportTask(env::AWSEnv; kwargs...)
    msg=CreateInstanceExportTaskType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateInstanceExportTask(env, msg)
end
export CreateInstanceExportTask


function CreateInternetGateway(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "CreateInternetGateway" )
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end

export CreateInternetGateway


function CreateKeyPair(env::AWSEnv, msg::CreateKeyPairType)
    ec2resp::EC2Response = call_ec2(env, "CreateKeyPair" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateKeyPair(env::AWSEnv; kwargs...)
    msg=CreateKeyPairType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateKeyPair(env, msg)
end
export CreateKeyPair


function CreateNetworkAcl(env::AWSEnv, msg::CreateNetworkAclType)
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkAcl" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateNetworkAclResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateNetworkAcl(env::AWSEnv; kwargs...)
    msg=CreateNetworkAclType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateNetworkAcl(env, msg)
end
export CreateNetworkAcl


function CreateNetworkAclEntry(env::AWSEnv, msg::CreateNetworkAclEntryType)
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateNetworkAclEntry(env::AWSEnv; kwargs...)
    msg=CreateNetworkAclEntryType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateNetworkAclEntry(env, msg)
end
export CreateNetworkAclEntry


function CreateNetworkInterface(env::AWSEnv, msg::CreateNetworkInterfaceType)
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkInterface" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateNetworkInterface(env::AWSEnv; kwargs...)
    msg=CreateNetworkInterfaceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateNetworkInterface(env, msg)
end
export CreateNetworkInterface


function CreatePlacementGroup(env::AWSEnv, msg::CreatePlacementGroupType)
    ec2resp::EC2Response = call_ec2(env, "CreatePlacementGroup" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreatePlacementGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreatePlacementGroup(env::AWSEnv; kwargs...)
    msg=CreatePlacementGroupType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreatePlacementGroup(env, msg)
end
export CreatePlacementGroup


function CreateReservedInstancesListing(env::AWSEnv, msg::CreateReservedInstancesListingType)
    ec2resp::EC2Response = call_ec2(env, "CreateReservedInstancesListing" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateReservedInstancesListingResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateReservedInstancesListing(env::AWSEnv; kwargs...)
    msg=CreateReservedInstancesListingType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateReservedInstancesListing(env, msg)
end
export CreateReservedInstancesListing


function CreateRoute(env::AWSEnv, msg::CreateRouteType)
    ec2resp::EC2Response = call_ec2(env, "CreateRoute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateRoute(env::AWSEnv; kwargs...)
    msg=CreateRouteType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateRoute(env, msg)
end
export CreateRoute


function CreateRouteTable(env::AWSEnv, msg::CreateRouteTableType)
    ec2resp::EC2Response = call_ec2(env, "CreateRouteTable" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateRouteTable(env::AWSEnv; kwargs...)
    msg=CreateRouteTableType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateRouteTable(env, msg)
end
export CreateRouteTable


function CreateSecurityGroup(env::AWSEnv, msg::CreateSecurityGroupType)
    ec2resp::EC2Response = call_ec2(env, "CreateSecurityGroup" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateSecurityGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateSecurityGroup(env::AWSEnv; kwargs...)
    msg=CreateSecurityGroupType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateSecurityGroup(env, msg)
end
export CreateSecurityGroup


function CreateSnapshot(env::AWSEnv, msg::CreateSnapshotType)
    ec2resp::EC2Response = call_ec2(env, "CreateSnapshot" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateSnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateSnapshot(env::AWSEnv; kwargs...)
    msg=CreateSnapshotType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateSnapshot(env, msg)
end
export CreateSnapshot


function CreateSpotDatafeedSubscription(env::AWSEnv, msg::CreateSpotDatafeedSubscriptionType)
    ec2resp::EC2Response = call_ec2(env, "CreateSpotDatafeedSubscription" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateSpotDatafeedSubscription(env::AWSEnv; kwargs...)
    msg=CreateSpotDatafeedSubscriptionType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateSpotDatafeedSubscription(env, msg)
end
export CreateSpotDatafeedSubscription


function CreateSubnet(env::AWSEnv, msg::CreateSubnetType)
    ec2resp::EC2Response = call_ec2(env, "CreateSubnet" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateSubnetResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateSubnet(env::AWSEnv; kwargs...)
    msg=CreateSubnetType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateSubnet(env, msg)
end
export CreateSubnet


function CreateTags(env::AWSEnv, msg::CreateTagsType)
    ec2resp::EC2Response = call_ec2(env, "CreateTags" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateTags(env::AWSEnv; kwargs...)
    msg=CreateTagsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateTags(env, msg)
end
export CreateTags


function CreateVolume(env::AWSEnv, msg::CreateVolumeType)
    ec2resp::EC2Response = call_ec2(env, "CreateVolume" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateVolume(env::AWSEnv; kwargs...)
    msg=CreateVolumeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateVolume(env, msg)
end
export CreateVolume


function CreateVpc(env::AWSEnv, msg::CreateVpcType)
    ec2resp::EC2Response = call_ec2(env, "CreateVpc" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateVpcResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateVpc(env::AWSEnv; kwargs...)
    msg=CreateVpcType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateVpc(env, msg)
end
export CreateVpc


function CreateVpnConnection(env::AWSEnv, msg::CreateVpnConnectionType)
    ec2resp::EC2Response = call_ec2(env, "CreateVpnConnection" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateVpnConnectionResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateVpnConnection(env::AWSEnv; kwargs...)
    msg=CreateVpnConnectionType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateVpnConnection(env, msg)
end
export CreateVpnConnection


function CreateVpnConnectionRoute(env::AWSEnv, msg::CreateVpnConnectionRouteType)
    ec2resp::EC2Response = call_ec2(env, "CreateVpnConnectionRoute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateVpnConnectionRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateVpnConnectionRoute(env::AWSEnv; kwargs...)
    msg=CreateVpnConnectionRouteType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateVpnConnectionRoute(env, msg)
end
export CreateVpnConnectionRoute


function CreateVpnGateway(env::AWSEnv, msg::CreateVpnGatewayType)
    ec2resp::EC2Response = call_ec2(env, "CreateVpnGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = CreateVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function CreateVpnGateway(env::AWSEnv; kwargs...)
    msg=CreateVpnGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateVpnGateway(env, msg)
end
export CreateVpnGateway


function DeactivateLicense(env::AWSEnv, msg::DeactivateLicenseType)
    ec2resp::EC2Response = call_ec2(env, "DeactivateLicense" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeactivateLicenseResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeactivateLicense(env::AWSEnv; kwargs...)
    msg=DeactivateLicenseType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeactivateLicense(env, msg)
end
export DeactivateLicense


function DeleteCustomerGateway(env::AWSEnv, msg::DeleteCustomerGatewayType)
    ec2resp::EC2Response = call_ec2(env, "DeleteCustomerGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteCustomerGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteCustomerGateway(env::AWSEnv; kwargs...)
    msg=DeleteCustomerGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteCustomerGateway(env, msg)
end
export DeleteCustomerGateway


function DeleteDhcpOptions(env::AWSEnv, msg::DeleteDhcpOptionsType)
    ec2resp::EC2Response = call_ec2(env, "DeleteDhcpOptions" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteDhcpOptions(env::AWSEnv; kwargs...)
    msg=DeleteDhcpOptionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteDhcpOptions(env, msg)
end
export DeleteDhcpOptions


function DeleteInternetGateway(env::AWSEnv, msg::DeleteInternetGatewayType)
    ec2resp::EC2Response = call_ec2(env, "DeleteInternetGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteInternetGateway(env::AWSEnv; kwargs...)
    msg=DeleteInternetGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteInternetGateway(env, msg)
end
export DeleteInternetGateway


function DeleteKeyPair(env::AWSEnv, msg::DeleteKeyPairType)
    ec2resp::EC2Response = call_ec2(env, "DeleteKeyPair" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteKeyPair(env::AWSEnv; kwargs...)
    msg=DeleteKeyPairType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteKeyPair(env, msg)
end
export DeleteKeyPair


function DeleteNetworkAcl(env::AWSEnv, msg::DeleteNetworkAclType)
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkAcl" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteNetworkAclResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteNetworkAcl(env::AWSEnv; kwargs...)
    msg=DeleteNetworkAclType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteNetworkAcl(env, msg)
end
export DeleteNetworkAcl


function DeleteNetworkAclEntry(env::AWSEnv, msg::DeleteNetworkAclEntryType)
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteNetworkAclEntry(env::AWSEnv; kwargs...)
    msg=DeleteNetworkAclEntryType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteNetworkAclEntry(env, msg)
end
export DeleteNetworkAclEntry


function DeleteNetworkInterface(env::AWSEnv, msg::DeleteNetworkInterfaceType)
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkInterface" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteNetworkInterface(env::AWSEnv; kwargs...)
    msg=DeleteNetworkInterfaceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteNetworkInterface(env, msg)
end
export DeleteNetworkInterface


function DeletePlacementGroup(env::AWSEnv, msg::DeletePlacementGroupType)
    ec2resp::EC2Response = call_ec2(env, "DeletePlacementGroup" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeletePlacementGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeletePlacementGroup(env::AWSEnv; kwargs...)
    msg=DeletePlacementGroupType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeletePlacementGroup(env, msg)
end
export DeletePlacementGroup


function DeleteRoute(env::AWSEnv, msg::DeleteRouteType)
    ec2resp::EC2Response = call_ec2(env, "DeleteRoute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteRoute(env::AWSEnv; kwargs...)
    msg=DeleteRouteType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteRoute(env, msg)
end
export DeleteRoute


function DeleteRouteTable(env::AWSEnv, msg::DeleteRouteTableType)
    ec2resp::EC2Response = call_ec2(env, "DeleteRouteTable" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteRouteTable(env::AWSEnv; kwargs...)
    msg=DeleteRouteTableType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteRouteTable(env, msg)
end
export DeleteRouteTable


function DeleteSecurityGroup(env::AWSEnv, msg::DeleteSecurityGroupType)
    ec2resp::EC2Response = call_ec2(env, "DeleteSecurityGroup" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteSecurityGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteSecurityGroup(env::AWSEnv; kwargs...)
    msg=DeleteSecurityGroupType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteSecurityGroup(env, msg)
end
export DeleteSecurityGroup


function DeleteSnapshot(env::AWSEnv, msg::DeleteSnapshotType)
    ec2resp::EC2Response = call_ec2(env, "DeleteSnapshot" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteSnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteSnapshot(env::AWSEnv; kwargs...)
    msg=DeleteSnapshotType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteSnapshot(env, msg)
end
export DeleteSnapshot


function DeleteSpotDatafeedSubscription(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "DeleteSpotDatafeedSubscription" )
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end

export DeleteSpotDatafeedSubscription


function DeleteSubnet(env::AWSEnv, msg::DeleteSubnetType)
    ec2resp::EC2Response = call_ec2(env, "DeleteSubnet" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteSubnetResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteSubnet(env::AWSEnv; kwargs...)
    msg=DeleteSubnetType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteSubnet(env, msg)
end
export DeleteSubnet


function DeleteTags(env::AWSEnv, msg::DeleteTagsType)
    ec2resp::EC2Response = call_ec2(env, "DeleteTags" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteTags(env::AWSEnv; kwargs...)
    msg=DeleteTagsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteTags(env, msg)
end
export DeleteTags


function DeleteVolume(env::AWSEnv, msg::DeleteVolumeType)
    ec2resp::EC2Response = call_ec2(env, "DeleteVolume" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteVolume(env::AWSEnv; kwargs...)
    msg=DeleteVolumeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteVolume(env, msg)
end
export DeleteVolume


function DeleteVpc(env::AWSEnv, msg::DeleteVpcType)
    ec2resp::EC2Response = call_ec2(env, "DeleteVpc" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteVpcResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteVpc(env::AWSEnv; kwargs...)
    msg=DeleteVpcType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteVpc(env, msg)
end
export DeleteVpc


function DeleteVpnConnection(env::AWSEnv, msg::DeleteVpnConnectionType)
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnConnection" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteVpnConnectionResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteVpnConnection(env::AWSEnv; kwargs...)
    msg=DeleteVpnConnectionType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteVpnConnection(env, msg)
end
export DeleteVpnConnection


function DeleteVpnConnectionRoute(env::AWSEnv, msg::DeleteVpnConnectionRouteType)
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnConnectionRoute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteVpnConnectionRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteVpnConnectionRoute(env::AWSEnv; kwargs...)
    msg=DeleteVpnConnectionRouteType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteVpnConnectionRoute(env, msg)
end
export DeleteVpnConnectionRoute


function DeleteVpnGateway(env::AWSEnv, msg::DeleteVpnGatewayType)
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeleteVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeleteVpnGateway(env::AWSEnv; kwargs...)
    msg=DeleteVpnGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteVpnGateway(env, msg)
end
export DeleteVpnGateway


function DeregisterImage(env::AWSEnv, msg::DeregisterImageType)
    ec2resp::EC2Response = call_ec2(env, "DeregisterImage" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DeregisterImageResponseType(ec2resp.pd)
    end
    ec2resp
end
function DeregisterImage(env::AWSEnv; kwargs...)
    msg=DeregisterImageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeregisterImage(env, msg)
end
export DeregisterImage


function DescribeAccountAttributes(env::AWSEnv, msg::DescribeAccountAttributesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeAccountAttributes" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeAccountAttributesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeAccountAttributes(env::AWSEnv; kwargs...)
    msg=DescribeAccountAttributesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeAccountAttributes(env, msg)
end
export DescribeAccountAttributes


function DescribeAddresses(env::AWSEnv, msg::DescribeAddressesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeAddresses" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeAddresses(env::AWSEnv; kwargs...)
    msg=DescribeAddressesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeAddresses(env, msg)
end
export DescribeAddresses


function DescribeAvailabilityZones(env::AWSEnv, msg::DescribeAvailabilityZonesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeAvailabilityZones" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeAvailabilityZonesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeAvailabilityZones(env::AWSEnv; kwargs...)
    msg=DescribeAvailabilityZonesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeAvailabilityZones(env, msg)
end
export DescribeAvailabilityZones


function DescribeBundleTasks(env::AWSEnv, msg::DescribeBundleTasksType)
    ec2resp::EC2Response = call_ec2(env, "DescribeBundleTasks" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeBundleTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeBundleTasks(env::AWSEnv; kwargs...)
    msg=DescribeBundleTasksType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeBundleTasks(env, msg)
end
export DescribeBundleTasks


function DescribeConversionTasks(env::AWSEnv, msg::DescribeConversionTasksType)
    ec2resp::EC2Response = call_ec2(env, "DescribeConversionTasks" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeConversionTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeConversionTasks(env::AWSEnv; kwargs...)
    msg=DescribeConversionTasksType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeConversionTasks(env, msg)
end
export DescribeConversionTasks


function DescribeCustomerGateways(env::AWSEnv, msg::DescribeCustomerGatewaysType)
    ec2resp::EC2Response = call_ec2(env, "DescribeCustomerGateways" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeCustomerGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeCustomerGateways(env::AWSEnv; kwargs...)
    msg=DescribeCustomerGatewaysType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeCustomerGateways(env, msg)
end
export DescribeCustomerGateways


function DescribeDhcpOptions(env::AWSEnv, msg::DescribeDhcpOptionsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeDhcpOptions" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeDhcpOptions(env::AWSEnv; kwargs...)
    msg=DescribeDhcpOptionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeDhcpOptions(env, msg)
end
export DescribeDhcpOptions


function DescribeExportTasks(env::AWSEnv, msg::DescribeExportTasksType)
    ec2resp::EC2Response = call_ec2(env, "DescribeExportTasks" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeExportTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeExportTasks(env::AWSEnv; kwargs...)
    msg=DescribeExportTasksType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeExportTasks(env, msg)
end
export DescribeExportTasks


function DescribeImageAttribute(env::AWSEnv, msg::DescribeImageAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeImageAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeImageAttribute(env::AWSEnv; kwargs...)
    msg=DescribeImageAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeImageAttribute(env, msg)
end
export DescribeImageAttribute


function DescribeImages(env::AWSEnv, msg::DescribeImagesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeImages" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeImagesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeImages(env::AWSEnv; kwargs...)
    msg=DescribeImagesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeImages(env, msg)
end
export DescribeImages


function DescribeInstanceAttribute(env::AWSEnv, msg::DescribeInstanceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeInstanceAttribute(env::AWSEnv; kwargs...)
    msg=DescribeInstanceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeInstanceAttribute(env, msg)
end
export DescribeInstanceAttribute


function DescribeInstances(env::AWSEnv, msg::DescribeInstancesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeInstances(env::AWSEnv; kwargs...)
    msg=DescribeInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeInstances(env, msg)
end
export DescribeInstances


function DescribeInstanceStatus(env::AWSEnv, msg::DescribeInstanceStatusType)
    ec2resp::EC2Response = call_ec2(env, "DescribeInstanceStatus" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeInstanceStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeInstanceStatus(env::AWSEnv; kwargs...)
    msg=DescribeInstanceStatusType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeInstanceStatus(env, msg)
end
export DescribeInstanceStatus


function DescribeInternetGateways(env::AWSEnv, msg::DescribeInternetGatewaysType)
    ec2resp::EC2Response = call_ec2(env, "DescribeInternetGateways" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeInternetGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeInternetGateways(env::AWSEnv; kwargs...)
    msg=DescribeInternetGatewaysType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeInternetGateways(env, msg)
end
export DescribeInternetGateways


function DescribeKeyPairs(env::AWSEnv, msg::DescribeKeyPairsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeKeyPairs" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeKeyPairsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeKeyPairs(env::AWSEnv; kwargs...)
    msg=DescribeKeyPairsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeKeyPairs(env, msg)
end
export DescribeKeyPairs


function DescribeLicenses(env::AWSEnv, msg::DescribeLicensesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeLicenses" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeLicensesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeLicenses(env::AWSEnv; kwargs...)
    msg=DescribeLicensesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeLicenses(env, msg)
end
export DescribeLicenses


function DescribeNetworkAcls(env::AWSEnv, msg::DescribeNetworkAclsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkAcls" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeNetworkAclsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeNetworkAcls(env::AWSEnv; kwargs...)
    msg=DescribeNetworkAclsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeNetworkAcls(env, msg)
end
export DescribeNetworkAcls


function DescribeNetworkInterfaceAttribute(env::AWSEnv, msg::DescribeNetworkInterfaceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeNetworkInterfaceAttribute(env::AWSEnv; kwargs...)
    msg=DescribeNetworkInterfaceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeNetworkInterfaceAttribute(env, msg)
end
export DescribeNetworkInterfaceAttribute


function DescribeNetworkInterfaces(env::AWSEnv, msg::DescribeNetworkInterfacesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkInterfaces" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeNetworkInterfacesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeNetworkInterfaces(env::AWSEnv; kwargs...)
    msg=DescribeNetworkInterfacesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeNetworkInterfaces(env, msg)
end
export DescribeNetworkInterfaces


function DescribePlacementGroups(env::AWSEnv, msg::DescribePlacementGroupsType)
    ec2resp::EC2Response = call_ec2(env, "DescribePlacementGroups" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribePlacementGroupsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribePlacementGroups(env::AWSEnv; kwargs...)
    msg=DescribePlacementGroupsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribePlacementGroups(env, msg)
end
export DescribePlacementGroups


function DescribeRegions(env::AWSEnv, msg::DescribeRegionsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeRegions" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeRegionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeRegions(env::AWSEnv; kwargs...)
    msg=DescribeRegionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeRegions(env, msg)
end
export DescribeRegions


function DescribeReservedInstances(env::AWSEnv, msg::DescribeReservedInstancesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeReservedInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeReservedInstances(env::AWSEnv; kwargs...)
    msg=DescribeReservedInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeReservedInstances(env, msg)
end
export DescribeReservedInstances


function DescribeReservedInstancesListings(env::AWSEnv, msg::DescribeReservedInstancesListingsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstancesListings" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeReservedInstancesListingsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeReservedInstancesListings(env::AWSEnv; kwargs...)
    msg=DescribeReservedInstancesListingsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeReservedInstancesListings(env, msg)
end
export DescribeReservedInstancesListings


function DescribeReservedInstancesOfferings(env::AWSEnv, msg::DescribeReservedInstancesOfferingsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstancesOfferings" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeReservedInstancesOfferingsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeReservedInstancesOfferings(env::AWSEnv; kwargs...)
    msg=DescribeReservedInstancesOfferingsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeReservedInstancesOfferings(env, msg)
end
export DescribeReservedInstancesOfferings


function DescribeRouteTables(env::AWSEnv, msg::DescribeRouteTablesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeRouteTables" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeRouteTablesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeRouteTables(env::AWSEnv; kwargs...)
    msg=DescribeRouteTablesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeRouteTables(env, msg)
end
export DescribeRouteTables


function DescribeSecurityGroups(env::AWSEnv, msg::DescribeSecurityGroupsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSecurityGroups" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSecurityGroupsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSecurityGroups(env::AWSEnv; kwargs...)
    msg=DescribeSecurityGroupsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSecurityGroups(env, msg)
end
export DescribeSecurityGroups


function DescribeSnapshotAttribute(env::AWSEnv, msg::DescribeSnapshotAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSnapshotAttribute(env::AWSEnv; kwargs...)
    msg=DescribeSnapshotAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSnapshotAttribute(env, msg)
end
export DescribeSnapshotAttribute


function DescribeSnapshots(env::AWSEnv, msg::DescribeSnapshotsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSnapshots" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSnapshotsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSnapshots(env::AWSEnv; kwargs...)
    msg=DescribeSnapshotsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSnapshots(env, msg)
end
export DescribeSnapshots


function DescribeSpotDatafeedSubscription(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotDatafeedSubscription" )
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end

export DescribeSpotDatafeedSubscription


function DescribeSpotInstanceRequests(env::AWSEnv, msg::DescribeSpotInstanceRequestsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotInstanceRequests" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSpotInstanceRequestsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSpotInstanceRequests(env::AWSEnv; kwargs...)
    msg=DescribeSpotInstanceRequestsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSpotInstanceRequests(env, msg)
end
export DescribeSpotInstanceRequests


function DescribeSpotPriceHistory(env::AWSEnv, msg::DescribeSpotPriceHistoryType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotPriceHistory" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSpotPriceHistoryResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSpotPriceHistory(env::AWSEnv; kwargs...)
    msg=DescribeSpotPriceHistoryType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSpotPriceHistory(env, msg)
end
export DescribeSpotPriceHistory


function DescribeSubnets(env::AWSEnv, msg::DescribeSubnetsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeSubnets" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeSubnetsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeSubnets(env::AWSEnv; kwargs...)
    msg=DescribeSubnetsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeSubnets(env, msg)
end
export DescribeSubnets


function DescribeTags(env::AWSEnv, msg::DescribeTagsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeTags" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeTags(env::AWSEnv; kwargs...)
    msg=DescribeTagsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeTags(env, msg)
end
export DescribeTags


function DescribeVolumeAttribute(env::AWSEnv, msg::DescribeVolumeAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumeAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVolumeAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVolumeAttribute(env::AWSEnv; kwargs...)
    msg=DescribeVolumeAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVolumeAttribute(env, msg)
end
export DescribeVolumeAttribute


function DescribeVolumes(env::AWSEnv, msg::DescribeVolumesType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumes" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVolumesResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVolumes(env::AWSEnv; kwargs...)
    msg=DescribeVolumesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVolumes(env, msg)
end
export DescribeVolumes


function DescribeVolumeStatus(env::AWSEnv, msg::DescribeVolumeStatusType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumeStatus" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVolumeStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVolumeStatus(env::AWSEnv; kwargs...)
    msg=DescribeVolumeStatusType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVolumeStatus(env, msg)
end
export DescribeVolumeStatus


function DescribeVpcAttribute(env::AWSEnv, msg::DescribeVpcAttributeType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVpcAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVpcAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVpcAttribute(env::AWSEnv; kwargs...)
    msg=DescribeVpcAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVpcAttribute(env, msg)
end
export DescribeVpcAttribute


function DescribeVpcs(env::AWSEnv, msg::DescribeVpcsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVpcs" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVpcsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVpcs(env::AWSEnv; kwargs...)
    msg=DescribeVpcsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVpcs(env, msg)
end
export DescribeVpcs


function DescribeVpnConnections(env::AWSEnv, msg::DescribeVpnConnectionsType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVpnConnections" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVpnConnectionsResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVpnConnections(env::AWSEnv; kwargs...)
    msg=DescribeVpnConnectionsType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVpnConnections(env, msg)
end
export DescribeVpnConnections


function DescribeVpnGateways(env::AWSEnv, msg::DescribeVpnGatewaysType)
    ec2resp::EC2Response = call_ec2(env, "DescribeVpnGateways" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DescribeVpnGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
function DescribeVpnGateways(env::AWSEnv; kwargs...)
    msg=DescribeVpnGatewaysType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DescribeVpnGateways(env, msg)
end
export DescribeVpnGateways


function DetachInternetGateway(env::AWSEnv, msg::DetachInternetGatewayType)
    ec2resp::EC2Response = call_ec2(env, "DetachInternetGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DetachInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function DetachInternetGateway(env::AWSEnv; kwargs...)
    msg=DetachInternetGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DetachInternetGateway(env, msg)
end
export DetachInternetGateway


function DetachNetworkInterface(env::AWSEnv, msg::DetachNetworkInterfaceType)
    ec2resp::EC2Response = call_ec2(env, "DetachNetworkInterface" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DetachNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
function DetachNetworkInterface(env::AWSEnv; kwargs...)
    msg=DetachNetworkInterfaceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DetachNetworkInterface(env, msg)
end
export DetachNetworkInterface


function DetachVolume(env::AWSEnv, msg::DetachVolumeType)
    ec2resp::EC2Response = call_ec2(env, "DetachVolume" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DetachVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
function DetachVolume(env::AWSEnv; kwargs...)
    msg=DetachVolumeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DetachVolume(env, msg)
end
export DetachVolume


function DetachVpnGateway(env::AWSEnv, msg::DetachVpnGatewayType)
    ec2resp::EC2Response = call_ec2(env, "DetachVpnGateway" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DetachVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
function DetachVpnGateway(env::AWSEnv; kwargs...)
    msg=DetachVpnGatewayType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DetachVpnGateway(env, msg)
end
export DetachVpnGateway


function DisableVgwRoutePropagation(env::AWSEnv, msg::DisableVgwRoutePropagationRequestType)
    ec2resp::EC2Response = call_ec2(env, "DisableVgwRoutePropagation" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DisableVgwRoutePropagationResponseType(ec2resp.pd)
    end
    ec2resp
end
function DisableVgwRoutePropagation(env::AWSEnv; kwargs...)
    msg=DisableVgwRoutePropagationType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DisableVgwRoutePropagation(env, msg)
end
export DisableVgwRoutePropagation


function DisassociateAddress(env::AWSEnv, msg::DisassociateAddressType)
    ec2resp::EC2Response = call_ec2(env, "DisassociateAddress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DisassociateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
function DisassociateAddress(env::AWSEnv; kwargs...)
    msg=DisassociateAddressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DisassociateAddress(env, msg)
end
export DisassociateAddress


function DisassociateRouteTable(env::AWSEnv, msg::DisassociateRouteTableType)
    ec2resp::EC2Response = call_ec2(env, "DisassociateRouteTable" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = DisassociateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
function DisassociateRouteTable(env::AWSEnv; kwargs...)
    msg=DisassociateRouteTableType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DisassociateRouteTable(env, msg)
end
export DisassociateRouteTable


function EnableVgwRoutePropagation(env::AWSEnv, msg::EnableVgwRoutePropagationRequestType)
    ec2resp::EC2Response = call_ec2(env, "EnableVgwRoutePropagation" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = EnableVgwRoutePropagationResponseType(ec2resp.pd)
    end
    ec2resp
end
function EnableVgwRoutePropagation(env::AWSEnv; kwargs...)
    msg=EnableVgwRoutePropagationType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    EnableVgwRoutePropagation(env, msg)
end
export EnableVgwRoutePropagation


function EnableVolumeIO(env::AWSEnv, msg::EnableVolumeIOType)
    ec2resp::EC2Response = call_ec2(env, "EnableVolumeIO" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = EnableVolumeIOResponseType(ec2resp.pd)
    end
    ec2resp
end
function EnableVolumeIO(env::AWSEnv; kwargs...)
    msg=EnableVolumeIOType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    EnableVolumeIO(env, msg)
end
export EnableVolumeIO


function GetConsoleOutput(env::AWSEnv, msg::GetConsoleOutputType)
    ec2resp::EC2Response = call_ec2(env, "GetConsoleOutput" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = GetConsoleOutputResponseType(ec2resp.pd)
    end
    ec2resp
end
function GetConsoleOutput(env::AWSEnv; kwargs...)
    msg=GetConsoleOutputType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    GetConsoleOutput(env, msg)
end
export GetConsoleOutput


function GetPasswordData(env::AWSEnv, msg::GetPasswordDataType)
    ec2resp::EC2Response = call_ec2(env, "GetPasswordData" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = GetPasswordDataResponseType(ec2resp.pd)
    end
    ec2resp
end
function GetPasswordData(env::AWSEnv; kwargs...)
    msg=GetPasswordDataType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    GetPasswordData(env, msg)
end
export GetPasswordData


function ImportInstance(env::AWSEnv, msg::ImportInstanceType)
    ec2resp::EC2Response = call_ec2(env, "ImportInstance" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ImportInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
function ImportInstance(env::AWSEnv; kwargs...)
    msg=ImportInstanceType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ImportInstance(env, msg)
end
export ImportInstance


function ImportKeyPair(env::AWSEnv, msg::ImportKeyPairType)
    ec2resp::EC2Response = call_ec2(env, "ImportKeyPair" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ImportKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
function ImportKeyPair(env::AWSEnv; kwargs...)
    msg=ImportKeyPairType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ImportKeyPair(env, msg)
end
export ImportKeyPair


function ImportVolume(env::AWSEnv, msg::ImportVolumeType)
    ec2resp::EC2Response = call_ec2(env, "ImportVolume" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ImportVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ImportVolume(env::AWSEnv; kwargs...)
    msg=ImportVolumeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ImportVolume(env, msg)
end
export ImportVolume


function ModifyImageAttribute(env::AWSEnv, msg::ModifyImageAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifyImageAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifyImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifyImageAttribute(env::AWSEnv; kwargs...)
    msg=ModifyImageAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifyImageAttribute(env, msg)
end
export ModifyImageAttribute


function ModifyInstanceAttribute(env::AWSEnv, msg::ModifyInstanceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifyInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifyInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifyInstanceAttribute(env::AWSEnv; kwargs...)
    msg=ModifyInstanceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifyInstanceAttribute(env, msg)
end
export ModifyInstanceAttribute


function ModifyNetworkInterfaceAttribute(env::AWSEnv, msg::ModifyNetworkInterfaceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifyNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifyNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifyNetworkInterfaceAttribute(env::AWSEnv; kwargs...)
    msg=ModifyNetworkInterfaceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifyNetworkInterfaceAttribute(env, msg)
end
export ModifyNetworkInterfaceAttribute


function ModifySnapshotAttribute(env::AWSEnv, msg::ModifySnapshotAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifySnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifySnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifySnapshotAttribute(env::AWSEnv; kwargs...)
    msg=ModifySnapshotAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifySnapshotAttribute(env, msg)
end
export ModifySnapshotAttribute


function ModifyVolumeAttribute(env::AWSEnv, msg::ModifyVolumeAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifyVolumeAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifyVolumeAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifyVolumeAttribute(env::AWSEnv; kwargs...)
    msg=ModifyVolumeAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifyVolumeAttribute(env, msg)
end
export ModifyVolumeAttribute


function ModifyVpcAttribute(env::AWSEnv, msg::ModifyVpcAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ModifyVpcAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ModifyVpcAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ModifyVpcAttribute(env::AWSEnv; kwargs...)
    msg=ModifyVpcAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ModifyVpcAttribute(env, msg)
end
export ModifyVpcAttribute


function MonitorInstances(env::AWSEnv, msg::MonitorInstancesType)
    ec2resp::EC2Response = call_ec2(env, "MonitorInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = MonitorInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function MonitorInstances(env::AWSEnv; kwargs...)
    msg=MonitorInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    MonitorInstances(env, msg)
end
export MonitorInstances


function PurchaseReservedInstancesOffering(env::AWSEnv, msg::PurchaseReservedInstancesOfferingType)
    ec2resp::EC2Response = call_ec2(env, "PurchaseReservedInstancesOffering" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = PurchaseReservedInstancesOfferingResponseType(ec2resp.pd)
    end
    ec2resp
end
function PurchaseReservedInstancesOffering(env::AWSEnv; kwargs...)
    msg=PurchaseReservedInstancesOfferingType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    PurchaseReservedInstancesOffering(env, msg)
end
export PurchaseReservedInstancesOffering


function RebootInstances(env::AWSEnv, msg::RebootInstancesType)
    ec2resp::EC2Response = call_ec2(env, "RebootInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RebootInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function RebootInstances(env::AWSEnv; kwargs...)
    msg=RebootInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RebootInstances(env, msg)
end
export RebootInstances


function RegisterImage(env::AWSEnv, msg::RegisterImageType)
    ec2resp::EC2Response = call_ec2(env, "RegisterImage" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RegisterImageResponseType(ec2resp.pd)
    end
    ec2resp
end
function RegisterImage(env::AWSEnv; kwargs...)
    msg=RegisterImageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RegisterImage(env, msg)
end
export RegisterImage


function ReleaseAddress(env::AWSEnv, msg::ReleaseAddressType)
    ec2resp::EC2Response = call_ec2(env, "ReleaseAddress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReleaseAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReleaseAddress(env::AWSEnv; kwargs...)
    msg=ReleaseAddressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReleaseAddress(env, msg)
end
export ReleaseAddress


function ReplaceNetworkAclAssociation(env::AWSEnv, msg::ReplaceNetworkAclAssociationType)
    ec2resp::EC2Response = call_ec2(env, "ReplaceNetworkAclAssociation" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReplaceNetworkAclAssociationResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReplaceNetworkAclAssociation(env::AWSEnv; kwargs...)
    msg=ReplaceNetworkAclAssociationType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReplaceNetworkAclAssociation(env, msg)
end
export ReplaceNetworkAclAssociation


function ReplaceNetworkAclEntry(env::AWSEnv, msg::ReplaceNetworkAclEntryType)
    ec2resp::EC2Response = call_ec2(env, "ReplaceNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReplaceNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReplaceNetworkAclEntry(env::AWSEnv; kwargs...)
    msg=ReplaceNetworkAclEntryType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReplaceNetworkAclEntry(env, msg)
end
export ReplaceNetworkAclEntry


function ReplaceRoute(env::AWSEnv, msg::ReplaceRouteType)
    ec2resp::EC2Response = call_ec2(env, "ReplaceRoute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReplaceRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReplaceRoute(env::AWSEnv; kwargs...)
    msg=ReplaceRouteType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReplaceRoute(env, msg)
end
export ReplaceRoute


function ReplaceRouteTableAssociation(env::AWSEnv, msg::ReplaceRouteTableAssociationType)
    ec2resp::EC2Response = call_ec2(env, "ReplaceRouteTableAssociation" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReplaceRouteTableAssociationResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReplaceRouteTableAssociation(env::AWSEnv; kwargs...)
    msg=ReplaceRouteTableAssociationType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReplaceRouteTableAssociation(env, msg)
end
export ReplaceRouteTableAssociation


function ReportInstanceStatus(env::AWSEnv, msg::ReportInstanceStatusType)
    ec2resp::EC2Response = call_ec2(env, "ReportInstanceStatus" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ReportInstanceStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
function ReportInstanceStatus(env::AWSEnv; kwargs...)
    msg=ReportInstanceStatusType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReportInstanceStatus(env, msg)
end
export ReportInstanceStatus


function RequestSpotInstances(env::AWSEnv, msg::RequestSpotInstancesType)
    ec2resp::EC2Response = call_ec2(env, "RequestSpotInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RequestSpotInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function RequestSpotInstances(env::AWSEnv; kwargs...)
    msg=RequestSpotInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RequestSpotInstances(env, msg)
end
export RequestSpotInstances


function ResetImageAttribute(env::AWSEnv, msg::ResetImageAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ResetImageAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ResetImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ResetImageAttribute(env::AWSEnv; kwargs...)
    msg=ResetImageAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ResetImageAttribute(env, msg)
end
export ResetImageAttribute


function ResetInstanceAttribute(env::AWSEnv, msg::ResetInstanceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ResetInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ResetInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ResetInstanceAttribute(env::AWSEnv; kwargs...)
    msg=ResetInstanceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ResetInstanceAttribute(env, msg)
end
export ResetInstanceAttribute


function ResetNetworkInterfaceAttribute(env::AWSEnv, msg::ResetNetworkInterfaceAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ResetNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ResetNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ResetNetworkInterfaceAttribute(env::AWSEnv; kwargs...)
    msg=ResetNetworkInterfaceAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ResetNetworkInterfaceAttribute(env, msg)
end
export ResetNetworkInterfaceAttribute


function ResetSnapshotAttribute(env::AWSEnv, msg::ResetSnapshotAttributeType)
    ec2resp::EC2Response = call_ec2(env, "ResetSnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = ResetSnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
function ResetSnapshotAttribute(env::AWSEnv; kwargs...)
    msg=ResetSnapshotAttributeType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ResetSnapshotAttribute(env, msg)
end
export ResetSnapshotAttribute


function RevokeSecurityGroupEgress(env::AWSEnv, msg::RevokeSecurityGroupEgressType)
    ec2resp::EC2Response = call_ec2(env, "RevokeSecurityGroupEgress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RevokeSecurityGroupEgressResponseType(ec2resp.pd)
    end
    ec2resp
end
function RevokeSecurityGroupEgress(env::AWSEnv; kwargs...)
    msg=RevokeSecurityGroupEgressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RevokeSecurityGroupEgress(env, msg)
end
export RevokeSecurityGroupEgress


function RevokeSecurityGroupIngress(env::AWSEnv, msg::RevokeSecurityGroupIngressType)
    ec2resp::EC2Response = call_ec2(env, "RevokeSecurityGroupIngress" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RevokeSecurityGroupIngressResponseType(ec2resp.pd)
    end
    ec2resp
end
function RevokeSecurityGroupIngress(env::AWSEnv; kwargs...)
    msg=RevokeSecurityGroupIngressType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RevokeSecurityGroupIngress(env, msg)
end
export RevokeSecurityGroupIngress


function RunInstances(env::AWSEnv, msg::RunInstancesType)
    ec2resp::EC2Response = call_ec2(env, "RunInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = RunInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function RunInstances(env::AWSEnv; kwargs...)
    msg=RunInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RunInstances(env, msg)
end
export RunInstances


function StartInstances(env::AWSEnv, msg::StartInstancesType)
    ec2resp::EC2Response = call_ec2(env, "StartInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = StartInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function StartInstances(env::AWSEnv; kwargs...)
    msg=StartInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    StartInstances(env, msg)
end
export StartInstances


function StopInstances(env::AWSEnv, msg::StopInstancesType)
    ec2resp::EC2Response = call_ec2(env, "StopInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = StopInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function StopInstances(env::AWSEnv; kwargs...)
    msg=StopInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    StopInstances(env, msg)
end
export StopInstances


function TerminateInstances(env::AWSEnv, msg::TerminateInstancesType)
    ec2resp::EC2Response = call_ec2(env, "TerminateInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = TerminateInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function TerminateInstances(env::AWSEnv; kwargs...)
    msg=TerminateInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    TerminateInstances(env, msg)
end
export TerminateInstances


function UnassignPrivateIpAddresses(env::AWSEnv, msg::UnassignPrivateIpAddressesType)
    ec2resp::EC2Response = call_ec2(env, "UnassignPrivateIpAddresses" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = UnassignPrivateIpAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
function UnassignPrivateIpAddresses(env::AWSEnv; kwargs...)
    msg=UnassignPrivateIpAddressesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    UnassignPrivateIpAddresses(env, msg)
end
export UnassignPrivateIpAddresses


function UnmonitorInstances(env::AWSEnv, msg::MonitorInstancesType)
    ec2resp::EC2Response = call_ec2(env, "UnmonitorInstances" , msg)
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = UnmonitorInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
function UnmonitorInstances(env::AWSEnv; kwargs...)
    msg=UnmonitorInstancesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    UnmonitorInstances(env, msg)
end
export UnmonitorInstances


ValidRqstMsgs = Dict(
    "ActivateLicenseType"=>true,
    "AllocateAddressType"=>true,
    "AssignPrivateIpAddressesType"=>true,
    "AssociateAddressType"=>true,
    "AssociateDhcpOptionsType"=>true,
    "AssociateRouteTableType"=>true,
    "AttachInternetGatewayType"=>true,
    "AttachNetworkInterfaceType"=>true,
    "AttachVolumeType"=>true,
    "AttachVpnGatewayType"=>true,
    "AuthorizeSecurityGroupEgressType"=>true,
    "AuthorizeSecurityGroupIngressType"=>true,
    "BundleInstanceType"=>true,
    "CancelBundleTaskType"=>true,
    "CancelConversionTaskType"=>true,
    "CancelExportTaskType"=>true,
    "CancelReservedInstancesListingType"=>true,
    "CancelSpotInstanceRequestsType"=>true,
    "ConfirmProductInstanceType"=>true,
    "CopyImageType"=>true,
    "CopySnapshotType"=>true,
    "CreateCustomerGatewayType"=>true,
    "CreateDhcpOptionsType"=>true,
    "CreateImageType"=>true,
    "CreateInstanceExportTaskType"=>true,
    "CreateInternetGatewayType"=>true,
    "CreateKeyPairType"=>true,
    "CreateNetworkAclType"=>true,
    "CreateNetworkAclEntryType"=>true,
    "CreateNetworkInterfaceType"=>true,
    "CreatePlacementGroupType"=>true,
    "CreateReservedInstancesListingType"=>true,
    "CreateRouteType"=>true,
    "CreateRouteTableType"=>true,
    "CreateSecurityGroupType"=>true,
    "CreateSnapshotType"=>true,
    "CreateSpotDatafeedSubscriptionType"=>true,
    "CreateSubnetType"=>true,
    "CreateTagsType"=>true,
    "CreateVolumeType"=>true,
    "CreateVpcType"=>true,
    "CreateVpnConnectionType"=>true,
    "CreateVpnConnectionRouteType"=>true,
    "CreateVpnGatewayType"=>true,
    "DeactivateLicenseType"=>true,
    "DeleteCustomerGatewayType"=>true,
    "DeleteDhcpOptionsType"=>true,
    "DeleteInternetGatewayType"=>true,
    "DeleteKeyPairType"=>true,
    "DeleteNetworkAclType"=>true,
    "DeleteNetworkAclEntryType"=>true,
    "DeleteNetworkInterfaceType"=>true,
    "DeletePlacementGroupType"=>true,
    "DeleteRouteType"=>true,
    "DeleteRouteTableType"=>true,
    "DeleteSecurityGroupType"=>true,
    "DeleteSnapshotType"=>true,
    "DeleteSpotDatafeedSubscriptionType"=>true,
    "DeleteSubnetType"=>true,
    "DeleteTagsType"=>true,
    "DeleteVolumeType"=>true,
    "DeleteVpcType"=>true,
    "DeleteVpnConnectionType"=>true,
    "DeleteVpnConnectionRouteType"=>true,
    "DeleteVpnGatewayType"=>true,
    "DeregisterImageType"=>true,
    "DescribeAccountAttributesType"=>true,
    "DescribeAddressesType"=>true,
    "DescribeAvailabilityZonesType"=>true,
    "DescribeBundleTasksType"=>true,
    "DescribeConversionTasksType"=>true,
    "DescribeCustomerGatewaysType"=>true,
    "DescribeDhcpOptionsType"=>true,
    "DescribeExportTasksType"=>true,
    "DescribeImageAttributeType"=>true,
    "DescribeImagesType"=>true,
    "DescribeInstanceAttributeType"=>true,
    "DescribeInstancesType"=>true,
    "DescribeInstanceStatusType"=>true,
    "DescribeInternetGatewaysType"=>true,
    "DescribeKeyPairsType"=>true,
    "DescribeLicensesType"=>true,
    "DescribeNetworkAclsType"=>true,
    "DescribeNetworkInterfaceAttributeType"=>true,
    "DescribeNetworkInterfacesType"=>true,
    "DescribePlacementGroupsType"=>true,
    "DescribeRegionsType"=>true,
    "DescribeReservedInstancesType"=>true,
    "DescribeReservedInstancesListingsType"=>true,
    "DescribeReservedInstancesOfferingsType"=>true,
    "DescribeRouteTablesType"=>true,
    "DescribeSecurityGroupsType"=>true,
    "DescribeSnapshotAttributeType"=>true,
    "DescribeSnapshotsType"=>true,
    "DescribeSpotDatafeedSubscriptionType"=>true,
    "DescribeSpotInstanceRequestsType"=>true,
    "DescribeSpotPriceHistoryType"=>true,
    "DescribeSubnetsType"=>true,
    "DescribeTagsType"=>true,
    "DescribeVolumeAttributeType"=>true,
    "DescribeVolumesType"=>true,
    "DescribeVolumeStatusType"=>true,
    "DescribeVpcAttributeType"=>true,
    "DescribeVpcsType"=>true,
    "DescribeVpnConnectionsType"=>true,
    "DescribeVpnGatewaysType"=>true,
    "DetachInternetGatewayType"=>true,
    "DetachNetworkInterfaceType"=>true,
    "DetachVolumeType"=>true,
    "DetachVpnGatewayType"=>true,
    "DisableVgwRoutePropagationRequestType"=>true,
    "DisassociateAddressType"=>true,
    "DisassociateRouteTableType"=>true,
    "EnableVgwRoutePropagationRequestType"=>true,
    "EnableVolumeIOType"=>true,
    "GetConsoleOutputType"=>true,
    "GetPasswordDataType"=>true,
    "ImportInstanceType"=>true,
    "ImportKeyPairType"=>true,
    "ImportVolumeType"=>true,
    "ModifyImageAttributeType"=>true,
    "ModifyInstanceAttributeType"=>true,
    "ModifyNetworkInterfaceAttributeType"=>true,
    "ModifySnapshotAttributeType"=>true,
    "ModifyVolumeAttributeType"=>true,
    "ModifyVpcAttributeType"=>true,
    "MonitorInstancesType"=>true,
    "PurchaseReservedInstancesOfferingType"=>true,
    "RebootInstancesType"=>true,
    "RegisterImageType"=>true,
    "ReleaseAddressType"=>true,
    "ReplaceNetworkAclAssociationType"=>true,
    "ReplaceNetworkAclEntryType"=>true,
    "ReplaceRouteType"=>true,
    "ReplaceRouteTableAssociationType"=>true,
    "ReportInstanceStatusType"=>true,
    "RequestSpotInstancesType"=>true,
    "ResetImageAttributeType"=>true,
    "ResetInstanceAttributeType"=>true,
    "ResetNetworkInterfaceAttributeType"=>true,
    "ResetSnapshotAttributeType"=>true,
    "RevokeSecurityGroupEgressType"=>true,
    "RevokeSecurityGroupIngressType"=>true,
    "RunInstancesType"=>true,
    "StartInstancesType"=>true,
    "StopInstancesType"=>true,
    "TerminateInstancesType"=>true,
    "UnassignPrivateIpAddressesType"=>true,
    "MonitorInstancesType"=>true
)

