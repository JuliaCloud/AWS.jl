include("../AWSServices.jl")
using .AWSServices: sns

"""
    ListTagsForResource()

List all tags added to the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the Amazon Simple Notification Service Developer Guide.

Required Parameters
{
  "ResourceArn": "The ARN of the topic for which to list tags."
}
"""
ListTagsForResource(args) = sns("ListTagsForResource", args)

"""
    RemovePermission()

Removes a statement from a topic's access control policy.

Required Parameters
{
  "TopicArn": "The ARN of the topic whose access control policy you wish to modify.",
  "Label": "The unique label of the statement you want to remove."
}
"""
RemovePermission(args) = sns("RemovePermission", args)

"""
    SetTopicAttributes()

Allows a topic owner to set an attribute of the topic to a new value.

Required Parameters
{
  "TopicArn": "The ARN of the topic to modify.",
  "AttributeName": "A map of attributes with their corresponding values. The following lists the names, descriptions, and values of the special request parameters that the SetTopicAttributes action uses:    DeliveryPolicy – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.    DisplayName – The display name to use for a topic with SMS subscriptions.    Policy – The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.   The following attribute applies only to server-side-encryption:    KmsMasterKeyId - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see Key Terms. For more examples, see KeyId in the AWS Key Management Service API Reference.   "
}

Optional Parameters
{
  "AttributeValue": "The new value for the attribute."
}
"""
SetTopicAttributes(args) = sns("SetTopicAttributes", args)

"""
    GetEndpointAttributes()

Retrieves the endpoint attributes for a device on one of the supported push notification services, such as FCM and APNS. For more information, see Using Amazon SNS Mobile Push Notifications. 

Required Parameters
{
  "EndpointArn": "EndpointArn for GetEndpointAttributes input."
}
"""
GetEndpointAttributes(args) = sns("GetEndpointAttributes", args)

"""
    GetSubscriptionAttributes()

Returns all of the properties of a subscription.

Required Parameters
{
  "SubscriptionArn": "The ARN of the subscription whose properties you want to get."
}
"""
GetSubscriptionAttributes(args) = sns("GetSubscriptionAttributes", args)

"""
    CreatePlatformApplication()

Creates a platform application object for one of the supported push notification services, such as APNS and FCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when using the CreatePlatformApplication action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate". For FCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is "client id". The PlatformCredential is also received from the notification service. For WNS, PlatformPrincipal is "Package Security Identifier". For MPNS, PlatformPrincipal is "TLS certificate". For Baidu, PlatformPrincipal is "API key". For APNS/APNS_SANDBOX, PlatformCredential is "private key". For FCM, PlatformCredential is "API key". For ADM, PlatformCredential is "client secret". For WNS, PlatformCredential is "secret key". For MPNS, PlatformCredential is "private key". For Baidu, PlatformCredential is "secret key". The PlatformApplicationArn that is returned when using CreatePlatformApplication is then used as an attribute for the CreatePlatformEndpoint action.

Required Parameters
{
  "Attributes": "For a list of attributes, see SetPlatformApplicationAttributes ",
  "Platform": "The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and FCM (Firebase Cloud Messaging).",
  "Name": "Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long."
}
"""
CreatePlatformApplication(args) = sns("CreatePlatformApplication", args)

"""
    CheckIfPhoneNumberIsOptedOut()

Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out. To resume sending messages, you can opt in the number by using the OptInPhoneNumber action.

Required Parameters
{
  "phoneNumber": "The phone number for which you want to check the opt out status."
}
"""
CheckIfPhoneNumberIsOptedOut(args) = sns("CheckIfPhoneNumberIsOptedOut", args)

"""
    ListTopics()

Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a NextToken is also returned. Use the NextToken parameter in a new ListTopics call to get further results. This action is throttled at 30 transactions per second (TPS).

Optional Parameters
{
  "NextToken": "Token returned by the previous ListTopics request."
}
"""
ListTopics() = sns("ListTopics")
ListTopics(args) = sns("ListTopics", args)

