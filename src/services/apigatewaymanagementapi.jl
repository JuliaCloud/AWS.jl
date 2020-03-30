include("../AWSServices.jl")
using .AWSServices: apigatewaymanagementapi

"""
    GetConnection()

Get information about the connection with the provided id.

Required Parameters
{
  "ConnectionId": ""
}
"""
GetConnection(args) = apigatewaymanagementapi("GET", "/@connections/{connectionId}", args)

"""
    PostToConnection()

Sends the provided data to the specified connection.

Required Parameters
{
  "ConnectionId": "The identifier of the connection that a specific client is using.",
  "Data": "The data to be sent to the client specified by its connection id."
}
"""
PostToConnection(args) = apigatewaymanagementapi("POST", "/@connections/{connectionId}", args)

"""
    DeleteConnection()

Delete the connection with the provided id.

Required Parameters
{
  "ConnectionId": ""
}
"""
DeleteConnection(args) = apigatewaymanagementapi("DELETE", "/@connections/{connectionId}", args)
