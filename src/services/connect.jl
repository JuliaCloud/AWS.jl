include("../AWSServices.jl")
using .AWSServices: connect

"""
    ListTagsForResource()

Lists the tags for the specified resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource."
}
"""
ListTagsForResource(args) = connect("GET", "/tags/{resourceArn}", args)

"""
    ListSecurityProfiles()

Provides summary information about the security profiles for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results."
}
"""
ListSecurityProfiles(args) = connect("GET", "/security-profiles-summary/{InstanceId}", args)

"""
    ListHoursOfOperations()

Provides information about the hours of operation for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results."
}
"""
ListHoursOfOperations(args) = connect("GET", "/hours-of-operations-summary/{InstanceId}", args)

"""
    UpdateUserIdentityInfo()

Updates the identity information for the specified user.

Required Parameters
{
  "UserId": "The identifier of the user account.",
  "IdentityInfo": "The identity information for the user.",
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
UpdateUserIdentityInfo(args) = connect("POST", "/users/{InstanceId}/{UserId}/identity-info", args)

"""
    GetCurrentMetricData()

Gets the real-time metric data from the specified Amazon Connect instance. For more information, see Real-time Metrics Reports in the Amazon Connect Administrator Guide.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "Filters": "The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. The only supported channel is VOICE.",
  "CurrentMetrics": "The metrics to retrieve. Specify the name and unit for each metric. The following metrics are available:  AGENTS_AFTER_CONTACT_WORK  Unit: COUNT  AGENTS_AVAILABLE  Unit: COUNT  AGENTS_ERROR  Unit: COUNT  AGENTS_NON_PRODUCTIVE  Unit: COUNT  AGENTS_ON_CALL  Unit: COUNT  AGENTS_ON_CONTACT  Unit: COUNT  AGENTS_ONLINE  Unit: COUNT  AGENTS_STAFFED  Unit: COUNT  CONTACTS_IN_QUEUE  Unit: COUNT  CONTACTS_SCHEDULED  Unit: COUNT  OLDEST_CONTACT_AGE  Unit: SECONDS  SLOTS_ACTIVE  Unit: COUNT  SLOTS_AVAILABLE  Unit: COUNT  "
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results. The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.",
  "Groupings": "The grouping applied to the metrics returned. For example, when grouped by QUEUE, the metrics returned apply to each queue rather than aggregated for all queues. If you group by CHANNEL, you should include a Channels filter. The only supported channel is VOICE. If no Grouping is included in the request, a summary of metrics is returned."
}
"""
GetCurrentMetricData(args) = connect("POST", "/metrics/current/{InstanceId}", args)

"""
    CreateUser()

Creates a user account for the specified Amazon Connect instance.

Required Parameters
{
  "RoutingProfileId": "The identifier of the routing profile for the user.",
  "PhoneConfig": "The phone settings for the user.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "SecurityProfileIds": "The identifier of the security profile for the user.",
  "Username": "The user name for the account. For instances not using SAML for identity management, the user name can include up to 20 characters. If you are using SAML for identity management, the user name can include up to 64 characters from [a-zA-Z0-9_-. @]+."
}

Optional Parameters
{
  "Password": "The password for the user account. A password is required if you are using Amazon Connect for identity management. Otherwise, it is an error to include a password.",
  "Tags": "One or more tags.",
  "IdentityInfo": "The information about the identity of the user.",
  "DirectoryUserId": "The identifier of the user account in the directory used for identity management. If Amazon Connect cannot access the directory, you can specify this identifier to authenticate users. If you include the identifier, we assume that Amazon Connect cannot access the directory. Otherwise, the identity information is used to authenticate users from your directory. This parameter is required if you are using an existing directory for identity management in Amazon Connect when Amazon Connect cannot access your directory to authenticate users. If you are using SAML for identity management and include this parameter, an error is returned.",
  "HierarchyGroupId": "The identifier of the hierarchy group for the user."
}
"""
CreateUser(args) = connect("PUT", "/users/{InstanceId}", args)

"""
    ListPhoneNumbers()

Provides information about the phone numbers for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.",
  "PhoneNumberTypes": "The type of phone number.",
  "PhoneNumberCountryCodes": "The ISO country code."
}
"""
ListPhoneNumbers(args) = connect("GET", "/phone-numbers-summary/{InstanceId}", args)

"""
    DescribeUserHierarchyStructure()

Describes the hierarchy structure of the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
DescribeUserHierarchyStructure(args) = connect("GET", "/user-hierarchy-structure/{InstanceId}", args)

"""
    DeleteUser()

Deletes a user account from the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "UserId": "The identifier of the user."
}
"""
DeleteUser(args) = connect("DELETE", "/users/{InstanceId}/{UserId}", args)

"""
    ListContactFlows()

Provides information about the contact flows for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.",
  "ContactFlowTypes": "The type of contact flow."
}
"""
ListContactFlows(args) = connect("GET", "/contact-flows-summary/{InstanceId}", args)