"""
    ListSubscriptions()

Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a NextToken is also returned. Use the NextToken parameter in a new ListSubscriptions call to get further results. This action is throttled at 30 transactions per second (TPS).

Optional Parameters
{
  "NextToken": "Token returned by the previous ListSubscriptions request."
}
"""
ListSubscriptions() = sns("ListSubscriptions")
ListSubscriptions(args) = sns("ListSubscriptions", args)

"""
    SetSMSAttributes()

Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports. You can override some of these settings for a single message when you use the Publish action with the MessageAttributes.entry.N parameter. For more information, see Sending an SMS Message in the Amazon SNS Developer Guide.

Required Parameters
{
  "attributes": "The default settings for sending SMS messages from your account. You can set values for the following attribute names:  MonthlySpendLimit – The maximum amount in USD that you are willing to spend each month to send SMS messages. When Amazon SNS determines that sending an SMS message would incur a cost that exceeds this limit, it stops sending SMS messages within minutes.  Amazon SNS stops sending SMS messages within minutes of the limit being crossed. During that interval, if you continue to send SMS messages, you will incur costs that exceed your limit.  By default, the spend limit is set to the maximum allowed by Amazon SNS. If you want to raise the limit, submit an SNS Limit Increase case. For New limit value, enter your desired monthly spend limit. In the Use Case Description field, explain that you are requesting an SMS monthly spend limit increase.  DeliveryStatusIAMRole – The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs. For each SMS message that you send, Amazon SNS writes a log that includes the message price, the success or failure status, the reason for failure (if the message failed), the message dwell time, and other information.  DeliveryStatusSuccessSamplingRate – The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value can be an integer from 0 - 100. For example, to write logs only for failed deliveries, set this value to 0. To write logs for 10% of your successful deliveries, set it to 10.  DefaultSenderID – A string, such as your business brand, that is displayed as the sender on the receiving device. Support for sender IDs varies by country. The sender ID can be 1 - 11 alphanumeric characters, and it must contain at least one letter.  DefaultSMSType – The type of SMS message that you will send by default. You can assign the following values:    Promotional – (Default) Noncritical messages, such as marketing messages. Amazon SNS optimizes the message delivery to incur the lowest cost.    Transactional – Critical messages that support customer transactions, such as one-time passcodes for multi-factor authentication. Amazon SNS optimizes the message delivery to achieve the highest reliability.    UsageReportS3Bucket – The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a CSV file to the bucket. The report includes the following information for each SMS message that was successfully delivered by your account:   Time that the message was published (in UTC)   Message ID   Destination phone number   Message type   Delivery status   Message price (in USD)   Part number (a message is split into multiple parts if it is too long for a single message)   Total number of parts   To receive the report, the bucket must have a policy that allows the Amazon SNS service principle to perform the s3:PutObject and s3:GetBucketLocation actions. For an example bucket policy and usage report, see Monitoring SMS Activity in the Amazon SNS Developer Guide."
}
"""
SetSMSAttributes(args) = sns("SetSMSAttributes", args)

"""
    SetEndpointAttributes()

Sets the attributes for an endpoint for a device on one of the supported push notification services, such as FCM and APNS. For more information, see Using Amazon SNS Mobile Push Notifications. 

Required Parameters
{
  "Attributes": "A map of the endpoint attributes. Attributes in this map include the following:    CustomUserData – arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.    Enabled – flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.    Token – device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.  ",
  "EndpointArn": "EndpointArn used for SetEndpointAttributes action."
}
"""
SetEndpointAttributes(args) = sns("SetEndpointAttributes", args)

"""
    DeleteTopic()

Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.

Required Parameters
{
  "TopicArn": "The ARN of the topic you want to delete."
}
"""
DeleteTopic(args) = sns("DeleteTopic", args)

