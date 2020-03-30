include("../AWSServices.jl")
using .AWSServices: macie

"""
    DisassociateS3Resources()

Removes specified S3 resources from being monitored by Amazon Macie. If memberAccountId isn't specified, the action removes specified S3 resources from Macie for the current master account. If memberAccountId is specified, the action removes specified S3 resources from Macie for the specified member account.

Required Parameters
{
  "associatedS3Resources": "The S3 resources (buckets or prefixes) that you want to remove from being monitored and classified by Amazon Macie. "
}

Optional Parameters
{
  "memberAccountId": "The ID of the Amazon Macie member account whose resources you want to remove from being monitored by Amazon Macie. "
}
"""
DisassociateS3Resources(args) = macie("DisassociateS3Resources", args)

"""
    AssociateMemberAccount()

Associates a specified AWS account with Amazon Macie as a member account.

Required Parameters
{
  "memberAccountId": "The ID of the AWS account that you want to associate with Amazon Macie as a member account."
}
"""
AssociateMemberAccount(args) = macie("AssociateMemberAccount", args)

"""
    ListMemberAccounts()

Lists all Amazon Macie member accounts for the current Amazon Macie master account.

Optional Parameters
{
  "maxResults": "Use this parameter to indicate the maximum number of items that you want in the response. The default value is 250. ",
  "nextToken": "Use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListMemberAccounts action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data. "
}
"""
ListMemberAccounts() = macie("ListMemberAccounts")
ListMemberAccounts(args) = macie("ListMemberAccounts", args)

"""
    ListS3Resources()

Lists all the S3 resources associated with Amazon Macie. If memberAccountId isn't specified, the action lists the S3 resources associated with Amazon Macie for the current master account. If memberAccountId is specified, the action lists the S3 resources associated with Amazon Macie for the specified member account. 

Optional Parameters
{
  "maxResults": "Use this parameter to indicate the maximum number of items that you want in the response. The default value is 250. ",
  "nextToken": "Use this parameter when paginating results. Set its value to null on your first call to the ListS3Resources action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data. ",
  "memberAccountId": "The Amazon Macie member account ID whose associated S3 resources you want to list. "
}
"""
ListS3Resources() = macie("ListS3Resources")
ListS3Resources(args) = macie("ListS3Resources", args)

"""
    UpdateS3Resources()

Updates the classification types for the specified S3 resources. If memberAccountId isn't specified, the action updates the classification types of the S3 resources associated with Amazon Macie for the current master account. If memberAccountId is specified, the action updates the classification types of the S3 resources associated with Amazon Macie for the specified member account. 

Required Parameters
{
  "s3ResourcesUpdate": "The S3 resources whose classification types you want to update."
}

Optional Parameters
{
  "memberAccountId": "The AWS ID of the Amazon Macie member account whose S3 resources' classification types you want to update. "
}
"""
UpdateS3Resources(args) = macie("UpdateS3Resources", args)

"""
    AssociateS3Resources()

Associates specified S3 resources with Amazon Macie for monitoring and data classification. If memberAccountId isn't specified, the action associates specified S3 resources with Macie for the current master account. If memberAccountId is specified, the action associates specified S3 resources with Macie for the specified member account. 

Required Parameters
{
  "s3Resources": "The S3 resources that you want to associate with Amazon Macie for monitoring and data classification. "
}

Optional Parameters
{
  "memberAccountId": "The ID of the Amazon Macie member account whose resources you want to associate with Macie. "
}
"""
AssociateS3Resources(args) = macie("AssociateS3Resources", args)

"""
    DisassociateMemberAccount()

Removes the specified member account from Amazon Macie.

Required Parameters
{
  "memberAccountId": "The ID of the member account that you want to remove from Amazon Macie."
}
"""
DisassociateMemberAccount(args) = macie("DisassociateMemberAccount", args)
