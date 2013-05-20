function ActivateLicense(env::EC2Env , msg::Union(ActivateLicenseType, Nothing))
    return call_ec2(env, "ActivateLicense" , msg)
end
export ActivateLicense

function AllocateAddress(env::EC2Env , msg::Union(AllocateAddressType, Nothing))
    return call_ec2(env, "AllocateAddress" , msg)
end
export AllocateAddress

function AssignPrivateIpAddresses(env::EC2Env , msg::Union(AssignPrivateIpAddressesType, Nothing))
    return call_ec2(env, "AssignPrivateIpAddresses" , msg)
end
export AssignPrivateIpAddresses

function AssociateAddress(env::EC2Env , msg::Union(AssociateAddressType, Nothing))
    return call_ec2(env, "AssociateAddress" , msg)
end
export AssociateAddress

function AssociateDhcpOptions(env::EC2Env , msg::Union(AssociateDhcpOptionsType, Nothing))
    return call_ec2(env, "AssociateDhcpOptions" , msg)
end
export AssociateDhcpOptions

function AssociateRouteTable(env::EC2Env , msg::Union(AssociateRouteTableType, Nothing))
    return call_ec2(env, "AssociateRouteTable" , msg)
end
export AssociateRouteTable

function AttachInternetGateway(env::EC2Env , msg::Union(AttachInternetGatewayType, Nothing))
    return call_ec2(env, "AttachInternetGateway" , msg)
end
export AttachInternetGateway

function AttachNetworkInterface(env::EC2Env , msg::Union(AttachNetworkInterfaceType, Nothing))
    return call_ec2(env, "AttachNetworkInterface" , msg)
end
export AttachNetworkInterface

function AttachVolume(env::EC2Env , msg::Union(AttachVolumeType, Nothing))
    return call_ec2(env, "AttachVolume" , msg)
end
export AttachVolume

function AttachVpnGateway(env::EC2Env , msg::Union(AttachVpnGatewayType, Nothing))
    return call_ec2(env, "AttachVpnGateway" , msg)
end
export AttachVpnGateway

function AuthorizeSecurityGroupEgress(env::EC2Env , msg::Union(AuthorizeSecurityGroupEgressType, Nothing))
    return call_ec2(env, "AuthorizeSecurityGroupEgress" , msg)
end
export AuthorizeSecurityGroupEgress

function AuthorizeSecurityGroupIngress(env::EC2Env , msg::Union(AuthorizeSecurityGroupIngressType, Nothing))
    return call_ec2(env, "AuthorizeSecurityGroupIngress" , msg)
end
export AuthorizeSecurityGroupIngress

function BundleInstance(env::EC2Env , msg::Union(BundleInstanceType, Nothing))
    return call_ec2(env, "BundleInstance" , msg)
end
export BundleInstance

function CancelBundleTask(env::EC2Env , msg::Union(CancelBundleTaskType, Nothing))
    return call_ec2(env, "CancelBundleTask" , msg)
end
export CancelBundleTask

function CancelConversionTask(env::EC2Env , msg::Union(CancelConversionTaskType, Nothing))
    return call_ec2(env, "CancelConversionTask" , msg)
end
export CancelConversionTask

function CancelExportTask(env::EC2Env , msg::Union(CancelExportTaskType, Nothing))
    return call_ec2(env, "CancelExportTask" , msg)
end
export CancelExportTask

function CancelReservedInstancesListing(env::EC2Env , msg::Union(CancelReservedInstancesListingType, Nothing))
    return call_ec2(env, "CancelReservedInstancesListing" , msg)
end
export CancelReservedInstancesListing

function CancelSpotInstanceRequests(env::EC2Env , msg::Union(CancelSpotInstanceRequestsType, Nothing))
    return call_ec2(env, "CancelSpotInstanceRequests" , msg)
end
export CancelSpotInstanceRequests

