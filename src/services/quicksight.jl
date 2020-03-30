include("../AWSServices.jl")
using .AWSServices: quicksight

"""
    ListGroupMemberships()

Lists member users in a group.

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to see a membership list of.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return from this request.",
  "NextToken": "A pagination token that can be used in a subsequent request."
}
"""
ListGroupMemberships(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members", args)

"""
    DeleteGroup()

Removes a user group from Amazon QuickSight. 

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to delete.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DeleteGroup(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}", args)

"""
    CreateTemplate()

Creates a template from an existing QuickSight analysis or template. You can use the resulting template to create a dashboard. A template is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.

Required Parameters
{
  "SourceEntity": "The Amazon Resource Name (ARN) of the source entity from which this template is being created. Currently, you can create a template from an analysis or another template. If the ARN is for an analysis, include its dataset references. ",
  "TemplateId": "An ID for the template that you want to create. This template is unique per AWS Region in each AWS account.",
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account."
}

Optional Parameters
{
  "Permissions": "A list of resource permissions to be set on the template. ",
  "Tags": "Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.",
  "Name": "A display name for the template.",
  "VersionDescription": "A description of the current template version being created. This API operation creates the first version of the template. Every time UpdateTemplate is called, a new version is created. Each version of the template maintains a description of the version in the VersionDescription field."
}
"""
CreateTemplate(args) = quicksight("POST", "/accounts/{AwsAccountId}/templates/{TemplateId}", args)

"""
    DescribeDashboard()

Provides a summary for a dashboard.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're describing."
}

Optional Parameters
{
  "VersionNumber": "The version number for the dashboard. If a version number isn't passed, the latest published dashboard version is described. ",
  "AliasName": "The alias name."
}
"""
DescribeDashboard(args) = quicksight("GET", "/accounts/{AwsAccountId}/dashboards/{DashboardId}", args)

"""
    DescribeDataSet()

Describes a dataset. 

Required Parameters
{
  "DataSetId": "The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DescribeDataSet(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sets/{DataSetId}", args)

"""
    UpdateTemplateAlias()

Updates the template alias of a template.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template alias that you're updating.",
  "AliasName": "The alias of the template that you want to update. If you name a specific alias, you update the version that the alias points to. You can specify the latest version of the template by providing the keyword  LATEST in the AliasName parameter. The keyword  PUBLISHED doesn't apply to templates.",
  "TemplateVersionNumber": "The version number of the template."
}
"""
UpdateTemplateAlias(args) = quicksight("PUT", "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}", args)

"""
    TagResource()

Assigns one or more tags (key-value pairs) to the specified QuickSight resource.  Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the TagResource operation with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag. You can associate as many as 50 tags with a resource. QuickSight supports tagging on data set, data source, dashboard, and template.  Tagging for QuickSight works in a similar way to tagging for other AWS services, except for the following:   You can't use tags to track AWS costs for QuickSight. This restriction is because QuickSight costs are based on users and SPICE capacity, which aren't taggable resources.   QuickSight doesn't currently support the Tag Editor for AWS Resource Groups.  

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource that you want to tag.",
  "Tags": "Contains a map of the key-value pairs for the resource tag or tags assigned to the resource."
}
"""
TagResource(args) = quicksight("POST", "/resources/{ResourceArn}/tags", args)

"""
    CreateIAMPolicyAssignment()

Creates an assignment with one specified IAM policy, identified by its Amazon Resource Name (ARN). This policy will be assigned to specified groups or users of Amazon QuickSight. The users and groups need to be in the same namespace. 

Required Parameters
{
  "AssignmentStatus": "The status of the assignment. Possible values are as follows:    ENABLED - Anything specified in this assignment is used when creating the data source.    DISABLED - This assignment isn't used when creating the data source.    DRAFT - This assignment is an unfinished draft and isn't used when creating the data source.  ",
  "AssignmentName": "The name of the assignment. It must be unique within an AWS account.",
  "AwsAccountId": "The ID of the AWS account where you want to assign an IAM policy to QuickSight users or groups.",
  "Namespace": "The namespace that contains the assignment."
}

Optional Parameters
{
  "PolicyArn": "The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.",
  "Identities": "The QuickSight users, groups, or both that you want to assign the policy to."
}
"""
CreateIAMPolicyAssignment(args) = quicksight("POST", "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/", args)

