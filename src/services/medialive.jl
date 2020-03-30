include("../AWSServices.jl")
using .AWSServices: medialive

"""
    CreateInput()

Create an input

Optional Parameters
{
  "Destinations": "Destination settings for PUSH type inputs.",
  "InputSecurityGroups": "A list of security groups referenced by IDs to attach to the input.",
  "Tags": "A collection of key-value pairs.",
  "Sources": "The source URLs for a PULL-type input. Every PULL type input needs\nexactly two source URLs for redundancy.\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\n",
  "MediaConnectFlows": "A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\n",
  "Type": "",
  "Vpc": "",
  "Name": "Name of the input.",
  "RequestId": "Unique identifier of the request to ensure the request is handled\nexactly once in case of retries.\n",
  "RoleArn": "The Amazon Resource Name (ARN) of the role this input assumes during and after creation."
}
"""
CreateInput() = medialive("POST", "/prod/inputs")
CreateInput(args) = medialive("POST", "/prod/inputs", args)

"""
    DeleteInputSecurityGroup()

Deletes an Input Security Group

Required Parameters
{
  "InputSecurityGroupId": "The Input Security Group to delete"
}
"""
DeleteInputSecurityGroup(args) = medialive("DELETE", "/prod/inputSecurityGroups/{inputSecurityGroupId}", args)

"""
    DescribeInputSecurityGroup()

Produces a summary of an Input Security Group

Required Parameters
{
  "InputSecurityGroupId": "The id of the Input Security Group to describe"
}
"""
DescribeInputSecurityGroup(args) = medialive("GET", "/prod/inputSecurityGroups/{inputSecurityGroupId}", args)

"""
    ListInputSecurityGroups()

Produces a list of Input Security Groups for an account

Optional Parameters
{
  "MaxResults": "",
  "NextToken": ""
}
"""
ListInputSecurityGroups() = medialive("GET", "/prod/inputSecurityGroups")
ListInputSecurityGroups(args) = medialive("GET", "/prod/inputSecurityGroups", args)

"""
    DescribeInput()

Produces details about an input

Required Parameters
{
  "InputId": "Unique ID of the input"
}
"""
DescribeInput(args) = medialive("GET", "/prod/inputs/{inputId}", args)

"""
    UpdateInputSecurityGroup()

Update an Input Security Group's Whilelists.

Required Parameters
{
  "InputSecurityGroupId": "The id of the Input Security Group to update."
}

Optional Parameters
{
  "Tags": "A collection of key-value pairs.",
  "WhitelistRules": "List of IPv4 CIDR addresses to whitelist"
}
"""
UpdateInputSecurityGroup(args) = medialive("PUT", "/prod/inputSecurityGroups/{inputSecurityGroupId}", args)

"""
    UpdateInput()

Updates an input.

Required Parameters
{
  "InputId": "Unique ID of the input."
}

Optional Parameters
{
  "Destinations": "Destination settings for PUSH type inputs.",
  "InputSecurityGroups": "A list of security groups referenced by IDs to attach to the input.",
  "Sources": "The source URLs for a PULL-type input. Every PULL type input needs\nexactly two source URLs for redundancy.\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\n",
  "MediaConnectFlows": "A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\n",
  "Name": "Name of the input.",
  "RoleArn": "The Amazon Resource Name (ARN) of the role this input assumes during and after creation."
}
"""
UpdateInput(args) = medialive("PUT", "/prod/inputs/{inputId}", args)

"""
    DeleteInput()

Deletes the input end point

Required Parameters
{
  "InputId": "Unique ID of the input"
}
"""
DeleteInput(args) = medialive("DELETE", "/prod/inputs/{inputId}", args)

"""
    DeleteSchedule()

Delete all schedule actions on a channel.

Required Parameters
{
  "ChannelId": "Id of the channel whose schedule is being deleted."
}
"""
DeleteSchedule(args) = medialive("DELETE", "/prod/channels/{channelId}/schedule", args)

"""
    ListMultiplexes()

Retrieve a list of the existing multiplexes.

Optional Parameters
{
  "MaxResults": "The maximum number of items to return.",
  "NextToken": "The token to retrieve the next page of results."
}
"""
ListMultiplexes() = medialive("GET", "/prod/multiplexes")
ListMultiplexes(args) = medialive("GET", "/prod/multiplexes", args)

