include("../AWSServices.jl")
using .AWSServices: codebuild

"""
    DeleteResourcePolicy()

 Deletes a resource policy that is identified by its resource ARN. 

Required Parameters
{
  "resourceArn": " The ARN of the resource that is associated with the resource policy. "
}
"""
DeleteResourcePolicy(args) = codebuild("DeleteResourcePolicy", args)

"""
    UpdateProject()

Changes the settings of a build project.

Required Parameters
{
  "name": "The name of the build project.  You cannot change a build project's name. "
}

Optional Parameters
{
  "badgeEnabled": "Set this to true to generate a publicly accessible URL for your project's build badge.",
  "vpcConfig": "VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.",
  "timeoutInMinutes": "The replacement value in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait before timing out any related build that did not get marked as completed.",
  "environment": "Information to be changed about the build environment for the build project.",
  "queuedTimeoutInMinutes": " The number of minutes a build is allowed to be queued before it times out. ",
  "description": "A new or replacement description of the build project.",
  "artifacts": "Information to be changed about the build output artifacts for the build project.",
  "cache": "Stores recently used information so that it can be quickly accessed at a later time.",
  "serviceRole": "The replacement ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.",
  "secondaryArtifacts": " An array of ProjectSource objects. ",
  "encryptionKey": "The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.   You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key.   You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format alias/alias-name ).",
  "source": "Information to be changed about the build input source code for the build project.",
  "secondarySources": " An array of ProjectSource objects. ",
  "logsConfig": " Information about logs for the build project. A project can create logs in Amazon CloudWatch Logs, logs in an S3 bucket, or both. ",
  "secondarySourceVersions": " An array of ProjectSourceVersion objects. If secondarySourceVersions is specified at the build level, then they take over these secondarySourceVersions (at the project level). ",
  "fileSystemLocations": " An array of ProjectFileSystemLocation objects for a CodeBuild build project. A ProjectFileSystemLocation object specifies the identifier, location, mountOptions, mountPoint, and type of a file system created using Amazon Elastic File System. ",
  "tags": "The replacement set of tags for this build project. These tags are available for use by AWS services that support AWS CodeBuild build project tags.",
  "sourceVersion": " A version of the build input to be built for this project. If not specified, the latest version is used. If specified, it must be one of:    For AWS CodeCommit: the commit ID, branch, or Git tag to use.   For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format pr/pull-request-ID (for example pr/25). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.    If sourceVersion is specified at the build level, then that version takes precedence over this sourceVersion (at the project level).   For more information, see Source Version Sample with CodeBuild in the AWS CodeBuild User Guide. "
}
"""
UpdateProject(args) = codebuild("UpdateProject", args)

"""
    BatchGetBuilds()

Gets information about one or more builds.

Required Parameters
{
  "ids": "The IDs of the builds."
}
"""
BatchGetBuilds(args) = codebuild("BatchGetBuilds", args)

"""
    DeleteReport()

 Deletes a report. 

Required Parameters
{
  "arn": " The ARN of the report to delete. "
}
"""
DeleteReport(args) = codebuild("DeleteReport", args)

"""
    ListCuratedEnvironmentImages()

Gets information about Docker images that are managed by AWS CodeBuild.
"""
ListCuratedEnvironmentImages() = codebuild("ListCuratedEnvironmentImages")
ListCuratedEnvironmentImages(args) = codebuild("ListCuratedEnvironmentImages", args)

"""
    ListBuilds()

Gets a list of build IDs, with each build ID representing a single build.

Optional Parameters
{
  "sortOrder": "The order to list build IDs. Valid values include:    ASCENDING: List the build IDs in ascending order by build ID.    DESCENDING: List the build IDs in descending order by build ID.  ",
  "nextToken": "During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a nextToken. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned."
}
"""
ListBuilds() = codebuild("ListBuilds")
ListBuilds(args) = codebuild("ListBuilds", args)

