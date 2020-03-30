include("../AWSServices.jl")
using .AWSServices: athena

"""
    ListTagsForResource()

Lists the tags associated with this workgroup.

Required Parameters
{
  "ResourceARN": "Lists the tags for the workgroup resource with the specified ARN."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be returned per request that lists the tags for the workgroup resource.",
  "NextToken": "The token for the next set of results, or null if there are no additional results for this request, where the request lists the tags for the workgroup resource with the specified ARN."
}
"""
ListTagsForResource(args) = athena("ListTagsForResource", args)

"""
    GetQueryResults()

Streams the results of a single query execution specified by QueryExecutionId from the Athena query results location in Amazon S3. For more information, see Query Results in the Amazon Athena User Guide. This request does not execute the query but returns results. Use StartQueryExecution to run a query. To stream query results successfully, the IAM principal with permission to call GetQueryResults also must have permissions to the Amazon S3 GetObject action for the Athena query results location.  IAM principals with permission to the Amazon S3 GetObject action for the query results location are able to retrieve query results from Amazon S3 even if permission to the GetQueryResults action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied. 

Required Parameters
{
  "QueryExecutionId": "The unique ID of the query execution."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results (rows) to return in this request.",
  "NextToken": "The token that specifies where to start pagination if a previous request was truncated."
}
"""
GetQueryResults(args) = athena("GetQueryResults", args)

"""
    StartQueryExecution()

Runs the SQL query statements contained in the Query. Requires you to have access to the workgroup in which the query ran. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Required Parameters
{
  "QueryString": "The SQL query statements to be executed."
}

Optional Parameters
{
  "ResultConfiguration": "Specifies information about where and how to save the results of the query execution. If the query runs in a workgroup, then workgroup's settings may override query settings. This affects the query results location. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See WorkGroupConfiguration EnforceWorkGroupConfiguration.",
  "ClientRequestToken": "A unique case-sensitive string used to ensure the request to create the query is idempotent (executes only once). If another StartQueryExecution request is received, the same response is returned and another query is not created. If a parameter has changed, for example, the QueryString, an error is returned.  This token is listed as not required because AWS SDKs (for example the AWS SDK for Java) auto-generate the token for users. If you are not using the AWS SDK or the AWS CLI, you must provide this token or the action will fail. ",
  "QueryExecutionContext": "The database within which the query executes.",
  "WorkGroup": "The name of the workgroup in which the query is being started."
}
"""
StartQueryExecution(args) = athena("StartQueryExecution", args)

"""
    StopQueryExecution()

Stops a query execution. Requires you to have access to the workgroup in which the query ran. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Required Parameters
{
  "QueryExecutionId": "The unique ID of the query execution to stop."
}
"""
StopQueryExecution(args) = athena("StopQueryExecution", args)

"""
    UpdateWorkGroup()

Updates the workgroup with the specified name. The workgroup's name cannot be changed.

Required Parameters
{
  "WorkGroup": "The specified workgroup that will be updated."
}

Optional Parameters
{
  "Description": "The workgroup description.",
  "ConfigurationUpdates": "The workgroup configuration that will be updated for the given workgroup.",
  "State": "The workgroup state that will be updated for the given workgroup."
}
"""
UpdateWorkGroup(args) = athena("UpdateWorkGroup", args)

"""
    BatchGetQueryExecution()

Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use ListQueryExecutionsInput WorkGroup. Query executions differ from named (saved) queries. Use BatchGetNamedQueryInput to get details about named queries.

Required Parameters
{
  "QueryExecutionIds": "An array of query execution IDs."
}
"""
BatchGetQueryExecution(args) = athena("BatchGetQueryExecution", args)

"""
    DeleteNamedQuery()

Deletes the named query if you have access to the workgroup in which the query was saved. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Required Parameters
{
  "NamedQueryId": "The unique ID of the query to delete."
}
"""
DeleteNamedQuery(args) = athena("DeleteNamedQuery", args)

"""
    ListQueryExecutions()

Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Optional Parameters
{
  "MaxResults": "The maximum number of query executions to return in this request.",
  "NextToken": "The token that specifies where to start pagination if a previous request was truncated.",
  "WorkGroup": "The name of the workgroup from which queries are returned. If a workgroup is not specified, a list of available query execution IDs for the queries in the primary workgroup is returned."
}
"""
ListQueryExecutions() = athena("ListQueryExecutions")
ListQueryExecutions(args) = athena("ListQueryExecutions", args)

"""
    CreateWorkGroup()

Creates a workgroup with the specified name.

Required Parameters
{
  "Name": "The workgroup name."
}

Optional Parameters
{
  "Configuration": "The configuration for the workgroup, which includes the location in Amazon S3 where query results are stored, the encryption configuration, if any, used for encrypting query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup, the limit for the amount of bytes scanned (cutoff) per query, if it is specified, and whether workgroup's settings (specified with EnforceWorkGroupConfiguration) in the WorkGroupConfiguration override client-side settings. See WorkGroupConfiguration EnforceWorkGroupConfiguration.",
  "Description": "The workgroup description.",
  "Tags": "One or more tags, separated by commas, that you want to attach to the workgroup as you create it."
}
"""
CreateWorkGroup(args) = athena("CreateWorkGroup", args)

