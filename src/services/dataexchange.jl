# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dataexchange
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "action" => "Action",
    "finalized" => "Finalized",
    "next_token" => "nextToken",
    "name" => "Name",
    "description" => "Description",
    "max_results" => "maxResults",
    "origin" => "origin",
    "comment" => "Comment",
    "event_source_id" => "eventSourceId",
    "data_set_id" => "dataSetId",
    "revision_id" => "revisionId",
    "tags" => "Tags",
)

"""
    cancel_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function cancel_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/v1/jobs/$(JobId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_data_set(asset_type, description, name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation creates a data set.

# Arguments
- `asset_type`: The type of asset that is added to a data set.
- `description`: A description for the data set. This value can be up to 16,348 characters
  long.
- `name`: The name of the data set.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"tags"`: A data set tag is an optional label that you can assign to a data set when you
  create it. Each tag consists of a key and an optional value, both of which you define. When
  you use tagging, you can also use tag-based access control in IAM policies to control
  access to these data sets and revisions.
"""
function create_data_set(
    AssetType,
    Description,
    Name;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "POST",
        "/v1/data-sets",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AssetType" => AssetType, "Description" => Description, "Name" => Name
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_event_action(action, event; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation creates an event action.

# Arguments
- `action`: What occurs after a certain event.
- `event`: What occurs to start an action.

"""
function create_event_action(
    Action, Event; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "POST",
        "/v1/event-actions",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Action" => Action, "Event" => Event), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_job(details, type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation creates a job.

# Arguments
- `details`: The details for the CreateJob request.
- `type`: The type of job to be created.

"""
function create_job(
    Details, Type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "POST",
        "/v1/jobs",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Details" => Details, "Type" => Type), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_revision(data_set_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation creates a revision for a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"comment"`: An optional comment about the revision.
- `"tags"`: A revision tag is an optional label that you can assign to a revision when you
  create it. Each tag consists of a key and an optional value, both of which you define. When
  you use tagging, you can also use tag-based access control in IAM policies to control
  access to these data sets and revisions.
"""
function create_revision(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "POST",
        "/v1/data-sets/$(DataSetId)/revisions",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_asset(asset_id, data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation deletes an asset.

# Arguments
- `asset_id`: The unique identifier for an asset.
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function delete_asset(
    AssetId,
    DataSetId,
    RevisionId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_data_set(data_set_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation deletes a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

"""
function delete_data_set(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_event_action(event_action_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation deletes the event action.

# Arguments
- `event_action_id`: The unique identifier for the event action.

"""
function delete_event_action(
    EventActionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/v1/event-actions/$(EventActionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_revision(data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation deletes a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function delete_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_asset(asset_id, data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation returns information about an asset.

# Arguments
- `asset_id`: The unique identifier for an asset.
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function get_asset(
    AssetId,
    DataSetId,
    RevisionId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_data_set(data_set_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation returns information about a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

"""
function get_data_set(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_event_action(event_action_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation retrieves information about an event action.

# Arguments
- `event_action_id`: The unique identifier for the event action.

"""
function get_event_action(
    EventActionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/event-actions/$(EventActionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation returns information about a job.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function get_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/jobs/$(JobId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_revision(data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation returns information about a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function get_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_data_set_revisions(data_set_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists a data set's revisions sorted by CreatedAt in descending order.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results returned by a single call.
- `"next_token"`: The token value retrieved from a previous call to access the next page of
  results.
"""
function list_data_set_revisions(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_data_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists your data sets. When listing by origin OWNED, results are sorted by
CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the
maxResults parameter is ignored.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results returned by a single call.
- `"next_token"`: The token value retrieved from a previous call to access the next page of
  results.
- `"origin"`: A property that defines the data set as OWNED by the account (for providers)
  or ENTITLED to the account (for subscribers).
"""
function list_data_sets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_event_actions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists your event actions.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"event_source_id"`: The unique identifier for the event source.
- `"max_results"`: The maximum number of results returned by a single call.
- `"next_token"`: The token value retrieved from a previous call to access the next page of
  results.
"""
function list_event_actions(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/event-actions",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists your jobs sorted by CreatedAt in descending order.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"data_set_id"`: The unique identifier for a data set.
- `"max_results"`: The maximum number of results returned by a single call.
- `"next_token"`: The token value retrieved from a previous call to access the next page of
  results.
- `"revision_id"`: The unique identifier for a revision.
"""
function list_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET", "/v1/jobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_revision_assets(data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists a revision's assets sorted alphabetically in descending order.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results returned by a single call.
- `"next_token"`: The token value retrieved from a previous call to access the next page of
  results.
"""
function list_revision_assets(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource-arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation lists the tags on the resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.

"""
function list_tags_for_resource(
    resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "GET",
        "/tags/$(resource-arn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation starts a job.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function start_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "PATCH",
        "/v1/jobs/$(JobId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource-arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation tags a resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
- `tags`: A label that consists of a customer-defined key and an optional value.

"""
function tag_resource(
    resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "POST",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource-arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation removes one or more tags from a resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
- `tag_keys`: The key tags.

"""
function untag_resource(
    resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "DELETE",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_asset(asset_id, data_set_id, name, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation updates an asset.

# Arguments
- `asset_id`: The unique identifier for an asset.
- `data_set_id`: The unique identifier for a data set.
- `name`: The name of the asset. When importing from Amazon S3, the S3 object key is used
  as the asset name. When exporting to Amazon S3, the asset name is used as default target S3
  object key.
- `revision_id`: The unique identifier for a revision.

"""
function update_asset(
    AssetId,
    DataSetId,
    Name,
    RevisionId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_data_set(data_set_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation updates a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: The description for the data set.
- `"name"`: The name of the data set.
"""
function update_data_set(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_event_action(event_action_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation updates the event action.

# Arguments
- `event_action_id`: The unique identifier for the event action.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"action"`: What occurs after a certain event.
"""
function update_event_action(
    EventActionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "PATCH",
        "/v1/event-actions/$(EventActionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_revision(data_set_id, revision_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This operation updates a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"comment"`: An optional comment about the revision.
- `"finalized"`: Finalizing a revision tells AWS Data Exchange that your changes to the
  assets in the revision are complete. After it's in this read-only state, you can publish
  the revision to your products.
"""
function update_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