function ConfirmProductInstance(env::EC2Env , msg::Union(ConfirmProductInstanceType, Nothing))
    return call_ec2(env, "ConfirmProductInstance" , msg)
end
export ConfirmProductInstance

function CopyImage(env::EC2Env , msg::Union(CopyImageType, Nothing))
    return call_ec2(env, "CopyImage" , msg)
end
export CopyImage

function CopySnapshot(env::EC2Env , msg::Union(CopySnapshotType, Nothing))
    return call_ec2(env, "CopySnapshot" , msg)
end
export CopySnapshot

function CreateCustomerGateway(env::EC2Env , msg::Union(CreateCustomerGatewayType, Nothing))
    return call_ec2(env, "CreateCustomerGateway" , msg)
end
export CreateCustomerGateway

function CreateDhcpOptions(env::EC2Env , msg::Union(CreateDhcpOptionsType, Nothing))
    return call_ec2(env, "CreateDhcpOptions" , msg)
end
export CreateDhcpOptions

function CreateImage(env::EC2Env , msg::Union(CreateImageType, Nothing))
    return call_ec2(env, "CreateImage" , msg)
end
export CreateImage

function CreateInstanceExportTask(env::EC2Env , msg::Union(CreateInstanceExportTaskType, Nothing))
    return call_ec2(env, "CreateInstanceExportTask" , msg)
end
export CreateInstanceExportTask

function CreateInternetGateway(env::EC2Env )
    return call_ec2(env, "CreateInternetGateway" )
end
export CreateInternetGateway

function CreateKeyPair(env::EC2Env , msg::Union(CreateKeyPairType, Nothing))
    return call_ec2(env, "CreateKeyPair" , msg)
end
export CreateKeyPair

function CreateNetworkAcl(env::EC2Env , msg::Union(CreateNetworkAclType, Nothing))
    return call_ec2(env, "CreateNetworkAcl" , msg)
end
export CreateNetworkAcl

function CreateNetworkAclEntry(env::EC2Env , msg::Union(CreateNetworkAclEntryType, Nothing))
    return call_ec2(env, "CreateNetworkAclEntry" , msg)
end
export CreateNetworkAclEntry

function CreateNetworkInterface(env::EC2Env , msg::Union(CreateNetworkInterfaceType, Nothing))
    return call_ec2(env, "CreateNetworkInterface" , msg)
end
export CreateNetworkInterface

function CreatePlacementGroup(env::EC2Env , msg::Union(CreatePlacementGroupType, Nothing))
    return call_ec2(env, "CreatePlacementGroup" , msg)
end
export CreatePlacementGroup

function CreateReservedInstancesListing(env::EC2Env , msg::Union(CreateReservedInstancesListingType, Nothing))
    return call_ec2(env, "CreateReservedInstancesListing" , msg)
end
export CreateReservedInstancesListing

function CreateRoute(env::EC2Env , msg::Union(CreateRouteType, Nothing))
    return call_ec2(env, "CreateRoute" , msg)
end
export CreateRoute

function CreateRouteTable(env::EC2Env , msg::Union(CreateRouteTableType, Nothing))
    return call_ec2(env, "CreateRouteTable" , msg)
end
export CreateRouteTable

function CreateSecurityGroup(env::EC2Env , msg::Union(CreateSecurityGroupType, Nothing))
    return call_ec2(env, "CreateSecurityGroup" , msg)
end
export CreateSecurityGroup

function CreateSnapshot(env::EC2Env , msg::Union(CreateSnapshotType, Nothing))
    return call_ec2(env, "CreateSnapshot" , msg)
end
export CreateSnapshot

function CreateSpotDatafeedSubscription(env::EC2Env , msg::Union(CreateSpotDatafeedSubscriptionType, Nothing))
    return call_ec2(env, "CreateSpotDatafeedSubscription" , msg)
end
export CreateSpotDatafeedSubscription

function CreateSubnet(env::EC2Env , msg::Union(CreateSubnetType, Nothing))
    return call_ec2(env, "CreateSubnet" , msg)
