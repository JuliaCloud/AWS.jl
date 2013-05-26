function ActivateLicense(env::AWSEnv , msg::ActivateLicenseType=ActivateLicenseType())
    return call_ec2(env, "ActivateLicense" , msg)
end
export ActivateLicense

function AllocateAddress(env::AWSEnv , msg::AllocateAddressType=AllocateAddressType())
    return call_ec2(env, "AllocateAddress" , msg)
end
export AllocateAddress

function AssignPrivateIpAddresses(env::AWSEnv , msg::AssignPrivateIpAddressesType=AssignPrivateIpAddressesType())
    return call_ec2(env, "AssignPrivateIpAddresses" , msg)
end
export AssignPrivateIpAddresses

function AssociateAddress(env::AWSEnv , msg::AssociateAddressType=AssociateAddressType())
    return call_ec2(env, "AssociateAddress" , msg)
end
export AssociateAddress

function AssociateDhcpOptions(env::AWSEnv , msg::AssociateDhcpOptionsType=AssociateDhcpOptionsType())
    return call_ec2(env, "AssociateDhcpOptions" , msg)
end
export AssociateDhcpOptions

function AssociateRouteTable(env::AWSEnv , msg::AssociateRouteTableType=AssociateRouteTableType())
    return call_ec2(env, "AssociateRouteTable" , msg)
end
export AssociateRouteTable

function AttachInternetGateway(env::AWSEnv , msg::AttachInternetGatewayType=AttachInternetGatewayType())
    return call_ec2(env, "AttachInternetGateway" , msg)
end
export AttachInternetGateway

function AttachNetworkInterface(env::AWSEnv , msg::AttachNetworkInterfaceType=AttachNetworkInterfaceType())
    return call_ec2(env, "AttachNetworkInterface" , msg)
end
export AttachNetworkInterface

function AttachVolume(env::AWSEnv , msg::AttachVolumeType=AttachVolumeType())
    return call_ec2(env, "AttachVolume" , msg)
end
export AttachVolume

function AttachVpnGateway(env::AWSEnv , msg::AttachVpnGatewayType=AttachVpnGatewayType())
    return call_ec2(env, "AttachVpnGateway" , msg)
end
export AttachVpnGateway

function AuthorizeSecurityGroupEgress(env::AWSEnv , msg::AuthorizeSecurityGroupEgressType=AuthorizeSecurityGroupEgressType())
    return call_ec2(env, "AuthorizeSecurityGroupEgress" , msg)
end
export AuthorizeSecurityGroupEgress

function AuthorizeSecurityGroupIngress(env::AWSEnv , msg::AuthorizeSecurityGroupIngressType=AuthorizeSecurityGroupIngressType())
    return call_ec2(env, "AuthorizeSecurityGroupIngress" , msg)
end
export AuthorizeSecurityGroupIngress

function BundleInstance(env::AWSEnv , msg::BundleInstanceType=BundleInstanceType())
    return call_ec2(env, "BundleInstance" , msg)
end
export BundleInstance

function CancelBundleTask(env::AWSEnv , msg::CancelBundleTaskType=CancelBundleTaskType())
    return call_ec2(env, "CancelBundleTask" , msg)
end
export CancelBundleTask

function CancelConversionTask(env::AWSEnv , msg::CancelConversionTaskType=CancelConversionTaskType())
    return call_ec2(env, "CancelConversionTask" , msg)
end
export CancelConversionTask

function CancelExportTask(env::AWSEnv , msg::CancelExportTaskType=CancelExportTaskType())
    return call_ec2(env, "CancelExportTask" , msg)
end
export CancelExportTask

function CancelReservedInstancesListing(env::AWSEnv , msg::CancelReservedInstancesListingType=CancelReservedInstancesListingType())
    return call_ec2(env, "CancelReservedInstancesListing" , msg)
end
export CancelReservedInstancesListing

function CancelSpotInstanceRequests(env::AWSEnv , msg::CancelSpotInstanceRequestsType=CancelSpotInstanceRequestsType())
    return call_ec2(env, "CancelSpotInstanceRequests" , msg)
end
export CancelSpotInstanceRequests

