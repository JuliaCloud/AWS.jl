function ActivateLicense(env::AWSEnv , msg::Union(ActivateLicenseType, Nothing))
    return call_ec2(env, "ActivateLicense" , msg)
end
export ActivateLicense

function AllocateAddress(env::AWSEnv , msg::Union(AllocateAddressType, Nothing))
    return call_ec2(env, "AllocateAddress" , msg)
end
export AllocateAddress

function AssignPrivateIpAddresses(env::AWSEnv , msg::Union(AssignPrivateIpAddressesType, Nothing))
    return call_ec2(env, "AssignPrivateIpAddresses" , msg)
end
export AssignPrivateIpAddresses

function AssociateAddress(env::AWSEnv , msg::Union(AssociateAddressType, Nothing))
    return call_ec2(env, "AssociateAddress" , msg)
end
export AssociateAddress

function AssociateDhcpOptions(env::AWSEnv , msg::Union(AssociateDhcpOptionsType, Nothing))
    return call_ec2(env, "AssociateDhcpOptions" , msg)
end
export AssociateDhcpOptions

function AssociateRouteTable(env::AWSEnv , msg::Union(AssociateRouteTableType, Nothing))
    return call_ec2(env, "AssociateRouteTable" , msg)
end
export AssociateRouteTable

function AttachInternetGateway(env::AWSEnv , msg::Union(AttachInternetGatewayType, Nothing))
    return call_ec2(env, "AttachInternetGateway" , msg)
end
export AttachInternetGateway

function AttachNetworkInterface(env::AWSEnv , msg::Union(AttachNetworkInterfaceType, Nothing))
    return call_ec2(env, "AttachNetworkInterface" , msg)
end
export AttachNetworkInterface

function AttachVolume(env::AWSEnv , msg::Union(AttachVolumeType, Nothing))
    return call_ec2(env, "AttachVolume" , msg)
end
export AttachVolume

function AttachVpnGateway(env::AWSEnv , msg::Union(AttachVpnGatewayType, Nothing))
    return call_ec2(env, "AttachVpnGateway" , msg)
end
export AttachVpnGateway

function AuthorizeSecurityGroupEgress(env::AWSEnv , msg::Union(AuthorizeSecurityGroupEgressType, Nothing))
    return call_ec2(env, "AuthorizeSecurityGroupEgress" , msg)
end
export AuthorizeSecurityGroupEgress

function AuthorizeSecurityGroupIngress(env::AWSEnv , msg::Union(AuthorizeSecurityGroupIngressType, Nothing))
    return call_ec2(env, "AuthorizeSecurityGroupIngress" , msg)
end
export AuthorizeSecurityGroupIngress

function BundleInstance(env::AWSEnv , msg::Union(BundleInstanceType, Nothing))
    return call_ec2(env, "BundleInstance" , msg)
end
export BundleInstance

function CancelBundleTask(env::AWSEnv , msg::Union(CancelBundleTaskType, Nothing))
    return call_ec2(env, "CancelBundleTask" , msg)
end
export CancelBundleTask

function CancelConversionTask(env::AWSEnv , msg::Union(CancelConversionTaskType, Nothing))
    return call_ec2(env, "CancelConversionTask" , msg)
end
export CancelConversionTask

function CancelExportTask(env::AWSEnv , msg::Union(CancelExportTaskType, Nothing))
    return call_ec2(env, "CancelExportTask" , msg)
end
export CancelExportTask

function CancelReservedInstancesListing(env::AWSEnv , msg::Union(CancelReservedInstancesListingType, Nothing))
    return call_ec2(env, "CancelReservedInstancesListing" , msg)
end
export CancelReservedInstancesListing

function CancelSpotInstanceRequests(env::AWSEnv , msg::Union(CancelSpotInstanceRequestsType, Nothing))
    return call_ec2(env, "CancelSpotInstanceRequests" , msg)
end
export CancelSpotInstanceRequests