"""
    GetResourcePolicy()

 Gets a resource policy that is identified by its resource ARN. 

Required Parameters
{
  "resourceArn": " The ARN of the resource that is associated with the resource policy. "
}
"""
GetResourcePolicy(args) = codebuild("GetResourcePolicy", args)

"""
    PutResourcePolicy()

 Stores a resource policy for the ARN of a Project or ReportGroup object. 

Required Parameters
{
  "policy": " A JSON-formatted resource policy. For more information, see Sharing a Project and Sharing a Report Group in the AWS CodeBuild User Guide. ",
  "resourceArn": " The ARN of the Project or ReportGroup resource you want to associate with a resource policy. "
}
"""
PutResourcePolicy(args) = codebuild("PutResourcePolicy", args)

"""
    BatchGetReportGroups()

 Returns an array of report groups. 

Required Parameters
{
  "reportGroupArns": " An array of report group ARNs that identify the report groups to return. "
}
"""
BatchGetReportGroups(args) = codebuild("BatchGetReportGroups", args)

"""
    CreateProject()

Creates a build project.

Required Parameters
{
  "name": "The name of the build project.",
  "source": "Information about the build input source code for the build project.",
  "serviceRole": "The ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.",
  "environment": "Information about the build environment for the build project.",
  "artifacts": "Information about the build output artifacts for the build project."
}

Optional Parameters
{
  "badgeEnabled": "Set this to true to generate a publicly accessible URL for your project's build badge.",
  "vpcConfig": "VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.",
  "timeoutInMinutes": "How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait before it times out any build that has not been marked as completed. The default is 60 minutes.",
  "queuedTimeoutInMinutes": " The number of minutes a build is allowed to be queued before it times out. ",
  "description": "A description that makes the build project easy to identify.",
  "cache": "Stores recently used information so that it can be quickly accessed at a later time.",
  "secondaryArtifacts": " An array of ProjectArtifacts objects. ",
  "encryptionKey": "The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.   You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key.   You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format alias/alias-name ).",
  "secondarySources": " An array of ProjectSource objects. ",
  "logsConfig": " Information about logs for the build project. These can be logs in Amazon CloudWatch Logs, logs uploaded to a specified S3 bucket, or both. ",
  "secondarySourceVersions": " An array of ProjectSourceVersion objects. If secondarySourceVersions is specified at the build level, then they take precedence over these secondarySourceVersions (at the project level). ",
  "fileSystemLocations": " An array of ProjectFileSystemLocation objects for a CodeBuild build project. A ProjectFileSystemLocation object specifies the identifier, location, mountOptions, mountPoint, and type of a file system created using Amazon Elastic File System. ",
  "tags": "A set of tags for this build project. These tags are available for use by AWS services that support AWS CodeBuild build project tags.",
  "sourceVersion": " A version of the build input to be built for this project. If not specified, the latest version is used. If specified, it must be one of:    For AWS CodeCommit: the commit ID, branch, or Git tag to use.   For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format pr/pull-request-ID (for example pr/25). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.    If sourceVersion is specified at the build level, then that version takes precedence over this sourceVersion (at the project level).   For more information, see Source Version Sample with CodeBuild in the AWS CodeBuild User Guide. "
}
"""
CreateProject(args) = codebuild("CreateProject", args)

"""
    ListSharedReportGroups()

 Gets a list of report groups that are shared with other AWS accounts or users. 

Optional Parameters
{
  "sortBy": " The criterion to be used to list report groups shared with the current AWS account or user. Valid values include:     ARN: List based on the ARN.     MODIFIED_TIME: List based on when information about the shared report group was last changed.   ",
  "sortOrder": "The order in which to list shared report groups. Valid values include:    ASCENDING: List in ascending order.    DESCENDING: List in descending order.  ",
  "maxResults": " The maximum number of paginated shared report groups per response. Use nextToken to iterate pages in the list of returned ReportGroup objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
ListSharedReportGroups() = codebuild("ListSharedReportGroups")
ListSharedReportGroups(args) = codebuild("ListSharedReportGroups", args)

"""
    ListReportGroups()

 Gets a list ARNs for the report groups in the current AWS account. 

