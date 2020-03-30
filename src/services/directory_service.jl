include("../AWSServices.jl")
using .AWSServices: directory_service

"""
    DeregisterEventTopic()

Removes the specified directory as a publisher to the specified SNS topic.

Required Parameters
{
  "DirectoryId": "The Directory ID to remove as a publisher. This directory will no longer send messages to the specified SNS topic.",
  "TopicName": "The name of the SNS topic from which to remove the directory as a publisher."
}
"""
DeregisterEventTopic(args) = directory_service("DeregisterEventTopic", args)

"""
    ListSchemaExtensions()

Lists all schema extensions applied to a Microsoft AD Directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory from which to retrieve the schema extension information."
}

Optional Parameters
{
  "NextToken": "The ListSchemaExtensions.NextToken value from a previous call to ListSchemaExtensions. Pass null if this is the first call.",
  "Limit": "The maximum number of items to return."
}
"""
ListSchemaExtensions(args) = directory_service("ListSchemaExtensions", args)

"""
    GetSnapshotLimits()

Obtains the manual snapshot limits for a directory.

Required Parameters
{
  "DirectoryId": "Contains the identifier of the directory to obtain the limits for."
}
"""
GetSnapshotLimits(args) = directory_service("GetSnapshotLimits", args)

"""
    RestoreFromSnapshot()

Restores a directory using an existing directory snapshot. When you restore a directory from a snapshot, any changes made to the directory after the snapshot date are overwritten. This action returns as soon as the restore operation is initiated. You can monitor the progress of the restore operation by calling the DescribeDirectories operation with the directory identifier. When the DirectoryDescription.Stage value changes to Active, the restore operation is complete.

Required Parameters
{
  "SnapshotId": "The identifier of the snapshot to restore from."
}
"""
RestoreFromSnapshot(args) = directory_service("RestoreFromSnapshot", args)

"""
    ListIpRoutes()

Lists the address blocks that you have added to a directory.

Required Parameters
{
  "DirectoryId": "Identifier (ID) of the directory for which you want to retrieve the IP addresses."
}

Optional Parameters
{
  "NextToken": "The ListIpRoutes.NextToken value from a previous call to ListIpRoutes. Pass null if this is the first call.",
  "Limit": "Maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation."
}
"""
ListIpRoutes(args) = directory_service("ListIpRoutes", args)

"""
    CreateLogSubscription()

Creates a subscription to forward real-time Directory Service domain controller security logs to the specified Amazon CloudWatch log group in your AWS account.

Required Parameters
{
  "LogGroupName": "The name of the CloudWatch log group where the real-time domain controller logs are forwarded.",
  "DirectoryId": "Identifier of the directory to which you want to subscribe and receive real-time logs to your specified CloudWatch log group."
}
"""
CreateLogSubscription(args) = directory_service("CreateLogSubscription", args)

"""
    ShareDirectory()

Shares a specified directory (DirectoryId) in your AWS account (directory owner) with another AWS account (directory consumer). With this operation you can use your directory from any AWS account and from any Amazon VPC within an AWS Region. When you share your AWS Managed Microsoft AD directory, AWS Directory Service creates a shared directory in the directory consumer account. This shared directory contains the metadata to provide access to the directory within the directory owner account. The shared directory is visible in all VPCs in the directory consumer account. The ShareMethod parameter determines whether the specified directory can be shared between AWS accounts inside the same AWS organization (ORGANIZATIONS). It also determines whether you can share the directory with any other AWS account either inside or outside of the organization (HANDSHAKE). The ShareNotes parameter is only used when HANDSHAKE is called, which sends a directory sharing request to the directory consumer. 

Required Parameters
{
  "DirectoryId": "Identifier of the AWS Managed Microsoft AD directory that you want to share with other AWS accounts.",
  "ShareMethod": "The method used when sharing a directory to determine whether the directory should be shared within your AWS organization (ORGANIZATIONS) or with any AWS account by sending a directory sharing request (HANDSHAKE).",
  "ShareTarget": "Identifier for the directory consumer account with whom the directory is to be shared."
}

Optional Parameters
{
  "ShareNotes": "A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation."
}
"""
ShareDirectory(args) = directory_service("ShareDirectory", args)