function ConfirmProductInstance(env::AWSEnv , msg::ConfirmProductInstanceType=ConfirmProductInstanceType())
    return call_ec2(env, "ConfirmProductInstance" , msg)
end
export ConfirmProductInstance

function CopyImage(env::AWSEnv , msg::CopyImageType=CopyImageType())
    return call_ec2(env, "CopyImage" , msg)
end
export CopyImage

function CopySnapshot(env::AWSEnv , msg::CopySnapshotType=CopySnapshotType())
    return call_ec2(env, "CopySnapshot" , msg)
end
export CopySnapshot

function CreateCustomerGateway(env::AWSEnv , msg::CreateCustomerGatewayType=CreateCustomerGatewayType())
    return call_ec2(env, "CreateCustomerGateway" , msg)
end
export CreateCustomerGateway

function CreateDhcpOptions(env::AWSEnv , msg::CreateDhcpOptionsType=CreateDhcpOptionsType())
    return call_ec2(env, "CreateDhcpOptions" , msg)
end
export CreateDhcpOptions

function CreateImage(env::AWSEnv , msg::CreateImageType=CreateImageType())
    return call_ec2(env, "CreateImage" , msg)
end
export CreateImage

function CreateInstanceExportTask(env::AWSEnv , msg::CreateInstanceExportTaskType=CreateInstanceExportTaskType())
    return call_ec2(env, "CreateInstanceExportTask" , msg)
end
export CreateInstanceExportTask

function CreateInternetGateway(env::AWSEnv )
    return call_ec2(env, "CreateInternetGateway" )
end
export CreateInternetGateway

function CreateKeyPair(env::AWSEnv , msg::CreateKeyPairType=CreateKeyPairType())
    return call_ec2(env, "CreateKeyPair" , msg)
end
export CreateKeyPair

function CreateNetworkAcl(env::AWSEnv , msg::CreateNetworkAclType=CreateNetworkAclType())
    return call_ec2(env, "CreateNetworkAcl" , msg)
end
export CreateNetworkAcl

function CreateNetworkAclEntry(env::AWSEnv , msg::CreateNetworkAclEntryType=CreateNetworkAclEntryType())
    return call_ec2(env, "CreateNetworkAclEntry" , msg)
end
export CreateNetworkAclEntry

function CreateNetworkInterface(env::AWSEnv , msg::CreateNetworkInterfaceType=CreateNetworkInterfaceType())
    return call_ec2(env, "CreateNetworkInterface" , msg)
end
export CreateNetworkInterface

function CreatePlacementGroup(env::AWSEnv , msg::CreatePlacementGroupType=CreatePlacementGroupType())
    return call_ec2(env, "CreatePlacementGroup" , msg)
end
export CreatePlacementGroup

function CreateReservedInstancesListing(env::AWSEnv , msg::CreateReservedInstancesListingType=CreateReservedInstancesListingType())
    return call_ec2(env, "CreateReservedInstancesListing" , msg)
end
export CreateReservedInstancesListing

function CreateRoute(env::AWSEnv , msg::CreateRouteType=CreateRouteType())
    return call_ec2(env, "CreateRoute" , msg)
end
export CreateRoute

function CreateRouteTable(env::AWSEnv , msg::CreateRouteTableType=CreateRouteTableType())
    return call_ec2(env, "CreateRouteTable" , msg)
end
export CreateRouteTable

function CreateSecurityGroup(env::AWSEnv , msg::CreateSecurityGroupType=CreateSecurityGroupType())
    return call_ec2(env, "CreateSecurityGroup" , msg)
end
export CreateSecurityGroup

function CreateSnapshot(env::AWSEnv , msg::CreateSnapshotType=CreateSnapshotType())
    return call_ec2(env, "CreateSnapshot" , msg)
end
export CreateSnapshot

function CreateSpotDatafeedSubscription(env::AWSEnv , msg::CreateSpotDatafeedSubscriptionType=CreateSpotDatafeedSubscriptionType())
    return call_ec2(env, "CreateSpotDatafeedSubscription" , msg)
end
export CreateSpotDatafeedSubscription

function CreateSubnet(env::AWSEnv , msg::CreateSubnetType=CreateSubnetType())
    return call_ec2(env, "CreateSubnet" , msg)
end
export CreateSubnet

