# This file is auto-generated by AWSMetadata.jl
include("../AWSServices.jl")
using .AWSServices: kendra

"""
    BatchDeleteDocument()

Removes one or more documents from an index. The documents must have been added with the BatchPutDocument operation. The documents are deleted asynchronously. You can see the progress of the deletion by using AWS CloudWatch. Any error messages releated to the processing of the batch are sent to you CloudWatch log.

Required Parameters
{
  "DocumentIdList": "One or more identifiers for documents to delete from the index.",
  "IndexId": "The identifier of the index that contains the documents to delete."
}

Optional Parameters
{
  "DataSourceSyncJobMetricTarget": ""
}
"""
BatchDeleteDocument(args) = kendra("BatchDeleteDocument", args)

"""
    BatchPutDocument()

Adds one or more documents to an index. The BatchPutDocument operation enables you to ingest inline documents or a set of documents stored in an Amazon S3 bucket. Use this operation to ingest your text and unstructured text into an index, add custom attributes to the documents, and to attach an access control list to the documents added to the index. The documents are indexed asynchronously. You can see the progress of the batch using AWS CloudWatch. Any error messages related to processing the batch are sent to your AWS CloudWatch log.

Required Parameters
{
  "Documents": "One or more documents to add to the index.  Documents have the following file size limits.   5 MB total size for inline documents   50 MB total size for files from an S3 bucket   5 MB extracted text for any file   For more information about file size and transaction per second quotas, see Quotas.",
  "IndexId": "The identifier of the index to add the documents to. You need to create the index first using the CreateIndex operation."
}

Optional Parameters
{
  "RoleArn": "The Amazon Resource Name (ARN) of a role that is allowed to run the BatchPutDocument operation. For more information, see IAM Roles for Amazon Kendra."
}
"""
BatchPutDocument(args) = kendra("BatchPutDocument", args)

"""
    CreateDataSource()

Creates a data source that you use to with an Amazon Kendra index.  You specify a name, connector type and description for your data source. You can choose between an S3 connector, a SharePoint Online connector, and a database connector. You also specify configuration information such as document metadata (author, source URI, and so on) and user context information.  CreateDataSource is a synchronous operation. The operation returns 200 if the data source was successfully created. Otherwise, an exception is raised.

Required Parameters
{
  "Configuration": "The connector configuration information that is required to access the repository.",
  "IndexId": "The identifier of the index that should be associated with this data source.",
  "Name": "A unique name for the data source. A data source name can't be changed without deleting and recreating the data source.",
  "RoleArn": "The Amazon Resource Name (ARN) of a role with permission to access the data source. For more information, see IAM Roles for Amazon Kendra.",
  "Type": "The type of repository that contains the data source."
}

Optional Parameters
{
  "Description": "A description for the data source.",
  "Schedule": "Sets the frequency that Amazon Kendra will check the documents in your repository and update the index. If you don't set a schedule Amazon Kendra will not periodically update the index. You can call the StartDataSourceSyncJob operation to update the index.",
  "Tags": "A list of key-value pairs that identify the data source. You can use the tags to identify and organize your resources and to control access to resources."
}
"""
CreateDataSource(args) = kendra("CreateDataSource", args)

"""
    CreateFaq()

Creates an new set of frequently asked question (FAQ) questions and answers.

Required Parameters
{
  "IndexId": "The identifier of the index that contains the FAQ.",
  "Name": "The name that should be associated with the FAQ.",
  "RoleArn": "The Amazon Resource Name (ARN) of a role with permission to access the S3 bucket that contains the FAQs. For more information, see IAM Roles for Amazon Kendra.",
  "S3Path": "The S3 location of the FAQ input data."
}

Optional Parameters
{
  "Description": "A description of the FAQ.",
  "Tags": "A list of key-value pairs that identify the FAQ. You can use the tags to identify and organize your resources and to control access to resources."
}
"""
CreateFaq(args) = kendra("CreateFaq", args)

"""
    CreateIndex()

Creates a new Amazon Kendra index. Index creation is an asynchronous operation. To determine if index creation has completed, check the Status field returned from a call to . The Status field is set to ACTIVE when the index is ready to use. Once the index is active you can index your documents using the operation or using one of the supported data sources. 

Required Parameters
{
  "Name": "The name for the new index.",
  "RoleArn": "An IAM role that gives Amazon Kendra permissions to access your Amazon CloudWatch logs and metrics. This is also the role used when you use the BatchPutDocument operation to index documents from an Amazon S3 bucket."
}

Optional Parameters
{
  "ClientToken": "A token that you provide to identify the request to create an index. Multiple calls to the CreateIndex operation with the same client token will create only one index.”",
  "Description": "A description for the index.",
  "Edition": "The Amazon Kendra edition to use for the index. Choose DEVELOPER_EDITION for indexes intended for development, testing, or proof of concept. Use ENTERPRISE_EDITION for your production databases. Once you set the edition for an index, it can't be changed. ",
  "ServerSideEncryptionConfiguration": "The identifier of the AWS KMS customer managed key (CMK) to use to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric CMKs.",
  "Tags": "A list of key-value pairs that identify the index. You can use the tags to identify and organize your resources and to control access to resources."
}
"""
CreateIndex(args) = kendra("CreateIndex", args)