function ConfirmProductInstance(env::AWSEnv , msg::Union(ConfirmProductInstanceType, Nothing))
    return call_ec2(env, "ConfirmProductInstance" , msg)
end
export ConfirmProductInstance

function CopyImage(env::AWSEnv , msg::Union(CopyImageType, Nothing))
    return call_ec2(env, "CopyImage" , msg)
end
export CopyImage

function CopySnapshot(env::AWSEnv , msg::Union(CopySnapshotType, Nothing))
    return call_ec2(env, "CopySnapshot" , msg)
end
export CopySnapshot

function CreateCustomerGateway(env::AWSEnv , msg::Union(CreateCustomerGatewayType, Nothing))
    return call_ec2(env, "CreateCustomerGateway" , msg)
end
export CreateCustomerGateway

function CreateDhcpOptions(env::AWSEnv , msg::Union(CreateDhcpOptionsType, Nothing))
    return call_ec2(env, "CreateDhcpOptions" , msg)
end
export CreateDhcpOptions

function CreateImage(env::AWSEnv , msg::Union(CreateImageType, Nothing))
    return call_ec2(env, "CreateImage" , msg)
end
export CreateImage

function CreateInstanceExportTask(env::AWSEnv , msg::Union(CreateInstanceExportTaskType, Nothing))
    return call_ec2(env, "CreateInstanceExportTask" , msg)
end
export CreateInstanceExportTask

function CreateInternetGateway(env::AWSEnv )
    return call_ec2(env, "CreateInternetGateway" )
end
export CreateInternetGateway

function CreateKeyPair(env::AWSEnv , msg::Union(CreateKeyPairType, Nothing))
    return call_ec2(env, "CreateKeyPair" , msg)
end
export CreateKeyPair

function CreateNetworkAcl(env::AWSEnv , msg::Union(CreateNetworkAclType, Nothing))
    return call_ec2(env, "CreateNetworkAcl" , msg)
end
export CreateNetworkAcl

function CreateNetworkAclEntry(env::AWSEnv , msg::Union(CreateNetworkAclEntryType, Nothing))
    return call_ec2(env, "CreateNetworkAclEntry" , msg)
end
export CreateNetworkAclEntry

function CreateNetworkInterface(env::AWSEnv , msg::Union(CreateNetworkInterfaceType, Nothing))
    return call_ec2(env, "CreateNetworkInterface" , msg)
end
export CreateNetworkInterface

function CreatePlacementGroup(env::AWSEnv , msg::Union(CreatePlacementGroupType, Nothing))
    return call_ec2(env, "CreatePlacementGroup" , msg)
end
export CreatePlacementGroup

function CreateReservedInstancesListing(env::AWSEnv , msg::Union(CreateReservedInstancesListingType, Nothing))
    return call_ec2(env, "CreateReservedInstancesListing" , msg)
end
export CreateReservedInstancesListing

function CreateRoute(env::AWSEnv , msg::Union(CreateRouteType, Nothing))
    return call_ec2(env, "CreateRoute" , msg)
end
export CreateRoute

function CreateRouteTable(env::AWSEnv , msg::Union(CreateRouteTableType, Nothing))
    return call_ec2(env, "CreateRouteTable" , msg)
end
export CreateRouteTable

function CreateSecurityGroup(env::AWSEnv , msg::Union(CreateSecurityGroupType, Nothing))
    return call_ec2(env, "CreateSecurityGroup" , msg)
end
export CreateSecurityGroup

function CreateSnapshot(env::AWSEnv , msg::Union(CreateSnapshotType, Nothing))
    return call_ec2(env, "CreateSnapshot" , msg)
end
export CreateSnapshot

function CreateSpotDatafeedSubscription(env::AWSEnv , msg::Union(CreateSpotDatafeedSubscriptionType, Nothing))
    return call_ec2(env, "CreateSpotDatafeedSubscription" , msg)
end
export CreateSpotDatafeedSubscription

function CreateSubnet(env::AWSEnv , msg::Union(CreateSubnetType, Nothing))
    return call_ec2(env, "CreateSubnet" , msg)
