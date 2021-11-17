# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: resource_groups
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "filters" => "Filters",
    "group_name" => "GroupName",
    "description" => "Description",
    "resource_query" => "ResourceQuery",
    "tags" => "Tags",
    "next_token" => "NextToken",
    "group" => "Group",
    "max_results" => "MaxResults",
    "configuration" => "Configuration",
)

"""
    create_group(name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a resource group with the specified name and description. You can optionally
include a resource query, or a service configuration. For more information about
constructing a resource query, see Create a tag-based group in Resource Groups. For more
information about service configurations, see Service configurations for resource groups.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:CreateGroup

# Arguments
- `name`: The name of the group, which is the identifier of the group in other operations.
  You can't change the name of a resource group after you create it. A resource group name
  can consist of letters, numbers, hyphens, periods, and underscores. The name cannot start
  with AWS or aws; these are reserved. A resource group name must be unique within each AWS
  Region in your AWS account.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"configuration"`: A configuration associates the resource group with an AWS service and
  specifies how the service can interact with the resources in the group. A configuration is
  an array of GroupConfigurationItem elements. For details about the syntax of service
  configurations, see Service configurations for resource groups.  A resource group can
  contain either a Configuration or a ResourceQuery, but not both.
- `"description"`: The description of the resource group. Descriptions can consist of
  letters, numbers, hyphens, underscores, periods, and spaces.
- `"resource_query"`: The resource query that determines which AWS resources are members of
  this group. For more information about resource queries, see Create a tag-based group in
  Resource Groups.   A resource group can contain either a ResourceQuery or a Configuration,
  but not both.
- `"tags"`: The tags to add to the group. A tag is key-value pair string.
"""
function create_group(Name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/groups",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes the specified resource group. Deleting a resource group does not delete any
resources that are members of the group; it only deletes the group structure.  Minimum
permissions  To run this command, you must have the following permissions:
resource-groups:DeleteGroup

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"group"`: The name or the ARN of the resource group to delete.
- `"group_name"`: Deprecated - don't use this parameter. Use Group instead.
"""
function delete_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/delete-group",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a specified resource group.  Minimum permissions  To run this
command, you must have the following permissions:    resource-groups:GetGroup

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"group"`: The name or the ARN of the resource group to retrieve.
- `"group_name"`: Deprecated - don't use this parameter. Use Group instead.
"""
function get_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST", "/get-group", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    get_group_configuration(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the service configuration associated with the specified resource group. For details
about the service configuration syntax, see Service configurations for resource groups.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:GetGroupConfiguration

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"group"`: The name or the ARN of the resource group.
"""
function get_group_configuration(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/get-group-configuration",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_group_query(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves the resource query associated with the specified resource group. For more
information about resource queries, see Create a tag-based group in Resource Groups.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:GetGroupQuery

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"group"`: The name or the ARN of the resource group to query.
- `"group_name"`: Don't use this parameter. Use Group instead.
"""
function get_group_query(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/get-group-query",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_tags(arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of tags that are associated with a resource group, specified by an ARN.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:GetTags

# Arguments
- `arn`: The ARN of the resource group whose tags you want to retrieve.

"""
function get_tags(Arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "GET",
        "/resources/$(Arn)/tags",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    group_resources(group, resource_arns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds the specified resources to the specified group.  Minimum permissions  To run this
command, you must have the following permissions:    resource-groups:GroupResources

# Arguments
- `group`: The name or the ARN of the resource group to add resources to.
- `resource_arns`: The list of ARNs for resources to be added to the group.

"""
function group_resources(
    Group, ResourceArns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/group-resources",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Group" => Group, "ResourceArns" => ResourceArns),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_group_resources(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of ARNs of the resources that are members of a specified resource group.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:ListGroupResources     cloudformation:DescribeStacks
cloudformation:ListStackResources     tag:GetResources

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: Filters, formatted as ResourceFilter objects, that you want to apply to a
  ListGroupResources operation. Filters the results to include only those of the specified
  resource types.    resource-type - Filter resources by their type. Specify up to five
  resource types in the format AWS::ServiceCode::ResourceType. For example,
  AWS::EC2::Instance, or AWS::S3::Bucket.    When you specify a resource-type filter for
  ListGroupResources, AWS Resource Groups validates your filter resource types against the
  types that are defined in the query associated with the group. For example, if a group
  contains only S3 buckets because its query specifies only that resource type, but your
  resource-type filter includes EC2 instances, AWS Resource Groups does not filter for EC2
  instances. In this case, a ListGroupResources request returns a BadRequestException error
  with a message similar to the following:  The resource types specified as filters in the
  request are not valid.  The error includes a list of resource types that failed the
  validation because they are not part of the query associated with the group. This
  validation doesn't occur when the group query specifies AWS::AllSupported, because a group
  based on such a query can contain any of the allowed resource types for the query type
  (tag-based or AWS CloudFormation stack-based queries).
- `"group"`: The name or the ARN of the resource group
- `"group_name"`:    Deprecated - don't use this parameter. Use the Group request field
  instead.
- `"max_results"`: The total number of results that you want included on each page of the
  response. If you do not include this parameter, it defaults to a value that is specific to
  the operation. If additional items exist beyond the maximum you specify, the NextToken
  response element is present and has a value (is not null). Include that value as the
  NextToken request parameter in the next call to the operation to get the next part of the
  results. Note that the service might return fewer results than the maximum even when there
  are more results available. You should check NextToken after every operation to ensure that
  you receive all of the results.
- `"next_token"`: The parameter for receiving additional results if you receive a NextToken
  response in a previous request. A NextToken response indicates that more output is
  available. Set this parameter to the value provided by a previous call's NextToken response
  to indicate where the output should continue from.
"""
function list_group_resources(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/list-group-resources",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of existing resource groups in your account.  Minimum permissions  To run
this command, you must have the following permissions:    resource-groups:ListGroups

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"filters"`: Filters, formatted as GroupFilter objects, that you want to apply to a
  ListGroups operation.    resource-type - Filter the results to include only those of the
  specified resource types. Specify up to five resource types in the format
  AWS::ServiceCode::ResourceType . For example, AWS::EC2::Instance, or AWS::S3::Bucket.
  configuration-type - Filter the results to include only those groups that have the
  specified configuration types attached. The current supported values are:
  AWS:EC2::CapacityReservationPool     AWS:EC2::HostManagement
- `"max_results"`: The total number of results that you want included on each page of the
  response. If you do not include this parameter, it defaults to a value that is specific to
  the operation. If additional items exist beyond the maximum you specify, the NextToken
  response element is present and has a value (is not null). Include that value as the
  NextToken request parameter in the next call to the operation to get the next part of the
  results. Note that the service might return fewer results than the maximum even when there
  are more results available. You should check NextToken after every operation to ensure that
  you receive all of the results.
- `"next_token"`: The parameter for receiving additional results if you receive a NextToken
  response in a previous request. A NextToken response indicates that more output is
  available. Set this parameter to the value provided by a previous call's NextToken response
  to indicate where the output should continue from.
"""
function list_groups(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/groups-list",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_group_configuration(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Attaches a service configuration to the specified group. This occurs asynchronously, and
can take time to complete. You can use GetGroupConfiguration to check the status of the
update.  Minimum permissions  To run this command, you must have the following permissions:
   resource-groups:PutGroupConfiguration

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"configuration"`: The new configuration to associate with the specified group. A
  configuration associates the resource group with an AWS service and specifies how the
  service can interact with the resources in the group. A configuration is an array of
  GroupConfigurationItem elements. For information about the syntax of a service
  configuration, see Service configurations for resource groups.  A resource group can
  contain either a Configuration or a ResourceQuery, but not both.
- `"group"`: The name or ARN of the resource group with the configuration that you want to
  update.
"""
function put_group_configuration(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/put-group-configuration",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    search_resources(resource_query; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a list of AWS resource identifiers that matches the specified query. The query uses
the same format as a resource query in a CreateGroup or UpdateGroupQuery operation.
Minimum permissions  To run this command, you must have the following permissions:
resource-groups:SearchResources     cloudformation:DescribeStacks
cloudformation:ListStackResources     tag:GetResources

# Arguments
- `resource_query`: The search query, using the same formats that are supported for
  resource group definition. For more information, see CreateGroup.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The total number of results that you want included on each page of the
  response. If you do not include this parameter, it defaults to a value that is specific to
  the operation. If additional items exist beyond the maximum you specify, the NextToken
  response element is present and has a value (is not null). Include that value as the
  NextToken request parameter in the next call to the operation to get the next part of the
  results. Note that the service might return fewer results than the maximum even when there
  are more results available. You should check NextToken after every operation to ensure that
  you receive all of the results.
- `"next_token"`: The parameter for receiving additional results if you receive a NextToken
  response in a previous request. A NextToken response indicates that more output is
  available. Set this parameter to the value provided by a previous call's NextToken response
  to indicate where the output should continue from.
"""
function search_resources(
    ResourceQuery; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/resources/search",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceQuery" => ResourceQuery), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag(arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds tags to a resource group with the specified ARN. Existing tags on a resource group are
not changed if they are not specified in the request parameters.  Do not store personally
identifiable information (PII) or other confidential or sensitive information in tags. We
use tags to provide you with billing and administration services. Tags are not intended to
be used for private or sensitive data.   Minimum permissions  To run this command, you must
have the following permissions:    resource-groups:Tag

# Arguments
- `arn`: The ARN of the resource group to which to add tags.
- `tags`: The tags to add to the specified resource group. A tag is a string-to-string map
  of key-value pairs.

"""
function tag(Arn, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "PUT",
        "/resources/$(Arn)/tags",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    ungroup_resources(group, resource_arns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes the specified resources from the specified group.  Minimum permissions  To run this
command, you must have the following permissions:    resource-groups:UngroupResources

# Arguments
- `group`: The name or the ARN of the resource group from which to remove the resources.
- `resource_arns`: The ARNs of the resources to be removed from the group.

"""
function ungroup_resources(
    Group, ResourceArns; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/ungroup-resources",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Group" => Group, "ResourceArns" => ResourceArns),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag(arn, keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes tags from a specified resource group.  Minimum permissions  To run this command,
you must have the following permissions:    resource-groups:Untag

# Arguments
- `arn`: The ARN of the resource group from which to remove tags. The command removed both
  the specified keys and any values associated with those keys.
- `keys`: The keys of the tags to be removed.

"""
function untag(Arn, Keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "PATCH",
        "/resources/$(Arn)/tags",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Keys" => Keys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the description for an existing group. You cannot update the name of a resource
group.  Minimum permissions  To run this command, you must have the following permissions:
  resource-groups:UpdateGroup

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: The new description that you want to update the resource group with.
  Descriptions can contain letters, numbers, hyphens, underscores, periods, and spaces.
- `"group"`: The name or the ARN of the resource group to modify.
- `"group_name"`: Don't use this parameter. Use Group instead.
"""
function update_group(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/update-group",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_group_query(resource_query; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the resource query of a group. For more information about resource queries, see
Create a tag-based group in Resource Groups.  Minimum permissions  To run this command, you
must have the following permissions:    resource-groups:UpdateGroupQuery

# Arguments
- `resource_query`: The resource query to determine which AWS resources are members of this
  resource group.  A resource group can contain either a Configuration or a ResourceQuery,
  but not both.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"group"`: The name or the ARN of the resource group to query.
- `"group_name"`: Don't use this parameter. Use Group instead.
"""
function update_group_query(
    ResourceQuery; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return resource_groups(
        "POST",
        "/update-group-query",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceQuery" => ResourceQuery), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