end
export CreateSubnet

function CreateTags(env::EC2Env , msg::Union(CreateTagsType, Nothing))
    return call_ec2(env, "CreateTags" , msg)
end
export CreateTags

function CreateVolume(env::EC2Env , msg::Union(CreateVolumeType, Nothing))
    return call_ec2(env, "CreateVolume" , msg)
end
export CreateVolume

function CreateVpc(env::EC2Env , msg::Union(CreateVpcType, Nothing))
    return call_ec2(env, "CreateVpc" , msg)
end
export CreateVpc

function CreateVpnConnection(env::EC2Env , msg::Union(CreateVpnConnectionType, Nothing))
    return call_ec2(env, "CreateVpnConnection" , msg)
end
export CreateVpnConnection

function CreateVpnConnectionRoute(env::EC2Env , msg::Union(CreateVpnConnectionRouteType, Nothing))
    return call_ec2(env, "CreateVpnConnectionRoute" , msg)
end
export CreateVpnConnectionRoute

function CreateVpnGateway(env::EC2Env , msg::Union(CreateVpnGatewayType, Nothing))
    return call_ec2(env, "CreateVpnGateway" , msg)
end
export CreateVpnGateway

function DeactivateLicense(env::EC2Env , msg::Union(DeactivateLicenseType, Nothing))
    return call_ec2(env, "DeactivateLicense" , msg)
end
export DeactivateLicense

function DeleteCustomerGateway(env::EC2Env , msg::Union(DeleteCustomerGatewayType, Nothing))
    return call_ec2(env, "DeleteCustomerGateway" , msg)
end
export DeleteCustomerGateway

function DeleteDhcpOptions(env::EC2Env , msg::Union(DeleteDhcpOptionsType, Nothing))
    return call_ec2(env, "DeleteDhcpOptions" , msg)
end
export DeleteDhcpOptions

function DeleteInternetGateway(env::EC2Env , msg::Union(DeleteInternetGatewayType, Nothing))
    return call_ec2(env, "DeleteInternetGateway" , msg)
end
export DeleteInternetGateway

function DeleteKeyPair(env::EC2Env , msg::Union(DeleteKeyPairType, Nothing))
    return call_ec2(env, "DeleteKeyPair" , msg)
end
export DeleteKeyPair

function DeleteNetworkAcl(env::EC2Env , msg::Union(DeleteNetworkAclType, Nothing))
    return call_ec2(env, "DeleteNetworkAcl" , msg)
end
export DeleteNetworkAcl

function DeleteNetworkAclEntry(env::EC2Env , msg::Union(DeleteNetworkAclEntryType, Nothing))
    return call_ec2(env, "DeleteNetworkAclEntry" , msg)
end
export DeleteNetworkAclEntry

function DeleteNetworkInterface(env::EC2Env , msg::Union(DeleteNetworkInterfaceType, Nothing))
    return call_ec2(env, "DeleteNetworkInterface" , msg)
end
export DeleteNetworkInterface

function DeletePlacementGroup(env::EC2Env , msg::Union(DeletePlacementGroupType, Nothing))
    return call_ec2(env, "DeletePlacementGroup" , msg)
end
export DeletePlacementGroup

function DeleteRoute(env::EC2Env , msg::Union(DeleteRouteType, Nothing))
    return call_ec2(env, "DeleteRoute" , msg)
end
export DeleteRoute

function DeleteRouteTable(env::EC2Env , msg::Union(DeleteRouteTableType, Nothing))
    return call_ec2(env, "DeleteRouteTable" , msg)
end
export DeleteRouteTable

function DeleteSecurityGroup(env::EC2Env , msg::Union(DeleteSecurityGroupType, Nothing))
    return call_ec2(env, "DeleteSecurityGroup" , msg)
end
export DeleteSecurityGroup

function DeleteSnapshot(env::EC2Env , msg::Union(DeleteSnapshotType, Nothing))
    return call_ec2(env, "DeleteSnapshot" , msg)
