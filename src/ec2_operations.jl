# generated from EC2TypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

type ModifyVolumeAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyVolumeAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyVolumeAttributeResult(pd) = parse_from_xml(ModifyVolumeAttributeResult, EC2TypeDict, pd)
end # ModifyVolumeAttributeResult
export ModifyVolumeAttributeResult

type ModifyVolumeAttributeRequest <: AbstractAWSType
    autoEnableIO::Union{Void,AttributeBooleanValue}
    dryRun::Union{Void,Bool}
    volumeId::Union{Void,String}
    function ModifyVolumeAttributeRequest(;autoEnableIO=nothing, dryRun=nothing, volumeId=nothing)
        new(autoEnableIO, dryRun, volumeId)
    end
    ModifyVolumeAttributeRequest(pd) = parse_from_xml(ModifyVolumeAttributeRequest, EC2TypeDict, pd)
end # ModifyVolumeAttributeRequest
export ModifyVolumeAttributeRequest

function ModifyVolumeAttribute(env::AWSEnv, msg::ModifyVolumeAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyVolumeAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyVolumeAttributeResult(resp.pd)
    end
    resp
end
ModifyVolumeAttribute(env::AWSEnv; kwargs...) = ModifyVolumeAttribute(env, ModifyVolumeAttributeRequest(; kwargs...))
export ModifyVolumeAttribute

type DeregisterImageResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeregisterImageResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeregisterImageResult(pd) = parse_from_xml(DeregisterImageResult, EC2TypeDict, pd)
end # DeregisterImageResult
export DeregisterImageResult

type DeregisterImageRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    imageId::Union{Void,String}
    function DeregisterImageRequest(;dryRun=nothing, imageId=nothing)
        new(dryRun, imageId)
    end
    DeregisterImageRequest(pd) = parse_from_xml(DeregisterImageRequest, EC2TypeDict, pd)
end # DeregisterImageRequest
export DeregisterImageRequest

function DeregisterImage(env::AWSEnv, msg::DeregisterImageRequest)
    resp::EC2Response = ec2_execute(env, "DeregisterImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeregisterImageResult(resp.pd)
    end
    resp
end
DeregisterImage(env::AWSEnv; kwargs...) = DeregisterImage(env, DeregisterImageRequest(; kwargs...))
export DeregisterImage

type CreateSecurityGroupResult <: AbstractAWSType
    groupId::Union{Void,String}
    requestId::Union{Void,String}
    function CreateSecurityGroupResult(;groupId=nothing, requestId=nothing)
        new(groupId, requestId)
    end
    CreateSecurityGroupResult(pd) = parse_from_xml(CreateSecurityGroupResult, EC2TypeDict, pd)
end # CreateSecurityGroupResult
export CreateSecurityGroupResult

type CreateSecurityGroupRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    groupDescription::Union{Void,String}
    groupName::Union{Void,String}
    vpcId::Union{Void,String}
    function CreateSecurityGroupRequest(;dryRun=nothing, groupDescription=nothing, groupName=nothing, vpcId=nothing)
        new(dryRun, groupDescription, groupName, vpcId)
    end
    CreateSecurityGroupRequest(pd) = parse_from_xml(CreateSecurityGroupRequest, EC2TypeDict, pd)
end # CreateSecurityGroupRequest
export CreateSecurityGroupRequest

function CreateSecurityGroup(env::AWSEnv, msg::CreateSecurityGroupRequest)
    resp::EC2Response = ec2_execute(env, "CreateSecurityGroup", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateSecurityGroupResult(resp.pd)
    end
    resp
end
CreateSecurityGroup(env::AWSEnv; kwargs...) = CreateSecurityGroup(env, CreateSecurityGroupRequest(; kwargs...))
export CreateSecurityGroup

type DescribeVpcAttributeResult <: AbstractAWSType
    enableDnsHostnames::Union{Void,AttributeBooleanValue}
    enableDnsSupport::Union{Void,AttributeBooleanValue}
    requestId::Union{Void,String}
    vpcId::Union{Void,String}
    function DescribeVpcAttributeResult(;enableDnsHostnames=nothing, enableDnsSupport=nothing, requestId=nothing, vpcId=nothing)
        new(enableDnsHostnames, enableDnsSupport, requestId, vpcId)
    end
    DescribeVpcAttributeResult(pd) = parse_from_xml(DescribeVpcAttributeResult, EC2TypeDict, pd)
end # DescribeVpcAttributeResult
export DescribeVpcAttributeResult

type DescribeVpcAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function DescribeVpcAttributeRequest(;attribute=nothing, dryRun=nothing, vpcId=nothing)
        new(attribute, dryRun, vpcId)
    end
    DescribeVpcAttributeRequest(pd) = parse_from_xml(DescribeVpcAttributeRequest, EC2TypeDict, pd)
end # DescribeVpcAttributeRequest
export DescribeVpcAttributeRequest

function DescribeVpcAttribute(env::AWSEnv, msg::DescribeVpcAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcAttributeResult(resp.pd)
    end
    resp
end
DescribeVpcAttribute(env::AWSEnv; kwargs...) = DescribeVpcAttribute(env, DescribeVpcAttributeRequest(; kwargs...))
export DescribeVpcAttribute

type DescribeVpcClassicLinkDnsSupportResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    vpcs::Union{Void,Array{ClassicLinkDnsSupport,1}}
    function DescribeVpcClassicLinkDnsSupportResult(;nextToken=nothing, requestId=nothing, vpcs=nothing)
        new(nextToken, requestId, vpcs)
    end
    DescribeVpcClassicLinkDnsSupportResult(pd) = parse_from_xml(DescribeVpcClassicLinkDnsSupportResult, EC2TypeDict, pd)
end # DescribeVpcClassicLinkDnsSupportResult
export DescribeVpcClassicLinkDnsSupportResult

type DescribeVpcClassicLinkDnsSupportRequest <: AbstractAWSType
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    vpcIds::Union{Void,Array{String,1}}
    function DescribeVpcClassicLinkDnsSupportRequest(;maxResults=nothing, nextToken=nothing, vpcIds=nothing)
        new(maxResults, nextToken, vpcIds)
    end
    DescribeVpcClassicLinkDnsSupportRequest(pd) = parse_from_xml(DescribeVpcClassicLinkDnsSupportRequest, EC2TypeDict, pd)
end # DescribeVpcClassicLinkDnsSupportRequest
export DescribeVpcClassicLinkDnsSupportRequest

function DescribeVpcClassicLinkDnsSupport(env::AWSEnv, msg::DescribeVpcClassicLinkDnsSupportRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcClassicLinkDnsSupport", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcClassicLinkDnsSupportResult(resp.pd)
    end
    resp
end
DescribeVpcClassicLinkDnsSupport(env::AWSEnv; kwargs...) = DescribeVpcClassicLinkDnsSupport(env, DescribeVpcClassicLinkDnsSupportRequest(; kwargs...))
export DescribeVpcClassicLinkDnsSupport

type DisableVpcClassicLinkResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DisableVpcClassicLinkResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DisableVpcClassicLinkResult(pd) = parse_from_xml(DisableVpcClassicLinkResult, EC2TypeDict, pd)
end # DisableVpcClassicLinkResult
export DisableVpcClassicLinkResult

type DisableVpcClassicLinkRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function DisableVpcClassicLinkRequest(;dryRun=nothing, vpcId=nothing)
        new(dryRun, vpcId)
    end
    DisableVpcClassicLinkRequest(pd) = parse_from_xml(DisableVpcClassicLinkRequest, EC2TypeDict, pd)
end # DisableVpcClassicLinkRequest
export DisableVpcClassicLinkRequest

function DisableVpcClassicLink(env::AWSEnv, msg::DisableVpcClassicLinkRequest)
    resp::EC2Response = ec2_execute(env, "DisableVpcClassicLink", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisableVpcClassicLinkResult(resp.pd)
    end
    resp
end
DisableVpcClassicLink(env::AWSEnv; kwargs...) = DisableVpcClassicLink(env, DisableVpcClassicLinkRequest(; kwargs...))
export DisableVpcClassicLink

type AssociateVpcCidrBlockResult <: AbstractAWSType
    ipv6CidrBlockAssociation::Union{Void,VpcIpv6CidrBlockAssociation}
    requestId::Union{Void,String}
    vpcId::Union{Void,String}
    function AssociateVpcCidrBlockResult(;ipv6CidrBlockAssociation=nothing, requestId=nothing, vpcId=nothing)
        new(ipv6CidrBlockAssociation, requestId, vpcId)
    end
    AssociateVpcCidrBlockResult(pd) = parse_from_xml(AssociateVpcCidrBlockResult, EC2TypeDict, pd)
end # AssociateVpcCidrBlockResult
export AssociateVpcCidrBlockResult

type AssociateVpcCidrBlockRequest <: AbstractAWSType
    amazonProvidedIpv6CidrBlock::Union{Void,Bool}
    vpcId::Union{Void,String}
    function AssociateVpcCidrBlockRequest(;amazonProvidedIpv6CidrBlock=nothing, vpcId=nothing)
        new(amazonProvidedIpv6CidrBlock, vpcId)
    end
    AssociateVpcCidrBlockRequest(pd) = parse_from_xml(AssociateVpcCidrBlockRequest, EC2TypeDict, pd)
end # AssociateVpcCidrBlockRequest
export AssociateVpcCidrBlockRequest

function AssociateVpcCidrBlock(env::AWSEnv, msg::AssociateVpcCidrBlockRequest)
    resp::EC2Response = ec2_execute(env, "AssociateVpcCidrBlock", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateVpcCidrBlockResult(resp.pd)
    end
    resp
end
AssociateVpcCidrBlock(env::AWSEnv; kwargs...) = AssociateVpcCidrBlock(env, AssociateVpcCidrBlockRequest(; kwargs...))
export AssociateVpcCidrBlock

type DescribeScheduledInstancesResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    scheduledInstanceSet::Union{Void,Array{ScheduledInstance,1}}
    function DescribeScheduledInstancesResult(;nextToken=nothing, requestId=nothing, scheduledInstanceSet=nothing)
        new(nextToken, requestId, scheduledInstanceSet)
    end
    DescribeScheduledInstancesResult(pd) = parse_from_xml(DescribeScheduledInstancesResult, EC2TypeDict, pd)
end # DescribeScheduledInstancesResult
export DescribeScheduledInstancesResult

type DescribeScheduledInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    scheduledInstanceId::Union{Void,Array{String,1}}
    slotStartTimeRange::Union{Void,SlotStartTimeRangeRequest}
    function DescribeScheduledInstancesRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, scheduledInstanceId=nothing, slotStartTimeRange=nothing)
        new(dryRun, filter, maxResults, nextToken, scheduledInstanceId, slotStartTimeRange)
    end
    DescribeScheduledInstancesRequest(pd) = parse_from_xml(DescribeScheduledInstancesRequest, EC2TypeDict, pd)
end # DescribeScheduledInstancesRequest
export DescribeScheduledInstancesRequest

function DescribeScheduledInstances(env::AWSEnv, msg::DescribeScheduledInstancesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeScheduledInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeScheduledInstancesResult(resp.pd)
    end
    resp
end
DescribeScheduledInstances(env::AWSEnv; kwargs...) = DescribeScheduledInstances(env, DescribeScheduledInstancesRequest(; kwargs...))
export DescribeScheduledInstances

type RevokeSecurityGroupIngressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function RevokeSecurityGroupIngressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    RevokeSecurityGroupIngressResult(pd) = parse_from_xml(RevokeSecurityGroupIngressResult, EC2TypeDict, pd)
end # RevokeSecurityGroupIngressResult
export RevokeSecurityGroupIngressResult

type RevokeSecurityGroupIngressRequest <: AbstractAWSType
    cidrIp::Union{Void,String}
    dryRun::Union{Void,Bool}
    fromPort::Union{Void,Int64}
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    ipPermissions::Union{Void,Array{IpPermission,1}}
    ipProtocol::Union{Void,String}
    sourceSecurityGroupName::Union{Void,String}
    sourceSecurityGroupOwnerId::Union{Void,String}
    toPort::Union{Void,Int64}
    function RevokeSecurityGroupIngressRequest(;cidrIp=nothing, dryRun=nothing, fromPort=nothing, groupId=nothing, groupName=nothing, ipPermissions=nothing, ipProtocol=nothing, sourceSecurityGroupName=nothing, sourceSecurityGroupOwnerId=nothing, toPort=nothing)
        new(cidrIp, dryRun, fromPort, groupId, groupName, ipPermissions, ipProtocol, sourceSecurityGroupName, sourceSecurityGroupOwnerId, toPort)
    end
    RevokeSecurityGroupIngressRequest(pd) = parse_from_xml(RevokeSecurityGroupIngressRequest, EC2TypeDict, pd)
end # RevokeSecurityGroupIngressRequest
export RevokeSecurityGroupIngressRequest

function RevokeSecurityGroupIngress(env::AWSEnv, msg::RevokeSecurityGroupIngressRequest)
    resp::EC2Response = ec2_execute(env, "RevokeSecurityGroupIngress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RevokeSecurityGroupIngressResult(resp.pd)
    end
    resp
end
RevokeSecurityGroupIngress(env::AWSEnv; kwargs...) = RevokeSecurityGroupIngress(env, RevokeSecurityGroupIngressRequest(; kwargs...))
export RevokeSecurityGroupIngress

type DescribeSpotInstanceRequestsResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotInstanceRequestSet::Union{Void,Array{SpotInstanceRequest,1}}
    function DescribeSpotInstanceRequestsResult(;requestId=nothing, spotInstanceRequestSet=nothing)
        new(requestId, spotInstanceRequestSet)
    end
    DescribeSpotInstanceRequestsResult(pd) = parse_from_xml(DescribeSpotInstanceRequestsResult, EC2TypeDict, pd)
end # DescribeSpotInstanceRequestsResult
export DescribeSpotInstanceRequestsResult

type DescribeSpotInstanceRequestsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    spotInstanceRequestId::Union{Void,Array{String,1}}
    function DescribeSpotInstanceRequestsRequest(;dryRun=nothing, filter=nothing, spotInstanceRequestId=nothing)
        new(dryRun, filter, spotInstanceRequestId)
    end
    DescribeSpotInstanceRequestsRequest(pd) = parse_from_xml(DescribeSpotInstanceRequestsRequest, EC2TypeDict, pd)
end # DescribeSpotInstanceRequestsRequest
export DescribeSpotInstanceRequestsRequest

function DescribeSpotInstanceRequests(env::AWSEnv, msg::DescribeSpotInstanceRequestsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotInstanceRequests", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotInstanceRequestsResult(resp.pd)
    end
    resp
end
DescribeSpotInstanceRequests(env::AWSEnv; kwargs...) = DescribeSpotInstanceRequests(env, DescribeSpotInstanceRequestsRequest(; kwargs...))
export DescribeSpotInstanceRequests

type DescribeExportTasksResult <: AbstractAWSType
    exportTaskSet::Union{Void,Array{ExportTask,1}}
    requestId::Union{Void,String}
    function DescribeExportTasksResult(;exportTaskSet=nothing, requestId=nothing)
        new(exportTaskSet, requestId)
    end
    DescribeExportTasksResult(pd) = parse_from_xml(DescribeExportTasksResult, EC2TypeDict, pd)
end # DescribeExportTasksResult
export DescribeExportTasksResult

type DescribeExportTasksRequest <: AbstractAWSType
    exportTaskId::Union{Void,Array{String,1}}
    function DescribeExportTasksRequest(;exportTaskId=nothing)
        new(exportTaskId)
    end
    DescribeExportTasksRequest(pd) = parse_from_xml(DescribeExportTasksRequest, EC2TypeDict, pd)
end # DescribeExportTasksRequest
export DescribeExportTasksRequest

function DescribeExportTasks(env::AWSEnv, msg::DescribeExportTasksRequest)
    resp::EC2Response = ec2_execute(env, "DescribeExportTasks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeExportTasksResult(resp.pd)
    end
    resp
end
DescribeExportTasks(env::AWSEnv; kwargs...) = DescribeExportTasks(env, DescribeExportTasksRequest(; kwargs...))
export DescribeExportTasks

type DescribeAvailabilityZonesResult <: AbstractAWSType
    availabilityZoneInfo::Union{Void,Array{AvailabilityZone,1}}
    requestId::Union{Void,String}
    function DescribeAvailabilityZonesResult(;availabilityZoneInfo=nothing, requestId=nothing)
        new(availabilityZoneInfo, requestId)
    end
    DescribeAvailabilityZonesResult(pd) = parse_from_xml(DescribeAvailabilityZonesResult, EC2TypeDict, pd)
end # DescribeAvailabilityZonesResult
export DescribeAvailabilityZonesResult

type DescribeAvailabilityZonesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    zoneName::Union{Void,Array{String,1}}
    function DescribeAvailabilityZonesRequest(;dryRun=nothing, filter=nothing, zoneName=nothing)
        new(dryRun, filter, zoneName)
    end
    DescribeAvailabilityZonesRequest(pd) = parse_from_xml(DescribeAvailabilityZonesRequest, EC2TypeDict, pd)
end # DescribeAvailabilityZonesRequest
export DescribeAvailabilityZonesRequest

function DescribeAvailabilityZones(env::AWSEnv, msg::DescribeAvailabilityZonesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeAvailabilityZones", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAvailabilityZonesResult(resp.pd)
    end
    resp
end
DescribeAvailabilityZones(env::AWSEnv; kwargs...) = DescribeAvailabilityZones(env, DescribeAvailabilityZonesRequest(; kwargs...))
export DescribeAvailabilityZones

type TerminateInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{InstanceStateChange,1}}
    requestId::Union{Void,String}
    function TerminateInstancesResult(;instancesSet=nothing, requestId=nothing)
        new(instancesSet, requestId)
    end
    TerminateInstancesResult(pd) = parse_from_xml(TerminateInstancesResult, EC2TypeDict, pd)
end # TerminateInstancesResult
export TerminateInstancesResult

type TerminateInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function TerminateInstancesRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    TerminateInstancesRequest(pd) = parse_from_xml(TerminateInstancesRequest, EC2TypeDict, pd)
end # TerminateInstancesRequest
export TerminateInstancesRequest

function TerminateInstances(env::AWSEnv, msg::TerminateInstancesRequest)
    resp::EC2Response = ec2_execute(env, "TerminateInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = TerminateInstancesResult(resp.pd)
    end
    resp
end
TerminateInstances(env::AWSEnv; kwargs...) = TerminateInstances(env, TerminateInstancesRequest(; kwargs...))
export TerminateInstances

type DeleteSnapshotResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteSnapshotResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteSnapshotResult(pd) = parse_from_xml(DeleteSnapshotResult, EC2TypeDict, pd)
end # DeleteSnapshotResult
export DeleteSnapshotResult

type DeleteSnapshotRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    snapshotId::Union{Void,String}
    function DeleteSnapshotRequest(;dryRun=nothing, snapshotId=nothing)
        new(dryRun, snapshotId)
    end
    DeleteSnapshotRequest(pd) = parse_from_xml(DeleteSnapshotRequest, EC2TypeDict, pd)
end # DeleteSnapshotRequest
export DeleteSnapshotRequest

function DeleteSnapshot(env::AWSEnv, msg::DeleteSnapshotRequest)
    resp::EC2Response = ec2_execute(env, "DeleteSnapshot", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteSnapshotResult(resp.pd)
    end
    resp
end
DeleteSnapshot(env::AWSEnv; kwargs...) = DeleteSnapshot(env, DeleteSnapshotRequest(; kwargs...))
export DeleteSnapshot

type DescribeImportSnapshotTasksResult <: AbstractAWSType
    importSnapshotTaskSet::Union{Void,Array{ImportSnapshotTask,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeImportSnapshotTasksResult(;importSnapshotTaskSet=nothing, nextToken=nothing, requestId=nothing)
        new(importSnapshotTaskSet, nextToken, requestId)
    end
    DescribeImportSnapshotTasksResult(pd) = parse_from_xml(DescribeImportSnapshotTasksResult, EC2TypeDict, pd)
end # DescribeImportSnapshotTasksResult
export DescribeImportSnapshotTasksResult

type DescribeImportSnapshotTasksRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filters::Union{Void,Array{Filter,1}}
    importTaskId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeImportSnapshotTasksRequest(;dryRun=nothing, filters=nothing, importTaskId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filters, importTaskId, maxResults, nextToken)
    end
    DescribeImportSnapshotTasksRequest(pd) = parse_from_xml(DescribeImportSnapshotTasksRequest, EC2TypeDict, pd)
end # DescribeImportSnapshotTasksRequest
export DescribeImportSnapshotTasksRequest

function DescribeImportSnapshotTasks(env::AWSEnv, msg::DescribeImportSnapshotTasksRequest)
    resp::EC2Response = ec2_execute(env, "DescribeImportSnapshotTasks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeImportSnapshotTasksResult(resp.pd)
    end
    resp
end
DescribeImportSnapshotTasks(env::AWSEnv; kwargs...) = DescribeImportSnapshotTasks(env, DescribeImportSnapshotTasksRequest(; kwargs...))
export DescribeImportSnapshotTasks

type ImportVolumeResult <: AbstractAWSType
    conversionTask::Union{Void,ConversionTask}
    requestId::Union{Void,String}
    function ImportVolumeResult(;conversionTask=nothing, requestId=nothing)
        new(conversionTask, requestId)
    end
    ImportVolumeResult(pd) = parse_from_xml(ImportVolumeResult, EC2TypeDict, pd)
end # ImportVolumeResult
export ImportVolumeResult

type ImportVolumeRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    image::Union{Void,DiskImageDetail}
    volume::Union{Void,VolumeDetail}
    function ImportVolumeRequest(;availabilityZone=nothing, description=nothing, dryRun=nothing, image=nothing, volume=nothing)
        new(availabilityZone, description, dryRun, image, volume)
    end
    ImportVolumeRequest(pd) = parse_from_xml(ImportVolumeRequest, EC2TypeDict, pd)
end # ImportVolumeRequest
export ImportVolumeRequest

function ImportVolume(env::AWSEnv, msg::ImportVolumeRequest)
    resp::EC2Response = ec2_execute(env, "ImportVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ImportVolumeResult(resp.pd)
    end
    resp
end
ImportVolume(env::AWSEnv; kwargs...) = ImportVolume(env, ImportVolumeRequest(; kwargs...))
export ImportVolume

type CreateVpcResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpc::Union{Void,Vpc}
    function CreateVpcResult(;requestId=nothing, vpc=nothing)
        new(requestId, vpc)
    end
    CreateVpcResult(pd) = parse_from_xml(CreateVpcResult, EC2TypeDict, pd)
end # CreateVpcResult
export CreateVpcResult

type CreateVpcRequest <: AbstractAWSType
    amazonProvidedIpv6CidrBlock::Union{Void,Bool}
    cidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceTenancy::Union{Void,String}
    function CreateVpcRequest(;amazonProvidedIpv6CidrBlock=nothing, cidrBlock=nothing, dryRun=nothing, instanceTenancy=nothing)
        new(amazonProvidedIpv6CidrBlock, cidrBlock, dryRun, instanceTenancy)
    end
    CreateVpcRequest(pd) = parse_from_xml(CreateVpcRequest, EC2TypeDict, pd)
end # CreateVpcRequest
export CreateVpcRequest

function CreateVpc(env::AWSEnv, msg::CreateVpcRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpc", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpcResult(resp.pd)
    end
    resp
end
CreateVpc(env::AWSEnv; kwargs...) = CreateVpc(env, CreateVpcRequest(; kwargs...))
export CreateVpc

type RejectVpcPeeringConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function RejectVpcPeeringConnectionResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    RejectVpcPeeringConnectionResult(pd) = parse_from_xml(RejectVpcPeeringConnectionResult, EC2TypeDict, pd)
end # RejectVpcPeeringConnectionResult
export RejectVpcPeeringConnectionResult

type RejectVpcPeeringConnectionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcPeeringConnectionId::Union{Void,String}
    function RejectVpcPeeringConnectionRequest(;dryRun=nothing, vpcPeeringConnectionId=nothing)
        new(dryRun, vpcPeeringConnectionId)
    end
    RejectVpcPeeringConnectionRequest(pd) = parse_from_xml(RejectVpcPeeringConnectionRequest, EC2TypeDict, pd)
end # RejectVpcPeeringConnectionRequest
export RejectVpcPeeringConnectionRequest

function RejectVpcPeeringConnection(env::AWSEnv, msg::RejectVpcPeeringConnectionRequest)
    resp::EC2Response = ec2_execute(env, "RejectVpcPeeringConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RejectVpcPeeringConnectionResult(resp.pd)
    end
    resp
end
RejectVpcPeeringConnection(env::AWSEnv; kwargs...) = RejectVpcPeeringConnection(env, RejectVpcPeeringConnectionRequest(; kwargs...))
export RejectVpcPeeringConnection

type CopySnapshotResult <: AbstractAWSType
    requestId::Union{Void,String}
    snapshotId::Union{Void,String}
    function CopySnapshotResult(;requestId=nothing, snapshotId=nothing)
        new(requestId, snapshotId)
    end
    CopySnapshotResult(pd) = parse_from_xml(CopySnapshotResult, EC2TypeDict, pd)
end # CopySnapshotResult
export CopySnapshotResult

type CopySnapshotRequest <: AbstractAWSType
    description::Union{Void,String}
    destinationRegion::Union{Void,String}
    dryRun::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    kmsKeyId::Union{Void,String}
    presignedUrl::Union{Void,String}
    sourceRegion::Union{Void,String}
    sourceSnapshotId::Union{Void,String}
    function CopySnapshotRequest(;description=nothing, destinationRegion=nothing, dryRun=nothing, encrypted=nothing, kmsKeyId=nothing, presignedUrl=nothing, sourceRegion=nothing, sourceSnapshotId=nothing)
        new(description, destinationRegion, dryRun, encrypted, kmsKeyId, presignedUrl, sourceRegion, sourceSnapshotId)
    end
    CopySnapshotRequest(pd) = parse_from_xml(CopySnapshotRequest, EC2TypeDict, pd)
end # CopySnapshotRequest
export CopySnapshotRequest

function CopySnapshot(env::AWSEnv, msg::CopySnapshotRequest)
    resp::EC2Response = ec2_execute(env, "CopySnapshot", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CopySnapshotResult(resp.pd)
    end
    resp
end
CopySnapshot(env::AWSEnv; kwargs...) = CopySnapshot(env, CopySnapshotRequest(; kwargs...))
export CopySnapshot

type CreateInternetGatewayResult <: AbstractAWSType
    internetGateway::Union{Void,InternetGateway}
    requestId::Union{Void,String}
    function CreateInternetGatewayResult(;internetGateway=nothing, requestId=nothing)
        new(internetGateway, requestId)
    end
    CreateInternetGatewayResult(pd) = parse_from_xml(CreateInternetGatewayResult, EC2TypeDict, pd)
end # CreateInternetGatewayResult
export CreateInternetGatewayResult

type CreateInternetGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    function CreateInternetGatewayRequest(;dryRun=nothing)
        new(dryRun)
    end
    CreateInternetGatewayRequest(pd) = parse_from_xml(CreateInternetGatewayRequest, EC2TypeDict, pd)
end # CreateInternetGatewayRequest
export CreateInternetGatewayRequest

function CreateInternetGateway(env::AWSEnv, msg::CreateInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "CreateInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateInternetGatewayResult(resp.pd)
    end
    resp
end
CreateInternetGateway(env::AWSEnv; kwargs...) = CreateInternetGateway(env, CreateInternetGatewayRequest(; kwargs...))
export CreateInternetGateway

type DeleteNetworkInterfaceResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteNetworkInterfaceResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteNetworkInterfaceResult(pd) = parse_from_xml(DeleteNetworkInterfaceResult, EC2TypeDict, pd)
end # DeleteNetworkInterfaceResult
export DeleteNetworkInterfaceResult

type DeleteNetworkInterfaceRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    function DeleteNetworkInterfaceRequest(;dryRun=nothing, networkInterfaceId=nothing)
        new(dryRun, networkInterfaceId)
    end
    DeleteNetworkInterfaceRequest(pd) = parse_from_xml(DeleteNetworkInterfaceRequest, EC2TypeDict, pd)
end # DeleteNetworkInterfaceRequest
export DeleteNetworkInterfaceRequest

function DeleteNetworkInterface(env::AWSEnv, msg::DeleteNetworkInterfaceRequest)
    resp::EC2Response = ec2_execute(env, "DeleteNetworkInterface", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteNetworkInterfaceResult(resp.pd)
    end
    resp
end
DeleteNetworkInterface(env::AWSEnv; kwargs...) = DeleteNetworkInterface(env, DeleteNetworkInterfaceRequest(; kwargs...))
export DeleteNetworkInterface

type DescribeKeyPairsResult <: AbstractAWSType
    keySet::Union{Void,Array{KeyPairInfo,1}}
    requestId::Union{Void,String}
    function DescribeKeyPairsResult(;keySet=nothing, requestId=nothing)
        new(keySet, requestId)
    end
    DescribeKeyPairsResult(pd) = parse_from_xml(DescribeKeyPairsResult, EC2TypeDict, pd)
end # DescribeKeyPairsResult
export DescribeKeyPairsResult

type DescribeKeyPairsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    keyName::Union{Void,Array{String,1}}
    function DescribeKeyPairsRequest(;dryRun=nothing, filter=nothing, keyName=nothing)
        new(dryRun, filter, keyName)
    end
    DescribeKeyPairsRequest(pd) = parse_from_xml(DescribeKeyPairsRequest, EC2TypeDict, pd)
end # DescribeKeyPairsRequest
export DescribeKeyPairsRequest

function DescribeKeyPairs(env::AWSEnv, msg::DescribeKeyPairsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeKeyPairs", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeKeyPairsResult(resp.pd)
    end
    resp
end
DescribeKeyPairs(env::AWSEnv; kwargs...) = DescribeKeyPairs(env, DescribeKeyPairsRequest(; kwargs...))
export DescribeKeyPairs

type DescribeNetworkInterfaceAttributeResult <: AbstractAWSType
    attachment::Union{Void,NetworkInterfaceAttachment}
    description::Union{Void,AttributeValue}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    networkInterfaceId::Union{Void,String}
    requestId::Union{Void,String}
    sourceDestCheck::Union{Void,AttributeBooleanValue}
    function DescribeNetworkInterfaceAttributeResult(;attachment=nothing, description=nothing, groupSet=nothing, networkInterfaceId=nothing, requestId=nothing, sourceDestCheck=nothing)
        new(attachment, description, groupSet, networkInterfaceId, requestId, sourceDestCheck)
    end
    DescribeNetworkInterfaceAttributeResult(pd) = parse_from_xml(DescribeNetworkInterfaceAttributeResult, EC2TypeDict, pd)
end # DescribeNetworkInterfaceAttributeResult
export DescribeNetworkInterfaceAttributeResult

type DescribeNetworkInterfaceAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    function DescribeNetworkInterfaceAttributeRequest(;attribute=nothing, dryRun=nothing, networkInterfaceId=nothing)
        new(attribute, dryRun, networkInterfaceId)
    end
    DescribeNetworkInterfaceAttributeRequest(pd) = parse_from_xml(DescribeNetworkInterfaceAttributeRequest, EC2TypeDict, pd)
end # DescribeNetworkInterfaceAttributeRequest
export DescribeNetworkInterfaceAttributeRequest

function DescribeNetworkInterfaceAttribute(env::AWSEnv, msg::DescribeNetworkInterfaceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeNetworkInterfaceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNetworkInterfaceAttributeResult(resp.pd)
    end
    resp
end
DescribeNetworkInterfaceAttribute(env::AWSEnv; kwargs...) = DescribeNetworkInterfaceAttribute(env, DescribeNetworkInterfaceAttributeRequest(; kwargs...))
export DescribeNetworkInterfaceAttribute

type EnableVpcClassicLinkResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function EnableVpcClassicLinkResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    EnableVpcClassicLinkResult(pd) = parse_from_xml(EnableVpcClassicLinkResult, EC2TypeDict, pd)
end # EnableVpcClassicLinkResult
export EnableVpcClassicLinkResult

type EnableVpcClassicLinkRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function EnableVpcClassicLinkRequest(;dryRun=nothing, vpcId=nothing)
        new(dryRun, vpcId)
    end
    EnableVpcClassicLinkRequest(pd) = parse_from_xml(EnableVpcClassicLinkRequest, EC2TypeDict, pd)
end # EnableVpcClassicLinkRequest
export EnableVpcClassicLinkRequest

function EnableVpcClassicLink(env::AWSEnv, msg::EnableVpcClassicLinkRequest)
    resp::EC2Response = ec2_execute(env, "EnableVpcClassicLink", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = EnableVpcClassicLinkResult(resp.pd)
    end
    resp
end
EnableVpcClassicLink(env::AWSEnv; kwargs...) = EnableVpcClassicLink(env, EnableVpcClassicLinkRequest(; kwargs...))
export EnableVpcClassicLink

type DeleteVolumeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVolumeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVolumeResult(pd) = parse_from_xml(DeleteVolumeResult, EC2TypeDict, pd)
end # DeleteVolumeResult
export DeleteVolumeResult

type DeleteVolumeRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    volumeId::Union{Void,String}
    function DeleteVolumeRequest(;dryRun=nothing, volumeId=nothing)
        new(dryRun, volumeId)
    end
    DeleteVolumeRequest(pd) = parse_from_xml(DeleteVolumeRequest, EC2TypeDict, pd)
end # DeleteVolumeRequest
export DeleteVolumeRequest

function DeleteVolume(env::AWSEnv, msg::DeleteVolumeRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVolumeResult(resp.pd)
    end
    resp
end
DeleteVolume(env::AWSEnv; kwargs...) = DeleteVolume(env, DeleteVolumeRequest(; kwargs...))
export DeleteVolume

type ModifyVpcEndpointResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyVpcEndpointResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyVpcEndpointResult(pd) = parse_from_xml(ModifyVpcEndpointResult, EC2TypeDict, pd)
end # ModifyVpcEndpointResult
export ModifyVpcEndpointResult

type ModifyVpcEndpointRequest <: AbstractAWSType
    addRouteTableId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    policyDocument::Union{Void,String}
    removeRouteTableId::Union{Void,Array{String,1}}
    resetPolicy::Union{Void,Bool}
    vpcEndpointId::Union{Void,String}
    function ModifyVpcEndpointRequest(;addRouteTableId=nothing, dryRun=nothing, policyDocument=nothing, removeRouteTableId=nothing, resetPolicy=nothing, vpcEndpointId=nothing)
        new(addRouteTableId, dryRun, policyDocument, removeRouteTableId, resetPolicy, vpcEndpointId)
    end
    ModifyVpcEndpointRequest(pd) = parse_from_xml(ModifyVpcEndpointRequest, EC2TypeDict, pd)
end # ModifyVpcEndpointRequest
export ModifyVpcEndpointRequest

function ModifyVpcEndpoint(env::AWSEnv, msg::ModifyVpcEndpointRequest)
    resp::EC2Response = ec2_execute(env, "ModifyVpcEndpoint", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyVpcEndpointResult(resp.pd)
    end
    resp
end
ModifyVpcEndpoint(env::AWSEnv; kwargs...) = ModifyVpcEndpoint(env, ModifyVpcEndpointRequest(; kwargs...))
export ModifyVpcEndpoint

type DisassociateSubnetCidrBlockResult <: AbstractAWSType
    ipv6CidrBlockAssociation::Union{Void,SubnetIpv6CidrBlockAssociation}
    requestId::Union{Void,String}
    subnetId::Union{Void,String}
    function DisassociateSubnetCidrBlockResult(;ipv6CidrBlockAssociation=nothing, requestId=nothing, subnetId=nothing)
        new(ipv6CidrBlockAssociation, requestId, subnetId)
    end
    DisassociateSubnetCidrBlockResult(pd) = parse_from_xml(DisassociateSubnetCidrBlockResult, EC2TypeDict, pd)
end # DisassociateSubnetCidrBlockResult
export DisassociateSubnetCidrBlockResult

type DisassociateSubnetCidrBlockRequest <: AbstractAWSType
    associationId::Union{Void,String}
    function DisassociateSubnetCidrBlockRequest(;associationId=nothing)
        new(associationId)
    end
    DisassociateSubnetCidrBlockRequest(pd) = parse_from_xml(DisassociateSubnetCidrBlockRequest, EC2TypeDict, pd)
end # DisassociateSubnetCidrBlockRequest
export DisassociateSubnetCidrBlockRequest

function DisassociateSubnetCidrBlock(env::AWSEnv, msg::DisassociateSubnetCidrBlockRequest)
    resp::EC2Response = ec2_execute(env, "DisassociateSubnetCidrBlock", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisassociateSubnetCidrBlockResult(resp.pd)
    end
    resp
end
DisassociateSubnetCidrBlock(env::AWSEnv; kwargs...) = DisassociateSubnetCidrBlock(env, DisassociateSubnetCidrBlockRequest(; kwargs...))
export DisassociateSubnetCidrBlock

type ModifyIdFormatResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyIdFormatResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyIdFormatResult(pd) = parse_from_xml(ModifyIdFormatResult, EC2TypeDict, pd)
end # ModifyIdFormatResult
export ModifyIdFormatResult

type ModifyIdFormatRequest <: AbstractAWSType
    resource::Union{Void,String}
    useLongIds::Union{Void,Bool}
    function ModifyIdFormatRequest(;resource=nothing, useLongIds=nothing)
        new(resource, useLongIds)
    end
    ModifyIdFormatRequest(pd) = parse_from_xml(ModifyIdFormatRequest, EC2TypeDict, pd)
end # ModifyIdFormatRequest
export ModifyIdFormatRequest

function ModifyIdFormat(env::AWSEnv, msg::ModifyIdFormatRequest)
    resp::EC2Response = ec2_execute(env, "ModifyIdFormat", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyIdFormatResult(resp.pd)
    end
    resp
end
ModifyIdFormat(env::AWSEnv; kwargs...) = ModifyIdFormat(env, ModifyIdFormatRequest(; kwargs...))
export ModifyIdFormat

type DescribeSecurityGroupReferencesResult <: AbstractAWSType
    requestId::Union{Void,String}
    securityGroupReferenceSet::Union{Void,Array{SecurityGroupReference,1}}
    function DescribeSecurityGroupReferencesResult(;requestId=nothing, securityGroupReferenceSet=nothing)
        new(requestId, securityGroupReferenceSet)
    end
    DescribeSecurityGroupReferencesResult(pd) = parse_from_xml(DescribeSecurityGroupReferencesResult, EC2TypeDict, pd)
end # DescribeSecurityGroupReferencesResult
export DescribeSecurityGroupReferencesResult

type DescribeSecurityGroupReferencesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    groupId::Union{Void,Array{String,1}}
    function DescribeSecurityGroupReferencesRequest(;dryRun=nothing, groupId=nothing)
        new(dryRun, groupId)
    end
    DescribeSecurityGroupReferencesRequest(pd) = parse_from_xml(DescribeSecurityGroupReferencesRequest, EC2TypeDict, pd)
end # DescribeSecurityGroupReferencesRequest
export DescribeSecurityGroupReferencesRequest

function DescribeSecurityGroupReferences(env::AWSEnv, msg::DescribeSecurityGroupReferencesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSecurityGroupReferences", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSecurityGroupReferencesResult(resp.pd)
    end
    resp
end
DescribeSecurityGroupReferences(env::AWSEnv; kwargs...) = DescribeSecurityGroupReferences(env, DescribeSecurityGroupReferencesRequest(; kwargs...))
export DescribeSecurityGroupReferences

type GetPasswordDataResult <: AbstractAWSType
    instanceId::Union{Void,String}
    passwordData::Union{Void,String}
    requestId::Union{Void,String}
    timestamp::Union{Void,DateTime}
    function GetPasswordDataResult(;instanceId=nothing, passwordData=nothing, requestId=nothing, timestamp=nothing)
        new(instanceId, passwordData, requestId, timestamp)
    end
    GetPasswordDataResult(pd) = parse_from_xml(GetPasswordDataResult, EC2TypeDict, pd)
end # GetPasswordDataResult
export GetPasswordDataResult

type GetPasswordDataRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    function GetPasswordDataRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    GetPasswordDataRequest(pd) = parse_from_xml(GetPasswordDataRequest, EC2TypeDict, pd)
end # GetPasswordDataRequest
export GetPasswordDataRequest

function GetPasswordData(env::AWSEnv, msg::GetPasswordDataRequest)
    resp::EC2Response = ec2_execute(env, "GetPasswordData", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetPasswordDataResult(resp.pd)
    end
    resp
end
GetPasswordData(env::AWSEnv; kwargs...) = GetPasswordData(env, GetPasswordDataRequest(; kwargs...))
export GetPasswordData

type AcceptVpcPeeringConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpcPeeringConnection::Union{Void,VpcPeeringConnection}
    function AcceptVpcPeeringConnectionResult(;requestId=nothing, vpcPeeringConnection=nothing)
        new(requestId, vpcPeeringConnection)
    end
    AcceptVpcPeeringConnectionResult(pd) = parse_from_xml(AcceptVpcPeeringConnectionResult, EC2TypeDict, pd)
end # AcceptVpcPeeringConnectionResult
export AcceptVpcPeeringConnectionResult

type AcceptVpcPeeringConnectionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcPeeringConnectionId::Union{Void,String}
    function AcceptVpcPeeringConnectionRequest(;dryRun=nothing, vpcPeeringConnectionId=nothing)
        new(dryRun, vpcPeeringConnectionId)
    end
    AcceptVpcPeeringConnectionRequest(pd) = parse_from_xml(AcceptVpcPeeringConnectionRequest, EC2TypeDict, pd)
end # AcceptVpcPeeringConnectionRequest
export AcceptVpcPeeringConnectionRequest

function AcceptVpcPeeringConnection(env::AWSEnv, msg::AcceptVpcPeeringConnectionRequest)
    resp::EC2Response = ec2_execute(env, "AcceptVpcPeeringConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AcceptVpcPeeringConnectionResult(resp.pd)
    end
    resp
end
AcceptVpcPeeringConnection(env::AWSEnv; kwargs...) = AcceptVpcPeeringConnection(env, AcceptVpcPeeringConnectionRequest(; kwargs...))
export AcceptVpcPeeringConnection

type DescribeInstanceStatusResult <: AbstractAWSType
    instanceStatusSet::Union{Void,Array{InstanceStatus,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeInstanceStatusResult(;instanceStatusSet=nothing, nextToken=nothing, requestId=nothing)
        new(instanceStatusSet, nextToken, requestId)
    end
    DescribeInstanceStatusResult(pd) = parse_from_xml(DescribeInstanceStatusResult, EC2TypeDict, pd)
end # DescribeInstanceStatusResult
export DescribeInstanceStatusResult

type DescribeInstanceStatusRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    includeAllInstances::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeInstanceStatusRequest(;dryRun=nothing, filter=nothing, includeAllInstances=nothing, instanceId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filter, includeAllInstances, instanceId, maxResults, nextToken)
    end
    DescribeInstanceStatusRequest(pd) = parse_from_xml(DescribeInstanceStatusRequest, EC2TypeDict, pd)
end # DescribeInstanceStatusRequest
export DescribeInstanceStatusRequest

function DescribeInstanceStatus(env::AWSEnv, msg::DescribeInstanceStatusRequest)
    resp::EC2Response = ec2_execute(env, "DescribeInstanceStatus", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeInstanceStatusResult(resp.pd)
    end
    resp
end
DescribeInstanceStatus(env::AWSEnv; kwargs...) = DescribeInstanceStatus(env, DescribeInstanceStatusRequest(; kwargs...))
export DescribeInstanceStatus

type GetHostReservationPurchasePreviewResult <: AbstractAWSType
    currencyCode::Union{Void,String}
    purchase::Union{Void,Array{Purchase,1}}
    requestId::Union{Void,String}
    totalHourlyPrice::Union{Void,String}
    totalUpfrontPrice::Union{Void,String}
    function GetHostReservationPurchasePreviewResult(;currencyCode=nothing, purchase=nothing, requestId=nothing, totalHourlyPrice=nothing, totalUpfrontPrice=nothing)
        new(currencyCode, purchase, requestId, totalHourlyPrice, totalUpfrontPrice)
    end
    GetHostReservationPurchasePreviewResult(pd) = parse_from_xml(GetHostReservationPurchasePreviewResult, EC2TypeDict, pd)
end # GetHostReservationPurchasePreviewResult
export GetHostReservationPurchasePreviewResult

type GetHostReservationPurchasePreviewRequest <: AbstractAWSType
    hostIdSet::Union{Void,Array{String,1}}
    offeringId::Union{Void,String}
    function GetHostReservationPurchasePreviewRequest(;hostIdSet=nothing, offeringId=nothing)
        new(hostIdSet, offeringId)
    end
    GetHostReservationPurchasePreviewRequest(pd) = parse_from_xml(GetHostReservationPurchasePreviewRequest, EC2TypeDict, pd)
end # GetHostReservationPurchasePreviewRequest
export GetHostReservationPurchasePreviewRequest

function GetHostReservationPurchasePreview(env::AWSEnv, msg::GetHostReservationPurchasePreviewRequest)
    resp::EC2Response = ec2_execute(env, "GetHostReservationPurchasePreview", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetHostReservationPurchasePreviewResult(resp.pd)
    end
    resp
end
GetHostReservationPurchasePreview(env::AWSEnv; kwargs...) = GetHostReservationPurchasePreview(env, GetHostReservationPurchasePreviewRequest(; kwargs...))
export GetHostReservationPurchasePreview

type CreateVolumeResult <: AbstractAWSType
    attachmentSet::Union{Void,Array{VolumeAttachment,1}}
    availabilityZone::Union{Void,String}
    createTime::Union{Void,DateTime}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    kmsKeyId::Union{Void,String}
    requestId::Union{Void,String}
    size::Union{Void,Int64}
    snapshotId::Union{Void,String}
    status::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    volumeId::Union{Void,String}
    volumeType::Union{Void,String}
    function CreateVolumeResult(;attachmentSet=nothing, availabilityZone=nothing, createTime=nothing, encrypted=nothing, iops=nothing, kmsKeyId=nothing, requestId=nothing, size=nothing, snapshotId=nothing, status=nothing, tagSet=nothing, volumeId=nothing, volumeType=nothing)
        new(attachmentSet, availabilityZone, createTime, encrypted, iops, kmsKeyId, requestId, size, snapshotId, status, tagSet, volumeId, volumeType)
    end
    CreateVolumeResult(pd) = parse_from_xml(CreateVolumeResult, EC2TypeDict, pd)
end # CreateVolumeResult
export CreateVolumeResult

type CreateVolumeRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    dryRun::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    iops::Union{Void,Int64}
    kmsKeyId::Union{Void,String}
    size::Union{Void,Int64}
    snapshotId::Union{Void,String}
    tagSpecification::Union{Void,Array{TagSpecification,1}}
    volumeType::Union{Void,String}
    function CreateVolumeRequest(;availabilityZone=nothing, dryRun=nothing, encrypted=nothing, iops=nothing, kmsKeyId=nothing, size=nothing, snapshotId=nothing, tagSpecification=nothing, volumeType=nothing)
        new(availabilityZone, dryRun, encrypted, iops, kmsKeyId, size, snapshotId, tagSpecification, volumeType)
    end
    CreateVolumeRequest(pd) = parse_from_xml(CreateVolumeRequest, EC2TypeDict, pd)
end # CreateVolumeRequest
export CreateVolumeRequest

function CreateVolume(env::AWSEnv, msg::CreateVolumeRequest)
    resp::EC2Response = ec2_execute(env, "CreateVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVolumeResult(resp.pd)
    end
    resp
end
CreateVolume(env::AWSEnv; kwargs...) = CreateVolume(env, CreateVolumeRequest(; kwargs...))
export CreateVolume

type UnassignPrivateIpAddressesResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function UnassignPrivateIpAddressesResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    UnassignPrivateIpAddressesResult(pd) = parse_from_xml(UnassignPrivateIpAddressesResult, EC2TypeDict, pd)
end # UnassignPrivateIpAddressesResult
export UnassignPrivateIpAddressesResult

type UnassignPrivateIpAddressesRequest <: AbstractAWSType
    networkInterfaceId::Union{Void,String}
    privateIpAddress::Union{Void,Array{String,1}}
    function UnassignPrivateIpAddressesRequest(;networkInterfaceId=nothing, privateIpAddress=nothing)
        new(networkInterfaceId, privateIpAddress)
    end
    UnassignPrivateIpAddressesRequest(pd) = parse_from_xml(UnassignPrivateIpAddressesRequest, EC2TypeDict, pd)
end # UnassignPrivateIpAddressesRequest
export UnassignPrivateIpAddressesRequest

function UnassignPrivateIpAddresses(env::AWSEnv, msg::UnassignPrivateIpAddressesRequest)
    resp::EC2Response = ec2_execute(env, "UnassignPrivateIpAddresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = UnassignPrivateIpAddressesResult(resp.pd)
    end
    resp
end
UnassignPrivateIpAddresses(env::AWSEnv; kwargs...) = UnassignPrivateIpAddresses(env, UnassignPrivateIpAddressesRequest(; kwargs...))
export UnassignPrivateIpAddresses

type ModifyNetworkInterfaceAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyNetworkInterfaceAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyNetworkInterfaceAttributeResult(pd) = parse_from_xml(ModifyNetworkInterfaceAttributeResult, EC2TypeDict, pd)
end # ModifyNetworkInterfaceAttributeResult
export ModifyNetworkInterfaceAttributeResult

type ModifyNetworkInterfaceAttributeRequest <: AbstractAWSType
    attachment::Union{Void,NetworkInterfaceAttachmentChanges}
    description::Union{Void,AttributeValue}
    dryRun::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    securityGroupId::Union{Void,Array{String,1}}
    sourceDestCheck::Union{Void,AttributeBooleanValue}
    function ModifyNetworkInterfaceAttributeRequest(;attachment=nothing, description=nothing, dryRun=nothing, networkInterfaceId=nothing, securityGroupId=nothing, sourceDestCheck=nothing)
        new(attachment, description, dryRun, networkInterfaceId, securityGroupId, sourceDestCheck)
    end
    ModifyNetworkInterfaceAttributeRequest(pd) = parse_from_xml(ModifyNetworkInterfaceAttributeRequest, EC2TypeDict, pd)
end # ModifyNetworkInterfaceAttributeRequest
export ModifyNetworkInterfaceAttributeRequest

function ModifyNetworkInterfaceAttribute(env::AWSEnv, msg::ModifyNetworkInterfaceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyNetworkInterfaceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyNetworkInterfaceAttributeResult(resp.pd)
    end
    resp
end
ModifyNetworkInterfaceAttribute(env::AWSEnv; kwargs...) = ModifyNetworkInterfaceAttribute(env, ModifyNetworkInterfaceAttributeRequest(; kwargs...))
export ModifyNetworkInterfaceAttribute

type DeleteVpnGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVpnGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVpnGatewayResult(pd) = parse_from_xml(DeleteVpnGatewayResult, EC2TypeDict, pd)
end # DeleteVpnGatewayResult
export DeleteVpnGatewayResult

type DeleteVpnGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpnGatewayId::Union{Void,String}
    function DeleteVpnGatewayRequest(;dryRun=nothing, vpnGatewayId=nothing)
        new(dryRun, vpnGatewayId)
    end
    DeleteVpnGatewayRequest(pd) = parse_from_xml(DeleteVpnGatewayRequest, EC2TypeDict, pd)
end # DeleteVpnGatewayRequest
export DeleteVpnGatewayRequest

function DeleteVpnGateway(env::AWSEnv, msg::DeleteVpnGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpnGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpnGatewayResult(resp.pd)
    end
    resp
end
DeleteVpnGateway(env::AWSEnv; kwargs...) = DeleteVpnGateway(env, DeleteVpnGatewayRequest(; kwargs...))
export DeleteVpnGateway

type DetachClassicLinkVpcResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DetachClassicLinkVpcResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DetachClassicLinkVpcResult(pd) = parse_from_xml(DetachClassicLinkVpcResult, EC2TypeDict, pd)
end # DetachClassicLinkVpcResult
export DetachClassicLinkVpcResult

type DetachClassicLinkVpcRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    vpcId::Union{Void,String}
    function DetachClassicLinkVpcRequest(;dryRun=nothing, instanceId=nothing, vpcId=nothing)
        new(dryRun, instanceId, vpcId)
    end
    DetachClassicLinkVpcRequest(pd) = parse_from_xml(DetachClassicLinkVpcRequest, EC2TypeDict, pd)
end # DetachClassicLinkVpcRequest
export DetachClassicLinkVpcRequest

function DetachClassicLinkVpc(env::AWSEnv, msg::DetachClassicLinkVpcRequest)
    resp::EC2Response = ec2_execute(env, "DetachClassicLinkVpc", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachClassicLinkVpcResult(resp.pd)
    end
    resp
end
DetachClassicLinkVpc(env::AWSEnv; kwargs...) = DetachClassicLinkVpc(env, DetachClassicLinkVpcRequest(; kwargs...))
export DetachClassicLinkVpc

type UnmonitorInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{InstanceMonitoring,1}}
    requestId::Union{Void,String}
    function UnmonitorInstancesResult(;instancesSet=nothing, requestId=nothing)
        new(instancesSet, requestId)
    end
    UnmonitorInstancesResult(pd) = parse_from_xml(UnmonitorInstancesResult, EC2TypeDict, pd)
end # UnmonitorInstancesResult
export UnmonitorInstancesResult

type UnmonitorInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function UnmonitorInstancesRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    UnmonitorInstancesRequest(pd) = parse_from_xml(UnmonitorInstancesRequest, EC2TypeDict, pd)
end # UnmonitorInstancesRequest
export UnmonitorInstancesRequest

function UnmonitorInstances(env::AWSEnv, msg::UnmonitorInstancesRequest)
    resp::EC2Response = ec2_execute(env, "UnmonitorInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = UnmonitorInstancesResult(resp.pd)
    end
    resp
end
UnmonitorInstances(env::AWSEnv; kwargs...) = UnmonitorInstances(env, UnmonitorInstancesRequest(; kwargs...))
export UnmonitorInstances

type CreateNetworkInterfacePermissionResult <: AbstractAWSType
    interfacePermission::Union{Void,NetworkInterfacePermission}
    requestId::Union{Void,String}
    function CreateNetworkInterfacePermissionResult(;interfacePermission=nothing, requestId=nothing)
        new(interfacePermission, requestId)
    end
    CreateNetworkInterfacePermissionResult(pd) = parse_from_xml(CreateNetworkInterfacePermissionResult, EC2TypeDict, pd)
end # CreateNetworkInterfacePermissionResult
export CreateNetworkInterfacePermissionResult

type CreateNetworkInterfacePermissionRequest <: AbstractAWSType
    awsAccountId::Union{Void,String}
    awsService::Union{Void,String}
    dryRun::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    permission::Union{Void,String}
    function CreateNetworkInterfacePermissionRequest(;awsAccountId=nothing, awsService=nothing, dryRun=nothing, networkInterfaceId=nothing, permission=nothing)
        new(awsAccountId, awsService, dryRun, networkInterfaceId, permission)
    end
    CreateNetworkInterfacePermissionRequest(pd) = parse_from_xml(CreateNetworkInterfacePermissionRequest, EC2TypeDict, pd)
end # CreateNetworkInterfacePermissionRequest
export CreateNetworkInterfacePermissionRequest

function CreateNetworkInterfacePermission(env::AWSEnv, msg::CreateNetworkInterfacePermissionRequest)
    resp::EC2Response = ec2_execute(env, "CreateNetworkInterfacePermission", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateNetworkInterfacePermissionResult(resp.pd)
    end
    resp
end
CreateNetworkInterfacePermission(env::AWSEnv; kwargs...) = CreateNetworkInterfacePermission(env, CreateNetworkInterfacePermissionRequest(; kwargs...))
export CreateNetworkInterfacePermission

type DescribeVpcClassicLinkResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpcSet::Union{Void,Array{VpcClassicLink,1}}
    function DescribeVpcClassicLinkResult(;requestId=nothing, vpcSet=nothing)
        new(requestId, vpcSet)
    end
    DescribeVpcClassicLinkResult(pd) = parse_from_xml(DescribeVpcClassicLinkResult, EC2TypeDict, pd)
end # DescribeVpcClassicLinkResult
export DescribeVpcClassicLinkResult

type DescribeVpcClassicLinkRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    vpcId::Union{Void,Array{String,1}}
    function DescribeVpcClassicLinkRequest(;dryRun=nothing, filter=nothing, vpcId=nothing)
        new(dryRun, filter, vpcId)
    end
    DescribeVpcClassicLinkRequest(pd) = parse_from_xml(DescribeVpcClassicLinkRequest, EC2TypeDict, pd)
end # DescribeVpcClassicLinkRequest
export DescribeVpcClassicLinkRequest

function DescribeVpcClassicLink(env::AWSEnv, msg::DescribeVpcClassicLinkRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcClassicLink", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcClassicLinkResult(resp.pd)
    end
    resp
end
DescribeVpcClassicLink(env::AWSEnv; kwargs...) = DescribeVpcClassicLink(env, DescribeVpcClassicLinkRequest(; kwargs...))
export DescribeVpcClassicLink

type DescribeSpotFleetRequestsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    spotFleetRequestConfigSet::Union{Void,Array{SpotFleetRequestConfig,1}}
    function DescribeSpotFleetRequestsResult(;nextToken=nothing, requestId=nothing, spotFleetRequestConfigSet=nothing)
        new(nextToken, requestId, spotFleetRequestConfigSet)
    end
    DescribeSpotFleetRequestsResult(pd) = parse_from_xml(DescribeSpotFleetRequestsResult, EC2TypeDict, pd)
end # DescribeSpotFleetRequestsResult
export DescribeSpotFleetRequestsResult

type DescribeSpotFleetRequestsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    spotFleetRequestId::Union{Void,Array{String,1}}
    function DescribeSpotFleetRequestsRequest(;dryRun=nothing, maxResults=nothing, nextToken=nothing, spotFleetRequestId=nothing)
        new(dryRun, maxResults, nextToken, spotFleetRequestId)
    end
    DescribeSpotFleetRequestsRequest(pd) = parse_from_xml(DescribeSpotFleetRequestsRequest, EC2TypeDict, pd)
end # DescribeSpotFleetRequestsRequest
export DescribeSpotFleetRequestsRequest

function DescribeSpotFleetRequests(env::AWSEnv, msg::DescribeSpotFleetRequestsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotFleetRequests", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotFleetRequestsResult(resp.pd)
    end
    resp
end
DescribeSpotFleetRequests(env::AWSEnv; kwargs...) = DescribeSpotFleetRequests(env, DescribeSpotFleetRequestsRequest(; kwargs...))
export DescribeSpotFleetRequests

type ImportKeyPairResult <: AbstractAWSType
    keyFingerprint::Union{Void,String}
    keyName::Union{Void,String}
    requestId::Union{Void,String}
    function ImportKeyPairResult(;keyFingerprint=nothing, keyName=nothing, requestId=nothing)
        new(keyFingerprint, keyName, requestId)
    end
    ImportKeyPairResult(pd) = parse_from_xml(ImportKeyPairResult, EC2TypeDict, pd)
end # ImportKeyPairResult
export ImportKeyPairResult

type ImportKeyPairRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    keyName::Union{Void,String}
    publicKeyMaterial::Union{Void,Array{UInt8,1}}
    function ImportKeyPairRequest(;dryRun=nothing, keyName=nothing, publicKeyMaterial=nothing)
        new(dryRun, keyName, publicKeyMaterial)
    end
    ImportKeyPairRequest(pd) = parse_from_xml(ImportKeyPairRequest, EC2TypeDict, pd)
end # ImportKeyPairRequest
export ImportKeyPairRequest

function ImportKeyPair(env::AWSEnv, msg::ImportKeyPairRequest)
    resp::EC2Response = ec2_execute(env, "ImportKeyPair", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ImportKeyPairResult(resp.pd)
    end
    resp
end
ImportKeyPair(env::AWSEnv; kwargs...) = ImportKeyPair(env, ImportKeyPairRequest(; kwargs...))
export ImportKeyPair

type CreateEgressOnlyInternetGatewayResult <: AbstractAWSType
    clientToken::Union{Void,String}
    egressOnlyInternetGateway::Union{Void,EgressOnlyInternetGateway}
    requestId::Union{Void,String}
    function CreateEgressOnlyInternetGatewayResult(;clientToken=nothing, egressOnlyInternetGateway=nothing, requestId=nothing)
        new(clientToken, egressOnlyInternetGateway, requestId)
    end
    CreateEgressOnlyInternetGatewayResult(pd) = parse_from_xml(CreateEgressOnlyInternetGatewayResult, EC2TypeDict, pd)
end # CreateEgressOnlyInternetGatewayResult
export CreateEgressOnlyInternetGatewayResult

type CreateEgressOnlyInternetGatewayRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function CreateEgressOnlyInternetGatewayRequest(;clientToken=nothing, dryRun=nothing, vpcId=nothing)
        new(clientToken, dryRun, vpcId)
    end
    CreateEgressOnlyInternetGatewayRequest(pd) = parse_from_xml(CreateEgressOnlyInternetGatewayRequest, EC2TypeDict, pd)
end # CreateEgressOnlyInternetGatewayRequest
export CreateEgressOnlyInternetGatewayRequest

function CreateEgressOnlyInternetGateway(env::AWSEnv, msg::CreateEgressOnlyInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "CreateEgressOnlyInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateEgressOnlyInternetGatewayResult(resp.pd)
    end
    resp
end
CreateEgressOnlyInternetGateway(env::AWSEnv; kwargs...) = CreateEgressOnlyInternetGateway(env, CreateEgressOnlyInternetGatewayRequest(; kwargs...))
export CreateEgressOnlyInternetGateway

type AssignIpv6AddressesResult <: AbstractAWSType
    assignedIpv6Addresses::Union{Void,Array{String,1}}
    networkInterfaceId::Union{Void,String}
    requestId::Union{Void,String}
    function AssignIpv6AddressesResult(;assignedIpv6Addresses=nothing, networkInterfaceId=nothing, requestId=nothing)
        new(assignedIpv6Addresses, networkInterfaceId, requestId)
    end
    AssignIpv6AddressesResult(pd) = parse_from_xml(AssignIpv6AddressesResult, EC2TypeDict, pd)
end # AssignIpv6AddressesResult
export AssignIpv6AddressesResult

type AssignIpv6AddressesRequest <: AbstractAWSType
    ipv6AddressCount::Union{Void,Int64}
    ipv6Addresses::Union{Void,Array{String,1}}
    networkInterfaceId::Union{Void,String}
    function AssignIpv6AddressesRequest(;ipv6AddressCount=nothing, ipv6Addresses=nothing, networkInterfaceId=nothing)
        new(ipv6AddressCount, ipv6Addresses, networkInterfaceId)
    end
    AssignIpv6AddressesRequest(pd) = parse_from_xml(AssignIpv6AddressesRequest, EC2TypeDict, pd)
end # AssignIpv6AddressesRequest
export AssignIpv6AddressesRequest

function AssignIpv6Addresses(env::AWSEnv, msg::AssignIpv6AddressesRequest)
    resp::EC2Response = ec2_execute(env, "AssignIpv6Addresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssignIpv6AddressesResult(resp.pd)
    end
    resp
end
AssignIpv6Addresses(env::AWSEnv; kwargs...) = AssignIpv6Addresses(env, AssignIpv6AddressesRequest(; kwargs...))
export AssignIpv6Addresses

type CreateImageResult <: AbstractAWSType
    imageId::Union{Void,String}
    requestId::Union{Void,String}
    function CreateImageResult(;imageId=nothing, requestId=nothing)
        new(imageId, requestId)
    end
    CreateImageResult(pd) = parse_from_xml(CreateImageResult, EC2TypeDict, pd)
end # CreateImageResult
export CreateImageResult

type CreateImageRequest <: AbstractAWSType
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    name::Union{Void,String}
    noReboot::Union{Void,Bool}
    function CreateImageRequest(;blockDeviceMapping=nothing, description=nothing, dryRun=nothing, instanceId=nothing, name=nothing, noReboot=nothing)
        new(blockDeviceMapping, description, dryRun, instanceId, name, noReboot)
    end
    CreateImageRequest(pd) = parse_from_xml(CreateImageRequest, EC2TypeDict, pd)
end # CreateImageRequest
export CreateImageRequest

function CreateImage(env::AWSEnv, msg::CreateImageRequest)
    resp::EC2Response = ec2_execute(env, "CreateImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateImageResult(resp.pd)
    end
    resp
end
CreateImage(env::AWSEnv; kwargs...) = CreateImage(env, CreateImageRequest(; kwargs...))
export CreateImage

type DescribeStaleSecurityGroupsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    staleSecurityGroupSet::Union{Void,Array{StaleSecurityGroup,1}}
    function DescribeStaleSecurityGroupsResult(;nextToken=nothing, requestId=nothing, staleSecurityGroupSet=nothing)
        new(nextToken, requestId, staleSecurityGroupSet)
    end
    DescribeStaleSecurityGroupsResult(pd) = parse_from_xml(DescribeStaleSecurityGroupsResult, EC2TypeDict, pd)
end # DescribeStaleSecurityGroupsResult
export DescribeStaleSecurityGroupsResult

type DescribeStaleSecurityGroupsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    vpcId::Union{Void,String}
    function DescribeStaleSecurityGroupsRequest(;dryRun=nothing, maxResults=nothing, nextToken=nothing, vpcId=nothing)
        new(dryRun, maxResults, nextToken, vpcId)
    end
    DescribeStaleSecurityGroupsRequest(pd) = parse_from_xml(DescribeStaleSecurityGroupsRequest, EC2TypeDict, pd)
end # DescribeStaleSecurityGroupsRequest
export DescribeStaleSecurityGroupsRequest

function DescribeStaleSecurityGroups(env::AWSEnv, msg::DescribeStaleSecurityGroupsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeStaleSecurityGroups", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeStaleSecurityGroupsResult(resp.pd)
    end
    resp
end
DescribeStaleSecurityGroups(env::AWSEnv; kwargs...) = DescribeStaleSecurityGroups(env, DescribeStaleSecurityGroupsRequest(; kwargs...))
export DescribeStaleSecurityGroups

type CreateCustomerGatewayResult <: AbstractAWSType
    customerGateway::Union{Void,CustomerGateway}
    requestId::Union{Void,String}
    function CreateCustomerGatewayResult(;customerGateway=nothing, requestId=nothing)
        new(customerGateway, requestId)
    end
    CreateCustomerGatewayResult(pd) = parse_from_xml(CreateCustomerGatewayResult, EC2TypeDict, pd)
end # CreateCustomerGatewayResult
export CreateCustomerGatewayResult

type CreateCustomerGatewayRequest <: AbstractAWSType
    bgpAsn::Union{Void,Int64}
    dryRun::Union{Void,Bool}
    ipAddress::Union{Void,String}
    _Type::Union{Void,String}
    function CreateCustomerGatewayRequest(;bgpAsn=nothing, dryRun=nothing, ipAddress=nothing, _Type=nothing)
        new(bgpAsn, dryRun, ipAddress, _Type)
    end
    CreateCustomerGatewayRequest(pd) = parse_from_xml(CreateCustomerGatewayRequest, EC2TypeDict, pd)
end # CreateCustomerGatewayRequest
export CreateCustomerGatewayRequest

function CreateCustomerGateway(env::AWSEnv, msg::CreateCustomerGatewayRequest)
    resp::EC2Response = ec2_execute(env, "CreateCustomerGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateCustomerGatewayResult(resp.pd)
    end
    resp
end
CreateCustomerGateway(env::AWSEnv; kwargs...) = CreateCustomerGateway(env, CreateCustomerGatewayRequest(; kwargs...))
export CreateCustomerGateway

type CreateVpnConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpnConnection::Union{Void,VpnConnection}
    function CreateVpnConnectionResult(;requestId=nothing, vpnConnection=nothing)
        new(requestId, vpnConnection)
    end
    CreateVpnConnectionResult(pd) = parse_from_xml(CreateVpnConnectionResult, EC2TypeDict, pd)
end # CreateVpnConnectionResult
export CreateVpnConnectionResult

type CreateVpnConnectionRequest <: AbstractAWSType
    customerGatewayId::Union{Void,String}
    dryRun::Union{Void,Bool}
    options::Union{Void,VpnConnectionOptionsSpecification}
    _Type::Union{Void,String}
    vpnGatewayId::Union{Void,String}
    function CreateVpnConnectionRequest(;customerGatewayId=nothing, dryRun=nothing, options=nothing, _Type=nothing, vpnGatewayId=nothing)
        new(customerGatewayId, dryRun, options, _Type, vpnGatewayId)
    end
    CreateVpnConnectionRequest(pd) = parse_from_xml(CreateVpnConnectionRequest, EC2TypeDict, pd)
end # CreateVpnConnectionRequest
export CreateVpnConnectionRequest

function CreateVpnConnection(env::AWSEnv, msg::CreateVpnConnectionRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpnConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpnConnectionResult(resp.pd)
    end
    resp
end
CreateVpnConnection(env::AWSEnv; kwargs...) = CreateVpnConnection(env, CreateVpnConnectionRequest(; kwargs...))
export CreateVpnConnection

type DescribeSpotFleetInstancesResult <: AbstractAWSType
    activeInstanceSet::Union{Void,Array{ActiveInstance,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    function DescribeSpotFleetInstancesResult(;activeInstanceSet=nothing, nextToken=nothing, requestId=nothing, spotFleetRequestId=nothing)
        new(activeInstanceSet, nextToken, requestId, spotFleetRequestId)
    end
    DescribeSpotFleetInstancesResult(pd) = parse_from_xml(DescribeSpotFleetInstancesResult, EC2TypeDict, pd)
end # DescribeSpotFleetInstancesResult
export DescribeSpotFleetInstancesResult

type DescribeSpotFleetInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    function DescribeSpotFleetInstancesRequest(;dryRun=nothing, maxResults=nothing, nextToken=nothing, spotFleetRequestId=nothing)
        new(dryRun, maxResults, nextToken, spotFleetRequestId)
    end
    DescribeSpotFleetInstancesRequest(pd) = parse_from_xml(DescribeSpotFleetInstancesRequest, EC2TypeDict, pd)
end # DescribeSpotFleetInstancesRequest
export DescribeSpotFleetInstancesRequest

function DescribeSpotFleetInstances(env::AWSEnv, msg::DescribeSpotFleetInstancesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotFleetInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotFleetInstancesResult(resp.pd)
    end
    resp
end
DescribeSpotFleetInstances(env::AWSEnv; kwargs...) = DescribeSpotFleetInstances(env, DescribeSpotFleetInstancesRequest(; kwargs...))
export DescribeSpotFleetInstances

type AssociateDhcpOptionsResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AssociateDhcpOptionsResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AssociateDhcpOptionsResult(pd) = parse_from_xml(AssociateDhcpOptionsResult, EC2TypeDict, pd)
end # AssociateDhcpOptionsResult
export AssociateDhcpOptionsResult

type AssociateDhcpOptionsRequest <: AbstractAWSType
    dhcpOptionsId::Union{Void,String}
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function AssociateDhcpOptionsRequest(;dhcpOptionsId=nothing, dryRun=nothing, vpcId=nothing)
        new(dhcpOptionsId, dryRun, vpcId)
    end
    AssociateDhcpOptionsRequest(pd) = parse_from_xml(AssociateDhcpOptionsRequest, EC2TypeDict, pd)
end # AssociateDhcpOptionsRequest
export AssociateDhcpOptionsRequest

function AssociateDhcpOptions(env::AWSEnv, msg::AssociateDhcpOptionsRequest)
    resp::EC2Response = ec2_execute(env, "AssociateDhcpOptions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateDhcpOptionsResult(resp.pd)
    end
    resp
end
AssociateDhcpOptions(env::AWSEnv; kwargs...) = AssociateDhcpOptions(env, AssociateDhcpOptionsRequest(; kwargs...))
export AssociateDhcpOptions

type AssociateAddressResult <: AbstractAWSType
    associationId::Union{Void,String}
    requestId::Union{Void,String}
    function AssociateAddressResult(;associationId=nothing, requestId=nothing)
        new(associationId, requestId)
    end
    AssociateAddressResult(pd) = parse_from_xml(AssociateAddressResult, EC2TypeDict, pd)
end # AssociateAddressResult
export AssociateAddressResult

type AssociateAddressRequest <: AbstractAWSType
    allocationId::Union{Void,String}
    allowReassociation::Union{Void,Bool}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    privateIpAddress::Union{Void,String}
    publicIp::Union{Void,String}
    function AssociateAddressRequest(;allocationId=nothing, allowReassociation=nothing, dryRun=nothing, instanceId=nothing, networkInterfaceId=nothing, privateIpAddress=nothing, publicIp=nothing)
        new(allocationId, allowReassociation, dryRun, instanceId, networkInterfaceId, privateIpAddress, publicIp)
    end
    AssociateAddressRequest(pd) = parse_from_xml(AssociateAddressRequest, EC2TypeDict, pd)
end # AssociateAddressRequest
export AssociateAddressRequest

function AssociateAddress(env::AWSEnv, msg::AssociateAddressRequest)
    resp::EC2Response = ec2_execute(env, "AssociateAddress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateAddressResult(resp.pd)
    end
    resp
end
AssociateAddress(env::AWSEnv; kwargs...) = AssociateAddress(env, AssociateAddressRequest(; kwargs...))
export AssociateAddress

type DescribeRegionsResult <: AbstractAWSType
    regionInfo::Union{Void,Array{Region,1}}
    requestId::Union{Void,String}
    function DescribeRegionsResult(;regionInfo=nothing, requestId=nothing)
        new(regionInfo, requestId)
    end
    DescribeRegionsResult(pd) = parse_from_xml(DescribeRegionsResult, EC2TypeDict, pd)
end # DescribeRegionsResult
export DescribeRegionsResult

type DescribeRegionsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    regionName::Union{Void,Array{String,1}}
    function DescribeRegionsRequest(;dryRun=nothing, filter=nothing, regionName=nothing)
        new(dryRun, filter, regionName)
    end
    DescribeRegionsRequest(pd) = parse_from_xml(DescribeRegionsRequest, EC2TypeDict, pd)
end # DescribeRegionsRequest
export DescribeRegionsRequest

function DescribeRegions(env::AWSEnv, msg::DescribeRegionsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeRegions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeRegionsResult(resp.pd)
    end
    resp
end
DescribeRegions(env::AWSEnv; kwargs...) = DescribeRegions(env, DescribeRegionsRequest(; kwargs...))
export DescribeRegions

type ResetImageAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ResetImageAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ResetImageAttributeResult(pd) = parse_from_xml(ResetImageAttributeResult, EC2TypeDict, pd)
end # ResetImageAttributeResult
export ResetImageAttributeResult

type ResetImageAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    imageId::Union{Void,String}
    function ResetImageAttributeRequest(;attribute=nothing, dryRun=nothing, imageId=nothing)
        new(attribute, dryRun, imageId)
    end
    ResetImageAttributeRequest(pd) = parse_from_xml(ResetImageAttributeRequest, EC2TypeDict, pd)
end # ResetImageAttributeRequest
export ResetImageAttributeRequest

function ResetImageAttribute(env::AWSEnv, msg::ResetImageAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ResetImageAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ResetImageAttributeResult(resp.pd)
    end
    resp
end
ResetImageAttribute(env::AWSEnv; kwargs...) = ResetImageAttribute(env, ResetImageAttributeRequest(; kwargs...))
export ResetImageAttribute

type DescribeSnapshotAttributeResult <: AbstractAWSType
    createVolumePermission::Union{Void,Array{CreateVolumePermission,1}}
    productCodes::Union{Void,Array{ProductCode,1}}
    requestId::Union{Void,String}
    snapshotId::Union{Void,String}
    function DescribeSnapshotAttributeResult(;createVolumePermission=nothing, productCodes=nothing, requestId=nothing, snapshotId=nothing)
        new(createVolumePermission, productCodes, requestId, snapshotId)
    end
    DescribeSnapshotAttributeResult(pd) = parse_from_xml(DescribeSnapshotAttributeResult, EC2TypeDict, pd)
end # DescribeSnapshotAttributeResult
export DescribeSnapshotAttributeResult

type DescribeSnapshotAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    snapshotId::Union{Void,String}
    function DescribeSnapshotAttributeRequest(;attribute=nothing, dryRun=nothing, snapshotId=nothing)
        new(attribute, dryRun, snapshotId)
    end
    DescribeSnapshotAttributeRequest(pd) = parse_from_xml(DescribeSnapshotAttributeRequest, EC2TypeDict, pd)
end # DescribeSnapshotAttributeRequest
export DescribeSnapshotAttributeRequest

function DescribeSnapshotAttribute(env::AWSEnv, msg::DescribeSnapshotAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSnapshotAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSnapshotAttributeResult(resp.pd)
    end
    resp
end
DescribeSnapshotAttribute(env::AWSEnv; kwargs...) = DescribeSnapshotAttribute(env, DescribeSnapshotAttributeRequest(; kwargs...))
export DescribeSnapshotAttribute

type DisassociateIamInstanceProfileResult <: AbstractAWSType
    iamInstanceProfileAssociation::Union{Void,IamInstanceProfileAssociation}
    requestId::Union{Void,String}
    function DisassociateIamInstanceProfileResult(;iamInstanceProfileAssociation=nothing, requestId=nothing)
        new(iamInstanceProfileAssociation, requestId)
    end
    DisassociateIamInstanceProfileResult(pd) = parse_from_xml(DisassociateIamInstanceProfileResult, EC2TypeDict, pd)
end # DisassociateIamInstanceProfileResult
export DisassociateIamInstanceProfileResult

type DisassociateIamInstanceProfileRequest <: AbstractAWSType
    associationId::Union{Void,String}
    function DisassociateIamInstanceProfileRequest(;associationId=nothing)
        new(associationId)
    end
    DisassociateIamInstanceProfileRequest(pd) = parse_from_xml(DisassociateIamInstanceProfileRequest, EC2TypeDict, pd)
end # DisassociateIamInstanceProfileRequest
export DisassociateIamInstanceProfileRequest

function DisassociateIamInstanceProfile(env::AWSEnv, msg::DisassociateIamInstanceProfileRequest)
    resp::EC2Response = ec2_execute(env, "DisassociateIamInstanceProfile", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisassociateIamInstanceProfileResult(resp.pd)
    end
    resp
end
DisassociateIamInstanceProfile(env::AWSEnv; kwargs...) = DisassociateIamInstanceProfile(env, DisassociateIamInstanceProfileRequest(; kwargs...))
export DisassociateIamInstanceProfile

type DescribeReservedInstancesListingsResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesListingsSet::Union{Void,Array{ReservedInstancesListing,1}}
    function DescribeReservedInstancesListingsResult(;requestId=nothing, reservedInstancesListingsSet=nothing)
        new(requestId, reservedInstancesListingsSet)
    end
    DescribeReservedInstancesListingsResult(pd) = parse_from_xml(DescribeReservedInstancesListingsResult, EC2TypeDict, pd)
end # DescribeReservedInstancesListingsResult
export DescribeReservedInstancesListingsResult

type DescribeReservedInstancesListingsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    reservedInstancesId::Union{Void,String}
    reservedInstancesListingId::Union{Void,String}
    function DescribeReservedInstancesListingsRequest(;filter=nothing, reservedInstancesId=nothing, reservedInstancesListingId=nothing)
        new(filter, reservedInstancesId, reservedInstancesListingId)
    end
    DescribeReservedInstancesListingsRequest(pd) = parse_from_xml(DescribeReservedInstancesListingsRequest, EC2TypeDict, pd)
end # DescribeReservedInstancesListingsRequest
export DescribeReservedInstancesListingsRequest

function DescribeReservedInstancesListings(env::AWSEnv, msg::DescribeReservedInstancesListingsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeReservedInstancesListings", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeReservedInstancesListingsResult(resp.pd)
    end
    resp
end
DescribeReservedInstancesListings(env::AWSEnv; kwargs...) = DescribeReservedInstancesListings(env, DescribeReservedInstancesListingsRequest(; kwargs...))
export DescribeReservedInstancesListings

type DeleteRouteTableResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteRouteTableResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteRouteTableResult(pd) = parse_from_xml(DeleteRouteTableResult, EC2TypeDict, pd)
end # DeleteRouteTableResult
export DeleteRouteTableResult

type DeleteRouteTableRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    routeTableId::Union{Void,String}
    function DeleteRouteTableRequest(;dryRun=nothing, routeTableId=nothing)
        new(dryRun, routeTableId)
    end
    DeleteRouteTableRequest(pd) = parse_from_xml(DeleteRouteTableRequest, EC2TypeDict, pd)
end # DeleteRouteTableRequest
export DeleteRouteTableRequest

function DeleteRouteTable(env::AWSEnv, msg::DeleteRouteTableRequest)
    resp::EC2Response = ec2_execute(env, "DeleteRouteTable", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteRouteTableResult(resp.pd)
    end
    resp
end
DeleteRouteTable(env::AWSEnv; kwargs...) = DeleteRouteTable(env, DeleteRouteTableRequest(; kwargs...))
export DeleteRouteTable

type StopInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{InstanceStateChange,1}}
    requestId::Union{Void,String}
    function StopInstancesResult(;instancesSet=nothing, requestId=nothing)
        new(instancesSet, requestId)
    end
    StopInstancesResult(pd) = parse_from_xml(StopInstancesResult, EC2TypeDict, pd)
end # StopInstancesResult
export StopInstancesResult

type StopInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    force::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function StopInstancesRequest(;dryRun=nothing, force=nothing, instanceId=nothing)
        new(dryRun, force, instanceId)
    end
    StopInstancesRequest(pd) = parse_from_xml(StopInstancesRequest, EC2TypeDict, pd)
end # StopInstancesRequest
export StopInstancesRequest

function StopInstances(env::AWSEnv, msg::StopInstancesRequest)
    resp::EC2Response = ec2_execute(env, "StopInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = StopInstancesResult(resp.pd)
    end
    resp
end
StopInstances(env::AWSEnv; kwargs...) = StopInstances(env, StopInstancesRequest(; kwargs...))
export StopInstances

type PurchaseScheduledInstancesResult <: AbstractAWSType
    requestId::Union{Void,String}
    scheduledInstanceSet::Union{Void,Array{ScheduledInstance,1}}
    function PurchaseScheduledInstancesResult(;requestId=nothing, scheduledInstanceSet=nothing)
        new(requestId, scheduledInstanceSet)
    end
    PurchaseScheduledInstancesResult(pd) = parse_from_xml(PurchaseScheduledInstancesResult, EC2TypeDict, pd)
end # PurchaseScheduledInstancesResult
export PurchaseScheduledInstancesResult

type PurchaseScheduledInstancesRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    dryRun::Union{Void,Bool}
    purchaseRequest::Union{Void,Array{PurchaseRequest,1}}
    function PurchaseScheduledInstancesRequest(;clientToken=nothing, dryRun=nothing, purchaseRequest=nothing)
        new(clientToken, dryRun, purchaseRequest)
    end
    PurchaseScheduledInstancesRequest(pd) = parse_from_xml(PurchaseScheduledInstancesRequest, EC2TypeDict, pd)
end # PurchaseScheduledInstancesRequest
export PurchaseScheduledInstancesRequest

function PurchaseScheduledInstances(env::AWSEnv, msg::PurchaseScheduledInstancesRequest)
    resp::EC2Response = ec2_execute(env, "PurchaseScheduledInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = PurchaseScheduledInstancesResult(resp.pd)
    end
    resp
end
PurchaseScheduledInstances(env::AWSEnv; kwargs...) = PurchaseScheduledInstances(env, PurchaseScheduledInstancesRequest(; kwargs...))
export PurchaseScheduledInstances

type GetConsoleScreenshotResult <: AbstractAWSType
    imageData::Union{Void,String}
    instanceId::Union{Void,String}
    requestId::Union{Void,String}
    function GetConsoleScreenshotResult(;imageData=nothing, instanceId=nothing, requestId=nothing)
        new(imageData, instanceId, requestId)
    end
    GetConsoleScreenshotResult(pd) = parse_from_xml(GetConsoleScreenshotResult, EC2TypeDict, pd)
end # GetConsoleScreenshotResult
export GetConsoleScreenshotResult

type GetConsoleScreenshotRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    wakeUp::Union{Void,Bool}
    function GetConsoleScreenshotRequest(;dryRun=nothing, instanceId=nothing, wakeUp=nothing)
        new(dryRun, instanceId, wakeUp)
    end
    GetConsoleScreenshotRequest(pd) = parse_from_xml(GetConsoleScreenshotRequest, EC2TypeDict, pd)
end # GetConsoleScreenshotRequest
export GetConsoleScreenshotRequest

function GetConsoleScreenshot(env::AWSEnv, msg::GetConsoleScreenshotRequest)
    resp::EC2Response = ec2_execute(env, "GetConsoleScreenshot", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetConsoleScreenshotResult(resp.pd)
    end
    resp
end
GetConsoleScreenshot(env::AWSEnv; kwargs...) = GetConsoleScreenshot(env, GetConsoleScreenshotRequest(; kwargs...))
export GetConsoleScreenshot

type ModifyReservedInstancesResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesModificationId::Union{Void,String}
    function ModifyReservedInstancesResult(;requestId=nothing, reservedInstancesModificationId=nothing)
        new(requestId, reservedInstancesModificationId)
    end
    ModifyReservedInstancesResult(pd) = parse_from_xml(ModifyReservedInstancesResult, EC2TypeDict, pd)
end # ModifyReservedInstancesResult
export ModifyReservedInstancesResult

type ModifyReservedInstancesRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    reservedInstancesConfigurationSetItemType::Union{Void,Array{ReservedInstancesConfiguration,1}}
    reservedInstancesId::Union{Void,Array{String,1}}
    function ModifyReservedInstancesRequest(;clientToken=nothing, reservedInstancesConfigurationSetItemType=nothing, reservedInstancesId=nothing)
        new(clientToken, reservedInstancesConfigurationSetItemType, reservedInstancesId)
    end
    ModifyReservedInstancesRequest(pd) = parse_from_xml(ModifyReservedInstancesRequest, EC2TypeDict, pd)
end # ModifyReservedInstancesRequest
export ModifyReservedInstancesRequest

function ModifyReservedInstances(env::AWSEnv, msg::ModifyReservedInstancesRequest)
    resp::EC2Response = ec2_execute(env, "ModifyReservedInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyReservedInstancesResult(resp.pd)
    end
    resp
end
ModifyReservedInstances(env::AWSEnv; kwargs...) = ModifyReservedInstances(env, ModifyReservedInstancesRequest(; kwargs...))
export ModifyReservedInstances

type DescribeAccountAttributesResult <: AbstractAWSType
    accountAttributeSet::Union{Void,Array{AccountAttribute,1}}
    requestId::Union{Void,String}
    function DescribeAccountAttributesResult(;accountAttributeSet=nothing, requestId=nothing)
        new(accountAttributeSet, requestId)
    end
    DescribeAccountAttributesResult(pd) = parse_from_xml(DescribeAccountAttributesResult, EC2TypeDict, pd)
end # DescribeAccountAttributesResult
export DescribeAccountAttributesResult

type DescribeAccountAttributesRequest <: AbstractAWSType
    attributeName::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    function DescribeAccountAttributesRequest(;attributeName=nothing, dryRun=nothing)
        new(attributeName, dryRun)
    end
    DescribeAccountAttributesRequest(pd) = parse_from_xml(DescribeAccountAttributesRequest, EC2TypeDict, pd)
end # DescribeAccountAttributesRequest
export DescribeAccountAttributesRequest

function DescribeAccountAttributes(env::AWSEnv, msg::DescribeAccountAttributesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeAccountAttributes", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAccountAttributesResult(resp.pd)
    end
    resp
end
DescribeAccountAttributes(env::AWSEnv; kwargs...) = DescribeAccountAttributes(env, DescribeAccountAttributesRequest(; kwargs...))
export DescribeAccountAttributes

type DescribeInstancesResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    reservationSet::Union{Void,Array{Reservation,1}}
    function DescribeInstancesResult(;nextToken=nothing, requestId=nothing, reservationSet=nothing)
        new(nextToken, requestId, reservationSet)
    end
    DescribeInstancesResult(pd) = parse_from_xml(DescribeInstancesResult, EC2TypeDict, pd)
end # DescribeInstancesResult
export DescribeInstancesResult

type DescribeInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    instanceId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeInstancesRequest(;dryRun=nothing, filter=nothing, instanceId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filter, instanceId, maxResults, nextToken)
    end
    DescribeInstancesRequest(pd) = parse_from_xml(DescribeInstancesRequest, EC2TypeDict, pd)
end # DescribeInstancesRequest
export DescribeInstancesRequest

function DescribeInstances(env::AWSEnv, msg::DescribeInstancesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeInstancesResult(resp.pd)
    end
    resp
end
DescribeInstances(env::AWSEnv; kwargs...) = DescribeInstances(env, DescribeInstancesRequest(; kwargs...))
export DescribeInstances

type DeleteEgressOnlyInternetGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    returnCode::Union{Void,Bool}
    function DeleteEgressOnlyInternetGatewayResult(;requestId=nothing, returnCode=nothing)
        new(requestId, returnCode)
    end
    DeleteEgressOnlyInternetGatewayResult(pd) = parse_from_xml(DeleteEgressOnlyInternetGatewayResult, EC2TypeDict, pd)
end # DeleteEgressOnlyInternetGatewayResult
export DeleteEgressOnlyInternetGatewayResult

type DeleteEgressOnlyInternetGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    egressOnlyInternetGatewayId::Union{Void,String}
    function DeleteEgressOnlyInternetGatewayRequest(;dryRun=nothing, egressOnlyInternetGatewayId=nothing)
        new(dryRun, egressOnlyInternetGatewayId)
    end
    DeleteEgressOnlyInternetGatewayRequest(pd) = parse_from_xml(DeleteEgressOnlyInternetGatewayRequest, EC2TypeDict, pd)
end # DeleteEgressOnlyInternetGatewayRequest
export DeleteEgressOnlyInternetGatewayRequest

function DeleteEgressOnlyInternetGateway(env::AWSEnv, msg::DeleteEgressOnlyInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DeleteEgressOnlyInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteEgressOnlyInternetGatewayResult(resp.pd)
    end
    resp
end
DeleteEgressOnlyInternetGateway(env::AWSEnv; kwargs...) = DeleteEgressOnlyInternetGateway(env, DeleteEgressOnlyInternetGatewayRequest(; kwargs...))
export DeleteEgressOnlyInternetGateway

type DescribeSpotPriceHistoryResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    spotPriceHistorySet::Union{Void,Array{SpotPrice,1}}
    function DescribeSpotPriceHistoryResult(;nextToken=nothing, requestId=nothing, spotPriceHistorySet=nothing)
        new(nextToken, requestId, spotPriceHistorySet)
    end
    DescribeSpotPriceHistoryResult(pd) = parse_from_xml(DescribeSpotPriceHistoryResult, EC2TypeDict, pd)
end # DescribeSpotPriceHistoryResult
export DescribeSpotPriceHistoryResult

type DescribeSpotPriceHistoryRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    dryRun::Union{Void,Bool}
    endTime::Union{Void,DateTime}
    filter::Union{Void,Array{Filter,1}}
    instanceType::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    productDescription::Union{Void,Array{String,1}}
    startTime::Union{Void,DateTime}
    function DescribeSpotPriceHistoryRequest(;availabilityZone=nothing, dryRun=nothing, endTime=nothing, filter=nothing, instanceType=nothing, maxResults=nothing, nextToken=nothing, productDescription=nothing, startTime=nothing)
        new(availabilityZone, dryRun, endTime, filter, instanceType, maxResults, nextToken, productDescription, startTime)
    end
    DescribeSpotPriceHistoryRequest(pd) = parse_from_xml(DescribeSpotPriceHistoryRequest, EC2TypeDict, pd)
end # DescribeSpotPriceHistoryRequest
export DescribeSpotPriceHistoryRequest

function DescribeSpotPriceHistory(env::AWSEnv, msg::DescribeSpotPriceHistoryRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotPriceHistory", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotPriceHistoryResult(resp.pd)
    end
    resp
end
DescribeSpotPriceHistory(env::AWSEnv; kwargs...) = DescribeSpotPriceHistory(env, DescribeSpotPriceHistoryRequest(; kwargs...))
export DescribeSpotPriceHistory

type AssociateSubnetCidrBlockResult <: AbstractAWSType
    ipv6CidrBlockAssociation::Union{Void,SubnetIpv6CidrBlockAssociation}
    requestId::Union{Void,String}
    subnetId::Union{Void,String}
    function AssociateSubnetCidrBlockResult(;ipv6CidrBlockAssociation=nothing, requestId=nothing, subnetId=nothing)
        new(ipv6CidrBlockAssociation, requestId, subnetId)
    end
    AssociateSubnetCidrBlockResult(pd) = parse_from_xml(AssociateSubnetCidrBlockResult, EC2TypeDict, pd)
end # AssociateSubnetCidrBlockResult
export AssociateSubnetCidrBlockResult

type AssociateSubnetCidrBlockRequest <: AbstractAWSType
    ipv6CidrBlock::Union{Void,String}
    subnetId::Union{Void,String}
    function AssociateSubnetCidrBlockRequest(;ipv6CidrBlock=nothing, subnetId=nothing)
        new(ipv6CidrBlock, subnetId)
    end
    AssociateSubnetCidrBlockRequest(pd) = parse_from_xml(AssociateSubnetCidrBlockRequest, EC2TypeDict, pd)
end # AssociateSubnetCidrBlockRequest
export AssociateSubnetCidrBlockRequest

function AssociateSubnetCidrBlock(env::AWSEnv, msg::AssociateSubnetCidrBlockRequest)
    resp::EC2Response = ec2_execute(env, "AssociateSubnetCidrBlock", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateSubnetCidrBlockResult(resp.pd)
    end
    resp
end
AssociateSubnetCidrBlock(env::AWSEnv; kwargs...) = AssociateSubnetCidrBlock(env, AssociateSubnetCidrBlockRequest(; kwargs...))
export AssociateSubnetCidrBlock

type RequestSpotFleetResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    function RequestSpotFleetResult(;requestId=nothing, spotFleetRequestId=nothing)
        new(requestId, spotFleetRequestId)
    end
    RequestSpotFleetResult(pd) = parse_from_xml(RequestSpotFleetResult, EC2TypeDict, pd)
end # RequestSpotFleetResult
export RequestSpotFleetResult

type RequestSpotFleetRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    spotFleetRequestConfig::Union{Void,SpotFleetRequestConfigData}
    function RequestSpotFleetRequest(;dryRun=nothing, spotFleetRequestConfig=nothing)
        new(dryRun, spotFleetRequestConfig)
    end
    RequestSpotFleetRequest(pd) = parse_from_xml(RequestSpotFleetRequest, EC2TypeDict, pd)
end # RequestSpotFleetRequest
export RequestSpotFleetRequest

function RequestSpotFleet(env::AWSEnv, msg::RequestSpotFleetRequest)
    resp::EC2Response = ec2_execute(env, "RequestSpotFleet", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RequestSpotFleetResult(resp.pd)
    end
    resp
end
RequestSpotFleet(env::AWSEnv; kwargs...) = RequestSpotFleet(env, RequestSpotFleetRequest(; kwargs...))
export RequestSpotFleet

type DescribeReservedInstancesModificationsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    reservedInstancesModificationsSet::Union{Void,Array{ReservedInstancesModification,1}}
    function DescribeReservedInstancesModificationsResult(;nextToken=nothing, requestId=nothing, reservedInstancesModificationsSet=nothing)
        new(nextToken, requestId, reservedInstancesModificationsSet)
    end
    DescribeReservedInstancesModificationsResult(pd) = parse_from_xml(DescribeReservedInstancesModificationsResult, EC2TypeDict, pd)
end # DescribeReservedInstancesModificationsResult
export DescribeReservedInstancesModificationsResult

type DescribeReservedInstancesModificationsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    nextToken::Union{Void,String}
    reservedInstancesModificationId::Union{Void,Array{String,1}}
    function DescribeReservedInstancesModificationsRequest(;filter=nothing, nextToken=nothing, reservedInstancesModificationId=nothing)
        new(filter, nextToken, reservedInstancesModificationId)
    end
    DescribeReservedInstancesModificationsRequest(pd) = parse_from_xml(DescribeReservedInstancesModificationsRequest, EC2TypeDict, pd)
end # DescribeReservedInstancesModificationsRequest
export DescribeReservedInstancesModificationsRequest

function DescribeReservedInstancesModifications(env::AWSEnv, msg::DescribeReservedInstancesModificationsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeReservedInstancesModifications", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeReservedInstancesModificationsResult(resp.pd)
    end
    resp
end
DescribeReservedInstancesModifications(env::AWSEnv; kwargs...) = DescribeReservedInstancesModifications(env, DescribeReservedInstancesModificationsRequest(; kwargs...))
export DescribeReservedInstancesModifications

type CancelSpotInstanceRequestsResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotInstanceRequestSet::Union{Void,Array{CancelledSpotInstanceRequest,1}}
    function CancelSpotInstanceRequestsResult(;requestId=nothing, spotInstanceRequestSet=nothing)
        new(requestId, spotInstanceRequestSet)
    end
    CancelSpotInstanceRequestsResult(pd) = parse_from_xml(CancelSpotInstanceRequestsResult, EC2TypeDict, pd)
end # CancelSpotInstanceRequestsResult
export CancelSpotInstanceRequestsResult

type CancelSpotInstanceRequestsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    spotInstanceRequestId::Union{Void,Array{String,1}}
    function CancelSpotInstanceRequestsRequest(;dryRun=nothing, spotInstanceRequestId=nothing)
        new(dryRun, spotInstanceRequestId)
    end
    CancelSpotInstanceRequestsRequest(pd) = parse_from_xml(CancelSpotInstanceRequestsRequest, EC2TypeDict, pd)
end # CancelSpotInstanceRequestsRequest
export CancelSpotInstanceRequestsRequest

function CancelSpotInstanceRequests(env::AWSEnv, msg::CancelSpotInstanceRequestsRequest)
    resp::EC2Response = ec2_execute(env, "CancelSpotInstanceRequests", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelSpotInstanceRequestsResult(resp.pd)
    end
    resp
end
CancelSpotInstanceRequests(env::AWSEnv; kwargs...) = CancelSpotInstanceRequests(env, CancelSpotInstanceRequestsRequest(; kwargs...))
export CancelSpotInstanceRequests

type DeletePlacementGroupResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeletePlacementGroupResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeletePlacementGroupResult(pd) = parse_from_xml(DeletePlacementGroupResult, EC2TypeDict, pd)
end # DeletePlacementGroupResult
export DeletePlacementGroupResult

type DeletePlacementGroupRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    groupName::Union{Void,String}
    function DeletePlacementGroupRequest(;dryRun=nothing, groupName=nothing)
        new(dryRun, groupName)
    end
    DeletePlacementGroupRequest(pd) = parse_from_xml(DeletePlacementGroupRequest, EC2TypeDict, pd)
end # DeletePlacementGroupRequest
export DeletePlacementGroupRequest

function DeletePlacementGroup(env::AWSEnv, msg::DeletePlacementGroupRequest)
    resp::EC2Response = ec2_execute(env, "DeletePlacementGroup", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeletePlacementGroupResult(resp.pd)
    end
    resp
end
DeletePlacementGroup(env::AWSEnv; kwargs...) = DeletePlacementGroup(env, DeletePlacementGroupRequest(; kwargs...))
export DeletePlacementGroup

type DescribeDhcpOptionsResult <: AbstractAWSType
    dhcpOptionsSet::Union{Void,Array{DhcpOptions,1}}
    requestId::Union{Void,String}
    function DescribeDhcpOptionsResult(;dhcpOptionsSet=nothing, requestId=nothing)
        new(dhcpOptionsSet, requestId)
    end
    DescribeDhcpOptionsResult(pd) = parse_from_xml(DescribeDhcpOptionsResult, EC2TypeDict, pd)
end # DescribeDhcpOptionsResult
export DescribeDhcpOptionsResult

type DescribeDhcpOptionsRequest <: AbstractAWSType
    dhcpOptionsId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    function DescribeDhcpOptionsRequest(;dhcpOptionsId=nothing, dryRun=nothing, filter=nothing)
        new(dhcpOptionsId, dryRun, filter)
    end
    DescribeDhcpOptionsRequest(pd) = parse_from_xml(DescribeDhcpOptionsRequest, EC2TypeDict, pd)
end # DescribeDhcpOptionsRequest
export DescribeDhcpOptionsRequest

function DescribeDhcpOptions(env::AWSEnv, msg::DescribeDhcpOptionsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeDhcpOptions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeDhcpOptionsResult(resp.pd)
    end
    resp
end
DescribeDhcpOptions(env::AWSEnv; kwargs...) = DescribeDhcpOptions(env, DescribeDhcpOptionsRequest(; kwargs...))
export DescribeDhcpOptions

type AllocateHostsResult <: AbstractAWSType
    hostIdSet::Union{Void,Array{String,1}}
    requestId::Union{Void,String}
    function AllocateHostsResult(;hostIdSet=nothing, requestId=nothing)
        new(hostIdSet, requestId)
    end
    AllocateHostsResult(pd) = parse_from_xml(AllocateHostsResult, EC2TypeDict, pd)
end # AllocateHostsResult
export AllocateHostsResult

type AllocateHostsRequest <: AbstractAWSType
    autoPlacement::Union{Void,String}
    availabilityZone::Union{Void,String}
    clientToken::Union{Void,String}
    instanceType::Union{Void,String}
    quantity::Union{Void,Int64}
    function AllocateHostsRequest(;autoPlacement=nothing, availabilityZone=nothing, clientToken=nothing, instanceType=nothing, quantity=nothing)
        new(autoPlacement, availabilityZone, clientToken, instanceType, quantity)
    end
    AllocateHostsRequest(pd) = parse_from_xml(AllocateHostsRequest, EC2TypeDict, pd)
end # AllocateHostsRequest
export AllocateHostsRequest

function AllocateHosts(env::AWSEnv, msg::AllocateHostsRequest)
    resp::EC2Response = ec2_execute(env, "AllocateHosts", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AllocateHostsResult(resp.pd)
    end
    resp
end
AllocateHosts(env::AWSEnv; kwargs...) = AllocateHosts(env, AllocateHostsRequest(; kwargs...))
export AllocateHosts

type DescribeIdFormatResult <: AbstractAWSType
    requestId::Union{Void,String}
    statusSet::Union{Void,Array{IdFormat,1}}
    function DescribeIdFormatResult(;requestId=nothing, statusSet=nothing)
        new(requestId, statusSet)
    end
    DescribeIdFormatResult(pd) = parse_from_xml(DescribeIdFormatResult, EC2TypeDict, pd)
end # DescribeIdFormatResult
export DescribeIdFormatResult

type DescribeIdFormatRequest <: AbstractAWSType
    resource::Union{Void,String}
    function DescribeIdFormatRequest(;resource=nothing)
        new(resource)
    end
    DescribeIdFormatRequest(pd) = parse_from_xml(DescribeIdFormatRequest, EC2TypeDict, pd)
end # DescribeIdFormatRequest
export DescribeIdFormatRequest

function DescribeIdFormat(env::AWSEnv, msg::DescribeIdFormatRequest)
    resp::EC2Response = ec2_execute(env, "DescribeIdFormat", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeIdFormatResult(resp.pd)
    end
    resp
end
DescribeIdFormat(env::AWSEnv; kwargs...) = DescribeIdFormat(env, DescribeIdFormatRequest(; kwargs...))
export DescribeIdFormat

type ModifyVpcPeeringConnectionOptionsResult <: AbstractAWSType
    accepterPeeringConnectionOptions::Union{Void,PeeringConnectionOptions}
    requesterPeeringConnectionOptions::Union{Void,PeeringConnectionOptions}
    requestId::Union{Void,String}
    function ModifyVpcPeeringConnectionOptionsResult(;accepterPeeringConnectionOptions=nothing, requesterPeeringConnectionOptions=nothing, requestId=nothing)
        new(accepterPeeringConnectionOptions, requesterPeeringConnectionOptions, requestId)
    end
    ModifyVpcPeeringConnectionOptionsResult(pd) = parse_from_xml(ModifyVpcPeeringConnectionOptionsResult, EC2TypeDict, pd)
end # ModifyVpcPeeringConnectionOptionsResult
export ModifyVpcPeeringConnectionOptionsResult

type ModifyVpcPeeringConnectionOptionsRequest <: AbstractAWSType
    accepterPeeringConnectionOptions::Union{Void,PeeringConnectionOptionsRequest}
    dryRun::Union{Void,Bool}
    requesterPeeringConnectionOptions::Union{Void,PeeringConnectionOptionsRequest}
    vpcPeeringConnectionId::Union{Void,String}
    function ModifyVpcPeeringConnectionOptionsRequest(;accepterPeeringConnectionOptions=nothing, dryRun=nothing, requesterPeeringConnectionOptions=nothing, vpcPeeringConnectionId=nothing)
        new(accepterPeeringConnectionOptions, dryRun, requesterPeeringConnectionOptions, vpcPeeringConnectionId)
    end
    ModifyVpcPeeringConnectionOptionsRequest(pd) = parse_from_xml(ModifyVpcPeeringConnectionOptionsRequest, EC2TypeDict, pd)
end # ModifyVpcPeeringConnectionOptionsRequest
export ModifyVpcPeeringConnectionOptionsRequest

function ModifyVpcPeeringConnectionOptions(env::AWSEnv, msg::ModifyVpcPeeringConnectionOptionsRequest)
    resp::EC2Response = ec2_execute(env, "ModifyVpcPeeringConnectionOptions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyVpcPeeringConnectionOptionsResult(resp.pd)
    end
    resp
end
ModifyVpcPeeringConnectionOptions(env::AWSEnv; kwargs...) = ModifyVpcPeeringConnectionOptions(env, ModifyVpcPeeringConnectionOptionsRequest(; kwargs...))
export ModifyVpcPeeringConnectionOptions

type DescribeHostsResult <: AbstractAWSType
    hostSet::Union{Void,Array{Host,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeHostsResult(;hostSet=nothing, nextToken=nothing, requestId=nothing)
        new(hostSet, nextToken, requestId)
    end
    DescribeHostsResult(pd) = parse_from_xml(DescribeHostsResult, EC2TypeDict, pd)
end # DescribeHostsResult
export DescribeHostsResult

type DescribeHostsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    hostId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeHostsRequest(;filter=nothing, hostId=nothing, maxResults=nothing, nextToken=nothing)
        new(filter, hostId, maxResults, nextToken)
    end
    DescribeHostsRequest(pd) = parse_from_xml(DescribeHostsRequest, EC2TypeDict, pd)
end # DescribeHostsRequest
export DescribeHostsRequest

function DescribeHosts(env::AWSEnv, msg::DescribeHostsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeHosts", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeHostsResult(resp.pd)
    end
    resp
end
DescribeHosts(env::AWSEnv; kwargs...) = DescribeHosts(env, DescribeHostsRequest(; kwargs...))
export DescribeHosts

type DescribeVolumeAttributeResult <: AbstractAWSType
    autoEnableIO::Union{Void,AttributeBooleanValue}
    productCodes::Union{Void,Array{ProductCode,1}}
    requestId::Union{Void,String}
    volumeId::Union{Void,String}
    function DescribeVolumeAttributeResult(;autoEnableIO=nothing, productCodes=nothing, requestId=nothing, volumeId=nothing)
        new(autoEnableIO, productCodes, requestId, volumeId)
    end
    DescribeVolumeAttributeResult(pd) = parse_from_xml(DescribeVolumeAttributeResult, EC2TypeDict, pd)
end # DescribeVolumeAttributeResult
export DescribeVolumeAttributeResult

type DescribeVolumeAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    volumeId::Union{Void,String}
    function DescribeVolumeAttributeRequest(;attribute=nothing, dryRun=nothing, volumeId=nothing)
        new(attribute, dryRun, volumeId)
    end
    DescribeVolumeAttributeRequest(pd) = parse_from_xml(DescribeVolumeAttributeRequest, EC2TypeDict, pd)
end # DescribeVolumeAttributeRequest
export DescribeVolumeAttributeRequest

function DescribeVolumeAttribute(env::AWSEnv, msg::DescribeVolumeAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVolumeAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVolumeAttributeResult(resp.pd)
    end
    resp
end
DescribeVolumeAttribute(env::AWSEnv; kwargs...) = DescribeVolumeAttribute(env, DescribeVolumeAttributeRequest(; kwargs...))
export DescribeVolumeAttribute

type DisassociateRouteTableResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DisassociateRouteTableResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DisassociateRouteTableResult(pd) = parse_from_xml(DisassociateRouteTableResult, EC2TypeDict, pd)
end # DisassociateRouteTableResult
export DisassociateRouteTableResult

type DisassociateRouteTableRequest <: AbstractAWSType
    associationId::Union{Void,String}
    dryRun::Union{Void,Bool}
    function DisassociateRouteTableRequest(;associationId=nothing, dryRun=nothing)
        new(associationId, dryRun)
    end
    DisassociateRouteTableRequest(pd) = parse_from_xml(DisassociateRouteTableRequest, EC2TypeDict, pd)
end # DisassociateRouteTableRequest
export DisassociateRouteTableRequest

function DisassociateRouteTable(env::AWSEnv, msg::DisassociateRouteTableRequest)
    resp::EC2Response = ec2_execute(env, "DisassociateRouteTable", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisassociateRouteTableResult(resp.pd)
    end
    resp
end
DisassociateRouteTable(env::AWSEnv; kwargs...) = DisassociateRouteTable(env, DisassociateRouteTableRequest(; kwargs...))
export DisassociateRouteTable

type CancelImportTaskResult <: AbstractAWSType
    importTaskId::Union{Void,String}
    previousState::Union{Void,String}
    requestId::Union{Void,String}
    state::Union{Void,String}
    function CancelImportTaskResult(;importTaskId=nothing, previousState=nothing, requestId=nothing, state=nothing)
        new(importTaskId, previousState, requestId, state)
    end
    CancelImportTaskResult(pd) = parse_from_xml(CancelImportTaskResult, EC2TypeDict, pd)
end # CancelImportTaskResult
export CancelImportTaskResult

type CancelImportTaskRequest <: AbstractAWSType
    cancelReason::Union{Void,String}
    dryRun::Union{Void,Bool}
    importTaskId::Union{Void,String}
    function CancelImportTaskRequest(;cancelReason=nothing, dryRun=nothing, importTaskId=nothing)
        new(cancelReason, dryRun, importTaskId)
    end
    CancelImportTaskRequest(pd) = parse_from_xml(CancelImportTaskRequest, EC2TypeDict, pd)
end # CancelImportTaskRequest
export CancelImportTaskRequest

function CancelImportTask(env::AWSEnv, msg::CancelImportTaskRequest)
    resp::EC2Response = ec2_execute(env, "CancelImportTask", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelImportTaskResult(resp.pd)
    end
    resp
end
CancelImportTask(env::AWSEnv; kwargs...) = CancelImportTask(env, CancelImportTaskRequest(; kwargs...))
export CancelImportTask

type AuthorizeSecurityGroupIngressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AuthorizeSecurityGroupIngressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AuthorizeSecurityGroupIngressResult(pd) = parse_from_xml(AuthorizeSecurityGroupIngressResult, EC2TypeDict, pd)
end # AuthorizeSecurityGroupIngressResult
export AuthorizeSecurityGroupIngressResult

type AuthorizeSecurityGroupIngressRequest <: AbstractAWSType
    cidrIp::Union{Void,String}
    dryRun::Union{Void,Bool}
    fromPort::Union{Void,Int64}
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    ipPermissions::Union{Void,Array{IpPermission,1}}
    ipProtocol::Union{Void,String}
    sourceSecurityGroupName::Union{Void,String}
    sourceSecurityGroupOwnerId::Union{Void,String}
    toPort::Union{Void,Int64}
    function AuthorizeSecurityGroupIngressRequest(;cidrIp=nothing, dryRun=nothing, fromPort=nothing, groupId=nothing, groupName=nothing, ipPermissions=nothing, ipProtocol=nothing, sourceSecurityGroupName=nothing, sourceSecurityGroupOwnerId=nothing, toPort=nothing)
        new(cidrIp, dryRun, fromPort, groupId, groupName, ipPermissions, ipProtocol, sourceSecurityGroupName, sourceSecurityGroupOwnerId, toPort)
    end
    AuthorizeSecurityGroupIngressRequest(pd) = parse_from_xml(AuthorizeSecurityGroupIngressRequest, EC2TypeDict, pd)
end # AuthorizeSecurityGroupIngressRequest
export AuthorizeSecurityGroupIngressRequest

function AuthorizeSecurityGroupIngress(env::AWSEnv, msg::AuthorizeSecurityGroupIngressRequest)
    resp::EC2Response = ec2_execute(env, "AuthorizeSecurityGroupIngress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AuthorizeSecurityGroupIngressResult(resp.pd)
    end
    resp
end
AuthorizeSecurityGroupIngress(env::AWSEnv; kwargs...) = AuthorizeSecurityGroupIngress(env, AuthorizeSecurityGroupIngressRequest(; kwargs...))
export AuthorizeSecurityGroupIngress

type ImportSnapshotResult <: AbstractAWSType
    description::Union{Void,String}
    importTaskId::Union{Void,String}
    requestId::Union{Void,String}
    snapshotTaskDetail::Union{Void,SnapshotTaskDetail}
    function ImportSnapshotResult(;description=nothing, importTaskId=nothing, requestId=nothing, snapshotTaskDetail=nothing)
        new(description, importTaskId, requestId, snapshotTaskDetail)
    end
    ImportSnapshotResult(pd) = parse_from_xml(ImportSnapshotResult, EC2TypeDict, pd)
end # ImportSnapshotResult
export ImportSnapshotResult

type ImportSnapshotRequest <: AbstractAWSType
    clientData::Union{Void,ClientData}
    clientToken::Union{Void,String}
    description::Union{Void,String}
    diskContainer::Union{Void,SnapshotDiskContainer}
    dryRun::Union{Void,Bool}
    roleName::Union{Void,String}
    function ImportSnapshotRequest(;clientData=nothing, clientToken=nothing, description=nothing, diskContainer=nothing, dryRun=nothing, roleName=nothing)
        new(clientData, clientToken, description, diskContainer, dryRun, roleName)
    end
    ImportSnapshotRequest(pd) = parse_from_xml(ImportSnapshotRequest, EC2TypeDict, pd)
end # ImportSnapshotRequest
export ImportSnapshotRequest

function ImportSnapshot(env::AWSEnv, msg::ImportSnapshotRequest)
    resp::EC2Response = ec2_execute(env, "ImportSnapshot", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ImportSnapshotResult(resp.pd)
    end
    resp
end
ImportSnapshot(env::AWSEnv; kwargs...) = ImportSnapshot(env, ImportSnapshotRequest(; kwargs...))
export ImportSnapshot

type ReportInstanceStatusResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ReportInstanceStatusResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ReportInstanceStatusResult(pd) = parse_from_xml(ReportInstanceStatusResult, EC2TypeDict, pd)
end # ReportInstanceStatusResult
export ReportInstanceStatusResult

type ReportInstanceStatusRequest <: AbstractAWSType
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    endTime::Union{Void,DateTime}
    instanceId::Union{Void,Array{String,1}}
    reasonCode::Union{Void,Array{String,1}}
    startTime::Union{Void,DateTime}
    status::Union{Void,String}
    function ReportInstanceStatusRequest(;description=nothing, dryRun=nothing, endTime=nothing, instanceId=nothing, reasonCode=nothing, startTime=nothing, status=nothing)
        new(description, dryRun, endTime, instanceId, reasonCode, startTime, status)
    end
    ReportInstanceStatusRequest(pd) = parse_from_xml(ReportInstanceStatusRequest, EC2TypeDict, pd)
end # ReportInstanceStatusRequest
export ReportInstanceStatusRequest

function ReportInstanceStatus(env::AWSEnv, msg::ReportInstanceStatusRequest)
    resp::EC2Response = ec2_execute(env, "ReportInstanceStatus", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReportInstanceStatusResult(resp.pd)
    end
    resp
end
ReportInstanceStatus(env::AWSEnv; kwargs...) = ReportInstanceStatus(env, ReportInstanceStatusRequest(; kwargs...))
export ReportInstanceStatus

type ModifyHostsResult <: AbstractAWSType
    requestId::Union{Void,String}
    successful::Union{Void,Array{String,1}}
    unsuccessful::Union{Void,Array{UnsuccessfulItem,1}}
    function ModifyHostsResult(;requestId=nothing, successful=nothing, unsuccessful=nothing)
        new(requestId, successful, unsuccessful)
    end
    ModifyHostsResult(pd) = parse_from_xml(ModifyHostsResult, EC2TypeDict, pd)
end # ModifyHostsResult
export ModifyHostsResult

type ModifyHostsRequest <: AbstractAWSType
    autoPlacement::Union{Void,String}
    hostId::Union{Void,Array{String,1}}
    function ModifyHostsRequest(;autoPlacement=nothing, hostId=nothing)
        new(autoPlacement, hostId)
    end
    ModifyHostsRequest(pd) = parse_from_xml(ModifyHostsRequest, EC2TypeDict, pd)
end # ModifyHostsRequest
export ModifyHostsRequest

function ModifyHosts(env::AWSEnv, msg::ModifyHostsRequest)
    resp::EC2Response = ec2_execute(env, "ModifyHosts", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyHostsResult(resp.pd)
    end
    resp
end
ModifyHosts(env::AWSEnv; kwargs...) = ModifyHosts(env, ModifyHostsRequest(; kwargs...))
export ModifyHosts

type ModifyVpcAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyVpcAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyVpcAttributeResult(pd) = parse_from_xml(ModifyVpcAttributeResult, EC2TypeDict, pd)
end # ModifyVpcAttributeResult
export ModifyVpcAttributeResult

type ModifyVpcAttributeRequest <: AbstractAWSType
    enableDnsHostnames::Union{Void,AttributeBooleanValue}
    enableDnsSupport::Union{Void,AttributeBooleanValue}
    vpcId::Union{Void,String}
    function ModifyVpcAttributeRequest(;enableDnsHostnames=nothing, enableDnsSupport=nothing, vpcId=nothing)
        new(enableDnsHostnames, enableDnsSupport, vpcId)
    end
    ModifyVpcAttributeRequest(pd) = parse_from_xml(ModifyVpcAttributeRequest, EC2TypeDict, pd)
end # ModifyVpcAttributeRequest
export ModifyVpcAttributeRequest

function ModifyVpcAttribute(env::AWSEnv, msg::ModifyVpcAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyVpcAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyVpcAttributeResult(resp.pd)
    end
    resp
end
ModifyVpcAttribute(env::AWSEnv; kwargs...) = ModifyVpcAttribute(env, ModifyVpcAttributeRequest(; kwargs...))
export ModifyVpcAttribute

type ModifyInstanceAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyInstanceAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyInstanceAttributeResult(pd) = parse_from_xml(ModifyInstanceAttributeResult, EC2TypeDict, pd)
end # ModifyInstanceAttributeResult
export ModifyInstanceAttributeResult

type ModifyInstanceAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    blockDeviceMapping::Union{Void,Array{InstanceBlockDeviceMappingSpecification,1}}
    disableApiTermination::Union{Void,AttributeBooleanValue}
    dryRun::Union{Void,Bool}
    ebsOptimized::Union{Void,AttributeBooleanValue}
    enaSupport::Union{Void,AttributeBooleanValue}
    groupId::Union{Void,Array{String,1}}
    instanceId::Union{Void,String}
    instanceInitiatedShutdownBehavior::Union{Void,AttributeValue}
    instanceType::Union{Void,AttributeValue}
    kernel::Union{Void,AttributeValue}
    ramdisk::Union{Void,AttributeValue}
    sourceDestCheck::Union{Void,AttributeBooleanValue}
    sriovNetSupport::Union{Void,AttributeValue}
    userData::Union{Void,BlobAttributeValue}
    value::Union{Void,String}
    function ModifyInstanceAttributeRequest(;attribute=nothing, blockDeviceMapping=nothing, disableApiTermination=nothing, dryRun=nothing, ebsOptimized=nothing, enaSupport=nothing, groupId=nothing, instanceId=nothing, instanceInitiatedShutdownBehavior=nothing, instanceType=nothing, kernel=nothing, ramdisk=nothing, sourceDestCheck=nothing, sriovNetSupport=nothing, userData=nothing, value=nothing)
        new(attribute, blockDeviceMapping, disableApiTermination, dryRun, ebsOptimized, enaSupport, groupId, instanceId, instanceInitiatedShutdownBehavior, instanceType, kernel, ramdisk, sourceDestCheck, sriovNetSupport, userData, value)
    end
    ModifyInstanceAttributeRequest(pd) = parse_from_xml(ModifyInstanceAttributeRequest, EC2TypeDict, pd)
end # ModifyInstanceAttributeRequest
export ModifyInstanceAttributeRequest

function ModifyInstanceAttribute(env::AWSEnv, msg::ModifyInstanceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyInstanceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyInstanceAttributeResult(resp.pd)
    end
    resp
end
ModifyInstanceAttribute(env::AWSEnv; kwargs...) = ModifyInstanceAttribute(env, ModifyInstanceAttributeRequest(; kwargs...))
export ModifyInstanceAttribute

type CreateSpotDatafeedSubscriptionResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotDatafeedSubscription::Union{Void,SpotDatafeedSubscription}
    function CreateSpotDatafeedSubscriptionResult(;requestId=nothing, spotDatafeedSubscription=nothing)
        new(requestId, spotDatafeedSubscription)
    end
    CreateSpotDatafeedSubscriptionResult(pd) = parse_from_xml(CreateSpotDatafeedSubscriptionResult, EC2TypeDict, pd)
end # CreateSpotDatafeedSubscriptionResult
export CreateSpotDatafeedSubscriptionResult

type CreateSpotDatafeedSubscriptionRequest <: AbstractAWSType
    bucket::Union{Void,String}
    dryRun::Union{Void,Bool}
    prefix::Union{Void,String}
    function CreateSpotDatafeedSubscriptionRequest(;bucket=nothing, dryRun=nothing, prefix=nothing)
        new(bucket, dryRun, prefix)
    end
    CreateSpotDatafeedSubscriptionRequest(pd) = parse_from_xml(CreateSpotDatafeedSubscriptionRequest, EC2TypeDict, pd)
end # CreateSpotDatafeedSubscriptionRequest
export CreateSpotDatafeedSubscriptionRequest

function CreateSpotDatafeedSubscription(env::AWSEnv, msg::CreateSpotDatafeedSubscriptionRequest)
    resp::EC2Response = ec2_execute(env, "CreateSpotDatafeedSubscription", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateSpotDatafeedSubscriptionResult(resp.pd)
    end
    resp
end
CreateSpotDatafeedSubscription(env::AWSEnv; kwargs...) = CreateSpotDatafeedSubscription(env, CreateSpotDatafeedSubscriptionRequest(; kwargs...))
export CreateSpotDatafeedSubscription

type DeleteNatGatewayResult <: AbstractAWSType
    natGatewayId::Union{Void,String}
    requestId::Union{Void,String}
    function DeleteNatGatewayResult(;natGatewayId=nothing, requestId=nothing)
        new(natGatewayId, requestId)
    end
    DeleteNatGatewayResult(pd) = parse_from_xml(DeleteNatGatewayResult, EC2TypeDict, pd)
end # DeleteNatGatewayResult
export DeleteNatGatewayResult

type DeleteNatGatewayRequest <: AbstractAWSType
    natGatewayId::Union{Void,String}
    function DeleteNatGatewayRequest(;natGatewayId=nothing)
        new(natGatewayId)
    end
    DeleteNatGatewayRequest(pd) = parse_from_xml(DeleteNatGatewayRequest, EC2TypeDict, pd)
end # DeleteNatGatewayRequest
export DeleteNatGatewayRequest

function DeleteNatGateway(env::AWSEnv, msg::DeleteNatGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DeleteNatGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteNatGatewayResult(resp.pd)
    end
    resp
end
DeleteNatGateway(env::AWSEnv; kwargs...) = DeleteNatGateway(env, DeleteNatGatewayRequest(; kwargs...))
export DeleteNatGateway

type GetConsoleOutputResult <: AbstractAWSType
    instanceId::Union{Void,String}
    output::Union{Void,String}
    requestId::Union{Void,String}
    timestamp::Union{Void,DateTime}
    function GetConsoleOutputResult(;instanceId=nothing, output=nothing, requestId=nothing, timestamp=nothing)
        new(instanceId, output, requestId, timestamp)
    end
    GetConsoleOutputResult(pd) = parse_from_xml(GetConsoleOutputResult, EC2TypeDict, pd)
end # GetConsoleOutputResult
export GetConsoleOutputResult

type GetConsoleOutputRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    function GetConsoleOutputRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    GetConsoleOutputRequest(pd) = parse_from_xml(GetConsoleOutputRequest, EC2TypeDict, pd)
end # GetConsoleOutputRequest
export GetConsoleOutputRequest

function GetConsoleOutput(env::AWSEnv, msg::GetConsoleOutputRequest)
    resp::EC2Response = ec2_execute(env, "GetConsoleOutput", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetConsoleOutputResult(resp.pd)
    end
    resp
end
GetConsoleOutput(env::AWSEnv; kwargs...) = GetConsoleOutput(env, GetConsoleOutputRequest(; kwargs...))
export GetConsoleOutput

type CreateRouteTableResult <: AbstractAWSType
    requestId::Union{Void,String}
    routeTable::Union{Void,RouteTable}
    function CreateRouteTableResult(;requestId=nothing, routeTable=nothing)
        new(requestId, routeTable)
    end
    CreateRouteTableResult(pd) = parse_from_xml(CreateRouteTableResult, EC2TypeDict, pd)
end # CreateRouteTableResult
export CreateRouteTableResult

type CreateRouteTableRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function CreateRouteTableRequest(;dryRun=nothing, vpcId=nothing)
        new(dryRun, vpcId)
    end
    CreateRouteTableRequest(pd) = parse_from_xml(CreateRouteTableRequest, EC2TypeDict, pd)
end # CreateRouteTableRequest
export CreateRouteTableRequest

function CreateRouteTable(env::AWSEnv, msg::CreateRouteTableRequest)
    resp::EC2Response = ec2_execute(env, "CreateRouteTable", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateRouteTableResult(resp.pd)
    end
    resp
end
CreateRouteTable(env::AWSEnv; kwargs...) = CreateRouteTable(env, CreateRouteTableRequest(; kwargs...))
export CreateRouteTable

type DescribeBundleTasksResult <: AbstractAWSType
    bundleInstanceTasksSet::Union{Void,Array{BundleTask,1}}
    requestId::Union{Void,String}
    function DescribeBundleTasksResult(;bundleInstanceTasksSet=nothing, requestId=nothing)
        new(bundleInstanceTasksSet, requestId)
    end
    DescribeBundleTasksResult(pd) = parse_from_xml(DescribeBundleTasksResult, EC2TypeDict, pd)
end # DescribeBundleTasksResult
export DescribeBundleTasksResult

type DescribeBundleTasksRequest <: AbstractAWSType
    bundleId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    function DescribeBundleTasksRequest(;bundleId=nothing, dryRun=nothing, filter=nothing)
        new(bundleId, dryRun, filter)
    end
    DescribeBundleTasksRequest(pd) = parse_from_xml(DescribeBundleTasksRequest, EC2TypeDict, pd)
end # DescribeBundleTasksRequest
export DescribeBundleTasksRequest

function DescribeBundleTasks(env::AWSEnv, msg::DescribeBundleTasksRequest)
    resp::EC2Response = ec2_execute(env, "DescribeBundleTasks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeBundleTasksResult(resp.pd)
    end
    resp
end
DescribeBundleTasks(env::AWSEnv; kwargs...) = DescribeBundleTasks(env, DescribeBundleTasksRequest(; kwargs...))
export DescribeBundleTasks

type DeleteVpcPeeringConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVpcPeeringConnectionResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVpcPeeringConnectionResult(pd) = parse_from_xml(DeleteVpcPeeringConnectionResult, EC2TypeDict, pd)
end # DeleteVpcPeeringConnectionResult
export DeleteVpcPeeringConnectionResult

type DeleteVpcPeeringConnectionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcPeeringConnectionId::Union{Void,String}
    function DeleteVpcPeeringConnectionRequest(;dryRun=nothing, vpcPeeringConnectionId=nothing)
        new(dryRun, vpcPeeringConnectionId)
    end
    DeleteVpcPeeringConnectionRequest(pd) = parse_from_xml(DeleteVpcPeeringConnectionRequest, EC2TypeDict, pd)
end # DeleteVpcPeeringConnectionRequest
export DeleteVpcPeeringConnectionRequest

function DeleteVpcPeeringConnection(env::AWSEnv, msg::DeleteVpcPeeringConnectionRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpcPeeringConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpcPeeringConnectionResult(resp.pd)
    end
    resp
end
DeleteVpcPeeringConnection(env::AWSEnv; kwargs...) = DeleteVpcPeeringConnection(env, DeleteVpcPeeringConnectionRequest(; kwargs...))
export DeleteVpcPeeringConnection

type ModifyIdentityIdFormatResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyIdentityIdFormatResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyIdentityIdFormatResult(pd) = parse_from_xml(ModifyIdentityIdFormatResult, EC2TypeDict, pd)
end # ModifyIdentityIdFormatResult
export ModifyIdentityIdFormatResult

type ModifyIdentityIdFormatRequest <: AbstractAWSType
    principalArn::Union{Void,String}
    resource::Union{Void,String}
    useLongIds::Union{Void,Bool}
    function ModifyIdentityIdFormatRequest(;principalArn=nothing, resource=nothing, useLongIds=nothing)
        new(principalArn, resource, useLongIds)
    end
    ModifyIdentityIdFormatRequest(pd) = parse_from_xml(ModifyIdentityIdFormatRequest, EC2TypeDict, pd)
end # ModifyIdentityIdFormatRequest
export ModifyIdentityIdFormatRequest

function ModifyIdentityIdFormat(env::AWSEnv, msg::ModifyIdentityIdFormatRequest)
    resp::EC2Response = ec2_execute(env, "ModifyIdentityIdFormat", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyIdentityIdFormatResult(resp.pd)
    end
    resp
end
ModifyIdentityIdFormat(env::AWSEnv; kwargs...) = ModifyIdentityIdFormat(env, ModifyIdentityIdFormatRequest(; kwargs...))
export ModifyIdentityIdFormat

type ReplaceRouteResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ReplaceRouteResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ReplaceRouteResult(pd) = parse_from_xml(ReplaceRouteResult, EC2TypeDict, pd)
end # ReplaceRouteResult
export ReplaceRouteResult

type ReplaceRouteRequest <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    destinationIpv6CidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    egressOnlyInternetGatewayId::Union{Void,String}
    gatewayId::Union{Void,String}
    instanceId::Union{Void,String}
    natGatewayId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    routeTableId::Union{Void,String}
    vpcPeeringConnectionId::Union{Void,String}
    function ReplaceRouteRequest(;destinationCidrBlock=nothing, destinationIpv6CidrBlock=nothing, dryRun=nothing, egressOnlyInternetGatewayId=nothing, gatewayId=nothing, instanceId=nothing, natGatewayId=nothing, networkInterfaceId=nothing, routeTableId=nothing, vpcPeeringConnectionId=nothing)
        new(destinationCidrBlock, destinationIpv6CidrBlock, dryRun, egressOnlyInternetGatewayId, gatewayId, instanceId, natGatewayId, networkInterfaceId, routeTableId, vpcPeeringConnectionId)
    end
    ReplaceRouteRequest(pd) = parse_from_xml(ReplaceRouteRequest, EC2TypeDict, pd)
end # ReplaceRouteRequest
export ReplaceRouteRequest

function ReplaceRoute(env::AWSEnv, msg::ReplaceRouteRequest)
    resp::EC2Response = ec2_execute(env, "ReplaceRoute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReplaceRouteResult(resp.pd)
    end
    resp
end
ReplaceRoute(env::AWSEnv; kwargs...) = ReplaceRoute(env, ReplaceRouteRequest(; kwargs...))
export ReplaceRoute

type AssociateIamInstanceProfileResult <: AbstractAWSType
    iamInstanceProfileAssociation::Union{Void,IamInstanceProfileAssociation}
    requestId::Union{Void,String}
    function AssociateIamInstanceProfileResult(;iamInstanceProfileAssociation=nothing, requestId=nothing)
        new(iamInstanceProfileAssociation, requestId)
    end
    AssociateIamInstanceProfileResult(pd) = parse_from_xml(AssociateIamInstanceProfileResult, EC2TypeDict, pd)
end # AssociateIamInstanceProfileResult
export AssociateIamInstanceProfileResult

type AssociateIamInstanceProfileRequest <: AbstractAWSType
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    instanceId::Union{Void,String}
    function AssociateIamInstanceProfileRequest(;iamInstanceProfile=nothing, instanceId=nothing)
        new(iamInstanceProfile, instanceId)
    end
    AssociateIamInstanceProfileRequest(pd) = parse_from_xml(AssociateIamInstanceProfileRequest, EC2TypeDict, pd)
end # AssociateIamInstanceProfileRequest
export AssociateIamInstanceProfileRequest

function AssociateIamInstanceProfile(env::AWSEnv, msg::AssociateIamInstanceProfileRequest)
    resp::EC2Response = ec2_execute(env, "AssociateIamInstanceProfile", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateIamInstanceProfileResult(resp.pd)
    end
    resp
end
AssociateIamInstanceProfile(env::AWSEnv; kwargs...) = AssociateIamInstanceProfile(env, AssociateIamInstanceProfileRequest(; kwargs...))
export AssociateIamInstanceProfile

type DeleteKeyPairResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteKeyPairResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteKeyPairResult(pd) = parse_from_xml(DeleteKeyPairResult, EC2TypeDict, pd)
end # DeleteKeyPairResult
export DeleteKeyPairResult

type DeleteKeyPairRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    keyName::Union{Void,String}
    function DeleteKeyPairRequest(;dryRun=nothing, keyName=nothing)
        new(dryRun, keyName)
    end
    DeleteKeyPairRequest(pd) = parse_from_xml(DeleteKeyPairRequest, EC2TypeDict, pd)
end # DeleteKeyPairRequest
export DeleteKeyPairRequest

function DeleteKeyPair(env::AWSEnv, msg::DeleteKeyPairRequest)
    resp::EC2Response = ec2_execute(env, "DeleteKeyPair", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteKeyPairResult(resp.pd)
    end
    resp
end
DeleteKeyPair(env::AWSEnv; kwargs...) = DeleteKeyPair(env, DeleteKeyPairRequest(; kwargs...))
export DeleteKeyPair

type ModifyImageAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyImageAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyImageAttributeResult(pd) = parse_from_xml(ModifyImageAttributeResult, EC2TypeDict, pd)
end # ModifyImageAttributeResult
export ModifyImageAttributeResult

type ModifyImageAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    description::Union{Void,AttributeValue}
    dryRun::Union{Void,Bool}
    imageId::Union{Void,String}
    launchPermission::Union{Void,LaunchPermissionModifications}
    operationType::Union{Void,String}
    productCode::Union{Void,Array{String,1}}
    userGroup::Union{Void,Array{String,1}}
    userId::Union{Void,Array{String,1}}
    value::Union{Void,String}
    function ModifyImageAttributeRequest(;attribute=nothing, description=nothing, dryRun=nothing, imageId=nothing, launchPermission=nothing, operationType=nothing, productCode=nothing, userGroup=nothing, userId=nothing, value=nothing)
        new(attribute, description, dryRun, imageId, launchPermission, operationType, productCode, userGroup, userId, value)
    end
    ModifyImageAttributeRequest(pd) = parse_from_xml(ModifyImageAttributeRequest, EC2TypeDict, pd)
end # ModifyImageAttributeRequest
export ModifyImageAttributeRequest

function ModifyImageAttribute(env::AWSEnv, msg::ModifyImageAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyImageAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyImageAttributeResult(resp.pd)
    end
    resp
end
ModifyImageAttribute(env::AWSEnv; kwargs...) = ModifyImageAttribute(env, ModifyImageAttributeRequest(; kwargs...))
export ModifyImageAttribute

type DescribeHostReservationOfferingsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    offeringSet::Union{Void,Array{HostOffering,1}}
    requestId::Union{Void,String}
    function DescribeHostReservationOfferingsResult(;nextToken=nothing, offeringSet=nothing, requestId=nothing)
        new(nextToken, offeringSet, requestId)
    end
    DescribeHostReservationOfferingsResult(pd) = parse_from_xml(DescribeHostReservationOfferingsResult, EC2TypeDict, pd)
end # DescribeHostReservationOfferingsResult
export DescribeHostReservationOfferingsResult

type DescribeHostReservationOfferingsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    maxDuration::Union{Void,Int64}
    maxResults::Union{Void,Int64}
    minDuration::Union{Void,Int64}
    nextToken::Union{Void,String}
    offeringId::Union{Void,String}
    function DescribeHostReservationOfferingsRequest(;filter=nothing, maxDuration=nothing, maxResults=nothing, minDuration=nothing, nextToken=nothing, offeringId=nothing)
        new(filter, maxDuration, maxResults, minDuration, nextToken, offeringId)
    end
    DescribeHostReservationOfferingsRequest(pd) = parse_from_xml(DescribeHostReservationOfferingsRequest, EC2TypeDict, pd)
end # DescribeHostReservationOfferingsRequest
export DescribeHostReservationOfferingsRequest

function DescribeHostReservationOfferings(env::AWSEnv, msg::DescribeHostReservationOfferingsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeHostReservationOfferings", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeHostReservationOfferingsResult(resp.pd)
    end
    resp
end
DescribeHostReservationOfferings(env::AWSEnv; kwargs...) = DescribeHostReservationOfferings(env, DescribeHostReservationOfferingsRequest(; kwargs...))
export DescribeHostReservationOfferings

type ReleaseAddressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ReleaseAddressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ReleaseAddressResult(pd) = parse_from_xml(ReleaseAddressResult, EC2TypeDict, pd)
end # ReleaseAddressResult
export ReleaseAddressResult

type ReleaseAddressRequest <: AbstractAWSType
    allocationId::Union{Void,String}
    dryRun::Union{Void,Bool}
    publicIp::Union{Void,String}
    function ReleaseAddressRequest(;allocationId=nothing, dryRun=nothing, publicIp=nothing)
        new(allocationId, dryRun, publicIp)
    end
    ReleaseAddressRequest(pd) = parse_from_xml(ReleaseAddressRequest, EC2TypeDict, pd)
end # ReleaseAddressRequest
export ReleaseAddressRequest

function ReleaseAddress(env::AWSEnv, msg::ReleaseAddressRequest)
    resp::EC2Response = ec2_execute(env, "ReleaseAddress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReleaseAddressResult(resp.pd)
    end
    resp
end
ReleaseAddress(env::AWSEnv; kwargs...) = ReleaseAddress(env, ReleaseAddressRequest(; kwargs...))
export ReleaseAddress

type MonitorInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{InstanceMonitoring,1}}
    requestId::Union{Void,String}
    function MonitorInstancesResult(;instancesSet=nothing, requestId=nothing)
        new(instancesSet, requestId)
    end
    MonitorInstancesResult(pd) = parse_from_xml(MonitorInstancesResult, EC2TypeDict, pd)
end # MonitorInstancesResult
export MonitorInstancesResult

type MonitorInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function MonitorInstancesRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    MonitorInstancesRequest(pd) = parse_from_xml(MonitorInstancesRequest, EC2TypeDict, pd)
end # MonitorInstancesRequest
export MonitorInstancesRequest

function MonitorInstances(env::AWSEnv, msg::MonitorInstancesRequest)
    resp::EC2Response = ec2_execute(env, "MonitorInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = MonitorInstancesResult(resp.pd)
    end
    resp
end
MonitorInstances(env::AWSEnv; kwargs...) = MonitorInstances(env, MonitorInstancesRequest(; kwargs...))
export MonitorInstances

type DeleteInternetGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteInternetGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteInternetGatewayResult(pd) = parse_from_xml(DeleteInternetGatewayResult, EC2TypeDict, pd)
end # DeleteInternetGatewayResult
export DeleteInternetGatewayResult

type DeleteInternetGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    internetGatewayId::Union{Void,String}
    function DeleteInternetGatewayRequest(;dryRun=nothing, internetGatewayId=nothing)
        new(dryRun, internetGatewayId)
    end
    DeleteInternetGatewayRequest(pd) = parse_from_xml(DeleteInternetGatewayRequest, EC2TypeDict, pd)
end # DeleteInternetGatewayRequest
export DeleteInternetGatewayRequest

function DeleteInternetGateway(env::AWSEnv, msg::DeleteInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DeleteInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteInternetGatewayResult(resp.pd)
    end
    resp
end
DeleteInternetGateway(env::AWSEnv; kwargs...) = DeleteInternetGateway(env, DeleteInternetGatewayRequest(; kwargs...))
export DeleteInternetGateway

type CreateNetworkAclEntryResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CreateNetworkAclEntryResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CreateNetworkAclEntryResult(pd) = parse_from_xml(CreateNetworkAclEntryResult, EC2TypeDict, pd)
end # CreateNetworkAclEntryResult
export CreateNetworkAclEntryResult

type CreateNetworkAclEntryRequest <: AbstractAWSType
    cidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    egress::Union{Void,Bool}
    icmp::Union{Void,IcmpTypeCode}
    ipv6CidrBlock::Union{Void,String}
    networkAclId::Union{Void,String}
    portRange::Union{Void,PortRange}
    protocol::Union{Void,String}
    ruleAction::Union{Void,String}
    ruleNumber::Union{Void,Int64}
    function CreateNetworkAclEntryRequest(;cidrBlock=nothing, dryRun=nothing, egress=nothing, icmp=nothing, ipv6CidrBlock=nothing, networkAclId=nothing, portRange=nothing, protocol=nothing, ruleAction=nothing, ruleNumber=nothing)
        new(cidrBlock, dryRun, egress, icmp, ipv6CidrBlock, networkAclId, portRange, protocol, ruleAction, ruleNumber)
    end
    CreateNetworkAclEntryRequest(pd) = parse_from_xml(CreateNetworkAclEntryRequest, EC2TypeDict, pd)
end # CreateNetworkAclEntryRequest
export CreateNetworkAclEntryRequest

function CreateNetworkAclEntry(env::AWSEnv, msg::CreateNetworkAclEntryRequest)
    resp::EC2Response = ec2_execute(env, "CreateNetworkAclEntry", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateNetworkAclEntryResult(resp.pd)
    end
    resp
end
CreateNetworkAclEntry(env::AWSEnv; kwargs...) = CreateNetworkAclEntry(env, CreateNetworkAclEntryRequest(; kwargs...))
export CreateNetworkAclEntry

type DescribeClassicLinkInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{ClassicLinkInstance,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeClassicLinkInstancesResult(;instancesSet=nothing, nextToken=nothing, requestId=nothing)
        new(instancesSet, nextToken, requestId)
    end
    DescribeClassicLinkInstancesResult(pd) = parse_from_xml(DescribeClassicLinkInstancesResult, EC2TypeDict, pd)
end # DescribeClassicLinkInstancesResult
export DescribeClassicLinkInstancesResult

type DescribeClassicLinkInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    instanceId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeClassicLinkInstancesRequest(;dryRun=nothing, filter=nothing, instanceId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filter, instanceId, maxResults, nextToken)
    end
    DescribeClassicLinkInstancesRequest(pd) = parse_from_xml(DescribeClassicLinkInstancesRequest, EC2TypeDict, pd)
end # DescribeClassicLinkInstancesRequest
export DescribeClassicLinkInstancesRequest

function DescribeClassicLinkInstances(env::AWSEnv, msg::DescribeClassicLinkInstancesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeClassicLinkInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeClassicLinkInstancesResult(resp.pd)
    end
    resp
end
DescribeClassicLinkInstances(env::AWSEnv; kwargs...) = DescribeClassicLinkInstances(env, DescribeClassicLinkInstancesRequest(; kwargs...))
export DescribeClassicLinkInstances

type CancelConversionTaskResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CancelConversionTaskResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CancelConversionTaskResult(pd) = parse_from_xml(CancelConversionTaskResult, EC2TypeDict, pd)
end # CancelConversionTaskResult
export CancelConversionTaskResult

type CancelConversionTaskRequest <: AbstractAWSType
    conversionTaskId::Union{Void,String}
    dryRun::Union{Void,Bool}
    reasonMessage::Union{Void,String}
    function CancelConversionTaskRequest(;conversionTaskId=nothing, dryRun=nothing, reasonMessage=nothing)
        new(conversionTaskId, dryRun, reasonMessage)
    end
    CancelConversionTaskRequest(pd) = parse_from_xml(CancelConversionTaskRequest, EC2TypeDict, pd)
end # CancelConversionTaskRequest
export CancelConversionTaskRequest

function CancelConversionTask(env::AWSEnv, msg::CancelConversionTaskRequest)
    resp::EC2Response = ec2_execute(env, "CancelConversionTask", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelConversionTaskResult(resp.pd)
    end
    resp
end
CancelConversionTask(env::AWSEnv; kwargs...) = CancelConversionTask(env, CancelConversionTaskRequest(; kwargs...))
export CancelConversionTask

type DeleteSubnetResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteSubnetResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteSubnetResult(pd) = parse_from_xml(DeleteSubnetResult, EC2TypeDict, pd)
end # DeleteSubnetResult
export DeleteSubnetResult

type DeleteSubnetRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    subnetId::Union{Void,String}
    function DeleteSubnetRequest(;dryRun=nothing, subnetId=nothing)
        new(dryRun, subnetId)
    end
    DeleteSubnetRequest(pd) = parse_from_xml(DeleteSubnetRequest, EC2TypeDict, pd)
end # DeleteSubnetRequest
export DeleteSubnetRequest

function DeleteSubnet(env::AWSEnv, msg::DeleteSubnetRequest)
    resp::EC2Response = ec2_execute(env, "DeleteSubnet", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteSubnetResult(resp.pd)
    end
    resp
end
DeleteSubnet(env::AWSEnv; kwargs...) = DeleteSubnet(env, DeleteSubnetRequest(; kwargs...))
export DeleteSubnet

type CreateNatGatewayResult <: AbstractAWSType
    clientToken::Union{Void,String}
    natGateway::Union{Void,NatGateway}
    requestId::Union{Void,String}
    function CreateNatGatewayResult(;clientToken=nothing, natGateway=nothing, requestId=nothing)
        new(clientToken, natGateway, requestId)
    end
    CreateNatGatewayResult(pd) = parse_from_xml(CreateNatGatewayResult, EC2TypeDict, pd)
end # CreateNatGatewayResult
export CreateNatGatewayResult

type CreateNatGatewayRequest <: AbstractAWSType
    allocationId::Union{Void,String}
    clientToken::Union{Void,String}
    subnetId::Union{Void,String}
    function CreateNatGatewayRequest(;allocationId=nothing, clientToken=nothing, subnetId=nothing)
        new(allocationId, clientToken, subnetId)
    end
    CreateNatGatewayRequest(pd) = parse_from_xml(CreateNatGatewayRequest, EC2TypeDict, pd)
end # CreateNatGatewayRequest
export CreateNatGatewayRequest

function CreateNatGateway(env::AWSEnv, msg::CreateNatGatewayRequest)
    resp::EC2Response = ec2_execute(env, "CreateNatGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateNatGatewayResult(resp.pd)
    end
    resp
end
CreateNatGateway(env::AWSEnv; kwargs...) = CreateNatGateway(env, CreateNatGatewayRequest(; kwargs...))
export CreateNatGateway

type DescribeVolumesModificationsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    volumeModificationSet::Union{Void,Array{VolumeModification,1}}
    function DescribeVolumesModificationsResult(;nextToken=nothing, requestId=nothing, volumeModificationSet=nothing)
        new(nextToken, requestId, volumeModificationSet)
    end
    DescribeVolumesModificationsResult(pd) = parse_from_xml(DescribeVolumesModificationsResult, EC2TypeDict, pd)
end # DescribeVolumesModificationsResult
export DescribeVolumesModificationsResult

type DescribeVolumesModificationsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    volumeId::Union{Void,Array{String,1}}
    function DescribeVolumesModificationsRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, volumeId=nothing)
        new(dryRun, filter, maxResults, nextToken, volumeId)
    end
    DescribeVolumesModificationsRequest(pd) = parse_from_xml(DescribeVolumesModificationsRequest, EC2TypeDict, pd)
end # DescribeVolumesModificationsRequest
export DescribeVolumesModificationsRequest

function DescribeVolumesModifications(env::AWSEnv, msg::DescribeVolumesModificationsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVolumesModifications", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVolumesModificationsResult(resp.pd)
    end
    resp
end
DescribeVolumesModifications(env::AWSEnv; kwargs...) = DescribeVolumesModifications(env, DescribeVolumesModificationsRequest(; kwargs...))
export DescribeVolumesModifications

type DeleteVpcEndpointsResult <: AbstractAWSType
    requestId::Union{Void,String}
    unsuccessful::Union{Void,Array{UnsuccessfulItem,1}}
    function DeleteVpcEndpointsResult(;requestId=nothing, unsuccessful=nothing)
        new(requestId, unsuccessful)
    end
    DeleteVpcEndpointsResult(pd) = parse_from_xml(DeleteVpcEndpointsResult, EC2TypeDict, pd)
end # DeleteVpcEndpointsResult
export DeleteVpcEndpointsResult

type DeleteVpcEndpointsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcEndpointId::Union{Void,Array{String,1}}
    function DeleteVpcEndpointsRequest(;dryRun=nothing, vpcEndpointId=nothing)
        new(dryRun, vpcEndpointId)
    end
    DeleteVpcEndpointsRequest(pd) = parse_from_xml(DeleteVpcEndpointsRequest, EC2TypeDict, pd)
end # DeleteVpcEndpointsRequest
export DeleteVpcEndpointsRequest

function DeleteVpcEndpoints(env::AWSEnv, msg::DeleteVpcEndpointsRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpcEndpoints", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpcEndpointsResult(resp.pd)
    end
    resp
end
DeleteVpcEndpoints(env::AWSEnv; kwargs...) = DeleteVpcEndpoints(env, DeleteVpcEndpointsRequest(; kwargs...))
export DeleteVpcEndpoints

type ImportImageResult <: AbstractAWSType
    architecture::Union{Void,String}
    description::Union{Void,String}
    hypervisor::Union{Void,String}
    imageId::Union{Void,String}
    importTaskId::Union{Void,String}
    licenseType::Union{Void,String}
    platform::Union{Void,String}
    progress::Union{Void,String}
    requestId::Union{Void,String}
    snapshotDetailSet::Union{Void,Array{SnapshotDetail,1}}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    function ImportImageResult(;architecture=nothing, description=nothing, hypervisor=nothing, imageId=nothing, importTaskId=nothing, licenseType=nothing, platform=nothing, progress=nothing, requestId=nothing, snapshotDetailSet=nothing, status=nothing, statusMessage=nothing)
        new(architecture, description, hypervisor, imageId, importTaskId, licenseType, platform, progress, requestId, snapshotDetailSet, status, statusMessage)
    end
    ImportImageResult(pd) = parse_from_xml(ImportImageResult, EC2TypeDict, pd)
end # ImportImageResult
export ImportImageResult

type ImportImageRequest <: AbstractAWSType
    architecture::Union{Void,String}
    clientData::Union{Void,ClientData}
    clientToken::Union{Void,String}
    description::Union{Void,String}
    diskContainer::Union{Void,Array{ImageDiskContainer,1}}
    dryRun::Union{Void,Bool}
    hypervisor::Union{Void,String}
    licenseType::Union{Void,String}
    platform::Union{Void,String}
    roleName::Union{Void,String}
    function ImportImageRequest(;architecture=nothing, clientData=nothing, clientToken=nothing, description=nothing, diskContainer=nothing, dryRun=nothing, hypervisor=nothing, licenseType=nothing, platform=nothing, roleName=nothing)
        new(architecture, clientData, clientToken, description, diskContainer, dryRun, hypervisor, licenseType, platform, roleName)
    end
    ImportImageRequest(pd) = parse_from_xml(ImportImageRequest, EC2TypeDict, pd)
end # ImportImageRequest
export ImportImageRequest

function ImportImage(env::AWSEnv, msg::ImportImageRequest)
    resp::EC2Response = ec2_execute(env, "ImportImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ImportImageResult(resp.pd)
    end
    resp
end
ImportImage(env::AWSEnv; kwargs...) = ImportImage(env, ImportImageRequest(; kwargs...))
export ImportImage

type DetachVpnGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DetachVpnGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DetachVpnGatewayResult(pd) = parse_from_xml(DetachVpnGatewayResult, EC2TypeDict, pd)
end # DetachVpnGatewayResult
export DetachVpnGatewayResult

type DetachVpnGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    vpnGatewayId::Union{Void,String}
    function DetachVpnGatewayRequest(;dryRun=nothing, vpcId=nothing, vpnGatewayId=nothing)
        new(dryRun, vpcId, vpnGatewayId)
    end
    DetachVpnGatewayRequest(pd) = parse_from_xml(DetachVpnGatewayRequest, EC2TypeDict, pd)
end # DetachVpnGatewayRequest
export DetachVpnGatewayRequest

function DetachVpnGateway(env::AWSEnv, msg::DetachVpnGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DetachVpnGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachVpnGatewayResult(resp.pd)
    end
    resp
end
DetachVpnGateway(env::AWSEnv; kwargs...) = DetachVpnGateway(env, DetachVpnGatewayRequest(; kwargs...))
export DetachVpnGateway

type MoveAddressToVpcResult <: AbstractAWSType
    allocationId::Union{Void,String}
    requestId::Union{Void,String}
    status::Union{Void,String}
    function MoveAddressToVpcResult(;allocationId=nothing, requestId=nothing, status=nothing)
        new(allocationId, requestId, status)
    end
    MoveAddressToVpcResult(pd) = parse_from_xml(MoveAddressToVpcResult, EC2TypeDict, pd)
end # MoveAddressToVpcResult
export MoveAddressToVpcResult

type MoveAddressToVpcRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    publicIp::Union{Void,String}
    function MoveAddressToVpcRequest(;dryRun=nothing, publicIp=nothing)
        new(dryRun, publicIp)
    end
    MoveAddressToVpcRequest(pd) = parse_from_xml(MoveAddressToVpcRequest, EC2TypeDict, pd)
end # MoveAddressToVpcRequest
export MoveAddressToVpcRequest

function MoveAddressToVpc(env::AWSEnv, msg::MoveAddressToVpcRequest)
    resp::EC2Response = ec2_execute(env, "MoveAddressToVpc", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = MoveAddressToVpcResult(resp.pd)
    end
    resp
end
MoveAddressToVpc(env::AWSEnv; kwargs...) = MoveAddressToVpc(env, MoveAddressToVpcRequest(; kwargs...))
export MoveAddressToVpc

type DescribeEgressOnlyInternetGatewaysResult <: AbstractAWSType
    egressOnlyInternetGatewaySet::Union{Void,Array{EgressOnlyInternetGateway,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeEgressOnlyInternetGatewaysResult(;egressOnlyInternetGatewaySet=nothing, nextToken=nothing, requestId=nothing)
        new(egressOnlyInternetGatewaySet, nextToken, requestId)
    end
    DescribeEgressOnlyInternetGatewaysResult(pd) = parse_from_xml(DescribeEgressOnlyInternetGatewaysResult, EC2TypeDict, pd)
end # DescribeEgressOnlyInternetGatewaysResult
export DescribeEgressOnlyInternetGatewaysResult

type DescribeEgressOnlyInternetGatewaysRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    egressOnlyInternetGatewayId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeEgressOnlyInternetGatewaysRequest(;dryRun=nothing, egressOnlyInternetGatewayId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, egressOnlyInternetGatewayId, maxResults, nextToken)
    end
    DescribeEgressOnlyInternetGatewaysRequest(pd) = parse_from_xml(DescribeEgressOnlyInternetGatewaysRequest, EC2TypeDict, pd)
end # DescribeEgressOnlyInternetGatewaysRequest
export DescribeEgressOnlyInternetGatewaysRequest

function DescribeEgressOnlyInternetGateways(env::AWSEnv, msg::DescribeEgressOnlyInternetGatewaysRequest)
    resp::EC2Response = ec2_execute(env, "DescribeEgressOnlyInternetGateways", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeEgressOnlyInternetGatewaysResult(resp.pd)
    end
    resp
end
DescribeEgressOnlyInternetGateways(env::AWSEnv; kwargs...) = DescribeEgressOnlyInternetGateways(env, DescribeEgressOnlyInternetGatewaysRequest(; kwargs...))
export DescribeEgressOnlyInternetGateways

type CreateNetworkInterfaceResult <: AbstractAWSType
    networkInterface::Union{Void,NetworkInterface}
    requestId::Union{Void,String}
    function CreateNetworkInterfaceResult(;networkInterface=nothing, requestId=nothing)
        new(networkInterface, requestId)
    end
    CreateNetworkInterfaceResult(pd) = parse_from_xml(CreateNetworkInterfaceResult, EC2TypeDict, pd)
end # CreateNetworkInterfaceResult
export CreateNetworkInterfaceResult

type CreateNetworkInterfaceRequest <: AbstractAWSType
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    ipv6AddressCount::Union{Void,Int64}
    ipv6Addresses::Union{Void,Array{InstanceIpv6Address,1}}
    privateIpAddress::Union{Void,String}
    privateIpAddresses::Union{Void,Array{PrivateIpAddressSpecification,1}}
    secondaryPrivateIpAddressCount::Union{Void,Int64}
    securityGroupId::Union{Void,Array{String,1}}
    subnetId::Union{Void,String}
    function CreateNetworkInterfaceRequest(;description=nothing, dryRun=nothing, ipv6AddressCount=nothing, ipv6Addresses=nothing, privateIpAddress=nothing, privateIpAddresses=nothing, secondaryPrivateIpAddressCount=nothing, securityGroupId=nothing, subnetId=nothing)
        new(description, dryRun, ipv6AddressCount, ipv6Addresses, privateIpAddress, privateIpAddresses, secondaryPrivateIpAddressCount, securityGroupId, subnetId)
    end
    CreateNetworkInterfaceRequest(pd) = parse_from_xml(CreateNetworkInterfaceRequest, EC2TypeDict, pd)
end # CreateNetworkInterfaceRequest
export CreateNetworkInterfaceRequest

function CreateNetworkInterface(env::AWSEnv, msg::CreateNetworkInterfaceRequest)
    resp::EC2Response = ec2_execute(env, "CreateNetworkInterface", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateNetworkInterfaceResult(resp.pd)
    end
    resp
end
CreateNetworkInterface(env::AWSEnv; kwargs...) = CreateNetworkInterface(env, CreateNetworkInterfaceRequest(; kwargs...))
export CreateNetworkInterface

type DescribeVpnConnectionsResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpnConnectionSet::Union{Void,Array{VpnConnection,1}}
    function DescribeVpnConnectionsResult(;requestId=nothing, vpnConnectionSet=nothing)
        new(requestId, vpnConnectionSet)
    end
    DescribeVpnConnectionsResult(pd) = parse_from_xml(DescribeVpnConnectionsResult, EC2TypeDict, pd)
end # DescribeVpnConnectionsResult
export DescribeVpnConnectionsResult

type DescribeVpnConnectionsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    vpnConnectionId::Union{Void,Array{String,1}}
    function DescribeVpnConnectionsRequest(;dryRun=nothing, filter=nothing, vpnConnectionId=nothing)
        new(dryRun, filter, vpnConnectionId)
    end
    DescribeVpnConnectionsRequest(pd) = parse_from_xml(DescribeVpnConnectionsRequest, EC2TypeDict, pd)
end # DescribeVpnConnectionsRequest
export DescribeVpnConnectionsRequest

function DescribeVpnConnections(env::AWSEnv, msg::DescribeVpnConnectionsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpnConnections", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpnConnectionsResult(resp.pd)
    end
    resp
end
DescribeVpnConnections(env::AWSEnv; kwargs...) = DescribeVpnConnections(env, DescribeVpnConnectionsRequest(; kwargs...))
export DescribeVpnConnections

type DescribeSecurityGroupsResult <: AbstractAWSType
    requestId::Union{Void,String}
    securityGroupInfo::Union{Void,Array{SecurityGroup,1}}
    function DescribeSecurityGroupsResult(;requestId=nothing, securityGroupInfo=nothing)
        new(requestId, securityGroupInfo)
    end
    DescribeSecurityGroupsResult(pd) = parse_from_xml(DescribeSecurityGroupsResult, EC2TypeDict, pd)
end # DescribeSecurityGroupsResult
export DescribeSecurityGroupsResult

type DescribeSecurityGroupsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    groupId::Union{Void,Array{String,1}}
    groupName::Union{Void,Array{String,1}}
    function DescribeSecurityGroupsRequest(;dryRun=nothing, filter=nothing, groupId=nothing, groupName=nothing)
        new(dryRun, filter, groupId, groupName)
    end
    DescribeSecurityGroupsRequest(pd) = parse_from_xml(DescribeSecurityGroupsRequest, EC2TypeDict, pd)
end # DescribeSecurityGroupsRequest
export DescribeSecurityGroupsRequest

function DescribeSecurityGroups(env::AWSEnv, msg::DescribeSecurityGroupsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSecurityGroups", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSecurityGroupsResult(resp.pd)
    end
    resp
end
DescribeSecurityGroups(env::AWSEnv; kwargs...) = DescribeSecurityGroups(env, DescribeSecurityGroupsRequest(; kwargs...))
export DescribeSecurityGroups

type DeleteCustomerGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteCustomerGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteCustomerGatewayResult(pd) = parse_from_xml(DeleteCustomerGatewayResult, EC2TypeDict, pd)
end # DeleteCustomerGatewayResult
export DeleteCustomerGatewayResult

type DeleteCustomerGatewayRequest <: AbstractAWSType
    customerGatewayId::Union{Void,String}
    dryRun::Union{Void,Bool}
    function DeleteCustomerGatewayRequest(;customerGatewayId=nothing, dryRun=nothing)
        new(customerGatewayId, dryRun)
    end
    DeleteCustomerGatewayRequest(pd) = parse_from_xml(DeleteCustomerGatewayRequest, EC2TypeDict, pd)
end # DeleteCustomerGatewayRequest
export DeleteCustomerGatewayRequest

function DeleteCustomerGateway(env::AWSEnv, msg::DeleteCustomerGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DeleteCustomerGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteCustomerGatewayResult(resp.pd)
    end
    resp
end
DeleteCustomerGateway(env::AWSEnv; kwargs...) = DeleteCustomerGateway(env, DeleteCustomerGatewayRequest(; kwargs...))
export DeleteCustomerGateway

type AllocateAddressResult <: AbstractAWSType
    allocationId::Union{Void,String}
    domain::Union{Void,String}
    publicIp::Union{Void,String}
    requestId::Union{Void,String}
    function AllocateAddressResult(;allocationId=nothing, domain=nothing, publicIp=nothing, requestId=nothing)
        new(allocationId, domain, publicIp, requestId)
    end
    AllocateAddressResult(pd) = parse_from_xml(AllocateAddressResult, EC2TypeDict, pd)
end # AllocateAddressResult
export AllocateAddressResult

type AllocateAddressRequest <: AbstractAWSType
    domain::Union{Void,String}
    dryRun::Union{Void,Bool}
    function AllocateAddressRequest(;domain=nothing, dryRun=nothing)
        new(domain, dryRun)
    end
    AllocateAddressRequest(pd) = parse_from_xml(AllocateAddressRequest, EC2TypeDict, pd)
end # AllocateAddressRequest
export AllocateAddressRequest

function AllocateAddress(env::AWSEnv, msg::AllocateAddressRequest)
    resp::EC2Response = ec2_execute(env, "AllocateAddress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AllocateAddressResult(resp.pd)
    end
    resp
end
AllocateAddress(env::AWSEnv; kwargs...) = AllocateAddress(env, AllocateAddressRequest(; kwargs...))
export AllocateAddress

type DescribeIdentityIdFormatResult <: AbstractAWSType
    requestId::Union{Void,String}
    statusSet::Union{Void,Array{IdFormat,1}}
    function DescribeIdentityIdFormatResult(;requestId=nothing, statusSet=nothing)
        new(requestId, statusSet)
    end
    DescribeIdentityIdFormatResult(pd) = parse_from_xml(DescribeIdentityIdFormatResult, EC2TypeDict, pd)
end # DescribeIdentityIdFormatResult
export DescribeIdentityIdFormatResult

type DescribeIdentityIdFormatRequest <: AbstractAWSType
    principalArn::Union{Void,String}
    resource::Union{Void,String}
    function DescribeIdentityIdFormatRequest(;principalArn=nothing, resource=nothing)
        new(principalArn, resource)
    end
    DescribeIdentityIdFormatRequest(pd) = parse_from_xml(DescribeIdentityIdFormatRequest, EC2TypeDict, pd)
end # DescribeIdentityIdFormatRequest
export DescribeIdentityIdFormatRequest

function DescribeIdentityIdFormat(env::AWSEnv, msg::DescribeIdentityIdFormatRequest)
    resp::EC2Response = ec2_execute(env, "DescribeIdentityIdFormat", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeIdentityIdFormatResult(resp.pd)
    end
    resp
end
DescribeIdentityIdFormat(env::AWSEnv; kwargs...) = DescribeIdentityIdFormat(env, DescribeIdentityIdFormatRequest(; kwargs...))
export DescribeIdentityIdFormat

type DescribePrefixListsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    prefixListSet::Union{Void,Array{PrefixList,1}}
    requestId::Union{Void,String}
    function DescribePrefixListsResult(;nextToken=nothing, prefixListSet=nothing, requestId=nothing)
        new(nextToken, prefixListSet, requestId)
    end
    DescribePrefixListsResult(pd) = parse_from_xml(DescribePrefixListsResult, EC2TypeDict, pd)
end # DescribePrefixListsResult
export DescribePrefixListsResult

type DescribePrefixListsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    prefixListId::Union{Void,Array{String,1}}
    function DescribePrefixListsRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, prefixListId=nothing)
        new(dryRun, filter, maxResults, nextToken, prefixListId)
    end
    DescribePrefixListsRequest(pd) = parse_from_xml(DescribePrefixListsRequest, EC2TypeDict, pd)
end # DescribePrefixListsRequest
export DescribePrefixListsRequest

function DescribePrefixLists(env::AWSEnv, msg::DescribePrefixListsRequest)
    resp::EC2Response = ec2_execute(env, "DescribePrefixLists", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribePrefixListsResult(resp.pd)
    end
    resp
end
DescribePrefixLists(env::AWSEnv; kwargs...) = DescribePrefixLists(env, DescribePrefixListsRequest(; kwargs...))
export DescribePrefixLists

type DescribeVpcPeeringConnectionsResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpcPeeringConnectionSet::Union{Void,Array{VpcPeeringConnection,1}}
    function DescribeVpcPeeringConnectionsResult(;requestId=nothing, vpcPeeringConnectionSet=nothing)
        new(requestId, vpcPeeringConnectionSet)
    end
    DescribeVpcPeeringConnectionsResult(pd) = parse_from_xml(DescribeVpcPeeringConnectionsResult, EC2TypeDict, pd)
end # DescribeVpcPeeringConnectionsResult
export DescribeVpcPeeringConnectionsResult

type DescribeVpcPeeringConnectionsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    vpcPeeringConnectionId::Union{Void,Array{String,1}}
    function DescribeVpcPeeringConnectionsRequest(;dryRun=nothing, filter=nothing, vpcPeeringConnectionId=nothing)
        new(dryRun, filter, vpcPeeringConnectionId)
    end
    DescribeVpcPeeringConnectionsRequest(pd) = parse_from_xml(DescribeVpcPeeringConnectionsRequest, EC2TypeDict, pd)
end # DescribeVpcPeeringConnectionsRequest
export DescribeVpcPeeringConnectionsRequest

function DescribeVpcPeeringConnections(env::AWSEnv, msg::DescribeVpcPeeringConnectionsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcPeeringConnections", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcPeeringConnectionsResult(resp.pd)
    end
    resp
end
DescribeVpcPeeringConnections(env::AWSEnv; kwargs...) = DescribeVpcPeeringConnections(env, DescribeVpcPeeringConnectionsRequest(; kwargs...))
export DescribeVpcPeeringConnections

type DeleteNetworkAclResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteNetworkAclResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteNetworkAclResult(pd) = parse_from_xml(DeleteNetworkAclResult, EC2TypeDict, pd)
end # DeleteNetworkAclResult
export DeleteNetworkAclResult

type DeleteNetworkAclRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    networkAclId::Union{Void,String}
    function DeleteNetworkAclRequest(;dryRun=nothing, networkAclId=nothing)
        new(dryRun, networkAclId)
    end
    DeleteNetworkAclRequest(pd) = parse_from_xml(DeleteNetworkAclRequest, EC2TypeDict, pd)
end # DeleteNetworkAclRequest
export DeleteNetworkAclRequest

function DeleteNetworkAcl(env::AWSEnv, msg::DeleteNetworkAclRequest)
    resp::EC2Response = ec2_execute(env, "DeleteNetworkAcl", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteNetworkAclResult(resp.pd)
    end
    resp
end
DeleteNetworkAcl(env::AWSEnv; kwargs...) = DeleteNetworkAcl(env, DeleteNetworkAclRequest(; kwargs...))
export DeleteNetworkAcl

type RebootInstancesResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function RebootInstancesResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    RebootInstancesResult(pd) = parse_from_xml(RebootInstancesResult, EC2TypeDict, pd)
end # RebootInstancesResult
export RebootInstancesResult

type RebootInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function RebootInstancesRequest(;dryRun=nothing, instanceId=nothing)
        new(dryRun, instanceId)
    end
    RebootInstancesRequest(pd) = parse_from_xml(RebootInstancesRequest, EC2TypeDict, pd)
end # RebootInstancesRequest
export RebootInstancesRequest

function RebootInstances(env::AWSEnv, msg::RebootInstancesRequest)
    resp::EC2Response = ec2_execute(env, "RebootInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RebootInstancesResult(resp.pd)
    end
    resp
end
RebootInstances(env::AWSEnv; kwargs...) = RebootInstances(env, RebootInstancesRequest(; kwargs...))
export RebootInstances

type DescribeVpcEndpointsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    vpcEndpointSet::Union{Void,Array{VpcEndpoint,1}}
    function DescribeVpcEndpointsResult(;nextToken=nothing, requestId=nothing, vpcEndpointSet=nothing)
        new(nextToken, requestId, vpcEndpointSet)
    end
    DescribeVpcEndpointsResult(pd) = parse_from_xml(DescribeVpcEndpointsResult, EC2TypeDict, pd)
end # DescribeVpcEndpointsResult
export DescribeVpcEndpointsResult

type DescribeVpcEndpointsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    vpcEndpointId::Union{Void,Array{String,1}}
    function DescribeVpcEndpointsRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, vpcEndpointId=nothing)
        new(dryRun, filter, maxResults, nextToken, vpcEndpointId)
    end
    DescribeVpcEndpointsRequest(pd) = parse_from_xml(DescribeVpcEndpointsRequest, EC2TypeDict, pd)
end # DescribeVpcEndpointsRequest
export DescribeVpcEndpointsRequest

function DescribeVpcEndpoints(env::AWSEnv, msg::DescribeVpcEndpointsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcEndpoints", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcEndpointsResult(resp.pd)
    end
    resp
end
DescribeVpcEndpoints(env::AWSEnv; kwargs...) = DescribeVpcEndpoints(env, DescribeVpcEndpointsRequest(; kwargs...))
export DescribeVpcEndpoints

type CancelBundleTaskResult <: AbstractAWSType
    bundleInstanceTask::Union{Void,BundleTask}
    requestId::Union{Void,String}
    function CancelBundleTaskResult(;bundleInstanceTask=nothing, requestId=nothing)
        new(bundleInstanceTask, requestId)
    end
    CancelBundleTaskResult(pd) = parse_from_xml(CancelBundleTaskResult, EC2TypeDict, pd)
end # CancelBundleTaskResult
export CancelBundleTaskResult

type CancelBundleTaskRequest <: AbstractAWSType
    bundleId::Union{Void,String}
    dryRun::Union{Void,Bool}
    function CancelBundleTaskRequest(;bundleId=nothing, dryRun=nothing)
        new(bundleId, dryRun)
    end
    CancelBundleTaskRequest(pd) = parse_from_xml(CancelBundleTaskRequest, EC2TypeDict, pd)
end # CancelBundleTaskRequest
export CancelBundleTaskRequest

function CancelBundleTask(env::AWSEnv, msg::CancelBundleTaskRequest)
    resp::EC2Response = ec2_execute(env, "CancelBundleTask", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelBundleTaskResult(resp.pd)
    end
    resp
end
CancelBundleTask(env::AWSEnv; kwargs...) = CancelBundleTask(env, CancelBundleTaskRequest(; kwargs...))
export CancelBundleTask

type ModifySpotFleetRequestResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifySpotFleetRequestResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifySpotFleetRequestResult(pd) = parse_from_xml(ModifySpotFleetRequestResult, EC2TypeDict, pd)
end # ModifySpotFleetRequestResult
export ModifySpotFleetRequestResult

type ModifySpotFleetRequestRequest <: AbstractAWSType
    excessCapacityTerminationPolicy::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    targetCapacity::Union{Void,Int64}
    function ModifySpotFleetRequestRequest(;excessCapacityTerminationPolicy=nothing, spotFleetRequestId=nothing, targetCapacity=nothing)
        new(excessCapacityTerminationPolicy, spotFleetRequestId, targetCapacity)
    end
    ModifySpotFleetRequestRequest(pd) = parse_from_xml(ModifySpotFleetRequestRequest, EC2TypeDict, pd)
end # ModifySpotFleetRequestRequest
export ModifySpotFleetRequestRequest

function ModifySpotFleetRequest(env::AWSEnv, msg::ModifySpotFleetRequestRequest)
    resp::EC2Response = ec2_execute(env, "ModifySpotFleetRequest", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifySpotFleetRequestResult(resp.pd)
    end
    resp
end
ModifySpotFleetRequest(env::AWSEnv; kwargs...) = ModifySpotFleetRequest(env, ModifySpotFleetRequestRequest(; kwargs...))
export ModifySpotFleetRequest

type DescribeScheduledInstanceAvailabilityResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    scheduledInstanceAvailabilitySet::Union{Void,Array{ScheduledInstanceAvailability,1}}
    function DescribeScheduledInstanceAvailabilityResult(;nextToken=nothing, requestId=nothing, scheduledInstanceAvailabilitySet=nothing)
        new(nextToken, requestId, scheduledInstanceAvailabilitySet)
    end
    DescribeScheduledInstanceAvailabilityResult(pd) = parse_from_xml(DescribeScheduledInstanceAvailabilityResult, EC2TypeDict, pd)
end # DescribeScheduledInstanceAvailabilityResult
export DescribeScheduledInstanceAvailabilityResult

type DescribeScheduledInstanceAvailabilityRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    firstSlotStartTimeRange::Union{Void,SlotDateTimeRangeRequest}
    maxResults::Union{Void,Int64}
    maxSlotDurationInHours::Union{Void,Int64}
    minSlotDurationInHours::Union{Void,Int64}
    nextToken::Union{Void,String}
    recurrence::Union{Void,ScheduledInstanceRecurrenceRequest}
    function DescribeScheduledInstanceAvailabilityRequest(;dryRun=nothing, filter=nothing, firstSlotStartTimeRange=nothing, maxResults=nothing, maxSlotDurationInHours=nothing, minSlotDurationInHours=nothing, nextToken=nothing, recurrence=nothing)
        new(dryRun, filter, firstSlotStartTimeRange, maxResults, maxSlotDurationInHours, minSlotDurationInHours, nextToken, recurrence)
    end
    DescribeScheduledInstanceAvailabilityRequest(pd) = parse_from_xml(DescribeScheduledInstanceAvailabilityRequest, EC2TypeDict, pd)
end # DescribeScheduledInstanceAvailabilityRequest
export DescribeScheduledInstanceAvailabilityRequest

function DescribeScheduledInstanceAvailability(env::AWSEnv, msg::DescribeScheduledInstanceAvailabilityRequest)
    resp::EC2Response = ec2_execute(env, "DescribeScheduledInstanceAvailability", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeScheduledInstanceAvailabilityResult(resp.pd)
    end
    resp
end
DescribeScheduledInstanceAvailability(env::AWSEnv; kwargs...) = DescribeScheduledInstanceAvailability(env, DescribeScheduledInstanceAvailabilityRequest(; kwargs...))
export DescribeScheduledInstanceAvailability

type ResetInstanceAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ResetInstanceAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ResetInstanceAttributeResult(pd) = parse_from_xml(ResetInstanceAttributeResult, EC2TypeDict, pd)
end # ResetInstanceAttributeResult
export ResetInstanceAttributeResult

type ResetInstanceAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    function ResetInstanceAttributeRequest(;attribute=nothing, dryRun=nothing, instanceId=nothing)
        new(attribute, dryRun, instanceId)
    end
    ResetInstanceAttributeRequest(pd) = parse_from_xml(ResetInstanceAttributeRequest, EC2TypeDict, pd)
end # ResetInstanceAttributeRequest
export ResetInstanceAttributeRequest

function ResetInstanceAttribute(env::AWSEnv, msg::ResetInstanceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ResetInstanceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ResetInstanceAttributeResult(resp.pd)
    end
    resp
end
ResetInstanceAttribute(env::AWSEnv; kwargs...) = ResetInstanceAttribute(env, ResetInstanceAttributeRequest(; kwargs...))
export ResetInstanceAttribute

type AttachClassicLinkVpcResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AttachClassicLinkVpcResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AttachClassicLinkVpcResult(pd) = parse_from_xml(AttachClassicLinkVpcResult, EC2TypeDict, pd)
end # AttachClassicLinkVpcResult
export AttachClassicLinkVpcResult

type AttachClassicLinkVpcRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    securityGroupId::Union{Void,Array{String,1}}
    vpcId::Union{Void,String}
    function AttachClassicLinkVpcRequest(;dryRun=nothing, instanceId=nothing, securityGroupId=nothing, vpcId=nothing)
        new(dryRun, instanceId, securityGroupId, vpcId)
    end
    AttachClassicLinkVpcRequest(pd) = parse_from_xml(AttachClassicLinkVpcRequest, EC2TypeDict, pd)
end # AttachClassicLinkVpcRequest
export AttachClassicLinkVpcRequest

function AttachClassicLinkVpc(env::AWSEnv, msg::AttachClassicLinkVpcRequest)
    resp::EC2Response = ec2_execute(env, "AttachClassicLinkVpc", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AttachClassicLinkVpcResult(resp.pd)
    end
    resp
end
AttachClassicLinkVpc(env::AWSEnv; kwargs...) = AttachClassicLinkVpc(env, AttachClassicLinkVpcRequest(; kwargs...))
export AttachClassicLinkVpc

type EnableVpcClassicLinkDnsSupportResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function EnableVpcClassicLinkDnsSupportResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    EnableVpcClassicLinkDnsSupportResult(pd) = parse_from_xml(EnableVpcClassicLinkDnsSupportResult, EC2TypeDict, pd)
end # EnableVpcClassicLinkDnsSupportResult
export EnableVpcClassicLinkDnsSupportResult

type EnableVpcClassicLinkDnsSupportRequest <: AbstractAWSType
    vpcId::Union{Void,String}
    function EnableVpcClassicLinkDnsSupportRequest(;vpcId=nothing)
        new(vpcId)
    end
    EnableVpcClassicLinkDnsSupportRequest(pd) = parse_from_xml(EnableVpcClassicLinkDnsSupportRequest, EC2TypeDict, pd)
end # EnableVpcClassicLinkDnsSupportRequest
export EnableVpcClassicLinkDnsSupportRequest

function EnableVpcClassicLinkDnsSupport(env::AWSEnv, msg::EnableVpcClassicLinkDnsSupportRequest)
    resp::EC2Response = ec2_execute(env, "EnableVpcClassicLinkDnsSupport", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = EnableVpcClassicLinkDnsSupportResult(resp.pd)
    end
    resp
end
EnableVpcClassicLinkDnsSupport(env::AWSEnv; kwargs...) = EnableVpcClassicLinkDnsSupport(env, EnableVpcClassicLinkDnsSupportRequest(; kwargs...))
export EnableVpcClassicLinkDnsSupport

type CreateRouteResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CreateRouteResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CreateRouteResult(pd) = parse_from_xml(CreateRouteResult, EC2TypeDict, pd)
end # CreateRouteResult
export CreateRouteResult

type CreateRouteRequest <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    destinationIpv6CidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    egressOnlyInternetGatewayId::Union{Void,String}
    gatewayId::Union{Void,String}
    instanceId::Union{Void,String}
    natGatewayId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    routeTableId::Union{Void,String}
    vpcPeeringConnectionId::Union{Void,String}
    function CreateRouteRequest(;destinationCidrBlock=nothing, destinationIpv6CidrBlock=nothing, dryRun=nothing, egressOnlyInternetGatewayId=nothing, gatewayId=nothing, instanceId=nothing, natGatewayId=nothing, networkInterfaceId=nothing, routeTableId=nothing, vpcPeeringConnectionId=nothing)
        new(destinationCidrBlock, destinationIpv6CidrBlock, dryRun, egressOnlyInternetGatewayId, gatewayId, instanceId, natGatewayId, networkInterfaceId, routeTableId, vpcPeeringConnectionId)
    end
    CreateRouteRequest(pd) = parse_from_xml(CreateRouteRequest, EC2TypeDict, pd)
end # CreateRouteRequest
export CreateRouteRequest

function CreateRoute(env::AWSEnv, msg::CreateRouteRequest)
    resp::EC2Response = ec2_execute(env, "CreateRoute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateRouteResult(resp.pd)
    end
    resp
end
CreateRoute(env::AWSEnv; kwargs...) = CreateRoute(env, CreateRouteRequest(; kwargs...))
export CreateRoute

type DescribeNetworkInterfacePermissionsResult <: AbstractAWSType
    networkInterfacePermissions::Union{Void,Array{NetworkInterfacePermission,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeNetworkInterfacePermissionsResult(;networkInterfacePermissions=nothing, nextToken=nothing, requestId=nothing)
        new(networkInterfacePermissions, nextToken, requestId)
    end
    DescribeNetworkInterfacePermissionsResult(pd) = parse_from_xml(DescribeNetworkInterfacePermissionsResult, EC2TypeDict, pd)
end # DescribeNetworkInterfacePermissionsResult
export DescribeNetworkInterfacePermissionsResult

type DescribeNetworkInterfacePermissionsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    networkInterfacePermissionId::Union{Void,Array{String,1}}
    nextToken::Union{Void,String}
    function DescribeNetworkInterfacePermissionsRequest(;filter=nothing, maxResults=nothing, networkInterfacePermissionId=nothing, nextToken=nothing)
        new(filter, maxResults, networkInterfacePermissionId, nextToken)
    end
    DescribeNetworkInterfacePermissionsRequest(pd) = parse_from_xml(DescribeNetworkInterfacePermissionsRequest, EC2TypeDict, pd)
end # DescribeNetworkInterfacePermissionsRequest
export DescribeNetworkInterfacePermissionsRequest

function DescribeNetworkInterfacePermissions(env::AWSEnv, msg::DescribeNetworkInterfacePermissionsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeNetworkInterfacePermissions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNetworkInterfacePermissionsResult(resp.pd)
    end
    resp
end
DescribeNetworkInterfacePermissions(env::AWSEnv; kwargs...) = DescribeNetworkInterfacePermissions(env, DescribeNetworkInterfacePermissionsRequest(; kwargs...))
export DescribeNetworkInterfacePermissions

type AssociateRouteTableResult <: AbstractAWSType
    associationId::Union{Void,String}
    requestId::Union{Void,String}
    function AssociateRouteTableResult(;associationId=nothing, requestId=nothing)
        new(associationId, requestId)
    end
    AssociateRouteTableResult(pd) = parse_from_xml(AssociateRouteTableResult, EC2TypeDict, pd)
end # AssociateRouteTableResult
export AssociateRouteTableResult

type AssociateRouteTableRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    routeTableId::Union{Void,String}
    subnetId::Union{Void,String}
    function AssociateRouteTableRequest(;dryRun=nothing, routeTableId=nothing, subnetId=nothing)
        new(dryRun, routeTableId, subnetId)
    end
    AssociateRouteTableRequest(pd) = parse_from_xml(AssociateRouteTableRequest, EC2TypeDict, pd)
end # AssociateRouteTableRequest
export AssociateRouteTableRequest

function AssociateRouteTable(env::AWSEnv, msg::AssociateRouteTableRequest)
    resp::EC2Response = ec2_execute(env, "AssociateRouteTable", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssociateRouteTableResult(resp.pd)
    end
    resp
end
AssociateRouteTable(env::AWSEnv; kwargs...) = AssociateRouteTable(env, AssociateRouteTableRequest(; kwargs...))
export AssociateRouteTable

type CreateReservedInstancesListingResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesListingsSet::Union{Void,Array{ReservedInstancesListing,1}}
    function CreateReservedInstancesListingResult(;requestId=nothing, reservedInstancesListingsSet=nothing)
        new(requestId, reservedInstancesListingsSet)
    end
    CreateReservedInstancesListingResult(pd) = parse_from_xml(CreateReservedInstancesListingResult, EC2TypeDict, pd)
end # CreateReservedInstancesListingResult
export CreateReservedInstancesListingResult

type CreateReservedInstancesListingRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    instanceCount::Union{Void,Int64}
    priceSchedules::Union{Void,Array{PriceScheduleSpecification,1}}
    reservedInstancesId::Union{Void,String}
    function CreateReservedInstancesListingRequest(;clientToken=nothing, instanceCount=nothing, priceSchedules=nothing, reservedInstancesId=nothing)
        new(clientToken, instanceCount, priceSchedules, reservedInstancesId)
    end
    CreateReservedInstancesListingRequest(pd) = parse_from_xml(CreateReservedInstancesListingRequest, EC2TypeDict, pd)
end # CreateReservedInstancesListingRequest
export CreateReservedInstancesListingRequest

function CreateReservedInstancesListing(env::AWSEnv, msg::CreateReservedInstancesListingRequest)
    resp::EC2Response = ec2_execute(env, "CreateReservedInstancesListing", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateReservedInstancesListingResult(resp.pd)
    end
    resp
end
CreateReservedInstancesListing(env::AWSEnv; kwargs...) = CreateReservedInstancesListing(env, CreateReservedInstancesListingRequest(; kwargs...))
export CreateReservedInstancesListing

type ResetNetworkInterfaceAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ResetNetworkInterfaceAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ResetNetworkInterfaceAttributeResult(pd) = parse_from_xml(ResetNetworkInterfaceAttributeResult, EC2TypeDict, pd)
end # ResetNetworkInterfaceAttributeResult
export ResetNetworkInterfaceAttributeResult

type ResetNetworkInterfaceAttributeRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    sourceDestCheck::Union{Void,String}
    function ResetNetworkInterfaceAttributeRequest(;dryRun=nothing, networkInterfaceId=nothing, sourceDestCheck=nothing)
        new(dryRun, networkInterfaceId, sourceDestCheck)
    end
    ResetNetworkInterfaceAttributeRequest(pd) = parse_from_xml(ResetNetworkInterfaceAttributeRequest, EC2TypeDict, pd)
end # ResetNetworkInterfaceAttributeRequest
export ResetNetworkInterfaceAttributeRequest

function ResetNetworkInterfaceAttribute(env::AWSEnv, msg::ResetNetworkInterfaceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ResetNetworkInterfaceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ResetNetworkInterfaceAttributeResult(resp.pd)
    end
    resp
end
ResetNetworkInterfaceAttribute(env::AWSEnv; kwargs...) = ResetNetworkInterfaceAttribute(env, ResetNetworkInterfaceAttributeRequest(; kwargs...))
export ResetNetworkInterfaceAttribute

type DescribeVpcEndpointServicesResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    serviceNameSet::Union{Void,Array{String,1}}
    function DescribeVpcEndpointServicesResult(;nextToken=nothing, requestId=nothing, serviceNameSet=nothing)
        new(nextToken, requestId, serviceNameSet)
    end
    DescribeVpcEndpointServicesResult(pd) = parse_from_xml(DescribeVpcEndpointServicesResult, EC2TypeDict, pd)
end # DescribeVpcEndpointServicesResult
export DescribeVpcEndpointServicesResult

type DescribeVpcEndpointServicesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeVpcEndpointServicesRequest(;dryRun=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, maxResults, nextToken)
    end
    DescribeVpcEndpointServicesRequest(pd) = parse_from_xml(DescribeVpcEndpointServicesRequest, EC2TypeDict, pd)
end # DescribeVpcEndpointServicesRequest
export DescribeVpcEndpointServicesRequest

function DescribeVpcEndpointServices(env::AWSEnv, msg::DescribeVpcEndpointServicesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcEndpointServices", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcEndpointServicesResult(resp.pd)
    end
    resp
end
DescribeVpcEndpointServices(env::AWSEnv; kwargs...) = DescribeVpcEndpointServices(env, DescribeVpcEndpointServicesRequest(; kwargs...))
export DescribeVpcEndpointServices

type RegisterImageResult <: AbstractAWSType
    imageId::Union{Void,String}
    requestId::Union{Void,String}
    function RegisterImageResult(;imageId=nothing, requestId=nothing)
        new(imageId, requestId)
    end
    RegisterImageResult(pd) = parse_from_xml(RegisterImageResult, EC2TypeDict, pd)
end # RegisterImageResult
export RegisterImageResult

type RegisterImageRequest <: AbstractAWSType
    architecture::Union{Void,String}
    billingProduct::Union{Void,Array{String,1}}
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    enaSupport::Union{Void,Bool}
    imageLocation::Union{Void,String}
    kernelId::Union{Void,String}
    name::Union{Void,String}
    ramdiskId::Union{Void,String}
    rootDeviceName::Union{Void,String}
    sriovNetSupport::Union{Void,String}
    virtualizationType::Union{Void,String}
    function RegisterImageRequest(;architecture=nothing, billingProduct=nothing, blockDeviceMapping=nothing, description=nothing, dryRun=nothing, enaSupport=nothing, imageLocation=nothing, kernelId=nothing, name=nothing, ramdiskId=nothing, rootDeviceName=nothing, sriovNetSupport=nothing, virtualizationType=nothing)
        new(architecture, billingProduct, blockDeviceMapping, description, dryRun, enaSupport, imageLocation, kernelId, name, ramdiskId, rootDeviceName, sriovNetSupport, virtualizationType)
    end
    RegisterImageRequest(pd) = parse_from_xml(RegisterImageRequest, EC2TypeDict, pd)
end # RegisterImageRequest
export RegisterImageRequest

function RegisterImage(env::AWSEnv, msg::RegisterImageRequest)
    resp::EC2Response = ec2_execute(env, "RegisterImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RegisterImageResult(resp.pd)
    end
    resp
end
RegisterImage(env::AWSEnv; kwargs...) = RegisterImage(env, RegisterImageRequest(; kwargs...))
export RegisterImage

type RunInstancesResult <: AbstractAWSType
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    instancesSet::Union{Void,Array{Instance,1}}
    ownerId::Union{Void,String}
    requesterId::Union{Void,String}
    requestId::Union{Void,String}
    reservationId::Union{Void,String}
    function RunInstancesResult(;groupSet=nothing, instancesSet=nothing, ownerId=nothing, requesterId=nothing, requestId=nothing, reservationId=nothing)
        new(groupSet, instancesSet, ownerId, requesterId, requestId, reservationId)
    end
    RunInstancesResult(pd) = parse_from_xml(RunInstancesResult, EC2TypeDict, pd)
end # RunInstancesResult
export RunInstancesResult

type RunInstancesRequest <: AbstractAWSType
    additionalInfo::Union{Void,String}
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    clientToken::Union{Void,String}
    disableApiTermination::Union{Void,Bool}
    dryRun::Union{Void,Bool}
    ebsOptimized::Union{Void,Bool}
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    imageId::Union{Void,String}
    instanceInitiatedShutdownBehavior::Union{Void,String}
    instanceType::Union{Void,String}
    ipv6Address::Union{Void,Array{InstanceIpv6Address,1}}
    ipv6AddressCount::Union{Void,Int64}
    kernelId::Union{Void,String}
    keyName::Union{Void,String}
    maxCount::Union{Void,Int64}
    minCount::Union{Void,Int64}
    monitoring::Union{Void,RunInstancesMonitoringEnabled}
    networkInterface::Union{Void,Array{InstanceNetworkInterfaceSpecification,1}}
    placement::Union{Void,Placement}
    privateIpAddress::Union{Void,String}
    ramdiskId::Union{Void,String}
    securityGroup::Union{Void,Array{String,1}}
    securityGroupId::Union{Void,Array{String,1}}
    subnetId::Union{Void,String}
    tagSpecification::Union{Void,Array{TagSpecification,1}}
    userData::Union{Void,String}
    function RunInstancesRequest(;additionalInfo=nothing, blockDeviceMapping=nothing, clientToken=nothing, disableApiTermination=nothing, dryRun=nothing, ebsOptimized=nothing, iamInstanceProfile=nothing, imageId=nothing, instanceInitiatedShutdownBehavior=nothing, instanceType=nothing, ipv6Address=nothing, ipv6AddressCount=nothing, kernelId=nothing, keyName=nothing, maxCount=nothing, minCount=nothing, monitoring=nothing, networkInterface=nothing, placement=nothing, privateIpAddress=nothing, ramdiskId=nothing, securityGroup=nothing, securityGroupId=nothing, subnetId=nothing, tagSpecification=nothing, userData=nothing)
        new(additionalInfo, blockDeviceMapping, clientToken, disableApiTermination, dryRun, ebsOptimized, iamInstanceProfile, imageId, instanceInitiatedShutdownBehavior, instanceType, ipv6Address, ipv6AddressCount, kernelId, keyName, maxCount, minCount, monitoring, networkInterface, placement, privateIpAddress, ramdiskId, securityGroup, securityGroupId, subnetId, tagSpecification, userData)
    end
    RunInstancesRequest(pd) = parse_from_xml(RunInstancesRequest, EC2TypeDict, pd)
end # RunInstancesRequest
export RunInstancesRequest

function RunInstances(env::AWSEnv, msg::RunInstancesRequest)
    resp::EC2Response = ec2_execute(env, "RunInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RunInstancesResult(resp.pd)
    end
    resp
end
RunInstances(env::AWSEnv; kwargs...) = RunInstances(env, RunInstancesRequest(; kwargs...))
export RunInstances

type DescribeConversionTasksResult <: AbstractAWSType
    conversionTasks::Union{Void,Array{ConversionTask,1}}
    requestId::Union{Void,String}
    function DescribeConversionTasksResult(;conversionTasks=nothing, requestId=nothing)
        new(conversionTasks, requestId)
    end
    DescribeConversionTasksResult(pd) = parse_from_xml(DescribeConversionTasksResult, EC2TypeDict, pd)
end # DescribeConversionTasksResult
export DescribeConversionTasksResult

type DescribeConversionTasksRequest <: AbstractAWSType
    conversionTaskId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    function DescribeConversionTasksRequest(;conversionTaskId=nothing, dryRun=nothing)
        new(conversionTaskId, dryRun)
    end
    DescribeConversionTasksRequest(pd) = parse_from_xml(DescribeConversionTasksRequest, EC2TypeDict, pd)
end # DescribeConversionTasksRequest
export DescribeConversionTasksRequest

function DescribeConversionTasks(env::AWSEnv, msg::DescribeConversionTasksRequest)
    resp::EC2Response = ec2_execute(env, "DescribeConversionTasks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeConversionTasksResult(resp.pd)
    end
    resp
end
DescribeConversionTasks(env::AWSEnv; kwargs...) = DescribeConversionTasks(env, DescribeConversionTasksRequest(; kwargs...))
export DescribeConversionTasks

type GetReservedInstancesExchangeQuoteResult <: AbstractAWSType
    currencyCode::Union{Void,String}
    isValidExchange::Union{Void,Bool}
    outputReservedInstancesWillExpireAt::Union{Void,DateTime}
    paymentDue::Union{Void,String}
    requestId::Union{Void,String}
    reservedInstanceValueRollup::Union{Void,ReservationValue}
    reservedInstanceValueSet::Union{Void,Array{ReservedInstanceReservationValue,1}}
    targetConfigurationValueRollup::Union{Void,ReservationValue}
    targetConfigurationValueSet::Union{Void,Array{TargetReservationValue,1}}
    validationFailureReason::Union{Void,String}
    function GetReservedInstancesExchangeQuoteResult(;currencyCode=nothing, isValidExchange=nothing, outputReservedInstancesWillExpireAt=nothing, paymentDue=nothing, requestId=nothing, reservedInstanceValueRollup=nothing, reservedInstanceValueSet=nothing, targetConfigurationValueRollup=nothing, targetConfigurationValueSet=nothing, validationFailureReason=nothing)
        new(currencyCode, isValidExchange, outputReservedInstancesWillExpireAt, paymentDue, requestId, reservedInstanceValueRollup, reservedInstanceValueSet, targetConfigurationValueRollup, targetConfigurationValueSet, validationFailureReason)
    end
    GetReservedInstancesExchangeQuoteResult(pd) = parse_from_xml(GetReservedInstancesExchangeQuoteResult, EC2TypeDict, pd)
end # GetReservedInstancesExchangeQuoteResult
export GetReservedInstancesExchangeQuoteResult

type GetReservedInstancesExchangeQuoteRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    reservedInstanceId::Union{Void,Array{String,1}}
    targetConfiguration::Union{Void,Array{TargetConfigurationRequest,1}}
    function GetReservedInstancesExchangeQuoteRequest(;dryRun=nothing, reservedInstanceId=nothing, targetConfiguration=nothing)
        new(dryRun, reservedInstanceId, targetConfiguration)
    end
    GetReservedInstancesExchangeQuoteRequest(pd) = parse_from_xml(GetReservedInstancesExchangeQuoteRequest, EC2TypeDict, pd)
end # GetReservedInstancesExchangeQuoteRequest
export GetReservedInstancesExchangeQuoteRequest

function GetReservedInstancesExchangeQuote(env::AWSEnv, msg::GetReservedInstancesExchangeQuoteRequest)
    resp::EC2Response = ec2_execute(env, "GetReservedInstancesExchangeQuote", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetReservedInstancesExchangeQuoteResult(resp.pd)
    end
    resp
end
GetReservedInstancesExchangeQuote(env::AWSEnv; kwargs...) = GetReservedInstancesExchangeQuote(env, GetReservedInstancesExchangeQuoteRequest(; kwargs...))
export GetReservedInstancesExchangeQuote

type DescribeNetworkInterfacesResult <: AbstractAWSType
    networkInterfaceSet::Union{Void,Array{NetworkInterface,1}}
    requestId::Union{Void,String}
    function DescribeNetworkInterfacesResult(;networkInterfaceSet=nothing, requestId=nothing)
        new(networkInterfaceSet, requestId)
    end
    DescribeNetworkInterfacesResult(pd) = parse_from_xml(DescribeNetworkInterfacesResult, EC2TypeDict, pd)
end # DescribeNetworkInterfacesResult
export DescribeNetworkInterfacesResult

type DescribeNetworkInterfacesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    networkInterfaceId::Union{Void,Array{String,1}}
    function DescribeNetworkInterfacesRequest(;dryRun=nothing, filter=nothing, networkInterfaceId=nothing)
        new(dryRun, filter, networkInterfaceId)
    end
    DescribeNetworkInterfacesRequest(pd) = parse_from_xml(DescribeNetworkInterfacesRequest, EC2TypeDict, pd)
end # DescribeNetworkInterfacesRequest
export DescribeNetworkInterfacesRequest

function DescribeNetworkInterfaces(env::AWSEnv, msg::DescribeNetworkInterfacesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeNetworkInterfaces", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNetworkInterfacesResult(resp.pd)
    end
    resp
end
DescribeNetworkInterfaces(env::AWSEnv; kwargs...) = DescribeNetworkInterfaces(env, DescribeNetworkInterfacesRequest(; kwargs...))
export DescribeNetworkInterfaces

type DisableVpcClassicLinkDnsSupportResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DisableVpcClassicLinkDnsSupportResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DisableVpcClassicLinkDnsSupportResult(pd) = parse_from_xml(DisableVpcClassicLinkDnsSupportResult, EC2TypeDict, pd)
end # DisableVpcClassicLinkDnsSupportResult
export DisableVpcClassicLinkDnsSupportResult

type DisableVpcClassicLinkDnsSupportRequest <: AbstractAWSType
    vpcId::Union{Void,String}
    function DisableVpcClassicLinkDnsSupportRequest(;vpcId=nothing)
        new(vpcId)
    end
    DisableVpcClassicLinkDnsSupportRequest(pd) = parse_from_xml(DisableVpcClassicLinkDnsSupportRequest, EC2TypeDict, pd)
end # DisableVpcClassicLinkDnsSupportRequest
export DisableVpcClassicLinkDnsSupportRequest

function DisableVpcClassicLinkDnsSupport(env::AWSEnv, msg::DisableVpcClassicLinkDnsSupportRequest)
    resp::EC2Response = ec2_execute(env, "DisableVpcClassicLinkDnsSupport", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisableVpcClassicLinkDnsSupportResult(resp.pd)
    end
    resp
end
DisableVpcClassicLinkDnsSupport(env::AWSEnv; kwargs...) = DisableVpcClassicLinkDnsSupport(env, DisableVpcClassicLinkDnsSupportRequest(; kwargs...))
export DisableVpcClassicLinkDnsSupport

type DescribePlacementGroupsResult <: AbstractAWSType
    placementGroupSet::Union{Void,Array{PlacementGroup,1}}
    requestId::Union{Void,String}
    function DescribePlacementGroupsResult(;placementGroupSet=nothing, requestId=nothing)
        new(placementGroupSet, requestId)
    end
    DescribePlacementGroupsResult(pd) = parse_from_xml(DescribePlacementGroupsResult, EC2TypeDict, pd)
end # DescribePlacementGroupsResult
export DescribePlacementGroupsResult

type DescribePlacementGroupsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    groupName::Union{Void,Array{String,1}}
    function DescribePlacementGroupsRequest(;dryRun=nothing, filter=nothing, groupName=nothing)
        new(dryRun, filter, groupName)
    end
    DescribePlacementGroupsRequest(pd) = parse_from_xml(DescribePlacementGroupsRequest, EC2TypeDict, pd)
end # DescribePlacementGroupsRequest
export DescribePlacementGroupsRequest

function DescribePlacementGroups(env::AWSEnv, msg::DescribePlacementGroupsRequest)
    resp::EC2Response = ec2_execute(env, "DescribePlacementGroups", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribePlacementGroupsResult(resp.pd)
    end
    resp
end
DescribePlacementGroups(env::AWSEnv; kwargs...) = DescribePlacementGroups(env, DescribePlacementGroupsRequest(; kwargs...))
export DescribePlacementGroups

type CreatePlacementGroupResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CreatePlacementGroupResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CreatePlacementGroupResult(pd) = parse_from_xml(CreatePlacementGroupResult, EC2TypeDict, pd)
end # CreatePlacementGroupResult
export CreatePlacementGroupResult

type CreatePlacementGroupRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    groupName::Union{Void,String}
    strategy::Union{Void,String}
    function CreatePlacementGroupRequest(;dryRun=nothing, groupName=nothing, strategy=nothing)
        new(dryRun, groupName, strategy)
    end
    CreatePlacementGroupRequest(pd) = parse_from_xml(CreatePlacementGroupRequest, EC2TypeDict, pd)
end # CreatePlacementGroupRequest
export CreatePlacementGroupRequest

function CreatePlacementGroup(env::AWSEnv, msg::CreatePlacementGroupRequest)
    resp::EC2Response = ec2_execute(env, "CreatePlacementGroup", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreatePlacementGroupResult(resp.pd)
    end
    resp
end
CreatePlacementGroup(env::AWSEnv; kwargs...) = CreatePlacementGroup(env, CreatePlacementGroupRequest(; kwargs...))
export CreatePlacementGroup

type DeleteSecurityGroupResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteSecurityGroupResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteSecurityGroupResult(pd) = parse_from_xml(DeleteSecurityGroupResult, EC2TypeDict, pd)
end # DeleteSecurityGroupResult
export DeleteSecurityGroupResult

type DeleteSecurityGroupRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    groupId::Union{Void,String}
    groupName::Union{Void,String}
    function DeleteSecurityGroupRequest(;dryRun=nothing, groupId=nothing, groupName=nothing)
        new(dryRun, groupId, groupName)
    end
    DeleteSecurityGroupRequest(pd) = parse_from_xml(DeleteSecurityGroupRequest, EC2TypeDict, pd)
end # DeleteSecurityGroupRequest
export DeleteSecurityGroupRequest

function DeleteSecurityGroup(env::AWSEnv, msg::DeleteSecurityGroupRequest)
    resp::EC2Response = ec2_execute(env, "DeleteSecurityGroup", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteSecurityGroupResult(resp.pd)
    end
    resp
end
DeleteSecurityGroup(env::AWSEnv; kwargs...) = DeleteSecurityGroup(env, DeleteSecurityGroupRequest(; kwargs...))
export DeleteSecurityGroup

type DescribeVpnGatewaysResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpnGatewaySet::Union{Void,Array{VpnGateway,1}}
    function DescribeVpnGatewaysResult(;requestId=nothing, vpnGatewaySet=nothing)
        new(requestId, vpnGatewaySet)
    end
    DescribeVpnGatewaysResult(pd) = parse_from_xml(DescribeVpnGatewaysResult, EC2TypeDict, pd)
end # DescribeVpnGatewaysResult
export DescribeVpnGatewaysResult

type DescribeVpnGatewaysRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    vpnGatewayId::Union{Void,Array{String,1}}
    function DescribeVpnGatewaysRequest(;dryRun=nothing, filter=nothing, vpnGatewayId=nothing)
        new(dryRun, filter, vpnGatewayId)
    end
    DescribeVpnGatewaysRequest(pd) = parse_from_xml(DescribeVpnGatewaysRequest, EC2TypeDict, pd)
end # DescribeVpnGatewaysRequest
export DescribeVpnGatewaysRequest

function DescribeVpnGateways(env::AWSEnv, msg::DescribeVpnGatewaysRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpnGateways", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpnGatewaysResult(resp.pd)
    end
    resp
end
DescribeVpnGateways(env::AWSEnv; kwargs...) = DescribeVpnGateways(env, DescribeVpnGatewaysRequest(; kwargs...))
export DescribeVpnGateways

type CreateInstanceExportTaskResult <: AbstractAWSType
    exportTask::Union{Void,ExportTask}
    requestId::Union{Void,String}
    function CreateInstanceExportTaskResult(;exportTask=nothing, requestId=nothing)
        new(exportTask, requestId)
    end
    CreateInstanceExportTaskResult(pd) = parse_from_xml(CreateInstanceExportTaskResult, EC2TypeDict, pd)
end # CreateInstanceExportTaskResult
export CreateInstanceExportTaskResult

type CreateInstanceExportTaskRequest <: AbstractAWSType
    description::Union{Void,String}
    exportToS3::Union{Void,ExportToS3TaskSpecification}
    instanceId::Union{Void,String}
    targetEnvironment::Union{Void,String}
    function CreateInstanceExportTaskRequest(;description=nothing, exportToS3=nothing, instanceId=nothing, targetEnvironment=nothing)
        new(description, exportToS3, instanceId, targetEnvironment)
    end
    CreateInstanceExportTaskRequest(pd) = parse_from_xml(CreateInstanceExportTaskRequest, EC2TypeDict, pd)
end # CreateInstanceExportTaskRequest
export CreateInstanceExportTaskRequest

function CreateInstanceExportTask(env::AWSEnv, msg::CreateInstanceExportTaskRequest)
    resp::EC2Response = ec2_execute(env, "CreateInstanceExportTask", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateInstanceExportTaskResult(resp.pd)
    end
    resp
end
CreateInstanceExportTask(env::AWSEnv; kwargs...) = CreateInstanceExportTask(env, CreateInstanceExportTaskRequest(; kwargs...))
export CreateInstanceExportTask

type ModifyVolumeResult <: AbstractAWSType
    requestId::Union{Void,String}
    volumeModification::Union{Void,VolumeModification}
    function ModifyVolumeResult(;requestId=nothing, volumeModification=nothing)
        new(requestId, volumeModification)
    end
    ModifyVolumeResult(pd) = parse_from_xml(ModifyVolumeResult, EC2TypeDict, pd)
end # ModifyVolumeResult
export ModifyVolumeResult

type ModifyVolumeRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    iops::Union{Void,Int64}
    size::Union{Void,Int64}
    volumeId::Union{Void,String}
    volumeType::Union{Void,String}
    function ModifyVolumeRequest(;dryRun=nothing, iops=nothing, size=nothing, volumeId=nothing, volumeType=nothing)
        new(dryRun, iops, size, volumeId, volumeType)
    end
    ModifyVolumeRequest(pd) = parse_from_xml(ModifyVolumeRequest, EC2TypeDict, pd)
end # ModifyVolumeRequest
export ModifyVolumeRequest

function ModifyVolume(env::AWSEnv, msg::ModifyVolumeRequest)
    resp::EC2Response = ec2_execute(env, "ModifyVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyVolumeResult(resp.pd)
    end
    resp
end
ModifyVolume(env::AWSEnv; kwargs...) = ModifyVolume(env, ModifyVolumeRequest(; kwargs...))
export ModifyVolume

type DeleteFlowLogsResult <: AbstractAWSType
    requestId::Union{Void,String}
    unsuccessful::Union{Void,Array{UnsuccessfulItem,1}}
    function DeleteFlowLogsResult(;requestId=nothing, unsuccessful=nothing)
        new(requestId, unsuccessful)
    end
    DeleteFlowLogsResult(pd) = parse_from_xml(DeleteFlowLogsResult, EC2TypeDict, pd)
end # DeleteFlowLogsResult
export DeleteFlowLogsResult

type DeleteFlowLogsRequest <: AbstractAWSType
    flowLogId::Union{Void,Array{String,1}}
    function DeleteFlowLogsRequest(;flowLogId=nothing)
        new(flowLogId)
    end
    DeleteFlowLogsRequest(pd) = parse_from_xml(DeleteFlowLogsRequest, EC2TypeDict, pd)
end # DeleteFlowLogsRequest
export DeleteFlowLogsRequest

function DeleteFlowLogs(env::AWSEnv, msg::DeleteFlowLogsRequest)
    resp::EC2Response = ec2_execute(env, "DeleteFlowLogs", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteFlowLogsResult(resp.pd)
    end
    resp
end
DeleteFlowLogs(env::AWSEnv; kwargs...) = DeleteFlowLogs(env, DeleteFlowLogsRequest(; kwargs...))
export DeleteFlowLogs

type BundleInstanceResult <: AbstractAWSType
    bundleInstanceTask::Union{Void,BundleTask}
    requestId::Union{Void,String}
    function BundleInstanceResult(;bundleInstanceTask=nothing, requestId=nothing)
        new(bundleInstanceTask, requestId)
    end
    BundleInstanceResult(pd) = parse_from_xml(BundleInstanceResult, EC2TypeDict, pd)
end # BundleInstanceResult
export BundleInstanceResult

type BundleInstanceRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    storage::Union{Void,String}
    function BundleInstanceRequest(;dryRun=nothing, instanceId=nothing, storage=nothing)
        new(dryRun, instanceId, storage)
    end
    BundleInstanceRequest(pd) = parse_from_xml(BundleInstanceRequest, EC2TypeDict, pd)
end # BundleInstanceRequest
export BundleInstanceRequest

function BundleInstance(env::AWSEnv, msg::BundleInstanceRequest)
    resp::EC2Response = ec2_execute(env, "BundleInstance", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = BundleInstanceResult(resp.pd)
    end
    resp
end
BundleInstance(env::AWSEnv; kwargs...) = BundleInstance(env, BundleInstanceRequest(; kwargs...))
export BundleInstance

type DisableVgwRoutePropagationResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DisableVgwRoutePropagationResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DisableVgwRoutePropagationResult(pd) = parse_from_xml(DisableVgwRoutePropagationResult, EC2TypeDict, pd)
end # DisableVgwRoutePropagationResult
export DisableVgwRoutePropagationResult

type DisableVgwRoutePropagationRequest <: AbstractAWSType
    gatewayId::Union{Void,String}
    routeTableId::Union{Void,String}
    function DisableVgwRoutePropagationRequest(;gatewayId=nothing, routeTableId=nothing)
        new(gatewayId, routeTableId)
    end
    DisableVgwRoutePropagationRequest(pd) = parse_from_xml(DisableVgwRoutePropagationRequest, EC2TypeDict, pd)
end # DisableVgwRoutePropagationRequest
export DisableVgwRoutePropagationRequest

function DisableVgwRoutePropagation(env::AWSEnv, msg::DisableVgwRoutePropagationRequest)
    resp::EC2Response = ec2_execute(env, "DisableVgwRoutePropagation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisableVgwRoutePropagationResult(resp.pd)
    end
    resp
end
DisableVgwRoutePropagation(env::AWSEnv; kwargs...) = DisableVgwRoutePropagation(env, DisableVgwRoutePropagationRequest(; kwargs...))
export DisableVgwRoutePropagation

type DescribeFpgaImagesResult <: AbstractAWSType
    fpgaImageSet::Union{Void,Array{FpgaImage,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeFpgaImagesResult(;fpgaImageSet=nothing, nextToken=nothing, requestId=nothing)
        new(fpgaImageSet, nextToken, requestId)
    end
    DescribeFpgaImagesResult(pd) = parse_from_xml(DescribeFpgaImagesResult, EC2TypeDict, pd)
end # DescribeFpgaImagesResult
export DescribeFpgaImagesResult

type DescribeFpgaImagesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    fpgaImageId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    owner::Union{Void,Array{String,1}}
    function DescribeFpgaImagesRequest(;dryRun=nothing, filter=nothing, fpgaImageId=nothing, maxResults=nothing, nextToken=nothing, owner=nothing)
        new(dryRun, filter, fpgaImageId, maxResults, nextToken, owner)
    end
    DescribeFpgaImagesRequest(pd) = parse_from_xml(DescribeFpgaImagesRequest, EC2TypeDict, pd)
end # DescribeFpgaImagesRequest
export DescribeFpgaImagesRequest

function DescribeFpgaImages(env::AWSEnv, msg::DescribeFpgaImagesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeFpgaImages", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeFpgaImagesResult(resp.pd)
    end
    resp
end
DescribeFpgaImages(env::AWSEnv; kwargs...) = DescribeFpgaImages(env, DescribeFpgaImagesRequest(; kwargs...))
export DescribeFpgaImages

type DeleteVpnConnectionRouteResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVpnConnectionRouteResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVpnConnectionRouteResult(pd) = parse_from_xml(DeleteVpnConnectionRouteResult, EC2TypeDict, pd)
end # DeleteVpnConnectionRouteResult
export DeleteVpnConnectionRouteResult

type DeleteVpnConnectionRouteRequest <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    vpnConnectionId::Union{Void,String}
    function DeleteVpnConnectionRouteRequest(;destinationCidrBlock=nothing, vpnConnectionId=nothing)
        new(destinationCidrBlock, vpnConnectionId)
    end
    DeleteVpnConnectionRouteRequest(pd) = parse_from_xml(DeleteVpnConnectionRouteRequest, EC2TypeDict, pd)
end # DeleteVpnConnectionRouteRequest
export DeleteVpnConnectionRouteRequest

function DeleteVpnConnectionRoute(env::AWSEnv, msg::DeleteVpnConnectionRouteRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpnConnectionRoute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpnConnectionRouteResult(resp.pd)
    end
    resp
end
DeleteVpnConnectionRoute(env::AWSEnv; kwargs...) = DeleteVpnConnectionRoute(env, DeleteVpnConnectionRouteRequest(; kwargs...))
export DeleteVpnConnectionRoute

type ModifyInstancePlacementResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifyInstancePlacementResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifyInstancePlacementResult(pd) = parse_from_xml(ModifyInstancePlacementResult, EC2TypeDict, pd)
end # ModifyInstancePlacementResult
export ModifyInstancePlacementResult

type ModifyInstancePlacementRequest <: AbstractAWSType
    affinity::Union{Void,String}
    hostId::Union{Void,String}
    instanceId::Union{Void,String}
    tenancy::Union{Void,String}
    function ModifyInstancePlacementRequest(;affinity=nothing, hostId=nothing, instanceId=nothing, tenancy=nothing)
        new(affinity, hostId, instanceId, tenancy)
    end
    ModifyInstancePlacementRequest(pd) = parse_from_xml(ModifyInstancePlacementRequest, EC2TypeDict, pd)
end # ModifyInstancePlacementRequest
export ModifyInstancePlacementRequest

function ModifyInstancePlacement(env::AWSEnv, msg::ModifyInstancePlacementRequest)
    resp::EC2Response = ec2_execute(env, "ModifyInstancePlacement", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifyInstancePlacementResult(resp.pd)
    end
    resp
end
ModifyInstancePlacement(env::AWSEnv; kwargs...) = ModifyInstancePlacement(env, ModifyInstancePlacementRequest(; kwargs...))
export ModifyInstancePlacement

type DescribeAddressesResult <: AbstractAWSType
    addressesSet::Union{Void,Array{Address,1}}
    requestId::Union{Void,String}
    function DescribeAddressesResult(;addressesSet=nothing, requestId=nothing)
        new(addressesSet, requestId)
    end
    DescribeAddressesResult(pd) = parse_from_xml(DescribeAddressesResult, EC2TypeDict, pd)
end # DescribeAddressesResult
export DescribeAddressesResult

type DescribeAddressesRequest <: AbstractAWSType
    allocationId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    publicIp::Union{Void,Array{String,1}}
    function DescribeAddressesRequest(;allocationId=nothing, dryRun=nothing, filter=nothing, publicIp=nothing)
        new(allocationId, dryRun, filter, publicIp)
    end
    DescribeAddressesRequest(pd) = parse_from_xml(DescribeAddressesRequest, EC2TypeDict, pd)
end # DescribeAddressesRequest
export DescribeAddressesRequest

function DescribeAddresses(env::AWSEnv, msg::DescribeAddressesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeAddresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeAddressesResult(resp.pd)
    end
    resp
end
DescribeAddresses(env::AWSEnv; kwargs...) = DescribeAddresses(env, DescribeAddressesRequest(; kwargs...))
export DescribeAddresses

type CreateKeyPairResult <: AbstractAWSType
    keyFingerprint::Union{Void,String}
    keyMaterial::Union{Void,String}
    keyName::Union{Void,String}
    requestId::Union{Void,String}
    function CreateKeyPairResult(;keyFingerprint=nothing, keyMaterial=nothing, keyName=nothing, requestId=nothing)
        new(keyFingerprint, keyMaterial, keyName, requestId)
    end
    CreateKeyPairResult(pd) = parse_from_xml(CreateKeyPairResult, EC2TypeDict, pd)
end # CreateKeyPairResult
export CreateKeyPairResult

type CreateKeyPairRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    keyName::Union{Void,String}
    function CreateKeyPairRequest(;dryRun=nothing, keyName=nothing)
        new(dryRun, keyName)
    end
    CreateKeyPairRequest(pd) = parse_from_xml(CreateKeyPairRequest, EC2TypeDict, pd)
end # CreateKeyPairRequest
export CreateKeyPairRequest

function CreateKeyPair(env::AWSEnv, msg::CreateKeyPairRequest)
    resp::EC2Response = ec2_execute(env, "CreateKeyPair", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateKeyPairResult(resp.pd)
    end
    resp
end
CreateKeyPair(env::AWSEnv; kwargs...) = CreateKeyPair(env, CreateKeyPairRequest(; kwargs...))
export CreateKeyPair

type DescribeIamInstanceProfileAssociationsResult <: AbstractAWSType
    iamInstanceProfileAssociationSet::Union{Void,Array{IamInstanceProfileAssociation,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeIamInstanceProfileAssociationsResult(;iamInstanceProfileAssociationSet=nothing, nextToken=nothing, requestId=nothing)
        new(iamInstanceProfileAssociationSet, nextToken, requestId)
    end
    DescribeIamInstanceProfileAssociationsResult(pd) = parse_from_xml(DescribeIamInstanceProfileAssociationsResult, EC2TypeDict, pd)
end # DescribeIamInstanceProfileAssociationsResult
export DescribeIamInstanceProfileAssociationsResult

type DescribeIamInstanceProfileAssociationsRequest <: AbstractAWSType
    associationId::Union{Void,Array{String,1}}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeIamInstanceProfileAssociationsRequest(;associationId=nothing, filter=nothing, maxResults=nothing, nextToken=nothing)
        new(associationId, filter, maxResults, nextToken)
    end
    DescribeIamInstanceProfileAssociationsRequest(pd) = parse_from_xml(DescribeIamInstanceProfileAssociationsRequest, EC2TypeDict, pd)
end # DescribeIamInstanceProfileAssociationsRequest
export DescribeIamInstanceProfileAssociationsRequest

function DescribeIamInstanceProfileAssociations(env::AWSEnv, msg::DescribeIamInstanceProfileAssociationsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeIamInstanceProfileAssociations", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeIamInstanceProfileAssociationsResult(resp.pd)
    end
    resp
end
DescribeIamInstanceProfileAssociations(env::AWSEnv; kwargs...) = DescribeIamInstanceProfileAssociations(env, DescribeIamInstanceProfileAssociationsRequest(; kwargs...))
export DescribeIamInstanceProfileAssociations

type DescribeVolumesResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    volumeSet::Union{Void,Array{Volume,1}}
    function DescribeVolumesResult(;nextToken=nothing, requestId=nothing, volumeSet=nothing)
        new(nextToken, requestId, volumeSet)
    end
    DescribeVolumesResult(pd) = parse_from_xml(DescribeVolumesResult, EC2TypeDict, pd)
end # DescribeVolumesResult
export DescribeVolumesResult

type DescribeVolumesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    volumeId::Union{Void,Array{String,1}}
    function DescribeVolumesRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, volumeId=nothing)
        new(dryRun, filter, maxResults, nextToken, volumeId)
    end
    DescribeVolumesRequest(pd) = parse_from_xml(DescribeVolumesRequest, EC2TypeDict, pd)
end # DescribeVolumesRequest
export DescribeVolumesRequest

function DescribeVolumes(env::AWSEnv, msg::DescribeVolumesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVolumes", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVolumesResult(resp.pd)
    end
    resp
end
DescribeVolumes(env::AWSEnv; kwargs...) = DescribeVolumes(env, DescribeVolumesRequest(; kwargs...))
export DescribeVolumes

type DescribeSpotDatafeedSubscriptionResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotDatafeedSubscription::Union{Void,SpotDatafeedSubscription}
    function DescribeSpotDatafeedSubscriptionResult(;requestId=nothing, spotDatafeedSubscription=nothing)
        new(requestId, spotDatafeedSubscription)
    end
    DescribeSpotDatafeedSubscriptionResult(pd) = parse_from_xml(DescribeSpotDatafeedSubscriptionResult, EC2TypeDict, pd)
end # DescribeSpotDatafeedSubscriptionResult
export DescribeSpotDatafeedSubscriptionResult

type DescribeSpotDatafeedSubscriptionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    function DescribeSpotDatafeedSubscriptionRequest(;dryRun=nothing)
        new(dryRun)
    end
    DescribeSpotDatafeedSubscriptionRequest(pd) = parse_from_xml(DescribeSpotDatafeedSubscriptionRequest, EC2TypeDict, pd)
end # DescribeSpotDatafeedSubscriptionRequest
export DescribeSpotDatafeedSubscriptionRequest

function DescribeSpotDatafeedSubscription(env::AWSEnv, msg::DescribeSpotDatafeedSubscriptionRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotDatafeedSubscription", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotDatafeedSubscriptionResult(resp.pd)
    end
    resp
end
DescribeSpotDatafeedSubscription(env::AWSEnv; kwargs...) = DescribeSpotDatafeedSubscription(env, DescribeSpotDatafeedSubscriptionRequest(; kwargs...))
export DescribeSpotDatafeedSubscription

type AuthorizeSecurityGroupEgressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AuthorizeSecurityGroupEgressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AuthorizeSecurityGroupEgressResult(pd) = parse_from_xml(AuthorizeSecurityGroupEgressResult, EC2TypeDict, pd)
end # AuthorizeSecurityGroupEgressResult
export AuthorizeSecurityGroupEgressResult

type AuthorizeSecurityGroupEgressRequest <: AbstractAWSType
    cidrIp::Union{Void,String}
    dryRun::Union{Void,Bool}
    fromPort::Union{Void,Int64}
    groupId::Union{Void,String}
    ipPermissions::Union{Void,Array{IpPermission,1}}
    ipProtocol::Union{Void,String}
    sourceSecurityGroupName::Union{Void,String}
    sourceSecurityGroupOwnerId::Union{Void,String}
    toPort::Union{Void,Int64}
    function AuthorizeSecurityGroupEgressRequest(;cidrIp=nothing, dryRun=nothing, fromPort=nothing, groupId=nothing, ipPermissions=nothing, ipProtocol=nothing, sourceSecurityGroupName=nothing, sourceSecurityGroupOwnerId=nothing, toPort=nothing)
        new(cidrIp, dryRun, fromPort, groupId, ipPermissions, ipProtocol, sourceSecurityGroupName, sourceSecurityGroupOwnerId, toPort)
    end
    AuthorizeSecurityGroupEgressRequest(pd) = parse_from_xml(AuthorizeSecurityGroupEgressRequest, EC2TypeDict, pd)
end # AuthorizeSecurityGroupEgressRequest
export AuthorizeSecurityGroupEgressRequest

function AuthorizeSecurityGroupEgress(env::AWSEnv, msg::AuthorizeSecurityGroupEgressRequest)
    resp::EC2Response = ec2_execute(env, "AuthorizeSecurityGroupEgress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AuthorizeSecurityGroupEgressResult(resp.pd)
    end
    resp
end
AuthorizeSecurityGroupEgress(env::AWSEnv; kwargs...) = AuthorizeSecurityGroupEgress(env, AuthorizeSecurityGroupEgressRequest(; kwargs...))
export AuthorizeSecurityGroupEgress

type DescribeInstanceAttributeResult <: AbstractAWSType
    blockDeviceMapping::Union{Void,Array{InstanceBlockDeviceMapping,1}}
    disableApiTermination::Union{Void,AttributeBooleanValue}
    ebsOptimized::Union{Void,AttributeBooleanValue}
    enaSupport::Union{Void,AttributeBooleanValue}
    groupSet::Union{Void,Array{GroupIdentifier,1}}
    instanceId::Union{Void,String}
    instanceInitiatedShutdownBehavior::Union{Void,AttributeValue}
    instanceType::Union{Void,AttributeValue}
    kernel::Union{Void,AttributeValue}
    productCodes::Union{Void,Array{ProductCode,1}}
    ramdisk::Union{Void,AttributeValue}
    requestId::Union{Void,String}
    rootDeviceName::Union{Void,AttributeValue}
    sourceDestCheck::Union{Void,AttributeBooleanValue}
    sriovNetSupport::Union{Void,AttributeValue}
    userData::Union{Void,AttributeValue}
    function DescribeInstanceAttributeResult(;blockDeviceMapping=nothing, disableApiTermination=nothing, ebsOptimized=nothing, enaSupport=nothing, groupSet=nothing, instanceId=nothing, instanceInitiatedShutdownBehavior=nothing, instanceType=nothing, kernel=nothing, productCodes=nothing, ramdisk=nothing, requestId=nothing, rootDeviceName=nothing, sourceDestCheck=nothing, sriovNetSupport=nothing, userData=nothing)
        new(blockDeviceMapping, disableApiTermination, ebsOptimized, enaSupport, groupSet, instanceId, instanceInitiatedShutdownBehavior, instanceType, kernel, productCodes, ramdisk, requestId, rootDeviceName, sourceDestCheck, sriovNetSupport, userData)
    end
    DescribeInstanceAttributeResult(pd) = parse_from_xml(DescribeInstanceAttributeResult, EC2TypeDict, pd)
end # DescribeInstanceAttributeResult
export DescribeInstanceAttributeResult

type DescribeInstanceAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    function DescribeInstanceAttributeRequest(;attribute=nothing, dryRun=nothing, instanceId=nothing)
        new(attribute, dryRun, instanceId)
    end
    DescribeInstanceAttributeRequest(pd) = parse_from_xml(DescribeInstanceAttributeRequest, EC2TypeDict, pd)
end # DescribeInstanceAttributeRequest
export DescribeInstanceAttributeRequest

function DescribeInstanceAttribute(env::AWSEnv, msg::DescribeInstanceAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeInstanceAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeInstanceAttributeResult(resp.pd)
    end
    resp
end
DescribeInstanceAttribute(env::AWSEnv; kwargs...) = DescribeInstanceAttribute(env, DescribeInstanceAttributeRequest(; kwargs...))
export DescribeInstanceAttribute

type PurchaseHostReservationResult <: AbstractAWSType
    clientToken::Union{Void,String}
    currencyCode::Union{Void,String}
    purchase::Union{Void,Array{Purchase,1}}
    requestId::Union{Void,String}
    totalHourlyPrice::Union{Void,String}
    totalUpfrontPrice::Union{Void,String}
    function PurchaseHostReservationResult(;clientToken=nothing, currencyCode=nothing, purchase=nothing, requestId=nothing, totalHourlyPrice=nothing, totalUpfrontPrice=nothing)
        new(clientToken, currencyCode, purchase, requestId, totalHourlyPrice, totalUpfrontPrice)
    end
    PurchaseHostReservationResult(pd) = parse_from_xml(PurchaseHostReservationResult, EC2TypeDict, pd)
end # PurchaseHostReservationResult
export PurchaseHostReservationResult

type PurchaseHostReservationRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    currencyCode::Union{Void,String}
    hostIdSet::Union{Void,Array{String,1}}
    limitPrice::Union{Void,String}
    offeringId::Union{Void,String}
    function PurchaseHostReservationRequest(;clientToken=nothing, currencyCode=nothing, hostIdSet=nothing, limitPrice=nothing, offeringId=nothing)
        new(clientToken, currencyCode, hostIdSet, limitPrice, offeringId)
    end
    PurchaseHostReservationRequest(pd) = parse_from_xml(PurchaseHostReservationRequest, EC2TypeDict, pd)
end # PurchaseHostReservationRequest
export PurchaseHostReservationRequest

function PurchaseHostReservation(env::AWSEnv, msg::PurchaseHostReservationRequest)
    resp::EC2Response = ec2_execute(env, "PurchaseHostReservation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = PurchaseHostReservationResult(resp.pd)
    end
    resp
end
PurchaseHostReservation(env::AWSEnv; kwargs...) = PurchaseHostReservation(env, PurchaseHostReservationRequest(; kwargs...))
export PurchaseHostReservation

type DescribeSnapshotsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    snapshotSet::Union{Void,Array{Snapshot,1}}
    function DescribeSnapshotsResult(;nextToken=nothing, requestId=nothing, snapshotSet=nothing)
        new(nextToken, requestId, snapshotSet)
    end
    DescribeSnapshotsResult(pd) = parse_from_xml(DescribeSnapshotsResult, EC2TypeDict, pd)
end # DescribeSnapshotsResult
export DescribeSnapshotsResult

type DescribeSnapshotsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    owner::Union{Void,Array{String,1}}
    restorableBy::Union{Void,Array{String,1}}
    snapshotId::Union{Void,Array{String,1}}
    function DescribeSnapshotsRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, owner=nothing, restorableBy=nothing, snapshotId=nothing)
        new(dryRun, filter, maxResults, nextToken, owner, restorableBy, snapshotId)
    end
    DescribeSnapshotsRequest(pd) = parse_from_xml(DescribeSnapshotsRequest, EC2TypeDict, pd)
end # DescribeSnapshotsRequest
export DescribeSnapshotsRequest

function DescribeSnapshots(env::AWSEnv, msg::DescribeSnapshotsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSnapshots", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSnapshotsResult(resp.pd)
    end
    resp
end
DescribeSnapshots(env::AWSEnv; kwargs...) = DescribeSnapshots(env, DescribeSnapshotsRequest(; kwargs...))
export DescribeSnapshots

type AttachVolumeResult <: AbstractAWSType
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    device::Union{Void,String}
    instanceId::Union{Void,String}
    requestId::Union{Void,String}
    status::Union{Void,String}
    volumeId::Union{Void,String}
    function AttachVolumeResult(;attachTime=nothing, deleteOnTermination=nothing, device=nothing, instanceId=nothing, requestId=nothing, status=nothing, volumeId=nothing)
        new(attachTime, deleteOnTermination, device, instanceId, requestId, status, volumeId)
    end
    AttachVolumeResult(pd) = parse_from_xml(AttachVolumeResult, EC2TypeDict, pd)
end # AttachVolumeResult
export AttachVolumeResult

type AttachVolumeRequest <: AbstractAWSType
    device::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    volumeId::Union{Void,String}
    function AttachVolumeRequest(;device=nothing, dryRun=nothing, instanceId=nothing, volumeId=nothing)
        new(device, dryRun, instanceId, volumeId)
    end
    AttachVolumeRequest(pd) = parse_from_xml(AttachVolumeRequest, EC2TypeDict, pd)
end # AttachVolumeRequest
export AttachVolumeRequest

function AttachVolume(env::AWSEnv, msg::AttachVolumeRequest)
    resp::EC2Response = ec2_execute(env, "AttachVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AttachVolumeResult(resp.pd)
    end
    resp
end
AttachVolume(env::AWSEnv; kwargs...) = AttachVolume(env, AttachVolumeRequest(; kwargs...))
export AttachVolume

type DescribeReservedInstancesOfferingsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    reservedInstancesOfferingsSet::Union{Void,Array{ReservedInstancesOffering,1}}
    function DescribeReservedInstancesOfferingsResult(;nextToken=nothing, requestId=nothing, reservedInstancesOfferingsSet=nothing)
        new(nextToken, requestId, reservedInstancesOfferingsSet)
    end
    DescribeReservedInstancesOfferingsResult(pd) = parse_from_xml(DescribeReservedInstancesOfferingsResult, EC2TypeDict, pd)
end # DescribeReservedInstancesOfferingsResult
export DescribeReservedInstancesOfferingsResult

type DescribeReservedInstancesOfferingsRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    includeMarketplace::Union{Void,Bool}
    instanceTenancy::Union{Void,String}
    instanceType::Union{Void,String}
    maxDuration::Union{Void,Int64}
    maxInstanceCount::Union{Void,Int64}
    maxResults::Union{Void,Int64}
    minDuration::Union{Void,Int64}
    nextToken::Union{Void,String}
    offeringClass::Union{Void,String}
    offeringType::Union{Void,String}
    productDescription::Union{Void,String}
    reservedInstancesOfferingId::Union{Void,Array{String,1}}
    function DescribeReservedInstancesOfferingsRequest(;availabilityZone=nothing, dryRun=nothing, filter=nothing, includeMarketplace=nothing, instanceTenancy=nothing, instanceType=nothing, maxDuration=nothing, maxInstanceCount=nothing, maxResults=nothing, minDuration=nothing, nextToken=nothing, offeringClass=nothing, offeringType=nothing, productDescription=nothing, reservedInstancesOfferingId=nothing)
        new(availabilityZone, dryRun, filter, includeMarketplace, instanceTenancy, instanceType, maxDuration, maxInstanceCount, maxResults, minDuration, nextToken, offeringClass, offeringType, productDescription, reservedInstancesOfferingId)
    end
    DescribeReservedInstancesOfferingsRequest(pd) = parse_from_xml(DescribeReservedInstancesOfferingsRequest, EC2TypeDict, pd)
end # DescribeReservedInstancesOfferingsRequest
export DescribeReservedInstancesOfferingsRequest

function DescribeReservedInstancesOfferings(env::AWSEnv, msg::DescribeReservedInstancesOfferingsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeReservedInstancesOfferings", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeReservedInstancesOfferingsResult(resp.pd)
    end
    resp
end
DescribeReservedInstancesOfferings(env::AWSEnv; kwargs...) = DescribeReservedInstancesOfferings(env, DescribeReservedInstancesOfferingsRequest(; kwargs...))
export DescribeReservedInstancesOfferings

type CopyImageResult <: AbstractAWSType
    imageId::Union{Void,String}
    requestId::Union{Void,String}
    function CopyImageResult(;imageId=nothing, requestId=nothing)
        new(imageId, requestId)
    end
    CopyImageResult(pd) = parse_from_xml(CopyImageResult, EC2TypeDict, pd)
end # CopyImageResult
export CopyImageResult

type CopyImageRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    encrypted::Union{Void,Bool}
    kmsKeyId::Union{Void,String}
    name::Union{Void,String}
    sourceImageId::Union{Void,String}
    sourceRegion::Union{Void,String}
    function CopyImageRequest(;clientToken=nothing, description=nothing, dryRun=nothing, encrypted=nothing, kmsKeyId=nothing, name=nothing, sourceImageId=nothing, sourceRegion=nothing)
        new(clientToken, description, dryRun, encrypted, kmsKeyId, name, sourceImageId, sourceRegion)
    end
    CopyImageRequest(pd) = parse_from_xml(CopyImageRequest, EC2TypeDict, pd)
end # CopyImageRequest
export CopyImageRequest

function CopyImage(env::AWSEnv, msg::CopyImageRequest)
    resp::EC2Response = ec2_execute(env, "CopyImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CopyImageResult(resp.pd)
    end
    resp
end
CopyImage(env::AWSEnv; kwargs...) = CopyImage(env, CopyImageRequest(; kwargs...))
export CopyImage

type ResetSnapshotAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ResetSnapshotAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ResetSnapshotAttributeResult(pd) = parse_from_xml(ResetSnapshotAttributeResult, EC2TypeDict, pd)
end # ResetSnapshotAttributeResult
export ResetSnapshotAttributeResult

type ResetSnapshotAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    snapshotId::Union{Void,String}
    function ResetSnapshotAttributeRequest(;attribute=nothing, dryRun=nothing, snapshotId=nothing)
        new(attribute, dryRun, snapshotId)
    end
    ResetSnapshotAttributeRequest(pd) = parse_from_xml(ResetSnapshotAttributeRequest, EC2TypeDict, pd)
end # ResetSnapshotAttributeRequest
export ResetSnapshotAttributeRequest

function ResetSnapshotAttribute(env::AWSEnv, msg::ResetSnapshotAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ResetSnapshotAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ResetSnapshotAttributeResult(resp.pd)
    end
    resp
end
ResetSnapshotAttribute(env::AWSEnv; kwargs...) = ResetSnapshotAttribute(env, ResetSnapshotAttributeRequest(; kwargs...))
export ResetSnapshotAttribute

type ReplaceIamInstanceProfileAssociationResult <: AbstractAWSType
    iamInstanceProfileAssociation::Union{Void,IamInstanceProfileAssociation}
    requestId::Union{Void,String}
    function ReplaceIamInstanceProfileAssociationResult(;iamInstanceProfileAssociation=nothing, requestId=nothing)
        new(iamInstanceProfileAssociation, requestId)
    end
    ReplaceIamInstanceProfileAssociationResult(pd) = parse_from_xml(ReplaceIamInstanceProfileAssociationResult, EC2TypeDict, pd)
end # ReplaceIamInstanceProfileAssociationResult
export ReplaceIamInstanceProfileAssociationResult

type ReplaceIamInstanceProfileAssociationRequest <: AbstractAWSType
    associationId::Union{Void,String}
    iamInstanceProfile::Union{Void,IamInstanceProfileSpecification}
    function ReplaceIamInstanceProfileAssociationRequest(;associationId=nothing, iamInstanceProfile=nothing)
        new(associationId, iamInstanceProfile)
    end
    ReplaceIamInstanceProfileAssociationRequest(pd) = parse_from_xml(ReplaceIamInstanceProfileAssociationRequest, EC2TypeDict, pd)
end # ReplaceIamInstanceProfileAssociationRequest
export ReplaceIamInstanceProfileAssociationRequest

function ReplaceIamInstanceProfileAssociation(env::AWSEnv, msg::ReplaceIamInstanceProfileAssociationRequest)
    resp::EC2Response = ec2_execute(env, "ReplaceIamInstanceProfileAssociation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReplaceIamInstanceProfileAssociationResult(resp.pd)
    end
    resp
end
ReplaceIamInstanceProfileAssociation(env::AWSEnv; kwargs...) = ReplaceIamInstanceProfileAssociation(env, ReplaceIamInstanceProfileAssociationRequest(; kwargs...))
export ReplaceIamInstanceProfileAssociation

type AssignPrivateIpAddressesResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AssignPrivateIpAddressesResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AssignPrivateIpAddressesResult(pd) = parse_from_xml(AssignPrivateIpAddressesResult, EC2TypeDict, pd)
end # AssignPrivateIpAddressesResult
export AssignPrivateIpAddressesResult

type AssignPrivateIpAddressesRequest <: AbstractAWSType
    allowReassignment::Union{Void,Bool}
    networkInterfaceId::Union{Void,String}
    privateIpAddress::Union{Void,Array{String,1}}
    secondaryPrivateIpAddressCount::Union{Void,Int64}
    function AssignPrivateIpAddressesRequest(;allowReassignment=nothing, networkInterfaceId=nothing, privateIpAddress=nothing, secondaryPrivateIpAddressCount=nothing)
        new(allowReassignment, networkInterfaceId, privateIpAddress, secondaryPrivateIpAddressCount)
    end
    AssignPrivateIpAddressesRequest(pd) = parse_from_xml(AssignPrivateIpAddressesRequest, EC2TypeDict, pd)
end # AssignPrivateIpAddressesRequest
export AssignPrivateIpAddressesRequest

function AssignPrivateIpAddresses(env::AWSEnv, msg::AssignPrivateIpAddressesRequest)
    resp::EC2Response = ec2_execute(env, "AssignPrivateIpAddresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AssignPrivateIpAddressesResult(resp.pd)
    end
    resp
end
AssignPrivateIpAddresses(env::AWSEnv; kwargs...) = AssignPrivateIpAddresses(env, AssignPrivateIpAddressesRequest(; kwargs...))
export AssignPrivateIpAddresses

type CreateSubnetResult <: AbstractAWSType
    requestId::Union{Void,String}
    subnet::Union{Void,Subnet}
    function CreateSubnetResult(;requestId=nothing, subnet=nothing)
        new(requestId, subnet)
    end
    CreateSubnetResult(pd) = parse_from_xml(CreateSubnetResult, EC2TypeDict, pd)
end # CreateSubnetResult
export CreateSubnetResult

type CreateSubnetRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    cidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    ipv6CidrBlock::Union{Void,String}
    vpcId::Union{Void,String}
    function CreateSubnetRequest(;availabilityZone=nothing, cidrBlock=nothing, dryRun=nothing, ipv6CidrBlock=nothing, vpcId=nothing)
        new(availabilityZone, cidrBlock, dryRun, ipv6CidrBlock, vpcId)
    end
    CreateSubnetRequest(pd) = parse_from_xml(CreateSubnetRequest, EC2TypeDict, pd)
end # CreateSubnetRequest
export CreateSubnetRequest

function CreateSubnet(env::AWSEnv, msg::CreateSubnetRequest)
    resp::EC2Response = ec2_execute(env, "CreateSubnet", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateSubnetResult(resp.pd)
    end
    resp
end
CreateSubnet(env::AWSEnv; kwargs...) = CreateSubnet(env, CreateSubnetRequest(; kwargs...))
export CreateSubnet

type AcceptReservedInstancesExchangeQuoteResult <: AbstractAWSType
    exchangeId::Union{Void,String}
    requestId::Union{Void,String}
    function AcceptReservedInstancesExchangeQuoteResult(;exchangeId=nothing, requestId=nothing)
        new(exchangeId, requestId)
    end
    AcceptReservedInstancesExchangeQuoteResult(pd) = parse_from_xml(AcceptReservedInstancesExchangeQuoteResult, EC2TypeDict, pd)
end # AcceptReservedInstancesExchangeQuoteResult
export AcceptReservedInstancesExchangeQuoteResult

type AcceptReservedInstancesExchangeQuoteRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    reservedInstanceId::Union{Void,Array{String,1}}
    targetConfiguration::Union{Void,Array{TargetConfigurationRequest,1}}
    function AcceptReservedInstancesExchangeQuoteRequest(;dryRun=nothing, reservedInstanceId=nothing, targetConfiguration=nothing)
        new(dryRun, reservedInstanceId, targetConfiguration)
    end
    AcceptReservedInstancesExchangeQuoteRequest(pd) = parse_from_xml(AcceptReservedInstancesExchangeQuoteRequest, EC2TypeDict, pd)
end # AcceptReservedInstancesExchangeQuoteRequest
export AcceptReservedInstancesExchangeQuoteRequest

function AcceptReservedInstancesExchangeQuote(env::AWSEnv, msg::AcceptReservedInstancesExchangeQuoteRequest)
    resp::EC2Response = ec2_execute(env, "AcceptReservedInstancesExchangeQuote", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AcceptReservedInstancesExchangeQuoteResult(resp.pd)
    end
    resp
end
AcceptReservedInstancesExchangeQuote(env::AWSEnv; kwargs...) = AcceptReservedInstancesExchangeQuote(env, AcceptReservedInstancesExchangeQuoteRequest(; kwargs...))
export AcceptReservedInstancesExchangeQuote

type RunScheduledInstancesResult <: AbstractAWSType
    instanceIdSet::Union{Void,Array{String,1}}
    requestId::Union{Void,String}
    function RunScheduledInstancesResult(;instanceIdSet=nothing, requestId=nothing)
        new(instanceIdSet, requestId)
    end
    RunScheduledInstancesResult(pd) = parse_from_xml(RunScheduledInstancesResult, EC2TypeDict, pd)
end # RunScheduledInstancesResult
export RunScheduledInstancesResult

type RunScheduledInstancesRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceCount::Union{Void,Int64}
    launchSpecification::Union{Void,ScheduledInstancesLaunchSpecification}
    scheduledInstanceId::Union{Void,String}
    function RunScheduledInstancesRequest(;clientToken=nothing, dryRun=nothing, instanceCount=nothing, launchSpecification=nothing, scheduledInstanceId=nothing)
        new(clientToken, dryRun, instanceCount, launchSpecification, scheduledInstanceId)
    end
    RunScheduledInstancesRequest(pd) = parse_from_xml(RunScheduledInstancesRequest, EC2TypeDict, pd)
end # RunScheduledInstancesRequest
export RunScheduledInstancesRequest

function RunScheduledInstances(env::AWSEnv, msg::RunScheduledInstancesRequest)
    resp::EC2Response = ec2_execute(env, "RunScheduledInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RunScheduledInstancesResult(resp.pd)
    end
    resp
end
RunScheduledInstances(env::AWSEnv; kwargs...) = RunScheduledInstances(env, RunScheduledInstancesRequest(; kwargs...))
export RunScheduledInstances

type DeleteTagsResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteTagsResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteTagsResult(pd) = parse_from_xml(DeleteTagsResult, EC2TypeDict, pd)
end # DeleteTagsResult
export DeleteTagsResult

type DeleteTagsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    resourceId::Union{Void,Array{String,1}}
    tag::Union{Void,Array{Tag,1}}
    function DeleteTagsRequest(;dryRun=nothing, resourceId=nothing, tag=nothing)
        new(dryRun, resourceId, tag)
    end
    DeleteTagsRequest(pd) = parse_from_xml(DeleteTagsRequest, EC2TypeDict, pd)
end # DeleteTagsRequest
export DeleteTagsRequest

function DeleteTags(env::AWSEnv, msg::DeleteTagsRequest)
    resp::EC2Response = ec2_execute(env, "DeleteTags", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteTagsResult(resp.pd)
    end
    resp
end
DeleteTags(env::AWSEnv; kwargs...) = DeleteTags(env, DeleteTagsRequest(; kwargs...))
export DeleteTags

type RequestSpotInstancesResult <: AbstractAWSType
    requestId::Union{Void,String}
    spotInstanceRequestSet::Union{Void,Array{SpotInstanceRequest,1}}
    function RequestSpotInstancesResult(;requestId=nothing, spotInstanceRequestSet=nothing)
        new(requestId, spotInstanceRequestSet)
    end
    RequestSpotInstancesResult(pd) = parse_from_xml(RequestSpotInstancesResult, EC2TypeDict, pd)
end # RequestSpotInstancesResult
export RequestSpotInstancesResult

type RequestSpotInstancesRequest <: AbstractAWSType
    availabilityZoneGroup::Union{Void,String}
    blockDurationMinutes::Union{Void,Int64}
    clientToken::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceCount::Union{Void,Int64}
    launchGroup::Union{Void,String}
    launchSpecification::Union{Void,RequestSpotLaunchSpecification}
    spotPrice::Union{Void,String}
    _Type::Union{Void,String}
    validFrom::Union{Void,DateTime}
    validUntil::Union{Void,DateTime}
    function RequestSpotInstancesRequest(;availabilityZoneGroup=nothing, blockDurationMinutes=nothing, clientToken=nothing, dryRun=nothing, instanceCount=nothing, launchGroup=nothing, launchSpecification=nothing, spotPrice=nothing, _Type=nothing, validFrom=nothing, validUntil=nothing)
        new(availabilityZoneGroup, blockDurationMinutes, clientToken, dryRun, instanceCount, launchGroup, launchSpecification, spotPrice, _Type, validFrom, validUntil)
    end
    RequestSpotInstancesRequest(pd) = parse_from_xml(RequestSpotInstancesRequest, EC2TypeDict, pd)
end # RequestSpotInstancesRequest
export RequestSpotInstancesRequest

function RequestSpotInstances(env::AWSEnv, msg::RequestSpotInstancesRequest)
    resp::EC2Response = ec2_execute(env, "RequestSpotInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RequestSpotInstancesResult(resp.pd)
    end
    resp
end
RequestSpotInstances(env::AWSEnv; kwargs...) = RequestSpotInstances(env, RequestSpotInstancesRequest(; kwargs...))
export RequestSpotInstances

type UnassignIpv6AddressesResult <: AbstractAWSType
    networkInterfaceId::Union{Void,String}
    requestId::Union{Void,String}
    unassignedIpv6Addresses::Union{Void,Array{String,1}}
    function UnassignIpv6AddressesResult(;networkInterfaceId=nothing, requestId=nothing, unassignedIpv6Addresses=nothing)
        new(networkInterfaceId, requestId, unassignedIpv6Addresses)
    end
    UnassignIpv6AddressesResult(pd) = parse_from_xml(UnassignIpv6AddressesResult, EC2TypeDict, pd)
end # UnassignIpv6AddressesResult
export UnassignIpv6AddressesResult

type UnassignIpv6AddressesRequest <: AbstractAWSType
    ipv6Addresses::Union{Void,Array{String,1}}
    networkInterfaceId::Union{Void,String}
    function UnassignIpv6AddressesRequest(;ipv6Addresses=nothing, networkInterfaceId=nothing)
        new(ipv6Addresses, networkInterfaceId)
    end
    UnassignIpv6AddressesRequest(pd) = parse_from_xml(UnassignIpv6AddressesRequest, EC2TypeDict, pd)
end # UnassignIpv6AddressesRequest
export UnassignIpv6AddressesRequest

function UnassignIpv6Addresses(env::AWSEnv, msg::UnassignIpv6AddressesRequest)
    resp::EC2Response = ec2_execute(env, "UnassignIpv6Addresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = UnassignIpv6AddressesResult(resp.pd)
    end
    resp
end
UnassignIpv6Addresses(env::AWSEnv; kwargs...) = UnassignIpv6Addresses(env, UnassignIpv6AddressesRequest(; kwargs...))
export UnassignIpv6Addresses

type DeleteVpcResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVpcResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVpcResult(pd) = parse_from_xml(DeleteVpcResult, EC2TypeDict, pd)
end # DeleteVpcResult
export DeleteVpcResult

type DeleteVpcRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function DeleteVpcRequest(;dryRun=nothing, vpcId=nothing)
        new(dryRun, vpcId)
    end
    DeleteVpcRequest(pd) = parse_from_xml(DeleteVpcRequest, EC2TypeDict, pd)
end # DeleteVpcRequest
export DeleteVpcRequest

function DeleteVpc(env::AWSEnv, msg::DeleteVpcRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpc", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpcResult(resp.pd)
    end
    resp
end
DeleteVpc(env::AWSEnv; kwargs...) = DeleteVpc(env, DeleteVpcRequest(; kwargs...))
export DeleteVpc

type ReleaseHostsResult <: AbstractAWSType
    requestId::Union{Void,String}
    successful::Union{Void,Array{String,1}}
    unsuccessful::Union{Void,Array{UnsuccessfulItem,1}}
    function ReleaseHostsResult(;requestId=nothing, successful=nothing, unsuccessful=nothing)
        new(requestId, successful, unsuccessful)
    end
    ReleaseHostsResult(pd) = parse_from_xml(ReleaseHostsResult, EC2TypeDict, pd)
end # ReleaseHostsResult
export ReleaseHostsResult

type ReleaseHostsRequest <: AbstractAWSType
    hostId::Union{Void,Array{String,1}}
    function ReleaseHostsRequest(;hostId=nothing)
        new(hostId)
    end
    ReleaseHostsRequest(pd) = parse_from_xml(ReleaseHostsRequest, EC2TypeDict, pd)
end # ReleaseHostsRequest
export ReleaseHostsRequest

function ReleaseHosts(env::AWSEnv, msg::ReleaseHostsRequest)
    resp::EC2Response = ec2_execute(env, "ReleaseHosts", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReleaseHostsResult(resp.pd)
    end
    resp
end
ReleaseHosts(env::AWSEnv; kwargs...) = ReleaseHosts(env, ReleaseHostsRequest(; kwargs...))
export ReleaseHosts

type DeleteNetworkInterfacePermissionResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteNetworkInterfacePermissionResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteNetworkInterfacePermissionResult(pd) = parse_from_xml(DeleteNetworkInterfacePermissionResult, EC2TypeDict, pd)
end # DeleteNetworkInterfacePermissionResult
export DeleteNetworkInterfacePermissionResult

type DeleteNetworkInterfacePermissionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    force::Union{Void,Bool}
    networkInterfacePermissionId::Union{Void,String}
    function DeleteNetworkInterfacePermissionRequest(;dryRun=nothing, force=nothing, networkInterfacePermissionId=nothing)
        new(dryRun, force, networkInterfacePermissionId)
    end
    DeleteNetworkInterfacePermissionRequest(pd) = parse_from_xml(DeleteNetworkInterfacePermissionRequest, EC2TypeDict, pd)
end # DeleteNetworkInterfacePermissionRequest
export DeleteNetworkInterfacePermissionRequest

function DeleteNetworkInterfacePermission(env::AWSEnv, msg::DeleteNetworkInterfacePermissionRequest)
    resp::EC2Response = ec2_execute(env, "DeleteNetworkInterfacePermission", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteNetworkInterfacePermissionResult(resp.pd)
    end
    resp
end
DeleteNetworkInterfacePermission(env::AWSEnv; kwargs...) = DeleteNetworkInterfacePermission(env, DeleteNetworkInterfacePermissionRequest(; kwargs...))
export DeleteNetworkInterfacePermission

type CreateVpcPeeringConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpcPeeringConnection::Union{Void,VpcPeeringConnection}
    function CreateVpcPeeringConnectionResult(;requestId=nothing, vpcPeeringConnection=nothing)
        new(requestId, vpcPeeringConnection)
    end
    CreateVpcPeeringConnectionResult(pd) = parse_from_xml(CreateVpcPeeringConnectionResult, EC2TypeDict, pd)
end # CreateVpcPeeringConnectionResult
export CreateVpcPeeringConnectionResult

type CreateVpcPeeringConnectionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    peerOwnerId::Union{Void,String}
    peerVpcId::Union{Void,String}
    vpcId::Union{Void,String}
    function CreateVpcPeeringConnectionRequest(;dryRun=nothing, peerOwnerId=nothing, peerVpcId=nothing, vpcId=nothing)
        new(dryRun, peerOwnerId, peerVpcId, vpcId)
    end
    CreateVpcPeeringConnectionRequest(pd) = parse_from_xml(CreateVpcPeeringConnectionRequest, EC2TypeDict, pd)
end # CreateVpcPeeringConnectionRequest
export CreateVpcPeeringConnectionRequest

function CreateVpcPeeringConnection(env::AWSEnv, msg::CreateVpcPeeringConnectionRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpcPeeringConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpcPeeringConnectionResult(resp.pd)
    end
    resp
end
CreateVpcPeeringConnection(env::AWSEnv; kwargs...) = CreateVpcPeeringConnection(env, CreateVpcPeeringConnectionRequest(; kwargs...))
export CreateVpcPeeringConnection

type CreateNetworkAclResult <: AbstractAWSType
    networkAcl::Union{Void,NetworkAcl}
    requestId::Union{Void,String}
    function CreateNetworkAclResult(;networkAcl=nothing, requestId=nothing)
        new(networkAcl, requestId)
    end
    CreateNetworkAclResult(pd) = parse_from_xml(CreateNetworkAclResult, EC2TypeDict, pd)
end # CreateNetworkAclResult
export CreateNetworkAclResult

type CreateNetworkAclRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    function CreateNetworkAclRequest(;dryRun=nothing, vpcId=nothing)
        new(dryRun, vpcId)
    end
    CreateNetworkAclRequest(pd) = parse_from_xml(CreateNetworkAclRequest, EC2TypeDict, pd)
end # CreateNetworkAclRequest
export CreateNetworkAclRequest

function CreateNetworkAcl(env::AWSEnv, msg::CreateNetworkAclRequest)
    resp::EC2Response = ec2_execute(env, "CreateNetworkAcl", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateNetworkAclResult(resp.pd)
    end
    resp
end
CreateNetworkAcl(env::AWSEnv; kwargs...) = CreateNetworkAcl(env, CreateNetworkAclRequest(; kwargs...))
export CreateNetworkAcl

type DetachInternetGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DetachInternetGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DetachInternetGatewayResult(pd) = parse_from_xml(DetachInternetGatewayResult, EC2TypeDict, pd)
end # DetachInternetGatewayResult
export DetachInternetGatewayResult

type DetachInternetGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    internetGatewayId::Union{Void,String}
    vpcId::Union{Void,String}
    function DetachInternetGatewayRequest(;dryRun=nothing, internetGatewayId=nothing, vpcId=nothing)
        new(dryRun, internetGatewayId, vpcId)
    end
    DetachInternetGatewayRequest(pd) = parse_from_xml(DetachInternetGatewayRequest, EC2TypeDict, pd)
end # DetachInternetGatewayRequest
export DetachInternetGatewayRequest

function DetachInternetGateway(env::AWSEnv, msg::DetachInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "DetachInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachInternetGatewayResult(resp.pd)
    end
    resp
end
DetachInternetGateway(env::AWSEnv; kwargs...) = DetachInternetGateway(env, DetachInternetGatewayRequest(; kwargs...))
export DetachInternetGateway

type DescribeInternetGatewaysResult <: AbstractAWSType
    internetGatewaySet::Union{Void,Array{InternetGateway,1}}
    requestId::Union{Void,String}
    function DescribeInternetGatewaysResult(;internetGatewaySet=nothing, requestId=nothing)
        new(internetGatewaySet, requestId)
    end
    DescribeInternetGatewaysResult(pd) = parse_from_xml(DescribeInternetGatewaysResult, EC2TypeDict, pd)
end # DescribeInternetGatewaysResult
export DescribeInternetGatewaysResult

type DescribeInternetGatewaysRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    internetGatewayId::Union{Void,Array{String,1}}
    function DescribeInternetGatewaysRequest(;dryRun=nothing, filter=nothing, internetGatewayId=nothing)
        new(dryRun, filter, internetGatewayId)
    end
    DescribeInternetGatewaysRequest(pd) = parse_from_xml(DescribeInternetGatewaysRequest, EC2TypeDict, pd)
end # DescribeInternetGatewaysRequest
export DescribeInternetGatewaysRequest

function DescribeInternetGateways(env::AWSEnv, msg::DescribeInternetGatewaysRequest)
    resp::EC2Response = ec2_execute(env, "DescribeInternetGateways", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeInternetGatewaysResult(resp.pd)
    end
    resp
end
DescribeInternetGateways(env::AWSEnv; kwargs...) = DescribeInternetGateways(env, DescribeInternetGatewaysRequest(; kwargs...))
export DescribeInternetGateways

type AttachVpnGatewayResult <: AbstractAWSType
    attachment::Union{Void,VpcAttachment}
    requestId::Union{Void,String}
    function AttachVpnGatewayResult(;attachment=nothing, requestId=nothing)
        new(attachment, requestId)
    end
    AttachVpnGatewayResult(pd) = parse_from_xml(AttachVpnGatewayResult, EC2TypeDict, pd)
end # AttachVpnGatewayResult
export AttachVpnGatewayResult

type AttachVpnGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpcId::Union{Void,String}
    vpnGatewayId::Union{Void,String}
    function AttachVpnGatewayRequest(;dryRun=nothing, vpcId=nothing, vpnGatewayId=nothing)
        new(dryRun, vpcId, vpnGatewayId)
    end
    AttachVpnGatewayRequest(pd) = parse_from_xml(AttachVpnGatewayRequest, EC2TypeDict, pd)
end # AttachVpnGatewayRequest
export AttachVpnGatewayRequest

function AttachVpnGateway(env::AWSEnv, msg::AttachVpnGatewayRequest)
    resp::EC2Response = ec2_execute(env, "AttachVpnGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AttachVpnGatewayResult(resp.pd)
    end
    resp
end
AttachVpnGateway(env::AWSEnv; kwargs...) = AttachVpnGateway(env, AttachVpnGatewayRequest(; kwargs...))
export AttachVpnGateway

type CancelSpotFleetRequestsResult <: AbstractAWSType
    requestId::Union{Void,String}
    successfulFleetRequestSet::Union{Void,Array{CancelSpotFleetRequestsSuccessItem,1}}
    unsuccessfulFleetRequestSet::Union{Void,Array{CancelSpotFleetRequestsErrorItem,1}}
    function CancelSpotFleetRequestsResult(;requestId=nothing, successfulFleetRequestSet=nothing, unsuccessfulFleetRequestSet=nothing)
        new(requestId, successfulFleetRequestSet, unsuccessfulFleetRequestSet)
    end
    CancelSpotFleetRequestsResult(pd) = parse_from_xml(CancelSpotFleetRequestsResult, EC2TypeDict, pd)
end # CancelSpotFleetRequestsResult
export CancelSpotFleetRequestsResult

type CancelSpotFleetRequestsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    spotFleetRequestId::Union{Void,Array{String,1}}
    terminateInstances::Union{Void,Bool}
    function CancelSpotFleetRequestsRequest(;dryRun=nothing, spotFleetRequestId=nothing, terminateInstances=nothing)
        new(dryRun, spotFleetRequestId, terminateInstances)
    end
    CancelSpotFleetRequestsRequest(pd) = parse_from_xml(CancelSpotFleetRequestsRequest, EC2TypeDict, pd)
end # CancelSpotFleetRequestsRequest
export CancelSpotFleetRequestsRequest

function CancelSpotFleetRequests(env::AWSEnv, msg::CancelSpotFleetRequestsRequest)
    resp::EC2Response = ec2_execute(env, "CancelSpotFleetRequests", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelSpotFleetRequestsResult(resp.pd)
    end
    resp
end
CancelSpotFleetRequests(env::AWSEnv; kwargs...) = CancelSpotFleetRequests(env, CancelSpotFleetRequestsRequest(; kwargs...))
export CancelSpotFleetRequests

type AttachInternetGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function AttachInternetGatewayResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    AttachInternetGatewayResult(pd) = parse_from_xml(AttachInternetGatewayResult, EC2TypeDict, pd)
end # AttachInternetGatewayResult
export AttachInternetGatewayResult

type AttachInternetGatewayRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    internetGatewayId::Union{Void,String}
    vpcId::Union{Void,String}
    function AttachInternetGatewayRequest(;dryRun=nothing, internetGatewayId=nothing, vpcId=nothing)
        new(dryRun, internetGatewayId, vpcId)
    end
    AttachInternetGatewayRequest(pd) = parse_from_xml(AttachInternetGatewayRequest, EC2TypeDict, pd)
end # AttachInternetGatewayRequest
export AttachInternetGatewayRequest

function AttachInternetGateway(env::AWSEnv, msg::AttachInternetGatewayRequest)
    resp::EC2Response = ec2_execute(env, "AttachInternetGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AttachInternetGatewayResult(resp.pd)
    end
    resp
end
AttachInternetGateway(env::AWSEnv; kwargs...) = AttachInternetGateway(env, AttachInternetGatewayRequest(; kwargs...))
export AttachInternetGateway

type CreateDhcpOptionsResult <: AbstractAWSType
    dhcpOptions::Union{Void,DhcpOptions}
    requestId::Union{Void,String}
    function CreateDhcpOptionsResult(;dhcpOptions=nothing, requestId=nothing)
        new(dhcpOptions, requestId)
    end
    CreateDhcpOptionsResult(pd) = parse_from_xml(CreateDhcpOptionsResult, EC2TypeDict, pd)
end # CreateDhcpOptionsResult
export CreateDhcpOptionsResult

type CreateDhcpOptionsRequest <: AbstractAWSType
    dhcpConfiguration::Union{Void,Array{NewDhcpConfiguration,1}}
    dryRun::Union{Void,Bool}
    function CreateDhcpOptionsRequest(;dhcpConfiguration=nothing, dryRun=nothing)
        new(dhcpConfiguration, dryRun)
    end
    CreateDhcpOptionsRequest(pd) = parse_from_xml(CreateDhcpOptionsRequest, EC2TypeDict, pd)
end # CreateDhcpOptionsRequest
export CreateDhcpOptionsRequest

function CreateDhcpOptions(env::AWSEnv, msg::CreateDhcpOptionsRequest)
    resp::EC2Response = ec2_execute(env, "CreateDhcpOptions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateDhcpOptionsResult(resp.pd)
    end
    resp
end
CreateDhcpOptions(env::AWSEnv; kwargs...) = CreateDhcpOptions(env, CreateDhcpOptionsRequest(; kwargs...))
export CreateDhcpOptions

type DescribeRouteTablesResult <: AbstractAWSType
    requestId::Union{Void,String}
    routeTableSet::Union{Void,Array{RouteTable,1}}
    function DescribeRouteTablesResult(;requestId=nothing, routeTableSet=nothing)
        new(requestId, routeTableSet)
    end
    DescribeRouteTablesResult(pd) = parse_from_xml(DescribeRouteTablesResult, EC2TypeDict, pd)
end # DescribeRouteTablesResult
export DescribeRouteTablesResult

type DescribeRouteTablesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    routeTableId::Union{Void,Array{String,1}}
    function DescribeRouteTablesRequest(;dryRun=nothing, filter=nothing, routeTableId=nothing)
        new(dryRun, filter, routeTableId)
    end
    DescribeRouteTablesRequest(pd) = parse_from_xml(DescribeRouteTablesRequest, EC2TypeDict, pd)
end # DescribeRouteTablesRequest
export DescribeRouteTablesRequest

function DescribeRouteTables(env::AWSEnv, msg::DescribeRouteTablesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeRouteTables", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeRouteTablesResult(resp.pd)
    end
    resp
end
DescribeRouteTables(env::AWSEnv; kwargs...) = DescribeRouteTables(env, DescribeRouteTablesRequest(; kwargs...))
export DescribeRouteTables

type EnableVgwRoutePropagationResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function EnableVgwRoutePropagationResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    EnableVgwRoutePropagationResult(pd) = parse_from_xml(EnableVgwRoutePropagationResult, EC2TypeDict, pd)
end # EnableVgwRoutePropagationResult
export EnableVgwRoutePropagationResult

type EnableVgwRoutePropagationRequest <: AbstractAWSType
    gatewayId::Union{Void,String}
    routeTableId::Union{Void,String}
    function EnableVgwRoutePropagationRequest(;gatewayId=nothing, routeTableId=nothing)
        new(gatewayId, routeTableId)
    end
    EnableVgwRoutePropagationRequest(pd) = parse_from_xml(EnableVgwRoutePropagationRequest, EC2TypeDict, pd)
end # EnableVgwRoutePropagationRequest
export EnableVgwRoutePropagationRequest

function EnableVgwRoutePropagation(env::AWSEnv, msg::EnableVgwRoutePropagationRequest)
    resp::EC2Response = ec2_execute(env, "EnableVgwRoutePropagation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = EnableVgwRoutePropagationResult(resp.pd)
    end
    resp
end
EnableVgwRoutePropagation(env::AWSEnv; kwargs...) = EnableVgwRoutePropagation(env, EnableVgwRoutePropagationRequest(; kwargs...))
export EnableVgwRoutePropagation

type DescribeTagsResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    tagSet::Union{Void,Array{TagDescription,1}}
    function DescribeTagsResult(;nextToken=nothing, requestId=nothing, tagSet=nothing)
        new(nextToken, requestId, tagSet)
    end
    DescribeTagsResult(pd) = parse_from_xml(DescribeTagsResult, EC2TypeDict, pd)
end # DescribeTagsResult
export DescribeTagsResult

type DescribeTagsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeTagsRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filter, maxResults, nextToken)
    end
    DescribeTagsRequest(pd) = parse_from_xml(DescribeTagsRequest, EC2TypeDict, pd)
end # DescribeTagsRequest
export DescribeTagsRequest

function DescribeTags(env::AWSEnv, msg::DescribeTagsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeTags", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeTagsResult(resp.pd)
    end
    resp
end
DescribeTags(env::AWSEnv; kwargs...) = DescribeTags(env, DescribeTagsRequest(; kwargs...))
export DescribeTags

type CreateFpgaImageResult <: AbstractAWSType
    fpgaImageGlobalId::Union{Void,String}
    fpgaImageId::Union{Void,String}
    requestId::Union{Void,String}
    function CreateFpgaImageResult(;fpgaImageGlobalId=nothing, fpgaImageId=nothing, requestId=nothing)
        new(fpgaImageGlobalId, fpgaImageId, requestId)
    end
    CreateFpgaImageResult(pd) = parse_from_xml(CreateFpgaImageResult, EC2TypeDict, pd)
end # CreateFpgaImageResult
export CreateFpgaImageResult

type CreateFpgaImageRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    inputStorageLocation::Union{Void,StorageLocation}
    logsStorageLocation::Union{Void,StorageLocation}
    name::Union{Void,String}
    function CreateFpgaImageRequest(;clientToken=nothing, description=nothing, dryRun=nothing, inputStorageLocation=nothing, logsStorageLocation=nothing, name=nothing)
        new(clientToken, description, dryRun, inputStorageLocation, logsStorageLocation, name)
    end
    CreateFpgaImageRequest(pd) = parse_from_xml(CreateFpgaImageRequest, EC2TypeDict, pd)
end # CreateFpgaImageRequest
export CreateFpgaImageRequest

function CreateFpgaImage(env::AWSEnv, msg::CreateFpgaImageRequest)
    resp::EC2Response = ec2_execute(env, "CreateFpgaImage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateFpgaImageResult(resp.pd)
    end
    resp
end
CreateFpgaImage(env::AWSEnv; kwargs...) = CreateFpgaImage(env, CreateFpgaImageRequest(; kwargs...))
export CreateFpgaImage

type ConfirmProductInstanceResult <: AbstractAWSType
    ownerId::Union{Void,String}
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ConfirmProductInstanceResult(;ownerId=nothing, requestId=nothing, _return=nothing)
        new(ownerId, requestId, _return)
    end
    ConfirmProductInstanceResult(pd) = parse_from_xml(ConfirmProductInstanceResult, EC2TypeDict, pd)
end # ConfirmProductInstanceResult
export ConfirmProductInstanceResult

type ConfirmProductInstanceRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    productCode::Union{Void,String}
    function ConfirmProductInstanceRequest(;dryRun=nothing, instanceId=nothing, productCode=nothing)
        new(dryRun, instanceId, productCode)
    end
    ConfirmProductInstanceRequest(pd) = parse_from_xml(ConfirmProductInstanceRequest, EC2TypeDict, pd)
end # ConfirmProductInstanceRequest
export ConfirmProductInstanceRequest

function ConfirmProductInstance(env::AWSEnv, msg::ConfirmProductInstanceRequest)
    resp::EC2Response = ec2_execute(env, "ConfirmProductInstance", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ConfirmProductInstanceResult(resp.pd)
    end
    resp
end
ConfirmProductInstance(env::AWSEnv; kwargs...) = ConfirmProductInstance(env, ConfirmProductInstanceRequest(; kwargs...))
export ConfirmProductInstance

type DescribeImportImageTasksResult <: AbstractAWSType
    importImageTaskSet::Union{Void,Array{ImportImageTask,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeImportImageTasksResult(;importImageTaskSet=nothing, nextToken=nothing, requestId=nothing)
        new(importImageTaskSet, nextToken, requestId)
    end
    DescribeImportImageTasksResult(pd) = parse_from_xml(DescribeImportImageTasksResult, EC2TypeDict, pd)
end # DescribeImportImageTasksResult
export DescribeImportImageTasksResult

type DescribeImportImageTasksRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filters::Union{Void,Array{Filter,1}}
    importTaskId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeImportImageTasksRequest(;dryRun=nothing, filters=nothing, importTaskId=nothing, maxResults=nothing, nextToken=nothing)
        new(dryRun, filters, importTaskId, maxResults, nextToken)
    end
    DescribeImportImageTasksRequest(pd) = parse_from_xml(DescribeImportImageTasksRequest, EC2TypeDict, pd)
end # DescribeImportImageTasksRequest
export DescribeImportImageTasksRequest

function DescribeImportImageTasks(env::AWSEnv, msg::DescribeImportImageTasksRequest)
    resp::EC2Response = ec2_execute(env, "DescribeImportImageTasks", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeImportImageTasksResult(resp.pd)
    end
    resp
end
DescribeImportImageTasks(env::AWSEnv; kwargs...) = DescribeImportImageTasks(env, DescribeImportImageTasksRequest(; kwargs...))
export DescribeImportImageTasks

type CreateSnapshotResult <: AbstractAWSType
    dataEncryptionKeyId::Union{Void,String}
    description::Union{Void,String}
    encrypted::Union{Void,Bool}
    kmsKeyId::Union{Void,String}
    ownerAlias::Union{Void,String}
    ownerId::Union{Void,String}
    progress::Union{Void,String}
    requestId::Union{Void,String}
    snapshotId::Union{Void,String}
    startTime::Union{Void,DateTime}
    status::Union{Void,String}
    statusMessage::Union{Void,String}
    tagSet::Union{Void,Array{Tag,1}}
    volumeId::Union{Void,String}
    volumeSize::Union{Void,Int64}
    function CreateSnapshotResult(;dataEncryptionKeyId=nothing, description=nothing, encrypted=nothing, kmsKeyId=nothing, ownerAlias=nothing, ownerId=nothing, progress=nothing, requestId=nothing, snapshotId=nothing, startTime=nothing, status=nothing, statusMessage=nothing, tagSet=nothing, volumeId=nothing, volumeSize=nothing)
        new(dataEncryptionKeyId, description, encrypted, kmsKeyId, ownerAlias, ownerId, progress, requestId, snapshotId, startTime, status, statusMessage, tagSet, volumeId, volumeSize)
    end
    CreateSnapshotResult(pd) = parse_from_xml(CreateSnapshotResult, EC2TypeDict, pd)
end # CreateSnapshotResult
export CreateSnapshotResult

type CreateSnapshotRequest <: AbstractAWSType
    description::Union{Void,String}
    dryRun::Union{Void,Bool}
    volumeId::Union{Void,String}
    function CreateSnapshotRequest(;description=nothing, dryRun=nothing, volumeId=nothing)
        new(description, dryRun, volumeId)
    end
    CreateSnapshotRequest(pd) = parse_from_xml(CreateSnapshotRequest, EC2TypeDict, pd)
end # CreateSnapshotRequest
export CreateSnapshotRequest

function CreateSnapshot(env::AWSEnv, msg::CreateSnapshotRequest)
    resp::EC2Response = ec2_execute(env, "CreateSnapshot", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateSnapshotResult(resp.pd)
    end
    resp
end
CreateSnapshot(env::AWSEnv; kwargs...) = CreateSnapshot(env, CreateSnapshotRequest(; kwargs...))
export CreateSnapshot

type DescribeMovingAddressesResult <: AbstractAWSType
    movingAddressStatusSet::Union{Void,Array{MovingAddressStatus,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeMovingAddressesResult(;movingAddressStatusSet=nothing, nextToken=nothing, requestId=nothing)
        new(movingAddressStatusSet, nextToken, requestId)
    end
    DescribeMovingAddressesResult(pd) = parse_from_xml(DescribeMovingAddressesResult, EC2TypeDict, pd)
end # DescribeMovingAddressesResult
export DescribeMovingAddressesResult

type DescribeMovingAddressesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    publicIp::Union{Void,Array{String,1}}
    function DescribeMovingAddressesRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, publicIp=nothing)
        new(dryRun, filter, maxResults, nextToken, publicIp)
    end
    DescribeMovingAddressesRequest(pd) = parse_from_xml(DescribeMovingAddressesRequest, EC2TypeDict, pd)
end # DescribeMovingAddressesRequest
export DescribeMovingAddressesRequest

function DescribeMovingAddresses(env::AWSEnv, msg::DescribeMovingAddressesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeMovingAddresses", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeMovingAddressesResult(resp.pd)
    end
    resp
end
DescribeMovingAddresses(env::AWSEnv; kwargs...) = DescribeMovingAddresses(env, DescribeMovingAddressesRequest(; kwargs...))
export DescribeMovingAddresses

type DetachVolumeResult <: AbstractAWSType
    attachTime::Union{Void,DateTime}
    deleteOnTermination::Union{Void,Bool}
    device::Union{Void,String}
    instanceId::Union{Void,String}
    requestId::Union{Void,String}
    status::Union{Void,String}
    volumeId::Union{Void,String}
    function DetachVolumeResult(;attachTime=nothing, deleteOnTermination=nothing, device=nothing, instanceId=nothing, requestId=nothing, status=nothing, volumeId=nothing)
        new(attachTime, deleteOnTermination, device, instanceId, requestId, status, volumeId)
    end
    DetachVolumeResult(pd) = parse_from_xml(DetachVolumeResult, EC2TypeDict, pd)
end # DetachVolumeResult
export DetachVolumeResult

type DetachVolumeRequest <: AbstractAWSType
    device::Union{Void,String}
    dryRun::Union{Void,Bool}
    force::Union{Void,Bool}
    instanceId::Union{Void,String}
    volumeId::Union{Void,String}
    function DetachVolumeRequest(;device=nothing, dryRun=nothing, force=nothing, instanceId=nothing, volumeId=nothing)
        new(device, dryRun, force, instanceId, volumeId)
    end
    DetachVolumeRequest(pd) = parse_from_xml(DetachVolumeRequest, EC2TypeDict, pd)
end # DetachVolumeRequest
export DetachVolumeRequest

function DetachVolume(env::AWSEnv, msg::DetachVolumeRequest)
    resp::EC2Response = ec2_execute(env, "DetachVolume", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachVolumeResult(resp.pd)
    end
    resp
end
DetachVolume(env::AWSEnv; kwargs...) = DetachVolume(env, DetachVolumeRequest(; kwargs...))
export DetachVolume

type DescribeSubnetsResult <: AbstractAWSType
    requestId::Union{Void,String}
    subnetSet::Union{Void,Array{Subnet,1}}
    function DescribeSubnetsResult(;requestId=nothing, subnetSet=nothing)
        new(requestId, subnetSet)
    end
    DescribeSubnetsResult(pd) = parse_from_xml(DescribeSubnetsResult, EC2TypeDict, pd)
end # DescribeSubnetsResult
export DescribeSubnetsResult

type DescribeSubnetsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    subnetId::Union{Void,Array{String,1}}
    function DescribeSubnetsRequest(;dryRun=nothing, filter=nothing, subnetId=nothing)
        new(dryRun, filter, subnetId)
    end
    DescribeSubnetsRequest(pd) = parse_from_xml(DescribeSubnetsRequest, EC2TypeDict, pd)
end # DescribeSubnetsRequest
export DescribeSubnetsRequest

function DescribeSubnets(env::AWSEnv, msg::DescribeSubnetsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSubnets", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSubnetsResult(resp.pd)
    end
    resp
end
DescribeSubnets(env::AWSEnv; kwargs...) = DescribeSubnets(env, DescribeSubnetsRequest(; kwargs...))
export DescribeSubnets

type ReplaceRouteTableAssociationResult <: AbstractAWSType
    newAssociationId::Union{Void,String}
    requestId::Union{Void,String}
    function ReplaceRouteTableAssociationResult(;newAssociationId=nothing, requestId=nothing)
        new(newAssociationId, requestId)
    end
    ReplaceRouteTableAssociationResult(pd) = parse_from_xml(ReplaceRouteTableAssociationResult, EC2TypeDict, pd)
end # ReplaceRouteTableAssociationResult
export ReplaceRouteTableAssociationResult

type ReplaceRouteTableAssociationRequest <: AbstractAWSType
    associationId::Union{Void,String}
    dryRun::Union{Void,Bool}
    routeTableId::Union{Void,String}
    function ReplaceRouteTableAssociationRequest(;associationId=nothing, dryRun=nothing, routeTableId=nothing)
        new(associationId, dryRun, routeTableId)
    end
    ReplaceRouteTableAssociationRequest(pd) = parse_from_xml(ReplaceRouteTableAssociationRequest, EC2TypeDict, pd)
end # ReplaceRouteTableAssociationRequest
export ReplaceRouteTableAssociationRequest

function ReplaceRouteTableAssociation(env::AWSEnv, msg::ReplaceRouteTableAssociationRequest)
    resp::EC2Response = ec2_execute(env, "ReplaceRouteTableAssociation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReplaceRouteTableAssociationResult(resp.pd)
    end
    resp
end
ReplaceRouteTableAssociation(env::AWSEnv; kwargs...) = ReplaceRouteTableAssociation(env, ReplaceRouteTableAssociationRequest(; kwargs...))
export ReplaceRouteTableAssociation

type EnableVolumeIOResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function EnableVolumeIOResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    EnableVolumeIOResult(pd) = parse_from_xml(EnableVolumeIOResult, EC2TypeDict, pd)
end # EnableVolumeIOResult
export EnableVolumeIOResult

type EnableVolumeIORequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    volumeId::Union{Void,String}
    function EnableVolumeIORequest(;dryRun=nothing, volumeId=nothing)
        new(dryRun, volumeId)
    end
    EnableVolumeIORequest(pd) = parse_from_xml(EnableVolumeIORequest, EC2TypeDict, pd)
end # EnableVolumeIORequest
export EnableVolumeIORequest

function EnableVolumeIO(env::AWSEnv, msg::EnableVolumeIORequest)
    resp::EC2Response = ec2_execute(env, "EnableVolumeIO", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = EnableVolumeIOResult(resp.pd)
    end
    resp
end
EnableVolumeIO(env::AWSEnv; kwargs...) = EnableVolumeIO(env, EnableVolumeIORequest(; kwargs...))
export EnableVolumeIO

type CreateVpnConnectionRouteResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CreateVpnConnectionRouteResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CreateVpnConnectionRouteResult(pd) = parse_from_xml(CreateVpnConnectionRouteResult, EC2TypeDict, pd)
end # CreateVpnConnectionRouteResult
export CreateVpnConnectionRouteResult

type CreateVpnConnectionRouteRequest <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    vpnConnectionId::Union{Void,String}
    function CreateVpnConnectionRouteRequest(;destinationCidrBlock=nothing, vpnConnectionId=nothing)
        new(destinationCidrBlock, vpnConnectionId)
    end
    CreateVpnConnectionRouteRequest(pd) = parse_from_xml(CreateVpnConnectionRouteRequest, EC2TypeDict, pd)
end # CreateVpnConnectionRouteRequest
export CreateVpnConnectionRouteRequest

function CreateVpnConnectionRoute(env::AWSEnv, msg::CreateVpnConnectionRouteRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpnConnectionRoute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpnConnectionRouteResult(resp.pd)
    end
    resp
end
CreateVpnConnectionRoute(env::AWSEnv; kwargs...) = CreateVpnConnectionRoute(env, CreateVpnConnectionRouteRequest(; kwargs...))
export CreateVpnConnectionRoute

type CreateFlowLogsResult <: AbstractAWSType
    clientToken::Union{Void,String}
    flowLogIdSet::Union{Void,Array{String,1}}
    requestId::Union{Void,String}
    unsuccessful::Union{Void,Array{UnsuccessfulItem,1}}
    function CreateFlowLogsResult(;clientToken=nothing, flowLogIdSet=nothing, requestId=nothing, unsuccessful=nothing)
        new(clientToken, flowLogIdSet, requestId, unsuccessful)
    end
    CreateFlowLogsResult(pd) = parse_from_xml(CreateFlowLogsResult, EC2TypeDict, pd)
end # CreateFlowLogsResult
export CreateFlowLogsResult

type CreateFlowLogsRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    deliverLogsPermissionArn::Union{Void,String}
    logGroupName::Union{Void,String}
    resourceId::Union{Void,Array{String,1}}
    resourceType::Union{Void,String}
    trafficType::Union{Void,String}
    function CreateFlowLogsRequest(;clientToken=nothing, deliverLogsPermissionArn=nothing, logGroupName=nothing, resourceId=nothing, resourceType=nothing, trafficType=nothing)
        new(clientToken, deliverLogsPermissionArn, logGroupName, resourceId, resourceType, trafficType)
    end
    CreateFlowLogsRequest(pd) = parse_from_xml(CreateFlowLogsRequest, EC2TypeDict, pd)
end # CreateFlowLogsRequest
export CreateFlowLogsRequest

function CreateFlowLogs(env::AWSEnv, msg::CreateFlowLogsRequest)
    resp::EC2Response = ec2_execute(env, "CreateFlowLogs", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateFlowLogsResult(resp.pd)
    end
    resp
end
CreateFlowLogs(env::AWSEnv; kwargs...) = CreateFlowLogs(env, CreateFlowLogsRequest(; kwargs...))
export CreateFlowLogs

type CreateVpcEndpointResult <: AbstractAWSType
    clientToken::Union{Void,String}
    requestId::Union{Void,String}
    vpcEndpoint::Union{Void,VpcEndpoint}
    function CreateVpcEndpointResult(;clientToken=nothing, requestId=nothing, vpcEndpoint=nothing)
        new(clientToken, requestId, vpcEndpoint)
    end
    CreateVpcEndpointResult(pd) = parse_from_xml(CreateVpcEndpointResult, EC2TypeDict, pd)
end # CreateVpcEndpointResult
export CreateVpcEndpointResult

type CreateVpcEndpointRequest <: AbstractAWSType
    clientToken::Union{Void,String}
    dryRun::Union{Void,Bool}
    policyDocument::Union{Void,String}
    routeTableId::Union{Void,Array{String,1}}
    serviceName::Union{Void,String}
    vpcId::Union{Void,String}
    function CreateVpcEndpointRequest(;clientToken=nothing, dryRun=nothing, policyDocument=nothing, routeTableId=nothing, serviceName=nothing, vpcId=nothing)
        new(clientToken, dryRun, policyDocument, routeTableId, serviceName, vpcId)
    end
    CreateVpcEndpointRequest(pd) = parse_from_xml(CreateVpcEndpointRequest, EC2TypeDict, pd)
end # CreateVpcEndpointRequest
export CreateVpcEndpointRequest

function CreateVpcEndpoint(env::AWSEnv, msg::CreateVpcEndpointRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpcEndpoint", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpcEndpointResult(resp.pd)
    end
    resp
end
CreateVpcEndpoint(env::AWSEnv; kwargs...) = CreateVpcEndpoint(env, CreateVpcEndpointRequest(; kwargs...))
export CreateVpcEndpoint

type ReplaceNetworkAclEntryResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ReplaceNetworkAclEntryResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ReplaceNetworkAclEntryResult(pd) = parse_from_xml(ReplaceNetworkAclEntryResult, EC2TypeDict, pd)
end # ReplaceNetworkAclEntryResult
export ReplaceNetworkAclEntryResult

type ReplaceNetworkAclEntryRequest <: AbstractAWSType
    cidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    egress::Union{Void,Bool}
    icmp::Union{Void,IcmpTypeCode}
    ipv6CidrBlock::Union{Void,String}
    networkAclId::Union{Void,String}
    portRange::Union{Void,PortRange}
    protocol::Union{Void,String}
    ruleAction::Union{Void,String}
    ruleNumber::Union{Void,Int64}
    function ReplaceNetworkAclEntryRequest(;cidrBlock=nothing, dryRun=nothing, egress=nothing, icmp=nothing, ipv6CidrBlock=nothing, networkAclId=nothing, portRange=nothing, protocol=nothing, ruleAction=nothing, ruleNumber=nothing)
        new(cidrBlock, dryRun, egress, icmp, ipv6CidrBlock, networkAclId, portRange, protocol, ruleAction, ruleNumber)
    end
    ReplaceNetworkAclEntryRequest(pd) = parse_from_xml(ReplaceNetworkAclEntryRequest, EC2TypeDict, pd)
end # ReplaceNetworkAclEntryRequest
export ReplaceNetworkAclEntryRequest

function ReplaceNetworkAclEntry(env::AWSEnv, msg::ReplaceNetworkAclEntryRequest)
    resp::EC2Response = ec2_execute(env, "ReplaceNetworkAclEntry", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReplaceNetworkAclEntryResult(resp.pd)
    end
    resp
end
ReplaceNetworkAclEntry(env::AWSEnv; kwargs...) = ReplaceNetworkAclEntry(env, ReplaceNetworkAclEntryRequest(; kwargs...))
export ReplaceNetworkAclEntry

type ModifySnapshotAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifySnapshotAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifySnapshotAttributeResult(pd) = parse_from_xml(ModifySnapshotAttributeResult, EC2TypeDict, pd)
end # ModifySnapshotAttributeResult
export ModifySnapshotAttributeResult

type ModifySnapshotAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    createVolumePermission::Union{Void,CreateVolumePermissionModifications}
    dryRun::Union{Void,Bool}
    operationType::Union{Void,String}
    snapshotId::Union{Void,String}
    userGroup::Union{Void,Array{String,1}}
    userId::Union{Void,Array{String,1}}
    function ModifySnapshotAttributeRequest(;attribute=nothing, createVolumePermission=nothing, dryRun=nothing, operationType=nothing, snapshotId=nothing, userGroup=nothing, userId=nothing)
        new(attribute, createVolumePermission, dryRun, operationType, snapshotId, userGroup, userId)
    end
    ModifySnapshotAttributeRequest(pd) = parse_from_xml(ModifySnapshotAttributeRequest, EC2TypeDict, pd)
end # ModifySnapshotAttributeRequest
export ModifySnapshotAttributeRequest

function ModifySnapshotAttribute(env::AWSEnv, msg::ModifySnapshotAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifySnapshotAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifySnapshotAttributeResult(resp.pd)
    end
    resp
end
ModifySnapshotAttribute(env::AWSEnv; kwargs...) = ModifySnapshotAttribute(env, ModifySnapshotAttributeRequest(; kwargs...))
export ModifySnapshotAttribute

type DisassociateVpcCidrBlockResult <: AbstractAWSType
    ipv6CidrBlockAssociation::Union{Void,VpcIpv6CidrBlockAssociation}
    requestId::Union{Void,String}
    vpcId::Union{Void,String}
    function DisassociateVpcCidrBlockResult(;ipv6CidrBlockAssociation=nothing, requestId=nothing, vpcId=nothing)
        new(ipv6CidrBlockAssociation, requestId, vpcId)
    end
    DisassociateVpcCidrBlockResult(pd) = parse_from_xml(DisassociateVpcCidrBlockResult, EC2TypeDict, pd)
end # DisassociateVpcCidrBlockResult
export DisassociateVpcCidrBlockResult

type DisassociateVpcCidrBlockRequest <: AbstractAWSType
    associationId::Union{Void,String}
    function DisassociateVpcCidrBlockRequest(;associationId=nothing)
        new(associationId)
    end
    DisassociateVpcCidrBlockRequest(pd) = parse_from_xml(DisassociateVpcCidrBlockRequest, EC2TypeDict, pd)
end # DisassociateVpcCidrBlockRequest
export DisassociateVpcCidrBlockRequest

function DisassociateVpcCidrBlock(env::AWSEnv, msg::DisassociateVpcCidrBlockRequest)
    resp::EC2Response = ec2_execute(env, "DisassociateVpcCidrBlock", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisassociateVpcCidrBlockResult(resp.pd)
    end
    resp
end
DisassociateVpcCidrBlock(env::AWSEnv; kwargs...) = DisassociateVpcCidrBlock(env, DisassociateVpcCidrBlockRequest(; kwargs...))
export DisassociateVpcCidrBlock

type CreateTagsResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CreateTagsResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CreateTagsResult(pd) = parse_from_xml(CreateTagsResult, EC2TypeDict, pd)
end # CreateTagsResult
export CreateTagsResult

type CreateTagsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    resourceId::Union{Void,Array{String,1}}
    tag::Union{Void,Array{Tag,1}}
    function CreateTagsRequest(;dryRun=nothing, resourceId=nothing, tag=nothing)
        new(dryRun, resourceId, tag)
    end
    CreateTagsRequest(pd) = parse_from_xml(CreateTagsRequest, EC2TypeDict, pd)
end # CreateTagsRequest
export CreateTagsRequest

function CreateTags(env::AWSEnv, msg::CreateTagsRequest)
    resp::EC2Response = ec2_execute(env, "CreateTags", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateTagsResult(resp.pd)
    end
    resp
end
CreateTags(env::AWSEnv; kwargs...) = CreateTags(env, CreateTagsRequest(; kwargs...))
export CreateTags

type DescribeReservedInstancesResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesSet::Union{Void,Array{ReservedInstances,1}}
    function DescribeReservedInstancesResult(;requestId=nothing, reservedInstancesSet=nothing)
        new(requestId, reservedInstancesSet)
    end
    DescribeReservedInstancesResult(pd) = parse_from_xml(DescribeReservedInstancesResult, EC2TypeDict, pd)
end # DescribeReservedInstancesResult
export DescribeReservedInstancesResult

type DescribeReservedInstancesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    offeringClass::Union{Void,String}
    offeringType::Union{Void,String}
    reservedInstancesId::Union{Void,Array{String,1}}
    function DescribeReservedInstancesRequest(;dryRun=nothing, filter=nothing, offeringClass=nothing, offeringType=nothing, reservedInstancesId=nothing)
        new(dryRun, filter, offeringClass, offeringType, reservedInstancesId)
    end
    DescribeReservedInstancesRequest(pd) = parse_from_xml(DescribeReservedInstancesRequest, EC2TypeDict, pd)
end # DescribeReservedInstancesRequest
export DescribeReservedInstancesRequest

function DescribeReservedInstances(env::AWSEnv, msg::DescribeReservedInstancesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeReservedInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeReservedInstancesResult(resp.pd)
    end
    resp
end
DescribeReservedInstances(env::AWSEnv; kwargs...) = DescribeReservedInstances(env, DescribeReservedInstancesRequest(; kwargs...))
export DescribeReservedInstances

type AttachNetworkInterfaceResult <: AbstractAWSType
    attachmentId::Union{Void,String}
    requestId::Union{Void,String}
    function AttachNetworkInterfaceResult(;attachmentId=nothing, requestId=nothing)
        new(attachmentId, requestId)
    end
    AttachNetworkInterfaceResult(pd) = parse_from_xml(AttachNetworkInterfaceResult, EC2TypeDict, pd)
end # AttachNetworkInterfaceResult
export AttachNetworkInterfaceResult

type AttachNetworkInterfaceRequest <: AbstractAWSType
    deviceIndex::Union{Void,Int64}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,String}
    networkInterfaceId::Union{Void,String}
    function AttachNetworkInterfaceRequest(;deviceIndex=nothing, dryRun=nothing, instanceId=nothing, networkInterfaceId=nothing)
        new(deviceIndex, dryRun, instanceId, networkInterfaceId)
    end
    AttachNetworkInterfaceRequest(pd) = parse_from_xml(AttachNetworkInterfaceRequest, EC2TypeDict, pd)
end # AttachNetworkInterfaceRequest
export AttachNetworkInterfaceRequest

function AttachNetworkInterface(env::AWSEnv, msg::AttachNetworkInterfaceRequest)
    resp::EC2Response = ec2_execute(env, "AttachNetworkInterface", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = AttachNetworkInterfaceResult(resp.pd)
    end
    resp
end
AttachNetworkInterface(env::AWSEnv; kwargs...) = AttachNetworkInterface(env, AttachNetworkInterfaceRequest(; kwargs...))
export AttachNetworkInterface

type DeleteDhcpOptionsResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteDhcpOptionsResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteDhcpOptionsResult(pd) = parse_from_xml(DeleteDhcpOptionsResult, EC2TypeDict, pd)
end # DeleteDhcpOptionsResult
export DeleteDhcpOptionsResult

type DeleteDhcpOptionsRequest <: AbstractAWSType
    dhcpOptionsId::Union{Void,String}
    dryRun::Union{Void,Bool}
    function DeleteDhcpOptionsRequest(;dhcpOptionsId=nothing, dryRun=nothing)
        new(dhcpOptionsId, dryRun)
    end
    DeleteDhcpOptionsRequest(pd) = parse_from_xml(DeleteDhcpOptionsRequest, EC2TypeDict, pd)
end # DeleteDhcpOptionsRequest
export DeleteDhcpOptionsRequest

function DeleteDhcpOptions(env::AWSEnv, msg::DeleteDhcpOptionsRequest)
    resp::EC2Response = ec2_execute(env, "DeleteDhcpOptions", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteDhcpOptionsResult(resp.pd)
    end
    resp
end
DeleteDhcpOptions(env::AWSEnv; kwargs...) = DeleteDhcpOptions(env, DeleteDhcpOptionsRequest(; kwargs...))
export DeleteDhcpOptions

type DescribeNetworkAclsResult <: AbstractAWSType
    networkAclSet::Union{Void,Array{NetworkAcl,1}}
    requestId::Union{Void,String}
    function DescribeNetworkAclsResult(;networkAclSet=nothing, requestId=nothing)
        new(networkAclSet, requestId)
    end
    DescribeNetworkAclsResult(pd) = parse_from_xml(DescribeNetworkAclsResult, EC2TypeDict, pd)
end # DescribeNetworkAclsResult
export DescribeNetworkAclsResult

type DescribeNetworkAclsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    networkAclId::Union{Void,Array{String,1}}
    function DescribeNetworkAclsRequest(;dryRun=nothing, filter=nothing, networkAclId=nothing)
        new(dryRun, filter, networkAclId)
    end
    DescribeNetworkAclsRequest(pd) = parse_from_xml(DescribeNetworkAclsRequest, EC2TypeDict, pd)
end # DescribeNetworkAclsRequest
export DescribeNetworkAclsRequest

function DescribeNetworkAcls(env::AWSEnv, msg::DescribeNetworkAclsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeNetworkAcls", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNetworkAclsResult(resp.pd)
    end
    resp
end
DescribeNetworkAcls(env::AWSEnv; kwargs...) = DescribeNetworkAcls(env, DescribeNetworkAclsRequest(; kwargs...))
export DescribeNetworkAcls

type DeleteVpnConnectionResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteVpnConnectionResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteVpnConnectionResult(pd) = parse_from_xml(DeleteVpnConnectionResult, EC2TypeDict, pd)
end # DeleteVpnConnectionResult
export DeleteVpnConnectionResult

type DeleteVpnConnectionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    vpnConnectionId::Union{Void,String}
    function DeleteVpnConnectionRequest(;dryRun=nothing, vpnConnectionId=nothing)
        new(dryRun, vpnConnectionId)
    end
    DeleteVpnConnectionRequest(pd) = parse_from_xml(DeleteVpnConnectionRequest, EC2TypeDict, pd)
end # DeleteVpnConnectionRequest
export DeleteVpnConnectionRequest

function DeleteVpnConnection(env::AWSEnv, msg::DeleteVpnConnectionRequest)
    resp::EC2Response = ec2_execute(env, "DeleteVpnConnection", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteVpnConnectionResult(resp.pd)
    end
    resp
end
DeleteVpnConnection(env::AWSEnv; kwargs...) = DeleteVpnConnection(env, DeleteVpnConnectionRequest(; kwargs...))
export DeleteVpnConnection

type RestoreAddressToClassicResult <: AbstractAWSType
    publicIp::Union{Void,String}
    requestId::Union{Void,String}
    status::Union{Void,String}
    function RestoreAddressToClassicResult(;publicIp=nothing, requestId=nothing, status=nothing)
        new(publicIp, requestId, status)
    end
    RestoreAddressToClassicResult(pd) = parse_from_xml(RestoreAddressToClassicResult, EC2TypeDict, pd)
end # RestoreAddressToClassicResult
export RestoreAddressToClassicResult

type RestoreAddressToClassicRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    publicIp::Union{Void,String}
    function RestoreAddressToClassicRequest(;dryRun=nothing, publicIp=nothing)
        new(dryRun, publicIp)
    end
    RestoreAddressToClassicRequest(pd) = parse_from_xml(RestoreAddressToClassicRequest, EC2TypeDict, pd)
end # RestoreAddressToClassicRequest
export RestoreAddressToClassicRequest

function RestoreAddressToClassic(env::AWSEnv, msg::RestoreAddressToClassicRequest)
    resp::EC2Response = ec2_execute(env, "RestoreAddressToClassic", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RestoreAddressToClassicResult(resp.pd)
    end
    resp
end
RestoreAddressToClassic(env::AWSEnv; kwargs...) = RestoreAddressToClassic(env, RestoreAddressToClassicRequest(; kwargs...))
export RestoreAddressToClassic

type CancelReservedInstancesListingResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesListingsSet::Union{Void,Array{ReservedInstancesListing,1}}
    function CancelReservedInstancesListingResult(;requestId=nothing, reservedInstancesListingsSet=nothing)
        new(requestId, reservedInstancesListingsSet)
    end
    CancelReservedInstancesListingResult(pd) = parse_from_xml(CancelReservedInstancesListingResult, EC2TypeDict, pd)
end # CancelReservedInstancesListingResult
export CancelReservedInstancesListingResult

type CancelReservedInstancesListingRequest <: AbstractAWSType
    reservedInstancesListingId::Union{Void,String}
    function CancelReservedInstancesListingRequest(;reservedInstancesListingId=nothing)
        new(reservedInstancesListingId)
    end
    CancelReservedInstancesListingRequest(pd) = parse_from_xml(CancelReservedInstancesListingRequest, EC2TypeDict, pd)
end # CancelReservedInstancesListingRequest
export CancelReservedInstancesListingRequest

function CancelReservedInstancesListing(env::AWSEnv, msg::CancelReservedInstancesListingRequest)
    resp::EC2Response = ec2_execute(env, "CancelReservedInstancesListing", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelReservedInstancesListingResult(resp.pd)
    end
    resp
end
CancelReservedInstancesListing(env::AWSEnv; kwargs...) = CancelReservedInstancesListing(env, CancelReservedInstancesListingRequest(; kwargs...))
export CancelReservedInstancesListing

type DeleteRouteResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteRouteResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteRouteResult(pd) = parse_from_xml(DeleteRouteResult, EC2TypeDict, pd)
end # DeleteRouteResult
export DeleteRouteResult

type DeleteRouteRequest <: AbstractAWSType
    destinationCidrBlock::Union{Void,String}
    destinationIpv6CidrBlock::Union{Void,String}
    dryRun::Union{Void,Bool}
    routeTableId::Union{Void,String}
    function DeleteRouteRequest(;destinationCidrBlock=nothing, destinationIpv6CidrBlock=nothing, dryRun=nothing, routeTableId=nothing)
        new(destinationCidrBlock, destinationIpv6CidrBlock, dryRun, routeTableId)
    end
    DeleteRouteRequest(pd) = parse_from_xml(DeleteRouteRequest, EC2TypeDict, pd)
end # DeleteRouteRequest
export DeleteRouteRequest

function DeleteRoute(env::AWSEnv, msg::DeleteRouteRequest)
    resp::EC2Response = ec2_execute(env, "DeleteRoute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteRouteResult(resp.pd)
    end
    resp
end
DeleteRoute(env::AWSEnv; kwargs...) = DeleteRoute(env, DeleteRouteRequest(; kwargs...))
export DeleteRoute

type ImportInstanceResult <: AbstractAWSType
    conversionTask::Union{Void,ConversionTask}
    requestId::Union{Void,String}
    function ImportInstanceResult(;conversionTask=nothing, requestId=nothing)
        new(conversionTask, requestId)
    end
    ImportInstanceResult(pd) = parse_from_xml(ImportInstanceResult, EC2TypeDict, pd)
end # ImportInstanceResult
export ImportInstanceResult

type ImportInstanceRequest <: AbstractAWSType
    description::Union{Void,String}
    diskImage::Union{Void,Array{DiskImage,1}}
    dryRun::Union{Void,Bool}
    launchSpecification::Union{Void,ImportInstanceLaunchSpecification}
    platform::Union{Void,String}
    function ImportInstanceRequest(;description=nothing, diskImage=nothing, dryRun=nothing, launchSpecification=nothing, platform=nothing)
        new(description, diskImage, dryRun, launchSpecification, platform)
    end
    ImportInstanceRequest(pd) = parse_from_xml(ImportInstanceRequest, EC2TypeDict, pd)
end # ImportInstanceRequest
export ImportInstanceRequest

function ImportInstance(env::AWSEnv, msg::ImportInstanceRequest)
    resp::EC2Response = ec2_execute(env, "ImportInstance", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ImportInstanceResult(resp.pd)
    end
    resp
end
ImportInstance(env::AWSEnv; kwargs...) = ImportInstance(env, ImportInstanceRequest(; kwargs...))
export ImportInstance

type DescribeVolumeStatusResult <: AbstractAWSType
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    volumeStatusSet::Union{Void,Array{VolumeStatusItem,1}}
    function DescribeVolumeStatusResult(;nextToken=nothing, requestId=nothing, volumeStatusSet=nothing)
        new(nextToken, requestId, volumeStatusSet)
    end
    DescribeVolumeStatusResult(pd) = parse_from_xml(DescribeVolumeStatusResult, EC2TypeDict, pd)
end # DescribeVolumeStatusResult
export DescribeVolumeStatusResult

type DescribeVolumeStatusRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    volumeId::Union{Void,Array{String,1}}
    function DescribeVolumeStatusRequest(;dryRun=nothing, filter=nothing, maxResults=nothing, nextToken=nothing, volumeId=nothing)
        new(dryRun, filter, maxResults, nextToken, volumeId)
    end
    DescribeVolumeStatusRequest(pd) = parse_from_xml(DescribeVolumeStatusRequest, EC2TypeDict, pd)
end # DescribeVolumeStatusRequest
export DescribeVolumeStatusRequest

function DescribeVolumeStatus(env::AWSEnv, msg::DescribeVolumeStatusRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVolumeStatus", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVolumeStatusResult(resp.pd)
    end
    resp
end
DescribeVolumeStatus(env::AWSEnv; kwargs...) = DescribeVolumeStatus(env, DescribeVolumeStatusRequest(; kwargs...))
export DescribeVolumeStatus

type CreateVpnGatewayResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpnGateway::Union{Void,VpnGateway}
    function CreateVpnGatewayResult(;requestId=nothing, vpnGateway=nothing)
        new(requestId, vpnGateway)
    end
    CreateVpnGatewayResult(pd) = parse_from_xml(CreateVpnGatewayResult, EC2TypeDict, pd)
end # CreateVpnGatewayResult
export CreateVpnGatewayResult

type CreateVpnGatewayRequest <: AbstractAWSType
    availabilityZone::Union{Void,String}
    dryRun::Union{Void,Bool}
    _Type::Union{Void,String}
    function CreateVpnGatewayRequest(;availabilityZone=nothing, dryRun=nothing, _Type=nothing)
        new(availabilityZone, dryRun, _Type)
    end
    CreateVpnGatewayRequest(pd) = parse_from_xml(CreateVpnGatewayRequest, EC2TypeDict, pd)
end # CreateVpnGatewayRequest
export CreateVpnGatewayRequest

function CreateVpnGateway(env::AWSEnv, msg::CreateVpnGatewayRequest)
    resp::EC2Response = ec2_execute(env, "CreateVpnGateway", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateVpnGatewayResult(resp.pd)
    end
    resp
end
CreateVpnGateway(env::AWSEnv; kwargs...) = CreateVpnGateway(env, CreateVpnGatewayRequest(; kwargs...))
export CreateVpnGateway

type ModifySubnetAttributeResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function ModifySubnetAttributeResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    ModifySubnetAttributeResult(pd) = parse_from_xml(ModifySubnetAttributeResult, EC2TypeDict, pd)
end # ModifySubnetAttributeResult
export ModifySubnetAttributeResult

type ModifySubnetAttributeRequest <: AbstractAWSType
    assignIpv6AddressOnCreation::Union{Void,AttributeBooleanValue}
    mapPublicIpOnLaunch::Union{Void,AttributeBooleanValue}
    subnetId::Union{Void,String}
    function ModifySubnetAttributeRequest(;assignIpv6AddressOnCreation=nothing, mapPublicIpOnLaunch=nothing, subnetId=nothing)
        new(assignIpv6AddressOnCreation, mapPublicIpOnLaunch, subnetId)
    end
    ModifySubnetAttributeRequest(pd) = parse_from_xml(ModifySubnetAttributeRequest, EC2TypeDict, pd)
end # ModifySubnetAttributeRequest
export ModifySubnetAttributeRequest

function ModifySubnetAttribute(env::AWSEnv, msg::ModifySubnetAttributeRequest)
    resp::EC2Response = ec2_execute(env, "ModifySubnetAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ModifySubnetAttributeResult(resp.pd)
    end
    resp
end
ModifySubnetAttribute(env::AWSEnv; kwargs...) = ModifySubnetAttribute(env, ModifySubnetAttributeRequest(; kwargs...))
export ModifySubnetAttribute

type DescribeImageAttributeResult <: AbstractAWSType
    blockDeviceMapping::Union{Void,Array{BlockDeviceMapping,1}}
    description::Union{Void,AttributeValue}
    imageId::Union{Void,String}
    kernel::Union{Void,AttributeValue}
    launchPermission::Union{Void,Array{LaunchPermission,1}}
    productCodes::Union{Void,Array{ProductCode,1}}
    ramdisk::Union{Void,AttributeValue}
    requestId::Union{Void,String}
    sriovNetSupport::Union{Void,AttributeValue}
    function DescribeImageAttributeResult(;blockDeviceMapping=nothing, description=nothing, imageId=nothing, kernel=nothing, launchPermission=nothing, productCodes=nothing, ramdisk=nothing, requestId=nothing, sriovNetSupport=nothing)
        new(blockDeviceMapping, description, imageId, kernel, launchPermission, productCodes, ramdisk, requestId, sriovNetSupport)
    end
    DescribeImageAttributeResult(pd) = parse_from_xml(DescribeImageAttributeResult, EC2TypeDict, pd)
end # DescribeImageAttributeResult
export DescribeImageAttributeResult

type DescribeImageAttributeRequest <: AbstractAWSType
    attribute::Union{Void,String}
    dryRun::Union{Void,Bool}
    imageId::Union{Void,String}
    function DescribeImageAttributeRequest(;attribute=nothing, dryRun=nothing, imageId=nothing)
        new(attribute, dryRun, imageId)
    end
    DescribeImageAttributeRequest(pd) = parse_from_xml(DescribeImageAttributeRequest, EC2TypeDict, pd)
end # DescribeImageAttributeRequest
export DescribeImageAttributeRequest

function DescribeImageAttribute(env::AWSEnv, msg::DescribeImageAttributeRequest)
    resp::EC2Response = ec2_execute(env, "DescribeImageAttribute", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeImageAttributeResult(resp.pd)
    end
    resp
end
DescribeImageAttribute(env::AWSEnv; kwargs...) = DescribeImageAttribute(env, DescribeImageAttributeRequest(; kwargs...))
export DescribeImageAttribute

type DescribeImagesResult <: AbstractAWSType
    imagesSet::Union{Void,Array{Image,1}}
    requestId::Union{Void,String}
    function DescribeImagesResult(;imagesSet=nothing, requestId=nothing)
        new(imagesSet, requestId)
    end
    DescribeImagesResult(pd) = parse_from_xml(DescribeImagesResult, EC2TypeDict, pd)
end # DescribeImagesResult
export DescribeImagesResult

type DescribeImagesRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    executableBy::Union{Void,Array{String,1}}
    filter::Union{Void,Array{Filter,1}}
    imageId::Union{Void,Array{String,1}}
    owner::Union{Void,Array{String,1}}
    function DescribeImagesRequest(;dryRun=nothing, executableBy=nothing, filter=nothing, imageId=nothing, owner=nothing)
        new(dryRun, executableBy, filter, imageId, owner)
    end
    DescribeImagesRequest(pd) = parse_from_xml(DescribeImagesRequest, EC2TypeDict, pd)
end # DescribeImagesRequest
export DescribeImagesRequest

function DescribeImages(env::AWSEnv, msg::DescribeImagesRequest)
    resp::EC2Response = ec2_execute(env, "DescribeImages", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeImagesResult(resp.pd)
    end
    resp
end
DescribeImages(env::AWSEnv; kwargs...) = DescribeImages(env, DescribeImagesRequest(; kwargs...))
export DescribeImages

type ReplaceNetworkAclAssociationResult <: AbstractAWSType
    newAssociationId::Union{Void,String}
    requestId::Union{Void,String}
    function ReplaceNetworkAclAssociationResult(;newAssociationId=nothing, requestId=nothing)
        new(newAssociationId, requestId)
    end
    ReplaceNetworkAclAssociationResult(pd) = parse_from_xml(ReplaceNetworkAclAssociationResult, EC2TypeDict, pd)
end # ReplaceNetworkAclAssociationResult
export ReplaceNetworkAclAssociationResult

type ReplaceNetworkAclAssociationRequest <: AbstractAWSType
    associationId::Union{Void,String}
    dryRun::Union{Void,Bool}
    networkAclId::Union{Void,String}
    function ReplaceNetworkAclAssociationRequest(;associationId=nothing, dryRun=nothing, networkAclId=nothing)
        new(associationId, dryRun, networkAclId)
    end
    ReplaceNetworkAclAssociationRequest(pd) = parse_from_xml(ReplaceNetworkAclAssociationRequest, EC2TypeDict, pd)
end # ReplaceNetworkAclAssociationRequest
export ReplaceNetworkAclAssociationRequest

function ReplaceNetworkAclAssociation(env::AWSEnv, msg::ReplaceNetworkAclAssociationRequest)
    resp::EC2Response = ec2_execute(env, "ReplaceNetworkAclAssociation", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReplaceNetworkAclAssociationResult(resp.pd)
    end
    resp
end
ReplaceNetworkAclAssociation(env::AWSEnv; kwargs...) = ReplaceNetworkAclAssociation(env, ReplaceNetworkAclAssociationRequest(; kwargs...))
export ReplaceNetworkAclAssociation

type DescribeFlowLogsResult <: AbstractAWSType
    flowLogSet::Union{Void,Array{FlowLog,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeFlowLogsResult(;flowLogSet=nothing, nextToken=nothing, requestId=nothing)
        new(flowLogSet, nextToken, requestId)
    end
    DescribeFlowLogsResult(pd) = parse_from_xml(DescribeFlowLogsResult, EC2TypeDict, pd)
end # DescribeFlowLogsResult
export DescribeFlowLogsResult

type DescribeFlowLogsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    flowLogId::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeFlowLogsRequest(;filter=nothing, flowLogId=nothing, maxResults=nothing, nextToken=nothing)
        new(filter, flowLogId, maxResults, nextToken)
    end
    DescribeFlowLogsRequest(pd) = parse_from_xml(DescribeFlowLogsRequest, EC2TypeDict, pd)
end # DescribeFlowLogsRequest
export DescribeFlowLogsRequest

function DescribeFlowLogs(env::AWSEnv, msg::DescribeFlowLogsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeFlowLogs", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeFlowLogsResult(resp.pd)
    end
    resp
end
DescribeFlowLogs(env::AWSEnv; kwargs...) = DescribeFlowLogs(env, DescribeFlowLogsRequest(; kwargs...))
export DescribeFlowLogs

type DescribeCustomerGatewaysResult <: AbstractAWSType
    customerGatewaySet::Union{Void,Array{CustomerGateway,1}}
    requestId::Union{Void,String}
    function DescribeCustomerGatewaysResult(;customerGatewaySet=nothing, requestId=nothing)
        new(customerGatewaySet, requestId)
    end
    DescribeCustomerGatewaysResult(pd) = parse_from_xml(DescribeCustomerGatewaysResult, EC2TypeDict, pd)
end # DescribeCustomerGatewaysResult
export DescribeCustomerGatewaysResult

type DescribeCustomerGatewaysRequest <: AbstractAWSType
    customerGatewayId::Union{Void,Array{String,1}}
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    function DescribeCustomerGatewaysRequest(;customerGatewayId=nothing, dryRun=nothing, filter=nothing)
        new(customerGatewayId, dryRun, filter)
    end
    DescribeCustomerGatewaysRequest(pd) = parse_from_xml(DescribeCustomerGatewaysRequest, EC2TypeDict, pd)
end # DescribeCustomerGatewaysRequest
export DescribeCustomerGatewaysRequest

function DescribeCustomerGateways(env::AWSEnv, msg::DescribeCustomerGatewaysRequest)
    resp::EC2Response = ec2_execute(env, "DescribeCustomerGateways", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeCustomerGatewaysResult(resp.pd)
    end
    resp
end
DescribeCustomerGateways(env::AWSEnv; kwargs...) = DescribeCustomerGateways(env, DescribeCustomerGatewaysRequest(; kwargs...))
export DescribeCustomerGateways

type RevokeSecurityGroupEgressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function RevokeSecurityGroupEgressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    RevokeSecurityGroupEgressResult(pd) = parse_from_xml(RevokeSecurityGroupEgressResult, EC2TypeDict, pd)
end # RevokeSecurityGroupEgressResult
export RevokeSecurityGroupEgressResult

type RevokeSecurityGroupEgressRequest <: AbstractAWSType
    cidrIp::Union{Void,String}
    dryRun::Union{Void,Bool}
    fromPort::Union{Void,Int64}
    groupId::Union{Void,String}
    ipPermissions::Union{Void,Array{IpPermission,1}}
    ipProtocol::Union{Void,String}
    sourceSecurityGroupName::Union{Void,String}
    sourceSecurityGroupOwnerId::Union{Void,String}
    toPort::Union{Void,Int64}
    function RevokeSecurityGroupEgressRequest(;cidrIp=nothing, dryRun=nothing, fromPort=nothing, groupId=nothing, ipPermissions=nothing, ipProtocol=nothing, sourceSecurityGroupName=nothing, sourceSecurityGroupOwnerId=nothing, toPort=nothing)
        new(cidrIp, dryRun, fromPort, groupId, ipPermissions, ipProtocol, sourceSecurityGroupName, sourceSecurityGroupOwnerId, toPort)
    end
    RevokeSecurityGroupEgressRequest(pd) = parse_from_xml(RevokeSecurityGroupEgressRequest, EC2TypeDict, pd)
end # RevokeSecurityGroupEgressRequest
export RevokeSecurityGroupEgressRequest

function RevokeSecurityGroupEgress(env::AWSEnv, msg::RevokeSecurityGroupEgressRequest)
    resp::EC2Response = ec2_execute(env, "RevokeSecurityGroupEgress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = RevokeSecurityGroupEgressResult(resp.pd)
    end
    resp
end
RevokeSecurityGroupEgress(env::AWSEnv; kwargs...) = RevokeSecurityGroupEgress(env, RevokeSecurityGroupEgressRequest(; kwargs...))
export RevokeSecurityGroupEgress

type DescribeSpotFleetRequestHistoryResult <: AbstractAWSType
    historyRecordSet::Union{Void,Array{HistoryRecord,1}}
    lastEvaluatedTime::Union{Void,DateTime}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    startTime::Union{Void,DateTime}
    function DescribeSpotFleetRequestHistoryResult(;historyRecordSet=nothing, lastEvaluatedTime=nothing, nextToken=nothing, requestId=nothing, spotFleetRequestId=nothing, startTime=nothing)
        new(historyRecordSet, lastEvaluatedTime, nextToken, requestId, spotFleetRequestId, startTime)
    end
    DescribeSpotFleetRequestHistoryResult(pd) = parse_from_xml(DescribeSpotFleetRequestHistoryResult, EC2TypeDict, pd)
end # DescribeSpotFleetRequestHistoryResult
export DescribeSpotFleetRequestHistoryResult

type DescribeSpotFleetRequestHistoryRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    eventType::Union{Void,String}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    spotFleetRequestId::Union{Void,String}
    startTime::Union{Void,DateTime}
    function DescribeSpotFleetRequestHistoryRequest(;dryRun=nothing, eventType=nothing, maxResults=nothing, nextToken=nothing, spotFleetRequestId=nothing, startTime=nothing)
        new(dryRun, eventType, maxResults, nextToken, spotFleetRequestId, startTime)
    end
    DescribeSpotFleetRequestHistoryRequest(pd) = parse_from_xml(DescribeSpotFleetRequestHistoryRequest, EC2TypeDict, pd)
end # DescribeSpotFleetRequestHistoryRequest
export DescribeSpotFleetRequestHistoryRequest

function DescribeSpotFleetRequestHistory(env::AWSEnv, msg::DescribeSpotFleetRequestHistoryRequest)
    resp::EC2Response = ec2_execute(env, "DescribeSpotFleetRequestHistory", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeSpotFleetRequestHistoryResult(resp.pd)
    end
    resp
end
DescribeSpotFleetRequestHistory(env::AWSEnv; kwargs...) = DescribeSpotFleetRequestHistory(env, DescribeSpotFleetRequestHistoryRequest(; kwargs...))
export DescribeSpotFleetRequestHistory

type DescribeNatGatewaysResult <: AbstractAWSType
    natGatewaySet::Union{Void,Array{NatGateway,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeNatGatewaysResult(;natGatewaySet=nothing, nextToken=nothing, requestId=nothing)
        new(natGatewaySet, nextToken, requestId)
    end
    DescribeNatGatewaysResult(pd) = parse_from_xml(DescribeNatGatewaysResult, EC2TypeDict, pd)
end # DescribeNatGatewaysResult
export DescribeNatGatewaysResult

type DescribeNatGatewaysRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    maxResults::Union{Void,Int64}
    natGatewayId::Union{Void,Array{String,1}}
    nextToken::Union{Void,String}
    function DescribeNatGatewaysRequest(;filter=nothing, maxResults=nothing, natGatewayId=nothing, nextToken=nothing)
        new(filter, maxResults, natGatewayId, nextToken)
    end
    DescribeNatGatewaysRequest(pd) = parse_from_xml(DescribeNatGatewaysRequest, EC2TypeDict, pd)
end # DescribeNatGatewaysRequest
export DescribeNatGatewaysRequest

function DescribeNatGateways(env::AWSEnv, msg::DescribeNatGatewaysRequest)
    resp::EC2Response = ec2_execute(env, "DescribeNatGateways", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeNatGatewaysResult(resp.pd)
    end
    resp
end
DescribeNatGateways(env::AWSEnv; kwargs...) = DescribeNatGateways(env, DescribeNatGatewaysRequest(; kwargs...))
export DescribeNatGateways

type PurchaseReservedInstancesOfferingResult <: AbstractAWSType
    requestId::Union{Void,String}
    reservedInstancesId::Union{Void,String}
    function PurchaseReservedInstancesOfferingResult(;requestId=nothing, reservedInstancesId=nothing)
        new(requestId, reservedInstancesId)
    end
    PurchaseReservedInstancesOfferingResult(pd) = parse_from_xml(PurchaseReservedInstancesOfferingResult, EC2TypeDict, pd)
end # PurchaseReservedInstancesOfferingResult
export PurchaseReservedInstancesOfferingResult

type PurchaseReservedInstancesOfferingRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    instanceCount::Union{Void,Int64}
    limitPrice::Union{Void,ReservedInstanceLimitPrice}
    reservedInstancesOfferingId::Union{Void,String}
    function PurchaseReservedInstancesOfferingRequest(;dryRun=nothing, instanceCount=nothing, limitPrice=nothing, reservedInstancesOfferingId=nothing)
        new(dryRun, instanceCount, limitPrice, reservedInstancesOfferingId)
    end
    PurchaseReservedInstancesOfferingRequest(pd) = parse_from_xml(PurchaseReservedInstancesOfferingRequest, EC2TypeDict, pd)
end # PurchaseReservedInstancesOfferingRequest
export PurchaseReservedInstancesOfferingRequest

function PurchaseReservedInstancesOffering(env::AWSEnv, msg::PurchaseReservedInstancesOfferingRequest)
    resp::EC2Response = ec2_execute(env, "PurchaseReservedInstancesOffering", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = PurchaseReservedInstancesOfferingResult(resp.pd)
    end
    resp
end
PurchaseReservedInstancesOffering(env::AWSEnv; kwargs...) = PurchaseReservedInstancesOffering(env, PurchaseReservedInstancesOfferingRequest(; kwargs...))
export PurchaseReservedInstancesOffering

type CancelExportTaskResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function CancelExportTaskResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    CancelExportTaskResult(pd) = parse_from_xml(CancelExportTaskResult, EC2TypeDict, pd)
end # CancelExportTaskResult
export CancelExportTaskResult

type CancelExportTaskRequest <: AbstractAWSType
    exportTaskId::Union{Void,String}
    function CancelExportTaskRequest(;exportTaskId=nothing)
        new(exportTaskId)
    end
    CancelExportTaskRequest(pd) = parse_from_xml(CancelExportTaskRequest, EC2TypeDict, pd)
end # CancelExportTaskRequest
export CancelExportTaskRequest

function CancelExportTask(env::AWSEnv, msg::CancelExportTaskRequest)
    resp::EC2Response = ec2_execute(env, "CancelExportTask", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CancelExportTaskResult(resp.pd)
    end
    resp
end
CancelExportTask(env::AWSEnv; kwargs...) = CancelExportTask(env, CancelExportTaskRequest(; kwargs...))
export CancelExportTask

type StartInstancesResult <: AbstractAWSType
    instancesSet::Union{Void,Array{InstanceStateChange,1}}
    requestId::Union{Void,String}
    function StartInstancesResult(;instancesSet=nothing, requestId=nothing)
        new(instancesSet, requestId)
    end
    StartInstancesResult(pd) = parse_from_xml(StartInstancesResult, EC2TypeDict, pd)
end # StartInstancesResult
export StartInstancesResult

type StartInstancesRequest <: AbstractAWSType
    additionalInfo::Union{Void,String}
    dryRun::Union{Void,Bool}
    instanceId::Union{Void,Array{String,1}}
    function StartInstancesRequest(;additionalInfo=nothing, dryRun=nothing, instanceId=nothing)
        new(additionalInfo, dryRun, instanceId)
    end
    StartInstancesRequest(pd) = parse_from_xml(StartInstancesRequest, EC2TypeDict, pd)
end # StartInstancesRequest
export StartInstancesRequest

function StartInstances(env::AWSEnv, msg::StartInstancesRequest)
    resp::EC2Response = ec2_execute(env, "StartInstances", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = StartInstancesResult(resp.pd)
    end
    resp
end
StartInstances(env::AWSEnv; kwargs...) = StartInstances(env, StartInstancesRequest(; kwargs...))
export StartInstances

type DeleteSpotDatafeedSubscriptionResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteSpotDatafeedSubscriptionResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteSpotDatafeedSubscriptionResult(pd) = parse_from_xml(DeleteSpotDatafeedSubscriptionResult, EC2TypeDict, pd)
end # DeleteSpotDatafeedSubscriptionResult
export DeleteSpotDatafeedSubscriptionResult

type DeleteSpotDatafeedSubscriptionRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    function DeleteSpotDatafeedSubscriptionRequest(;dryRun=nothing)
        new(dryRun)
    end
    DeleteSpotDatafeedSubscriptionRequest(pd) = parse_from_xml(DeleteSpotDatafeedSubscriptionRequest, EC2TypeDict, pd)
end # DeleteSpotDatafeedSubscriptionRequest
export DeleteSpotDatafeedSubscriptionRequest

function DeleteSpotDatafeedSubscription(env::AWSEnv, msg::DeleteSpotDatafeedSubscriptionRequest)
    resp::EC2Response = ec2_execute(env, "DeleteSpotDatafeedSubscription", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteSpotDatafeedSubscriptionResult(resp.pd)
    end
    resp
end
DeleteSpotDatafeedSubscription(env::AWSEnv; kwargs...) = DeleteSpotDatafeedSubscription(env, DeleteSpotDatafeedSubscriptionRequest(; kwargs...))
export DeleteSpotDatafeedSubscription

type DescribeHostReservationsResult <: AbstractAWSType
    hostReservationSet::Union{Void,Array{HostReservation,1}}
    nextToken::Union{Void,String}
    requestId::Union{Void,String}
    function DescribeHostReservationsResult(;hostReservationSet=nothing, nextToken=nothing, requestId=nothing)
        new(hostReservationSet, nextToken, requestId)
    end
    DescribeHostReservationsResult(pd) = parse_from_xml(DescribeHostReservationsResult, EC2TypeDict, pd)
end # DescribeHostReservationsResult
export DescribeHostReservationsResult

type DescribeHostReservationsRequest <: AbstractAWSType
    filter::Union{Void,Array{Filter,1}}
    hostReservationIdSet::Union{Void,Array{String,1}}
    maxResults::Union{Void,Int64}
    nextToken::Union{Void,String}
    function DescribeHostReservationsRequest(;filter=nothing, hostReservationIdSet=nothing, maxResults=nothing, nextToken=nothing)
        new(filter, hostReservationIdSet, maxResults, nextToken)
    end
    DescribeHostReservationsRequest(pd) = parse_from_xml(DescribeHostReservationsRequest, EC2TypeDict, pd)
end # DescribeHostReservationsRequest
export DescribeHostReservationsRequest

function DescribeHostReservations(env::AWSEnv, msg::DescribeHostReservationsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeHostReservations", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeHostReservationsResult(resp.pd)
    end
    resp
end
DescribeHostReservations(env::AWSEnv; kwargs...) = DescribeHostReservations(env, DescribeHostReservationsRequest(; kwargs...))
export DescribeHostReservations

type DisassociateAddressResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DisassociateAddressResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DisassociateAddressResult(pd) = parse_from_xml(DisassociateAddressResult, EC2TypeDict, pd)
end # DisassociateAddressResult
export DisassociateAddressResult

type DisassociateAddressRequest <: AbstractAWSType
    associationId::Union{Void,String}
    dryRun::Union{Void,Bool}
    publicIp::Union{Void,String}
    function DisassociateAddressRequest(;associationId=nothing, dryRun=nothing, publicIp=nothing)
        new(associationId, dryRun, publicIp)
    end
    DisassociateAddressRequest(pd) = parse_from_xml(DisassociateAddressRequest, EC2TypeDict, pd)
end # DisassociateAddressRequest
export DisassociateAddressRequest

function DisassociateAddress(env::AWSEnv, msg::DisassociateAddressRequest)
    resp::EC2Response = ec2_execute(env, "DisassociateAddress", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DisassociateAddressResult(resp.pd)
    end
    resp
end
DisassociateAddress(env::AWSEnv; kwargs...) = DisassociateAddress(env, DisassociateAddressRequest(; kwargs...))
export DisassociateAddress

type DetachNetworkInterfaceResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DetachNetworkInterfaceResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DetachNetworkInterfaceResult(pd) = parse_from_xml(DetachNetworkInterfaceResult, EC2TypeDict, pd)
end # DetachNetworkInterfaceResult
export DetachNetworkInterfaceResult

type DetachNetworkInterfaceRequest <: AbstractAWSType
    attachmentId::Union{Void,String}
    dryRun::Union{Void,Bool}
    force::Union{Void,Bool}
    function DetachNetworkInterfaceRequest(;attachmentId=nothing, dryRun=nothing, force=nothing)
        new(attachmentId, dryRun, force)
    end
    DetachNetworkInterfaceRequest(pd) = parse_from_xml(DetachNetworkInterfaceRequest, EC2TypeDict, pd)
end # DetachNetworkInterfaceRequest
export DetachNetworkInterfaceRequest

function DetachNetworkInterface(env::AWSEnv, msg::DetachNetworkInterfaceRequest)
    resp::EC2Response = ec2_execute(env, "DetachNetworkInterface", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DetachNetworkInterfaceResult(resp.pd)
    end
    resp
end
DetachNetworkInterface(env::AWSEnv; kwargs...) = DetachNetworkInterface(env, DetachNetworkInterfaceRequest(; kwargs...))
export DetachNetworkInterface

type DescribeVpcsResult <: AbstractAWSType
    requestId::Union{Void,String}
    vpcSet::Union{Void,Array{Vpc,1}}
    function DescribeVpcsResult(;requestId=nothing, vpcSet=nothing)
        new(requestId, vpcSet)
    end
    DescribeVpcsResult(pd) = parse_from_xml(DescribeVpcsResult, EC2TypeDict, pd)
end # DescribeVpcsResult
export DescribeVpcsResult

type DescribeVpcsRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    filter::Union{Void,Array{Filter,1}}
    vpcId::Union{Void,Array{String,1}}
    function DescribeVpcsRequest(;dryRun=nothing, filter=nothing, vpcId=nothing)
        new(dryRun, filter, vpcId)
    end
    DescribeVpcsRequest(pd) = parse_from_xml(DescribeVpcsRequest, EC2TypeDict, pd)
end # DescribeVpcsRequest
export DescribeVpcsRequest

function DescribeVpcs(env::AWSEnv, msg::DescribeVpcsRequest)
    resp::EC2Response = ec2_execute(env, "DescribeVpcs", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DescribeVpcsResult(resp.pd)
    end
    resp
end
DescribeVpcs(env::AWSEnv; kwargs...) = DescribeVpcs(env, DescribeVpcsRequest(; kwargs...))
export DescribeVpcs

type DeleteNetworkAclEntryResult <: AbstractAWSType
    requestId::Union{Void,String}
    _return::Union{Void,Bool}
    function DeleteNetworkAclEntryResult(;requestId=nothing, _return=nothing)
        new(requestId, _return)
    end
    DeleteNetworkAclEntryResult(pd) = parse_from_xml(DeleteNetworkAclEntryResult, EC2TypeDict, pd)
end # DeleteNetworkAclEntryResult
export DeleteNetworkAclEntryResult

type DeleteNetworkAclEntryRequest <: AbstractAWSType
    dryRun::Union{Void,Bool}
    egress::Union{Void,Bool}
    networkAclId::Union{Void,String}
    ruleNumber::Union{Void,Int64}
    function DeleteNetworkAclEntryRequest(;dryRun=nothing, egress=nothing, networkAclId=nothing, ruleNumber=nothing)
        new(dryRun, egress, networkAclId, ruleNumber)
    end
    DeleteNetworkAclEntryRequest(pd) = parse_from_xml(DeleteNetworkAclEntryRequest, EC2TypeDict, pd)
end # DeleteNetworkAclEntryRequest
export DeleteNetworkAclEntryRequest

function DeleteNetworkAclEntry(env::AWSEnv, msg::DeleteNetworkAclEntryRequest)
    resp::EC2Response = ec2_execute(env, "DeleteNetworkAclEntry", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteNetworkAclEntryResult(resp.pd)
    end
    resp
end
DeleteNetworkAclEntry(env::AWSEnv; kwargs...) = DeleteNetworkAclEntry(env, DeleteNetworkAclEntryRequest(; kwargs...))
export DeleteNetworkAclEntry