end
export CreateSubnet

function CreateTags(env::AWSEnv , msg::Union(CreateTagsType, Nothing))
    return call_ec2(env, "CreateTags" , msg)
end
export CreateTags

function CreateVolume(env::AWSEnv , msg::Union(CreateVolumeType, Nothing))
    return call_ec2(env, "CreateVolume" , msg)
end
export CreateVolume

function CreateVpc(env::AWSEnv , msg::Union(CreateVpcType, Nothing))
    return call_ec2(env, "CreateVpc" , msg)
end
export CreateVpc

function CreateVpnConnection(env::AWSEnv , msg::Union(CreateVpnConnectionType, Nothing))
    return call_ec2(env, "CreateVpnConnection" , msg)
end
export CreateVpnConnection

function CreateVpnConnectionRoute(env::AWSEnv , msg::Union(CreateVpnConnectionRouteType, Nothing))
    return call_ec2(env, "CreateVpnConnectionRoute" , msg)
end
export CreateVpnConnectionRoute

function CreateVpnGateway(env::AWSEnv , msg::Union(CreateVpnGatewayType, Nothing))
    return call_ec2(env, "CreateVpnGateway" , msg)
end
export CreateVpnGateway

function DeactivateLicense(env::AWSEnv , msg::Union(DeactivateLicenseType, Nothing))
    return call_ec2(env, "DeactivateLicense" , msg)
end
export DeactivateLicense

function DeleteCustomerGateway(env::AWSEnv , msg::Union(DeleteCustomerGatewayType, Nothing))
    return call_ec2(env, "DeleteCustomerGateway" , msg)
end
export DeleteCustomerGateway

function DeleteDhcpOptions(env::AWSEnv , msg::Union(DeleteDhcpOptionsType, Nothing))
    return call_ec2(env, "DeleteDhcpOptions" , msg)
end
export DeleteDhcpOptions

function DeleteInternetGateway(env::AWSEnv , msg::Union(DeleteInternetGatewayType, Nothing))
    return call_ec2(env, "DeleteInternetGateway" , msg)
end
export DeleteInternetGateway

function DeleteKeyPair(env::AWSEnv , msg::Union(DeleteKeyPairType, Nothing))
    return call_ec2(env, "DeleteKeyPair" , msg)
end
export DeleteKeyPair

function DeleteNetworkAcl(env::AWSEnv , msg::Union(DeleteNetworkAclType, Nothing))
    return call_ec2(env, "DeleteNetworkAcl" , msg)
end
export DeleteNetworkAcl

function DeleteNetworkAclEntry(env::AWSEnv , msg::Union(DeleteNetworkAclEntryType, Nothing))
    return call_ec2(env, "DeleteNetworkAclEntry" , msg)
end
export DeleteNetworkAclEntry

function DeleteNetworkInterface(env::AWSEnv , msg::Union(DeleteNetworkInterfaceType, Nothing))
    return call_ec2(env, "DeleteNetworkInterface" , msg)
end
export DeleteNetworkInterface

function DeletePlacementGroup(env::AWSEnv , msg::Union(DeletePlacementGroupType, Nothing))
    return call_ec2(env, "DeletePlacementGroup" , msg)
end
export DeletePlacementGroup

function DeleteRoute(env::AWSEnv , msg::Union(DeleteRouteType, Nothing))
    return call_ec2(env, "DeleteRoute" , msg)
end
export DeleteRoute

function DeleteRouteTable(env::AWSEnv , msg::Union(DeleteRouteTableType, Nothing))
    return call_ec2(env, "DeleteRouteTable" , msg)
end
export DeleteRouteTable

function DeleteSecurityGroup(env::AWSEnv , msg::Union(DeleteSecurityGroupType, Nothing))
    return call_ec2(env, "DeleteSecurityGroup" , msg)
end
export DeleteSecurityGroup

function DeleteSnapshot(env::AWSEnv , msg::Union(DeleteSnapshotType, Nothing))
    return call_ec2(env, "DeleteSnapshot" , msg)