Optional Parameters
{
  "sortBy": " The criterion to be used to list build report groups. Valid values include:     CREATED_TIME: List based on when each report group was created.    LAST_MODIFIED_TIME: List based on when each report group was last changed.    NAME: List based on each report group's name.  ",
  "sortOrder": " Used to specify the order to sort the list of returned report groups. Valid values are ASCENDING and DESCENDING. ",
  "maxResults": " The maximum number of paginated report groups returned per response. Use nextToken to iterate pages in the list of returned ReportGroup objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
ListReportGroups() = codebuild("ListReportGroups")
ListReportGroups(args) = codebuild("ListReportGroups", args)

"""
    ListReports()

 Returns a list of ARNs for the reports in the current AWS account. 

Optional Parameters
{
  "filter": " A ReportFilter object used to filter the returned reports. ",
  "sortOrder": " Specifies the sort order for the list of returned reports. Valid values are:     ASCENDING: return reports in chronological order based on their creation date.     DESCENDING: return reports in the reverse chronological order based on their creation date.   ",
  "maxResults": " The maximum number of paginated reports returned per response. Use nextToken to iterate pages in the list of returned Report objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
ListReports() = codebuild("ListReports")
ListReports(args) = codebuild("ListReports", args)

"""
    StartBuild()

Starts running a build.

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild build project to start running a build."
}

Optional Parameters
{
  "imageOverride": "The name of an image for this build that overrides the one specified in the build project.",
  "gitCloneDepthOverride": "The user-defined depth of history, with a minimum value of 0, that overrides, for this build only, any previous depth of history defined in the build project.",
  "encryptionKeyOverride": "The AWS Key Management Service (AWS KMS) customer master key (CMK) that overrides the one specified in the build project. The CMK key encrypts the build output artifacts.   You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key.   You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format alias/alias-name ).",
  "serviceRoleOverride": "The name of a service role for this build that overrides the one specified in the build project.",
  "cacheOverride": "A ProjectCache object specified for this build that overrides the one defined in the build project.",
  "registryCredentialOverride": " The credentials for access to a private registry. ",
  "logsConfigOverride": " Log settings for this build that override the log settings defined in the build project. ",
  "secondaryArtifactsOverride": " An array of ProjectArtifacts objects. ",
  "secondarySourcesOverride": " An array of ProjectSource objects. ",
  "artifactsOverride": "Build output artifact settings that override, for this build only, the latest ones already defined in the build project.",
  "queuedTimeoutInMinutesOverride": " The number of minutes a build is allowed to be queued before it times out. ",
  "sourceTypeOverride": "A source input type, for this build, that overrides the source input defined in the build project.",
  "idempotencyToken": "A unique, case sensitive identifier you provide to ensure the idempotency of the StartBuild request. The token is included in the StartBuild request and is valid for 12 hours. If you repeat the StartBuild request with the same token, but change a parameter, AWS CodeBuild returns a parameter mismatch error. ",
  "privilegedModeOverride": "Enable this flag to override privileged mode in the build project.",
  "certificateOverride": "The name of a certificate for this build that overrides the one specified in the build project.",
  "secondarySourcesVersionOverride": " An array of ProjectSourceVersion objects that specify one or more versions of the project's secondary sources to be used for this build only. ",
  "buildspecOverride": "A buildspec file declaration that overrides, for this build only, the latest one already defined in the build project.  If this value is set, it can be either an inline buildspec definition, the path to an alternate buildspec file relative to the value of the built-in CODEBUILD_SRC_DIR environment variable, or the path to an S3 bucket. The bucket must be in the same AWS Region as the build project. Specify the buildspec file using its ARN (for example, arn:aws:s3:::my-codebuild-sample2/buildspec.yml). If this value is not provided or is set to an empty string, the source code must contain a buildspec file in its root directory. For more information, see Buildspec File Name and Storage Location. ",
  "reportBuildStatusOverride": " Set to true to report to your source provider the status of a build's start and completion. If you use this option with a source provider other than GitHub, GitHub Enterprise, or Bitbucket, an invalidInputException is thrown.    The status of a build triggered by a webhook is always reported to your source provider.  ",
  "computeTypeOverride": "The name of a compute type for this build that overrides the one specified in the build project.",
  "environmentTypeOverride": "A container type for this build that overrides the one specified in the build project.",
  "gitSubmodulesConfigOverride": " Information about the Git submodules configuration for this build of an AWS CodeBuild build project. ",
  "timeoutInMinutesOverride": "The number of build timeout minutes, from 5 to 480 (8 hours), that overrides, for this build only, the latest setting already defined in the build project.",
  "environmentVariablesOverride": "A set of environment variables that overrides, for this build only, the latest ones already defined in the build project.",
  "sourceLocationOverride": "A location that overrides, for this build, the source location for the one defined in the build project.",
  "sourceAuthOverride": "An authorization type for this build that overrides the one defined in the build project. This override applies only if the build project's source is BitBucket or GitHub.",
  "insecureSslOverride": "Enable this flag to override the insecure SSL setting that is specified in the build project. The insecure SSL setting determines whether to ignore SSL warnings while connecting to the project source code. This override applies only if the build's source is GitHub Enterprise.",
  "imagePullCredentialsTypeOverride": " The type of credentials AWS CodeBuild uses to pull images in your build. There are two valid values:     CODEBUILD specifies that AWS CodeBuild uses its own credentials. This requires that you modify your ECR repository policy to trust AWS CodeBuild's service principal.    SERVICE_ROLE specifies that AWS CodeBuild uses your build project's service role.     When using a cross-account or private registry image, you must use SERVICE_ROLE credentials. When using an AWS CodeBuild curated image, you must use CODEBUILD credentials. ",
  "sourceVersion": "A version of the build input to be built, for this build only. If not specified, the latest version is used. If specified, must be one of:   For AWS CodeCommit: the commit ID, branch, or Git tag to use.   For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format pr/pull-request-ID (for example pr/25). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.   For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.    If sourceVersion is specified at the project level, then this sourceVersion (at the build level) takes precedence.   For more information, see Source Version Sample with CodeBuild in the AWS CodeBuild User Guide. "
}
"""
StartBuild(args) = codebuild("StartBuild", args)

"""
    ListProjects()