end
export DeleteSnapshot

function DeleteSpotDatafeedSubscription(env::EC2Env )
    return call_ec2(env, "DeleteSpotDatafeedSubscription" )
end
export DeleteSpotDatafeedSubscription

function DeleteSubnet(env::EC2Env , msg::Union(DeleteSubnetType, Nothing))
    return call_ec2(env, "DeleteSubnet" , msg)
end
export DeleteSubnet

function DeleteTags(env::EC2Env , msg::Union(DeleteTagsType, Nothing))
    return call_ec2(env, "DeleteTags" , msg)
end
export DeleteTags

function DeleteVolume(env::EC2Env , msg::Union(DeleteVolumeType, Nothing))
    return call_ec2(env, "DeleteVolume" , msg)
end
export DeleteVolume

function DeleteVpc(env::EC2Env , msg::Union(DeleteVpcType, Nothing))
    return call_ec2(env, "DeleteVpc" , msg)
end
export DeleteVpc

function DeleteVpnConnection(env::EC2Env , msg::Union(DeleteVpnConnectionType, Nothing))
    return call_ec2(env, "DeleteVpnConnection" , msg)
end
export DeleteVpnConnection

function DeleteVpnConnectionRoute(env::EC2Env , msg::Union(DeleteVpnConnectionRouteType, Nothing))
    return call_ec2(env, "DeleteVpnConnectionRoute" , msg)
end
export DeleteVpnConnectionRoute

function DeleteVpnGateway(env::EC2Env , msg::Union(DeleteVpnGatewayType, Nothing))
    return call_ec2(env, "DeleteVpnGateway" , msg)
end
export DeleteVpnGateway

function DeregisterImage(env::EC2Env , msg::Union(DeregisterImageType, Nothing))
    return call_ec2(env, "DeregisterImage" , msg)
end
export DeregisterImage

function DescribeAccountAttributes(env::EC2Env , msg::Union(DescribeAccountAttributesType, Nothing))
    return call_ec2(env, "DescribeAccountAttributes" , msg)
end
export DescribeAccountAttributes

function DescribeAddresses(env::EC2Env , msg::Union(DescribeAddressesType, Nothing))
    return call_ec2(env, "DescribeAddresses" , msg)
end
export DescribeAddresses

function DescribeAvailabilityZones(env::EC2Env , msg::Union(DescribeAvailabilityZonesType, Nothing))
    return call_ec2(env, "DescribeAvailabilityZones" , msg)
end
export DescribeAvailabilityZones

function DescribeBundleTasks(env::EC2Env , msg::Union(DescribeBundleTasksType, Nothing))
    return call_ec2(env, "DescribeBundleTasks" , msg)
end
export DescribeBundleTasks

function DescribeConversionTasks(env::EC2Env , msg::Union(DescribeConversionTasksType, Nothing))
    return call_ec2(env, "DescribeConversionTasks" , msg)
end
export DescribeConversionTasks

function DescribeCustomerGateways(env::EC2Env , msg::Union(DescribeCustomerGatewaysType, Nothing))
    return call_ec2(env, "DescribeCustomerGateways" , msg)
end
export DescribeCustomerGateways

function DescribeDhcpOptions(env::EC2Env , msg::Union(DescribeDhcpOptionsType, Nothing))
    return call_ec2(env, "DescribeDhcpOptions" , msg)
end
export DescribeDhcpOptions

function DescribeExportTasks(env::EC2Env , msg::Union(DescribeExportTasksType, Nothing))
    return call_ec2(env, "DescribeExportTasks" , msg)
end
export DescribeExportTasks

function DescribeImageAttribute(env::EC2Env , msg::Union(DescribeImageAttributeType, Nothing))
    return call_ec2(env, "DescribeImageAttribute" , msg)
end
export DescribeImageAttribute