"""
    DisableRadius()

Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to disable MFA."
}
"""
DisableRadius(args) = directory_service("DisableRadius", args)

"""
    AcceptSharedDirectory()

Accepts a directory sharing request that was sent from the directory owner account.

Required Parameters
{
  "SharedDirectoryId": "Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account. "
}
"""
AcceptSharedDirectory(args) = directory_service("AcceptSharedDirectory", args)

"""
    DeregisterCertificate()

Deletes from the system the certificate that was registered for a secured LDAP connection.

Required Parameters
{
  "DirectoryId": "The identifier of the directory.",
  "CertificateId": "The identifier of the certificate."
}
"""
DeregisterCertificate(args) = directory_service("DeregisterCertificate", args)

"""
    CreateAlias()

Creates an alias for a directory and assigns the alias to the directory. The alias is used to construct the access URL for the directory, such as http://&lt;alias&gt;.awsapps.com.  After an alias has been created, it cannot be deleted or reused, so this operation should only be used when absolutely necessary. 

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to create the alias.",
  "Alias": "The requested alias. The alias must be unique amongst all aliases in AWS. This operation throws an EntityAlreadyExistsException error if the alias already exists."
}
"""
CreateAlias(args) = directory_service("CreateAlias", args)

"""
    UpdateConditionalForwarder()

Updates a conditional forwarder that has been set up for your AWS directory.

Required Parameters
{
  "RemoteDomainName": "The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.",
  "DnsIpAddrs": "The updated IP addresses of the remote DNS server associated with the conditional forwarder.",
  "DirectoryId": "The directory ID of the AWS directory for which to update the conditional forwarder."
}
"""
UpdateConditionalForwarder(args) = directory_service("UpdateConditionalForwarder", args)

"""
    DescribeSnapshots()

Obtains information about the directory snapshots that belong to this account. This operation supports pagination with the use of the NextToken request and response parameters. If more results are available, the DescribeSnapshots.NextToken member contains a token that you pass in the next call to DescribeSnapshots to retrieve the next set of items. You can also specify a maximum number of return results with the Limit parameter.

Optional Parameters
{
  "SnapshotIds": "A list of identifiers of the snapshots to obtain the information for. If this member is null or empty, all snapshots are returned using the Limit and NextToken members.",
  "NextToken": "The DescribeSnapshotsResult.NextToken value from a previous call to DescribeSnapshots. Pass null if this is the first call.",
  "DirectoryId": "The identifier of the directory for which to retrieve snapshot information.",
  "Limit": "The maximum number of objects to return."
}
"""
DescribeSnapshots() = directory_service("DescribeSnapshots")
DescribeSnapshots(args) = directory_service("DescribeSnapshots", args)

"""
    DescribeCertificate()

Displays information about the certificate registered for a secured LDAP connection.

Required Parameters
{
  "DirectoryId": "The identifier of the directory.",
  "CertificateId": "The identifier of the certificate."
}
"""
DescribeCertificate(args) = directory_service("DescribeCertificate", args)

"""
    DescribeEventTopics()

Obtains information about which SNS topics receive status messages from the specified directory. If no input parameters are provided, such as DirectoryId or TopicName, this request describes all of the associations in the account.

Optional Parameters
{
  "DirectoryId": "The Directory ID for which to get the list of associated SNS topics. If this member is null, associations for all Directory IDs are returned.",
  "TopicNames": "A list of SNS topic names for which to obtain the information. If this member is null, all associations for the specified Directory ID are returned. An empty list results in an InvalidParameterException being thrown."
}
"""
DescribeEventTopics() = directory_service("DescribeEventTopics")
DescribeEventTopics(args) = directory_service("DescribeEventTopics", args)

