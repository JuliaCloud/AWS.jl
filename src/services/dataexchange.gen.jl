# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dataexchange
using AWS.Compat
using AWS.UUIDs

"""
    cancel_job(job_id)
    cancel_job(job_id, params::Dict{String,<:Any})

This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function cancel_job(JobId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("DELETE", "/v1/jobs/$(JobId)"; aws_config=aws_config)
end
function cancel_job(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("DELETE", "/v1/jobs/$(JobId)", params; aws_config=aws_config)
end

"""
    create_data_set(asset_type, description, name)
    create_data_set(asset_type, description, name, params::Dict{String,<:Any})

This operation creates a data set.

# Arguments
- `asset_type`: The type of file your data is stored in. Currently, the supported asset
  type is S3_SNAPSHOT.
- `description`: A description for the data set. This value can be up to 16,348 characters
  long.
- `name`: The name of the data set.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Tags"`: A data set tag is an optional label that you can assign to a data set when you
  create it. Each tag consists of a key and an optional value, both of which you define. When
  you use tagging, you can also use tag-based access control in IAM policies to control
  access to these data sets and revisions.
"""
function create_data_set(
    AssetType, Description, Name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "POST",
        "/v1/data-sets",
        Dict{String,Any}(
            "AssetType" => AssetType, "Description" => Description, "Name" => Name
        );
        aws_config=aws_config,
    )
end
function create_data_set(
    AssetType,
    Description,
    Name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
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
    )
end

"""
    create_job(details, type)
    create_job(details, type, params::Dict{String,<:Any})

This operation creates a job.

# Arguments
- `details`: The details for the CreateJob request.
- `type`: The type of job to be created.

"""
function create_job(Details, Type; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange(
        "POST",
        "/v1/jobs",
        Dict{String,Any}("Details" => Details, "Type" => Type);
        aws_config=aws_config,
    )
end
function create_job(
    Details,
    Type,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "POST",
        "/v1/jobs",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Details" => Details, "Type" => Type), params
            ),
        );
        aws_config=aws_config,
    )
end

"""
    create_revision(data_set_id)
    create_revision(data_set_id, params::Dict{String,<:Any})

This operation creates a revision for a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Comment"`: An optional comment about the revision.
- `"Tags"`: A revision tag is an optional label that you can assign to a revision when you
  create it. Each tag consists of a key and an optional value, both of which you define. When
  you use tagging, you can also use tag-based access control in IAM policies to control
  access to these data sets and revisions.
"""
function create_revision(DataSetId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange(
        "POST", "/v1/data-sets/$(DataSetId)/revisions"; aws_config=aws_config
    )
end
function create_revision(
    DataSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "POST", "/v1/data-sets/$(DataSetId)/revisions", params; aws_config=aws_config
    )
end

"""
    delete_asset(asset_id, data_set_id, revision_id)
    delete_asset(asset_id, data_set_id, revision_id, params::Dict{String,<:Any})

This operation deletes an asset.

# Arguments
- `asset_id`: The unique identifier for an asset.
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function delete_asset(
    AssetId, DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)";
        aws_config=aws_config,
    )
end
function delete_asset(
    AssetId,
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        params;
        aws_config=aws_config,
    )
end

"""
    delete_data_set(data_set_id)
    delete_data_set(data_set_id, params::Dict{String,<:Any})

This operation deletes a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

"""
function delete_data_set(DataSetId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("DELETE", "/v1/data-sets/$(DataSetId)"; aws_config=aws_config)
end
function delete_data_set(
    DataSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "DELETE", "/v1/data-sets/$(DataSetId)", params; aws_config=aws_config
    )
end

"""
    delete_revision(data_set_id, revision_id)
    delete_revision(data_set_id, revision_id, params::Dict{String,<:Any})

This operation deletes a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function delete_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)";
        aws_config=aws_config,
    )
end
function delete_revision(
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "DELETE",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
    )
end

"""
    get_asset(asset_id, data_set_id, revision_id)
    get_asset(asset_id, data_set_id, revision_id, params::Dict{String,<:Any})

This operation returns information about an asset.

# Arguments
- `asset_id`: The unique identifier for an asset.
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function get_asset(
    AssetId, DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)";
        aws_config=aws_config,
    )
end
function get_asset(
    AssetId,
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        params;
        aws_config=aws_config,
    )
end