Gets a list of build project names, with each build project name representing a single build project.

Optional Parameters
{
  "sortBy": "The criterion to be used to list build project names. Valid values include:    CREATED_TIME: List based on when each build project was created.    LAST_MODIFIED_TIME: List based on when information about each build project was last changed.    NAME: List based on each build project's name.   Use sortOrder to specify in what order to list the build project names based on the preceding criteria.",
  "sortOrder": "The order in which to list build projects. Valid values include:    ASCENDING: List in ascending order.    DESCENDING: List in descending order.   Use sortBy to specify the criterion to be used to list build project names.",
  "nextToken": "During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a nextToken. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned."
}
"""
ListProjects() = codebuild("ListProjects")
ListProjects(args) = codebuild("ListProjects", args)

"""
    ListSharedProjects()

 Gets a list of projects that are shared with other AWS accounts or users. 

Optional Parameters
{
  "sortBy": " The criterion to be used to list build projects shared with the current AWS account or user. Valid values include:     ARN: List based on the ARN.     MODIFIED_TIME: List based on when information about the shared project was last changed.   ",
  "sortOrder": "The order in which to list shared build projects. Valid values include:    ASCENDING: List in ascending order.    DESCENDING: List in descending order.  ",
  "maxResults": " The maximum number of paginated shared build projects returned per response. Use nextToken to iterate pages in the list of returned Project objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
ListSharedProjects() = codebuild("ListSharedProjects")
ListSharedProjects(args) = codebuild("ListSharedProjects", args)

"""
    BatchGetProjects()

Gets information about one or more build projects.

Required Parameters
{
  "names": "The names or ARNs of the build projects. To get information about a project shared with your AWS account, its ARN must be specified. You cannot specify a shared project using its name."
}
"""
BatchGetProjects(args) = codebuild("BatchGetProjects", args)

"""
    CreateWebhook()

For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start rebuilding the source code every time a code change is pushed to the repository.  If you enable webhooks for an AWS CodeBuild project, and the project is used as a build step in AWS CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through AWS CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using AWS CodePipeline, we recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild console, clear the Webhook box. For more information, see step 5 in Change a Build Project's Settings. 

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild project."
}

Optional Parameters
{
  "branchFilter": "A regular expression used to determine which repository branches are built when a webhook is triggered. If the name of a branch matches the regular expression, then it is built. If branchFilter is empty, then all branches are built.   It is recommended that you use filterGroups instead of branchFilter.  ",
  "filterGroups": " An array of arrays of WebhookFilter objects used to determine which webhooks are triggered. At least one WebhookFilter in the array must specify EVENT as its type.   For a build to be triggered, at least one filter group in the filterGroups array must pass. For a filter group to pass, each of its filters must pass. "
}
"""
CreateWebhook(args) = codebuild("CreateWebhook", args)

"""
    DeleteWebhook()

For an existing AWS CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from rebuilding the source code every time a code change is pushed to the repository.

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild project."
}
"""
DeleteWebhook(args) = codebuild("DeleteWebhook", args)

"""
    UpdateWebhook()

 Updates the webhook associated with an AWS CodeBuild build project.    If you use Bitbucket for your repository, rotateSecret is ignored.  

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild project."
}

Optional Parameters
{
  "branchFilter": "A regular expression used to determine which repository branches are built when a webhook is triggered. If the name of a branch matches the regular expression, then it is built. If branchFilter is empty, then all branches are built.   It is recommended that you use filterGroups instead of branchFilter.  ",
  "rotateSecret": " A boolean value that specifies whether the associated GitHub repository's secret token should be updated. If you use Bitbucket for your repository, rotateSecret is ignored. ",
  "filterGroups": " An array of arrays of WebhookFilter objects used to determine if a webhook event can trigger a build. A filter group must contain at least one EVENT WebhookFilter. "
}
"""
UpdateWebhook(args) = codebuild("UpdateWebhook", args)

"""
    DeleteProject()

 Deletes a build project. When you delete a project, its builds are not deleted. 

Required Parameters
{
  "name": "The name of the build project."
}
"""
DeleteProject(args) = codebuild("DeleteProject", args)

"""
    DeleteSourceCredentials()

 Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials. 

Required Parameters
{
  "arn": " The Amazon Resource Name (ARN) of the token."
}
"""
DeleteSourceCredentials(args) = codebuild("DeleteSourceCredentials", args)

"""
    DeleteReportGroup()

 DeleteReportGroup: Deletes a report group. Before you delete a report group, you must delete its reports. Use ListReportsForReportGroup to get the reports in a report group. Use DeleteReport to delete the reports. If you call DeleteReportGroup for a report group that contains one or more reports, an exception is thrown. 

Required Parameters
{
  "arn": " The ARN of the report group to delete. "
}
"""
DeleteReportGroup(args) = codebuild("DeleteReportGroup", args)

"""
    UpdateReportGroup()

 Updates a report group. 

Required Parameters
{
  "arn": " The ARN of the report group to update. "
}

Optional Parameters
{
  "exportConfig": " Used to specify an updated export type. Valid values are:     S3: The report results are exported to an S3 bucket.     NO_EXPORT: The report results are not exported.   "
}
"""
UpdateReportGroup(args) = codebuild("UpdateReportGroup", args)

"""
    ListBuildsForProject()

Gets a list of build IDs for the specified build project, with each build ID representing a single build.

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild project."
}

Optional Parameters
{
  "sortOrder": "The order to list build IDs. Valid values include:    ASCENDING: List the build IDs in ascending order by build ID.    DESCENDING: List the build IDs in descending order by build ID.  ",
  "nextToken": "During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a nextToken. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned."
}
"""
ListBuildsForProject(args) = codebuild("ListBuildsForProject", args)

"""
    InvalidateProjectCache()

Resets the cache for a project.

Required Parameters
{
  "projectName": "The name of the AWS CodeBuild build project that the cache is reset for."
}
"""
InvalidateProjectCache(args) = codebuild("InvalidateProjectCache", args)

"""
    StopBuild()

Attempts to stop running a build.

Required Parameters
{
  "id": "The ID of the build."
}
"""
StopBuild(args) = codebuild("StopBuild", args)

"""
    ListReportsForReportGroup()

 Returns a list of ARNs for the reports that belong to a ReportGroup. 

Required Parameters
{
  "reportGroupArn": " The ARN of the report group for which you want to return report ARNs. "
}

Optional Parameters
{
  "filter": " A ReportFilter object used to filter the returned reports. ",
  "sortOrder": " Use to specify whether the results are returned in ascending or descending order. ",
  "maxResults": " The maximum number of paginated reports in this report group returned per response. Use nextToken to iterate pages in the list of returned Report objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
ListReportsForReportGroup(args) = codebuild("ListReportsForReportGroup", args)

"""
    CreateReportGroup()

 Creates a report group. A report group contains a collection of reports. 

Required Parameters
{
  "name": " The name of the report group. ",
  "exportConfig": " A ReportExportConfig object that contains information about where the report group test results are exported. ",
  "type": " The type of report group. "
}
"""
CreateReportGroup(args) = codebuild("CreateReportGroup", args)

"""
    BatchGetReports()

 Returns an array of reports. 

Required Parameters
{
  "reportArns": " An array of ARNs that identify the Report objects to return. "
}
"""
BatchGetReports(args) = codebuild("BatchGetReports", args)

"""
    ImportSourceCredentials()

 Imports the source repository credentials for an AWS CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository. 

Required Parameters
{
  "token": " For GitHub or GitHub Enterprise, this is the personal access token. For Bitbucket, this is the app password. ",
  "serverType": " The source provider used for this project. ",
  "authType": " The type of authentication used to connect to a GitHub, GitHub Enterprise, or Bitbucket repository. An OAUTH connection is not supported by the API and must be created using the AWS CodeBuild console. "
}

Optional Parameters
{
  "username": " The Bitbucket username when the authType is BASIC_AUTH. This parameter is not valid for other types of source providers or connections. ",
  "shouldOverwrite": " Set to false to prevent overwriting the repository source credentials. Set to true to overwrite the repository source credentials. The default value is true. "
}
"""
ImportSourceCredentials(args) = codebuild("ImportSourceCredentials", args)

"""
    BatchDeleteBuilds()

Deletes one or more builds.

Required Parameters
{
  "ids": "The IDs of the builds to delete."
}
"""
BatchDeleteBuilds(args) = codebuild("BatchDeleteBuilds", args)

"""
    DescribeTestCases()

 Returns a list of details about test cases for a report. 

Required Parameters
{
  "reportArn": " The ARN of the report for which test cases are returned. "
}

Optional Parameters
{
  "filter": " A TestCaseFilter object used to filter the returned reports. ",
  "maxResults": " The maximum number of paginated test cases returned per response. Use nextToken to iterate pages in the list of returned TestCase objects. The default value is 100. ",
  "nextToken": " During a previous call, the maximum number of items that can be returned is the value specified in maxResults. If there more items in the list, then a unique string called a nextToken is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. "
}
"""
DescribeTestCases(args) = codebuild("DescribeTestCases", args)

"""
    ListSourceCredentials()

 Returns a list of SourceCredentialsInfo objects. 
"""
ListSourceCredentials() = codebuild("ListSourceCredentials")
ListSourceCredentials(args) = codebuild("ListSourceCredentials", args)
