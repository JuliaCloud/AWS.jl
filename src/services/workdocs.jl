include("../AWSServices.jl")
using .AWSServices: workdocs

"""
    CreateNotificationSubscription()

Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint receives a confirmation message, and must confirm the subscription. For more information, see Subscribe to Notifications in the Amazon WorkDocs Developer Guide.

Required Parameters
{
  "Endpoint": "The endpoint to receive the notifications. If the protocol is HTTPS, the endpoint is a URL that begins with https.",
  "SubscriptionType": "The notification type.",
  "OrganizationId": "The ID of the organization.",
  "Protocol": "The protocol to use. The supported value is https, which delivers JSON-encoded messages using HTTPS POST."
}
"""
CreateNotificationSubscription(args) = workdocs("POST", "/api/v1/organizations/{OrganizationId}/subscriptions", args)

"""
    DeleteCustomMetadata()

Deletes custom metadata from the specified resource.

Required Parameters
{
  "ResourceId": "The ID of the resource, either a document or folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "DeleteAll": "Flag to indicate removal of all custom metadata properties from the specified resource.",
  "VersionId": "The ID of the version, if the custom metadata is being deleted from a document version.",
  "Keys": "List of properties to remove."
}
"""
DeleteCustomMetadata(args) = workdocs("DELETE", "/api/v1/resources/{ResourceId}/customMetadata", args)

"""
    DescribeNotificationSubscriptions()

Lists the specified notification subscriptions.

Required Parameters
{
  "OrganizationId": "The ID of the organization."
}

Optional Parameters
{
  "Marker": "The marker for the next set of results. (You received this marker from a previous call.)",
  "Limit": "The maximum number of items to return with this call."
}
"""
DescribeNotificationSubscriptions(args) = workdocs("GET", "/api/v1/organizations/{OrganizationId}/subscriptions", args)

"""
    GetResources()

Retrieves a collection of resources, including folders and documents. The only CollectionType supported is SHARED_WITH_ME.

Optional Parameters
{
  "AuthenticationToken": "The Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "The marker for the next set of results. This marker was received from a previous call.",
  "CollectionType": "The collection type.",
  "UserId": "The user ID for the resource collection. This is a required field for accessing the API operation using IAM credentials.",
  "Limit": "The maximum number of resources to return."
}
"""
GetResources() = workdocs("GET", "/api/v1/resources")
GetResources(args) = workdocs("GET", "/api/v1/resources", args)

"""
    DeleteNotificationSubscription()

Deletes the specified subscription from the specified organization.

Required Parameters
{
  "SubscriptionId": "The ID of the subscription.",
  "OrganizationId": "The ID of the organization."
}
"""
DeleteNotificationSubscription(args) = workdocs("DELETE", "/api/v1/organizations/{OrganizationId}/subscriptions/{SubscriptionId}", args)

"""
    CreateUser()

Creates a user in a Simple AD or Microsoft AD directory. The status of a newly created user is "ACTIVE". New users can access Amazon WorkDocs.

Required Parameters
{
  "Password": "The password of the user.",
  "GivenName": "The given name of the user.",
  "Surname": "The surname of the user.",
  "Username": "The login name of the user."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "StorageRule": "The amount of storage for the user.",
  "TimeZoneId": "The time zone ID of the user.",
  "OrganizationId": "The ID of the organization.",
  "EmailAddress": "The email address of the user."
}
"""
CreateUser(args) = workdocs("POST", "/api/v1/users", args)

"""
    DescribeRootFolders()

Describes the current user's special folders; the RootFolder and the RecycleBin. RootFolder is the root of user's files and folders and RecycleBin is the root of recycled items. This is not a valid action for SigV4 (administrative API) clients. This action requires an authentication token. To get an authentication token, register an application with Amazon WorkDocs. For more information, see Authentication and Access Control for User Applications in the Amazon WorkDocs Developer Guide.

Required Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token."
}

Optional Parameters
{
  "Marker": "The marker for the next set of results. (You received this marker from a previous call.)",
  "Limit": "The maximum number of items to return."
}
"""
DescribeRootFolders(args) = workdocs("GET", "/api/v1/me/root", args)