end
export DeleteSnapshot

function DeleteSpotDatafeedSubscription(env::AWSEnv )
    return call_ec2(env, "DeleteSpotDatafeedSubscription" )
end
export DeleteSpotDatafeedSubscription

function DeleteSubnet(env::AWSEnv , msg::Union(DeleteSubnetType, Nothing))
    return call_ec2(env, "DeleteSubnet" , msg)
end
export DeleteSubnet

function DeleteTags(env::AWSEnv , msg::Union(DeleteTagsType, Nothing))
    return call_ec2(env, "DeleteTags" , msg)
end
export DeleteTags

function DeleteVolume(env::AWSEnv , msg::Union(DeleteVolumeType, Nothing))
    return call_ec2(env, "DeleteVolume" , msg)
end
export DeleteVolume

function DeleteVpc(env::AWSEnv , msg::Union(DeleteVpcType, Nothing))
    return call_ec2(env, "DeleteVpc" , msg)
end
export DeleteVpc

function DeleteVpnConnection(env::AWSEnv , msg::Union(DeleteVpnConnectionType, Nothing))
    return call_ec2(env, "DeleteVpnConnection" , msg)
end
export DeleteVpnConnection

function DeleteVpnConnectionRoute(env::AWSEnv , msg::Union(DeleteVpnConnectionRouteType, Nothing))
    return call_ec2(env, "DeleteVpnConnectionRoute" , msg)
end
export DeleteVpnConnectionRoute

function DeleteVpnGateway(env::AWSEnv , msg::Union(DeleteVpnGatewayType, Nothing))
    return call_ec2(env, "DeleteVpnGateway" , msg)
end
export DeleteVpnGateway

function DeregisterImage(env::AWSEnv , msg::Union(DeregisterImageType, Nothing))
    return call_ec2(env, "DeregisterImage" , msg)
end
export DeregisterImage

function DescribeAccountAttributes(env::AWSEnv , msg::Union(DescribeAccountAttributesType, Nothing))
    return call_ec2(env, "DescribeAccountAttributes" , msg)
end
export DescribeAccountAttributes

function DescribeAddresses(env::AWSEnv , msg::Union(DescribeAddressesType, Nothing))
    return call_ec2(env, "DescribeAddresses" , msg)
end
export DescribeAddresses

function DescribeAvailabilityZones(env::AWSEnv , msg::Union(DescribeAvailabilityZonesType, Nothing))
    return call_ec2(env, "DescribeAvailabilityZones" , msg)
end
export DescribeAvailabilityZones

function DescribeBundleTasks(env::AWSEnv , msg::Union(DescribeBundleTasksType, Nothing))
    return call_ec2(env, "DescribeBundleTasks" , msg)
end
export DescribeBundleTasks

function DescribeConversionTasks(env::AWSEnv , msg::Union(DescribeConversionTasksType, Nothing))
    return call_ec2(env, "DescribeConversionTasks" , msg)
end
export DescribeConversionTasks

function DescribeCustomerGateways(env::AWSEnv , msg::Union(DescribeCustomerGatewaysType, Nothing))
    return call_ec2(env, "DescribeCustomerGateways" , msg)
end
export DescribeCustomerGateways

function DescribeDhcpOptions(env::AWSEnv , msg::Union(DescribeDhcpOptionsType, Nothing))
    return call_ec2(env, "DescribeDhcpOptions" , msg)
end
export DescribeDhcpOptions

function DescribeExportTasks(env::AWSEnv , msg::Union(DescribeExportTasksType, Nothing))
    return call_ec2(env, "DescribeExportTasks" , msg)
end
export DescribeExportTasks

function DescribeImageAttribute(env::AWSEnv , msg::Union(DescribeImageAttributeType, Nothing))
    return call_ec2(env, "DescribeImageAttribute" , msg)
end
export DescribeImageAttribute

