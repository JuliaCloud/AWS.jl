# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: service_catalog_appregistry
using AWS.Compat
using AWS.UUIDs

"""
    associate_attribute_group(application, attribute_group)
    associate_attribute_group(application, attribute_group, params::Dict{String,<:Any})

Associates an attribute group with an application to augment the application's metadata
with the group's attributes. This feature enables applications to be described with
user-defined details that are machine-readable, such as third-party integrations.

# Arguments
- `application`: The name or ID of the application.
- `attribute_group`: The name or ID of the attribute group that holds the attributes to
  describe the application.

"""
function associate_attribute_group(
    application, attributeGroup; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "PUT",
        "/applications/$(application)/attribute-groups/$(attributeGroup)";
        aws_config=aws_config,
    )
end
function associate_attribute_group(
    application,
    attributeGroup,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "PUT",
        "/applications/$(application)/attribute-groups/$(attributeGroup)",
        params;
        aws_config=aws_config,
    )
end

"""
    associate_resource(application, resource, resource_type)
    associate_resource(application, resource, resource_type, params::Dict{String,<:Any})

Associates a resource with an application. Both the resource and the application can be
specified either by ID or name.

# Arguments
- `application`: The name or ID of the application.
- `resource`: The name or ID of the resource of which the application will be associated.
- `resource_type`: The type of resource of which the application will be associated.

"""
function associate_resource(
    application, resource, resourceType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "PUT",
        "/applications/$(application)/resources/$(resourceType)/$(resource)";
        aws_config=aws_config,
    )
end
function associate_resource(
    application,
    resource,
    resourceType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "PUT",
        "/applications/$(application)/resources/$(resourceType)/$(resource)",
        params;
        aws_config=aws_config,
    )
end

"""
    create_application(client_token, name)
    create_application(client_token, name, params::Dict{String,<:Any})

Creates a new application that is the top-level node in a hierarchy of related cloud
resource abstractions.

# Arguments
- `client_token`: A unique identifier that you provide to ensure idempotency. If you retry
  a request that completed successfully using the same client token and the same parameters,
  the retry succeeds without performing any further actions. If you retry a successful
  request using the same client token, but one or more of the parameters are different, the
  retry fails.
- `name`: The name of the application. The name must be unique in the region in which you
  are creating the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the application.
- `"tags"`: Key-value pairs you can use to associate with the application.
"""
function create_application(
    clientToken, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "POST",
        "/applications",
        Dict{String,Any}("clientToken" => clientToken, "name" => name);
        aws_config=aws_config,
    )
end
function create_application(
    clientToken,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "POST",
        "/applications",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("clientToken" => clientToken, "name" => name),
                params,
            ),
        );
        aws_config=aws_config,
    )
end

"""
    create_attribute_group(attributes, client_token, name)
    create_attribute_group(attributes, client_token, name, params::Dict{String,<:Any})

Creates a new attribute group as a container for user-defined attributes. This feature
enables users to have full control over their cloud application's metadata in a rich
machine-readable format to facilitate integration with automated workflows and third-party
tools.

# Arguments
- `attributes`: A JSON string in the form of nested key-value pairs that represent the
  attributes in the group and describes an application and its components.
- `client_token`: A unique identifier that you provide to ensure idempotency. If you retry
  a request that completed successfully using the same client token and the same parameters,
  the retry succeeds without performing any further actions. If you retry a successful
  request using the same client token, but one or more of the parameters are different, the
  retry fails.
- `name`: The name of the attribute group.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The description of the attribute group that the user provides.
- `"tags"`: Key-value pairs you can use to associate with the attribute group.
"""
function create_attribute_group(
    attributes, clientToken, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "POST",
        "/attribute-groups",
        Dict{String,Any}(
            "attributes" => attributes, "clientToken" => clientToken, "name" => name
        );
        aws_config=aws_config,
    )
end
function create_attribute_group(
    attributes,
    clientToken,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "POST",
        "/attribute-groups",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "attributes" => attributes, "clientToken" => clientToken, "name" => name
                ),
                params,
            ),
        );
        aws_config=aws_config,
    )
end

