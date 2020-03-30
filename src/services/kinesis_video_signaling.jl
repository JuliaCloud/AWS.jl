include("../AWSServices.jl")
using .AWSServices: kinesis_video_signaling

"""
    SendAlexaOfferToMaster()

This API allows you to connect WebRTC-enabled devices with Alexa display devices. When invoked, it sends the Alexa Session Description Protocol (SDP) offer to the master peer. The offer is delivered as soon as the master is connected to the specified signaling channel. This API returns the SDP answer from the connected master. If the master is not connected to the signaling channel, redelivery requests are made until the message expires.

Required Parameters
{
  "MessagePayload": "The base64-encoded SDP offer content.",
  "SenderClientId": "The unique identifier for the sender client.",
  "ChannelARN": "The ARN of the signaling channel by which Alexa and the master peer communicate."
}
"""
SendAlexaOfferToMaster(args) = kinesis_video_signaling("POST", "/v1/send-alexa-offer-to-master", args)

"""
    GetIceServerConfig()

Gets the Interactive Connectivity Establishment (ICE) server configuration information, including URIs, username, and password which can be used to configure the WebRTC connection. The ICE component uses this configuration information to setup the WebRTC connection, including authenticating with the Traversal Using Relays around NAT (TURN) relay server.  TURN is a protocol that is used to improve the connectivity of peer-to-peer applications. By providing a cloud-based relay service, TURN ensures that a connection can be established even when one or more peers are incapable of a direct peer-to-peer connection. For more information, see A REST API For Access To TURN Services.  You can invoke this API to establish a fallback mechanism in case either of the peers is unable to establish a direct peer-to-peer connection over a signaling channel. You must specify either a signaling channel ARN or the client ID in order to invoke this API.

Required Parameters
{
  "ChannelARN": "The ARN of the signaling channel to be used for the peer-to-peer connection between configured peers. "
}

Optional Parameters
{
  "ClientId": "Unique identifier for the viewer. Must be unique within the signaling channel.",
  "Service": "Specifies the desired service. Currently, TURN is the only valid value.",
  "Username": "An optional user ID to be associated with the credentials."
}
"""
GetIceServerConfig(args) = kinesis_video_signaling("POST", "/v1/get-ice-server-config", args)