"""
    CreateConditionalForwarder()

Creates a conditional forwarder associated with your AWS directory. Conditional forwarders are required in order to set up a trust relationship with another domain. The conditional forwarder points to the trusted domain.

Required Parameters
{
  "RemoteDomainName": "The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.",
  "DnsIpAddrs": "The IP addresses of the remote DNS server associated with RemoteDomainName.",
  "DirectoryId": "The directory ID of the AWS directory for which you are creating the conditional forwarder."
}
"""
CreateConditionalForwarder(args) = directory_service("CreateConditionalForwarder", args)

"""
    CancelSchemaExtension()

Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension has started replicating to all domain controllers, the task can no longer be canceled. A schema extension can be canceled during any of the following states; Initializing, CreatingSnapshot, and UpdatingSchema.

Required Parameters
{
  "DirectoryId": "The identifier of the directory whose schema extension will be canceled.",
  "SchemaExtensionId": "The identifier of the schema extension that will be canceled."
}
"""
CancelSchemaExtension(args) = directory_service("CancelSchemaExtension", args)

"""
    UpdateNumberOfDomainControllers()

Adds or removes domain controllers to or from the directory. Based on the difference between current value and new value (provided through this API call), domain controllers will be added or removed. It may take up to 45 minutes for any new domain controllers to become fully active once the requested number of domain controllers is updated. During this time, you cannot make another update request.

Required Parameters
{
  "DirectoryId": "Identifier of the directory to which the domain controllers will be added or removed.",
  "DesiredNumber": "The number of domain controllers desired in the directory."
}
"""
UpdateNumberOfDomainControllers(args) = directory_service("UpdateNumberOfDomainControllers", args)

"""
    DescribeSharedDirectories()

Returns the shared directories in your account. 

Required Parameters
{
  "OwnerDirectoryId": "Returns the identifier of the directory in the directory owner account. "
}

Optional Parameters
{
  "SharedDirectoryIds": "A list of identifiers of all shared directories in your account. ",
  "NextToken": "The DescribeSharedDirectoriesResult.NextToken value from a previous call to DescribeSharedDirectories. Pass null if this is the first call. ",
  "Limit": "The number of shared directories to return in the response object."
}
"""
DescribeSharedDirectories(args) = directory_service("DescribeSharedDirectories", args)

"""
    CreateDirectory()

Creates a Simple AD directory. For more information, see Simple Active Directory in the AWS Directory Service Admin Guide. Before you call CreateDirectory, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the CreateDirectory operation, see AWS Directory Service API Permissions: Actions, Resources, and Conditions Reference.

Required Parameters
{
  "Password": "The password for the directory administrator. The directory creation process creates a directory administrator account with the user name Administrator and this password. If you need to change the password for the administrator account, you can use the ResetUserPassword API call.",
  "Name": "The fully qualified name for the directory, such as corp.example.com.",
  "Size": "The size of the directory."
}

Optional Parameters
{
  "Description": "A description for the directory.",
  "VpcSettings": "A DirectoryVpcSettings object that contains additional information for the operation.",
  "Tags": "The tags to be assigned to the Simple AD directory.",
  "ShortName": "The NetBIOS name of the directory, such as CORP."
}
"""
CreateDirectory(args) = directory_service("CreateDirectory", args)

"""
    DisableSso()

Disables single-sign on for a directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to disable single-sign on."
}

Optional Parameters
{
  "UserName": "The username of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. This account must have privileges to remove a service principal name. If the AD Connector service account does not have privileges to remove a service principal name, you can specify an alternate account with the UserName and Password parameters. These credentials are only used to disable single sign-on and are not stored by the service. The AD Connector service account is not changed.",
  "Password": "The password of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. For more information, see the UserName parameter."
}
"""
DisableSso(args) = directory_service("DisableSso", args)

