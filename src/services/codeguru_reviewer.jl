include("../AWSServices.jl")
using .AWSServices: codeguru_reviewer

"""
    ListRepositoryAssociations()

Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.

Optional Parameters
{
  "MaxResults": "The maximum number of repository association results returned by ListRepositoryAssociations in paginated output. When this parameter is used, ListRepositoryAssociations only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListRepositoryAssociations request with the returned nextToken value. This value can be between 1 and 100. If this parameter is not used, then ListRepositoryAssociations returns up to 100 results and a nextToken value if applicable. ",
  "Names": "List of names to use as a filter.",
  "NextToken": "The nextToken value returned from a previous paginated ListRepositoryAssociations request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. ",
  "States": "List of states to use as a filter.",
  "ProviderTypes": "List of provider types to use as a filter.",
  "Owners": "List of owners to use as a filter. For AWS CodeCommit, the owner is the AWS account id. For GitHub, it is the GitHub account name."
}
"""
ListRepositoryAssociations() = codeguru_reviewer("GET", "/associations")
ListRepositoryAssociations(args) = codeguru_reviewer("GET", "/associations", args)

"""
    AssociateRepository()

Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request. You can view recommendations in the AWS CodeCommit repository. You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.

Required Parameters
{
  "Repository": "The repository to associate."
}

Optional Parameters
{
  "ClientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you want to add a new repository association, this parameter specifies a unique identifier for the new repository association that helps ensure idempotency. If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a ClientRequestToken yourself for new versions and include that value in the request. You typically only need to interact with this value if you implement your own retry logic and want to ensure that a given repository association is not created twice. We recommend that you generate a UUID-type value to ensure uniqueness within the specified repository association. Amazon CodeGuru Reviewer uses this value to prevent the accidental creation of duplicate repository associations if there are failures and retries. "
}
"""
AssociateRepository(args) = codeguru_reviewer("POST", "/associations", args)

"""
    DisassociateRepository()

Removes the association between Amazon CodeGuru Reviewer and a repository.

Required Parameters
{
  "AssociationArn": "The Amazon Resource Name (ARN) identifying the association."
}
"""
DisassociateRepository(args) = codeguru_reviewer("DELETE", "/associations/{AssociationArn}", args)

"""
    DescribeRepositoryAssociation()

Describes a repository association.

Required Parameters
{
  "AssociationArn": "The Amazon Resource Name (ARN) identifying the association."
}
"""
DescribeRepositoryAssociation(args) = codeguru_reviewer("GET", "/associations/{AssociationArn}", args)
