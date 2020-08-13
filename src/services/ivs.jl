# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ivs

using Compat
using UUIDs
"""
    BatchGetChannel()

Performs GetChannel on multiple ARNs simultaneously.

# Required Parameters
- `arns`: Array of ARNs, one per channel.

"""
BatchGetChannel(arns; aws::AWSConfig=AWSConfig()) = ivs("POST", "/BatchGetChannel", Dict{String, Any}("arns"=>arns))
BatchGetChannel(arns, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/BatchGetChannel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arns"=>arns), args)); aws=aws)

"""
    BatchGetStreamKey()

Performs GetStreamKey on multiple ARNs simultaneously.

# Required Parameters
- `arns`: Array of ARNs, one per channel.

"""
BatchGetStreamKey(arns; aws::AWSConfig=AWSConfig()) = ivs("POST", "/BatchGetStreamKey", Dict{String, Any}("arns"=>arns))
BatchGetStreamKey(arns, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/BatchGetStreamKey", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arns"=>arns), args)); aws=aws)

"""
    CreateChannel()

Creates a new channel and an associated stream key to start streaming.

# Optional Parameters
- `latencyMode`: Channel latency mode. Default: LOW.
- `name`: Channel name.
- `tags`: See Channel tags.
- `type`: Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable resolution or bitrate, the stream probably will disconnect immediately. Valid values:    STANDARD: Multiple qualities are generated from the original input, to automatically give viewers the best experience for their devices and network conditions. Vertical resolution can be up to 1080 and bitrate can be up to 8.5 Mbps.    BASIC: Amazon IVS delivers the original input to viewers. The viewer’s video-quality choice is limited to the original input. Vertical resolution can be up to 480 and bitrate can be up to 1.5 Mbps.   Default: STANDARD.
"""
CreateChannel(; aws::AWSConfig=AWSConfig()) = ivs("POST", "/CreateChannel"; aws=aws)
CreateChannel(args::AbstractDict{String, Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/CreateChannel", args; aws=aws)

"""
    CreateStreamKey()

Creates a stream key, used to initiate a stream, for the specified channel ARN. Note that CreateChannel creates a stream key. If you subsequently use CreateStreamKey on the same channel, it will fail because a stream key already exists and there is a limit of 1 stream key per channel. To reset the stream key on a channel, use DeleteStreamKey and then CreateStreamKey.

# Required Parameters
- `channelArn`: ARN of the channel for which to create the stream key.

# Optional Parameters
- `tags`: See Channel tags.
"""
CreateStreamKey(channelArn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/CreateStreamKey", Dict{String, Any}("channelArn"=>channelArn))
CreateStreamKey(channelArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/CreateStreamKey", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelArn"=>channelArn), args)); aws=aws)

