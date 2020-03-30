include("../AWSServices.jl")
using .AWSServices: dataexchange

"""
    ListTagsForResource()

This operation lists the tags on the resource.

Required Parameters
{
  "ResourceArn": "An Amazon Resource Name (ARN) that uniquely identifies an AWS resource."
}
"""
ListTagsForResource(args) = dataexchange("GET", "/tags/{resource-arn}", args)

"""
    GetDataSet()

This operation returns information about a data set.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set."
}
"""
GetDataSet(args) = dataexchange("GET", "/v1/data-sets/{DataSetId}", args)

"""
    CreateRevision()

This operation creates a revision for a data set.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set."
}

Optional Parameters
{
  "Comment": "An optional comment about the revision.",
  "Tags": "A revision tag is an optional label that you can assign to a revision when you create it. Each tag consists of a key and an optional value, both of which you define. When you use tagging, you can also use tag-based access control in IAM policies to control access to these data sets and revisions."
}
"""
CreateRevision(args) = dataexchange("POST", "/v1/data-sets/{DataSetId}/revisions", args)

"""
    GetRevision()

This operation returns information about a revision.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision."
}
"""
GetRevision(args) = dataexchange("GET", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}", args)

"""
    ListDataSetRevisions()

This operation lists a data set's revisions sorted by CreatedAt in descending order.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results returned by a single call.",
  "NextToken": "The token value retrieved from a previous call to access the next page of results."
}
"""
ListDataSetRevisions(args) = dataexchange("GET", "/v1/data-sets/{DataSetId}/revisions", args)

"""
    GetAsset()

This operation returns information about an asset.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision.",
  "AssetId": "The unique identifier for an asset."
}
"""
GetAsset(args) = dataexchange("GET", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}", args)

"""
    DeleteAsset()

This operation deletes an asset.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision.",
  "AssetId": "The unique identifier for an asset."
}
"""
DeleteAsset(args) = dataexchange("DELETE", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}", args)

"""
    StartJob()

This operation starts a job.

Required Parameters
{
  "JobId": "The unique identifier for a job."
}
"""
StartJob(args) = dataexchange("PATCH", "/v1/jobs/{JobId}", args)

"""
    CancelJob()

This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.

Required Parameters
{
  "JobId": "The unique identifier for a job."
}
"""
CancelJob(args) = dataexchange("DELETE", "/v1/jobs/{JobId}", args)

"""
    CreateJob()

This operation creates a job.

Required Parameters
{
  "Type": "The type of job to be created.",
  "Details": "The details for the CreateJob request."
}
"""
CreateJob(args) = dataexchange("POST", "/v1/jobs", args)

"""
    TagResource()

This operation tags a resource.

Required Parameters
{
  "ResourceArn": "An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.",
  "Tags": "A label that consists of a customer-defined key and an optional value."
}
"""
TagResource(args) = dataexchange("POST", "/tags/{resource-arn}", args)

"""
    CreateDataSet()

This operation creates a data set.

Required Parameters
{
  "Description": "A description for the data set. This value can be up to 16,348 characters long.",
  "AssetType": "The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.",
  "Name": "The name of the data set."
}

Optional Parameters
{
  "Tags": "A data set tag is an optional label that you can assign to a data set when you create it. Each tag consists of a key and an optional value, both of which you define. When you use tagging, you can also use tag-based access control in IAM policies to control access to these data sets and revisions."
}
"""
CreateDataSet(args) = dataexchange("POST", "/v1/data-sets", args)

"""
    UntagResource()

This operation removes one or more tags from a resource.

Required Parameters
{
  "ResourceArn": "An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.",
  "TagKeys": "The key tags."
}
"""
UntagResource(args) = dataexchange("DELETE", "/tags/{resource-arn}", args)

"""
    GetJob()

This operation returns information about a job.

Required Parameters
{
  "JobId": "The unique identifier for a job."
}
"""
GetJob(args) = dataexchange("GET", "/v1/jobs/{JobId}", args)

"""
    DeleteDataSet()

This operation deletes a data set.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set."
}
"""
DeleteDataSet(args) = dataexchange("DELETE", "/v1/data-sets/{DataSetId}", args)

"""
    ListRevisionAssets()

This operation lists a revision's assets sorted alphabetically in descending order.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results returned by a single call.",
  "NextToken": "The token value retrieved from a previous call to access the next page of results."
}
"""
ListRevisionAssets(args) = dataexchange("GET", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets", args)

"""
    DeleteRevision()

This operation deletes a revision.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision."
}
"""
DeleteRevision(args) = dataexchange("DELETE", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}", args)

"""
    UpdateRevision()

This operation updates a revision.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision."
}

Optional Parameters
{
  "Comment": "An optional comment about the revision.",
  "Finalized": "Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products."
}
"""
UpdateRevision(args) = dataexchange("PATCH", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}", args)

"""
    ListDataSets()

This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.

Optional Parameters
{
  "MaxResults": "The maximum number of results returned by a single call.",
  "NextToken": "The token value retrieved from a previous call to access the next page of results.",
  "Origin": "A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers)."
}
"""
ListDataSets() = dataexchange("GET", "/v1/data-sets")
ListDataSets(args) = dataexchange("GET", "/v1/data-sets", args)

"""
    ListJobs()

This operation lists your jobs sorted by CreatedAt in descending order.

Optional Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "MaxResults": "The maximum number of results returned by a single call.",
  "NextToken": "The token value retrieved from a previous call to access the next page of results.",
  "RevisionId": "The unique identifier for a revision."
}
"""
ListJobs() = dataexchange("GET", "/v1/jobs")
ListJobs(args) = dataexchange("GET", "/v1/jobs", args)

"""
    UpdateAsset()

This operation updates an asset.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set.",
  "RevisionId": "The unique identifier for a revision.",
  "AssetId": "The unique identifier for an asset.",
  "Name": "The name of the asset. When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key."
}
"""
UpdateAsset(args) = dataexchange("PATCH", "/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}", args)

"""
    UpdateDataSet()

This operation updates a data set.

Required Parameters
{
  "DataSetId": "The unique identifier for a data set."
}

Optional Parameters
{
  "Description": "The description for the data set.",
  "Name": "The name of the data set."
}
"""
UpdateDataSet(args) = dataexchange("PATCH", "/v1/data-sets/{DataSetId}", args)
