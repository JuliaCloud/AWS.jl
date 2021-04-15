# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mediatailor
using AWS.Compat
using AWS.UUIDs

"""
    create_channel(outputs, playback_mode, channel_name)
    create_channel(outputs, playback_mode, channel_name, params::Dict{String,<:Any})

Creates a channel.

# Arguments
- `outputs`: The channel's output properties.
- `playback_mode`: The type of playback mode for this channel. The only supported value is
  LOOP.
- `channel_name`: The identifier for the channel you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: The tags to assign to the channel.
"""
create_channel(Outputs, PlaybackMode, channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/channel/$(channelName)", Dict{String, Any}("Outputs"=>Outputs, "PlaybackMode"=>PlaybackMode); aws_config=aws_config)
create_channel(Outputs, PlaybackMode, channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/channel/$(channelName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Outputs"=>Outputs, "PlaybackMode"=>PlaybackMode), params)); aws_config=aws_config)

"""
    create_program(schedule_configuration, source_location_name, vod_source_name, channel_name, program_name)
    create_program(schedule_configuration, source_location_name, vod_source_name, channel_name, program_name, params::Dict{String,<:Any})

Creates a program.

# Arguments
- `schedule_configuration`: The schedule configuration settings.
- `source_location_name`: The name of the source location.
- `vod_source_name`: The name that's used to refer to a VOD source.
- `channel_name`: The identifier for the channel you are working on.
- `program_name`: The identifier for the program you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AdBreaks"`: The ad break configuration settings.
"""
create_program(ScheduleConfiguration, SourceLocationName, VodSourceName, channelName, programName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/channel/$(channelName)/program/$(programName)", Dict{String, Any}("ScheduleConfiguration"=>ScheduleConfiguration, "SourceLocationName"=>SourceLocationName, "VodSourceName"=>VodSourceName); aws_config=aws_config)
create_program(ScheduleConfiguration, SourceLocationName, VodSourceName, channelName, programName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/channel/$(channelName)/program/$(programName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ScheduleConfiguration"=>ScheduleConfiguration, "SourceLocationName"=>SourceLocationName, "VodSourceName"=>VodSourceName), params)); aws_config=aws_config)

"""
    create_source_location(http_configuration, source_location_name)
    create_source_location(http_configuration, source_location_name, params::Dict{String,<:Any})

Creates a source location on a specific channel.

# Arguments
- `http_configuration`: The source's HTTP package configurations.
- `source_location_name`: The identifier for the source location you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AccessConfiguration"`: Access configuration parameters. Configures the type of
  authentication used to access content from your source location.
- `"DefaultSegmentDeliveryConfiguration"`: The optional configuration for the server that
  serves segments.
- `"tags"`: The tags to assign to the source location.
"""
create_source_location(HttpConfiguration, sourceLocationName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/sourceLocation/$(sourceLocationName)", Dict{String, Any}("HttpConfiguration"=>HttpConfiguration); aws_config=aws_config)
create_source_location(HttpConfiguration, sourceLocationName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/sourceLocation/$(sourceLocationName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HttpConfiguration"=>HttpConfiguration), params)); aws_config=aws_config)

"""
    create_vod_source(http_package_configurations, source_location_name, vod_source_name)
    create_vod_source(http_package_configurations, source_location_name, vod_source_name, params::Dict{String,<:Any})

Creates name for a specific VOD source in a source location.

# Arguments
- `http_package_configurations`: An array of HTTP package configuration parameters for this
  VOD source.
- `source_location_name`: The identifier for the source location you are working on.
- `vod_source_name`: The identifier for the VOD source you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: The tags to assign to the VOD source.
"""
create_vod_source(HttpPackageConfigurations, sourceLocationName, vodSourceName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", Dict{String, Any}("HttpPackageConfigurations"=>HttpPackageConfigurations); aws_config=aws_config)
create_vod_source(HttpPackageConfigurations, sourceLocationName, vodSourceName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HttpPackageConfigurations"=>HttpPackageConfigurations), params)); aws_config=aws_config)

"""
    delete_channel(channel_name)
    delete_channel(channel_name, params::Dict{String,<:Any})

Deletes a channel. You must stop the channel before it can be deleted.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
delete_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)"; aws_config=aws_config)
delete_channel(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)", params; aws_config=aws_config)

"""
    delete_channel_policy(channel_name)
    delete_channel_policy(channel_name, params::Dict{String,<:Any})

Deletes a channel's IAM policy.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
delete_channel_policy(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)/policy"; aws_config=aws_config)
delete_channel_policy(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)/policy", params; aws_config=aws_config)

"""
    delete_playback_configuration(name)
    delete_playback_configuration(name, params::Dict{String,<:Any})

Deletes the playback configuration for the specified name.

# Arguments
- `name`: The identifier for the playback configuration.

"""
delete_playback_configuration(Name; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/playbackConfiguration/$(Name)"; aws_config=aws_config)
delete_playback_configuration(Name, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/playbackConfiguration/$(Name)", params; aws_config=aws_config)

"""
    delete_program(channel_name, program_name)
    delete_program(channel_name, program_name, params::Dict{String,<:Any})

Deletes a specific program on a specific channel.

# Arguments
- `channel_name`: The identifier for the channel you are working on.
- `program_name`: The identifier for the program you are working on.

"""
delete_program(channelName, programName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)/program/$(programName)"; aws_config=aws_config)
delete_program(channelName, programName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/channel/$(channelName)/program/$(programName)", params; aws_config=aws_config)

"""
    delete_source_location(source_location_name)
    delete_source_location(source_location_name, params::Dict{String,<:Any})

Deletes a source location on a specific channel.

# Arguments
- `source_location_name`: The identifier for the source location you are working on.

"""
delete_source_location(sourceLocationName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/sourceLocation/$(sourceLocationName)"; aws_config=aws_config)
delete_source_location(sourceLocationName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/sourceLocation/$(sourceLocationName)", params; aws_config=aws_config)

"""
    delete_vod_source(source_location_name, vod_source_name)
    delete_vod_source(source_location_name, vod_source_name, params::Dict{String,<:Any})

Deletes a specific VOD source in a specific source location.

# Arguments
- `source_location_name`: The identifier for the source location you are working on.
- `vod_source_name`: The identifier for the VOD source you are working on.

"""
delete_vod_source(sourceLocationName, vodSourceName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)"; aws_config=aws_config)
delete_vod_source(sourceLocationName, vodSourceName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", params; aws_config=aws_config)

"""
    describe_channel(channel_name)
    describe_channel(channel_name, params::Dict{String,<:Any})

Describes the properties of a specific channel.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
describe_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)"; aws_config=aws_config)
describe_channel(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)", params; aws_config=aws_config)

"""
    describe_program(channel_name, program_name)
    describe_program(channel_name, program_name, params::Dict{String,<:Any})

Retrieves the properties of the requested program.

# Arguments
- `channel_name`: The identifier for the channel you are working on.
- `program_name`: The identifier for the program you are working on.

"""
describe_program(channelName, programName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/program/$(programName)"; aws_config=aws_config)
describe_program(channelName, programName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/program/$(programName)", params; aws_config=aws_config)

"""
    describe_source_location(source_location_name)
    describe_source_location(source_location_name, params::Dict{String,<:Any})

Retrieves the properties of the requested source location.

# Arguments
- `source_location_name`: The identifier for the source location you are working on.

"""
describe_source_location(sourceLocationName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)"; aws_config=aws_config)
describe_source_location(sourceLocationName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)", params; aws_config=aws_config)

"""
    describe_vod_source(source_location_name, vod_source_name)
    describe_vod_source(source_location_name, vod_source_name, params::Dict{String,<:Any})

Provides details about a specific VOD source in a specific source location.

# Arguments
- `source_location_name`: The identifier for the source location you are working on.
- `vod_source_name`: The identifier for the VOD source you are working on.

"""
describe_vod_source(sourceLocationName, vodSourceName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)"; aws_config=aws_config)
describe_vod_source(sourceLocationName, vodSourceName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", params; aws_config=aws_config)

"""
    get_channel_policy(channel_name)
    get_channel_policy(channel_name, params::Dict{String,<:Any})

Retrieves information about a channel's IAM policy.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
get_channel_policy(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/policy"; aws_config=aws_config)
get_channel_policy(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/policy", params; aws_config=aws_config)

"""
    get_channel_schedule(channel_name)
    get_channel_schedule(channel_name, params::Dict{String,<:Any})

Retrieves information about your channel's schedule.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"durationMinutes"`: The schedule duration in minutes. The maximum duration is 4320
  minutes (three days).
- `"maxResults"`: Upper bound on number of records to return. The maximum number of results
  is 100.
- `"nextToken"`: Pagination token from the GET list request. Use the token to fetch the
  next page of results.
"""
get_channel_schedule(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/schedule"; aws_config=aws_config)
get_channel_schedule(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channel/$(channelName)/schedule", params; aws_config=aws_config)

"""
    get_playback_configuration(name)
    get_playback_configuration(name, params::Dict{String,<:Any})

Returns the playback configuration for the specified name.

# Arguments
- `name`: The identifier for the playback configuration.

"""
get_playback_configuration(Name; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/playbackConfiguration/$(Name)"; aws_config=aws_config)
get_playback_configuration(Name, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/playbackConfiguration/$(Name)", params; aws_config=aws_config)

"""
    list_channels()
    list_channels(params::Dict{String,<:Any})

Retrieves a list of channels that are associated with this account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Upper bound on number of records to return. The maximum number of results
  is 100.
- `"nextToken"`: Pagination token from the GET list request. Use the token to fetch the
  next page of results.
"""
list_channels(; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channels"; aws_config=aws_config)
list_channels(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/channels", params; aws_config=aws_config)

"""
    list_playback_configurations()
    list_playback_configurations(params::Dict{String,<:Any})

Returns a list of the playback configurations defined in AWS Elemental MediaTailor. You can
specify a maximum number of configurations to return at a time. The default maximum is 50.
Results are returned in pagefuls. If MediaTailor has more configurations than the specified
maximum, it provides parameters in the response that you can use to retrieve the next
pageful.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: Maximum number of records to return.
- `"NextToken"`: Pagination token returned by the GET list request when results exceed the
  maximum allowed. Use the token to fetch the next page of results.
"""
list_playback_configurations(; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/playbackConfigurations"; aws_config=aws_config)
list_playback_configurations(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/playbackConfigurations", params; aws_config=aws_config)

"""
    list_source_locations()
    list_source_locations(params::Dict{String,<:Any})

Retrieves a list of source locations.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Upper bound on number of records to return. The maximum number of results
  is 100.
- `"nextToken"`: Pagination token from the GET list request. Use the token to fetch the
  next page of results.
"""
list_source_locations(; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocations"; aws_config=aws_config)
list_source_locations(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocations", params; aws_config=aws_config)

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Returns a list of the tags assigned to the specified playback configuration resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the playback configuration. You can
  get this from the response to any playback configuration request.

"""
list_tags_for_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/tags/$(ResourceArn)"; aws_config=aws_config)
list_tags_for_resource(ResourceArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/tags/$(ResourceArn)", params; aws_config=aws_config)

"""
    list_vod_sources(source_location_name)
    list_vod_sources(source_location_name, params::Dict{String,<:Any})

Lists all the VOD sources in a source location.

# Arguments
- `source_location_name`: The identifier for the source location you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Upper bound on number of records to return. The maximum number of results
  is 100.
- `"nextToken"`: Pagination token from the GET list request. Use the token to fetch the
  next page of results.
"""
list_vod_sources(sourceLocationName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)/vodSources"; aws_config=aws_config)
list_vod_sources(sourceLocationName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("GET", "/sourceLocation/$(sourceLocationName)/vodSources", params; aws_config=aws_config)

"""
    put_channel_policy(policy, channel_name)
    put_channel_policy(policy, channel_name, params::Dict{String,<:Any})

Creates an IAM policy for the channel.

# Arguments
- `policy`: Adds an IAM role that determines the permissions of your channel.
- `channel_name`: The identifier for the channel you are working on.

"""
put_channel_policy(Policy, channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/policy", Dict{String, Any}("Policy"=>Policy); aws_config=aws_config)
put_channel_policy(Policy, channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/policy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Policy"=>Policy), params)); aws_config=aws_config)

"""
    put_playback_configuration()
    put_playback_configuration(params::Dict{String,<:Any})

Adds a new playback configuration to AWS Elemental MediaTailor.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AdDecisionServerUrl"`: The URL for the ad decision server (ADS). This includes the
  specification of static parameters and placeholders for dynamic parameters. AWS Elemental
  MediaTailor substitutes player-specific and session-specific parameters as needed when
  calling the ADS. Alternately, for testing you can provide a static VAST URL. The maximum
  length is 25,000 characters.
- `"AvailSuppression"`: The configuration for avail suppression, also known as ad
  suppression. For more information about ad suppression, see Ad Suppression.
- `"Bumper"`: The configuration for bumpers. Bumpers are short audio or video clips that
  play at the start or before the end of an ad break. To learn more about bumpers, see
  Bumpers.
- `"CdnConfiguration"`: The configuration for using a content delivery network (CDN), like
  Amazon CloudFront, for content and ad segment management.
- `"ConfigurationAliases"`: The player parameters and aliases used as dynamic variables
  during session initialization. For more information, see Domain Variables.
- `"DashConfiguration"`: The configuration for DASH content.
- `"LivePreRollConfiguration"`: The configuration for pre-roll ad insertion.
- `"ManifestProcessingRules"`: The configuration for manifest processing rules. Manifest
  processing rules enable customization of the personalized manifests created by MediaTailor.
- `"Name"`: The identifier for the playback configuration.
- `"PersonalizationThresholdSeconds"`: Defines the maximum duration of underfilled ad time
  (in seconds) allowed in an ad break. If the duration of underfilled ad time exceeds the
  personalization threshold, then the personalization of the ad break is abandoned and the
  underlying content is shown. This feature applies to ad replacement in live and VOD
  streams, rather than ad insertion, because it relies on an underlying content stream. For
  more information about ad break behavior, including ad replacement and insertion, see Ad
  Behavior in AWS Elemental MediaTailor.
- `"SlateAdUrl"`: The URL for a high-quality video asset to transcode and use to fill in
  time that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in
  media content. Configuring the slate is optional for non-VPAID configurations. For VPAID,
  the slate is required because MediaTailor provides it in the slots that are designated for
  dynamic ad content. The slate must be a high-quality asset that contains both audio and
  video.
- `"TranscodeProfileName"`: The name that is used to associate this playback configuration
  with a custom transcode profile. This overrides the dynamic transcoding defaults of
  MediaTailor. Use this only if you have already set up custom profiles with the help of AWS
  Support.
- `"VideoContentSourceUrl"`: The URL prefix for the parent manifest for the stream, minus
  the asset ID. The maximum length is 512 characters.
- `"tags"`: The tags to assign to the playback configuration.
"""
put_playback_configuration(; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/playbackConfiguration"; aws_config=aws_config)
put_playback_configuration(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/playbackConfiguration", params; aws_config=aws_config)

"""
    start_channel(channel_name)
    start_channel(channel_name, params::Dict{String,<:Any})

Starts a specific channel.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
start_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/start"; aws_config=aws_config)
start_channel(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/start", params; aws_config=aws_config)

"""
    stop_channel(channel_name)
    stop_channel(channel_name, params::Dict{String,<:Any})

Stops a specific channel.

# Arguments
- `channel_name`: The identifier for the channel you are working on.

"""
stop_channel(channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/stop"; aws_config=aws_config)
stop_channel(channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)/stop", params; aws_config=aws_config)

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds tags to the specified playback configuration resource. You can specify one or more
tags to add.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the playback configuration. You can
  get this from the response to any playback configuration request.
- `tags`: A comma-separated list of tag key:value pairs.

"""
tag_resource(ResourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/tags/$(ResourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
tag_resource(ResourceArn, tags, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("POST", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config)

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from the specified playback configuration resource. You can specify one or
more tags to remove.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the playback configuration. You can
  get this from the response to any playback configuration request.
- `tag_keys`: A comma-separated list of the tag keys to remove from the playback
  configuration.

"""
untag_resource(ResourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/tags/$(ResourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(ResourceArn, tagKeys, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("DELETE", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config)

"""
    update_channel(outputs, channel_name)
    update_channel(outputs, channel_name, params::Dict{String,<:Any})

Updates an existing channel.

# Arguments
- `outputs`: The channel's output properties.
- `channel_name`: The identifier for the channel you are working on.

"""
update_channel(Outputs, channelName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)", Dict{String, Any}("Outputs"=>Outputs); aws_config=aws_config)
update_channel(Outputs, channelName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/channel/$(channelName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Outputs"=>Outputs), params)); aws_config=aws_config)

"""
    update_source_location(http_configuration, source_location_name)
    update_source_location(http_configuration, source_location_name, params::Dict{String,<:Any})

Updates a source location on a specific channel.

# Arguments
- `http_configuration`: The HTTP configuration for the source location.
- `source_location_name`: The identifier for the source location you are working on.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AccessConfiguration"`: Access configuration parameters. Configures the type of
  authentication used to access content from your source location.
- `"DefaultSegmentDeliveryConfiguration"`: The optional configuration for the host server
  that serves segments.
"""
update_source_location(HttpConfiguration, sourceLocationName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/sourceLocation/$(sourceLocationName)", Dict{String, Any}("HttpConfiguration"=>HttpConfiguration); aws_config=aws_config)
update_source_location(HttpConfiguration, sourceLocationName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/sourceLocation/$(sourceLocationName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HttpConfiguration"=>HttpConfiguration), params)); aws_config=aws_config)

"""
    update_vod_source(http_package_configurations, source_location_name, vod_source_name)
    update_vod_source(http_package_configurations, source_location_name, vod_source_name, params::Dict{String,<:Any})

Updates a specific VOD source in a specific source location.

# Arguments
- `http_package_configurations`: An array of HTTP package configurations for the VOD source
  on this account.
- `source_location_name`: The identifier for the source location you are working on.
- `vod_source_name`: The identifier for the VOD source you are working on.

"""
update_vod_source(HttpPackageConfigurations, sourceLocationName, vodSourceName; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", Dict{String, Any}("HttpPackageConfigurations"=>HttpPackageConfigurations); aws_config=aws_config)
update_vod_source(HttpPackageConfigurations, sourceLocationName, vodSourceName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = mediatailor("PUT", "/sourceLocation/$(sourceLocationName)/vodSource/$(vodSourceName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HttpPackageConfigurations"=>HttpPackageConfigurations), params)); aws_config=aws_config)
