# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mobile
using AWS.Compat
using AWS.UUIDs

"""
    create_project()
    create_project(params::Dict{String,<:Any})

 Creates an AWS Mobile Hub project.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"contents"`:  ZIP or YAML file which contains configuration settings to be used when
  creating the project. This may be the contents of the file downloaded from the URL provided
  in an export project operation.
- `"name"`:  Name of the project.
- `"region"`:  Default region where project resources should be created.
- `"snapshotId"`:  Unique identifier for an exported snapshot of project configuration.
  This snapshot identifier is included in the share URL when a project is exported.
"""
function create_project(; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("POST", "/projects"; aws_config=aws_config)
end
function create_project(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return mobile("POST", "/projects", params; aws_config=aws_config)
end

"""
    delete_project(project_id)
    delete_project(project_id, params::Dict{String,<:Any})

 Delets a project in AWS Mobile Hub.

# Arguments
- `project_id`:  Unique project identifier.

"""
function delete_project(projectId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("DELETE", "/projects/$(projectId)"; aws_config=aws_config)
end
function delete_project(
    projectId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile("DELETE", "/projects/$(projectId)", params; aws_config=aws_config)
end

"""
    describe_bundle(bundle_id)
    describe_bundle(bundle_id, params::Dict{String,<:Any})

 Get the bundle details for the requested bundle id.

# Arguments
- `bundle_id`:  Unique bundle identifier.

"""
function describe_bundle(bundleId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("GET", "/bundles/$(bundleId)"; aws_config=aws_config)
end
function describe_bundle(
    bundleId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile("GET", "/bundles/$(bundleId)", params; aws_config=aws_config)
end

"""
    describe_project(project_id)
    describe_project(project_id, params::Dict{String,<:Any})

 Gets details about a project in AWS Mobile Hub.

# Arguments
- `project_id`:  Unique project identifier.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"syncFromResources"`:  If set to true, causes AWS Mobile Hub to synchronize information
  from other services, e.g., update state of AWS CloudFormation stacks in the AWS Mobile Hub
  project.
"""
function describe_project(projectId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile(
        "GET", "/project", Dict{String,Any}("projectId" => projectId); aws_config=aws_config
    )
end
function describe_project(
    projectId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile(
        "GET",
        "/project",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("projectId" => projectId), params)
        );
        aws_config=aws_config,
    )
end

"""
    export_bundle(bundle_id)
    export_bundle(bundle_id, params::Dict{String,<:Any})

 Generates customized software development kit (SDK) and or tool packages used to integrate
mobile web or mobile app clients with backend AWS resources.

# Arguments
- `bundle_id`:  Unique bundle identifier.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"platform"`:  Developer desktop or target application platform.
- `"projectId"`:  Unique project identifier.
"""
function export_bundle(bundleId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("POST", "/bundles/$(bundleId)"; aws_config=aws_config)
end
function export_bundle(
    bundleId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile("POST", "/bundles/$(bundleId)", params; aws_config=aws_config)
end

"""
    export_project(project_id)
    export_project(project_id, params::Dict{String,<:Any})

 Exports project configuration to a snapshot which can be downloaded and shared. Note that
mobile app push credentials are encrypted in exported projects, so they can only be shared
successfully within the same AWS account.

# Arguments
- `project_id`:  Unique project identifier.

"""
function export_project(projectId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("POST", "/exports/$(projectId)"; aws_config=aws_config)
end
function export_project(
    projectId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile("POST", "/exports/$(projectId)", params; aws_config=aws_config)
end

"""
    list_bundles()
    list_bundles(params::Dict{String,<:Any})

 List all available bundles.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`:  Maximum number of records to list in a single response.
- `"nextToken"`:  Pagination token. Set to null to start listing bundles from start. If
  non-null pagination token is returned in a result, then pass its value in here in another
  request to list more bundles.
"""
function list_bundles(; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("GET", "/bundles"; aws_config=aws_config)
end
function list_bundles(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return mobile("GET", "/bundles", params; aws_config=aws_config)
end

"""
    list_projects()
    list_projects(params::Dict{String,<:Any})

 Lists projects in AWS Mobile Hub.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`:  Maximum number of records to list in a single response.
- `"nextToken"`:  Pagination token. Set to null to start listing projects from start. If
  non-null pagination token is returned in a result, then pass its value in here in another
  request to list more projects.
"""
function list_projects(; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile("GET", "/projects"; aws_config=aws_config)
end
function list_projects(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return mobile("GET", "/projects", params; aws_config=aws_config)
end

"""
    update_project(project_id)
    update_project(project_id, params::Dict{String,<:Any})

 Update an existing project.

# Arguments
- `project_id`:  Unique project identifier.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"contents"`:  ZIP or YAML file which contains project configuration to be updated. This
  should be the contents of the file downloaded from the URL provided in an export project
  operation.
"""
function update_project(projectId; aws_config::AbstractAWSConfig=global_aws_config())
    return mobile(
        "POST", "/update", Dict{String,Any}("projectId" => projectId); aws_config=aws_config
    )
end
function update_project(
    projectId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return mobile(
        "POST",
        "/update",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("projectId" => projectId), params)
        );
        aws_config=aws_config,
    )
end