"""
    CreateIngestion()

Creates and starts a new SPICE ingestion on a dataset Any ingestions operating on tagged datasets inherit the same tags automatically for use in access control. For an example, see How do I create an IAM policy to control access to Amazon EC2 resources using tags? in the AWS Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.

Required Parameters
{
  "DataSetId": "The ID of the dataset used in the ingestion.",
  "IngestionId": "An ID for the ingestion.",
  "AwsAccountId": "The AWS account ID."
}
"""
CreateIngestion(args) = quicksight("PUT", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}", args)

"""
    CreateDashboard()

Creates a dashboard from a template. To first create a template, see the CreateTemplate API operation. A dashboard is an entity in QuickSight that identifies QuickSight reports, created from analyses. You can share QuickSight dashboards. With the right permissions, you can create scheduled email reports from them. The CreateDashboard, DescribeDashboard, and ListDashboardsByUser API operations act on the dashboard entity. If you have the correct permissions, you can create a dashboard from a template that exists in a different AWS account.

Required Parameters
{
  "DashboardId": "The ID for the dashboard, also added to the IAM policy.",
  "SourceEntity": "The source entity from which the dashboard is created. The source entity accepts the Amazon Resource Name (ARN) of the source template or analysis and also references the replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template.  If you are creating a dashboard from a source entity in a different AWS account, use the ARN of the source template.",
  "AwsAccountId": "The ID of the AWS account where you want to create the dashboard.",
  "Name": "The display name of the dashboard."
}

Optional Parameters
{
  "Permissions": "A structure that contains the permissions of the dashboard. You can use this structure for granting permissions with principal and action information.",
  "Tags": "Contains a map of the key-value pairs for the resource tag or tags assigned to the dashboard.",
  "DashboardPublishOptions": "Options for publishing the dashboard when you create it:    AvailabilityStatus for AdHocFilteringOption - This status can be either ENABLED or DISABLED. When this is set to DISABLED, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is ENABLED by default.     AvailabilityStatus for ExportToCSVOption - This status can be either ENABLED or DISABLED. The visual option to export data to .csv format isn't enabled when this is set to DISABLED. This option is ENABLED by default.     VisibilityState for SheetControlsOption - This visibility state can be either COLLAPSED or EXPANDED. The sheet controls pane is collapsed by default when set to true. This option is COLLAPSED by default.   ",
  "Parameters": "A structure that contains the parameters of the dashboard. These are parameter overrides for a dashboard. A dashboard can have any type of parameters, and some parameters might accept multiple values. You can use the dashboard permissions structure described following to override two string parameters that accept multiple values. ",
  "VersionDescription": "A description for the first version of the dashboard being created."
}
"""
CreateDashboard(args) = quicksight("POST", "/accounts/{AwsAccountId}/dashboards/{DashboardId}", args)

"""
    GetDashboardEmbedUrl()

Generates a server-side embeddable URL and authorization code. For this process to work properly, first configure the dashboards and user permissions. For more information, see Embedding Amazon QuickSight Dashboards in the Amazon QuickSight User Guide or Embedding Amazon QuickSight Dashboards in the Amazon QuickSight API Reference. Currently, you can use GetDashboardEmbedURL only from the server, not from the user’s browser.

Required Parameters
{
  "DashboardId": "The ID for the dashboard, also added to the IAM policy.",
  "IdentityType": "The authentication method that the user uses to sign in.",
  "AwsAccountId": "The ID for the AWS account that contains the dashboard that you're embedding."
}

Optional Parameters
{
  "ResetDisabled": "Remove the reset button on the embedded dashboard. The default is FALSE, which enables the reset button.",
  "SessionLifetimeInMinutes": "How many minutes the session is valid. The session lifetime must be 15-600 minutes.",
  "UndoRedoDisabled": "Remove the undo/redo button on the embedded dashboard. The default is FALSE, which enables the undo/redo button.",
  "UserArn": "The Amazon QuickSight user's Amazon Resource Name (ARN), for use with QUICKSIGHT identity type. You can use this for any Amazon QuickSight users in your account (readers, authors, or admins) authenticated as one of the following:   Active Directory (AD) users or group members   Invited nonfederated users   IAM users and IAM role-based sessions authenticated through Federated Single Sign-On using SAML, OpenID Connect, or IAM federation.  "
}
"""
GetDashboardEmbedUrl(args) = quicksight("GET", "/accounts/{AwsAccountId}/dashboards/{DashboardId}/embed-url", args)

