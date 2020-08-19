# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: s3_control

using Compat
using UUIDs
"""
    CreateAccessPoint()

Creates an access point and associates it with the specified bucket.

# Required Parameters
- `Bucket`: The name of the bucket that you want to associate this access point with.
- `name`: The name you want to assign to this access point.
- `x-amz-account-id`: The AWS account ID for the owner of the bucket for which you want to create an access point.

# Optional Parameters
- `PublicAccessBlockConfiguration`: 
- `VpcConfiguration`: If you include this field, Amazon S3 restricts access to this access point to requests from the specified virtual private cloud (VPC).
"""

CreateAccessPoint(Bucket, name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/accesspoint/$(name)", Dict{String, Any}("Bucket"=>Bucket, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
CreateAccessPoint(Bucket, name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/accesspoint/$(name)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Bucket"=>Bucket, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    CreateJob()

You can use Amazon S3 Batch Operations to perform large-scale Batch Operations on Amazon S3 objects. Amazon S3 Batch Operations can execute a single operation or action on lists of Amazon S3 objects that you specify. For more information, see Amazon S3 Batch Operations in the Amazon Simple Storage Service Developer Guide. Related actions include:    DescribeJob     ListJobs     UpdateJobPriority     UpdateJobStatus   

# Required Parameters
- `ClientRequestToken`: An idempotency token to ensure that you don't accidentally submit the same request twice. You can use any string up to the maximum length.
- `Manifest`: Configuration parameters for the manifest.
- `Operation`: The operation that you want this job to perform on each object listed in the manifest. For more information about the available operations, see Available Operations in the Amazon Simple Storage Service Developer Guide.
- `Priority`: The numerical priority for this job. Higher numbers indicate higher priority.
- `Report`: Configuration parameters for the optional job-completion report.
- `RoleArn`: The Amazon Resource Name (ARN) for the AWS Identity and Access Management (IAM) role that Batch Operations will use to execute this job's operation on each object in the manifest.
- `x-amz-account-id`: 

# Optional Parameters
- `ConfirmationRequired`: Indicates whether confirmation is required before Amazon S3 runs the job. Confirmation is only required for jobs created through the Amazon S3 console.
- `Description`: A description for this job. You can use any string within the permitted length. Descriptions don't need to be unique and can be used for multiple jobs.
- `Tags`: A set of tags to associate with the Amazon S3 Batch Operations job. This is an optional parameter. 
"""

CreateJob(ClientRequestToken, Manifest, Operation, Priority, Report, RoleArn, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs", Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "Manifest"=>Manifest, "Operation"=>Operation, "Priority"=>Priority, "Report"=>Report, "RoleArn"=>RoleArn, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
CreateJob(ClientRequestToken, Manifest, Operation, Priority, Report, RoleArn, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientRequestToken"=>ClientRequestToken, "Manifest"=>Manifest, "Operation"=>Operation, "Priority"=>Priority, "Report"=>Report, "RoleArn"=>RoleArn, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    DeleteAccessPoint()

Deletes the specified access point.

# Required Parameters
- `name`: The name of the access point you want to delete.
- `x-amz-account-id`: The account ID for the account that owns the specified access point.

"""

DeleteAccessPoint(name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/accesspoint/$(name)", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
DeleteAccessPoint(name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/accesspoint/$(name)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    DeleteAccessPointPolicy()

Deletes the access point policy for the specified access point.

# Required Parameters
- `name`: The name of the access point whose policy you want to delete.
- `x-amz-account-id`: The account ID for the account that owns the specified access point.

"""

DeleteAccessPointPolicy(name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
DeleteAccessPointPolicy(name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    DeleteJobTagging()

Removes the entire tag set from the specified Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the s3:DeleteJobTagging action. For more information, see Using Job Tags in the Amazon Simple Storage Service Developer Guide.  Related actions include:    CreateJob     GetJobTagging     PutJobTagging   

# Required Parameters
- `id`: The ID for the Amazon S3 Batch Operations job whose tags you want to delete.
- `x-amz-account-id`: The AWS account ID associated with the Amazon S3 Batch Operations job.

"""

DeleteJobTagging(id, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
DeleteJobTagging(id, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    DeletePublicAccessBlock()

Removes the PublicAccessBlock configuration for an Amazon Web Services account.

# Required Parameters
- `x-amz-account-id`: The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to remove.

"""

DeletePublicAccessBlock(x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
DeletePublicAccessBlock(x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("DELETE", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    DescribeJob()

Retrieves the configuration parameters and status for a Batch Operations job. For more information, see Amazon S3 Batch Operations in the Amazon Simple Storage Service Developer Guide.  Related actions include:    CreateJob     ListJobs     UpdateJobPriority     UpdateJobStatus   

# Required Parameters
- `id`: The ID for the job whose information you want to retrieve.
- `x-amz-account-id`: 

"""

DescribeJob(id, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs/$(id)", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
DescribeJob(id, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs/$(id)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    GetAccessPoint()

Returns configuration information about the specified access point.

# Required Parameters
- `name`: The name of the access point whose configuration information you want to retrieve.
- `x-amz-account-id`: The account ID for the account that owns the specified access point.

"""

GetAccessPoint(name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
GetAccessPoint(name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    GetAccessPointPolicy()

Returns the access point policy associated with the specified access point.

# Required Parameters
- `name`: The name of the access point whose policy you want to retrieve.
- `x-amz-account-id`: The account ID for the account that owns the specified access point.

"""

GetAccessPointPolicy(name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
GetAccessPointPolicy(name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    GetAccessPointPolicyStatus()

Indicates whether the specified access point currently has a policy that allows public access. For more information about public access through access points, see Managing Data Access with Amazon S3 Access Points in the Amazon Simple Storage Service Developer Guide.

# Required Parameters
- `name`: The name of the access point whose policy status you want to retrieve.
- `x-amz-account-id`: The account ID for the account that owns the specified access point.

"""

GetAccessPointPolicyStatus(name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)/policyStatus", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
GetAccessPointPolicyStatus(name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint/$(name)/policyStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    GetJobTagging()

Returns the tags on an Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the s3:GetJobTagging action. For more information, see Using Job Tags in the Amazon Simple Storage Service Developer Guide.  Related actions include:    CreateJob     PutJobTagging     DeleteJobTagging   

# Required Parameters
- `id`: The ID for the Amazon S3 Batch Operations job whose tags you want to retrieve.
- `x-amz-account-id`: The AWS account ID associated with the Amazon S3 Batch Operations job.

"""

GetJobTagging(id, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
GetJobTagging(id, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    GetPublicAccessBlock()

Retrieves the PublicAccessBlock configuration for an Amazon Web Services account.

# Required Parameters
- `x-amz-account-id`: The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to retrieve.

"""

GetPublicAccessBlock(x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
GetPublicAccessBlock(x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    ListAccessPoints()

Returns a list of the access points currently associated with the specified bucket. You can retrieve up to 1000 access points per call. If the specified bucket has more than 1,000 access points (or the number specified in maxResults, whichever is less), the response will include a continuation token that you can use to list the additional access points.

# Required Parameters
- `x-amz-account-id`: The AWS account ID for owner of the bucket whose access points you want to list.

# Optional Parameters
- `bucket`: The name of the bucket whose associated access points you want to list.
- `maxResults`: The maximum number of access points that you want to include in the list. If the specified bucket has more than this number of access points, then the response will include a continuation token in the NextToken field that you can use to retrieve the next page of access points.
- `nextToken`: A continuation token. If a previous call to ListAccessPoints returned a continuation token in the NextToken field, then providing that value here causes Amazon S3 to retrieve the next page of results.
"""

ListAccessPoints(x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
ListAccessPoints(x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/accesspoint", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    ListJobs()

Lists current Amazon S3 Batch Operations jobs and jobs that have ended within the last 30 days for the AWS account making the request. For more information, see Amazon S3 Batch Operations in the Amazon Simple Storage Service Developer Guide. Related actions include:     CreateJob     DescribeJob     UpdateJobPriority     UpdateJobStatus   

# Required Parameters
- `x-amz-account-id`: 

# Optional Parameters
- `jobStatuses`: The List Jobs request returns jobs that match the statuses listed in this element.
- `maxResults`: The maximum number of jobs that Amazon S3 will include in the List Jobs response. If there are more jobs than this number, the response will include a pagination token in the NextToken field to enable you to retrieve the next page of results.
- `nextToken`: A pagination token to request the next page of results. Use the token that Amazon S3 returned in the NextToken element of the ListJobsResult from the previous List Jobs request.
"""

ListJobs(x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
ListJobs(x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("GET", "/v20180820/jobs", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    PutAccessPointPolicy()

Associates an access policy with the specified access point. Each access point can have only one policy, so a request made to this API replaces any existing policy associated with the specified access point.

# Required Parameters
- `Policy`: The policy that you want to apply to the specified access point. For more information about access point policies, see Managing Data Access with Amazon S3 Access Points in the Amazon Simple Storage Service Developer Guide.
- `name`: The name of the access point that you want to associate with the specified policy.
- `x-amz-account-id`: The AWS account ID for owner of the bucket associated with the specified access point.

"""

PutAccessPointPolicy(Policy, name, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}("Policy"=>Policy, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
PutAccessPointPolicy(Policy, name, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/accesspoint/$(name)/policy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Policy"=>Policy, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    PutJobTagging()

Set the supplied tag-set on an Amazon S3 Batch Operations job. A tag is a key-value pair. You can associate Amazon S3 Batch Operations tags with any job by sending a PUT request against the tagging subresource that is associated with the job. To modify the existing tag set, you can either replace the existing tag set entirely, or make changes within the existing tag set by retrieving the existing tag set using GetJobTagging, modify that tag set, and use this API action to replace the tag set with the one you have modified.. For more information, see Using Job Tags in the Amazon Simple Storage Service Developer Guide.      If you send this request with an empty tag set, Amazon S3 deletes the existing tag set on the Batch Operations job. If you use this method, you will be charged for a Tier 1 Request (PUT). For more information, see Amazon S3 pricing.   For deleting existing tags for your batch operations job, DeleteJobTagging request is preferred because it achieves the same result without incurring charges.   A few things to consider about using tags:   Amazon S3 limits the maximum number of tags to 50 tags per job.   You can associate up to 50 tags with a job as long as they have unique tag keys.   A tag key can be up to 128 Unicode characters in length, and tag values can be up to 256 Unicode characters in length.   The key and values are case sensitive.   For tagging-related restrictions related to characters and encodings, see User-Defined Tag Restrictions.       To use this operation, you must have permission to perform the s3:PutJobTagging action. Related actions include:    CreateJob     GetJobTagging     DeleteJobTagging   

# Required Parameters
- `Tags`: The set of tags to associate with the Amazon S3 Batch Operations job.
- `id`: The ID for the Amazon S3 Batch Operations job whose tags you want to replace.
- `x-amz-account-id`: The AWS account ID associated with the Amazon S3 Batch Operations job.

"""

PutJobTagging(Tags, id, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}("Tags"=>Tags, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
PutJobTagging(Tags, id, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/jobs/$(id)/tagging", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    PutPublicAccessBlock()

Creates or modifies the PublicAccessBlock configuration for an Amazon Web Services account.

# Required Parameters
- `PublicAccessBlockConfiguration`: The PublicAccessBlock configuration that you want to apply to the specified Amazon Web Services account.
- `x-amz-account-id`: The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to set.

"""

PutPublicAccessBlock(PublicAccessBlockConfiguration, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}("PublicAccessBlockConfiguration"=>PublicAccessBlockConfiguration, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
PutPublicAccessBlock(PublicAccessBlockConfiguration, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("PUT", "/v20180820/configuration/publicAccessBlock", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PublicAccessBlockConfiguration"=>PublicAccessBlockConfiguration, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    UpdateJobPriority()

Updates an existing Amazon S3 Batch Operations job's priority. For more information, see Amazon S3 Batch Operations in the Amazon Simple Storage Service Developer Guide.  Related actions include:    CreateJob     ListJobs     DescribeJob     UpdateJobStatus   

# Required Parameters
- `id`: The ID for the job whose priority you want to update.
- `priority`: The priority you want to assign to this job.
- `x-amz-account-id`: 

"""

UpdateJobPriority(id, priority, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs/$(id)/priority", Dict{String, Any}("priority"=>priority, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
UpdateJobPriority(id, priority, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs/$(id)/priority", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("priority"=>priority, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)

"""
    UpdateJobStatus()

Updates the status for the specified job. Use this operation to confirm that you want to run a job or to cancel an existing job. For more information, see Amazon S3 Batch Operations in the Amazon Simple Storage Service Developer Guide.  Related actions include:    CreateJob     ListJobs     DescribeJob     UpdateJobStatus   

# Required Parameters
- `id`: The ID of the job whose status you want to update.
- `requestedJobStatus`: The status that you want to move the specified job to.
- `x-amz-account-id`: 

# Optional Parameters
- `statusUpdateReason`: A description of the reason why you want to change the specified job's status. This field can be any string up to the maximum length.
"""

UpdateJobStatus(id, requestedJobStatus, x_amz_account_id; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs/$(id)/status", Dict{String, Any}("requestedJobStatus"=>requestedJobStatus, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)); aws_config=aws_config)
UpdateJobStatus(id, requestedJobStatus, x_amz_account_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = s3_control("POST", "/v20180820/jobs/$(id)/status", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("requestedJobStatus"=>requestedJobStatus, "headers"=>Dict{String, Any}("x-amz-account-id"=>x_amz_account_id)), args)); aws_config=aws_config)
