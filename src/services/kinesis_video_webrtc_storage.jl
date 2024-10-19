# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: kinesis_video_webrtc_storage
using AWS.Compat
using AWS.UUIDs

"""
    join_storage_session(channel_arn)
    join_storage_session(channel_arn, params::Dict{String,<:Any})

 Before using this API, you must call the GetSignalingChannelEndpoint API to request the
WEBRTC endpoint. You then specify the endpoint and region in your JoinStorageSession API
request.  Join the ongoing one way-video and/or multi-way audio WebRTC session as a video
producing device for an input channel. If there’s no existing session for the channel, a
new streaming session needs to be created, and the Amazon Resource Name (ARN) of the
signaling channel must be provided.  Currently for the SINGLE_MASTER type, a video
producing device is able to ingest both audio and video media into a stream. Only video
producing devices can join the session and record media.  Both audio and video tracks are
currently required for WebRTC ingestion. Current requirements:   Video track: H.264   Audio
track: Opus    The resulting ingested video in the Kinesis video stream will have the
following parameters: H.264 video and AAC audio. Once a master participant has negotiated a
connection through WebRTC, the ingested media session will be stored in the Kinesis video
stream. Multiple viewers are then able to play back real-time media through our Playback
APIs. You can also use existing Kinesis Video Streams features like HLS or DASH playback,
image generation via GetImages, and more with ingested WebRTC media.  S3 image delivery and
notifications are not currently supported.   Assume that only one video producing device
client can be associated with a session for the channel. If more than one client joins the
session of a specific channel as a video producing device, the most recent client request
takes precedence.    Additional information     Idempotent - This API is not idempotent.
Retry behavior - This is counted as a new API call.    Concurrent calls - Concurrent calls
are allowed. An offer is sent once per each call.

# Arguments
- `channel_arn`:  The Amazon Resource Name (ARN) of the signaling channel.

"""
function join_storage_session(channelArn; aws_config::AbstractAWSConfig=global_aws_config())
    return kinesis_video_webrtc_storage(
        "POST",
        "/joinStorageSession",
        Dict{String,Any}("channelArn" => channelArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function join_storage_session(
    channelArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return kinesis_video_webrtc_storage(
        "POST",
        "/joinStorageSession",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelArn" => channelArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    join_storage_session_as_viewer(channel_arn, client_id)
    join_storage_session_as_viewer(channel_arn, client_id, params::Dict{String,<:Any})

 Join the ongoing one way-video and/or multi-way audio WebRTC session as a viewer for an
input channel. If there’s no existing session for the channel, create a new streaming
session and provide the Amazon Resource Name (ARN) of the signaling channel (channelArn)
and client id (clientId).  Currently for SINGLE_MASTER type, a video producing device is
able to ingest both audio and video media into a stream, while viewers can only ingest
audio. Both a video producing device and viewers can join a session first and wait for
other participants. While participants are having peer to peer conversations through
WebRTC, the ingested media session will be stored into the Kinesis Video Stream. Multiple
viewers are able to playback real-time media.  Customers can also use existing Kinesis
Video Streams features like HLS or DASH playback, Image generation, and more with ingested
WebRTC media. If there’s an existing session with the same clientId that's found in the
join session request, the new request takes precedence.

# Arguments
- `channel_arn`:  The Amazon Resource Name (ARN) of the signaling channel.
- `client_id`:  The unique identifier for the sender client.

"""
function join_storage_session_as_viewer(
    channelArn, clientId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return kinesis_video_webrtc_storage(
        "POST",
        "/joinStorageSessionAsViewer",
        Dict{String,Any}("channelArn" => channelArn, "clientId" => clientId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function join_storage_session_as_viewer(
    channelArn,
    clientId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return kinesis_video_webrtc_storage(
        "POST",
        "/joinStorageSessionAsViewer",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("channelArn" => channelArn, "clientId" => clientId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
