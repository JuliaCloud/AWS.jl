# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: cost_optimization_hub
using AWS.Compat
using AWS.UUIDs

"""
    get_preferences()
    get_preferences(params::Dict{String,<:Any})

Returns a set of preferences for an account in order to add account-specific preferences
into the service. These preferences impact how the savings associated with recommendations
are presented—estimated savings after discounts or estimated savings before discounts,
for example.

"""
function get_preferences(; aws_config::AbstractAWSConfig=global_aws_config())
    return cost_optimization_hub(
        "GetPreferences"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_preferences(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "GetPreferences", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    get_recommendation(recommendation_id)
    get_recommendation(recommendation_id, params::Dict{String,<:Any})

Returns both the current and recommended resource configuration and the estimated cost
impact for a recommendation. The recommendationId is only valid for up to a maximum of 24
hours as recommendations are refreshed daily. To retrieve the recommendationId, use the
ListRecommendations API.

# Arguments
- `recommendation_id`: The ID for the recommendation.

"""
function get_recommendation(
    recommendationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "GetRecommendation",
        Dict{String,Any}("recommendationId" => recommendationId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_recommendation(
    recommendationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cost_optimization_hub(
        "GetRecommendation",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("recommendationId" => recommendationId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_enrollment_statuses()
    list_enrollment_statuses(params::Dict{String,<:Any})

Retrieves the enrollment status for an account. It can also return the list of accounts
that are enrolled under the organization.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"accountId"`: The account ID of a member account in the organization.
- `"includeOrganizationInfo"`: Indicates whether to return the enrollment status for the
  organization.
- `"maxResults"`: The maximum number of objects that are returned for the request.
- `"nextToken"`: The token to retrieve the next set of results.
"""
function list_enrollment_statuses(; aws_config::AbstractAWSConfig=global_aws_config())
    return cost_optimization_hub(
        "ListEnrollmentStatuses"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_enrollment_statuses(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "ListEnrollmentStatuses",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_recommendation_summaries(group_by)
    list_recommendation_summaries(group_by, params::Dict{String,<:Any})

Returns a concise representation of savings estimates for resources. Also returns de-duped
savings across different types of recommendations.  The following filters are not supported
for this API: recommendationIds, resourceArns, and resourceIds.

# Arguments
- `group_by`: The grouping of recommendations by a dimension.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filter"`:
- `"maxResults"`: The maximum number of recommendations to be returned for the request.
- `"metrics"`: Additional metrics to be returned for the request. The only valid value is
  savingsPercentage.
- `"nextToken"`: The token to retrieve the next set of results.
"""
function list_recommendation_summaries(
    groupBy; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "ListRecommendationSummaries",
        Dict{String,Any}("groupBy" => groupBy);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_recommendation_summaries(
    groupBy, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "ListRecommendationSummaries",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("groupBy" => groupBy), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_recommendations()
    list_recommendations(params::Dict{String,<:Any})

Returns a list of recommendations.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filter"`: The constraints that you want all returned recommendations to match.
- `"includeAllRecommendations"`: List of all recommendations for a resource, or a single
  recommendation if de-duped by resourceId.
- `"maxResults"`: The maximum number of recommendations that are returned for the request.
- `"nextToken"`: The token to retrieve the next set of results.
- `"orderBy"`: The ordering of recommendations by a dimension.
"""
function list_recommendations(; aws_config::AbstractAWSConfig=global_aws_config())
    return cost_optimization_hub(
        "ListRecommendations"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_recommendations(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "ListRecommendations",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_enrollment_status(status)
    update_enrollment_status(status, params::Dict{String,<:Any})

Updates the enrollment (opt in and opt out) status of an account to the Cost Optimization
Hub service. If the account is a management account or delegated administrator of an
organization, this action can also be used to enroll member accounts of the organization.
You must have the appropriate permissions to opt in to Cost Optimization Hub and to view
its recommendations. When you opt in, Cost Optimization Hub automatically creates a
service-linked role in your account to access its data.

# Arguments
- `status`: Sets the account status.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"includeMemberAccounts"`: Indicates whether to enroll member accounts of the
  organization if the account is the management account or delegated administrator.
"""
function update_enrollment_status(status; aws_config::AbstractAWSConfig=global_aws_config())
    return cost_optimization_hub(
        "UpdateEnrollmentStatus",
        Dict{String,Any}("status" => status);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_enrollment_status(
    status, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "UpdateEnrollmentStatus",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("status" => status), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_preferences()
    update_preferences(params::Dict{String,<:Any})

Updates a set of preferences for an account in order to add account-specific preferences
into the service. These preferences impact how the savings associated with recommendations
are presented.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"memberAccountDiscountVisibility"`: Sets the \"member account discount visibility\"
  preference.
- `"savingsEstimationMode"`: Sets the \"savings estimation mode\" preference.
"""
function update_preferences(; aws_config::AbstractAWSConfig=global_aws_config())
    return cost_optimization_hub(
        "UpdatePreferences"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function update_preferences(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cost_optimization_hub(
        "UpdatePreferences", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
