include("../AWSServices.jl")
using .AWSServices: health

"""
    DescribeAffectedEntitiesForOrganization()

Returns a list of entities that have been affected by one or more events for one or more accounts in your organization in AWS Organizations, based on the filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service. At least one event ARN and account ID are required. Results are sorted by the lastUpdatedTime of the entity, starting with the most recent. Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the EnableHealthServiceAccessForOrganization operation from your organization's master account. 

Required Parameters
{
  "organizationEntityFilters": "A JSON set of elements including the awsAccountId and the eventArn."
}

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeAffectedEntitiesForOrganization(args) = health("DescribeAffectedEntitiesForOrganization", args)

"""
    DescribeEventTypes()

Returns the event types that meet the specified filter criteria. If no filter criteria are specified, all event types are returned, in no particular order.

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time.",
  "filter": "Values to narrow the results returned.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeEventTypes() = health("DescribeEventTypes")
DescribeEventTypes(args) = health("DescribeEventTypes", args)

"""
    DisableHealthServiceAccessForOrganization()

Calling this operation disables Health from working with AWS Organizations. This does not remove the Service Linked Role (SLR) from the the master account in your organization. Use the IAM console, API, or AWS CLI to remove the SLR if desired. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.
"""
DisableHealthServiceAccessForOrganization() = health("DisableHealthServiceAccessForOrganization")
DisableHealthServiceAccessForOrganization(args) = health("DisableHealthServiceAccessForOrganization", args)

"""
    DescribeAffectedEntities()

Returns a list of entities that have been affected by the specified events, based on the specified filter criteria. Entities can refer to individual customer resources, groups of customer resources, or any other construct, depending on the AWS service. Events that have impact beyond that of the affected entities, or where the extent of impact is unknown, include at least one entity indicating this. At least one event ARN is required. Results are sorted by the lastUpdatedTime of the entity, starting with the most recent.

Required Parameters
{
  "filter": "Values to narrow the results returned. At least one event ARN is required."
}

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeAffectedEntities(args) = health("DescribeAffectedEntities", args)

"""
    DescribeEvents()

Returns information about events that meet the specified filter criteria. Events are returned in a summary form and do not include the detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the DescribeEventDetails and DescribeAffectedEntities operations. If no filter criteria are specified, all events are returned. Results are sorted by lastModifiedTime, starting with the most recent.

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time.",
  "filter": "Values to narrow the results returned.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeEvents() = health("DescribeEvents")
DescribeEvents(args) = health("DescribeEvents", args)

"""
    DescribeEventsForOrganization()

Returns information about events across your organization in AWS Organizations, meeting the specified filter criteria. Events are returned in a summary form and do not include the accounts impacted, detailed description, any additional metadata that depends on the event type, or any affected resources. To retrieve that information, use the DescribeAffectedAccountsForOrganization, DescribeEventDetailsForOrganization, and DescribeAffectedEntitiesForOrganization operations. If no filter criteria are specified, all events across your organization are returned. Results are sorted by lastModifiedTime, starting with the most recent. Before you can call this operation, you must first enable Health to work with AWS Organizations. To do this, call the EnableHealthServiceAccessForOrganization operation from your organization's master account.

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time.",
  "filter": "Values to narrow the results returned.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeEventsForOrganization() = health("DescribeEventsForOrganization")
DescribeEventsForOrganization(args) = health("DescribeEventsForOrganization", args)

"""
    DescribeEventDetailsForOrganization()

Returns detailed information about one or more specified events for one or more accounts in your organization. Information includes standard event data (Region, service, and so on, as returned by DescribeEventsForOrganization, a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the DescribeAffectedEntitiesForOrganization operation. Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the EnableHealthServiceAccessForOrganization operation from your organization's master account.

Required Parameters
{
  "organizationEventDetailFilters": "A set of JSON elements that includes the awsAccountId and the eventArn."
}

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time."
}
"""
DescribeEventDetailsForOrganization(args) = health("DescribeEventDetailsForOrganization", args)

"""
    DescribeEntityAggregates()

Returns the number of entities that are affected by each of the specified events. If no events are specified, the counts of all affected entities are returned.

Optional Parameters
{
  "eventArns": "A list of event ARNs (unique identifiers). For example: \"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\" "
}
"""
DescribeEntityAggregates() = health("DescribeEntityAggregates")
DescribeEntityAggregates(args) = health("DescribeEntityAggregates", args)

"""
    DescribeEventDetails()

Returns detailed information about one or more specified events. Information includes standard event data (region, service, and so on, as returned by DescribeEvents), a detailed event description, and possible additional metadata that depends upon the nature of the event. Affected entities are not included; to retrieve those, use the DescribeAffectedEntities operation. If a specified event cannot be retrieved, an error message is returned for that event.

Required Parameters
{
  "eventArns": "A list of event ARNs (unique identifiers). For example: \"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\" "
}

Optional Parameters
{
  "locale": "The locale (language) to return information in. English (en) is the default and the only supported value at this time."
}
"""
DescribeEventDetails(args) = health("DescribeEventDetails", args)

"""
    EnableHealthServiceAccessForOrganization()

Calling this operation enables AWS Health to work with AWS Organizations. This applies a Service Linked Role (SLR) to the master account in the organization. To learn more about the steps in this process, visit enabling service access for AWS Health in AWS Organizations. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.
"""
EnableHealthServiceAccessForOrganization() = health("EnableHealthServiceAccessForOrganization")
EnableHealthServiceAccessForOrganization(args) = health("EnableHealthServiceAccessForOrganization", args)

"""
    DescribeHealthServiceStatusForOrganization()

This operation provides status information on enabling or disabling AWS Health to work with your organization. To call this operation, you must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization's master account.
"""
DescribeHealthServiceStatusForOrganization() = health("DescribeHealthServiceStatusForOrganization")
DescribeHealthServiceStatusForOrganization(args) = health("DescribeHealthServiceStatusForOrganization", args)

"""
    DescribeEventAggregates()

Returns the number of events of each event type (issue, scheduled change, and account notification). If no filter is specified, the counts of all events in each category are returned.

Required Parameters
{
  "aggregateField": "The only currently supported value is eventTypeCategory."
}

Optional Parameters
{
  "filter": "Values to narrow the results returned.",
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeEventAggregates(args) = health("DescribeEventAggregates", args)

"""
    DescribeAffectedAccountsForOrganization()

Returns a list of accounts in the organization from AWS Organizations that are affected by the provided event. Before you can call this operation, you must first enable AWS Health to work with AWS Organizations. To do this, call the EnableHealthServiceAccessForOrganization operation from your organization's master account.

Required Parameters
{
  "eventArn": "The unique identifier for the event. Format: arn:aws:health:event-region::event/SERVICE/EVENT_TYPE_CODE/EVENT_TYPE_PLUS_ID . Example: Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456 "
}

Optional Parameters
{
  "maxResults": "The maximum number of items to return in one batch, between 10 and 100, inclusive.",
  "nextToken": "If the results of a search are large, only a portion of the results are returned, and a nextToken pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value."
}
"""
DescribeAffectedAccountsForOrganization(args) = health("DescribeAffectedAccountsForOrganization", args)