function CreateTags(env::AWSEnv , msg::CreateTagsType=CreateTagsType())
    return call_ec2(env, "CreateTags" , msg)
end
export CreateTags

function CreateVolume(env::AWSEnv , msg::CreateVolumeType=CreateVolumeType())
    return call_ec2(env, "CreateVolume" , msg)
end
export CreateVolume

function CreateVpc(env::AWSEnv , msg::CreateVpcType=CreateVpcType())
    return call_ec2(env, "CreateVpc" , msg)
end
export CreateVpc

function CreateVpnConnection(env::AWSEnv , msg::CreateVpnConnectionType=CreateVpnConnectionType())
    return call_ec2(env, "CreateVpnConnection" , msg)
end
export CreateVpnConnection

function CreateVpnConnectionRoute(env::AWSEnv , msg::CreateVpnConnectionRouteType=CreateVpnConnectionRouteType())
    return call_ec2(env, "CreateVpnConnectionRoute" , msg)
end
export CreateVpnConnectionRoute

function CreateVpnGateway(env::AWSEnv , msg::CreateVpnGatewayType=CreateVpnGatewayType())
    return call_ec2(env, "CreateVpnGateway" , msg)
end
export CreateVpnGateway

function DeactivateLicense(env::AWSEnv , msg::DeactivateLicenseType=DeactivateLicenseType())
    return call_ec2(env, "DeactivateLicense" , msg)
end
export DeactivateLicense

function DeleteCustomerGateway(env::AWSEnv , msg::DeleteCustomerGatewayType=DeleteCustomerGatewayType())
    return call_ec2(env, "DeleteCustomerGateway" , msg)
end
export DeleteCustomerGateway

function DeleteDhcpOptions(env::AWSEnv , msg::DeleteDhcpOptionsType=DeleteDhcpOptionsType())
    return call_ec2(env, "DeleteDhcpOptions" , msg)
end
export DeleteDhcpOptions

function DeleteInternetGateway(env::AWSEnv , msg::DeleteInternetGatewayType=DeleteInternetGatewayType())
    return call_ec2(env, "DeleteInternetGateway" , msg)
end
export DeleteInternetGateway

function DeleteKeyPair(env::AWSEnv , msg::DeleteKeyPairType=DeleteKeyPairType())
    return call_ec2(env, "DeleteKeyPair" , msg)
end
export DeleteKeyPair

function DeleteNetworkAcl(env::AWSEnv , msg::DeleteNetworkAclType=DeleteNetworkAclType())
    return call_ec2(env, "DeleteNetworkAcl" , msg)
end
export DeleteNetworkAcl

function DeleteNetworkAclEntry(env::AWSEnv , msg::DeleteNetworkAclEntryType=DeleteNetworkAclEntryType())
    return call_ec2(env, "DeleteNetworkAclEntry" , msg)
end
export DeleteNetworkAclEntry

function DeleteNetworkInterface(env::AWSEnv , msg::DeleteNetworkInterfaceType=DeleteNetworkInterfaceType())
    return call_ec2(env, "DeleteNetworkInterface" , msg)
end
export DeleteNetworkInterface

function DeletePlacementGroup(env::AWSEnv , msg::DeletePlacementGroupType=DeletePlacementGroupType())
    return call_ec2(env, "DeletePlacementGroup" , msg)
end
export DeletePlacementGroup

function DeleteRoute(env::AWSEnv , msg::DeleteRouteType=DeleteRouteType())
    return call_ec2(env, "DeleteRoute" , msg)
end
export DeleteRoute

function DeleteRouteTable(env::AWSEnv , msg::DeleteRouteTableType=DeleteRouteTableType())
    return call_ec2(env, "DeleteRouteTable" , msg)
end
export DeleteRouteTable

function DeleteSecurityGroup(env::AWSEnv , msg::DeleteSecurityGroupType=DeleteSecurityGroupType())
    return call_ec2(env, "DeleteSecurityGroup" , msg)
end
export DeleteSecurityGroup

function DeleteSnapshot(env::AWSEnv , msg::DeleteSnapshotType=DeleteSnapshotType())
    return call_ec2(env, "DeleteSnapshot" , msg)
end
export DeleteSnapshot