"""
    DeletePlatformApplication()

Deletes a platform application object for one of the supported push notification services, such as APNS and FCM. For more information, see Using Amazon SNS Mobile Push Notifications. 

Required Parameters
{
  "PlatformApplicationArn": "PlatformApplicationArn of platform application object to delete."
}
"""
DeletePlatformApplication(args) = sns("DeletePlatformApplication", args)

"""
    GetSMSAttributes()

Returns the settings for sending SMS messages from your account. These settings are set with the SetSMSAttributes action.

Optional Parameters
{
  "attributes": "A list of the individual attribute names, such as MonthlySpendLimit, for which you want values. For all attribute names, see SetSMSAttributes. If you don't use this parameter, Amazon SNS returns all SMS attributes."
}
"""
GetSMSAttributes() = sns("GetSMSAttributes")
GetSMSAttributes(args) = sns("GetSMSAttributes", args)

"""
    TagResource()

Add tags to the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the Amazon SNS Developer Guide. When you use topic tags, keep the following guidelines in mind:   Adding more than 50 tags to a topic isn't recommended.   Tags don't have any semantic meaning. Amazon SNS interprets tags as character strings.   Tags are case-sensitive.   A new tag with a key identical to that of an existing tag overwrites the existing tag.   Tagging actions are limited to 10 TPS per AWS account, per AWS region. If your application requires a higher throughput, file a technical support request.  

Required Parameters
{
  "ResourceArn": "The ARN of the topic to which to add tags.",
  "Tags": "The tags to be added to the specified topic. A tag consists of a required key and an optional value."
}
"""
TagResource(args) = sns("TagResource", args)

"""
    CreatePlatformEndpoint()

Creates an endpoint for a device and mobile app on one of the supported push notification services, such as FCM and APNS. CreatePlatformEndpoint requires the PlatformApplicationArn that is returned from CreatePlatformApplication. The EndpointArn that is returned when using CreatePlatformEndpoint can then be used by the Publish action to send a message to a mobile app or by the Subscribe action for subscription to a topic. The CreatePlatformEndpoint action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see Using Amazon SNS Mobile Push Notifications.  When using CreatePlatformEndpoint with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see Creating an Amazon SNS Endpoint for Baidu. 

Required Parameters
{
  "Token": "Unique identifier created by the notification service for an app on a device. The specific name for Token will vary, depending on which notification service is being used. For example, when using APNS as the notification service, you need the device token. Alternatively, when using FCM or ADM, the device token equivalent is called the registration ID.",
  "PlatformApplicationArn": "PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint."
}

Optional Parameters
{
  "Attributes": "For a list of attributes, see SetEndpointAttributes.",
  "CustomUserData": "Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB."
}
"""
CreatePlatformEndpoint(args) = sns("CreatePlatformEndpoint", args)

"""
    Subscribe()

Prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the ConfirmSubscription action with the token from the confirmation message. Confirmation tokens are valid for three days. This action is throttled at 100 transactions per second (TPS).

Required Parameters
{
  "TopicArn": "The ARN of the topic you want to subscribe to.",
  "Protocol": "The protocol you want to use. Supported protocols include:    http – delivery of JSON-encoded message via HTTP POST    https – delivery of JSON-encoded message via HTTPS POST    email – delivery of message via SMTP    email-json – delivery of JSON-encoded message via SMTP    sms – delivery of message via SMS    sqs – delivery of JSON-encoded message to an Amazon SQS queue    application – delivery of JSON-encoded message to an EndpointArn for a mobile app and device.    lambda – delivery of JSON-encoded message to an Amazon Lambda function.  "
}

Optional Parameters
{
  "Endpoint": "The endpoint that you want to receive notifications. Endpoints vary by protocol:   For the http protocol, the endpoint is an URL beginning with http://    For the https protocol, the endpoint is a URL beginning with https://    For the email protocol, the endpoint is an email address   For the email-json protocol, the endpoint is an email address   For the sms protocol, the endpoint is a phone number of an SMS-enabled device   For the sqs protocol, the endpoint is the ARN of an Amazon SQS queue   For the application protocol, the endpoint is the EndpointArn of a mobile app and device.   For the lambda protocol, the endpoint is the ARN of an Amazon Lambda function.  ",
  "ReturnSubscriptionArn": "Sets whether the response from the Subscribe request includes the subscription ARN, even if the subscription is not yet confirmed.   If you have the subscription ARN returned, the response includes the ARN in all cases, even if the subscription is not yet confirmed.   If you don't have the subscription ARN returned, in addition to the ARN for confirmed subscriptions, the response also includes the pending subscription ARN value for subscriptions that aren't yet confirmed. A subscription becomes confirmed when the subscriber calls the ConfirmSubscription action with a confirmation token.   If you set this parameter to true, . The default value is false.",
  "Attributes": "A map of attributes with their corresponding values. The following lists the names, descriptions, and values of the special request parameters that the SetTopicAttributes action uses:    DeliveryPolicy – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.    FilterPolicy – The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.    RawMessageDelivery – When set to true, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.    RedrivePolicy – When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.  "
}
"""
Subscribe(args) = sns("Subscribe", args)

