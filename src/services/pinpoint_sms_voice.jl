# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: pinpoint_sms_voice
using AWS.Compat
using AWS.UUIDs
"""
    CreateConfigurationSet()

Create a new configuration set. After you create the configuration set, you can add one or more event destinations to it.

# Optional Parameters
- `ConfigurationSetName`: The name that you want to give the configuration set.
"""

create_configuration_set(; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets"; aws_config=aws_config)
create_configuration_set(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets", args; aws_config=aws_config)

"""
    CreateConfigurationSetEventDestination()

Create a new event destination in a configuration set.

# Required Parameters
- `ConfigurationSetName`: ConfigurationSetName

# Optional Parameters
- `EventDestination`: 
- `EventDestinationName`: A name that identifies the event destination.
"""

create_configuration_set_event_destination(ConfigurationSetName; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations"; aws_config=aws_config)
create_configuration_set_event_destination(ConfigurationSetName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations", args; aws_config=aws_config)

"""
    DeleteConfigurationSet()

Deletes an existing configuration set.

# Required Parameters
- `ConfigurationSetName`: ConfigurationSetName

"""

delete_configuration_set(ConfigurationSetName; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)"; aws_config=aws_config)
delete_configuration_set(ConfigurationSetName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)", args; aws_config=aws_config)

"""
    DeleteConfigurationSetEventDestination()

Deletes an event destination in a configuration set.

# Required Parameters
- `ConfigurationSetName`: ConfigurationSetName
- `EventDestinationName`: EventDestinationName

"""

delete_configuration_set_event_destination(ConfigurationSetName, EventDestinationName; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)"; aws_config=aws_config)
delete_configuration_set_event_destination(ConfigurationSetName, EventDestinationName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("DELETE", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)", args; aws_config=aws_config)

"""
    GetConfigurationSetEventDestinations()

Obtain information about an event destination, including the types of events it reports, the Amazon Resource Name (ARN) of the destination, and the name of the event destination.

# Required Parameters
- `ConfigurationSetName`: ConfigurationSetName

"""

get_configuration_set_event_destinations(ConfigurationSetName; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations"; aws_config=aws_config)
get_configuration_set_event_destinations(ConfigurationSetName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations", args; aws_config=aws_config)

"""
    ListConfigurationSets()

List all of the configuration sets associated with your Amazon Pinpoint account in the current region.

# Optional Parameters
- `NextToken`: A token returned from a previous call to the API that indicates the position in the list of results.
- `PageSize`: Used to specify the number of items that should be returned in the response.
"""

list_configuration_sets(; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets"; aws_config=aws_config)
list_configuration_sets(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("GET", "/v1/sms-voice/configuration-sets", args; aws_config=aws_config)

"""
    SendVoiceMessage()

Create a new voice message and send it to a recipient's phone number.

# Optional Parameters
- `CallerId`: The phone number that appears on recipients' devices when they receive the message.
- `ConfigurationSetName`: The name of the configuration set that you want to use to send the message.
- `Content`: 
- `DestinationPhoneNumber`: The phone number that you want to send the voice message to.
- `OriginationPhoneNumber`: The phone number that Amazon Pinpoint should use to send the voice message. This isn't necessarily the phone number that appears on recipients' devices when they receive the message, because you can specify a CallerId parameter in the request.
"""

send_voice_message(; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/voice/message"; aws_config=aws_config)
send_voice_message(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("POST", "/v1/sms-voice/voice/message", args; aws_config=aws_config)

"""
    UpdateConfigurationSetEventDestination()

Update an event destination in a configuration set. An event destination is a location that you publish information about your voice calls to. For example, you can log an event to an Amazon CloudWatch destination when a call fails.

# Required Parameters
- `ConfigurationSetName`: ConfigurationSetName
- `EventDestinationName`: EventDestinationName

# Optional Parameters
- `EventDestination`: 
"""

update_configuration_set_event_destination(ConfigurationSetName, EventDestinationName; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("PUT", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)"; aws_config=aws_config)
update_configuration_set_event_destination(ConfigurationSetName, EventDestinationName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = pinpoint_sms_voice("PUT", "/v1/sms-voice/configuration-sets/$(ConfigurationSetName)/event-destinations/$(EventDestinationName)", args; aws_config=aws_config)