"""
    DeleteDataSource()

Deletes an Amazon Kendra data source. An exception is not thrown if the data source is already being deleted. While the data source is being deleted, the Status field returned by a call to the operation is set to DELETING. For more information, see Deleting Data Sources.

Required Parameters
{
  "Id": "The unique identifier of the data source to delete.",
  "IndexId": "The unique identifier of the index associated with the data source."
}
"""
DeleteDataSource(args) = kendra("DeleteDataSource", args)

"""
    DeleteFaq()

Removes an FAQ from an index.

Required Parameters
{
  "Id": "The identifier of the FAQ to remove.",
  "IndexId": "The index to remove the FAQ from."
}
"""
DeleteFaq(args) = kendra("DeleteFaq", args)

"""
    DeleteIndex()

Deletes an existing Amazon Kendra index. An exception is not thrown if the index is already being deleted. While the index is being deleted, the Status field returned by a call to the DescribeIndex operation is set to DELETING.

Required Parameters
{
  "Id": "The identifier of the index to delete."
}
"""
DeleteIndex(args) = kendra("DeleteIndex", args)

"""
    DescribeDataSource()

Gets information about a Amazon Kendra data source.

Required Parameters
{
  "Id": "The unique identifier of the data source to describe.",
  "IndexId": "The identifier of the index that contains the data source."
}
"""
DescribeDataSource(args) = kendra("DescribeDataSource", args)

"""
    DescribeFaq()

Gets information about an FAQ list.

Required Parameters
{
  "Id": "The unique identifier of the FAQ.",
  "IndexId": "The identifier of the index that contains the FAQ."
}
"""
DescribeFaq(args) = kendra("DescribeFaq", args)

"""
    DescribeIndex()

Describes an existing Amazon Kendra index

Required Parameters
{
  "Id": "The name of the index to describe."
}
"""
DescribeIndex(args) = kendra("DescribeIndex", args)

"""
    ListDataSourceSyncJobs()

Gets statistics about synchronizing Amazon Kendra with a data source.

Required Parameters
{
  "Id": "The identifier of the data source.",
  "IndexId": "The identifier of the index that contains the data source."
}

Optional Parameters
{
  "MaxResults": "The maximum number of synchronization jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.",
  "NextToken": "If the result of the previous request to GetDataSourceSyncJobHistory was truncated, include the NextToken to fetch the next set of jobs.",
  "StartTimeFilter": "When specified, the synchronization jobs returned in the list are limited to jobs between the specified dates. ",
  "StatusFilter": "When specified, only returns synchronization jobs with the Status field equal to the specified status."
}
"""
ListDataSourceSyncJobs(args) = kendra("ListDataSourceSyncJobs", args)

"""
    ListDataSources()

Lists the data sources that you have created.

Required Parameters
{
  "IndexId": "The identifier of the index that contains the data source."
}

Optional Parameters
{
  "MaxResults": "The maximum number of data sources to return.",
  "NextToken": "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of data sources (DataSourceSummaryItems). "
}
"""
ListDataSources(args) = kendra("ListDataSources", args)

"""
    ListFaqs()

Gets a list of FAQ lists associated with an index.

Required Parameters
{
  "IndexId": "The index that contains the FAQ lists."
}

Optional Parameters
{
  "MaxResults": "The maximum number of FAQs to return in the response. If there are fewer results in the list, this response contains only the actual results.",
  "NextToken": "If the result of the previous request to ListFaqs was truncated, include the NextToken to fetch the next set of FAQs."
}
"""
ListFaqs(args) = kendra("ListFaqs", args)

"""
    ListIndices()

Lists the Amazon Kendra indexes that you have created.

Optional Parameters
{
  "MaxResults": "The maximum number of data sources to return.",
  "NextToken": "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of indexes (DataSourceSummaryItems). "
}
"""
ListIndices() = kendra("ListIndices")
ListIndices(args) = kendra("ListIndices", args)

"""
    ListTagsForResource()

Gets a list of tags associated with a specified resource. Indexes, FAQs, and data sources can have tags associated with them.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the index, FAQ, or data source to get a list of tags for."
}
"""
ListTagsForResource(args) = kendra("ListTagsForResource", args)