function DeleteSpotDatafeedSubscription(env::AWSEnv )
    return call_ec2(env, "DeleteSpotDatafeedSubscription" )
end
export DeleteSpotDatafeedSubscription

function DeleteSubnet(env::AWSEnv , msg::DeleteSubnetType=DeleteSubnetType())
    return call_ec2(env, "DeleteSubnet" , msg)
end
export DeleteSubnet

function DeleteTags(env::AWSEnv , msg::DeleteTagsType=DeleteTagsType())
    return call_ec2(env, "DeleteTags" , msg)
end
export DeleteTags

function DeleteVolume(env::AWSEnv , msg::DeleteVolumeType=DeleteVolumeType())
    return call_ec2(env, "DeleteVolume" , msg)
end
export DeleteVolume

function DeleteVpc(env::AWSEnv , msg::DeleteVpcType=DeleteVpcType())
    return call_ec2(env, "DeleteVpc" , msg)
end
export DeleteVpc

function DeleteVpnConnection(env::AWSEnv , msg::DeleteVpnConnectionType=DeleteVpnConnectionType())
    return call_ec2(env, "DeleteVpnConnection" , msg)
end
export DeleteVpnConnection

function DeleteVpnConnectionRoute(env::AWSEnv , msg::DeleteVpnConnectionRouteType=DeleteVpnConnectionRouteType())
    return call_ec2(env, "DeleteVpnConnectionRoute" , msg)
end
export DeleteVpnConnectionRoute

function DeleteVpnGateway(env::AWSEnv , msg::DeleteVpnGatewayType=DeleteVpnGatewayType())
    return call_ec2(env, "DeleteVpnGateway" , msg)
end
export DeleteVpnGateway

function DeregisterImage(env::AWSEnv , msg::DeregisterImageType=DeregisterImageType())
    return call_ec2(env, "DeregisterImage" , msg)
end
export DeregisterImage

function DescribeAccountAttributes(env::AWSEnv , msg::DescribeAccountAttributesType=DescribeAccountAttributesType())
    return call_ec2(env, "DescribeAccountAttributes" , msg)
end
export DescribeAccountAttributes

function DescribeAddresses(env::AWSEnv , msg::DescribeAddressesType=DescribeAddressesType())
    return call_ec2(env, "DescribeAddresses" , msg)
end
export DescribeAddresses

function DescribeAvailabilityZones(env::AWSEnv , msg::DescribeAvailabilityZonesType=DescribeAvailabilityZonesType())
    return call_ec2(env, "DescribeAvailabilityZones" , msg)
end
export DescribeAvailabilityZones

function DescribeBundleTasks(env::AWSEnv , msg::DescribeBundleTasksType=DescribeBundleTasksType())
    return call_ec2(env, "DescribeBundleTasks" , msg)
end
export DescribeBundleTasks

function DescribeConversionTasks(env::AWSEnv , msg::DescribeConversionTasksType=DescribeConversionTasksType())
    return call_ec2(env, "DescribeConversionTasks" , msg)
end
export DescribeConversionTasks

function DescribeCustomerGateways(env::AWSEnv , msg::DescribeCustomerGatewaysType=DescribeCustomerGatewaysType())
    return call_ec2(env, "DescribeCustomerGateways" , msg)
end
export DescribeCustomerGateways

function DescribeDhcpOptions(env::AWSEnv , msg::DescribeDhcpOptionsType=DescribeDhcpOptionsType())
    return call_ec2(env, "DescribeDhcpOptions" , msg)
end
export DescribeDhcpOptions

function DescribeExportTasks(env::AWSEnv , msg::DescribeExportTasksType=DescribeExportTasksType())
    return call_ec2(env, "DescribeExportTasks" , msg)
end
export DescribeExportTasks

function DescribeImageAttribute(env::AWSEnv , msg::DescribeImageAttributeType=DescribeImageAttributeType())
    return call_ec2(env, "DescribeImageAttribute" , msg)
end
export DescribeImageAttribute

function DescribeImages(env::AWSEnv , msg::DescribeImagesType=DescribeImagesType())
    return call_ec2(env, "DescribeImages" , msg)
end
export DescribeImages

