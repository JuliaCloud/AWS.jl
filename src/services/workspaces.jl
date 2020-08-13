# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: workspaces

using Compat
using UUIDs
"""
    AssociateIpGroups()

Associates the specified IP access control group with the specified directory.

# Required Parameters
- `DirectoryId`: The identifier of the directory.
- `GroupIds`: The identifiers of one or more IP access control groups.

"""
AssociateIpGroups(DirectoryId, GroupIds; aws::AWSConfig=AWSConfig()) = workspaces("AssociateIpGroups", Dict{String, Any}("DirectoryId"=>DirectoryId, "GroupIds"=>GroupIds); aws=aws)
AssociateIpGroups(DirectoryId, GroupIds, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("AssociateIpGroups", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DirectoryId"=>DirectoryId, "GroupIds"=>GroupIds), args)); aws=aws)

"""
    AuthorizeIpRules()

Adds one or more rules to the specified IP access control group. This action gives users permission to access their WorkSpaces from the CIDR address ranges specified in the rules.

# Required Parameters
- `GroupId`: The identifier of the group.
- `UserRules`: The rules to add to the group.

"""
AuthorizeIpRules(GroupId, UserRules; aws::AWSConfig=AWSConfig()) = workspaces("AuthorizeIpRules", Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules); aws=aws)
AuthorizeIpRules(GroupId, UserRules, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("AuthorizeIpRules", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules), args)); aws=aws)

"""
    CopyWorkspaceImage()

Copies the specified image from the specified Region to the current Region.

# Required Parameters
- `Name`: The name of the image.
- `SourceImageId`: The identifier of the source image.
- `SourceRegion`: The identifier of the source Region.

# Optional Parameters
- `Description`: A description of the image.
- `Tags`: The tags for the image.
"""
CopyWorkspaceImage(Name, SourceImageId, SourceRegion; aws::AWSConfig=AWSConfig()) = workspaces("CopyWorkspaceImage", Dict{String, Any}("Name"=>Name, "SourceImageId"=>SourceImageId, "SourceRegion"=>SourceRegion); aws=aws)
CopyWorkspaceImage(Name, SourceImageId, SourceRegion, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("CopyWorkspaceImage", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name, "SourceImageId"=>SourceImageId, "SourceRegion"=>SourceRegion), args)); aws=aws)

"""
    CreateIpGroup()

Creates an IP access control group. An IP access control group provides you with the ability to control the IP addresses from which users are allowed to access their WorkSpaces. To specify the CIDR address ranges, add rules to your IP access control group and then associate the group with your directory. You can add rules when you create the group or at any time using AuthorizeIpRules. There is a default IP access control group associated with your directory. If you don't associate an IP access control group with your directory, the default group is used. The default group includes a default rule that allows users to access their WorkSpaces from anywhere. You cannot modify the default IP access control group for your directory.

# Required Parameters
- `GroupName`: The name of the group.

# Optional Parameters
- `GroupDesc`: The description of the group.
- `Tags`: The tags. Each WorkSpaces resource can have a maximum of 50 tags.
- `UserRules`: The rules to add to the group.
"""
CreateIpGroup(GroupName; aws::AWSConfig=AWSConfig()) = workspaces("CreateIpGroup", Dict{String, Any}("GroupName"=>GroupName); aws=aws)
CreateIpGroup(GroupName, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("CreateIpGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupName"=>GroupName), args)); aws=aws)

"""
    CreateTags()

Creates the specified tags for the specified WorkSpaces resource.

# Required Parameters
- `ResourceId`: The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered directories, images, custom bundles, and IP access control groups.
- `Tags`: The tags. Each WorkSpaces resource can have a maximum of 50 tags. If you want to add new tags to a set of existing tags, you must submit all of the existing tags along with the new ones.

"""
CreateTags(ResourceId, Tags; aws::AWSConfig=AWSConfig()) = workspaces("CreateTags", Dict{String, Any}("ResourceId"=>ResourceId, "Tags"=>Tags); aws=aws)
CreateTags(ResourceId, Tags, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("CreateTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "Tags"=>Tags), args)); aws=aws)

"""
    CreateWorkspaces()

Creates one or more WorkSpaces. This operation is asynchronous and returns before the WorkSpaces are created.

# Required Parameters
- `Workspaces`: The WorkSpaces to create. You can specify up to 25 WorkSpaces.

"""
CreateWorkspaces(Workspaces; aws::AWSConfig=AWSConfig()) = workspaces("CreateWorkspaces", Dict{String, Any}("Workspaces"=>Workspaces); aws=aws)
CreateWorkspaces(Workspaces, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("CreateWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Workspaces"=>Workspaces), args)); aws=aws)

