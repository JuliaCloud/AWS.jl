# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: marketplace_catalog
using AWS.Compat
using AWS.UUIDs

"""
    batch_describe_entities(entity_request_list)
    batch_describe_entities(entity_request_list, params::Dict{String,<:Any})

Returns metadata and content for multiple entities. This is the Batch version of the
DescribeEntity API and uses the same IAM permission action as DescribeEntity API.

# Arguments
- `entity_request_list`: List of entity IDs and the catalogs the entities are present in.

"""
function batch_describe_entities(
    EntityRequestList; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/BatchDescribeEntities",
        Dict{String,Any}("EntityRequestList" => EntityRequestList);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function batch_describe_entities(
    EntityRequestList,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/BatchDescribeEntities",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("EntityRequestList" => EntityRequestList), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    cancel_change_set(catalog, change_set_id)
    cancel_change_set(catalog, change_set_id, params::Dict{String,<:Any})

Used to cancel an open change request. Must be sent before the status of the request
changes to APPLYING, the final stage of completing your change request. You can describe a
change during the 60-day request history retention period for API calls.

# Arguments
- `catalog`: Required. The catalog related to the request. Fixed value: AWSMarketplace.
- `change_set_id`: Required. The unique identifier of the StartChangeSet request that you
  want to cancel.

"""
function cancel_change_set(
    catalog, changeSetId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "PATCH",
        "/CancelChangeSet",
        Dict{String,Any}("catalog" => catalog, "changeSetId" => changeSetId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function cancel_change_set(
    catalog,
    changeSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "PATCH",
        "/CancelChangeSet",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("catalog" => catalog, "changeSetId" => changeSetId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_resource_policy(resource_arn)
    delete_resource_policy(resource_arn, params::Dict{String,<:Any})

Deletes a resource-based policy on an entity that is identified by its resource ARN.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the entity resource that is associated
  with the resource policy.

"""
function delete_resource_policy(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "DELETE",
        "/DeleteResourcePolicy",
        Dict{String,Any}("resourceArn" => resourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_resource_policy(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "DELETE",
        "/DeleteResourcePolicy",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("resourceArn" => resourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_change_set(catalog, change_set_id)
    describe_change_set(catalog, change_set_id, params::Dict{String,<:Any})

Provides information about a given change set.

# Arguments
- `catalog`: Required. The catalog related to the request. Fixed value: AWSMarketplace
- `change_set_id`: Required. The unique identifier for the StartChangeSet request that you
  want to describe the details for.

"""
function describe_change_set(
    catalog, changeSetId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "GET",
        "/DescribeChangeSet",
        Dict{String,Any}("catalog" => catalog, "changeSetId" => changeSetId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_change_set(
    catalog,
    changeSetId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "GET",
        "/DescribeChangeSet",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("catalog" => catalog, "changeSetId" => changeSetId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_entity(catalog, entity_id)
    describe_entity(catalog, entity_id, params::Dict{String,<:Any})

Returns the metadata and content of the entity.

# Arguments
- `catalog`: Required. The catalog related to the request. Fixed value: AWSMarketplace
- `entity_id`: Required. The unique ID of the entity to describe.

"""
function describe_entity(
    catalog, entityId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "GET",
        "/DescribeEntity",
        Dict{String,Any}("catalog" => catalog, "entityId" => entityId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_entity(
    catalog,
    entityId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "GET",
        "/DescribeEntity",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("catalog" => catalog, "entityId" => entityId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_resource_policy(resource_arn)
    get_resource_policy(resource_arn, params::Dict{String,<:Any})

Gets a resource-based policy of an entity that is identified by its resource ARN.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the entity resource that is associated
  with the resource policy.

"""
function get_resource_policy(resourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return marketplace_catalog(
        "GET",
        "/GetResourcePolicy",
        Dict{String,Any}("resourceArn" => resourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_resource_policy(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "GET",
        "/GetResourcePolicy",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("resourceArn" => resourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_change_sets(catalog)
    list_change_sets(catalog, params::Dict{String,<:Any})

Returns the list of change sets owned by the account being used to make the call. You can
filter this list by providing any combination of entityId, ChangeSetName, and status. If
you provide more than one filter, the API operation applies a logical AND between the
filters. You can describe a change during the 60-day request history retention period for
API calls.

# Arguments
- `catalog`: The catalog related to the request. Fixed value: AWSMarketplace

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FilterList"`: An array of filter objects.
- `"MaxResults"`: The maximum number of results returned by a single call. This value must
  be provided in the next call to retrieve the next set of results. By default, this value is
  20.
- `"NextToken"`: The token value retrieved from a previous call to access the next page of
  results.
- `"Sort"`: An object that contains two attributes, SortBy and SortOrder.
"""
function list_change_sets(Catalog; aws_config::AbstractAWSConfig=global_aws_config())
    return marketplace_catalog(
        "POST",
        "/ListChangeSets",
        Dict{String,Any}("Catalog" => Catalog);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_change_sets(
    Catalog, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/ListChangeSets",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Catalog" => Catalog), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_entities(catalog, entity_type)
    list_entities(catalog, entity_type, params::Dict{String,<:Any})

Provides the list of entities of a given type.

# Arguments
- `catalog`: The catalog related to the request. Fixed value: AWSMarketplace
- `entity_type`: The type of entities to retrieve. Valid values are: AmiProduct,
  ContainerProduct, DataProduct, SaaSProduct, ProcurementPolicy, Experience, Audience,
  BrandingSettings, Offer, Seller, ResaleAuthorization.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"EntityTypeFilters"`: A Union object containing filter shapes for all EntityTypes. Each
  EntityTypeFilter shape will have filters applicable for that EntityType that can be used to
  search or filter entities.
- `"EntityTypeSort"`: A Union object containing Sort shapes for all EntityTypes. Each
  EntityTypeSort shape will have SortBy and SortOrder applicable for fields on that
  EntityType. This can be used to sort the results of the filter query.
- `"FilterList"`: An array of filter objects. Each filter object contains two attributes,
  filterName and filterValues.
- `"MaxResults"`: Specifies the upper limit of the elements on a single page. If a value
  isn't provided, the default value is 20.
- `"NextToken"`: The value of the next token, if it exists. Null if there are no more
  results.
- `"OwnershipType"`: Filters the returned set of entities based on their owner. The default
  is SELF. To list entities shared with you through AWS Resource Access Manager (AWS RAM),
  set to SHARED. Entities shared through the AWS Marketplace Catalog API PutResourcePolicy
  operation can't be discovered through the SHARED parameter.
- `"Sort"`: An object that contains two attributes, SortBy and SortOrder.
"""
function list_entities(
    Catalog, EntityType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/ListEntities",
        Dict{String,Any}("Catalog" => Catalog, "EntityType" => EntityType);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_entities(
    Catalog,
    EntityType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/ListEntities",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Catalog" => Catalog, "EntityType" => EntityType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists all tags that have been added to a resource (either an entity or change set).

# Arguments
- `resource_arn`: Required. The Amazon Resource Name (ARN) associated with the resource you
  want to list tags on.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/ListTagsForResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/ListTagsForResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_resource_policy(policy, resource_arn)
    put_resource_policy(policy, resource_arn, params::Dict{String,<:Any})

Attaches a resource-based policy to an entity. Examples of an entity include: AmiProduct
and ContainerProduct.

# Arguments
- `policy`: The policy document to set; formatted in JSON.
- `resource_arn`: The Amazon Resource Name (ARN) of the entity resource you want to
  associate with a resource policy.

"""
function put_resource_policy(
    Policy, ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/PutResourcePolicy",
        Dict{String,Any}("Policy" => Policy, "ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_resource_policy(
    Policy,
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/PutResourcePolicy",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Policy" => Policy, "ResourceArn" => ResourceArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_change_set(catalog, change_set)
    start_change_set(catalog, change_set, params::Dict{String,<:Any})

Allows you to request changes for your entities. Within a single ChangeSet, you can't start
the same change type against the same entity multiple times. Additionally, when a ChangeSet
is running, all the entities targeted by the different changes are locked until the change
set has completed (either succeeded, cancelled, or failed). If you try to start a change
set containing a change against an entity that is already locked, you will receive a
ResourceInUseException error. For example, you can't start the ChangeSet described in the
example later in this topic because it contains two changes to run the same change type
(AddRevisions) against the same entity (entity-id@1). For more information about working
with change sets, see  Working with change sets. For information about change types for
single-AMI products, see Working with single-AMI products. Also, for more information about
change types available for container-based products, see Working with container products.

# Arguments
- `catalog`: The catalog related to the request. Fixed value: AWSMarketplace
- `change_set`: Array of change object.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ChangeSetName"`: Optional case sensitive string of up to 100 ASCII characters. The
  change set name can be used to filter the list of change sets.
- `"ChangeSetTags"`: A list of objects specifying each key name and value for the
  ChangeSetTags property.
- `"ClientRequestToken"`: A unique token to identify the request to ensure idempotency.
- `"Intent"`: The intent related to the request. The default is APPLY. To test your request
  before applying changes to your entities, use VALIDATE. This feature is currently available
  for adding versions to single-AMI products. For more information, see Add a new version.
"""
function start_change_set(
    Catalog, ChangeSet; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/StartChangeSet",
        Dict{String,Any}(
            "Catalog" => Catalog,
            "ChangeSet" => ChangeSet,
            "ClientRequestToken" => string(uuid4()),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_change_set(
    Catalog,
    ChangeSet,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/StartChangeSet",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Catalog" => Catalog,
                    "ChangeSet" => ChangeSet,
                    "ClientRequestToken" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Tags a resource (either an entity or change set).

# Arguments
- `resource_arn`: Required. The Amazon Resource Name (ARN) associated with the resource you
  want to tag.
- `tags`: Required. A list of objects specifying each key name and value. Number of objects
  allowed: 1-50.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return marketplace_catalog(
        "POST",
        "/TagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceArn,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes a tag or list of tags from a resource (either an entity or change set).

# Arguments
- `resource_arn`: Required. The Amazon Resource Name (ARN) associated with the resource you
  want to remove the tag from.
- `tag_keys`: Required. A list of key names of tags to be removed. Number of strings
  allowed: 0-256.

"""
function untag_resource(
    ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return marketplace_catalog(
        "POST",
        "/UntagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceArn,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return marketplace_catalog(
        "POST",
        "/UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