"""
    TagResource()

Adds the specified tags to the specified resource. The supported resource type is users.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "tags": "One or more tags. For example, { \"tags\": {\"key1\":\"value1\", \"key2\":\"value2\"} }."
}
"""
TagResource(args) = connect("POST", "/tags/{resourceArn}", args)

"""
    UntagResource()

Removes the specified tags from the specified resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "tagKeys": "The tag keys."
}
"""
UntagResource(args) = connect("DELETE", "/tags/{resourceArn}", args)

"""
    UpdateUserRoutingProfile()

Assigns the specified routing profile to the specified user.

Required Parameters
{
  "UserId": "The identifier of the user account.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "RoutingProfileId": "The identifier of the routing profile for the user."
}
"""
UpdateUserRoutingProfile(args) = connect("POST", "/users/{InstanceId}/{UserId}/routing-profile", args)

"""
    StartOutboundVoiceContact()

Initiates a contact flow to place an outbound call to a customer. There is a 60 second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.

Required Parameters
{
  "ContactFlowId": "The identifier of the contact flow for the outbound call.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "DestinationPhoneNumber": "The phone number of the customer, in E.164 format."
}

Optional Parameters
{
  "SourcePhoneNumber": "The phone number associated with the Amazon Connect instance, in E.164 format. If you do not specify a source phone number, you must specify a queue.",
  "QueueId": "The queue for the call. If you specify a queue, the phone displayed for caller ID is the phone number specified in the queue. If you do not specify a queue, the queue defined in the contact flow is used. If you do not specify a queue, you must specify a source phone number.",
  "Attributes": "A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes. There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.",
  "ClientToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. The token is valid for 7 days after creation. If a contact is already started, the contact ID is returned. If the contact is disconnected, a new contact is started."
}
"""
StartOutboundVoiceContact(args) = connect("PUT", "/contact/outbound-voice", args)

"""
    ListUserHierarchyGroups()

Provides summary information about the hierarchy groups for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results."
}
"""
ListUserHierarchyGroups(args) = connect("GET", "/user-hierarchy-groups-summary/{InstanceId}", args)

"""
    ListUsers()

Provides summary information about the users for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results."
}
"""
ListUsers(args) = connect("GET", "/users-summary/{InstanceId}", args)

"""
    StopContact()

Ends the specified contact.

Required Parameters
{
  "ContactId": "The ID of the contact.",
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
StopContact(args) = connect("POST", "/contact/stop", args)

"""
    StartChatContact()

Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the CreateParticipantConnection API in the Amazon Connect Participant Service. When a new chat contact is successfully created, clients need to subscribe to the participant’s connection for the created chat within 5 minutes. This is achieved by invoking CreateParticipantConnection with WEBSOCKET and CONNECTION_CREDENTIALS. 

Required Parameters
{
  "ContactFlowId": "The identifier of the contact flow for the chat.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "ParticipantDetails": "Information identifying the participant."
}

Optional Parameters
{
  "InitialMessage": "The initial message to be sent to the newly created chat.",
  "Attributes": "A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes.  There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.",
  "ClientToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the request."
}
"""
StartChatContact(args) = connect("PUT", "/contact/chat", args)

"""
    UpdateContactAttributes()

Creates or updates the contact attributes associated with the specified contact. You can add or update attributes for both ongoing and completed contacts. For example, you can update the customer's name or the reason the customer called while the call is active, or add notes about steps that the agent took during the call that are displayed to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or identifying abusive callers. Contact attributes are available in Amazon Connect for 24 months, and are then deleted.  Important: You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "Attributes": "The Amazon Connect attributes. These attributes can be accessed in contact flows just like any other contact attributes. You can have up to 32,768 UTF-8 bytes across all attributes for a contact. Attribute keys can include only alphanumeric, dash, and underscore characters.",
  "InitialContactId": "The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center."
}
"""
UpdateContactAttributes(args) = connect("POST", "/contact/attributes", args)

"""
    UpdateUserHierarchy()

Assigns the specified hierarchy group to the specified user.

Required Parameters
{
  "UserId": "The identifier of the user account.",
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "HierarchyGroupId": "The identifier of the hierarchy group."
}
"""
UpdateUserHierarchy(args) = connect("POST", "/users/{InstanceId}/{UserId}/hierarchy", args)

"""
    GetFederationToken()

Retrieves a token for federation.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
GetFederationToken(args) = connect("GET", "/user/federate/{InstanceId}", args)

"""
    UpdateUserPhoneConfig()

Updates the phone configuration settings for the specified user.

Required Parameters
{
  "PhoneConfig": "Information about phone configuration settings for the user.",
  "UserId": "The identifier of the user account.",
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
UpdateUserPhoneConfig(args) = connect("POST", "/users/{InstanceId}/{UserId}/phone-config", args)

"""
    ListRoutingProfiles()

Provides summary information about the routing profiles for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results."
}
"""
ListRoutingProfiles(args) = connect("GET", "/routing-profiles-summary/{InstanceId}", args)

"""
    GetMetricData()