"""
    get_data_set(data_set_id)
    get_data_set(data_set_id, params::Dict{String,<:Any})

This operation returns information about a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

"""
function get_data_set(DataSetId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("GET", "/v1/data-sets/$(DataSetId)"; aws_config=aws_config)
end
function get_data_set(
    DataSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange("GET", "/v1/data-sets/$(DataSetId)", params; aws_config=aws_config)
end

"""
    get_job(job_id)
    get_job(job_id, params::Dict{String,<:Any})

This operation returns information about a job.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function get_job(JobId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("GET", "/v1/jobs/$(JobId)"; aws_config=aws_config)
end
function get_job(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("GET", "/v1/jobs/$(JobId)", params; aws_config=aws_config)
end

"""
    get_revision(data_set_id, revision_id)
    get_revision(data_set_id, revision_id, params::Dict{String,<:Any})

This operation returns information about a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

"""
function get_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "GET", "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)"; aws_config=aws_config
    )
end
function get_revision(
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
    )
end

"""
    list_data_set_revisions(data_set_id)
    list_data_set_revisions(data_set_id, params::Dict{String,<:Any})

This operation lists a data set's revisions sorted by CreatedAt in descending order.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results returned by a single call.
- `"nextToken"`: The token value retrieved from a previous call to access the next page of
  results.
"""
function list_data_set_revisions(
    DataSetId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "GET", "/v1/data-sets/$(DataSetId)/revisions"; aws_config=aws_config
    )
end
function list_data_set_revisions(
    DataSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "GET", "/v1/data-sets/$(DataSetId)/revisions", params; aws_config=aws_config
    )
end

"""
    list_data_sets()
    list_data_sets(params::Dict{String,<:Any})

This operation lists your data sets. When listing by origin OWNED, results are sorted by
CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the
maxResults parameter is ignored.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results returned by a single call.
- `"nextToken"`: The token value retrieved from a previous call to access the next page of
  results.
- `"origin"`: A property that defines the data set as OWNED by the account (for providers)
  or ENTITLED to the account (for subscribers).
"""
function list_data_sets(; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("GET", "/v1/data-sets"; aws_config=aws_config)
end
function list_data_sets(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("GET", "/v1/data-sets", params; aws_config=aws_config)
end

"""
    list_jobs()
    list_jobs(params::Dict{String,<:Any})

This operation lists your jobs sorted by CreatedAt in descending order.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"dataSetId"`: The unique identifier for a data set.
- `"maxResults"`: The maximum number of results returned by a single call.
- `"nextToken"`: The token value retrieved from a previous call to access the next page of
  results.
- `"revisionId"`: The unique identifier for a revision.
"""
function list_jobs(; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("GET", "/v1/jobs"; aws_config=aws_config)
end
function list_jobs(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("GET", "/v1/jobs", params; aws_config=aws_config)
end

"""
    list_revision_assets(data_set_id, revision_id)
    list_revision_assets(data_set_id, revision_id, params::Dict{String,<:Any})

This operation lists a revision's assets sorted alphabetically in descending order.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results returned by a single call.
- `"nextToken"`: The token value retrieved from a previous call to access the next page of
  results.
"""
function list_revision_assets(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets";
        aws_config=aws_config,
    )
end
function list_revision_assets(
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "GET",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets",
        params;
        aws_config=aws_config,
    )
end

"""
    list_tags_for_resource(resource-arn)
    list_tags_for_resource(resource-arn, params::Dict{String,<:Any})

This operation lists the tags on the resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.

"""
function list_tags_for_resource(
    resource_arn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("GET", "/tags/$(resource-arn)"; aws_config=aws_config)
end
function list_tags_for_resource(
    resource_arn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange("GET", "/tags/$(resource-arn)", params; aws_config=aws_config)
end

"""
    start_job(job_id)
    start_job(job_id, params::Dict{String,<:Any})

This operation starts a job.

# Arguments
- `job_id`: The unique identifier for a job.

"""
function start_job(JobId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("PATCH", "/v1/jobs/$(JobId)"; aws_config=aws_config)
end
function start_job(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange("PATCH", "/v1/jobs/$(JobId)", params; aws_config=aws_config)
end

"""
    tag_resource(resource-arn, tags)
    tag_resource(resource-arn, tags, params::Dict{String,<:Any})

This operation tags a resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
- `tags`: A label that consists of a customer-defined key and an optional value.

"""
function tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange(
        "POST",
        "/tags/$(resource-arn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
    )
end
function tag_resource(
    resource_arn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "POST",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
    )
end

"""
    untag_resource(resource-arn, tag_keys)
    untag_resource(resource-arn, tag_keys, params::Dict{String,<:Any})

This operation removes one or more tags from a resource.

# Arguments
- `resource-arn`: An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
- `tag_keys`: The key tags.

"""
function untag_resource(
    resource_arn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "DELETE",
        "/tags/$(resource-arn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
    )
end
function untag_resource(
    resource_arn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "DELETE",
        "/tags/$(resource-arn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
    )
end

"""
    update_asset(asset_id, data_set_id, name, revision_id)
    update_asset(asset_id, data_set_id, name, revision_id, params::Dict{String,<:Any})

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
    AssetId, DataSetId, Name, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
    )
end
function update_asset(
    AssetId,
    DataSetId,
    Name,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)/assets/$(AssetId)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
    )
end

"""
    update_data_set(data_set_id)
    update_data_set(data_set_id, params::Dict{String,<:Any})

This operation updates a data set.

# Arguments
- `data_set_id`: The unique identifier for a data set.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: The description for the data set.
- `"Name"`: The name of the data set.
"""
function update_data_set(DataSetId; aws_config::AbstractAWSConfig=global_aws_config())
    return dataexchange("PATCH", "/v1/data-sets/$(DataSetId)"; aws_config=aws_config)
end
function update_data_set(
    DataSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "PATCH", "/v1/data-sets/$(DataSetId)", params; aws_config=aws_config
    )
end

"""
    update_revision(data_set_id, revision_id)
    update_revision(data_set_id, revision_id, params::Dict{String,<:Any})

This operation updates a revision.

# Arguments
- `data_set_id`: The unique identifier for a data set.
- `revision_id`: The unique identifier for a revision.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Comment"`: An optional comment about the revision.
- `"Finalized"`: Finalizing a revision tells AWS Data Exchange that your changes to the
  assets in the revision are complete. After it's in this read-only state, you can publish
  the revision to your products.
"""
function update_revision(
    DataSetId, RevisionId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return dataexchange(
        "PATCH", "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)"; aws_config=aws_config
    )
end
function update_revision(
    DataSetId,
    RevisionId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return dataexchange(
        "PATCH",
        "/v1/data-sets/$(DataSetId)/revisions/$(RevisionId)",
        params;
        aws_config=aws_config,
    )
end