"""
    InitiateDocumentVersionUpload()

Creates a new document object and version object. The client specifies the parent folder ID and name of the document to upload. The ID is optionally specified when creating a new version of an existing document. This is the first step to upload a document. Next, upload the document to the URL returned from the call, and then call UpdateDocumentVersion. To cancel the document upload, call AbortDocumentVersionUpload.

Required Parameters
{
  "ParentFolderId": "The ID of the parent folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Id": "The ID of the document.",
  "ContentModifiedTimestamp": "The timestamp when the content of the document was modified.",
  "DocumentSizeInBytes": "The size of the document, in bytes.",
  "ContentType": "The content type of the document.",
  "Name": "The name of the document.",
  "ContentCreatedTimestamp": "The timestamp when the content of the document was originally created."
}
"""
InitiateDocumentVersionUpload(args) = workdocs("POST", "/api/v1/documents", args)

"""
    GetDocumentPath()

Retrieves the path information (the hierarchy from the root folder) for the requested document. By default, Amazon WorkDocs returns a maximum of 100 levels upwards from the requested document and only includes the IDs of the parent folders in the path. You can limit the maximum number of levels. You can also request the names of the parent folders.

Required Parameters
{
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "This value is not supported.",
  "Fields": "A comma-separated list of values. Specify NAME to include the names of the parent folders.",
  "Limit": "The maximum number of levels in the hierarchy to return."
}
"""
GetDocumentPath(args) = workdocs("GET", "/api/v1/documents/{DocumentId}/path", args)

"""
    DeleteFolderContents()

Deletes the contents of the specified folder.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
DeleteFolderContents(args) = workdocs("DELETE", "/api/v1/folders/{FolderId}/contents", args)

"""
    UpdateUser()

Updates the specified attributes of the specified user, and grants or revokes administrative privileges to the Amazon WorkDocs site.

Required Parameters
{
  "UserId": "The ID of the user."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "GrantPoweruserPrivileges": "Boolean value to determine whether the user is granted Poweruser privileges.",
  "GivenName": "The given name of the user.",
  "Surname": "The surname of the user.",
  "StorageRule": "The amount of storage for the user.",
  "Type": "The type of the user.",
  "Locale": "The locale of the user.",
  "TimeZoneId": "The time zone ID of the user."
}
"""
UpdateUser(args) = workdocs("PATCH", "/api/v1/users/{UserId}", args)

"""
    CreateFolder()

Creates a folder with the specified name and parent folder.

Required Parameters
{
  "ParentFolderId": "The ID of the parent folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Name": "The name of the new folder."
}
"""
CreateFolder(args) = workdocs("POST", "/api/v1/folders", args)

"""
    DeleteLabels()

Deletes the specified list of labels from a resource.

Required Parameters
{
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "DeleteAll": "Flag to request removal of all labels from the specified resource.",
  "Labels": "List of labels to delete from the resource."
}
"""
DeleteLabels(args) = workdocs("DELETE", "/api/v1/resources/{ResourceId}/labels", args)

"""
    CreateComment()

Adds a new comment to the specified document version.

Required Parameters
{
  "VersionId": "The ID of the document version.",
  "DocumentId": "The ID of the document.",
  "Text": "The text of the comment."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Visibility": "The visibility of the comment. Options are either PRIVATE, where the comment is visible only to the comment author and document owner and co-owners, or PUBLIC, where the comment is visible to document owners, co-owners, and contributors.",
  "ThreadId": "The ID of the root comment in the thread.",
  "NotifyCollaborators": "Set this parameter to TRUE to send an email out to the document collaborators after the comment is created.",
  "ParentId": "The ID of the parent comment."
}
"""
CreateComment(args) = workdocs("POST", "/api/v1/documents/{DocumentId}/versions/{VersionId}/comment", args)

"""
    CreateLabels()

Adds the specified list of labels to the given resource (a document or folder)