"""
    DeleteMultiplex()

Delete a multiplex. The multiplex must be idle.

Required Parameters
{
  "MultiplexId": "The ID of the multiplex."
}
"""
DeleteMultiplex(args) = medialive("DELETE", "/prod/multiplexes/{multiplexId}", args)

"""
    UpdateChannelClass()

Changes the class of the channel.

Required Parameters
{
  "ChannelId": "Channel Id of the channel whose class should be updated.",
  "ChannelClass": "The channel class that you wish to update this channel to use."
}

Optional Parameters
{
  "Destinations": "A list of output destinations for this channel."
}
"""
UpdateChannelClass(args) = medialive("PUT", "/prod/channels/{channelId}/channelClass", args)

"""
    UpdateReservation()

Update reservation.

Required Parameters
{
  "ReservationId": "Unique reservation ID, e.g. '1234567'"
}

Optional Parameters
{
  "Name": "Name of the reservation"
}
"""
UpdateReservation(args) = medialive("PUT", "/prod/reservations/{reservationId}", args)

"""
    PurchaseOffering()

Purchase an offering and create a reservation.

Required Parameters
{
  "OfferingId": "Offering to purchase, e.g. '87654321'",
  "Count": "Number of resources"
}

Optional Parameters
{
  "Start": "Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the first day of the current month and one year from now. If no value is given, the default is now.",
  "Tags": "A collection of key-value pairs",
  "Name": "Name for the new reservation",
  "RequestId": "Unique request ID to be specified. This is needed to prevent retries from creating multiple resources."
}
"""
PurchaseOffering(args) = medialive("POST", "/prod/offerings/{offeringId}/purchase", args)

"""
    ListOfferings()

List offerings available for purchase.

Optional Parameters
{
  "ResourceType": "Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'",
  "Codec": "Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'",
  "ChannelConfiguration": "Filter to offerings that match the configuration of an existing channel, e.g. '2345678' (a channel ID)\n",
  "Duration": "Filter by offering duration, e.g. '12'",
  "MaxResults": "",
  "MaximumFramerate": "Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'",
  "Resolution": "Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'",
  "ChannelClass": "Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'\n",
  "MaximumBitrate": "Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'\n",
  "VideoQuality": "Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'\n",
  "NextToken": "",
  "SpecialFeature": "Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'\n"
}
"""
ListOfferings() = medialive("GET", "/prod/offerings")
ListOfferings(args) = medialive("GET", "/prod/offerings", args)

"""
    DeleteTags()

Removes tags for a resource

Required Parameters
{
  "ResourceArn": "",
  "TagKeys": "An array of tag keys to delete"
}
"""
DeleteTags(args) = medialive("DELETE", "/prod/tags/{resource-arn}", args)

"""
    UpdateMultiplex()

Updates a multiplex.

Required Parameters
{
  "MultiplexId": "ID of the multiplex to update."
}

Optional Parameters
{
  "MultiplexSettings": "The new settings for a multiplex.",
  "Name": "Name of the multiplex."
}
"""
UpdateMultiplex(args) = medialive("PUT", "/prod/multiplexes/{multiplexId}", args)

"""
    DescribeOffering()

Get details for an offering.

Required Parameters
{
  "OfferingId": "Unique offering ID, e.g. '87654321'"
}
"""
DescribeOffering(args) = medialive("GET", "/prod/offerings/{offeringId}", args)

"""
    StartMultiplex()

Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.

Required Parameters
{
  "MultiplexId": "The ID of the multiplex."
}
"""
StartMultiplex(args) = medialive("POST", "/prod/multiplexes/{multiplexId}/start", args)

"""
    CreateTags()

Create tags for a resource

Required Parameters
{
  "ResourceArn": ""
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateTags(args) = medialive("POST", "/prod/tags/{resource-arn}", args)

"""
    StopMultiplex()

Stops a running multiplex. If the multiplex isn't running, this action has no effect.

Required Parameters
{
  "MultiplexId": "The ID of the multiplex."
}
"""
StopMultiplex(args) = medialive("POST", "/prod/multiplexes/{multiplexId}/stop", args)

"""
    CreateInputSecurityGroup()

