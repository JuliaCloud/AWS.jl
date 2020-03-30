include("../AWSServices.jl")
using .AWSServices: codestar_connections

"""
    GetConnection()

Returns the connection ARN and details such as status, owner, and provider type.

Required Parameters
{
  "ConnectionArn": "The Amazon Resource Name (ARN) of a connection."
}
"""
GetConnection(args) = codestar_connections("GetConnection", args)

"""
    ListConnections()

Lists the connections associated with your account.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned nextToken value.",
  "ProviderTypeFilter": "Filters the list of connections to those associated with a specified provider, such as Bitbucket.",
  "NextToken": "The token that was returned from the previous ListConnections call, which can be used to return the next set of connections in the list."
}
"""
ListConnections() = codestar_connections("ListConnections")
ListConnections(args) = codestar_connections("ListConnections", args)

"""
    CreateConnection()

Creates a connection that can then be given to other AWS services like CodePipeline so that it can access third-party code repositories. The connection is in pending status until the third-party connection handshake is completed from the console.

Required Parameters
{
  "ConnectionName": "The name of the connection to be created. The name must be unique in the calling AWS account.",
  "ProviderType": "The name of the external provider where your third-party code repository is configured. Currently, the valid provider type is Bitbucket."
}
"""
CreateConnection(args) = codestar_connections("CreateConnection", args)

"""
    DeleteConnection()

The connection to be deleted.

Required Parameters
{
  "ConnectionArn": "The Amazon Resource Name (ARN) of the connection to be deleted.  The ARN is never reused if the connection is deleted. "
}
"""
DeleteConnection(args) = codestar_connections("DeleteConnection", args)