"""
    UntagResource()

Remove tags from the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the Amazon SNS Developer Guide.

Required Parameters
{
  "ResourceArn": "The ARN of the topic from which to remove tags.",
  "TagKeys": "The list of tag keys to remove from the specified topic."
}
"""
UntagResource(args) = sns("UntagResource", args)

"""
    ListPlatformApplications()

Lists the platform application objects for the supported push notification services, such as APNS and FCM. The results for ListPlatformApplications are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call ListPlatformApplications using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see Using Amazon SNS Mobile Push Notifications.  This action is throttled at 15 transactions per second (TPS).

Optional Parameters
{
  "NextToken": "NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results."
}
"""
ListPlatformApplications() = sns("ListPlatformApplications")
ListPlatformApplications(args) = sns("ListPlatformApplications", args)

"""
    ListSubscriptionsByTopic()

Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a NextToken is also returned. Use the NextToken parameter in a new ListSubscriptionsByTopic call to get further results. This action is throttled at 30 transactions per second (TPS).

Required Parameters
{
  "TopicArn": "The ARN of the topic for which you wish to find subscriptions."
}

Optional Parameters
{
  "NextToken": "Token returned by the previous ListSubscriptionsByTopic request."
}
"""
ListSubscriptionsByTopic(args) = sns("ListSubscriptionsByTopic", args)

"""
    OptInPhoneNumber()

Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number. You can opt in a phone number only once every 30 days.

Required Parameters
{
  "phoneNumber": "The phone number to opt in."
}
"""
OptInPhoneNumber(args) = sns("OptInPhoneNumber", args)

"""
    CreateTopic()

Creates a topic to which notifications can be published. Users can create at most 100,000 topics. For more information, see https://aws.amazon.com/sns. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.

Required Parameters
{
  "Name": "The name of the topic you want to create. Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long."
}

Optional Parameters
{
  "Tags": "The list of tags to add to a new topic.  To be able to tag a topic on creation, you must have the sns:CreateTopic and sns:TagResource permissions. ",
  "Attributes": "A map of attributes with their corresponding values. The following lists the names, descriptions, and values of the special request parameters that the CreateTopic action uses:    DeliveryPolicy – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.    DisplayName – The display name to use for a topic with SMS subscriptions.    Policy – The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.   The following attribute applies only to server-side-encryption:    KmsMasterKeyId - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see Key Terms. For more examples, see KeyId in the AWS Key Management Service API Reference.   "
}
"""
CreateTopic(args) = sns("CreateTopic", args)

"""
    GetPlatformApplicationAttributes()

Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and FCM. For more information, see Using Amazon SNS Mobile Push Notifications. 

Required Parameters
{
  "PlatformApplicationArn": "PlatformApplicationArn for GetPlatformApplicationAttributesInput."
}
"""
GetPlatformApplicationAttributes(args) = sns("GetPlatformApplicationAttributes", args)

