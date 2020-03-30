include("../AWSServices.jl")
using .AWSServices: workmailmessageflow

"""
    GetRawMessageContent()

Retrieves the raw content of an in-transit email message, in MIME format. 

Required Parameters
{
  "messageId": "The identifier of the email message to retrieve."
}
"""
GetRawMessageContent(args) = workmailmessageflow("GET", "/messages/{messageId}", args)