function DescribeImages(env::AWSEnv , msg::Union(DescribeImagesType, Nothing))
    return call_ec2(env, "DescribeImages" , msg)
end
export DescribeImages

function DescribeInstanceAttribute(env::AWSEnv , msg::Union(DescribeInstanceAttributeType, Nothing))
    return call_ec2(env, "DescribeInstanceAttribute" , msg)
end
export DescribeInstanceAttribute

function DescribeInstances(env::AWSEnv , msg::Union(DescribeInstancesType, Nothing))
    return call_ec2(env, "DescribeInstances" , msg)
end
export DescribeInstances

function DescribeInstanceStatus(env::AWSEnv , msg::Union(DescribeInstanceStatusType, Nothing))
    return call_ec2(env, "DescribeInstanceStatus" , msg)
end
export DescribeInstanceStatus

function DescribeInternetGateways(env::AWSEnv , msg::Union(DescribeInternetGatewaysType, Nothing))
    return call_ec2(env, "DescribeInternetGateways" , msg)
end
export DescribeInternetGateways

function DescribeKeyPairs(env::AWSEnv , msg::Union(DescribeKeyPairsType, Nothing))
    return call_ec2(env, "DescribeKeyPairs" , msg)
end
export DescribeKeyPairs

function DescribeLicenses(env::AWSEnv , msg::Union(DescribeLicensesType, Nothing))
    return call_ec2(env, "DescribeLicenses" , msg)
end
export DescribeLicenses

function DescribeNetworkAcls(env::AWSEnv , msg::Union(DescribeNetworkAclsType, Nothing))
    return call_ec2(env, "DescribeNetworkAcls" , msg)
end
export DescribeNetworkAcls