"""
    UpdateIAMPolicyAssignment()

Updates an existing IAM policy assignment. This operation updates only the optional parameter or parameters that are specified in the request.

Required Parameters
{
  "AssignmentName": "The name of the assignment. This name must be unique within an AWS account.",
  "AwsAccountId": "The ID of the AWS account that contains the IAM policy assignment.",
  "Namespace": "The namespace of the assignment."
}

Optional Parameters
{
  "PolicyArn": "The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.",
  "AssignmentStatus": "The status of the assignment. Possible values are as follows:    ENABLED - Anything specified in this assignment is used when creating the data source.    DISABLED - This assignment isn't used when creating the data source.    DRAFT - This assignment is an unfinished draft and isn't used when creating the data source.  ",
  "Identities": "The QuickSight users, groups, or both that you want to assign the policy to."
}
"""
UpdateIAMPolicyAssignment(args) = quicksight("PUT", "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}", args)

"""
    UpdateDataSource()

Updates a data source.

Required Parameters
{
  "DataSourceId": "The ID of the data source. This ID is unique per AWS Region for each AWS account. ",
  "AwsAccountId": "The AWS account ID.",
  "Name": "A display name for the data source."
}

Optional Parameters
{
  "Credentials": "The credentials that QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.",
  "SslProperties": "Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.",
  "VpcConnectionProperties": "Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.",
  "DataSourceParameters": "The parameters that QuickSight uses to connect to your underlying source."
}
"""
UpdateDataSource(args) = quicksight("PUT", "/accounts/{AwsAccountId}/data-sources/{DataSourceId}", args)

"""
    ListTemplateVersions()

Lists all the versions of the templates in the current Amazon QuickSight account.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the templates that you're listing."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListTemplateVersions(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates/{TemplateId}/versions", args)

"""
    CreateGroupMembership()

Adds an Amazon QuickSight user to an Amazon QuickSight group. 

