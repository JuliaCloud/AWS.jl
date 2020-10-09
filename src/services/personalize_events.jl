# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: personalize_events
using AWS.Compat
using AWS.UUIDs
"""
    PutEvents()

Records user interaction event data. For more information see event-record-api.

# Required Parameters
- `eventList`: A list of event data from the session.
- `sessionId`: The session ID associated with the user's visit. Your application generates the sessionId when a user first visits your website or uses your application. Amazon Personalize uses the sessionId to associate events with the user before they log in. For more information see event-record-api.
- `trackingId`: The tracking ID for the event. The ID is generated by a call to the CreateEventTracker API.

# Optional Parameters
- `userId`: The user associated with the event.
"""

put_events(eventList, sessionId, trackingId; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/events", Dict{String, Any}("eventList"=>eventList, "sessionId"=>sessionId, "trackingId"=>trackingId); aws_config=aws_config)
put_events(eventList, sessionId, trackingId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/events", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("eventList"=>eventList, "sessionId"=>sessionId, "trackingId"=>trackingId), args)); aws_config=aws_config)

"""
    PutItems()

Adds one or more items to an Items dataset. For more information see importing-items.

# Required Parameters
- `datasetArn`: The Amazon Resource Number (ARN) of the Items dataset you are adding the item or items to.
- `items`: A list of item data.

"""

put_items(datasetArn, items; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/items", Dict{String, Any}("datasetArn"=>datasetArn, "items"=>items); aws_config=aws_config)
put_items(datasetArn, items, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/items", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("datasetArn"=>datasetArn, "items"=>items), args)); aws_config=aws_config)

"""
    PutUsers()

Adds one or more users to a Users dataset. For more information see importing-users.

# Required Parameters
- `datasetArn`: The Amazon Resource Number (ARN) of the Users dataset you are adding the user or users to.
- `users`: A list of user data.

"""

put_users(datasetArn, users; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/users", Dict{String, Any}("datasetArn"=>datasetArn, "users"=>users); aws_config=aws_config)
put_users(datasetArn, users, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = personalize_events("POST", "/users", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("datasetArn"=>datasetArn, "users"=>users), args)); aws_config=aws_config)