function DescribeInstanceAttribute(env::AWSEnv , msg::DescribeInstanceAttributeType=DescribeInstanceAttributeType())
    return call_ec2(env, "DescribeInstanceAttribute" , msg)
end
export DescribeInstanceAttribute

function DescribeInstances(env::AWSEnv , msg::DescribeInstancesType=DescribeInstancesType())
    return call_ec2(env, "DescribeInstances" , msg)
end
export DescribeInstances

function DescribeInstanceStatus(env::AWSEnv , msg::DescribeInstanceStatusType=DescribeInstanceStatusType())
    return call_ec2(env, "DescribeInstanceStatus" , msg)
end
export DescribeInstanceStatus

function DescribeInternetGateways(env::AWSEnv , msg::DescribeInternetGatewaysType=DescribeInternetGatewaysType())
    return call_ec2(env, "DescribeInternetGateways" , msg)
end
export DescribeInternetGateways

function DescribeKeyPairs(env::AWSEnv , msg::DescribeKeyPairsType=DescribeKeyPairsType())
    return call_ec2(env, "DescribeKeyPairs" , msg)
end
export DescribeKeyPairs

function DescribeLicenses(env::AWSEnv , msg::DescribeLicensesType=DescribeLicensesType())
    return call_ec2(env, "DescribeLicenses" , msg)
end
export DescribeLicenses

function DescribeNetworkAcls(env::AWSEnv , msg::DescribeNetworkAclsType=DescribeNetworkAclsType())
    return call_ec2(env, "DescribeNetworkAcls" , msg)
end
export DescribeNetworkAcls

function DescribeNetworkInterfaceAttribute(env::AWSEnv , msg::DescribeNetworkInterfaceAttributeType=DescribeNetworkInterfaceAttributeType())
    return call_ec2(env, "DescribeNetworkInterfaceAttribute" , msg)
end
export DescribeNetworkInterfaceAttribute

function DescribeNetworkInterfaces(env::AWSEnv , msg::DescribeNetworkInterfacesType=DescribeNetworkInterfacesType())
    return call_ec2(env, "DescribeNetworkInterfaces" , msg)
end
export DescribeNetworkInterfaces

function DescribePlacementGroups(env::AWSEnv , msg::DescribePlacementGroupsType=DescribePlacementGroupsType())
    return call_ec2(env, "DescribePlacementGroups" , msg)
end
export DescribePlacementGroups

function DescribeRegions(env::AWSEnv , msg::DescribeRegionsType=DescribeRegionsType())
    return call_ec2(env, "DescribeRegions" , msg)
end
export DescribeRegions

function DescribeReservedInstances(env::AWSEnv , msg::DescribeReservedInstancesType=DescribeReservedInstancesType())
    return call_ec2(env, "DescribeReservedInstances" , msg)
end
export DescribeReservedInstances

function DescribeReservedInstancesListings(env::AWSEnv , msg::DescribeReservedInstancesListingsType=DescribeReservedInstancesListingsType())
    return call_ec2(env, "DescribeReservedInstancesListings" , msg)
end
export DescribeReservedInstancesListings

function DescribeReservedInstancesOfferings(env::AWSEnv , msg::DescribeReservedInstancesOfferingsType=DescribeReservedInstancesOfferingsType())
    return call_ec2(env, "DescribeReservedInstancesOfferings" , msg)
end
export DescribeReservedInstancesOfferings

function DescribeRouteTables(env::AWSEnv , msg::DescribeRouteTablesType=DescribeRouteTablesType())
    return call_ec2(env, "DescribeRouteTables" , msg)
end
export DescribeRouteTables

function DescribeSecurityGroups(env::AWSEnv , msg::DescribeSecurityGroupsType=DescribeSecurityGroupsType())
    return call_ec2(env, "DescribeSecurityGroups" , msg)
end
export DescribeSecurityGroups

function DescribeSnapshotAttribute(env::AWSEnv , msg::DescribeSnapshotAttributeType=DescribeSnapshotAttributeType())
    return call_ec2(env, "DescribeSnapshotAttribute" , msg)
end
export DescribeSnapshotAttribute

function DescribeSnapshots(env::AWSEnv , msg::DescribeSnapshotsType=DescribeSnapshotsType())
    return call_ec2(env, "DescribeSnapshots" , msg)