"""
    CreateTrust()

AWS Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your AWS Managed Microsoft AD directory, and your existing on-premises Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials. This action initiates the creation of the AWS side of a trust relationship between an AWS Managed Microsoft AD directory and an external domain. You can create either a forest trust or an external trust.

Required Parameters
{
  "RemoteDomainName": "The Fully Qualified Domain Name (FQDN) of the external domain for which to create the trust relationship.",
  "DirectoryId": "The Directory ID of the AWS Managed Microsoft AD directory for which to establish the trust relationship.",
  "TrustPassword": "The trust password. The must be the same password that was used when creating the trust relationship on the external domain.",
  "TrustDirection": "The direction of the trust relationship."
}

Optional Parameters
{
  "ConditionalForwarderIpAddrs": "The IP addresses of the remote DNS server associated with RemoteDomainName.",
  "TrustType": "The trust relationship type. Forest is the default.",
  "SelectiveAuth": "Optional parameter to enable selective authentication for the trust."
}
"""
CreateTrust(args) = directory_service("CreateTrust", args)

"""
    VerifyTrust()

AWS Directory Service for Microsoft Active Directory allows you to configure and verify trust relationships. This action verifies a trust relationship between your AWS Managed Microsoft AD directory and an external domain.

Required Parameters
{
  "TrustId": "The unique Trust ID of the trust relationship to verify."
}
"""
VerifyTrust(args) = directory_service("VerifyTrust", args)

"""
    UnshareDirectory()

Stops the directory sharing between the directory owner and consumer accounts. 

Required Parameters
{
  "DirectoryId": "The identifier of the AWS Managed Microsoft AD directory that you want to stop sharing.",
  "UnshareTarget": "Identifier for the directory consumer account with whom the directory has to be unshared."
}
"""
UnshareDirectory(args) = directory_service("UnshareDirectory", args)

"""
    RegisterEventTopic()

Associates a directory with an SNS topic. This establishes the directory as a publisher to the specified SNS topic. You can then receive email or text (SMS) messages when the status of your directory changes. You get notified if your directory goes from an Active status to an Impaired or Inoperable status. You also receive a notification when the directory returns to an Active status.

Required Parameters
{
  "DirectoryId": "The Directory ID that will publish status messages to the SNS topic.",
  "TopicName": "The SNS topic name to which the directory will publish status messages. This SNS topic must be in the same region as the specified Directory ID."
}
"""
RegisterEventTopic(args) = directory_service("RegisterEventTopic", args)

"""
    DeleteDirectory()

Deletes an AWS Directory Service directory. Before you call DeleteDirectory, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the DeleteDirectory operation, see AWS Directory Service API Permissions: Actions, Resources, and Conditions Reference.

Required Parameters
{
  "DirectoryId": "The identifier of the directory to delete."
}
"""
DeleteDirectory(args) = directory_service("DeleteDirectory", args)

"""
    AddIpRoutes()

If the DNS server for your on-premises domain uses a publicly addressable IP address, you must add a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web Services. AddIpRoutes adds this address block. You can also use AddIpRoutes to facilitate routing traffic that uses public IP ranges from your Microsoft AD on AWS to a peer VPC.  Before you call AddIpRoutes, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the AddIpRoutes operation, see AWS Directory Service API Permissions: Actions, Resources, and Conditions Reference.

Required Parameters
{
  "DirectoryId": "Identifier (ID) of the directory to which to add the address block.",
  "IpRoutes": "IP address blocks, using CIDR format, of the traffic to route. This is often the IP address block of the DNS server used for your on-premises domain."
}

Optional Parameters
{
  "UpdateSecurityGroupForDirectoryControllers": "If set to true, updates the inbound and outbound rules of the security group that has the description: \"AWS created security group for directory ID directory controllers.\" Following are the new rules:  Inbound:   Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: 0.0.0.0/0   Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: 0.0.0.0/0   Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: 0.0.0.0/0   Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: 0.0.0.0/0   Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: 0.0.0.0/0   Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: 0.0.0.0/0   Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: 0.0.0.0/0   Type: DNS (UDP), Protocol: UDP, Range: 53, Source: 0.0.0.0/0   Type: DNS (TCP), Protocol: TCP, Range: 53, Source: 0.0.0.0/0   Type: LDAP, Protocol: TCP, Range: 389, Source: 0.0.0.0/0   Type: All ICMP, Protocol: All, Range: N/A, Source: 0.0.0.0/0    Outbound:   Type: All traffic, Protocol: All, Range: All, Destination: 0.0.0.0/0   These security rules impact an internal network interface that is not exposed publicly."
}
"""
AddIpRoutes(args) = directory_service("AddIpRoutes", args)