"""
    GetTopicAttributes()

Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user.

Required Parameters
{
  "TopicArn": "The ARN of the topic whose properties you want to get."
}
"""
GetTopicAttributes(args) = sns("GetTopicAttributes", args)

"""
    SetPlatformApplicationAttributes()

Sets the attributes of the platform application object for the supported push notification services, such as APNS and FCM. For more information, see Using Amazon SNS Mobile Push Notifications. For information on configuring attributes for message delivery status, see Using Amazon SNS Application Attributes for Message Delivery Status. 

Required Parameters
{
  "Attributes": "A map of the platform application attributes. Attributes in this map include the following:    PlatformCredential – The credential received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is private key. For FCM, PlatformCredential is \"API key\". For ADM, PlatformCredential is \"client secret\".    PlatformPrincipal – The principal received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is SSL certificate. For FCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is \"client id\".    EventEndpointCreated – Topic ARN to which EndpointCreated event notifications should be sent.    EventEndpointDeleted – Topic ARN to which EndpointDeleted event notifications should be sent.    EventEndpointUpdated – Topic ARN to which EndpointUpdate event notifications should be sent.    EventDeliveryFailure – Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.    SuccessFeedbackRoleArn – IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.    FailureFeedbackRoleArn – IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.    SuccessFeedbackSampleRate – Sample rate percentage (0-100) of successfully delivered messages.  ",
  "PlatformApplicationArn": "PlatformApplicationArn for SetPlatformApplicationAttributes action."
}
"""
SetPlatformApplicationAttributes(args) = sns("SetPlatformApplicationAttributes", args)

"""
    ListEndpointsByPlatformApplication()

Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as FCM and APNS. The results for ListEndpointsByPlatformApplication are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call ListEndpointsByPlatformApplication again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see Using Amazon SNS Mobile Push Notifications.  This action is throttled at 30 transactions per second (TPS).

Required Parameters
{
  "PlatformApplicationArn": "PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action."
}

Optional Parameters
{
  "NextToken": "NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results."
}
"""
ListEndpointsByPlatformApplication(args) = sns("ListEndpointsByPlatformApplication", args)

"""
    SetSubscriptionAttributes()

Allows a subscription owner to set an attribute of the subscription to a new value.

Required Parameters
{
  "AttributeName": "A map of attributes with their corresponding values. The following lists the names, descriptions, and values of the special request parameters that the SetTopicAttributes action uses:    DeliveryPolicy – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.    FilterPolicy – The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.    RawMessageDelivery – When set to true, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.    RedrivePolicy – When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.  ",
  "SubscriptionArn": "The ARN of the subscription to modify."
}

Optional Parameters
{
  "AttributeValue": "The new value for the attribute in JSON format."
}
"""
SetSubscriptionAttributes(args) = sns("SetSubscriptionAttributes", args)

"""
    DeleteEndpoint()

Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see Using Amazon SNS Mobile Push Notifications.  When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.

Required Parameters
{
  "EndpointArn": "EndpointArn of endpoint to delete."
}
"""
DeleteEndpoint(args) = sns("DeleteEndpoint", args)

"""
    Unsubscribe()

Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the Unsubscribe call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the Unsubscribe request was unintended. This action is throttled at 100 transactions per second (TPS).

Required Parameters
{
  "SubscriptionArn": "The ARN of the subscription to be deleted."
}
"""
Unsubscribe(args) = sns("Unsubscribe", args)

"""
    ConfirmSubscription()

Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier Subscribe action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the AuthenticateOnUnsubscribe flag is set to "true".

Required Parameters
{
  "TopicArn": "The ARN of the topic for which you wish to confirm a subscription.",
  "Token": "Short-lived token sent to an endpoint during the Subscribe action."
}

Optional Parameters
{
  "AuthenticateOnUnsubscribe": "Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is true and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe action requires AWS authentication. "
}
"""
ConfirmSubscription(args) = sns("ConfirmSubscription", args)