Required Parameters
{
  "ResourceId": "The ID of the resource.",
  "Labels": "List of labels to add to the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
CreateLabels(args) = workdocs("PUT", "/api/v1/resources/{ResourceId}/labels", args)

"""
    RemoveAllResourcePermissions()

Removes all the permissions from the specified resource.

Required Parameters
{
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
RemoveAllResourcePermissions(args) = workdocs("DELETE", "/api/v1/resources/{ResourceId}/permissions", args)

"""
    GetDocument()

Retrieves details of a document.

Required Parameters
{
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "IncludeCustomMetadata": "Set this to TRUE to include custom metadata in the response."
}
"""
GetDocument(args) = workdocs("GET", "/api/v1/documents/{DocumentId}", args)

"""
    DeleteUser()

Deletes the specified user from a Simple AD or Microsoft AD directory.

Required Parameters
{
  "UserId": "The ID of the user."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Do not set this field when using administrative API actions, as in accessing the API using AWS credentials."
}
"""
DeleteUser(args) = workdocs("DELETE", "/api/v1/users/{UserId}", args)

"""
    GetDocumentVersion()

Retrieves version metadata for the specified document.

Required Parameters
{
  "VersionId": "The version ID of the document.",
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Fields": "A comma-separated list of values. Specify \"SOURCE\" to include a URL for the source document.",
  "IncludeCustomMetadata": "Set this to TRUE to include custom metadata in the response."
}
"""
GetDocumentVersion(args) = workdocs("GET", "/api/v1/documents/{DocumentId}/versions/{VersionId}", args)

"""
    UpdateFolder()

Updates the specified attributes of the specified folder. The user must have access to both the folder and its parent folder, if applicable.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "ParentFolderId": "The ID of the parent folder.",
  "ResourceState": "The resource state of the folder. Only ACTIVE and RECYCLED are accepted values from the API.",
  "Name": "The name of the folder."
}
"""
UpdateFolder(args) = workdocs("PATCH", "/api/v1/folders/{FolderId}", args)

"""
    GetFolder()

Retrieves the metadata of the specified folder.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "IncludeCustomMetadata": "Set to TRUE to include custom metadata in the response."
}
"""
GetFolder(args) = workdocs("GET", "/api/v1/folders/{FolderId}", args)

"""
    DescribeGroups()

Describes the groups specified by the query. Groups are defined by the underlying Active Directory.

Required Parameters
{
  "SearchQuery": "A query to describe groups by group name."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "The marker for the next set of results. (You received this marker from a previous call.)",
  "OrganizationId": "The ID of the organization.",
  "Limit": "The maximum number of items to return with this call."
}
"""
DescribeGroups(args) = workdocs("GET", "/api/v1/groups", args)

"""
    UpdateDocumentVersion()

Changes the status of the document version to ACTIVE.  Amazon WorkDocs also sets its document container to ACTIVE. This is the last step in a document upload, after the client uploads the document to an S3-presigned URL returned by InitiateDocumentVersionUpload. 

Required Parameters
{
  "VersionId": "The version ID of the document.",
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "VersionStatus": "The status of the version."
}
"""
UpdateDocumentVersion(args) = workdocs("PATCH", "/api/v1/documents/{DocumentId}/versions/{VersionId}", args)

"""
    GetFolderPath()

Retrieves the path information (the hierarchy from the root folder) for the specified folder. By default, Amazon WorkDocs returns a maximum of 100 levels upwards from the requested folder and only includes the IDs of the parent folders in the path. You can limit the maximum number of levels. You can also request the parent folder names.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "This value is not supported.",
  "Fields": "A comma-separated list of values. Specify \"NAME\" to include the names of the parent folders.",
  "Limit": "The maximum number of levels in the hierarchy to return."
}
"""
GetFolderPath(args) = workdocs("GET", "/api/v1/folders/{FolderId}/path", args)

"""
    AbortDocumentVersionUpload()

Aborts the upload of the specified document version that was previously initiated by InitiateDocumentVersionUpload. The client should make this call only when it no longer intends to upload the document version, or fails to do so.