"""
    ListCertificates()

For the specified directory, lists all the certificates registered for a secured LDAP connection.

Required Parameters
{
  "DirectoryId": "The identifier of the directory."
}

Optional Parameters
{
  "NextToken": "A token for requesting another page of certificates if the NextToken response element indicates that more certificates are available. Use the value of the returned NextToken element in your request until the token comes back as null. Pass null if this is the first call.",
  "Limit": "The number of items that should show up on one page"
}
"""
ListCertificates(args) = directory_service("ListCertificates", args)

"""
    ListTagsForResource()

Lists all tags on a directory.

Required Parameters
{
  "ResourceId": "Identifier (ID) of the directory for which you want to retrieve tags."
}

Optional Parameters
{
  "NextToken": "Reserved for future use.",
  "Limit": "Reserved for future use."
}
"""
ListTagsForResource(args) = directory_service("ListTagsForResource", args)

"""
    GetDirectoryLimits()

Obtains directory limit information for the current Region.
"""
GetDirectoryLimits() = directory_service("GetDirectoryLimits")
GetDirectoryLimits(args) = directory_service("GetDirectoryLimits", args)

"""
    ListLogSubscriptions()

Lists the active log subscriptions for the AWS account.

Optional Parameters
{
  "NextToken": "The token for the next set of items to return.",
  "DirectoryId": "If a DirectoryID is provided, lists only the log subscription associated with that directory. If no DirectoryId is provided, lists all log subscriptions associated with your AWS account. If there are no log subscriptions for the AWS account or the directory, an empty list will be returned.",
  "Limit": "The maximum number of items returned."
}
"""
ListLogSubscriptions() = directory_service("ListLogSubscriptions")
ListLogSubscriptions(args) = directory_service("ListLogSubscriptions", args)

"""
    StartSchemaExtension()

Applies a schema extension to a Microsoft AD directory.

Required Parameters
{
  "Description": "A description of the schema extension.",
  "DirectoryId": "The identifier of the directory for which the schema extension will be applied to.",
  "CreateSnapshotBeforeSchemaExtension": "If true, creates a snapshot of the directory before applying the schema extension.",
  "LdifContent": "The LDIF file represented as a string. To construct the LdifContent string, precede each line as it would be formatted in an ldif file with  n. See the example request below for more details. The file size can be no larger than 1MB."
}
"""
StartSchemaExtension(args) = directory_service("StartSchemaExtension", args)

"""
    DeleteTrust()

Deletes an existing trust relationship between your AWS Managed Microsoft AD directory and an external domain.

Required Parameters
{
  "TrustId": "The Trust ID of the trust relationship to be deleted."
}

Optional Parameters
{
  "DeleteAssociatedConditionalForwarder": "Delete a conditional forwarder as part of a DeleteTrustRequest."
}
"""
DeleteTrust(args) = directory_service("DeleteTrust", args)

"""
    AddTagsToResource()

Adds or overwrites one or more tags for the specified directory. Each directory can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to each resource.

Required Parameters
{
  "Tags": "The tags to be assigned to the directory.",
  "ResourceId": "Identifier (ID) for the directory to which to add the tag."
}
"""
AddTagsToResource(args) = directory_service("AddTagsToResource", args)

"""
    RemoveTagsFromResource()

Removes tags from a directory.

Required Parameters
{
  "ResourceId": "Identifier (ID) of the directory from which to remove the tag.",
  "TagKeys": "The tag key (name) of the tag to be removed."
}
"""
RemoveTagsFromResource(args) = directory_service("RemoveTagsFromResource", args)