"""
    ListPhoneNumbersOptedOut()

Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them. The results for ListPhoneNumbersOptedOut are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a NextToken string will be returned. To receive the next page, you call ListPhoneNumbersOptedOut again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null.

Optional Parameters
{
  "nextToken": "A NextToken string is used when you call the ListPhoneNumbersOptedOut action to retrieve additional records that are available after the first page of results."
}
"""
ListPhoneNumbersOptedOut() = sns("ListPhoneNumbersOptedOut")
ListPhoneNumbersOptedOut(args) = sns("ListPhoneNumbersOptedOut", args)

"""
    Publish()

Sends a message to an Amazon SNS topic or sends a text message (SMS message) directly to a phone number.  If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is subscribed to the topic. The format of the message depends on the notification protocol for each subscribed endpoint. When a messageId is returned, the message has been saved and Amazon SNS will attempt to deliver it shortly. To use the Publish action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the CreatePlatformEndpoint action.  For more information about formatting messages, see Send Custom Platform-Specific Payloads in Messages to Mobile Devices. 

Required Parameters
{
  "Message": "The message you want to send. If you are publishing to a topic and you want to send the same message to all transport protocols, include the text of the message as a String value. If you want to send different messages for each transport protocol, set the value of the MessageStructure parameter to json and use a JSON object for the Message parameter.   Constraints:   With the exception of SMS, messages must be UTF-8 encoded strings and at most 256 KB in size (262,144 bytes, not 262,144 characters).   For SMS, each message can contain up to 140 characters. This character limit depends on the encoding schema. For example, an SMS message can contain 160 GSM characters, 140 ASCII characters, or 70 UCS-2 characters. If you publish a message that exceeds this size limit, Amazon SNS sends the message as multiple messages, each fitting within the size limit. Messages aren't truncated mid-word but are cut off at whole-word boundaries. The total size limit for a single SMS Publish action is 1,600 characters.   JSON-specific constraints:   Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values.   The values will be parsed (unescaped) before they are used in outgoing messages.   Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).   Values have a minimum length of 0 (the empty string, \"\", is allowed).   Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).   Non-string values will cause the key to be ignored.   Keys that do not correspond to supported transport protocols are ignored.   Duplicate keys are not allowed.   Failure to parse or validate any key or value in the message will cause the Publish call to return an error (no partial delivery).  "
}

Optional Parameters
{
  "Subject": "Optional parameter to be used as the \"Subject\" line when the message is delivered to email endpoints. This field will also be included, if present, in the standard JSON messages delivered to other endpoints. Constraints: Subjects must be ASCII text that begins with a letter, number, or punctuation mark; must not include line breaks or control characters; and must be less than 100 characters long.",
  "TopicArn": "The topic you want to publish to. If you don't specify a value for the TopicArn parameter, you must specify a value for the PhoneNumber or TargetArn parameters.",
  "PhoneNumber": "The phone number to which you want to deliver an SMS message. Use E.164 format. If you don't specify a value for the PhoneNumber parameter, you must specify a value for the TargetArn or TopicArn parameters.",
  "MessageAttributes": "Message attributes for Publish action.",
  "TargetArn": "If you don't specify a value for the TargetArn parameter, you must specify a value for the PhoneNumber or TopicArn parameters.",
  "MessageStructure": "Set MessageStructure to json if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set MessageStructure to json, the value of the Message parameter must:    be a syntactically valid JSON object; and   contain at least a top-level JSON key of \"default\" with a value that is a string.   You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., \"http\"). Valid value: json "
}
"""
Publish(args) = sns("Publish", args)

"""
    AddPermission()

Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.

Required Parameters
{
  "TopicArn": "The ARN of the topic whose access control policy you wish to modify.",
  "Label": "A unique identifier for the new policy statement.",
  "ActionName": "The action you want to allow for the specified principal(s). Valid values: Any Amazon SNS action name, for example Publish.",
  "AWSAccountId": "The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed up for this service."
}
"""
AddPermission(args) = sns("AddPermission", args)