end
export DescribeSnapshots

function DescribeSpotDatafeedSubscription(env::AWSEnv )
    return call_ec2(env, "DescribeSpotDatafeedSubscription" )
end
export DescribeSpotDatafeedSubscription

function DescribeSpotInstanceRequests(env::AWSEnv , msg::DescribeSpotInstanceRequestsType=DescribeSpotInstanceRequestsType())
    return call_ec2(env, "DescribeSpotInstanceRequests" , msg)
end
export DescribeSpotInstanceRequests

function DescribeSpotPriceHistory(env::AWSEnv , msg::DescribeSpotPriceHistoryType=DescribeSpotPriceHistoryType())
    return call_ec2(env, "DescribeSpotPriceHistory" , msg)
end
export DescribeSpotPriceHistory

function DescribeSubnets(env::AWSEnv , msg::DescribeSubnetsType=DescribeSubnetsType())
    return call_ec2(env, "DescribeSubnets" , msg)
end
export DescribeSubnets

function DescribeTags(env::AWSEnv , msg::DescribeTagsType=DescribeTagsType())
    return call_ec2(env, "DescribeTags" , msg)
end
export DescribeTags

function DescribeVolumeAttribute(env::AWSEnv , msg::DescribeVolumeAttributeType=DescribeVolumeAttributeType())
    return call_ec2(env, "DescribeVolumeAttribute" , msg)
end
export DescribeVolumeAttribute

function DescribeVolumes(env::AWSEnv , msg::DescribeVolumesType=DescribeVolumesType())
    return call_ec2(env, "DescribeVolumes" , msg)
end
export DescribeVolumes

function DescribeVolumeStatus(env::AWSEnv , msg::DescribeVolumeStatusType=DescribeVolumeStatusType())
    return call_ec2(env, "DescribeVolumeStatus" , msg)
end
export DescribeVolumeStatus

function DescribeVpcAttribute(env::AWSEnv , msg::DescribeVpcAttributeType=DescribeVpcAttributeType())
    return call_ec2(env, "DescribeVpcAttribute" , msg)
end
export DescribeVpcAttribute

function DescribeVpcs(env::AWSEnv , msg::DescribeVpcsType=DescribeVpcsType())
    return call_ec2(env, "DescribeVpcs" , msg)
end
export DescribeVpcs

function DescribeVpnConnections(env::AWSEnv , msg::DescribeVpnConnectionsType=DescribeVpnConnectionsType())
    return call_ec2(env, "DescribeVpnConnections" , msg)
end
export DescribeVpnConnections

function DescribeVpnGateways(env::AWSEnv , msg::DescribeVpnGatewaysType=DescribeVpnGatewaysType())
    return call_ec2(env, "DescribeVpnGateways" , msg)
end
export DescribeVpnGateways

function DetachInternetGateway(env::AWSEnv , msg::DetachInternetGatewayType=DetachInternetGatewayType())
    return call_ec2(env, "DetachInternetGateway" , msg)
end
export DetachInternetGateway

function DetachNetworkInterface(env::AWSEnv , msg::DetachNetworkInterfaceType=DetachNetworkInterfaceType())
    return call_ec2(env, "DetachNetworkInterface" , msg)
end
export DetachNetworkInterface

function DetachVolume(env::AWSEnv , msg::DetachVolumeType=DetachVolumeType())
    return call_ec2(env, "DetachVolume" , msg)
end
export DetachVolume

function DetachVpnGateway(env::AWSEnv , msg::DetachVpnGatewayType=DetachVpnGatewayType())
    return call_ec2(env, "DetachVpnGateway" , msg)
end
export DetachVpnGateway

function DisableVgwRoutePropagation(env::AWSEnv , msg::DisableVgwRoutePropagationRequestType=DisableVgwRoutePropagationRequestType())
    return call_ec2(env, "DisableVgwRoutePropagation" , msg)
end
export DisableVgwRoutePropagation

function DisassociateAddress(env::AWSEnv , msg::DisassociateAddressType=DisassociateAddressType())
    return call_ec2(env, "DisassociateAddress" , msg)
end
export DisassociateAddress