function DescribeNetworkInterfaceAttribute(env::AWSEnv , msg::Union(DescribeNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "DescribeNetworkInterfaceAttribute" , msg)
end
export DescribeNetworkInterfaceAttribute

function DescribeNetworkInterfaces(env::AWSEnv , msg::Union(DescribeNetworkInterfacesType, Nothing))
    return call_ec2(env, "DescribeNetworkInterfaces" , msg)
end
export DescribeNetworkInterfaces

function DescribePlacementGroups(env::AWSEnv , msg::Union(DescribePlacementGroupsType, Nothing))
    return call_ec2(env, "DescribePlacementGroups" , msg)
end
export DescribePlacementGroups

function DescribeRegions(env::AWSEnv , msg::Union(DescribeRegionsType, Nothing))
    return call_ec2(env, "DescribeRegions" , msg)
end
export DescribeRegions

function DescribeReservedInstances(env::AWSEnv , msg::Union(DescribeReservedInstancesType, Nothing))
    return call_ec2(env, "DescribeReservedInstances" , msg)
end
export DescribeReservedInstances

function DescribeReservedInstancesListings(env::AWSEnv , msg::Union(DescribeReservedInstancesListingsType, Nothing))
    return call_ec2(env, "DescribeReservedInstancesListings" , msg)
end
export DescribeReservedInstancesListings

function DescribeReservedInstancesOfferings(env::AWSEnv , msg::Union(DescribeReservedInstancesOfferingsType, Nothing))
    return call_ec2(env, "DescribeReservedInstancesOfferings" , msg)
end
export DescribeReservedInstancesOfferings

function DescribeRouteTables(env::AWSEnv , msg::Union(DescribeRouteTablesType, Nothing))
    return call_ec2(env, "DescribeRouteTables" , msg)
end
export DescribeRouteTables

function DescribeSecurityGroups(env::AWSEnv , msg::Union(DescribeSecurityGroupsType, Nothing))
    return call_ec2(env, "DescribeSecurityGroups" , msg)
end
export DescribeSecurityGroups

function DescribeSnapshotAttribute(env::AWSEnv , msg::Union(DescribeSnapshotAttributeType, Nothing))
    return call_ec2(env, "DescribeSnapshotAttribute" , msg)
end
export DescribeSnapshotAttribute

function DescribeSnapshots(env::AWSEnv , msg::Union(DescribeSnapshotsType, Nothing))
    return call_ec2(env, "DescribeSnapshots" , msg)
end
export DescribeSnapshots

function DescribeSpotDatafeedSubscription(env::AWSEnv )
    return call_ec2(env, "DescribeSpotDatafeedSubscription" )
end
export DescribeSpotDatafeedSubscription

function DescribeSpotInstanceRequests(env::AWSEnv , msg::Union(DescribeSpotInstanceRequestsType, Nothing))
    return call_ec2(env, "DescribeSpotInstanceRequests" , msg)
end
export DescribeSpotInstanceRequests

function DescribeSpotPriceHistory(env::AWSEnv , msg::Union(DescribeSpotPriceHistoryType, Nothing))
    return call_ec2(env, "DescribeSpotPriceHistory" , msg)
end
export DescribeSpotPriceHistory

function DescribeSubnets(env::AWSEnv , msg::Union(DescribeSubnetsType, Nothing))
    return call_ec2(env, "DescribeSubnets" , msg)
end
export DescribeSubnets

function DescribeTags(env::AWSEnv , msg::Union(DescribeTagsType, Nothing))
    return call_ec2(env, "DescribeTags" , msg)
end
export DescribeTags

function DescribeVolumeAttribute(env::AWSEnv , msg::Union(DescribeVolumeAttributeType, Nothing))
    return call_ec2(env, "DescribeVolumeAttribute" , msg)
end
export DescribeVolumeAttribute

function DescribeVolumes(env::AWSEnv , msg::Union(DescribeVolumesType, Nothing))
    return call_ec2(env, "DescribeVolumes" , msg)
end
export DescribeVolumes

function DescribeVolumeStatus(env::AWSEnv , msg::Union(DescribeVolumeStatusType, Nothing))
    return call_ec2(env, "DescribeVolumeStatus" , msg)
end
export DescribeVolumeStatus

function DescribeVpcAttribute(env::AWSEnv , msg::Union(DescribeVpcAttributeType, Nothing))
    return call_ec2(env, "DescribeVpcAttribute" , msg)
end
export DescribeVpcAttribute

function DescribeVpcs(env::AWSEnv , msg::Union(DescribeVpcsType, Nothing))
    return call_ec2(env, "DescribeVpcs" , msg)
end
export DescribeVpcs

function DescribeVpnConnections(env::AWSEnv , msg::Union(DescribeVpnConnectionsType, Nothing))
    return call_ec2(env, "DescribeVpnConnections" , msg)
end
export DescribeVpnConnections

function DescribeVpnGateways(env::AWSEnv , msg::Union(DescribeVpnGatewaysType, Nothing))
    return call_ec2(env, "DescribeVpnGateways" , msg)
end
export DescribeVpnGateways

function DetachInternetGateway(env::AWSEnv , msg::Union(DetachInternetGatewayType, Nothing))
    return call_ec2(env, "DetachInternetGateway" , msg)
end
export DetachInternetGateway

function DetachNetworkInterface(env::AWSEnv , msg::Union(DetachNetworkInterfaceType, Nothing))
    return call_ec2(env, "DetachNetworkInterface" , msg)
end
export DetachNetworkInterface

function DetachVolume(env::AWSEnv , msg::Union(DetachVolumeType, Nothing))
    return call_ec2(env, "DetachVolume" , msg)
end
export DetachVolume

function DetachVpnGateway(env::AWSEnv , msg::Union(DetachVpnGatewayType, Nothing))
    return call_ec2(env, "DetachVpnGateway" , msg)
end
export DetachVpnGateway

function DisableVgwRoutePropagation(env::AWSEnv , msg::Union(DisableVgwRoutePropagationRequestType, Nothing))
    return call_ec2(env, "DisableVgwRoutePropagation" , msg)
end
export DisableVgwRoutePropagation

function DisassociateAddress(env::AWSEnv , msg::Union(DisassociateAddressType, Nothing))
    return call_ec2(env, "DisassociateAddress" , msg)
end
export DisassociateAddress

function DisassociateRouteTable(env::AWSEnv , msg::Union(DisassociateRouteTableType, Nothing))
    return call_ec2(env, "DisassociateRouteTable" , msg)
end
export DisassociateRouteTable

function EnableVgwRoutePropagation(env::AWSEnv , msg::Union(EnableVgwRoutePropagationRequestType, Nothing))
    return call_ec2(env, "EnableVgwRoutePropagation" , msg)
end
export EnableVgwRoutePropagation

function EnableVolumeIO(env::AWSEnv , msg::Union(EnableVolumeIOType, Nothing))
    return call_ec2(env, "EnableVolumeIO" , msg)
end
export EnableVolumeIO

function GetConsoleOutput(env::AWSEnv , msg::Union(GetConsoleOutputType, Nothing))
    return call_ec2(env, "GetConsoleOutput" , msg)
end
export GetConsoleOutput

function GetPasswordData(env::AWSEnv , msg::Union(GetPasswordDataType, Nothing))
    return call_ec2(env, "GetPasswordData" , msg)
end
export GetPasswordData

function ImportInstance(env::AWSEnv , msg::Union(ImportInstanceType, Nothing))
    return call_ec2(env, "ImportInstance" , msg)
end
export ImportInstance

function ImportKeyPair(env::AWSEnv , msg::Union(ImportKeyPairType, Nothing))
    return call_ec2(env, "ImportKeyPair" , msg)
end
export ImportKeyPair

function ImportVolume(env::AWSEnv , msg::Union(ImportVolumeType, Nothing))
    return call_ec2(env, "ImportVolume" , msg)
end
export ImportVolume

function ModifyImageAttribute(env::AWSEnv , msg::Union(ModifyImageAttributeType, Nothing))
    return call_ec2(env, "ModifyImageAttribute" , msg)
end
export ModifyImageAttribute

function ModifyInstanceAttribute(env::AWSEnv , msg::Union(ModifyInstanceAttributeType, Nothing))
    return call_ec2(env, "ModifyInstanceAttribute" , msg)
end
export ModifyInstanceAttribute

function ModifyNetworkInterfaceAttribute(env::AWSEnv , msg::Union(ModifyNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "ModifyNetworkInterfaceAttribute" , msg)
end
export ModifyNetworkInterfaceAttribute

function ModifySnapshotAttribute(env::AWSEnv , msg::Union(ModifySnapshotAttributeType, Nothing))
    return call_ec2(env, "ModifySnapshotAttribute" , msg)
end
export ModifySnapshotAttribute

function ModifyVolumeAttribute(env::AWSEnv , msg::Union(ModifyVolumeAttributeType, Nothing))
    return call_ec2(env, "ModifyVolumeAttribute" , msg)
end
export ModifyVolumeAttribute

function ModifyVpcAttribute(env::AWSEnv , msg::Union(ModifyVpcAttributeType, Nothing))
    return call_ec2(env, "ModifyVpcAttribute" , msg)
end
export ModifyVpcAttribute

function MonitorInstances(env::AWSEnv , msg::Union(MonitorInstancesType, Nothing))
    return call_ec2(env, "MonitorInstances" , msg)
end
export MonitorInstances

function PurchaseReservedInstancesOffering(env::AWSEnv , msg::Union(PurchaseReservedInstancesOfferingType, Nothing))
    return call_ec2(env, "PurchaseReservedInstancesOffering" , msg)
end
export PurchaseReservedInstancesOffering

function RebootInstances(env::AWSEnv , msg::Union(RebootInstancesType, Nothing))
    return call_ec2(env, "RebootInstances" , msg)
end
export RebootInstances

function RegisterImage(env::AWSEnv , msg::Union(RegisterImageType, Nothing))
    return call_ec2(env, "RegisterImage" , msg)
end
export RegisterImage

function ReleaseAddress(env::AWSEnv , msg::Union(ReleaseAddressType, Nothing))
    return call_ec2(env, "ReleaseAddress" , msg)
end
export ReleaseAddress

function ReplaceNetworkAclAssociation(env::AWSEnv , msg::Union(ReplaceNetworkAclAssociationType, Nothing))
    return call_ec2(env, "ReplaceNetworkAclAssociation" , msg)
end
export ReplaceNetworkAclAssociation

function ReplaceNetworkAclEntry(env::AWSEnv , msg::Union(ReplaceNetworkAclEntryType, Nothing))
    return call_ec2(env, "ReplaceNetworkAclEntry" , msg)
end
export ReplaceNetworkAclEntry

function ReplaceRoute(env::AWSEnv , msg::Union(ReplaceRouteType, Nothing))
    return call_ec2(env, "ReplaceRoute" , msg)
end
export ReplaceRoute

function ReplaceRouteTableAssociation(env::AWSEnv , msg::Union(ReplaceRouteTableAssociationType, Nothing))
    return call_ec2(env, "ReplaceRouteTableAssociation" , msg)
end
export ReplaceRouteTableAssociation

function ReportInstanceStatus(env::AWSEnv , msg::Union(ReportInstanceStatusType, Nothing))
    return call_ec2(env, "ReportInstanceStatus" , msg)
end
export ReportInstanceStatus

function RequestSpotInstances(env::AWSEnv , msg::Union(RequestSpotInstancesType, Nothing))
    return call_ec2(env, "RequestSpotInstances" , msg)
end
export RequestSpotInstances

function ResetImageAttribute(env::AWSEnv , msg::Union(ResetImageAttributeType, Nothing))
    return call_ec2(env, "ResetImageAttribute" , msg)
end
export ResetImageAttribute

function ResetInstanceAttribute(env::AWSEnv , msg::Union(ResetInstanceAttributeType, Nothing))
    return call_ec2(env, "ResetInstanceAttribute" , msg)
end
export ResetInstanceAttribute

function ResetNetworkInterfaceAttribute(env::AWSEnv , msg::Union(ResetNetworkInterfaceAttributeType, Nothing))
    return call_ec2(env, "ResetNetworkInterfaceAttribute" , msg)
end
export ResetNetworkInterfaceAttribute

function ResetSnapshotAttribute(env::AWSEnv , msg::Union(ResetSnapshotAttributeType, Nothing))
    return call_ec2(env, "ResetSnapshotAttribute" , msg)
end
export ResetSnapshotAttribute

function RevokeSecurityGroupEgress(env::AWSEnv , msg::Union(RevokeSecurityGroupEgressType, Nothing))
    return call_ec2(env, "RevokeSecurityGroupEgress" , msg)
end
export RevokeSecurityGroupEgress

function RevokeSecurityGroupIngress(env::AWSEnv , msg::Union(RevokeSecurityGroupIngressType, Nothing))
    return call_ec2(env, "RevokeSecurityGroupIngress" , msg)
end
export RevokeSecurityGroupIngress

function RunInstances(env::AWSEnv , msg::Union(RunInstancesType, Nothing))
    return call_ec2(env, "RunInstances" , msg)
end
export RunInstances

function StartInstances(env::AWSEnv , msg::Union(StartInstancesType, Nothing))
    return call_ec2(env, "StartInstances" , msg)
end
export StartInstances

function StopInstances(env::AWSEnv , msg::Union(StopInstancesType, Nothing))
    return call_ec2(env, "StopInstances" , msg)
end
export StopInstances

function TerminateInstances(env::AWSEnv , msg::Union(TerminateInstancesType, Nothing))
    return call_ec2(env, "TerminateInstances" , msg)
end
export TerminateInstances

function UnassignPrivateIpAddresses(env::AWSEnv , msg::Union(UnassignPrivateIpAddressesType, Nothing))
    return call_ec2(env, "UnassignPrivateIpAddresses" , msg)
end
export UnassignPrivateIpAddresses

function UnmonitorInstances(env::AWSEnv , msg::Union(MonitorInstancesType, Nothing))
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

