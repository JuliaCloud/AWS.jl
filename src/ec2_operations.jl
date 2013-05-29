function ActivateLicense(env::AWSEnv, msg::ActivateLicenseType=ActivateLicenseType())
    ec2resp::EC2Response = call_ec2(env, "ActivateLicense" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ActivateLicenseResponseType(ec2resp.pd)
    end
    ec2resp
end
export ActivateLicense


function AllocateAddress(env::AWSEnv, msg::AllocateAddressType=AllocateAddressType())
    ec2resp::EC2Response = call_ec2(env, "AllocateAddress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AllocateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
export AllocateAddress


function AssignPrivateIpAddresses(env::AWSEnv, msg::AssignPrivateIpAddressesType=AssignPrivateIpAddressesType())
    ec2resp::EC2Response = call_ec2(env, "AssignPrivateIpAddresses" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AssignPrivateIpAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
export AssignPrivateIpAddresses


function AssociateAddress(env::AWSEnv, msg::AssociateAddressType=AssociateAddressType())
    ec2resp::EC2Response = call_ec2(env, "AssociateAddress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AssociateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
export AssociateAddress


function AssociateDhcpOptions(env::AWSEnv, msg::AssociateDhcpOptionsType=AssociateDhcpOptionsType())
    ec2resp::EC2Response = call_ec2(env, "AssociateDhcpOptions" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AssociateDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export AssociateDhcpOptions


function AssociateRouteTable(env::AWSEnv, msg::AssociateRouteTableType=AssociateRouteTableType())
    ec2resp::EC2Response = call_ec2(env, "AssociateRouteTable" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AssociateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
export AssociateRouteTable


function AttachInternetGateway(env::AWSEnv, msg::AttachInternetGatewayType=AttachInternetGatewayType())
    ec2resp::EC2Response = call_ec2(env, "AttachInternetGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AttachInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export AttachInternetGateway


function AttachNetworkInterface(env::AWSEnv, msg::AttachNetworkInterfaceType=AttachNetworkInterfaceType())
    ec2resp::EC2Response = call_ec2(env, "AttachNetworkInterface" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AttachNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
export AttachNetworkInterface


function AttachVolume(env::AWSEnv, msg::AttachVolumeType=AttachVolumeType())
    ec2resp::EC2Response = call_ec2(env, "AttachVolume" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AttachVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
export AttachVolume


function AttachVpnGateway(env::AWSEnv, msg::AttachVpnGatewayType=AttachVpnGatewayType())
    ec2resp::EC2Response = call_ec2(env, "AttachVpnGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AttachVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export AttachVpnGateway


function AuthorizeSecurityGroupEgress(env::AWSEnv, msg::AuthorizeSecurityGroupEgressType=AuthorizeSecurityGroupEgressType())
    ec2resp::EC2Response = call_ec2(env, "AuthorizeSecurityGroupEgress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AuthorizeSecurityGroupEgressResponseType(ec2resp.pd)
    end
    ec2resp
end
export AuthorizeSecurityGroupEgress


function AuthorizeSecurityGroupIngress(env::AWSEnv, msg::AuthorizeSecurityGroupIngressType=AuthorizeSecurityGroupIngressType())
    ec2resp::EC2Response = call_ec2(env, "AuthorizeSecurityGroupIngress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = AuthorizeSecurityGroupIngressResponseType(ec2resp.pd)
    end
    ec2resp
end
export AuthorizeSecurityGroupIngress


function BundleInstance(env::AWSEnv, msg::BundleInstanceType=BundleInstanceType())
    ec2resp::EC2Response = call_ec2(env, "BundleInstance" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = BundleInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
export BundleInstance


function CancelBundleTask(env::AWSEnv, msg::CancelBundleTaskType=CancelBundleTaskType())
    ec2resp::EC2Response = call_ec2(env, "CancelBundleTask" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CancelBundleTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
export CancelBundleTask


function CancelConversionTask(env::AWSEnv, msg::CancelConversionTaskType=CancelConversionTaskType())
    ec2resp::EC2Response = call_ec2(env, "CancelConversionTask" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CancelConversionTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
export CancelConversionTask


function CancelExportTask(env::AWSEnv, msg::CancelExportTaskType=CancelExportTaskType())
    ec2resp::EC2Response = call_ec2(env, "CancelExportTask" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CancelExportTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
export CancelExportTask


function CancelReservedInstancesListing(env::AWSEnv, msg::CancelReservedInstancesListingType=CancelReservedInstancesListingType())
    ec2resp::EC2Response = call_ec2(env, "CancelReservedInstancesListing" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CancelReservedInstancesListingResponseType(ec2resp.pd)
    end
    ec2resp
end
export CancelReservedInstancesListing


function CancelSpotInstanceRequests(env::AWSEnv, msg::CancelSpotInstanceRequestsType=CancelSpotInstanceRequestsType())
    ec2resp::EC2Response = call_ec2(env, "CancelSpotInstanceRequests" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CancelSpotInstanceRequestsResponseType(ec2resp.pd)
    end
    ec2resp
end
export CancelSpotInstanceRequests


function ConfirmProductInstance(env::AWSEnv, msg::ConfirmProductInstanceType=ConfirmProductInstanceType())
    ec2resp::EC2Response = call_ec2(env, "ConfirmProductInstance" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ConfirmProductInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
export ConfirmProductInstance


function CopyImage(env::AWSEnv, msg::CopyImageType=CopyImageType())
    ec2resp::EC2Response = call_ec2(env, "CopyImage" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CopyImageResponseType(ec2resp.pd)
    end
    ec2resp
end
export CopyImage


function CopySnapshot(env::AWSEnv, msg::CopySnapshotType=CopySnapshotType())
    ec2resp::EC2Response = call_ec2(env, "CopySnapshot" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CopySnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
export CopySnapshot


function CreateCustomerGateway(env::AWSEnv, msg::CreateCustomerGatewayType=CreateCustomerGatewayType())
    ec2resp::EC2Response = call_ec2(env, "CreateCustomerGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateCustomerGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateCustomerGateway


function CreateDhcpOptions(env::AWSEnv, msg::CreateDhcpOptionsType=CreateDhcpOptionsType())
    ec2resp::EC2Response = call_ec2(env, "CreateDhcpOptions" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateDhcpOptions


function CreateImage(env::AWSEnv, msg::CreateImageType=CreateImageType())
    ec2resp::EC2Response = call_ec2(env, "CreateImage" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateImageResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateImage


function CreateInstanceExportTask(env::AWSEnv, msg::CreateInstanceExportTaskType=CreateInstanceExportTaskType())
    ec2resp::EC2Response = call_ec2(env, "CreateInstanceExportTask" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateInstanceExportTaskResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateInstanceExportTask


function CreateInternetGateway(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "CreateInternetGateway" )
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateInternetGateway


function CreateKeyPair(env::AWSEnv, msg::CreateKeyPairType=CreateKeyPairType())
    ec2resp::EC2Response = call_ec2(env, "CreateKeyPair" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateKeyPair


function CreateNetworkAcl(env::AWSEnv, msg::CreateNetworkAclType=CreateNetworkAclType())
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkAcl" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateNetworkAclResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateNetworkAcl


function CreateNetworkAclEntry(env::AWSEnv, msg::CreateNetworkAclEntryType=CreateNetworkAclEntryType())
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateNetworkAclEntry


function CreateNetworkInterface(env::AWSEnv, msg::CreateNetworkInterfaceType=CreateNetworkInterfaceType())
    ec2resp::EC2Response = call_ec2(env, "CreateNetworkInterface" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateNetworkInterface


function CreatePlacementGroup(env::AWSEnv, msg::CreatePlacementGroupType=CreatePlacementGroupType())
    ec2resp::EC2Response = call_ec2(env, "CreatePlacementGroup" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreatePlacementGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreatePlacementGroup


function CreateReservedInstancesListing(env::AWSEnv, msg::CreateReservedInstancesListingType=CreateReservedInstancesListingType())
    ec2resp::EC2Response = call_ec2(env, "CreateReservedInstancesListing" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateReservedInstancesListingResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateReservedInstancesListing


function CreateRoute(env::AWSEnv, msg::CreateRouteType=CreateRouteType())
    ec2resp::EC2Response = call_ec2(env, "CreateRoute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateRoute


function CreateRouteTable(env::AWSEnv, msg::CreateRouteTableType=CreateRouteTableType())
    ec2resp::EC2Response = call_ec2(env, "CreateRouteTable" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateRouteTable


function CreateSecurityGroup(env::AWSEnv, msg::CreateSecurityGroupType=CreateSecurityGroupType())
    ec2resp::EC2Response = call_ec2(env, "CreateSecurityGroup" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateSecurityGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateSecurityGroup


function CreateSnapshot(env::AWSEnv, msg::CreateSnapshotType=CreateSnapshotType())
    ec2resp::EC2Response = call_ec2(env, "CreateSnapshot" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateSnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateSnapshot


function CreateSpotDatafeedSubscription(env::AWSEnv, msg::CreateSpotDatafeedSubscriptionType=CreateSpotDatafeedSubscriptionType())
    ec2resp::EC2Response = call_ec2(env, "CreateSpotDatafeedSubscription" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateSpotDatafeedSubscription


function CreateSubnet(env::AWSEnv, msg::CreateSubnetType=CreateSubnetType())
    ec2resp::EC2Response = call_ec2(env, "CreateSubnet" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateSubnetResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateSubnet


function CreateTags(env::AWSEnv, msg::CreateTagsType=CreateTagsType())
    ec2resp::EC2Response = call_ec2(env, "CreateTags" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateTags


function CreateVolume(env::AWSEnv, msg::CreateVolumeType=CreateVolumeType())
    ec2resp::EC2Response = call_ec2(env, "CreateVolume" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateVolume


function CreateVpc(env::AWSEnv, msg::CreateVpcType=CreateVpcType())
    ec2resp::EC2Response = call_ec2(env, "CreateVpc" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateVpcResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateVpc


function CreateVpnConnection(env::AWSEnv, msg::CreateVpnConnectionType=CreateVpnConnectionType())
    ec2resp::EC2Response = call_ec2(env, "CreateVpnConnection" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateVpnConnectionResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateVpnConnection


function CreateVpnConnectionRoute(env::AWSEnv, msg::CreateVpnConnectionRouteType=CreateVpnConnectionRouteType())
    ec2resp::EC2Response = call_ec2(env, "CreateVpnConnectionRoute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateVpnConnectionRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateVpnConnectionRoute


function CreateVpnGateway(env::AWSEnv, msg::CreateVpnGatewayType=CreateVpnGatewayType())
    ec2resp::EC2Response = call_ec2(env, "CreateVpnGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = CreateVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export CreateVpnGateway


function DeactivateLicense(env::AWSEnv, msg::DeactivateLicenseType=DeactivateLicenseType())
    ec2resp::EC2Response = call_ec2(env, "DeactivateLicense" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeactivateLicenseResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeactivateLicense


function DeleteCustomerGateway(env::AWSEnv, msg::DeleteCustomerGatewayType=DeleteCustomerGatewayType())
    ec2resp::EC2Response = call_ec2(env, "DeleteCustomerGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteCustomerGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteCustomerGateway


function DeleteDhcpOptions(env::AWSEnv, msg::DeleteDhcpOptionsType=DeleteDhcpOptionsType())
    ec2resp::EC2Response = call_ec2(env, "DeleteDhcpOptions" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteDhcpOptions


function DeleteInternetGateway(env::AWSEnv, msg::DeleteInternetGatewayType=DeleteInternetGatewayType())
    ec2resp::EC2Response = call_ec2(env, "DeleteInternetGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteInternetGateway


function DeleteKeyPair(env::AWSEnv, msg::DeleteKeyPairType=DeleteKeyPairType())
    ec2resp::EC2Response = call_ec2(env, "DeleteKeyPair" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteKeyPair


function DeleteNetworkAcl(env::AWSEnv, msg::DeleteNetworkAclType=DeleteNetworkAclType())
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkAcl" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteNetworkAclResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteNetworkAcl


function DeleteNetworkAclEntry(env::AWSEnv, msg::DeleteNetworkAclEntryType=DeleteNetworkAclEntryType())
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteNetworkAclEntry


function DeleteNetworkInterface(env::AWSEnv, msg::DeleteNetworkInterfaceType=DeleteNetworkInterfaceType())
    ec2resp::EC2Response = call_ec2(env, "DeleteNetworkInterface" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteNetworkInterface


function DeletePlacementGroup(env::AWSEnv, msg::DeletePlacementGroupType=DeletePlacementGroupType())
    ec2resp::EC2Response = call_ec2(env, "DeletePlacementGroup" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeletePlacementGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeletePlacementGroup


function DeleteRoute(env::AWSEnv, msg::DeleteRouteType=DeleteRouteType())
    ec2resp::EC2Response = call_ec2(env, "DeleteRoute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteRoute


function DeleteRouteTable(env::AWSEnv, msg::DeleteRouteTableType=DeleteRouteTableType())
    ec2resp::EC2Response = call_ec2(env, "DeleteRouteTable" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteRouteTable


function DeleteSecurityGroup(env::AWSEnv, msg::DeleteSecurityGroupType=DeleteSecurityGroupType())
    ec2resp::EC2Response = call_ec2(env, "DeleteSecurityGroup" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteSecurityGroupResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteSecurityGroup


function DeleteSnapshot(env::AWSEnv, msg::DeleteSnapshotType=DeleteSnapshotType())
    ec2resp::EC2Response = call_ec2(env, "DeleteSnapshot" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteSnapshotResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteSnapshot


function DeleteSpotDatafeedSubscription(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "DeleteSpotDatafeedSubscription" )
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteSpotDatafeedSubscription


function DeleteSubnet(env::AWSEnv, msg::DeleteSubnetType=DeleteSubnetType())
    ec2resp::EC2Response = call_ec2(env, "DeleteSubnet" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteSubnetResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteSubnet


function DeleteTags(env::AWSEnv, msg::DeleteTagsType=DeleteTagsType())
    ec2resp::EC2Response = call_ec2(env, "DeleteTags" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteTags


function DeleteVolume(env::AWSEnv, msg::DeleteVolumeType=DeleteVolumeType())
    ec2resp::EC2Response = call_ec2(env, "DeleteVolume" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteVolume


function DeleteVpc(env::AWSEnv, msg::DeleteVpcType=DeleteVpcType())
    ec2resp::EC2Response = call_ec2(env, "DeleteVpc" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteVpcResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteVpc


function DeleteVpnConnection(env::AWSEnv, msg::DeleteVpnConnectionType=DeleteVpnConnectionType())
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnConnection" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteVpnConnectionResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteVpnConnection


function DeleteVpnConnectionRoute(env::AWSEnv, msg::DeleteVpnConnectionRouteType=DeleteVpnConnectionRouteType())
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnConnectionRoute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteVpnConnectionRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteVpnConnectionRoute


function DeleteVpnGateway(env::AWSEnv, msg::DeleteVpnGatewayType=DeleteVpnGatewayType())
    ec2resp::EC2Response = call_ec2(env, "DeleteVpnGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeleteVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeleteVpnGateway


function DeregisterImage(env::AWSEnv, msg::DeregisterImageType=DeregisterImageType())
    ec2resp::EC2Response = call_ec2(env, "DeregisterImage" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DeregisterImageResponseType(ec2resp.pd)
    end
    ec2resp
end
export DeregisterImage


function DescribeAccountAttributes(env::AWSEnv, msg::DescribeAccountAttributesType=DescribeAccountAttributesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeAccountAttributes" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeAccountAttributesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeAccountAttributes


function DescribeAddresses(env::AWSEnv, msg::DescribeAddressesType=DescribeAddressesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeAddresses" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeAddresses


function DescribeAvailabilityZones(env::AWSEnv, msg::DescribeAvailabilityZonesType=DescribeAvailabilityZonesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeAvailabilityZones" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeAvailabilityZonesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeAvailabilityZones


function DescribeBundleTasks(env::AWSEnv, msg::DescribeBundleTasksType=DescribeBundleTasksType())
    ec2resp::EC2Response = call_ec2(env, "DescribeBundleTasks" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeBundleTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeBundleTasks


function DescribeConversionTasks(env::AWSEnv, msg::DescribeConversionTasksType=DescribeConversionTasksType())
    ec2resp::EC2Response = call_ec2(env, "DescribeConversionTasks" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeConversionTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeConversionTasks


function DescribeCustomerGateways(env::AWSEnv, msg::DescribeCustomerGatewaysType=DescribeCustomerGatewaysType())
    ec2resp::EC2Response = call_ec2(env, "DescribeCustomerGateways" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeCustomerGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeCustomerGateways


function DescribeDhcpOptions(env::AWSEnv, msg::DescribeDhcpOptionsType=DescribeDhcpOptionsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeDhcpOptions" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeDhcpOptionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeDhcpOptions


function DescribeExportTasks(env::AWSEnv, msg::DescribeExportTasksType=DescribeExportTasksType())
    ec2resp::EC2Response = call_ec2(env, "DescribeExportTasks" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeExportTasksResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeExportTasks


function DescribeImageAttribute(env::AWSEnv, msg::DescribeImageAttributeType=DescribeImageAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeImageAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeImageAttribute


function DescribeImages(env::AWSEnv, msg::DescribeImagesType=DescribeImagesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeImages" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeImagesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeImages


function DescribeInstanceAttribute(env::AWSEnv, msg::DescribeInstanceAttributeType=DescribeInstanceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeInstanceAttribute


function DescribeInstances(env::AWSEnv, msg::DescribeInstancesType=DescribeInstancesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeInstances


function DescribeInstanceStatus(env::AWSEnv, msg::DescribeInstanceStatusType=DescribeInstanceStatusType())
    ec2resp::EC2Response = call_ec2(env, "DescribeInstanceStatus" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeInstanceStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeInstanceStatus


function DescribeInternetGateways(env::AWSEnv, msg::DescribeInternetGatewaysType=DescribeInternetGatewaysType())
    ec2resp::EC2Response = call_ec2(env, "DescribeInternetGateways" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeInternetGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeInternetGateways


function DescribeKeyPairs(env::AWSEnv, msg::DescribeKeyPairsType=DescribeKeyPairsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeKeyPairs" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeKeyPairsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeKeyPairs


function DescribeLicenses(env::AWSEnv, msg::DescribeLicensesType=DescribeLicensesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeLicenses" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeLicensesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeLicenses


function DescribeNetworkAcls(env::AWSEnv, msg::DescribeNetworkAclsType=DescribeNetworkAclsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkAcls" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeNetworkAclsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeNetworkAcls


function DescribeNetworkInterfaceAttribute(env::AWSEnv, msg::DescribeNetworkInterfaceAttributeType=DescribeNetworkInterfaceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeNetworkInterfaceAttribute


function DescribeNetworkInterfaces(env::AWSEnv, msg::DescribeNetworkInterfacesType=DescribeNetworkInterfacesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeNetworkInterfaces" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeNetworkInterfacesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeNetworkInterfaces


function DescribePlacementGroups(env::AWSEnv, msg::DescribePlacementGroupsType=DescribePlacementGroupsType())
    ec2resp::EC2Response = call_ec2(env, "DescribePlacementGroups" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribePlacementGroupsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribePlacementGroups


function DescribeRegions(env::AWSEnv, msg::DescribeRegionsType=DescribeRegionsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeRegions" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeRegionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeRegions


function DescribeReservedInstances(env::AWSEnv, msg::DescribeReservedInstancesType=DescribeReservedInstancesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeReservedInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeReservedInstances


function DescribeReservedInstancesListings(env::AWSEnv, msg::DescribeReservedInstancesListingsType=DescribeReservedInstancesListingsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstancesListings" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeReservedInstancesListingsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeReservedInstancesListings


function DescribeReservedInstancesOfferings(env::AWSEnv, msg::DescribeReservedInstancesOfferingsType=DescribeReservedInstancesOfferingsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeReservedInstancesOfferings" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeReservedInstancesOfferingsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeReservedInstancesOfferings


function DescribeRouteTables(env::AWSEnv, msg::DescribeRouteTablesType=DescribeRouteTablesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeRouteTables" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeRouteTablesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeRouteTables


function DescribeSecurityGroups(env::AWSEnv, msg::DescribeSecurityGroupsType=DescribeSecurityGroupsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSecurityGroups" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSecurityGroupsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSecurityGroups


function DescribeSnapshotAttribute(env::AWSEnv, msg::DescribeSnapshotAttributeType=DescribeSnapshotAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSnapshotAttribute


function DescribeSnapshots(env::AWSEnv, msg::DescribeSnapshotsType=DescribeSnapshotsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSnapshots" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSnapshotsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSnapshots


function DescribeSpotDatafeedSubscription(env::AWSEnv)
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotDatafeedSubscription" )
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSpotDatafeedSubscriptionResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSpotDatafeedSubscription


function DescribeSpotInstanceRequests(env::AWSEnv, msg::DescribeSpotInstanceRequestsType=DescribeSpotInstanceRequestsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotInstanceRequests" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSpotInstanceRequestsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSpotInstanceRequests


function DescribeSpotPriceHistory(env::AWSEnv, msg::DescribeSpotPriceHistoryType=DescribeSpotPriceHistoryType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSpotPriceHistory" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSpotPriceHistoryResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSpotPriceHistory


function DescribeSubnets(env::AWSEnv, msg::DescribeSubnetsType=DescribeSubnetsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeSubnets" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeSubnetsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeSubnets


function DescribeTags(env::AWSEnv, msg::DescribeTagsType=DescribeTagsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeTags" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeTagsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeTags


function DescribeVolumeAttribute(env::AWSEnv, msg::DescribeVolumeAttributeType=DescribeVolumeAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumeAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVolumeAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVolumeAttribute


function DescribeVolumes(env::AWSEnv, msg::DescribeVolumesType=DescribeVolumesType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumes" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVolumesResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVolumes


function DescribeVolumeStatus(env::AWSEnv, msg::DescribeVolumeStatusType=DescribeVolumeStatusType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVolumeStatus" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVolumeStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVolumeStatus


function DescribeVpcAttribute(env::AWSEnv, msg::DescribeVpcAttributeType=DescribeVpcAttributeType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVpcAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVpcAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVpcAttribute


function DescribeVpcs(env::AWSEnv, msg::DescribeVpcsType=DescribeVpcsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVpcs" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVpcsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVpcs


function DescribeVpnConnections(env::AWSEnv, msg::DescribeVpnConnectionsType=DescribeVpnConnectionsType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVpnConnections" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVpnConnectionsResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVpnConnections


function DescribeVpnGateways(env::AWSEnv, msg::DescribeVpnGatewaysType=DescribeVpnGatewaysType())
    ec2resp::EC2Response = call_ec2(env, "DescribeVpnGateways" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DescribeVpnGatewaysResponseType(ec2resp.pd)
    end
    ec2resp
end
export DescribeVpnGateways


function DetachInternetGateway(env::AWSEnv, msg::DetachInternetGatewayType=DetachInternetGatewayType())
    ec2resp::EC2Response = call_ec2(env, "DetachInternetGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DetachInternetGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export DetachInternetGateway


function DetachNetworkInterface(env::AWSEnv, msg::DetachNetworkInterfaceType=DetachNetworkInterfaceType())
    ec2resp::EC2Response = call_ec2(env, "DetachNetworkInterface" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DetachNetworkInterfaceResponseType(ec2resp.pd)
    end
    ec2resp
end
export DetachNetworkInterface


function DetachVolume(env::AWSEnv, msg::DetachVolumeType=DetachVolumeType())
    ec2resp::EC2Response = call_ec2(env, "DetachVolume" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DetachVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
export DetachVolume


function DetachVpnGateway(env::AWSEnv, msg::DetachVpnGatewayType=DetachVpnGatewayType())
    ec2resp::EC2Response = call_ec2(env, "DetachVpnGateway" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DetachVpnGatewayResponseType(ec2resp.pd)
    end
    ec2resp
end
export DetachVpnGateway


function DisableVgwRoutePropagation(env::AWSEnv, msg::DisableVgwRoutePropagationRequestType=DisableVgwRoutePropagationRequestType())
    ec2resp::EC2Response = call_ec2(env, "DisableVgwRoutePropagation" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DisableVgwRoutePropagationResponseType(ec2resp.pd)
    end
    ec2resp
end
export DisableVgwRoutePropagation


function DisassociateAddress(env::AWSEnv, msg::DisassociateAddressType=DisassociateAddressType())
    ec2resp::EC2Response = call_ec2(env, "DisassociateAddress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DisassociateAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
export DisassociateAddress


function DisassociateRouteTable(env::AWSEnv, msg::DisassociateRouteTableType=DisassociateRouteTableType())
    ec2resp::EC2Response = call_ec2(env, "DisassociateRouteTable" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = DisassociateRouteTableResponseType(ec2resp.pd)
    end
    ec2resp
end
export DisassociateRouteTable


function EnableVgwRoutePropagation(env::AWSEnv, msg::EnableVgwRoutePropagationRequestType=EnableVgwRoutePropagationRequestType())
    ec2resp::EC2Response = call_ec2(env, "EnableVgwRoutePropagation" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = EnableVgwRoutePropagationResponseType(ec2resp.pd)
    end
    ec2resp
end
export EnableVgwRoutePropagation


function EnableVolumeIO(env::AWSEnv, msg::EnableVolumeIOType=EnableVolumeIOType())
    ec2resp::EC2Response = call_ec2(env, "EnableVolumeIO" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = EnableVolumeIOResponseType(ec2resp.pd)
    end
    ec2resp
end
export EnableVolumeIO


function GetConsoleOutput(env::AWSEnv, msg::GetConsoleOutputType=GetConsoleOutputType())
    ec2resp::EC2Response = call_ec2(env, "GetConsoleOutput" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = GetConsoleOutputResponseType(ec2resp.pd)
    end
    ec2resp
end
export GetConsoleOutput


function GetPasswordData(env::AWSEnv, msg::GetPasswordDataType=GetPasswordDataType())
    ec2resp::EC2Response = call_ec2(env, "GetPasswordData" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = GetPasswordDataResponseType(ec2resp.pd)
    end
    ec2resp
end
export GetPasswordData


function ImportInstance(env::AWSEnv, msg::ImportInstanceType=ImportInstanceType())
    ec2resp::EC2Response = call_ec2(env, "ImportInstance" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ImportInstanceResponseType(ec2resp.pd)
    end
    ec2resp
end
export ImportInstance


function ImportKeyPair(env::AWSEnv, msg::ImportKeyPairType=ImportKeyPairType())
    ec2resp::EC2Response = call_ec2(env, "ImportKeyPair" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ImportKeyPairResponseType(ec2resp.pd)
    end
    ec2resp
end
export ImportKeyPair


function ImportVolume(env::AWSEnv, msg::ImportVolumeType=ImportVolumeType())
    ec2resp::EC2Response = call_ec2(env, "ImportVolume" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ImportVolumeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ImportVolume


function ModifyImageAttribute(env::AWSEnv, msg::ModifyImageAttributeType=ModifyImageAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifyImageAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifyImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifyImageAttribute


function ModifyInstanceAttribute(env::AWSEnv, msg::ModifyInstanceAttributeType=ModifyInstanceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifyInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifyInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifyInstanceAttribute


function ModifyNetworkInterfaceAttribute(env::AWSEnv, msg::ModifyNetworkInterfaceAttributeType=ModifyNetworkInterfaceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifyNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifyNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifyNetworkInterfaceAttribute


function ModifySnapshotAttribute(env::AWSEnv, msg::ModifySnapshotAttributeType=ModifySnapshotAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifySnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifySnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifySnapshotAttribute


function ModifyVolumeAttribute(env::AWSEnv, msg::ModifyVolumeAttributeType=ModifyVolumeAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifyVolumeAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifyVolumeAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifyVolumeAttribute


function ModifyVpcAttribute(env::AWSEnv, msg::ModifyVpcAttributeType=ModifyVpcAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ModifyVpcAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ModifyVpcAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ModifyVpcAttribute


function MonitorInstances(env::AWSEnv, msg::MonitorInstancesType=MonitorInstancesType())
    ec2resp::EC2Response = call_ec2(env, "MonitorInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = MonitorInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export MonitorInstances


function PurchaseReservedInstancesOffering(env::AWSEnv, msg::PurchaseReservedInstancesOfferingType=PurchaseReservedInstancesOfferingType())
    ec2resp::EC2Response = call_ec2(env, "PurchaseReservedInstancesOffering" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = PurchaseReservedInstancesOfferingResponseType(ec2resp.pd)
    end
    ec2resp
end
export PurchaseReservedInstancesOffering


function RebootInstances(env::AWSEnv, msg::RebootInstancesType=RebootInstancesType())
    ec2resp::EC2Response = call_ec2(env, "RebootInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RebootInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export RebootInstances


function RegisterImage(env::AWSEnv, msg::RegisterImageType=RegisterImageType())
    ec2resp::EC2Response = call_ec2(env, "RegisterImage" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RegisterImageResponseType(ec2resp.pd)
    end
    ec2resp
end
export RegisterImage


function ReleaseAddress(env::AWSEnv, msg::ReleaseAddressType=ReleaseAddressType())
    ec2resp::EC2Response = call_ec2(env, "ReleaseAddress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReleaseAddressResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReleaseAddress


function ReplaceNetworkAclAssociation(env::AWSEnv, msg::ReplaceNetworkAclAssociationType=ReplaceNetworkAclAssociationType())
    ec2resp::EC2Response = call_ec2(env, "ReplaceNetworkAclAssociation" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReplaceNetworkAclAssociationResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReplaceNetworkAclAssociation


function ReplaceNetworkAclEntry(env::AWSEnv, msg::ReplaceNetworkAclEntryType=ReplaceNetworkAclEntryType())
    ec2resp::EC2Response = call_ec2(env, "ReplaceNetworkAclEntry" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReplaceNetworkAclEntryResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReplaceNetworkAclEntry


function ReplaceRoute(env::AWSEnv, msg::ReplaceRouteType=ReplaceRouteType())
    ec2resp::EC2Response = call_ec2(env, "ReplaceRoute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReplaceRouteResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReplaceRoute


function ReplaceRouteTableAssociation(env::AWSEnv, msg::ReplaceRouteTableAssociationType=ReplaceRouteTableAssociationType())
    ec2resp::EC2Response = call_ec2(env, "ReplaceRouteTableAssociation" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReplaceRouteTableAssociationResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReplaceRouteTableAssociation


function ReportInstanceStatus(env::AWSEnv, msg::ReportInstanceStatusType=ReportInstanceStatusType())
    ec2resp::EC2Response = call_ec2(env, "ReportInstanceStatus" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ReportInstanceStatusResponseType(ec2resp.pd)
    end
    ec2resp
end
export ReportInstanceStatus


function RequestSpotInstances(env::AWSEnv, msg::RequestSpotInstancesType=RequestSpotInstancesType())
    ec2resp::EC2Response = call_ec2(env, "RequestSpotInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RequestSpotInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export RequestSpotInstances


function ResetImageAttribute(env::AWSEnv, msg::ResetImageAttributeType=ResetImageAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ResetImageAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ResetImageAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ResetImageAttribute


function ResetInstanceAttribute(env::AWSEnv, msg::ResetInstanceAttributeType=ResetInstanceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ResetInstanceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ResetInstanceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ResetInstanceAttribute


function ResetNetworkInterfaceAttribute(env::AWSEnv, msg::ResetNetworkInterfaceAttributeType=ResetNetworkInterfaceAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ResetNetworkInterfaceAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ResetNetworkInterfaceAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ResetNetworkInterfaceAttribute


function ResetSnapshotAttribute(env::AWSEnv, msg::ResetSnapshotAttributeType=ResetSnapshotAttributeType())
    ec2resp::EC2Response = call_ec2(env, "ResetSnapshotAttribute" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = ResetSnapshotAttributeResponseType(ec2resp.pd)
    end
    ec2resp
end
export ResetSnapshotAttribute


function RevokeSecurityGroupEgress(env::AWSEnv, msg::RevokeSecurityGroupEgressType=RevokeSecurityGroupEgressType())
    ec2resp::EC2Response = call_ec2(env, "RevokeSecurityGroupEgress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RevokeSecurityGroupEgressResponseType(ec2resp.pd)
    end
    ec2resp
end
export RevokeSecurityGroupEgress


function RevokeSecurityGroupIngress(env::AWSEnv, msg::RevokeSecurityGroupIngressType=RevokeSecurityGroupIngressType())
    ec2resp::EC2Response = call_ec2(env, "RevokeSecurityGroupIngress" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RevokeSecurityGroupIngressResponseType(ec2resp.pd)
    end
    ec2resp
end
export RevokeSecurityGroupIngress


function RunInstances(env::AWSEnv, msg::RunInstancesType=RunInstancesType())
    ec2resp::EC2Response = call_ec2(env, "RunInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = RunInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export RunInstances


function StartInstances(env::AWSEnv, msg::StartInstancesType=StartInstancesType())
    ec2resp::EC2Response = call_ec2(env, "StartInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = StartInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export StartInstances


function StopInstances(env::AWSEnv, msg::StopInstancesType=StopInstancesType())
    ec2resp::EC2Response = call_ec2(env, "StopInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = StopInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export StopInstances


function TerminateInstances(env::AWSEnv, msg::TerminateInstancesType=TerminateInstancesType())
    ec2resp::EC2Response = call_ec2(env, "TerminateInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = TerminateInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export TerminateInstances


function UnassignPrivateIpAddresses(env::AWSEnv, msg::UnassignPrivateIpAddressesType=UnassignPrivateIpAddressesType())
    ec2resp::EC2Response = call_ec2(env, "UnassignPrivateIpAddresses" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = UnassignPrivateIpAddressesResponseType(ec2resp.pd)
    end
    ec2resp
end
export UnassignPrivateIpAddresses


function UnmonitorInstances(env::AWSEnv, msg::MonitorInstancesType=MonitorInstancesType())
    ec2resp::EC2Response = call_ec2(env, "UnmonitorInstances" , msg)
    if  (ec2resp.pd != nothing)
        ec2resp.obj = UnmonitorInstancesResponseType(ec2resp.pd)
    end
    ec2resp
end
export UnmonitorInstances


ValidRqstMsgs = [
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
]