"""
    DescribeConditionalForwarders()

Obtains information about the conditional forwarders for this account. If no input parameters are provided for RemoteDomainNames, this request describes all conditional forwarders for the specified directory ID.

Required Parameters
{
  "DirectoryId": "The directory ID for which to get the list of associated conditional forwarders."
}

Optional Parameters
{
  "RemoteDomainNames": "The fully qualified domain names (FQDN) of the remote domains for which to get the list of associated conditional forwarders. If this member is null, all conditional forwarders are returned."
}
"""
DescribeConditionalForwarders(args) = directory_service("DescribeConditionalForwarders", args)

"""
    DescribeDomainControllers()

Provides information about any domain controllers in your directory.

Required Parameters
{
  "DirectoryId": "Identifier of the directory for which to retrieve the domain controller information."
}

Optional Parameters
{
  "DomainControllerIds": "A list of identifiers for the domain controllers whose information will be provided.",
  "NextToken": "The DescribeDomainControllers.NextToken value from a previous call to DescribeDomainControllers. Pass null if this is the first call. ",
  "Limit": "The maximum number of items to return."
}
"""
DescribeDomainControllers(args) = directory_service("DescribeDomainControllers", args)

"""
    DescribeLDAPSSettings()

Describes the status of LDAP security for the specified directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory."
}

Optional Parameters
{
  "NextToken": "The type of next token used for pagination.",
  "Type": "The type of LDAP security to enable. Currently only the value Client is supported.",
  "Limit": "Specifies the number of items that should be displayed on one page."
}
"""
DescribeLDAPSSettings(args) = directory_service("DescribeLDAPSSettings", args)

"""
    CreateComputer()

Creates a computer account in the specified directory, and joins the computer to the directory.

Required Parameters
{
  "Password": "A one-time password that is used to join the computer to the directory. You should generate a random, strong password to use for this parameter.",
  "DirectoryId": "The identifier of the directory in which to create the computer account.",
  "ComputerName": "The name of the computer account."
}

Optional Parameters
{
  "ComputerAttributes": "An array of Attribute objects that contain any LDAP attributes to apply to the computer account.",
  "OrganizationalUnitDistinguishedName": "The fully-qualified distinguished name of the organizational unit to place the computer account in."
}
"""
CreateComputer(args) = directory_service("CreateComputer", args)

"""
    UpdateTrust()

Updates the trust that has been set up between your AWS Managed Microsoft AD directory and an on-premises Active Directory.

Required Parameters
{
  "TrustId": "Identifier of the trust relationship."
}

Optional Parameters
{
  "SelectiveAuth": "Updates selective authentication for the trust."
}
"""
UpdateTrust(args) = directory_service("UpdateTrust", args)

"""
    DeleteSnapshot()

Deletes a directory snapshot.

Required Parameters
{
  "SnapshotId": "The identifier of the directory snapshot to be deleted."
}
"""
DeleteSnapshot(args) = directory_service("DeleteSnapshot", args)

"""
    EnableRadius()

Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to enable MFA.",
  "RadiusSettings": "A RadiusSettings object that contains information about the RADIUS server."
}
"""
EnableRadius(args) = directory_service("EnableRadius", args)

"""
    RegisterCertificate()

Registers a certificate for secured LDAP connection.

Required Parameters
{
  "DirectoryId": "The identifier of the directory.",
  "CertificateData": "The certificate PEM string that needs to be registered."
}
"""
RegisterCertificate(args) = directory_service("RegisterCertificate", args)

"""
    RejectSharedDirectory()

Rejects a directory sharing request that was sent from the directory owner account.

Required Parameters
{
  "SharedDirectoryId": "Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account."
}
"""
RejectSharedDirectory(args) = directory_service("RejectSharedDirectory", args)

"""
    EnableLDAPS()

Activates the switch for the specific directory to always use LDAP secure calls.

Required Parameters
{
  "DirectoryId": "The identifier of the directory.",
  "Type": "The type of LDAP security to enable. Currently only the value Client is supported."
}
"""
EnableLDAPS(args) = directory_service("EnableLDAPS", args)