"""
    DeleteIpGroup()

Deletes the specified IP access control group. You cannot delete an IP access control group that is associated with a directory.

# Required Parameters
- `GroupId`: The identifier of the IP access control group.

"""
DeleteIpGroup(GroupId; aws::AWSConfig=AWSConfig()) = workspaces("DeleteIpGroup", Dict{String, Any}("GroupId"=>GroupId); aws=aws)
DeleteIpGroup(GroupId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DeleteIpGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupId"=>GroupId), args)); aws=aws)

"""
    DeleteTags()

Deletes the specified tags from the specified WorkSpaces resource.

# Required Parameters
- `ResourceId`: The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered directories, images, custom bundles, and IP access control groups.
- `TagKeys`: The tag keys.

"""
DeleteTags(ResourceId, TagKeys; aws::AWSConfig=AWSConfig()) = workspaces("DeleteTags", Dict{String, Any}("ResourceId"=>ResourceId, "TagKeys"=>TagKeys); aws=aws)
DeleteTags(ResourceId, TagKeys, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DeleteTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "TagKeys"=>TagKeys), args)); aws=aws)

"""
    DeleteWorkspaceImage()

Deletes the specified image from your account. To delete an image, you must first delete any bundles that are associated with the image and unshare the image if it is shared with other accounts. 

# Required Parameters
- `ImageId`: The identifier of the image.

"""
DeleteWorkspaceImage(ImageId; aws::AWSConfig=AWSConfig()) = workspaces("DeleteWorkspaceImage", Dict{String, Any}("ImageId"=>ImageId); aws=aws)
DeleteWorkspaceImage(ImageId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DeleteWorkspaceImage", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ImageId"=>ImageId), args)); aws=aws)

"""
    DeregisterWorkspaceDirectory()

Deregisters the specified directory. This operation is asynchronous and returns before the WorkSpace directory is deregistered. If any WorkSpaces are registered to this directory, you must remove them before you can deregister the directory.

# Required Parameters
- `DirectoryId`: The identifier of the directory. If any WorkSpaces are registered to this directory, you must remove them before you deregister the directory, or you will receive an OperationNotSupportedException error.

"""
DeregisterWorkspaceDirectory(DirectoryId; aws::AWSConfig=AWSConfig()) = workspaces("DeregisterWorkspaceDirectory", Dict{String, Any}("DirectoryId"=>DirectoryId); aws=aws)
DeregisterWorkspaceDirectory(DirectoryId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DeregisterWorkspaceDirectory", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DirectoryId"=>DirectoryId), args)); aws=aws)