function DescribeImages(env::EC2Env , msg::Union(DescribeImagesType, Nothing))
    return call_ec2(env, "DescribeImages" , msg)
end
export DescribeImages

function DescribeInstanceAttribute(env::EC2Env , msg::Union(DescribeInstanceAttributeType, Nothing))
    return call_ec2(env, "DescribeInstanceAttribute" , msg)
end
export DescribeInstanceAttribute

function DescribeInstances(env::EC2Env , msg::Union(DescribeInstancesType, Nothing))
    return call_ec2(env, "DescribeInstances" , msg)
end
export DescribeInstances

function DescribeInstanceStatus(env::EC2Env , msg::Union(DescribeInstanceStatusType, Nothing))
    return call_ec2(env, "DescribeInstanceStatus" , msg)
end
export DescribeInstanceStatus

function DescribeInternetGateways(env::EC2Env , msg::Union(DescribeInternetGatewaysType, Nothing))
    return call_ec2(env, "DescribeInternetGateways" , msg)
end
export DescribeInternetGateways

function DescribeKeyPairs(env::EC2Env , msg::Union(DescribeKeyPairsType, Nothing))
    return call_ec2(env, "DescribeKeyPairs" , msg)
end
export DescribeKeyPairs

function DescribeLicenses(env::EC2Env , msg::Union(DescribeLicensesType, Nothing))
    return call_ec2(env, "DescribeLicenses" , msg)
end
export DescribeLicenses

function DescribeNetworkAcls(env::EC2Env , msg::Union(DescribeNetworkAclsType, Nothing))
    return call_ec2(env, "DescribeNetworkAcls" , msg)
end
export DescribeNetworkAcls