Gets historical metric data from the specified Amazon Connect instance. For more information, see Historical Metrics Reports in the Amazon Connect Administrator Guide.

Required Parameters
{
  "StartTime": "The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15. The start time cannot be earlier than 24 hours before the time of the request. Historical metrics are available only for 24 hours.",
  "EndTime": "The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and must be later than the start time timestamp. The time range between the start and end time must be less than 24 hours.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "Filters": "The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. The only supported channel is VOICE.",
  "HistoricalMetrics": "The metrics to retrieve. Specify the name, unit, and statistic for each metric. The following historical metrics are available:  ABANDON_TIME  Unit: SECONDS Statistic: AVG  AFTER_CONTACT_WORK_TIME  Unit: SECONDS Statistic: AVG  API_CONTACTS_HANDLED  Unit: COUNT Statistic: SUM  CALLBACK_CONTACTS_HANDLED  Unit: COUNT Statistic: SUM  CONTACTS_ABANDONED  Unit: COUNT Statistic: SUM  CONTACTS_AGENT_HUNG_UP_FIRST  Unit: COUNT Statistic: SUM  CONTACTS_CONSULTED  Unit: COUNT Statistic: SUM  CONTACTS_HANDLED  Unit: COUNT Statistic: SUM  CONTACTS_HANDLED_INCOMING  Unit: COUNT Statistic: SUM  CONTACTS_HANDLED_OUTBOUND  Unit: COUNT Statistic: SUM  CONTACTS_HOLD_ABANDONS  Unit: COUNT Statistic: SUM  CONTACTS_MISSED  Unit: COUNT Statistic: SUM  CONTACTS_QUEUED  Unit: COUNT Statistic: SUM  CONTACTS_TRANSFERRED_IN  Unit: COUNT Statistic: SUM  CONTACTS_TRANSFERRED_IN_FROM_QUEUE  Unit: COUNT Statistic: SUM  CONTACTS_TRANSFERRED_OUT  Unit: COUNT Statistic: SUM  CONTACTS_TRANSFERRED_OUT_FROM_QUEUE  Unit: COUNT Statistic: SUM  HANDLE_TIME  Unit: SECONDS Statistic: AVG  HOLD_TIME  Unit: SECONDS Statistic: AVG  INTERACTION_AND_HOLD_TIME  Unit: SECONDS Statistic: AVG  INTERACTION_TIME  Unit: SECONDS Statistic: AVG  OCCUPANCY  Unit: PERCENT Statistic: AVG  QUEUE_ANSWER_TIME  Unit: SECONDS Statistic: AVG  QUEUED_TIME  Unit: SECONDS Statistic: MAX  SERVICE_LEVEL  Unit: PERCENT Statistic: AVG Threshold: Only \"Less than\" comparisons are supported, with the following service level thresholds: 15, 20, 25, 30, 45, 60, 90, 120, 180, 240, 300, 600  "
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.",
  "Groupings": "The grouping applied to the metrics returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values returned apply to the metrics for each queue rather than aggregated for all queues. The only supported grouping is QUEUE. If no grouping is specified, a summary of metrics for all queues is returned."
}
"""
GetMetricData(args) = connect("POST", "/metrics/historical/{InstanceId}", args)

"""
    DescribeUser()

Describes the specified user account. You can find the instance ID in the console (it’s the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.

Required Parameters
{
  "UserId": "The identifier of the user account.",
  "InstanceId": "The identifier of the Amazon Connect instance."
}
"""
DescribeUser(args) = connect("GET", "/users/{InstanceId}/{UserId}", args)

"""
    DescribeUserHierarchyGroup()

Describes the specified hierarchy group.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "HierarchyGroupId": "The identifier of the hierarchy group."
}
"""
DescribeUserHierarchyGroup(args) = connect("GET", "/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}", args)

"""
    UpdateUserSecurityProfiles()

Assigns the specified security profiles to the specified user.

Required Parameters
{
  "UserId": "The identifier of the user account.",
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "SecurityProfileIds": "The identifiers of the security profiles for the user."
}
"""
UpdateUserSecurityProfiles(args) = connect("POST", "/users/{InstanceId}/{UserId}/security-profiles", args)

"""
    ListQueues()

Provides information about the queues for the specified Amazon Connect instance.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance."
}

Optional Parameters
{
  "MaxResults": "The maximimum number of results to return per page.",
  "NextToken": "The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.",
  "QueueTypes": "The type of queue."
}
"""
ListQueues(args) = connect("GET", "/queues-summary/{InstanceId}", args)

"""
    GetContactAttributes()

Retrieves the contact attributes for the specified contact.

Required Parameters
{
  "InstanceId": "The identifier of the Amazon Connect instance.",
  "InitialContactId": "The identifier of the initial contact."
}
"""
GetContactAttributes(args) = connect("GET", "/contact/attributes/{InstanceId}/{InitialContactId}", args)