function DisassociateRouteTable(env::AWSEnv , msg::DisassociateRouteTableType=DisassociateRouteTableType())
    return call_ec2(env, "DisassociateRouteTable" , msg)
end
export DisassociateRouteTable

function EnableVgwRoutePropagation(env::AWSEnv , msg::EnableVgwRoutePropagationRequestType=EnableVgwRoutePropagationRequestType())
    return call_ec2(env, "EnableVgwRoutePropagation" , msg)
end
export EnableVgwRoutePropagation

function EnableVolumeIO(env::AWSEnv , msg::EnableVolumeIOType=EnableVolumeIOType())
    return call_ec2(env, "EnableVolumeIO" , msg)
end
export EnableVolumeIO

function GetConsoleOutput(env::AWSEnv , msg::GetConsoleOutputType=GetConsoleOutputType())
    return call_ec2(env, "GetConsoleOutput" , msg)
end
export GetConsoleOutput

function GetPasswordData(env::AWSEnv , msg::GetPasswordDataType=GetPasswordDataType())
    return call_ec2(env, "GetPasswordData" , msg)
end
export GetPasswordData

function ImportInstance(env::AWSEnv , msg::ImportInstanceType=ImportInstanceType())
    return call_ec2(env, "ImportInstance" , msg)
end
export ImportInstance

function ImportKeyPair(env::AWSEnv , msg::ImportKeyPairType=ImportKeyPairType())
    return call_ec2(env, "ImportKeyPair" , msg)
end
export ImportKeyPair

function ImportVolume(env::AWSEnv , msg::ImportVolumeType=ImportVolumeType())
    return call_ec2(env, "ImportVolume" , msg)
end
export ImportVolume

function ModifyImageAttribute(env::AWSEnv , msg::ModifyImageAttributeType=ModifyImageAttributeType())
    return call_ec2(env, "ModifyImageAttribute" , msg)
end
export ModifyImageAttribute

function ModifyInstanceAttribute(env::AWSEnv , msg::ModifyInstanceAttributeType=ModifyInstanceAttributeType())
    return call_ec2(env, "ModifyInstanceAttribute" , msg)
end
export ModifyInstanceAttribute

function ModifyNetworkInterfaceAttribute(env::AWSEnv , msg::ModifyNetworkInterfaceAttributeType=ModifyNetworkInterfaceAttributeType())
    return call_ec2(env, "ModifyNetworkInterfaceAttribute" , msg)
end
export ModifyNetworkInterfaceAttribute

function ModifySnapshotAttribute(env::AWSEnv , msg::ModifySnapshotAttributeType=ModifySnapshotAttributeType())
    return call_ec2(env, "ModifySnapshotAttribute" , msg)
end
export ModifySnapshotAttribute

function ModifyVolumeAttribute(env::AWSEnv , msg::ModifyVolumeAttributeType=ModifyVolumeAttributeType())
    return call_ec2(env, "ModifyVolumeAttribute" , msg)
end
export ModifyVolumeAttribute

function ModifyVpcAttribute(env::AWSEnv , msg::ModifyVpcAttributeType=ModifyVpcAttributeType())
    return call_ec2(env, "ModifyVpcAttribute" , msg)
end
export ModifyVpcAttribute

function MonitorInstances(env::AWSEnv , msg::MonitorInstancesType=MonitorInstancesType())
    return call_ec2(env, "MonitorInstances" , msg)
end
export MonitorInstances

function PurchaseReservedInstancesOffering(env::AWSEnv , msg::PurchaseReservedInstancesOfferingType=PurchaseReservedInstancesOfferingType())
    return call_ec2(env, "PurchaseReservedInstancesOffering" , msg)
end
export PurchaseReservedInstancesOffering

function RebootInstances(env::AWSEnv , msg::RebootInstancesType=RebootInstancesType())
    return call_ec2(env, "RebootInstances" , msg)
end
export RebootInstances

function RegisterImage(env::AWSEnv , msg::RegisterImageType=RegisterImageType())
    return call_ec2(env, "RegisterImage" , msg)
end
export RegisterImage

function ReleaseAddress(env::AWSEnv , msg::ReleaseAddressType=ReleaseAddressType())
    return call_ec2(env, "ReleaseAddress" , msg)
end
export ReleaseAddress