"""
    DescribeAccount()

Retrieves a list that describes the configuration of Bring Your Own License (BYOL) for the specified account.

"""
DescribeAccount(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeAccount"; aws=aws)
DescribeAccount(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeAccount", args; aws=aws)

"""
    DescribeAccountModifications()

Retrieves a list that describes modifications to the configuration of Bring Your Own License (BYOL) for the specified account.

# Optional Parameters
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
DescribeAccountModifications(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeAccountModifications"; aws=aws)
DescribeAccountModifications(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeAccountModifications", args; aws=aws)

"""
    DescribeClientProperties()

Retrieves a list that describes one or more specified Amazon WorkSpaces clients.

# Required Parameters
- `ResourceIds`: The resource identifier, in the form of directory IDs.

"""
DescribeClientProperties(ResourceIds; aws::AWSConfig=AWSConfig()) = workspaces("DescribeClientProperties", Dict{String, Any}("ResourceIds"=>ResourceIds); aws=aws)
DescribeClientProperties(ResourceIds, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeClientProperties", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceIds"=>ResourceIds), args)); aws=aws)

"""
    DescribeIpGroups()

Describes one or more of your IP access control groups.

# Optional Parameters
- `GroupIds`: The identifiers of one or more IP access control groups.
- `MaxResults`: The maximum number of items to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
DescribeIpGroups(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeIpGroups"; aws=aws)
DescribeIpGroups(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeIpGroups", args; aws=aws)

"""
    DescribeTags()

Describes the specified tags for the specified WorkSpaces resource.

# Required Parameters
- `ResourceId`: The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered directories, images, custom bundles, and IP access control groups.

"""
DescribeTags(ResourceId; aws::AWSConfig=AWSConfig()) = workspaces("DescribeTags", Dict{String, Any}("ResourceId"=>ResourceId); aws=aws)
DescribeTags(ResourceId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId), args)); aws=aws)

"""
    DescribeWorkspaceBundles()

Retrieves a list that describes the available WorkSpace bundles. You can filter the results using either bundle ID or owner, but not both.

# Optional Parameters
- `BundleIds`: The identifiers of the bundles. You cannot combine this parameter with any other filter.
- `NextToken`: The token for the next set of results. (You received this token from a previous call.)
- `Owner`: The owner of the bundles. You cannot combine this parameter with any other filter. Specify AMAZON to describe the bundles provided by AWS or null to describe the bundles that belong to your account.
"""
DescribeWorkspaceBundles(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceBundles"; aws=aws)
DescribeWorkspaceBundles(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceBundles", args; aws=aws)

"""
    DescribeWorkspaceDirectories()

Describes the available directories that are registered with Amazon WorkSpaces.

# Optional Parameters
- `DirectoryIds`: The identifiers of the directories. If the value is null, all directories are retrieved.
- `Limit`: The maximum number of directories to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
DescribeWorkspaceDirectories(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceDirectories"; aws=aws)
DescribeWorkspaceDirectories(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceDirectories", args; aws=aws)

"""
    DescribeWorkspaceImagePermissions()

Describes the permissions that the owner of an image has granted to other AWS accounts for an image.

# Required Parameters
- `ImageId`: The identifier of the image.

# Optional Parameters
- `MaxResults`: The maximum number of items to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
DescribeWorkspaceImagePermissions(ImageId; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceImagePermissions", Dict{String, Any}("ImageId"=>ImageId); aws=aws)
DescribeWorkspaceImagePermissions(ImageId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceImagePermissions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ImageId"=>ImageId), args)); aws=aws)

"""
    DescribeWorkspaceImages()

Retrieves a list that describes one or more specified images, if the image identifiers are provided. Otherwise, all images in the account are described. 

# Optional Parameters
- `ImageIds`: The identifier of the image.
- `ImageType`: The type (owned or shared) of the image.
- `MaxResults`: The maximum number of items to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
DescribeWorkspaceImages(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceImages"; aws=aws)
DescribeWorkspaceImages(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceImages", args; aws=aws)

"""
    DescribeWorkspaceSnapshots()

Describes the snapshots for the specified WorkSpace.

# Required Parameters
- `WorkspaceId`: The identifier of the WorkSpace.

"""
DescribeWorkspaceSnapshots(WorkspaceId; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceSnapshots", Dict{String, Any}("WorkspaceId"=>WorkspaceId); aws=aws)
DescribeWorkspaceSnapshots(WorkspaceId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaceSnapshots", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("WorkspaceId"=>WorkspaceId), args)); aws=aws)

"""
    DescribeWorkspaces()

Describes the specified WorkSpaces. You can filter the results by using the bundle identifier, directory identifier, or owner, but you can specify only one filter at a time.

# Optional Parameters
- `BundleId`: The identifier of the bundle. All WorkSpaces that are created from this bundle are retrieved. You cannot combine this parameter with any other filter.
- `DirectoryId`: The identifier of the directory. In addition, you can optionally specify a specific directory user (see UserName). You cannot combine this parameter with any other filter.
- `Limit`: The maximum number of items to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
- `UserName`: The name of the directory user. You must specify this parameter with DirectoryId.
- `WorkspaceIds`: The identifiers of the WorkSpaces. You cannot combine this parameter with any other filter. Because the CreateWorkspaces operation is asynchronous, the identifier it returns is not immediately available. If you immediately call DescribeWorkspaces with this identifier, no information is returned.
"""
DescribeWorkspaces(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaces"; aws=aws)
DescribeWorkspaces(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspaces", args; aws=aws)

"""
    DescribeWorkspacesConnectionStatus()

Describes the connection status of the specified WorkSpaces.

# Optional Parameters
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
- `WorkspaceIds`: The identifiers of the WorkSpaces. You can specify up to 25 WorkSpaces.
"""
DescribeWorkspacesConnectionStatus(; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspacesConnectionStatus"; aws=aws)
DescribeWorkspacesConnectionStatus(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DescribeWorkspacesConnectionStatus", args; aws=aws)

"""
    DisassociateIpGroups()

Disassociates the specified IP access control group from the specified directory.

# Required Parameters
- `DirectoryId`: The identifier of the directory.
- `GroupIds`: The identifiers of one or more IP access control groups.

"""
DisassociateIpGroups(DirectoryId, GroupIds; aws::AWSConfig=AWSConfig()) = workspaces("DisassociateIpGroups", Dict{String, Any}("DirectoryId"=>DirectoryId, "GroupIds"=>GroupIds); aws=aws)
DisassociateIpGroups(DirectoryId, GroupIds, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("DisassociateIpGroups", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DirectoryId"=>DirectoryId, "GroupIds"=>GroupIds), args)); aws=aws)

"""
    ImportWorkspaceImage()

Imports the specified Windows 7 or Windows 10 Bring Your Own License (BYOL) image into Amazon WorkSpaces. The image must be an already licensed EC2 image that is in your AWS account, and you must own the image. 

# Required Parameters
- `Ec2ImageId`: The identifier of the EC2 image.
- `ImageDescription`: The description of the WorkSpace image.
- `ImageName`: The name of the WorkSpace image.
- `IngestionProcess`: The ingestion process to be used when importing the image.

# Optional Parameters
- `Tags`: The tags. Each WorkSpaces resource can have a maximum of 50 tags.
"""
ImportWorkspaceImage(Ec2ImageId, ImageDescription, ImageName, IngestionProcess; aws::AWSConfig=AWSConfig()) = workspaces("ImportWorkspaceImage", Dict{String, Any}("Ec2ImageId"=>Ec2ImageId, "ImageDescription"=>ImageDescription, "ImageName"=>ImageName, "IngestionProcess"=>IngestionProcess); aws=aws)
ImportWorkspaceImage(Ec2ImageId, ImageDescription, ImageName, IngestionProcess, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ImportWorkspaceImage", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Ec2ImageId"=>Ec2ImageId, "ImageDescription"=>ImageDescription, "ImageName"=>ImageName, "IngestionProcess"=>IngestionProcess), args)); aws=aws)

"""
    ListAvailableManagementCidrRanges()

Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that you can use for the network management interface when you enable Bring Your Own License (BYOL).  The management network interface is connected to a secure Amazon WorkSpaces management network. It is used for interactive streaming of the WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon WorkSpaces to manage the WorkSpace.

# Required Parameters
- `ManagementCidrRangeConstraint`: The IP address range to search. Specify an IP address range that is compatible with your network and in CIDR notation (that is, specify the range as an IPv4 CIDR block).

# Optional Parameters
- `MaxResults`: The maximum number of items to return.
- `NextToken`: If you received a NextToken from a previous call that was paginated, provide this token to receive the next set of results.
"""
ListAvailableManagementCidrRanges(ManagementCidrRangeConstraint; aws::AWSConfig=AWSConfig()) = workspaces("ListAvailableManagementCidrRanges", Dict{String, Any}("ManagementCidrRangeConstraint"=>ManagementCidrRangeConstraint); aws=aws)
ListAvailableManagementCidrRanges(ManagementCidrRangeConstraint, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ListAvailableManagementCidrRanges", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ManagementCidrRangeConstraint"=>ManagementCidrRangeConstraint), args)); aws=aws)

"""
    MigrateWorkspace()

Migrates a WorkSpace from one operating system or bundle type to another, while retaining the data on the user volume. The migration process recreates the WorkSpace by using a new root volume from the target bundle image and the user volume from the last available snapshot of the original WorkSpace. During migration, the original D: Users %USERNAME% user profile folder is renamed to D: Users %USERNAME%MMddyyTHHmmss%.NotMigrated. A new D: Users %USERNAME%  folder is generated by the new OS. Certain files in the old user profile are moved to the new user profile. For available migration scenarios, details about what happens during migration, and best practices, see Migrate a WorkSpace.

# Required Parameters
- `BundleId`: The identifier of the target bundle type to migrate the WorkSpace to.
- `SourceWorkspaceId`: The identifier of the WorkSpace to migrate from.

"""
MigrateWorkspace(BundleId, SourceWorkspaceId; aws::AWSConfig=AWSConfig()) = workspaces("MigrateWorkspace", Dict{String, Any}("BundleId"=>BundleId, "SourceWorkspaceId"=>SourceWorkspaceId); aws=aws)
MigrateWorkspace(BundleId, SourceWorkspaceId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("MigrateWorkspace", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BundleId"=>BundleId, "SourceWorkspaceId"=>SourceWorkspaceId), args)); aws=aws)

"""
    ModifyAccount()

Modifies the configuration of Bring Your Own License (BYOL) for the specified account.

# Optional Parameters
- `DedicatedTenancyManagementCidrRange`: The IP address range, specified as an IPv4 CIDR block, for the management network interface. Specify an IP address range that is compatible with your network and in CIDR notation (that is, specify the range as an IPv4 CIDR block). The CIDR block size must be /16 (for example, 203.0.113.25/16). It must also be specified as available by the ListAvailableManagementCidrRanges operation.
- `DedicatedTenancySupport`: The status of BYOL.
"""
ModifyAccount(; aws::AWSConfig=AWSConfig()) = workspaces("ModifyAccount"; aws=aws)
ModifyAccount(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyAccount", args; aws=aws)

"""
    ModifyClientProperties()

Modifies the properties of the specified Amazon WorkSpaces clients.

# Required Parameters
- `ClientProperties`: Information about the Amazon WorkSpaces client.
- `ResourceId`: The resource identifiers, in the form of directory IDs.

"""
ModifyClientProperties(ClientProperties, ResourceId; aws::AWSConfig=AWSConfig()) = workspaces("ModifyClientProperties", Dict{String, Any}("ClientProperties"=>ClientProperties, "ResourceId"=>ResourceId); aws=aws)
ModifyClientProperties(ClientProperties, ResourceId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyClientProperties", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientProperties"=>ClientProperties, "ResourceId"=>ResourceId), args)); aws=aws)

"""
    ModifySelfservicePermissions()

Modifies the self-service WorkSpace management capabilities for your users. For more information, see Enable Self-Service WorkSpace Management Capabilities for Your Users.

# Required Parameters
- `ResourceId`: The identifier of the directory.
- `SelfservicePermissions`: The permissions to enable or disable self-service capabilities.

"""
ModifySelfservicePermissions(ResourceId, SelfservicePermissions; aws::AWSConfig=AWSConfig()) = workspaces("ModifySelfservicePermissions", Dict{String, Any}("ResourceId"=>ResourceId, "SelfservicePermissions"=>SelfservicePermissions); aws=aws)
ModifySelfservicePermissions(ResourceId, SelfservicePermissions, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifySelfservicePermissions", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "SelfservicePermissions"=>SelfservicePermissions), args)); aws=aws)

"""
    ModifyWorkspaceAccessProperties()

Specifies which devices and operating systems users can use to access their WorkSpaces. For more information, see  Control Device Access.

# Required Parameters
- `ResourceId`: The identifier of the directory.
- `WorkspaceAccessProperties`: The device types and operating systems to enable or disable for access.

"""
ModifyWorkspaceAccessProperties(ResourceId, WorkspaceAccessProperties; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceAccessProperties", Dict{String, Any}("ResourceId"=>ResourceId, "WorkspaceAccessProperties"=>WorkspaceAccessProperties); aws=aws)
ModifyWorkspaceAccessProperties(ResourceId, WorkspaceAccessProperties, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceAccessProperties", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "WorkspaceAccessProperties"=>WorkspaceAccessProperties), args)); aws=aws)

"""
    ModifyWorkspaceCreationProperties()

Modify the default properties used to create WorkSpaces.

# Required Parameters
- `ResourceId`: The identifier of the directory.
- `WorkspaceCreationProperties`: The default properties for creating WorkSpaces.

"""
ModifyWorkspaceCreationProperties(ResourceId, WorkspaceCreationProperties; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceCreationProperties", Dict{String, Any}("ResourceId"=>ResourceId, "WorkspaceCreationProperties"=>WorkspaceCreationProperties); aws=aws)
ModifyWorkspaceCreationProperties(ResourceId, WorkspaceCreationProperties, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceCreationProperties", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "WorkspaceCreationProperties"=>WorkspaceCreationProperties), args)); aws=aws)

"""
    ModifyWorkspaceProperties()

Modifies the specified WorkSpace properties. For important information about how to modify the size of the root and user volumes, see  Modify a WorkSpace. 

# Required Parameters
- `WorkspaceId`: The identifier of the WorkSpace.
- `WorkspaceProperties`: The properties of the WorkSpace.

"""
ModifyWorkspaceProperties(WorkspaceId, WorkspaceProperties; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceProperties", Dict{String, Any}("WorkspaceId"=>WorkspaceId, "WorkspaceProperties"=>WorkspaceProperties); aws=aws)
ModifyWorkspaceProperties(WorkspaceId, WorkspaceProperties, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceProperties", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("WorkspaceId"=>WorkspaceId, "WorkspaceProperties"=>WorkspaceProperties), args)); aws=aws)

"""
    ModifyWorkspaceState()

Sets the state of the specified WorkSpace. To maintain a WorkSpace without being interrupted, set the WorkSpace state to ADMIN_MAINTENANCE. WorkSpaces in this state do not respond to requests to reboot, stop, start, rebuild, or restore. An AutoStop WorkSpace in this state is not stopped. Users cannot log into a WorkSpace in the ADMIN_MAINTENANCE state.

# Required Parameters
- `WorkspaceId`: The identifier of the WorkSpace.
- `WorkspaceState`: The WorkSpace state.

"""
ModifyWorkspaceState(WorkspaceId, WorkspaceState; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceState", Dict{String, Any}("WorkspaceId"=>WorkspaceId, "WorkspaceState"=>WorkspaceState); aws=aws)
ModifyWorkspaceState(WorkspaceId, WorkspaceState, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("ModifyWorkspaceState", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("WorkspaceId"=>WorkspaceId, "WorkspaceState"=>WorkspaceState), args)); aws=aws)

"""
    RebootWorkspaces()

Reboots the specified WorkSpaces. You cannot reboot a WorkSpace unless its state is AVAILABLE or UNHEALTHY. This operation is asynchronous and returns before the WorkSpaces have rebooted.

# Required Parameters
- `RebootWorkspaceRequests`: The WorkSpaces to reboot. You can specify up to 25 WorkSpaces.

"""
RebootWorkspaces(RebootWorkspaceRequests; aws::AWSConfig=AWSConfig()) = workspaces("RebootWorkspaces", Dict{String, Any}("RebootWorkspaceRequests"=>RebootWorkspaceRequests); aws=aws)
RebootWorkspaces(RebootWorkspaceRequests, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("RebootWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RebootWorkspaceRequests"=>RebootWorkspaceRequests), args)); aws=aws)

"""
    RebuildWorkspaces()

Rebuilds the specified WorkSpace. You cannot rebuild a WorkSpace unless its state is AVAILABLE, ERROR, UNHEALTHY, STOPPED, or REBOOTING. Rebuilding a WorkSpace is a potentially destructive action that can result in the loss of data. For more information, see Rebuild a WorkSpace. This operation is asynchronous and returns before the WorkSpaces have been completely rebuilt.

# Required Parameters
- `RebuildWorkspaceRequests`: The WorkSpace to rebuild. You can specify a single WorkSpace.

"""
RebuildWorkspaces(RebuildWorkspaceRequests; aws::AWSConfig=AWSConfig()) = workspaces("RebuildWorkspaces", Dict{String, Any}("RebuildWorkspaceRequests"=>RebuildWorkspaceRequests); aws=aws)
RebuildWorkspaces(RebuildWorkspaceRequests, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("RebuildWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RebuildWorkspaceRequests"=>RebuildWorkspaceRequests), args)); aws=aws)

"""
    RegisterWorkspaceDirectory()

Registers the specified directory. This operation is asynchronous and returns before the WorkSpace directory is registered. If this is the first time you are registering a directory, you will need to create the workspaces_DefaultRole role before you can register a directory. For more information, see  Creating the workspaces_DefaultRole Role.

# Required Parameters
- `DirectoryId`: The identifier of the directory. You cannot register a directory if it does not have a status of Active. If the directory does not have a status of Active, you will receive an InvalidResourceStateException error. If you have already registered the maximum number of directories that you can register with Amazon WorkSpaces, you will receive a ResourceLimitExceededException error. Deregister directories that you are not using for WorkSpaces, and try again.
- `EnableWorkDocs`: Indicates whether Amazon WorkDocs is enabled or disabled. If you have enabled this parameter and WorkDocs is not available in the Region, you will receive an OperationNotSupportedException error. Set EnableWorkDocs to disabled, and try again.

# Optional Parameters
- `EnableSelfService`: Indicates whether self-service capabilities are enabled or disabled.
- `SubnetIds`: The identifiers of the subnets for your virtual private cloud (VPC). Make sure that the subnets are in supported Availability Zones. The subnets must also be in separate Availability Zones. If these conditions are not met, you will receive an OperationNotSupportedException error.
- `Tags`: The tags associated with the directory.
- `Tenancy`: Indicates whether your WorkSpace directory is dedicated or shared. To use Bring Your Own License (BYOL) images, this value must be set to DEDICATED and your AWS account must be enabled for BYOL. If your account has not been enabled for BYOL, you will receive an InvalidParameterValuesException error. For more information about BYOL images, see Bring Your Own Windows Desktop Images.
"""
RegisterWorkspaceDirectory(DirectoryId, EnableWorkDocs; aws::AWSConfig=AWSConfig()) = workspaces("RegisterWorkspaceDirectory", Dict{String, Any}("DirectoryId"=>DirectoryId, "EnableWorkDocs"=>EnableWorkDocs); aws=aws)
RegisterWorkspaceDirectory(DirectoryId, EnableWorkDocs, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("RegisterWorkspaceDirectory", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DirectoryId"=>DirectoryId, "EnableWorkDocs"=>EnableWorkDocs), args)); aws=aws)

"""
    RestoreWorkspace()

Restores the specified WorkSpace to its last known healthy state. You cannot restore a WorkSpace unless its state is  AVAILABLE, ERROR, UNHEALTHY, or STOPPED. Restoring a WorkSpace is a potentially destructive action that can result in the loss of data. For more information, see Restore a WorkSpace. This operation is asynchronous and returns before the WorkSpace is completely restored.

# Required Parameters
- `WorkspaceId`: The identifier of the WorkSpace.

"""
RestoreWorkspace(WorkspaceId; aws::AWSConfig=AWSConfig()) = workspaces("RestoreWorkspace", Dict{String, Any}("WorkspaceId"=>WorkspaceId); aws=aws)
RestoreWorkspace(WorkspaceId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("RestoreWorkspace", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("WorkspaceId"=>WorkspaceId), args)); aws=aws)

"""
    RevokeIpRules()

Removes one or more rules from the specified IP access control group.

# Required Parameters
- `GroupId`: The identifier of the group.
- `UserRules`: The rules to remove from the group.

"""
RevokeIpRules(GroupId, UserRules; aws::AWSConfig=AWSConfig()) = workspaces("RevokeIpRules", Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules); aws=aws)
RevokeIpRules(GroupId, UserRules, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("RevokeIpRules", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules), args)); aws=aws)

"""
    StartWorkspaces()

Starts the specified WorkSpaces. You cannot start a WorkSpace unless it has a running mode of AutoStop and a state of STOPPED.

# Required Parameters
- `StartWorkspaceRequests`: The WorkSpaces to start. You can specify up to 25 WorkSpaces.

"""
StartWorkspaces(StartWorkspaceRequests; aws::AWSConfig=AWSConfig()) = workspaces("StartWorkspaces", Dict{String, Any}("StartWorkspaceRequests"=>StartWorkspaceRequests); aws=aws)
StartWorkspaces(StartWorkspaceRequests, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("StartWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("StartWorkspaceRequests"=>StartWorkspaceRequests), args)); aws=aws)

"""
    StopWorkspaces()

 Stops the specified WorkSpaces. You cannot stop a WorkSpace unless it has a running mode of AutoStop and a state of AVAILABLE, IMPAIRED, UNHEALTHY, or ERROR.

# Required Parameters
- `StopWorkspaceRequests`: The WorkSpaces to stop. You can specify up to 25 WorkSpaces.

"""
StopWorkspaces(StopWorkspaceRequests; aws::AWSConfig=AWSConfig()) = workspaces("StopWorkspaces", Dict{String, Any}("StopWorkspaceRequests"=>StopWorkspaceRequests); aws=aws)
StopWorkspaces(StopWorkspaceRequests, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("StopWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("StopWorkspaceRequests"=>StopWorkspaceRequests), args)); aws=aws)

"""
    TerminateWorkspaces()

Terminates the specified WorkSpaces. Terminating a WorkSpace is a permanent action and cannot be undone. The user's data is destroyed. If you need to archive any user data, contact Amazon Web Services before terminating the WorkSpace. You can terminate a WorkSpace that is in any state except SUSPENDED. This operation is asynchronous and returns before the WorkSpaces have been completely terminated.

# Required Parameters
- `TerminateWorkspaceRequests`: The WorkSpaces to terminate. You can specify up to 25 WorkSpaces.

"""
TerminateWorkspaces(TerminateWorkspaceRequests; aws::AWSConfig=AWSConfig()) = workspaces("TerminateWorkspaces", Dict{String, Any}("TerminateWorkspaceRequests"=>TerminateWorkspaceRequests); aws=aws)
TerminateWorkspaces(TerminateWorkspaceRequests, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("TerminateWorkspaces", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("TerminateWorkspaceRequests"=>TerminateWorkspaceRequests), args)); aws=aws)

"""
    UpdateRulesOfIpGroup()

Replaces the current rules of the specified IP access control group with the specified rules.

# Required Parameters
- `GroupId`: The identifier of the group.
- `UserRules`: One or more rules.

"""
UpdateRulesOfIpGroup(GroupId, UserRules; aws::AWSConfig=AWSConfig()) = workspaces("UpdateRulesOfIpGroup", Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules); aws=aws)
UpdateRulesOfIpGroup(GroupId, UserRules, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("UpdateRulesOfIpGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("GroupId"=>GroupId, "UserRules"=>UserRules), args)); aws=aws)

"""
    UpdateWorkspaceImagePermission()

Shares or unshares an image with one account by specifying whether that account has permission to copy the image. If the copy image permission is granted, the image is shared with that account. If the copy image permission is revoked, the image is unshared with the account.    To delete an image that has been shared, you must unshare the image before you delete it.   Sharing Bring Your Own License (BYOL) images across AWS accounts isn't supported at this time in the AWS GovCloud (US-West) Region. To share BYOL images across accounts in the AWS GovCloud (US-West) Region, contact AWS Support.   

# Required Parameters
- `AllowCopyImage`: The permission to copy the image. This permission can be revoked only after an image has been shared.
- `ImageId`: The identifier of the image.
- `SharedAccountId`: The identifier of the AWS account to share or unshare the image with.

"""
UpdateWorkspaceImagePermission(AllowCopyImage, ImageId, SharedAccountId; aws::AWSConfig=AWSConfig()) = workspaces("UpdateWorkspaceImagePermission", Dict{String, Any}("AllowCopyImage"=>AllowCopyImage, "ImageId"=>ImageId, "SharedAccountId"=>SharedAccountId); aws=aws)
UpdateWorkspaceImagePermission(AllowCopyImage, ImageId, SharedAccountId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = workspaces("UpdateWorkspaceImagePermission", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AllowCopyImage"=>AllowCopyImage, "ImageId"=>ImageId, "SharedAccountId"=>SharedAccountId), args)); aws=aws)