Required Parameters
{
  "VersionId": "The ID of the version.",
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
AbortDocumentVersionUpload(args) = workdocs("DELETE", "/api/v1/documents/{DocumentId}/versions/{VersionId}", args)

"""
    DescribeComments()

List all the comments for the specified document version.

Required Parameters
{
  "VersionId": "The ID of the document version.",
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "The marker for the next set of results. This marker was received from a previous call.",
  "Limit": "The maximum number of items to return."
}
"""
DescribeComments(args) = workdocs("GET", "/api/v1/documents/{DocumentId}/versions/{VersionId}/comments", args)

"""
    AddResourcePermissions()

Creates a set of permissions for the specified folder or document. The resource permissions are overwritten if the principals already have different permissions.

Required Parameters
{
  "Principals": "The users, groups, or organization being granted permission.",
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "NotificationOptions": "The notification options."
}
"""
AddResourcePermissions(args) = workdocs("POST", "/api/v1/resources/{ResourceId}/permissions", args)

"""
    DescribeActivities()

Describes the user activities in a specified time period.

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "StartTime": "The timestamp that determines the starting time of the activities. The response includes the activities performed after the specified timestamp.",
  "Marker": "The marker for the next set of results.",
  "EndTime": "The timestamp that determines the end time of the activities. The response includes the activities performed before the specified timestamp.",
  "IncludeIndirectActivities": "Includes indirect activities. An indirect activity results from a direct activity performed on a parent resource. For example, sharing a parent folder (the direct activity) shares all of the subfolders and documents within the parent folder (the indirect activity).",
  "UserId": "The ID of the user who performed the action. The response includes activities pertaining to this user. This is an optional parameter and is only applicable for administrative API (SigV4) requests.",
  "ResourceId": "The document or folder ID for which to describe activity types.",
  "OrganizationId": "The ID of the organization. This is a mandatory parameter when using administrative API (SigV4) requests.",
  "ActivityTypes": "Specifies which activity types to include in the response. If this field is left empty, all activity types are returned.",
  "Limit": "The maximum number of items to return."
}
"""
DescribeActivities() = workdocs("GET", "/api/v1/activities")
DescribeActivities(args) = workdocs("GET", "/api/v1/activities", args)

"""
    DeleteFolder()

Permanently deletes the specified folder and its contents.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
DeleteFolder(args) = workdocs("DELETE", "/api/v1/folders/{FolderId}", args)

"""
    DescribeFolderContents()

Describes the contents of the specified folder, including its documents and subfolders. By default, Amazon WorkDocs returns the first 100 active document and folder metadata items. If there are more results, the response includes a marker that you can use to request the next set of results. You can also request initialized documents.

Required Parameters
{
  "FolderId": "The ID of the folder."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Sort": "The sorting criteria.",
  "Marker": "The marker for the next set of results. This marker was received from a previous call.",
  "Order": "The order for the contents of the folder.",
  "Type": "The type of items.",
  "Include": "The contents to include. Specify \"INITIALIZED\" to include initialized documents.",
  "Limit": "The maximum number of items to return with this call."
}
"""
DescribeFolderContents(args) = workdocs("GET", "/api/v1/folders/{FolderId}/contents", args)

"""
    UpdateDocument()

Updates the specified attributes of a document. The user must have access to both the document and its parent folder, if applicable.

Required Parameters
{
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "ParentFolderId": "The ID of the parent folder.",
  "ResourceState": "The resource state of the document. Only ACTIVE and RECYCLED are supported.",
  "Name": "The name of the document."
}
"""
UpdateDocument(args) = workdocs("PATCH", "/api/v1/documents/{DocumentId}", args)

"""
    ActivateUser()

Activates the specified user. Only active users can access Amazon WorkDocs.

Required Parameters
{
  "UserId": "The ID of the user."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
ActivateUser(args) = workdocs("POST", "/api/v1/users/{UserId}/activation", args)

"""
    DeleteDocument()

Permanently deletes the specified document and its associated metadata.

Required Parameters
{
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
DeleteDocument(args) = workdocs("DELETE", "/api/v1/documents/{DocumentId}", args)

"""
    GetCurrentUser()

Retrieves details of the current user for whom the authentication token was generated. This is not a valid action for SigV4 (administrative API) clients. This action requires an authentication token. To get an authentication token, register an application with Amazon WorkDocs. For more information, see Authentication and Access Control for User Applications in the Amazon WorkDocs Developer Guide.

Required Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token."
}
"""
GetCurrentUser(args) = workdocs("GET", "/api/v1/me", args)

"""
    CreateCustomMetadata()

Adds one or more custom properties to the specified resource (a folder, document, or version).

Required Parameters
{
  "CustomMetadata": "Custom metadata in the form of name-value pairs.",
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "VersionId": "The ID of the version, if the custom metadata is being added to a document version."
}
"""
CreateCustomMetadata(args) = workdocs("PUT", "/api/v1/resources/{ResourceId}/customMetadata", args)

"""
    DeactivateUser()

Deactivates the specified user, which revokes the user's access to Amazon WorkDocs.

Required Parameters
{
  "UserId": "The ID of the user."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
DeactivateUser(args) = workdocs("DELETE", "/api/v1/users/{UserId}/activation", args)

"""
    DeleteComment()

Deletes the specified comment from the document version.

Required Parameters
{
  "CommentId": "The ID of the comment.",
  "VersionId": "The ID of the document version.",
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API."
}
"""
DeleteComment(args) = workdocs("DELETE", "/api/v1/documents/{DocumentId}/versions/{VersionId}/comment/{CommentId}", args)

"""
    DescribeResourcePermissions()

Describes the permissions of a specified resource.

Required Parameters
{
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "The marker for the next set of results. (You received this marker from a previous call)",
  "PrincipalId": "The ID of the principal to filter permissions by.",
  "Limit": "The maximum number of items to return with this call."
}
"""
DescribeResourcePermissions(args) = workdocs("GET", "/api/v1/resources/{ResourceId}/permissions", args)

"""
    DescribeUsers()

Describes the specified users. You can describe all users or filter the results (for example, by status or organization). By default, Amazon WorkDocs returns the first 24 active or pending users. If there are more results, the response includes a marker that you can use to request the next set of results.

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Query": "A query to filter users by user name.",
  "Sort": "The sorting criteria.",
  "Marker": "The marker for the next set of results. (You received this marker from a previous call.)",
  "Order": "The order for the results.",
  "Include": "The state of the users. Specify \"ALL\" to include inactive users.",
  "Fields": "A comma-separated list of values. Specify \"STORAGE_METADATA\" to include the user storage quota and utilization information.",
  "UserIds": "The IDs of the users.",
  "OrganizationId": "The ID of the organization.",
  "Limit": "The maximum number of items to return."
}
"""
DescribeUsers() = workdocs("GET", "/api/v1/users")
DescribeUsers(args) = workdocs("GET", "/api/v1/users", args)

"""
    RemoveResourcePermission()

Removes the permission for the specified principal from the specified resource.

Required Parameters
{
  "PrincipalId": "The principal ID of the resource.",
  "ResourceId": "The ID of the resource."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "PrincipalType": "The principal type of the resource."
}
"""
RemoveResourcePermission(args) = workdocs("DELETE", "/api/v1/resources/{ResourceId}/permissions/{PrincipalId}", args)

"""
    DescribeDocumentVersions()

Retrieves the document versions for the specified document. By default, only active versions are returned.

Required Parameters
{
  "DocumentId": "The ID of the document."
}

Optional Parameters
{
  "AuthenticationToken": "Amazon WorkDocs authentication token. Not required when using AWS administrator credentials to access the API.",
  "Marker": "The marker for the next set of results. (You received this marker from a previous call.)",
  "Include": "A comma-separated list of values. Specify \"INITIALIZED\" to include incomplete versions.",
  "Fields": "Specify \"SOURCE\" to include initialized versions and a URL for the source document.",
  "Limit": "The maximum number of versions to return with this call."
}
"""
DescribeDocumentVersions(args) = workdocs("GET", "/api/v1/documents/{DocumentId}/versions", args)