"""
    Query()

Searches an active index. Use this API to search your documents using query. The Query operation enables to do faceted search and to filter results based on document attributes. It also enables you to provide user context that Amazon Kendra uses to enforce document access control in the search results.  Amazon Kendra searches your index for text content and question and answer (FAQ) content. By default the response contains three types of results.   Relevant passages   Matching FAQs   Relevant documents   You can specify that the query return only one type of result using the QueryResultTypeConfig parameter.

Required Parameters
{
  "IndexId": "The unique identifier of the index to search. The identifier is returned in the response from the operation.",
  "QueryText": "The text to search for."
}

Optional Parameters
{
  "AttributeFilter": "Enables filtered searches based on document attributes. You can only provide one attribute filter; however, the AndAllFilters, NotFilter, and OrAllFilters parameters contain a list of other filters. The AttributeFilter parameter enables you to create a set of filtering rules that a document must satisfy to be included in the query results.",
  "Facets": "An array of documents attributes. Amazon Kendra returns a count for each attribute key specified. You can use this information to help narrow the search for your user.",
  "PageNumber": "Query results are returned in pages the size of the PageSize parameter. By default, Amazon Kendra returns the first page of results. Use this parameter to get result pages after the first one.",
  "PageSize": "Sets the number of results that are returned in each page of results. The default page size is 10. The maximum number of results returned is 100. If you ask for more than 100 results, only 100 are returned.",
  "QueryResultTypeFilter": "Sets the type of query. Only results for the specified query type are returned.",
  "RequestedDocumentAttributes": "An array of document attributes to include in the response. No other document attributes are included in the response. By default all document attributes are included in the response. "
}
"""
Query(args) = kendra("Query", args)

"""
    StartDataSourceSyncJob()

Starts a synchronization job for a data source. If a synchronization job is already in progress, Amazon Kendra returns a ResourceInUseException exception.

Required Parameters
{
  "Id": "The identifier of the data source to synchronize.",
  "IndexId": "The identifier of the index that contains the data source."
}
"""
StartDataSourceSyncJob(args) = kendra("StartDataSourceSyncJob", args)

"""
    StopDataSourceSyncJob()

Stops a running synchronization job. You can't stop a scheduled synchronization job.

Required Parameters
{
  "Id": "The identifier of the data source for which to stop the synchronization jobs.",
  "IndexId": "The identifier of the index that contains the data source."
}
"""
StopDataSourceSyncJob(args) = kendra("StopDataSourceSyncJob", args)

"""
    SubmitFeedback()

Enables you to provide feedback to Amazon Kendra to improve the performance of the service. 

Required Parameters
{
  "IndexId": "The identifier of the index that was queried.",
  "QueryId": "The identifier of the specific query for which you are submitting feedback. The query ID is returned in the response to the operation."
}

Optional Parameters
{
  "ClickFeedbackItems": "Tells Amazon Kendra that a particular search result link was chosen by the user. ",
  "RelevanceFeedbackItems": "Provides Amazon Kendra with relevant or not relevant feedback for whether a particular item was relevant to the search."
}
"""
SubmitFeedback(args) = kendra("SubmitFeedback", args)

"""
    TagResource()

Adds the specified tag to the specified index, FAQ, or data source resource. If the tag already exists, the existing value is replaced with the new value.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the index, FAQ, or data source to tag.",
  "Tags": "A list of tag keys to add to the index, FAQ, or data source. If a tag already exists, the existing value is replaced with the new value."
}
"""
TagResource(args) = kendra("TagResource", args)

"""
    UntagResource()

Removes a tag from an index, FAQ, or a data source.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the index, FAQ, or data source to remove the tag from.",
  "TagKeys": "A list of tag keys to remove from the index, FAQ, or data source. If a tag key does not exist on the resource, it is ignored."
}
"""
UntagResource(args) = kendra("UntagResource", args)

"""
    UpdateDataSource()

Updates an existing Amazon Kendra data source.

Required Parameters
{
  "Id": "The unique identifier of the data source to update.",
  "IndexId": "The identifier of the index that contains the data source to update."
}

Optional Parameters
{
  "Configuration": "",
  "Description": "The new description for the data source.",
  "Name": "The name of the data source to update. The name of the data source can't be updated. To rename a data source you must delete the data source and re-create it.",
  "RoleArn": "The Amazon Resource Name (ARN) of the new role to use when the data source is accessing resources on your behalf.",
  "Schedule": "The new update schedule for the data source."
}
"""
UpdateDataSource(args) = kendra("UpdateDataSource", args)

"""
    UpdateIndex()

Updates an existing Amazon Kendra index.

Required Parameters
{
  "Id": "The identifier of the index to update."
}

Optional Parameters
{
  "CapacityUnits": "Sets the number of addtional storage and query capacity units that should be used by the index. You can change the capacity of the index up to 5 times per day. If you are using extra storage units, you can't reduce the storage capacity below that required to meet the storage needs for your index.",
  "Description": "A new description for the index.",
  "DocumentMetadataConfigurationUpdates": "The document metadata to update. ",
  "Name": "The name of the index to update.",
  "RoleArn": "A new IAM role that gives Amazon Kendra permission to access your Amazon CloudWatch logs."
}
"""
UpdateIndex(args) = kendra("UpdateIndex", args)