function DescribeNetworkInterfaceAttribute(env::EC2Env , msg::Union(DescribeNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "DescribeNetworkInterfaceAttribute" , msg)
end
export DescribeNetworkInterfaceAttribute

function DescribeNetworkInterfaces(env::EC2Env , msg::Union(DescribeNetworkInterfacesType, Nothing))
    return call_ec2(env, "DescribeNetworkInterfaces" , msg)
end
export DescribeNetworkInterfaces

function DescribePlacementGroups(env::EC2Env , msg::Union(DescribePlacementGroupsType, Nothing))
    return call_ec2(env, "DescribePlacementGroups" , msg)
end
export DescribePlacementGroups

function DescribeRegions(env::EC2Env , msg::Union(DescribeRegionsType, Nothing))
    return call_ec2(env, "DescribeRegions" , msg)
end
export DescribeRegions

function DescribeReservedInstances(env::EC2Env , msg::Union(DescribeReservedInstancesType, Nothing))
    return call_ec2(env, "DescribeReservedInstances" , msg)
end
export DescribeReservedInstances

function DescribeReservedInstancesListings(env::EC2Env , msg::Union(DescribeReservedInstancesListingsType, Nothing))
    return call_ec2(env, "DescribeReservedInstancesListings" , msg)
end
export DescribeReservedInstancesListings

function DescribeReservedInstancesOfferings(env::EC2Env , msg::Union(DescribeReservedInstancesOfferingsType, Nothing))
    return call_ec2(env, "DescribeReservedInstancesOfferings" , msg)
end
export DescribeReservedInstancesOfferings

function DescribeRouteTables(env::EC2Env , msg::Union(DescribeRouteTablesType, Nothing))
    return call_ec2(env, "DescribeRouteTables" , msg)
end
export DescribeRouteTables

function DescribeSecurityGroups(env::EC2Env , msg::Union(DescribeSecurityGroupsType, Nothing))
    return call_ec2(env, "DescribeSecurityGroups" , msg)
end
export DescribeSecurityGroups

function DescribeSnapshotAttribute(env::EC2Env , msg::Union(DescribeSnapshotAttributeType, Nothing))
    return call_ec2(env, "DescribeSnapshotAttribute" , msg)
end
export DescribeSnapshotAttribute

function DescribeSnapshots(env::EC2Env , msg::Union(DescribeSnapshotsType, Nothing))
    return call_ec2(env, "DescribeSnapshots" , msg)
end
export DescribeSnapshots

function DescribeSpotDatafeedSubscription(env::EC2Env )
    return call_ec2(env, "DescribeSpotDatafeedSubscription" )
end
export DescribeSpotDatafeedSubscription

function DescribeSpotInstanceRequests(env::EC2Env , msg::Union(DescribeSpotInstanceRequestsType, Nothing))
    return call_ec2(env, "DescribeSpotInstanceRequests" , msg)
end
export DescribeSpotInstanceRequests

function DescribeSpotPriceHistory(env::EC2Env , msg::Union(DescribeSpotPriceHistoryType, Nothing))
    return call_ec2(env, "DescribeSpotPriceHistory" , msg)
end
export DescribeSpotPriceHistory

function DescribeSubnets(env::EC2Env , msg::Union(DescribeSubnetsType, Nothing))
    return call_ec2(env, "DescribeSubnets" , msg)
end
export DescribeSubnets

function DescribeTags(env::EC2Env , msg::Union(DescribeTagsType, Nothing))
    return call_ec2(env, "DescribeTags" , msg)
end
export DescribeTags

function DescribeVolumeAttribute(env::EC2Env , msg::Union(DescribeVolumeAttributeType, Nothing))
    return call_ec2(env, "DescribeVolumeAttribute" , msg)
end
export DescribeVolumeAttribute

function DescribeVolumes(env::EC2Env , msg::Union(DescribeVolumesType, Nothing))
    return call_ec2(env, "DescribeVolumes" , msg)
end
export DescribeVolumes

function DescribeVolumeStatus(env::EC2Env , msg::Union(DescribeVolumeStatusType, Nothing))
    return call_ec2(env, "DescribeVolumeStatus" , msg)
end
export DescribeVolumeStatus

function DescribeVpcAttribute(env::EC2Env , msg::Union(DescribeVpcAttributeType, Nothing))
    return call_ec2(env, "DescribeVpcAttribute" , msg)
end
export DescribeVpcAttribute

function DescribeVpcs(env::EC2Env , msg::Union(DescribeVpcsType, Nothing))
    return call_ec2(env, "DescribeVpcs" , msg)
end
export DescribeVpcs

function DescribeVpnConnections(env::EC2Env , msg::Union(DescribeVpnConnectionsType, Nothing))
    return call_ec2(env, "DescribeVpnConnections" , msg)
end
export DescribeVpnConnections

function DescribeVpnGateways(env::EC2Env , msg::Union(DescribeVpnGatewaysType, Nothing))
    return call_ec2(env, "DescribeVpnGateways" , msg)
end
export DescribeVpnGateways

function DetachInternetGateway(env::EC2Env , msg::Union(DetachInternetGatewayType, Nothing))
    return call_ec2(env, "DetachInternetGateway" , msg)
end
export DetachInternetGateway

function DetachNetworkInterface(env::EC2Env , msg::Union(DetachNetworkInterfaceType, Nothing))
    return call_ec2(env, "DetachNetworkInterface" , msg)
end
export DetachNetworkInterface

function DetachVolume(env::EC2Env , msg::Union(DetachVolumeType, Nothing))
    return call_ec2(env, "DetachVolume" , msg)
end
export DetachVolume

function DetachVpnGateway(env::EC2Env , msg::Union(DetachVpnGatewayType, Nothing))
    return call_ec2(env, "DetachVpnGateway" , msg)
end
export DetachVpnGateway

function DisableVgwRoutePropagation(env::EC2Env , msg::Union(DisableVgwRoutePropagationRequestType, Nothing))
    return call_ec2(env, "DisableVgwRoutePropagation" , msg)
end
export DisableVgwRoutePropagation

function DisassociateAddress(env::EC2Env , msg::Union(DisassociateAddressType, Nothing))
    return call_ec2(env, "DisassociateAddress" , msg)
end
export DisassociateAddress

function DisassociateRouteTable(env::EC2Env , msg::Union(DisassociateRouteTableType, Nothing))
    return call_ec2(env, "DisassociateRouteTable" , msg)
end
export DisassociateRouteTable

function EnableVgwRoutePropagation(env::EC2Env , msg::Union(EnableVgwRoutePropagationRequestType, Nothing))
    return call_ec2(env, "EnableVgwRoutePropagation" , msg)
end
export EnableVgwRoutePropagation

function EnableVolumeIO(env::EC2Env , msg::Union(EnableVolumeIOType, Nothing))
    return call_ec2(env, "EnableVolumeIO" , msg)
end
export EnableVolumeIO

function GetConsoleOutput(env::EC2Env , msg::Union(GetConsoleOutputType, Nothing))
    return call_ec2(env, "GetConsoleOutput" , msg)
end
export GetConsoleOutput

function GetPasswordData(env::EC2Env , msg::Union(GetPasswordDataType, Nothing))
    return call_ec2(env, "GetPasswordData" , msg)
end
export GetPasswordData

function ImportInstance(env::EC2Env , msg::Union(ImportInstanceType, Nothing))
    return call_ec2(env, "ImportInstance" , msg)
end
export ImportInstance

function ImportKeyPair(env::EC2Env , msg::Union(ImportKeyPairType, Nothing))
    return call_ec2(env, "ImportKeyPair" , msg)
end
export ImportKeyPair

function ImportVolume(env::EC2Env , msg::Union(ImportVolumeType, Nothing))
    return call_ec2(env, "ImportVolume" , msg)
end
export ImportVolume

function ModifyImageAttribute(env::EC2Env , msg::Union(ModifyImageAttributeType, Nothing))
    return call_ec2(env, "ModifyImageAttribute" , msg)
end
export ModifyImageAttribute

function ModifyInstanceAttribute(env::EC2Env , msg::Union(ModifyInstanceAttributeType, Nothing))
    return call_ec2(env, "ModifyInstanceAttribute" , msg)
end
export ModifyInstanceAttribute

function ModifyNetworkInterfaceAttribute(env::EC2Env , msg::Union(ModifyNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "ModifyNetworkInterfaceAttribute" , msg)
end
export ModifyNetworkInterfaceAttribute

function ModifySnapshotAttribute(env::EC2Env , msg::Union(ModifySnapshotAttributeType, Nothing))
    return call_ec2(env, "ModifySnapshotAttribute" , msg)
end
export ModifySnapshotAttribute

function ModifyVolumeAttribute(env::EC2Env , msg::Union(ModifyVolumeAttributeType, Nothing))
    return call_ec2(env, "ModifyVolumeAttribute" , msg)
end
export ModifyVolumeAttribute

function ModifyVpcAttribute(env::EC2Env , msg::Union(ModifyVpcAttributeType, Nothing))
    return call_ec2(env, "ModifyVpcAttribute" , msg)
end
export ModifyVpcAttribute

function MonitorInstances(env::EC2Env , msg::Union(MonitorInstancesType, Nothing))
    return call_ec2(env, "MonitorInstances" , msg)
end
export MonitorInstances

function PurchaseReservedInstancesOffering(env::EC2Env , msg::Union(PurchaseReservedInstancesOfferingType, Nothing))
    return call_ec2(env, "PurchaseReservedInstancesOffering" , msg)
end
export PurchaseReservedInstancesOffering

function RebootInstances(env::EC2Env , msg::Union(RebootInstancesType, Nothing))
    return call_ec2(env, "RebootInstances" , msg)
end
export RebootInstances

function RegisterImage(env::EC2Env , msg::Union(RegisterImageType, Nothing))
    return call_ec2(env, "RegisterImage" , msg)
end
export RegisterImage

function ReleaseAddress(env::EC2Env , msg::Union(ReleaseAddressType, Nothing))
    return call_ec2(env, "ReleaseAddress" , msg)
end
export ReleaseAddress

function ReplaceNetworkAclAssociation(env::EC2Env , msg::Union(ReplaceNetworkAclAssociationType, Nothing))
    return call_ec2(env, "ReplaceNetworkAclAssociation" , msg)
end
export ReplaceNetworkAclAssociation

function ReplaceNetworkAclEntry(env::EC2Env , msg::Union(ReplaceNetworkAclEntryType, Nothing))
    return call_ec2(env, "ReplaceNetworkAclEntry" , msg)
end
export ReplaceNetworkAclEntry

function ReplaceRoute(env::EC2Env , msg::Union(ReplaceRouteType, Nothing))
    return call_ec2(env, "ReplaceRoute" , msg)
end
export ReplaceRoute

function ReplaceRouteTableAssociation(env::EC2Env , msg::Union(ReplaceRouteTableAssociationType, Nothing))
    return call_ec2(env, "ReplaceRouteTableAssociation" , msg)
end
export ReplaceRouteTableAssociation

function ReportInstanceStatus(env::EC2Env , msg::Union(ReportInstanceStatusType, Nothing))
    return call_ec2(env, "ReportInstanceStatus" , msg)
end
export ReportInstanceStatus

function RequestSpotInstances(env::EC2Env , msg::Union(RequestSpotInstancesType, Nothing))
    return call_ec2(env, "RequestSpotInstances" , msg)
end
export RequestSpotInstances

function ResetImageAttribute(env::EC2Env , msg::Union(ResetImageAttributeType, Nothing))
    return call_ec2(env, "ResetImageAttribute" , msg)
end
export ResetImageAttribute

function ResetInstanceAttribute(env::EC2Env , msg::Union(ResetInstanceAttributeType, Nothing))
    return call_ec2(env, "ResetInstanceAttribute" , msg)
end
export ResetInstanceAttribute

function ResetNetworkInterfaceAttribute(env::EC2Env , msg::Union(ResetNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "ResetNetworkInterfaceAttribute" , msg)
end
export ResetNetworkInterfaceAttribute

function ResetSnapshotAttribute(env::EC2Env , msg::Union(ResetSnapshotAttributeType, Nothing))
    return call_ec2(env, "ResetSnapshotAttribute" , msg)
end
export ResetSnapshotAttribute

function RevokeSecurityGroupEgress(env::EC2Env , msg::Union(RevokeSecurityGroupEgressType, Nothing))
    return call_ec2(env, "RevokeSecurityGroupEgress" , msg)
end
export RevokeSecurityGroupEgress

function RevokeSecurityGroupIngress(env::EC2Env , msg::Union(RevokeSecurityGroupIngressType, Nothing))
    return call_ec2(env, "RevokeSecurityGroupIngress" , msg)
end
export RevokeSecurityGroupIngress

function RunInstances(env::EC2Env , msg::Union(RunInstancesType, Nothing))
    return call_ec2(env, "RunInstances" , msg)
end
export RunInstances

function StartInstances(env::EC2Env , msg::Union(StartInstancesType, Nothing))
    return call_ec2(env, "StartInstances" , msg)
end
export StartInstances

function StopInstances(env::EC2Env , msg::Union(StopInstancesType, Nothing))
    return call_ec2(env, "StopInstances" , msg)
end
export StopInstances

function TerminateInstances(env::EC2Env , msg::Union(TerminateInstancesType, Nothing))
    return call_ec2(env, "TerminateInstances" , msg)
end
export TerminateInstances

function UnassignPrivateIpAddresses(env::EC2Env , msg::Union(UnassignPrivateIpAddressesType, Nothing))
    return call_ec2(env, "UnassignPrivateIpAddresses" , msg)
end
export UnassignPrivateIpAddresses

function UnmonitorInstances(env::EC2Env , msg::Union(MonitorInstancesType, Nothing))
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