"""
    delete_application(application)
    delete_application(application, params::Dict{String,<:Any})

Deletes an application that is specified either by its application ID or name. All
associated attribute groups and resources must be disassociated from it before deleting an
application.

# Arguments
- `application`: The name or ID of the application.

"""
function delete_application(application; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry(
        "DELETE", "/applications/$(application)"; aws_config=aws_config
    )
end
function delete_application(
    application,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "DELETE", "/applications/$(application)", params; aws_config=aws_config
    )
end

"""
    delete_attribute_group(attribute_group)
    delete_attribute_group(attribute_group, params::Dict{String,<:Any})

Deletes an attribute group, specified either by its attribute group ID or name.

# Arguments
- `attribute_group`: The name or ID of the attribute group that holds the attributes to
  describe the application.

"""
function delete_attribute_group(
    attributeGroup; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "DELETE", "/attribute-groups/$(attributeGroup)"; aws_config=aws_config
    )
end
function delete_attribute_group(
    attributeGroup,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "DELETE", "/attribute-groups/$(attributeGroup)", params; aws_config=aws_config
    )
end

"""
    disassociate_attribute_group(application, attribute_group)
    disassociate_attribute_group(application, attribute_group, params::Dict{String,<:Any})

Disassociates an attribute group from an application to remove the extra attributes
contained in the attribute group from the application's metadata. This operation reverts
AssociateAttributeGroup.

# Arguments
- `application`: The name or ID of the application.
- `attribute_group`: The name or ID of the attribute group that holds the attributes to
  describe the application.

"""
function disassociate_attribute_group(
    application, attributeGroup; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "DELETE",
        "/applications/$(application)/attribute-groups/$(attributeGroup)";
        aws_config=aws_config,
    )
end
function disassociate_attribute_group(
    application,
    attributeGroup,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "DELETE",
        "/applications/$(application)/attribute-groups/$(attributeGroup)",
        params;
        aws_config=aws_config,
    )
end

"""
    disassociate_resource(application, resource, resource_type)
    disassociate_resource(application, resource, resource_type, params::Dict{String,<:Any})

Disassociates a resource from application. Both the resource and the application can be
specified either by ID or name.

# Arguments
- `application`: The name or ID of the application.
- `resource`: The name or ID of the resource.
- `resource_type`: The type of the resource that is being disassociated.

"""
function disassociate_resource(
    application, resource, resourceType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "DELETE",
        "/applications/$(application)/resources/$(resourceType)/$(resource)";
        aws_config=aws_config,
    )
end
function disassociate_resource(
    application,
    resource,
    resourceType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "DELETE",
        "/applications/$(application)/resources/$(resourceType)/$(resource)",
        params;
        aws_config=aws_config,
    )
end

"""
    get_application(application)
    get_application(application, params::Dict{String,<:Any})

Retrieves metadata information about one of your applications. The application can be
specified either by its unique ID or by its name (which is unique within one account in one
region at a given point in time). Specify by ID in automated workflows if you want to make
sure that the exact same application is returned or a ResourceNotFoundException is thrown,
avoiding the ABA addressing problem.

# Arguments
- `application`: The name or ID of the application.

"""
function get_application(application; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry(
        "GET", "/applications/$(application)"; aws_config=aws_config
    )
end
function get_application(
    application,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET", "/applications/$(application)", params; aws_config=aws_config
    )
end

"""
    get_associated_resource(application, resource, resource_type)
    get_associated_resource(application, resource, resource_type, params::Dict{String,<:Any})

Gets the resource associated with the application.

# Arguments
- `application`: The name or ID of the application.
- `resource`: The name or ID of the resource associated with the application.
- `resource_type`: The type of resource associated with the application.

"""
function get_associated_resource(
    application, resource, resourceType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET",
        "/applications/$(application)/resources/$(resourceType)/$(resource)";
        aws_config=aws_config,
    )
end
function get_associated_resource(
    application,
    resource,
    resourceType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET",
        "/applications/$(application)/resources/$(resourceType)/$(resource)",
        params;
        aws_config=aws_config,
    )
end

"""
    get_attribute_group(attribute_group)
    get_attribute_group(attribute_group, params::Dict{String,<:Any})

Retrieves an attribute group, either by its name or its ID. The attribute group can be
specified either by its unique ID or by its name.

# Arguments
- `attribute_group`: The name or ID of the attribute group that holds the attributes to
  describe the application.

"""
function get_attribute_group(
    attributeGroup; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET", "/attribute-groups/$(attributeGroup)"; aws_config=aws_config
    )
end
function get_attribute_group(
    attributeGroup,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET", "/attribute-groups/$(attributeGroup)", params; aws_config=aws_config
    )
end

"""
    list_applications()
    list_applications(params::Dict{String,<:Any})

Retrieves a list of all of your applications. Results are paginated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The upper bound of the number of results to return (cannot exceed 25). If
  this parameter is omitted, it defaults to 25. This value is optional.
- `"nextToken"`: The token to use to get the next page of results after a previous API
  call.
"""
function list_applications(; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry("GET", "/applications"; aws_config=aws_config)
end
function list_applications(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET", "/applications", params; aws_config=aws_config
    )
end

"""
    list_associated_attribute_groups(application)
    list_associated_attribute_groups(application, params::Dict{String,<:Any})

Lists all attribute groups that are associated with specified application. Results are
paginated.

# Arguments
- `application`: The name or ID of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The upper bound of the number of results to return (cannot exceed 25). If
  this parameter is omitted, it defaults to 25. This value is optional.
- `"nextToken"`: The token to use to get the next page of results after a previous API
  call.
"""
function list_associated_attribute_groups(
    application; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET", "/applications/$(application)/attribute-groups"; aws_config=aws_config
    )
end
function list_associated_attribute_groups(
    application,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET",
        "/applications/$(application)/attribute-groups",
        params;
        aws_config=aws_config,
    )
end

"""
    list_associated_resources(application)
    list_associated_resources(application, params::Dict{String,<:Any})

Lists all resources that are associated with specified application. Results are paginated.

# Arguments
- `application`: The name or ID of the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The upper bound of the number of results to return (cannot exceed 25). If
  this parameter is omitted, it defaults to 25. This value is optional.
- `"nextToken"`: The token to use to get the next page of results after a previous API
  call.
"""
function list_associated_resources(
    application; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET", "/applications/$(application)/resources"; aws_config=aws_config
    )
end
function list_associated_resources(
    application,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET", "/applications/$(application)/resources", params; aws_config=aws_config
    )
end

"""
    list_attribute_groups()
    list_attribute_groups(params::Dict{String,<:Any})

Lists all attribute groups which you have access to. Results are paginated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The upper bound of the number of results to return (cannot exceed 25). If
  this parameter is omitted, it defaults to 25. This value is optional.
- `"nextToken"`: The token to use to get the next page of results after a previous API
  call.
"""
function list_attribute_groups(; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry("GET", "/attribute-groups"; aws_config=aws_config)
end
function list_attribute_groups(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "GET", "/attribute-groups", params; aws_config=aws_config
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists all of the tags on the resource.

# Arguments
- `resource_arn`: The Amazon resource name (ARN) that specifies the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "GET", "/tags/$(resourceArn)", params; aws_config=aws_config
    )
end

"""
    sync_resource(resource, resource_type)
    sync_resource(resource, resource_type, params::Dict{String,<:Any})

Syncs the resource with current AppRegistry records. Specifically, the resource’s
AppRegistry system tags sync with its associated application. We remove the resource's
AppRegistry system tags if it does not associate with the application. The caller must have
permissions to read and update the resource.

# Arguments
- `resource`: An entity you can work with and specify with a name or ID. Examples include
  an Amazon EC2 instance, an Amazon Web Services CloudFormation stack, or an Amazon S3 bucket.
- `resource_type`: The type of resource of which the application will be associated.

"""
function sync_resource(
    resource, resourceType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "POST", "/sync/$(resourceType)/$(resource)"; aws_config=aws_config
    )
end
function sync_resource(
    resource,
    resourceType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "POST", "/sync/$(resourceType)/$(resource)", params; aws_config=aws_config
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Assigns one or more tags (key-value pairs) to the specified resource. Each tag consists of
a key and an optional value. If a tag with the same key is already associated with the
resource, this action updates its value. This operation returns an empty response if the
call was successful.

# Arguments
- `resource_arn`: The Amazon resource name (ARN) that specifies the resource.
- `tags`: The new or modified tags for the resource.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from a resource. This operation returns an empty response if the call was
successful.

# Arguments
- `resource_arn`: The Amazon resource name (ARN) that specifies the resource.
- `tag_keys`: A list of the tag keys to remove from the specified resource.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
    )
end

"""
    update_application(application)
    update_application(application, params::Dict{String,<:Any})

Updates an existing application with new attributes.

# Arguments
- `application`: The name or ID of the application that will be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: The new description of the application.
- `"name"`: The new name of the application. The name must be unique in the region in which
  you are updating the application.
"""
function update_application(application; aws_config::AbstractAWSConfig=global_aws_config())
    return service_catalog_appregistry(
        "PATCH", "/applications/$(application)"; aws_config=aws_config
    )
end
function update_application(
    application,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "PATCH", "/applications/$(application)", params; aws_config=aws_config
    )
end

"""
    update_attribute_group(attribute_group)
    update_attribute_group(attribute_group, params::Dict{String,<:Any})

Updates an existing attribute group with new details.

# Arguments
- `attribute_group`: The name or ID of the attribute group that holds the attributes to
  describe the application.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"attributes"`: A JSON string in the form of nested key-value pairs that represent the
  attributes in the group and describes an application and its components.
- `"description"`: The description of the attribute group that the user provides.
- `"name"`: The new name of the attribute group. The name must be unique in the region in
  which you are updating the attribute group.
"""
function update_attribute_group(
    attributeGroup; aws_config::AbstractAWSConfig=global_aws_config()
)
    return service_catalog_appregistry(
        "PATCH", "/attribute-groups/$(attributeGroup)"; aws_config=aws_config
    )
end
function update_attribute_group(
    attributeGroup,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return service_catalog_appregistry(
        "PATCH", "/attribute-groups/$(attributeGroup)", params; aws_config=aws_config
    )
end