Creates a Input Security Group

Optional Parameters
{
  "Tags": "A collection of key-value pairs.",
  "WhitelistRules": "List of IPv4 CIDR addresses to whitelist"
}
"""
CreateInputSecurityGroup() = medialive("POST", "/prod/inputSecurityGroups")
CreateInputSecurityGroup(args) = medialive("POST", "/prod/inputSecurityGroups", args)

"""
    ListTagsForResource()

Produces list of tags that have been created for a resource

Required Parameters
{
  "ResourceArn": ""
}
"""
ListTagsForResource(args) = medialive("GET", "/prod/tags/{resource-arn}", args)

"""
    DescribeSchedule()

Get a channel schedule

Required Parameters
{
  "ChannelId": "Id of the channel whose schedule is being updated."
}

Optional Parameters
{
  "MaxResults": "",
  "NextToken": ""
}
"""
DescribeSchedule(args) = medialive("GET", "/prod/channels/{channelId}/schedule", args)

"""
    CreateChannel()

Creates a new channel

Optional Parameters
{
  "InputAttachments": "List of input attachments for channel.",
  "Tags": "A collection of key-value pairs.",
  "LogLevel": "The log level to write to CloudWatch Logs.",
  "Name": "Name of channel.",
  "Reserved": "Deprecated field that's only usable by whitelisted customers.",
  "Destinations": "",
  "ChannelClass": "The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.",
  "RoleArn": "An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.",
  "RequestId": "Unique request ID to be specified. This is needed to prevent retries from\ncreating multiple resources.\n",
  "EncoderSettings": "",
  "InputSpecification": "Specification of input for this channel (max. bitrate, resolution, codec, etc.)"
}
"""
CreateChannel() = medialive("POST", "/prod/channels")
CreateChannel(args) = medialive("POST", "/prod/channels", args)

"""
    DeleteChannel()

Starts deletion of channel. The associated outputs are also deleted.

Required Parameters
{
  "ChannelId": "Unique ID of the channel."
}
"""
DeleteChannel(args) = medialive("DELETE", "/prod/channels/{channelId}", args)

"""
    UpdateMultiplexProgram()

Update a program in a multiplex.

Required Parameters
{
  "ProgramName": "The name of the program to update.",
  "MultiplexId": "The ID of the multiplex of the program to update."
}

Optional Parameters
{
  "MultiplexProgramSettings": "The new settings for a multiplex program."
}
"""
UpdateMultiplexProgram(args) = medialive("PUT", "/prod/multiplexes/{multiplexId}/programs/{programName}", args)

"""
    DescribeMultiplex()

Gets details about a multiplex.

Required Parameters
{
  "MultiplexId": "The ID of the multiplex."
}
"""
DescribeMultiplex(args) = medialive("GET", "/prod/multiplexes/{multiplexId}", args)

"""
    CreateMultiplex()

Create a new multiplex.

Required Parameters
{
  "MultiplexSettings": "Configuration for a multiplex event.",
  "AvailabilityZones": "A list of availability zones for the multiplex. You must specify exactly two.",
  "RequestId": "Unique request ID. This prevents retries from creating multiple\nresources.\n",
  "Name": "Name of multiplex."
}

Optional Parameters
{
  "Tags": "A collection of key-value pairs."
}
"""
CreateMultiplex(args) = medialive("POST", "/prod/multiplexes", args)

"""
    DeleteMultiplexProgram()

Delete a program from a multiplex.

Required Parameters
{
  "ProgramName": "The multiplex program name.",
  "MultiplexId": "The ID of the multiplex that the program belongs to."
}
"""
DeleteMultiplexProgram(args) = medialive("DELETE", "/prod/multiplexes/{multiplexId}/programs/{programName}", args)

"""
    DescribeMultiplexProgram()

Get the details for a program in a multiplex.

Required Parameters
{
  "ProgramName": "The name of the program.",
  "MultiplexId": "The ID of the multiplex that the program belongs to."
}
"""
DescribeMultiplexProgram(args) = medialive("GET", "/prod/multiplexes/{multiplexId}/programs/{programName}", args)

"""
    ListMultiplexPrograms()

List the programs that currently exist for a specific multiplex.

Required Parameters
{
  "MultiplexId": "The ID of the multiplex that the programs belong to."
}