"""
    CreateNamedQuery()

Creates a named query in the specified workgroup. Requires that you have access to the workgroup. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Required Parameters
{
  "Database": "The database to which the query belongs.",
  "Name": "The query name.",
  "QueryString": "The contents of the query with all query statements."
}

Optional Parameters
{
  "Description": "The query description.",
  "ClientRequestToken": "A unique case-sensitive string used to ensure the request to create the query is idempotent (executes only once). If another CreateNamedQuery request is received, the same response is returned and another query is not created. If a parameter has changed, for example, the QueryString, an error is returned.  This token is listed as not required because AWS SDKs (for example the AWS SDK for Java) auto-generate the token for users. If you are not using the AWS SDK or the AWS CLI, you must provide this token or the action will fail. ",
  "WorkGroup": "The name of the workgroup in which the named query is being created."
}
"""
CreateNamedQuery(args) = athena("CreateNamedQuery", args)

"""
    TagResource()

Adds one or more tags to the resource, such as a workgroup. A tag is a label that you assign to an AWS Athena resource (a workgroup). Each tag consists of a key and an optional value, both of which you define. Tags enable you to categorize resources (workgroups) in Athena, for example, by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups in your account. For best practices, see AWS Tagging Strategies. The key length is from 1 (minimum) to 128 (maximum) Unicode characters in UTF-8. The tag value length is from 0 (minimum) to 256 (maximum) Unicode characters in UTF-8. You can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one, separate them by commas.

Required Parameters
{
  "ResourceARN": "Requests that one or more tags are added to the resource (such as a workgroup) for the specified ARN.",
  "Tags": "One or more tags, separated by commas, to be added to the resource, such as a workgroup."
}
"""
TagResource(args) = athena("TagResource", args)

"""
    UntagResource()

Removes one or more tags from the workgroup resource. Takes as an input a list of TagKey Strings separated by commas, and removes their tags at the same time.

Required Parameters
{
  "ResourceARN": "Removes one or more tags from the workgroup resource for the specified ARN.",
  "TagKeys": "Removes the tags associated with one or more tag keys from the workgroup resource."
}
"""
UntagResource(args) = athena("UntagResource", args)

"""
    ListWorkGroups()

Lists available workgroups for the account.

Optional Parameters
{
  "MaxResults": "The maximum number of workgroups to return in this request.",
  "NextToken": "A token to be used by the next request if this request is truncated."
}
"""
ListWorkGroups() = athena("ListWorkGroups")
ListWorkGroups(args) = athena("ListWorkGroups", args)

"""
    GetQueryExecution()

Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.

Required Parameters
{
  "QueryExecutionId": "The unique ID of the query execution."
}
"""
GetQueryExecution(args) = athena("GetQueryExecution", args)

"""
    DeleteWorkGroup()

Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.

Required Parameters
{
  "WorkGroup": "The unique name of the workgroup to delete."
}

Optional Parameters
{
  "RecursiveDeleteOption": "The option to delete the workgroup and its contents even if the workgroup contains any named queries."
}
"""
DeleteWorkGroup(args) = athena("DeleteWorkGroup", args)

"""
    GetWorkGroup()

Returns information about the workgroup with the specified name.

Required Parameters
{
  "WorkGroup": "The name of the workgroup."
}
"""
GetWorkGroup(args) = athena("GetWorkGroup", args)

"""
    BatchGetNamedQuery()

Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use ListNamedQueriesInput to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under UnprocessedNamedQueryId. Named queries differ from executed queries. Use BatchGetQueryExecutionInput to get details about each unique query execution, and ListQueryExecutionsInput to get a list of query execution IDs.

Required Parameters
{
  "NamedQueryIds": "An array of query IDs."
}
"""
BatchGetNamedQuery(args) = athena("BatchGetNamedQuery", args)

"""
    ListNamedQueries()

Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup. For code samples using the AWS SDK for Java, see Examples and Code Samples in the Amazon Athena User Guide.

Optional Parameters
{
  "MaxResults": "The maximum number of queries to return in this request.",
  "NextToken": "The token that specifies where to start pagination if a previous request was truncated.",
  "WorkGroup": "The name of the workgroup from which the named queries are returned. If a workgroup is not specified, the saved queries for the primary workgroup are returned."
}
"""
ListNamedQueries() = athena("ListNamedQueries")
ListNamedQueries(args) = athena("ListNamedQueries", args)

"""
    GetNamedQuery()

Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.

Required Parameters
{
  "NamedQueryId": "The unique ID of the query. Use ListNamedQueries to get query IDs."
}
"""
GetNamedQuery(args) = athena("GetNamedQuery", args)