Required Parameters
{
  "MemberName": "The name of the user that you want to add to the group membership.",
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to add the user to.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
CreateGroupMembership(args) = quicksight("PUT", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}", args)

"""
    DescribeTemplate()

Describes a template's metadata.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template that you're describing."
}

Optional Parameters
{
  "VersionNumber": "(Optional) The number for the version to describe. If a VersionNumber parameter value isn't provided, the latest version of the template is described.",
  "AliasName": "The alias of the template that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword  LATEST in the AliasName parameter. The keyword  PUBLISHED doesn't apply to templates."
}
"""
DescribeTemplate(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates/{TemplateId}", args)

"""
    DeleteTemplateAlias()

Deletes the item that the specified template alias points to. If you provide a specific alias, you delete the version of the template that the alias points to.

Required Parameters
{
  "TemplateId": "The ID for the template that the specified alias is for.",
  "AwsAccountId": "The ID of the AWS account that contains the item to delete.",
  "AliasName": "The name for the template alias. If you name a specific alias, you delete the version that the alias points to. You can specify the latest version of the template by providing the keyword  LATEST in the AliasName parameter. "
}
"""
DeleteTemplateAlias(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}", args)

"""
    DeleteDataSource()

Deletes the data source permanently. This action breaks all the datasets that reference the deleted data source.

Required Parameters
{
  "DataSourceId": "The ID of the data source. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DeleteDataSource(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/data-sources/{DataSourceId}", args)

"""
    RegisterUser()

Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity and Access Management (IAM) identity or role specified in the request. 

Required Parameters
{
  "IdentityType": "Amazon QuickSight supports several ways of managing the identity of users. This parameter accepts two values:    IAM: A user whose identity maps to an existing IAM user or role.     QUICKSIGHT: A user whose identity is owned and managed internally by Amazon QuickSight.   ",
  "Email": "The email address of the user that you want to register.",
  "UserRole": "The Amazon QuickSight role for the user. The user role can be one of the following:    READER: A user who has read-only access to dashboards.    AUTHOR: A user who can create data sources, datasets, analyses, and dashboards.    ADMIN: A user who is an author, who can also manage Amazon QuickSight settings.    RESTRICTED_READER: This role isn't currently available for use.    RESTRICTED_AUTHOR: This role isn't currently available for use.  ",
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "UserName": "The Amazon QuickSight user name that you want to create for the user you are registering.",
  "SessionName": "You need to use this parameter only when you register one or more users using an assumed IAM role. You don't need to provide the session name for other scenarios, for example when you are registering an IAM user or an Amazon QuickSight user. You can register multiple users using the same IAM role if each user has a different session name. For more information on assuming IAM roles, see  assume-role  in the AWS CLI Reference. ",
  "IamArn": "The ARN of the IAM user or role that you are registering with Amazon QuickSight. "
}
"""
RegisterUser(args) = quicksight("POST", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users", args)

"""
    UpdateDataSetPermissions()

Updates the permissions on a dataset. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/data-set-id.

Required Parameters
{
  "DataSetId": "The ID for the dataset whose permissions you want to update. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}

Optional Parameters
{
  "RevokePermissions": "The resource permissions that you want to revoke from the dataset.",
  "GrantPermissions": "The resource permissions that you want to grant to the dataset."
}
"""
UpdateDataSetPermissions(args) = quicksight("POST", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions", args)

"""
    UpdateDataSourcePermissions()

Updates the permissions to a data source.

Required Parameters
{
  "DataSourceId": "The ID of the data source. This ID is unique per AWS Region for each AWS account. ",
  "AwsAccountId": "The AWS account ID."
}

Optional Parameters
{
  "RevokePermissions": "A list of resource permissions that you want to revoke on the data source.",
  "GrantPermissions": "A list of resource permissions that you want to grant on the data source."
}
"""
UpdateDataSourcePermissions(args) = quicksight("POST", "/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions", args)

"""
    UpdateTemplate()

Updates a template from an existing Amazon QuickSight analysis or another template.

Required Parameters
{
  "SourceEntity": "The source QuickSight entity from which this template is being updated. You can currently update templates from an Analysis or another template.",
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template that you're updating."
}

Optional Parameters
{
  "Name": "The name for the template.",
  "VersionDescription": "A description of the current template version that is being updated. Every time you call UpdateTemplate, you create a new version of the template. Each version of the template maintains a description of the version in the VersionDescription field."
}
"""
UpdateTemplate(args) = quicksight("PUT", "/accounts/{AwsAccountId}/templates/{TemplateId}", args)

"""
    DeleteUser()

Deletes the Amazon QuickSight user that is associated with the identity of the AWS Identity and Access Management (IAM) user or role that's making the call. The IAM user isn't deleted as a result of this call. 

Required Parameters
{
  "UserName": "The name of the user that you want to delete.",
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DeleteUser(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}", args)

"""
    UntagResource()

Removes a tag or tags from a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource that you want to untag.",
  "TagKeys": "The keys of the key-value pairs for the resource tag or tags assigned to the resource."
}
"""
UntagResource(args) = quicksight("DELETE", "/resources/{ResourceArn}/tags", args)

"""
    CreateDataSet()

Creates a dataset.

Required Parameters
{
  "DataSetId": "An ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.",
  "PhysicalTableMap": "Declares the physical tables that are available in the underlying data sources.",
  "AwsAccountId": "The AWS account ID.",
  "ImportMode": "Indicates whether you want to import the data into SPICE.",
  "Name": "The display name for the dataset."
}

Optional Parameters
{
  "Permissions": "A list of resource permissions on the dataset.",
  "RowLevelPermissionDataSet": "The row-level security configuration for the data that you want to create.",
  "Tags": "Contains a map of the key-value pairs for the resource tag or tags assigned to the dataset.",
  "LogicalTableMap": "Configures the combination and transformation of the data from the physical tables.",
  "ColumnGroups": "Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported."
}
"""
CreateDataSet(args) = quicksight("POST", "/accounts/{AwsAccountId}/data-sets", args)

"""
    ListDataSources()

Lists data sources in current AWS Region that belong to this AWS account.

Required Parameters
{
  "AwsAccountId": "The AWS account ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListDataSources(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sources", args)

"""
    DescribeIngestion()

Describes a SPICE ingestion.

Required Parameters
{
  "DataSetId": "The ID of the dataset used in the ingestion.",
  "IngestionId": "An ID for the ingestion.",
  "AwsAccountId": "The AWS account ID."
}
"""
DescribeIngestion(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}", args)

"""
    UpdateDashboard()

Updates a dashboard in an AWS account.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "SourceEntity": "The template or analysis from which the dashboard is created. The SouceTemplate entity accepts the Amazon Resource Name (ARN) of the template and also references to replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're updating.",
  "Name": "The display name of the dashboard."
}

Optional Parameters
{
  "DashboardPublishOptions": "Options for publishing the dashboard when you create it:    AvailabilityStatus for AdHocFilteringOption - This status can be either ENABLED or DISABLED. When this is set to DISABLED, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is ENABLED by default.     AvailabilityStatus for ExportToCSVOption - This status can be either ENABLED or DISABLED. The visual option to export data to .csv format isn't enabled when this is set to DISABLED. This option is ENABLED by default.     VisibilityState for SheetControlsOption - This visibility state can be either COLLAPSED or EXPANDED. The sheet controls pane is collapsed by default when set to true. This option is COLLAPSED by default.   ",
  "Parameters": "A structure that contains the parameters of the dashboard.",
  "VersionDescription": "A description for the first version of the dashboard being created."
}
"""
UpdateDashboard(args) = quicksight("PUT", "/accounts/{AwsAccountId}/dashboards/{DashboardId}", args)

"""
    CreateGroup()

Creates an Amazon QuickSight group. The permissions resource is arn:aws:quicksight:us-east-1:&lt;relevant-aws-account-id&gt;:group/default/&lt;group-name&gt; . The response is a group object.

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "A name for the group that you want to create.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "Description": "A description for the group that you want to create."
}
"""
CreateGroup(args) = quicksight("POST", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups", args)

"""
    CreateDataSource()

Creates a data source.

Required Parameters
{
  "DataSourceId": "An ID for the data source. This ID is unique per AWS Region for each AWS account. ",
  "Type": "The type of the data source. Currently, the supported types for this operation are: ATHENA, AURORA, AURORA_POSTGRESQL, MARIADB, MYSQL, POSTGRESQL, PRESTO, REDSHIFT, S3, SNOWFLAKE, SPARK, SQLSERVER, TERADATA. Use ListDataSources to return a list of all data sources.",
  "AwsAccountId": "The AWS account ID.",
  "Name": "A display name for the data source."
}

Optional Parameters
{
  "Permissions": "A list of resource permissions on the data source.",
  "Tags": "Contains a map of the key-value pairs for the resource tag or tags assigned to the data source.",
  "Credentials": "The credentials QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.",
  "SslProperties": "Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.",
  "VpcConnectionProperties": "Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.",
  "DataSourceParameters": "The parameters that QuickSight uses to connect to your underlying source."
}
"""
CreateDataSource(args) = quicksight("POST", "/accounts/{AwsAccountId}/data-sources", args)

"""
    DescribeTemplatePermissions()

Describes read and write permissions on a template.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template that you're describing."
}
"""
DescribeTemplatePermissions(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates/{TemplateId}/permissions", args)

"""
    ListDataSets()

Lists all of the datasets belonging to the current AWS account in an AWS Region. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/*.

Required Parameters
{
  "AwsAccountId": "The AWS account ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListDataSets(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sets", args)

"""
    ListUserGroups()

Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.

Required Parameters
{
  "UserName": "The Amazon QuickSight user name that you want to list group memberships for.",
  "AwsAccountId": "The AWS account ID that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return from this request.",
  "NextToken": "A pagination token that can be used in a subsequent request."
}
"""
ListUserGroups(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/groups", args)

"""
    ListTemplateAliases()

Lists all the aliases of a template.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template aliases that you're listing."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListTemplateAliases(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases", args)

"""
    DeleteDashboard()

Deletes a dashboard.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're deleting."
}

Optional Parameters
{
  "VersionNumber": "The version number of the dashboard. If the version number property is provided, only the specified version of the dashboard is deleted."
}
"""
DeleteDashboard(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/dashboards/{DashboardId}", args)

"""
    ListTagsForResource()

Lists the tags assigned to a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource that you want a list of tags for."
}
"""
ListTagsForResource(args) = quicksight("GET", "/resources/{ResourceArn}/tags", args)

"""
    UpdateUser()

Updates an Amazon QuickSight user.

Required Parameters
{
  "UserName": "The Amazon QuickSight user name that you want to update.",
  "Email": "The email address of the user that you want to update.",
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default.",
  "Role": "The Amazon QuickSight role of the user. The user role can be one of the following:    READER: A user who has read-only access to dashboards.    AUTHOR: A user who can create data sources, datasets, analyses, and dashboards.    ADMIN: A user who is an author, who can also manage Amazon QuickSight settings.  "
}
"""
UpdateUser(args) = quicksight("PUT", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}", args)

"""
    UpdateDashboardPublishedVersion()

Updates the published version of a dashboard.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "VersionNumber": "The version number of the dashboard.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're updating."
}
"""
UpdateDashboardPublishedVersion(args) = quicksight("PUT", "/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions/{VersionNumber}", args)

"""
    ListIngestions()

Lists the history of SPICE ingestions for a dataset.

Required Parameters
{
  "DataSetId": "The ID of the dataset used in the ingestion.",
  "AwsAccountId": "The AWS account ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListIngestions(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions", args)

"""
    DeleteUserByPrincipalId()

Deletes a user identified by its principal ID. 

Required Parameters
{
  "PrincipalId": "The principal ID of the user.",
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DeleteUserByPrincipalId(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/namespaces/{Namespace}/user-principals/{PrincipalId}", args)

"""
    DeleteTemplate()

Deletes a template.

Required Parameters
{
  "TemplateId": "An ID for the template you want to delete.",
  "AwsAccountId": "The ID of the AWS account that contains the template that you're deleting."
}

Optional Parameters
{
  "VersionNumber": "Specifies the version of the template that you want to delete. If you don't provide a version number, DeleteTemplate deletes all versions of the template. "
}
"""
DeleteTemplate(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/templates/{TemplateId}", args)

"""
    ListIAMPolicyAssignmentsForUser()

Lists all the IAM policy assignments, including the Amazon Resource Names (ARNs) for the IAM policies assigned to the specified user and group or groups that the user belongs to.

Required Parameters
{
  "UserName": "The name of the user.",
  "AwsAccountId": "The ID of the AWS account that contains the assignments.",
  "Namespace": "The namespace of the assignment."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListIAMPolicyAssignmentsForUser(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/iam-policy-assignments", args)

"""
    DeleteGroupMembership()

Removes a user from a group so that the user is no longer a member of the group.

Required Parameters
{
  "MemberName": "The name of the user that you want to delete from the group membership.",
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to delete the user from.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DeleteGroupMembership(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}", args)

"""
    DescribeDashboardPermissions()

Describes read and write permissions for a dashboard.

Required Parameters
{
  "DashboardId": "The ID for the dashboard, also added to the IAM policy.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're describing permissions for."
}
"""
DescribeDashboardPermissions(args) = quicksight("GET", "/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions", args)

"""
    ListUsers()

Returns a list of all of the Amazon QuickSight users belonging to this account. 

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return from this request.",
  "NextToken": "A pagination token that can be used in a subsequent request."
}
"""
ListUsers(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users", args)

"""
    DeleteDataSet()

Deletes a dataset.

Required Parameters
{
  "DataSetId": "The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DeleteDataSet(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/data-sets/{DataSetId}", args)

"""
    DeleteIAMPolicyAssignment()

Deletes an existing IAM policy assignment.

Required Parameters
{
  "AssignmentName": "The name of the assignment. ",
  "AwsAccountId": "The AWS account ID where you want to delete the IAM policy assignment.",
  "Namespace": "The namespace that contains the assignment."
}
"""
DeleteIAMPolicyAssignment(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/namespace/{Namespace}/iam-policy-assignments/{AssignmentName}", args)

"""
    ListGroups()

Lists all user groups in Amazon QuickSight. 

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return.",
  "NextToken": "A pagination token that can be used in a subsequent request."
}
"""
ListGroups(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups", args)

"""
    ListTemplates()

Lists all the templates in the current Amazon QuickSight account.

Required Parameters
{
  "AwsAccountId": "The ID of the AWS account that contains the templates that you're listing."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListTemplates(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates", args)

"""
    DescribeUser()

Returns information about a user, given the user name. 

Required Parameters
{
  "UserName": "The name of the user that you want to describe.",
  "AwsAccountId": "The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DescribeUser(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}", args)

"""
    SearchDashboards()

Searchs for dashboards that belong to a user. 

Required Parameters
{
  "AwsAccountId": "The ID of the AWS account that contains the user whose dashboards you're searching for. ",
  "Filters": "The filters to apply to the search. Currently, you can search only by user name. For example, \"Filters\": [ { \"Name\": \"QUICKSIGHT_USER\", \"Operator\": \"StringEquals\", \"Value\": \"arn:aws:quicksight:us-east-1:1:user/default/UserName1\" } ] "
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
SearchDashboards(args) = quicksight("POST", "/accounts/{AwsAccountId}/search/dashboards", args)

"""
    UpdateDataSet()

Updates a dataset.

Required Parameters
{
  "DataSetId": "The ID for the dataset that you want to update. This ID is unique per AWS Region for each AWS account.",
  "PhysicalTableMap": "Declares the physical tables that are available in the underlying data sources.",
  "AwsAccountId": "The AWS account ID.",
  "ImportMode": "Indicates whether you want to import the data into SPICE.",
  "Name": "The display name for the dataset."
}

Optional Parameters
{
  "RowLevelPermissionDataSet": "The row-level security configuration for the data you want to create.",
  "LogicalTableMap": "Configures the combination and transformation of the data from the physical tables.",
  "ColumnGroups": "Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported."
}
"""
UpdateDataSet(args) = quicksight("PUT", "/accounts/{AwsAccountId}/data-sets/{DataSetId}", args)

"""
    DescribeIAMPolicyAssignment()

Describes an existing IAM policy assignment, as specified by the assignment name.

Required Parameters
{
  "AssignmentName": "The name of the assignment. ",
  "AwsAccountId": "The ID of the AWS account that contains the assignment that you want to describe.",
  "Namespace": "The namespace that contains the assignment."
}
"""
DescribeIAMPolicyAssignment(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}", args)

"""
    UpdateDashboardPermissions()

Updates read and write permissions on a dashboard.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard whose permissions you're updating."
}

Optional Parameters
{
  "RevokePermissions": "The permissions that you want to revoke from this resource.",
  "GrantPermissions": "The permissions that you want to grant on this resource."
}
"""
UpdateDashboardPermissions(args) = quicksight("PUT", "/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions", args)

"""
    CreateTemplateAlias()

Creates a template alias for a template.

Required Parameters
{
  "TemplateId": "An ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template that you creating an alias for.",
  "AliasName": "The name that you want to give to the template alias that you're creating. Don't start the alias name with the   character. Alias names that start with   are reserved by QuickSight. ",
  "TemplateVersionNumber": "The version number of the template."
}
"""
CreateTemplateAlias(args) = quicksight("POST", "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}", args)

"""
    DescribeDataSourcePermissions()

Describes the resource permissions for a data source.

Required Parameters
{
  "DataSourceId": "The ID of the data source. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DescribeDataSourcePermissions(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions", args)

"""
    ListIAMPolicyAssignments()

Lists IAM policy assignments in the current Amazon QuickSight account.

Required Parameters
{
  "AwsAccountId": "The ID of the AWS account that contains these IAM policy assignments.",
  "Namespace": "The namespace for the assignments."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "AssignmentStatus": "The status of the assignments.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListIAMPolicyAssignments(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments", args)

"""
    DescribeDataSetPermissions()

Describes the permissions on a dataset. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/data-set-id.

Required Parameters
{
  "DataSetId": "The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DescribeDataSetPermissions(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions", args)

"""
    DescribeTemplateAlias()

Describes the template alias for a template.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template alias that you're describing.",
  "AliasName": "The name of the template alias that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword  LATEST in the AliasName parameter. The keyword  PUBLISHED doesn't apply to templates."
}
"""
DescribeTemplateAlias(args) = quicksight("GET", "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}", args)

"""
    DescribeDataSource()

Describes a data source.

Required Parameters
{
  "DataSourceId": "The ID of the data source. This ID is unique per AWS Region for each AWS account.",
  "AwsAccountId": "The AWS account ID."
}
"""
DescribeDataSource(args) = quicksight("GET", "/accounts/{AwsAccountId}/data-sources/{DataSourceId}", args)

"""
    ListDashboardVersions()

Lists all the versions of the dashboards in the QuickSight subscription.

Required Parameters
{
  "DashboardId": "The ID for the dashboard.",
  "AwsAccountId": "The ID of the AWS account that contains the dashboard that you're listing versions for."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListDashboardVersions(args) = quicksight("GET", "/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions", args)

"""
    DescribeGroup()

Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN). 

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to describe.",
  "Namespace": "The namespace. Currently, you should set this to default."
}
"""
DescribeGroup(args) = quicksight("GET", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}", args)

"""
    ListDashboards()

Lists dashboards in an AWS account.

Required Parameters
{
  "AwsAccountId": "The ID of the AWS account that contains the dashboards that you're listing."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request.",
  "NextToken": "The token for the next set of results, or null if there are no more results."
}
"""
ListDashboards(args) = quicksight("GET", "/accounts/{AwsAccountId}/dashboards", args)

"""
    CancelIngestion()

Cancels an ongoing ingestion of data into SPICE.

Required Parameters
{
  "DataSetId": "The ID of the dataset used in the ingestion.",
  "IngestionId": "An ID for the ingestion.",
  "AwsAccountId": "The AWS account ID."
}
"""
CancelIngestion(args) = quicksight("DELETE", "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}", args)

"""
    UpdateTemplatePermissions()

Updates the resource permissions for a template.

Required Parameters
{
  "TemplateId": "The ID for the template.",
  "AwsAccountId": "The ID of the AWS account that contains the template."
}

Optional Parameters
{
  "RevokePermissions": "A list of resource permissions to be revoked from the template. ",
  "GrantPermissions": "A list of resource permissions to be granted on the template. "
}
"""
UpdateTemplatePermissions(args) = quicksight("PUT", "/accounts/{AwsAccountId}/templates/{TemplateId}/permissions", args)

"""
    UpdateGroup()

Changes a group description. 

Required Parameters
{
  "AwsAccountId": "The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.",
  "GroupName": "The name of the group that you want to update.",
  "Namespace": "The namespace. Currently, you should set this to default."
}

Optional Parameters
{
  "Description": "The description for the group that you want to update."
}
"""
UpdateGroup(args) = quicksight("PUT", "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}", args)