"""
    ResetUserPassword()

Resets the password for any user in your AWS Managed Microsoft AD or Simple AD directory. You can reset the password for any user in your directory with the following exceptions:   For Simple AD, you cannot reset the password for any user that is a member of either the Domain Admins or Enterprise Admins group except for the administrator user.   For AWS Managed Microsoft AD, you can only reset the password for a user that is in an OU based off of the NetBIOS name that you typed when you created your directory. For example, you cannot reset the password for a user in the AWS Reserved OU. For more information about the OU structure for an AWS Managed Microsoft AD directory, see What Gets Created in the AWS Directory Service Administration Guide.  

Required Parameters
{
  "UserName": "The user name of the user whose password will be reset.",
  "DirectoryId": "Identifier of the AWS Managed Microsoft AD or Simple AD directory in which the user resides.",
  "NewPassword": "The new password that will be reset."
}
"""
ResetUserPassword(args) = directory_service("ResetUserPassword", args)

"""
    DeleteConditionalForwarder()

Deletes a conditional forwarder that has been set up for your AWS directory.

Required Parameters
{
  "RemoteDomainName": "The fully qualified domain name (FQDN) of the remote domain with which you are deleting the conditional forwarder.",
  "DirectoryId": "The directory ID for which you are deleting the conditional forwarder."
}
"""
DeleteConditionalForwarder(args) = directory_service("DeleteConditionalForwarder", args)

"""
    CreateSnapshot()

Creates a snapshot of a Simple AD or Microsoft AD directory in the AWS cloud.  You cannot take snapshots of AD Connector directories. 

Required Parameters
{
  "DirectoryId": "The identifier of the directory of which to take a snapshot."
}

Optional Parameters
{
  "Name": "The descriptive name to apply to the snapshot."
}
"""
CreateSnapshot(args) = directory_service("CreateSnapshot", args)

"""
    EnableSso()

Enables single sign-on for a directory. Single sign-on allows users in your directory to access certain AWS services from a computer joined to the directory without having to enter their credentials separately.

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to enable single-sign on."
}

Optional Parameters
{
  "UserName": "The username of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. This account must have privileges to add a service principal name. If the AD Connector service account does not have privileges to add a service principal name, you can specify an alternate account with the UserName and Password parameters. These credentials are only used to enable single sign-on and are not stored by the service. The AD Connector service account is not changed.",
  "Password": "The password of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. For more information, see the UserName parameter."
}
"""
EnableSso(args) = directory_service("EnableSso", args)

"""
    DescribeDirectories()

Obtains information about the directories that belong to this account. You can retrieve information about specific directories by passing the directory identifiers in the DirectoryIds parameter. Otherwise, all directories that belong to the current account are returned. This operation supports pagination with the use of the NextToken request and response parameters. If more results are available, the DescribeDirectoriesResult.NextToken member contains a token that you pass in the next call to DescribeDirectories to retrieve the next set of items. You can also specify a maximum number of return results with the Limit parameter.

Optional Parameters
{
  "DirectoryIds": "A list of identifiers of the directories for which to obtain the information. If this member is null, all directories that belong to the current account are returned. An empty list results in an InvalidParameterException being thrown.",
  "NextToken": "The DescribeDirectoriesResult.NextToken value from a previous call to DescribeDirectories. Pass null if this is the first call.",
  "Limit": "The maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation."
}
"""
DescribeDirectories() = directory_service("DescribeDirectories")
DescribeDirectories(args) = directory_service("DescribeDirectories", args)

"""
    DisableLDAPS()

Deactivates LDAP secure calls for the specified directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory.",
  "Type": "The type of LDAP security to enable. Currently only the value Client is supported."
}
"""
DisableLDAPS(args) = directory_service("DisableLDAPS", args)