function ReplaceNetworkAclAssociation(env::AWSEnv , msg::ReplaceNetworkAclAssociationType=ReplaceNetworkAclAssociationType())
    return call_ec2(env, "ReplaceNetworkAclAssociation" , msg)
end
export ReplaceNetworkAclAssociation

function ReplaceNetworkAclEntry(env::AWSEnv , msg::ReplaceNetworkAclEntryType=ReplaceNetworkAclEntryType())
    return call_ec2(env, "ReplaceNetworkAclEntry" , msg)
end
export ReplaceNetworkAclEntry

function ReplaceRoute(env::AWSEnv , msg::ReplaceRouteType=ReplaceRouteType())
    return call_ec2(env, "ReplaceRoute" , msg)
end
export ReplaceRoute

function ReplaceRouteTableAssociation(env::AWSEnv , msg::ReplaceRouteTableAssociationType=ReplaceRouteTableAssociationType())
    return call_ec2(env, "ReplaceRouteTableAssociation" , msg)
end
export ReplaceRouteTableAssociation

function ReportInstanceStatus(env::AWSEnv , msg::ReportInstanceStatusType=ReportInstanceStatusType())
    return call_ec2(env, "ReportInstanceStatus" , msg)
end
export ReportInstanceStatus

function RequestSpotInstances(env::AWSEnv , msg::RequestSpotInstancesType=RequestSpotInstancesType())
    return call_ec2(env, "RequestSpotInstances" , msg)
end
export RequestSpotInstances

function ResetImageAttribute(env::AWSEnv , msg::ResetImageAttributeType=ResetImageAttributeType())
    return call_ec2(env, "ResetImageAttribute" , msg)
end
export ResetImageAttribute

function ResetInstanceAttribute(env::AWSEnv , msg::ResetInstanceAttributeType=ResetInstanceAttributeType())
    return call_ec2(env, "ResetInstanceAttribute" , msg)
end
export ResetInstanceAttribute

function ResetNetworkInterfaceAttribute(env::AWSEnv , msg::ResetNetworkInterfaceAttributeType=ResetNetworkInterfaceAttributeType())
    return call_ec2(env, "ResetNetworkInterfaceAttribute" , msg)
end
export ResetNetworkInterfaceAttribute

function ResetSnapshotAttribute(env::AWSEnv , msg::ResetSnapshotAttributeType=ResetSnapshotAttributeType())
    return call_ec2(env, "ResetSnapshotAttribute" , msg)
end
export ResetSnapshotAttribute

function RevokeSecurityGroupEgress(env::AWSEnv , msg::RevokeSecurityGroupEgressType=RevokeSecurityGroupEgressType())
    return call_ec2(env, "RevokeSecurityGroupEgress" , msg)
end
export RevokeSecurityGroupEgress

function RevokeSecurityGroupIngress(env::AWSEnv , msg::RevokeSecurityGroupIngressType=RevokeSecurityGroupIngressType())
    return call_ec2(env, "RevokeSecurityGroupIngress" , msg)
end
export RevokeSecurityGroupIngress

function RunInstances(env::AWSEnv , msg::RunInstancesType=RunInstancesType())
    return call_ec2(env, "RunInstances" , msg)
end
export RunInstances

function StartInstances(env::AWSEnv , msg::StartInstancesType=StartInstancesType())
    return call_ec2(env, "StartInstances" , msg)
end
export StartInstances

function StopInstances(env::AWSEnv , msg::StopInstancesType=StopInstancesType())
    return call_ec2(env, "StopInstances" , msg)
end
export StopInstances

function TerminateInstances(env::AWSEnv , msg::TerminateInstancesType=TerminateInstancesType())
    return call_ec2(env, "TerminateInstances" , msg)
end
export TerminateInstances

function UnassignPrivateIpAddresses(env::AWSEnv , msg::UnassignPrivateIpAddressesType=UnassignPrivateIpAddressesType())
    return call_ec2(env, "UnassignPrivateIpAddresses" , msg)
end
export UnassignPrivateIpAddresses

function UnmonitorInstances(env::AWSEnv , msg::MonitorInstancesType=MonitorInstancesType())
    return call_ec2(env, "UnmonitorInstances" , msg)
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