Optional Parameters
{
  "MaxResults": "The maximum number of items to return.",
  "NextToken": "The token to retrieve the next page of results."
}
"""
ListMultiplexPrograms(args) = medialive("GET", "/prod/multiplexes/{multiplexId}/programs", args)

"""
    StopChannel()

Stops a running channel

Required Parameters
{
  "ChannelId": "A request to stop a running channel"
}
"""
StopChannel(args) = medialive("POST", "/prod/channels/{channelId}/stop", args)

"""
    ListChannels()

Produces list of channels that have been created

Optional Parameters
{
  "MaxResults": "",
  "NextToken": ""
}
"""
ListChannels() = medialive("GET", "/prod/channels")
ListChannels(args) = medialive("GET", "/prod/channels", args)

"""
    CreateMultiplexProgram()

Create a new program in the multiplex.

Required Parameters
{
  "MultiplexProgramSettings": "The settings for this multiplex program.",
  "ProgramName": "Name of multiplex program.",
  "MultiplexId": "ID of the multiplex where the program is to be created.",
  "RequestId": "Unique request ID. This prevents retries from creating multiple\nresources.\n"
}
"""
CreateMultiplexProgram(args) = medialive("POST", "/prod/multiplexes/{multiplexId}/programs", args)

"""
    DescribeReservation()

Get details for a reservation.

Required Parameters
{
  "ReservationId": "Unique reservation ID, e.g. '1234567'"
}
"""
DescribeReservation(args) = medialive("GET", "/prod/reservations/{reservationId}", args)

"""
    ListReservations()

List purchased reservations.

Optional Parameters
{
  "MaxResults": "",
  "VideoQuality": "Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'\n",
  "Codec": "Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'",
  "NextToken": "",
  "MaximumFramerate": "Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'",
  "ResourceType": "Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'",
  "Resolution": "Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'",
  "SpecialFeature": "Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'\n",
  "ChannelClass": "Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'\n",
  "MaximumBitrate": "Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'\n"
}
"""
ListReservations() = medialive("GET", "/prod/reservations")
ListReservations(args) = medialive("GET", "/prod/reservations", args)

"""
    UpdateChannel()

Updates a channel.

Required Parameters
{
  "ChannelId": "channel ID"
}

Optional Parameters
{
  "Name": "The name of the channel.",
  "Destinations": "A list of output destinations for this channel.",
  "InputAttachments": "",
  "LogLevel": "The log level to write to CloudWatch Logs.",
  "EncoderSettings": "The encoder settings for this channel.",
  "RoleArn": "An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not specify this on an update call but the role was previously set that role will be removed.",
  "InputSpecification": "Specification of input for this channel (max. bitrate, resolution, codec, etc.)"
}
"""
UpdateChannel(args) = medialive("PUT", "/prod/channels/{channelId}", args)

"""
    BatchUpdateSchedule()

Update a channel schedule

Required Parameters
{
  "ChannelId": "Id of the channel whose schedule is being updated."
}

Optional Parameters
{
  "Deletes": "Schedule actions to delete from the schedule.",
  "Creates": "Schedule actions to create in the schedule."
}
"""
BatchUpdateSchedule(args) = medialive("PUT", "/prod/channels/{channelId}/schedule", args)

"""
    DeleteReservation()

Delete an expired reservation.

Required Parameters
{
  "ReservationId": "Unique reservation ID, e.g. '1234567'"
}
"""
DeleteReservation(args) = medialive("DELETE", "/prod/reservations/{reservationId}", args)

"""
    ListInputs()

Produces list of inputs that have been created

Optional Parameters
{
  "MaxResults": "",
  "NextToken": ""
}
"""
ListInputs() = medialive("GET", "/prod/inputs")
ListInputs(args) = medialive("GET", "/prod/inputs", args)

"""
    DescribeChannel()

Gets details about a channel

Required Parameters
{
  "ChannelId": "channel ID"
}
"""
DescribeChannel(args) = medialive("GET", "/prod/channels/{channelId}", args)

"""
    StartChannel()

Starts an existing channel

Required Parameters
{
  "ChannelId": "A request to start a channel"
}
"""
StartChannel(args) = medialive("POST", "/prod/channels/{channelId}/start", args)