"""
    DeleteChannel()

Deletes the specified channel and its associated stream keys.

# Required Parameters
- `arn`: ARN of the channel to be deleted.

"""
DeleteChannel(arn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/DeleteChannel", Dict{String, Any}("arn"=>arn))
DeleteChannel(arn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/DeleteChannel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws=aws)

"""
    DeleteStreamKey()

Deletes the stream key for the specified ARN, so it can no longer be used to stream.

# Required Parameters
- `arn`: ARN of the stream key to be deleted.

"""
DeleteStreamKey(arn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/DeleteStreamKey", Dict{String, Any}("arn"=>arn))
DeleteStreamKey(arn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/DeleteStreamKey", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws=aws)

"""
    GetChannel()

Gets the channel configuration for the specified channel ARN. See also BatchGetChannel.

# Required Parameters
- `arn`: ARN of the channel for which the configuration is to be retrieved.

"""
GetChannel(arn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetChannel", Dict{String, Any}("arn"=>arn))
GetChannel(arn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetChannel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws=aws)

"""
    GetStream()

Gets information about the active (live) stream on a specified channel.

# Required Parameters
- `channelArn`: Channel ARN for stream to be accessed.

"""
GetStream(channelArn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetStream", Dict{String, Any}("channelArn"=>channelArn))
GetStream(channelArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetStream", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelArn"=>channelArn), args)); aws=aws)

"""
    GetStreamKey()

Gets stream-key information for a specified ARN.

# Required Parameters
- `arn`: ARN for the stream key to be retrieved.

"""
GetStreamKey(arn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetStreamKey", Dict{String, Any}("arn"=>arn))
GetStreamKey(arn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/GetStreamKey", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws=aws)

"""
    ListChannels()

Gets summary information about all channels in your account, in the AWS region where the API request is processed. This list can be filtered to match a specified string.

# Optional Parameters
- `filterByName`: Filters the channel list to match the specified name.
- `maxResults`: Maximum number of channels to return.
- `nextToken`: The first channel to retrieve. This is used for pagination; see the nextToken response field.
"""
ListChannels(; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListChannels"; aws=aws)
ListChannels(args::AbstractDict{String, Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListChannels", args; aws=aws)

"""
    ListStreamKeys()

Gets summary information about stream keys for the specified channel.

# Required Parameters
- `channelArn`: Channel ARN used to filter the list.

# Optional Parameters
- `maxResults`: Maximum number of streamKeys to return.
- `nextToken`: The first stream key to retrieve. This is used for pagination; see the nextToken response field.
"""
ListStreamKeys(channelArn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListStreamKeys", Dict{String, Any}("channelArn"=>channelArn))
ListStreamKeys(channelArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListStreamKeys", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelArn"=>channelArn), args)); aws=aws)

"""
    ListStreams()

Gets summary information about live streams in your account, in the AWS region where the API request is processed.

# Optional Parameters
- `maxResults`: Maximum number of streams to return.
- `nextToken`: The first stream to retrieve. This is used for pagination; see the nextToken response field.
"""
ListStreams(; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListStreams"; aws=aws)
ListStreams(args::AbstractDict{String, Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/ListStreams", args; aws=aws)

"""
    ListTagsForResource()

Gets information about AWS tags for the specified ARN.

# Required Parameters
- `resourceArn`: The ARN of the resource to be retrieved.

# Optional Parameters
- `maxResults`: Maximum number of tags to return.
- `nextToken`: The first tag to retrieve. This is used for pagination; see the nextToken response field.
"""
ListTagsForResource(resourceArn; aws::AWSConfig=AWSConfig()) = ivs("GET", "/tags/$(resourceArn)"; aws=aws)
ListTagsForResource(resourceArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("GET", "/tags/$(resourceArn)", args; aws=aws)

"""
    PutMetadata()

Inserts metadata into an RTMPS stream for the specified channel. A maximum of 5 requests per second per channel is allowed, each with a maximum 1KB payload.

# Required Parameters
- `channelArn`: ARN of the channel into which metadata is inserted. This channel must have an active stream.
- `metadata`: Metadata to insert into the stream. Maximum: 1 KB per request.

"""
PutMetadata(channelArn, metadata; aws::AWSConfig=AWSConfig()) = ivs("POST", "/PutMetadata", Dict{String, Any}("channelArn"=>channelArn, "metadata"=>metadata))
PutMetadata(channelArn, metadata, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/PutMetadata", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelArn"=>channelArn, "metadata"=>metadata), args)); aws=aws)

"""
    StopStream()

Disconnects the incoming RTMPS stream for the specified channel. Can be used in conjunction with DeleteStreamKey to prevent further streaming to a channel.  Many streaming client-software libraries automatically reconnect a dropped RTMPS session, so to stop the stream permanently, you may want to first revoke the streamKey attached to the channel. 

# Required Parameters
- `channelArn`: ARN of the channel for which the stream is to be stopped.

"""
StopStream(channelArn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/StopStream", Dict{String, Any}("channelArn"=>channelArn))
StopStream(channelArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/StopStream", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("channelArn"=>channelArn), args)); aws=aws)

"""
    TagResource()

Adds or updates tags for the AWS resource with the specified ARN.

# Required Parameters
- `resourceArn`: ARN of the resource for which tags are to be added or updated.
- `tags`: Array of tags to be added or updated.

"""
TagResource(resourceArn, tags; aws::AWSConfig=AWSConfig()) = ivs("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags))
TagResource(resourceArn, tags, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), args)); aws=aws)

"""
    UntagResource()

Removes tags from the resource with the specified ARN.

# Required Parameters
- `resourceArn`: ARN of the resource for which tags are to be removed.
- `tagKeys`: Array of tags to be removed.

"""
UntagResource(resourceArn, tagKeys; aws::AWSConfig=AWSConfig()) = ivs("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys))
UntagResource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws=aws)

"""
    UpdateChannel()

Updates a channel's configuration. This does not affect an ongoing stream of this channel. You must stop and restart the stream for the changes to take effect.

# Required Parameters
- `arn`: ARN of the channel to be updated.

# Optional Parameters
- `latencyMode`: Channel latency mode. Default: LOW.
- `name`: Channel name.
- `type`: Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable resolution or bitrate, the stream probably will disconnect immediately. Valid values:    STANDARD: Multiple qualities are generated from the original input, to automatically give viewers the best experience for their devices and network conditions. Vertical resolution can be up to 1080 and bitrate can be up to 8.5 Mbps.    BASIC: Amazon IVS delivers the original input to viewers. The viewer’s video-quality choice is limited to the original input. Vertical resolution can be up to 480 and bitrate can be up to 1.5 Mbps.   Default: STANDARD.
"""
UpdateChannel(arn; aws::AWSConfig=AWSConfig()) = ivs("POST", "/UpdateChannel", Dict{String, Any}("arn"=>arn))
UpdateChannel(arn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = ivs("POST", "/UpdateChannel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws=aws)