"""
    DeleteLogSubscription()

Deletes the specified log subscription.

Required Parameters
{
  "DirectoryId": "Identifier of the directory whose log subscription you want to delete."
}
"""
DeleteLogSubscription(args) = directory_service("DeleteLogSubscription", args)

"""
    ConnectDirectory()

Creates an AD Connector to connect to an on-premises directory. Before you call ConnectDirectory, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the ConnectDirectory operation, see AWS Directory Service API Permissions: Actions, Resources, and Conditions Reference.

Required Parameters
{
  "Password": "The password for the on-premises user account.",
  "ConnectSettings": "A DirectoryConnectSettings object that contains additional information for the operation.",
  "Name": "The fully qualified name of the on-premises directory, such as corp.example.com.",
  "Size": "The size of the directory."
}

Optional Parameters
{
  "Description": "A description for the directory.",
  "Tags": "The tags to be assigned to AD Connector.",
  "ShortName": "The NetBIOS name of the on-premises directory, such as CORP."
}
"""
ConnectDirectory(args) = directory_service("ConnectDirectory", args)

"""
    RemoveIpRoutes()

Removes IP address blocks from a directory.

Required Parameters
{
  "DirectoryId": "Identifier (ID) of the directory from which you want to remove the IP addresses.",
  "CidrIps": "IP address blocks that you want to remove."
}
"""
RemoveIpRoutes(args) = directory_service("RemoveIpRoutes", args)

"""
    UpdateRadius()

Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD Connector or Microsoft AD directory.

Required Parameters
{
  "DirectoryId": "The identifier of the directory for which to update the RADIUS server information.",
  "RadiusSettings": "A RadiusSettings object that contains information about the RADIUS server."
}
"""
UpdateRadius(args) = directory_service("UpdateRadius", args)

"""
    DescribeTrusts()

Obtains information about the trust relationships for this account. If no input parameters are provided, such as DirectoryId or TrustIds, this request describes all the trust relationships belonging to the account.

Optional Parameters
{
  "NextToken": "The DescribeTrustsResult.NextToken value from a previous call to DescribeTrusts. Pass null if this is the first call.",
  "DirectoryId": "The Directory ID of the AWS directory that is a part of the requested trust relationship.",
  "TrustIds": "A list of identifiers of the trust relationships for which to obtain the information. If this member is null, all trust relationships that belong to the current account are returned. An empty list results in an InvalidParameterException being thrown.",
  "Limit": "The maximum number of objects to return."
}
"""
DescribeTrusts() = directory_service("DescribeTrusts")
DescribeTrusts(args) = directory_service("DescribeTrusts", args)

"""
    CreateMicrosoftAD()

Creates a Microsoft AD directory in the AWS Cloud. For more information, see AWS Managed Microsoft AD in the AWS Directory Service Admin Guide. Before you call CreateMicrosoftAD, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the CreateMicrosoftAD operation, see AWS Directory Service API Permissions: Actions, Resources, and Conditions Reference.

Required Parameters
{
  "Password": "The password for the default administrative user named Admin. If you need to change the password for the administrator account, you can use the ResetUserPassword API call.",
  "VpcSettings": "Contains VPC information for the CreateDirectory or CreateMicrosoftAD operation.",
  "Name": "The fully qualified domain name for the AWS Managed Microsoft AD directory, such as corp.example.com. This name will resolve inside your VPC only. It does not need to be publicly resolvable."
}

Optional Parameters
{
  "Description": "A description for the directory. This label will appear on the AWS console Directory Details page after the directory is created.",
  "Tags": "The tags to be assigned to the AWS Managed Microsoft AD directory.",
  "ShortName": "The NetBIOS name for your domain, such as CORP. If you don't specify a NetBIOS name, it will default to the first part of your directory DNS. For example, CORP for the directory DNS corp.example.com. ",
  "Edition": "AWS Managed Microsoft AD is available in two editions: Standard and Enterprise. Enterprise is the default."
}
"""
CreateMicrosoftAD(args) = directory_service("CreateMicrosoftAD", args)
