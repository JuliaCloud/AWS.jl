# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: amplifybackend
using AWS.Compat
using AWS.UUIDs

"""
    clone_backend(app_id, backend_environment_name, target_environment_name)
    clone_backend(app_id, backend_environment_name, target_environment_name, params::Dict{String,<:Any})

This operation clones an existing backend.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `target_environment_name`: The name of the destination backend environment to be created.

"""
clone_backend(appId, backendEnvironmentName, targetEnvironmentName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/environments/$(backendEnvironmentName)/clone", Dict{String, Any}("targetEnvironmentName"=>targetEnvironmentName); aws_config=aws_config)
clone_backend(appId, backendEnvironmentName, targetEnvironmentName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/environments/$(backendEnvironmentName)/clone", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("targetEnvironmentName"=>targetEnvironmentName), params)); aws_config=aws_config)

"""
    create_backend(app_id, app_name, backend_environment_name)
    create_backend(app_id, app_name, backend_environment_name, params::Dict{String,<:Any})

This operation creates a backend for an Amplify app. Backends are automatically created at
the time of app creation.

# Arguments
- `app_id`: The app ID.
- `app_name`: The name of the app.
- `backend_environment_name`: The name of the backend environment.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"resourceConfig"`: The resource configuration for the backend creation request.
- `"resourceName"`: The name of the resource.
"""
create_backend(appId, appName, backendEnvironmentName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend", Dict{String, Any}("appId"=>appId, "appName"=>appName, "backendEnvironmentName"=>backendEnvironmentName); aws_config=aws_config)
create_backend(appId, appName, backendEnvironmentName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("appId"=>appId, "appName"=>appName, "backendEnvironmentName"=>backendEnvironmentName), params)); aws_config=aws_config)

"""
    create_backend_api(app_id, backend_environment_name, resource_config, resource_name)
    create_backend_api(app_id, backend_environment_name, resource_config, resource_name, params::Dict{String,<:Any})

Creates a new backend API resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_config`: The resource configuration for this request.
- `resource_name`: The name of this resource.

"""
create_backend_api(appId, backendEnvironmentName, resourceConfig, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api", Dict{String, Any}("backendEnvironmentName"=>backendEnvironmentName, "resourceConfig"=>resourceConfig, "resourceName"=>resourceName); aws_config=aws_config)
create_backend_api(appId, backendEnvironmentName, resourceConfig, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("backendEnvironmentName"=>backendEnvironmentName, "resourceConfig"=>resourceConfig, "resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    create_backend_auth(app_id, backend_environment_name, resource_config, resource_name)
    create_backend_auth(app_id, backend_environment_name, resource_config, resource_name, params::Dict{String,<:Any})

Creates a new backend authentication resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_config`: The resource configuration for this request object.
- `resource_name`: The name of this resource.

"""
create_backend_auth(appId, backendEnvironmentName, resourceConfig, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth", Dict{String, Any}("backendEnvironmentName"=>backendEnvironmentName, "resourceConfig"=>resourceConfig, "resourceName"=>resourceName); aws_config=aws_config)
create_backend_auth(appId, backendEnvironmentName, resourceConfig, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("backendEnvironmentName"=>backendEnvironmentName, "resourceConfig"=>resourceConfig, "resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    create_backend_config(app_id)
    create_backend_config(app_id, params::Dict{String,<:Any})

Creates a config object for a backend.

# Arguments
- `app_id`: The app ID.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"backendManagerAppId"`: The app ID for the backend manager.
"""
create_backend_config(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config"; aws_config=aws_config)
create_backend_config(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config", params; aws_config=aws_config)

"""
    create_token(app_id)
    create_token(app_id, params::Dict{String,<:Any})

Generates a one-time challenge code to authenticate a user into your Amplify Admin UI.

# Arguments
- `app_id`: The app ID.

"""
create_token(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/challenge"; aws_config=aws_config)
create_token(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/challenge", params; aws_config=aws_config)

"""
    delete_backend(app_id, backend_environment_name)
    delete_backend(app_id, backend_environment_name, params::Dict{String,<:Any})

Removes an existing environment from your Amplify project.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.

"""
delete_backend(appId, backendEnvironmentName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/environments/$(backendEnvironmentName)/remove"; aws_config=aws_config)
delete_backend(appId, backendEnvironmentName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/environments/$(backendEnvironmentName)/remove", params; aws_config=aws_config)

"""
    delete_backend_api(app_id, backend_environment_name, resource_name)
    delete_backend_api(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Deletes an existing backend API resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"resourceConfig"`: Defines the resource configuration for the data model in your Amplify
  project.
"""
delete_backend_api(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/remove", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
delete_backend_api(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/remove", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    delete_backend_auth(app_id, backend_environment_name, resource_name)
    delete_backend_auth(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Deletes an existing backend authentication resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

"""
delete_backend_auth(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)/remove", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
delete_backend_auth(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)/remove", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    delete_token(app_id, session_id)
    delete_token(app_id, session_id, params::Dict{String,<:Any})

Deletes the challenge token based on the given appId and sessionId.

# Arguments
- `app_id`: The app ID.
- `session_id`: The session ID.

"""
delete_token(appId, sessionId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/challenge/$(sessionId)/remove"; aws_config=aws_config)
delete_token(appId, sessionId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/challenge/$(sessionId)/remove", params; aws_config=aws_config)

"""
    generate_backend_apimodels(app_id, backend_environment_name, resource_name)
    generate_backend_apimodels(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Generates a model schema for an existing backend API resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

"""
generate_backend_apimodels(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/generateModels", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
generate_backend_apimodels(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/generateModels", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    get_backend(app_id)
    get_backend(app_id, params::Dict{String,<:Any})

Provides project-level details for your Amplify UI project.

# Arguments
- `app_id`: The app ID.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"backendEnvironmentName"`: The name of the backend environment.
"""
get_backend(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/details"; aws_config=aws_config)
get_backend(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/details", params; aws_config=aws_config)

"""
    get_backend_api(app_id, backend_environment_name, resource_name)
    get_backend_api(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Gets the details for a backend API.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"resourceConfig"`: Defines the resource configuration for the data model in your Amplify
  project.
"""
get_backend_api(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/details", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
get_backend_api(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/details", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    get_backend_apimodels(app_id, backend_environment_name, resource_name)
    get_backend_apimodels(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Generates a model schema for existing backend API resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

"""
get_backend_apimodels(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/getModels", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
get_backend_apimodels(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)/getModels", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    get_backend_auth(app_id, backend_environment_name, resource_name)
    get_backend_auth(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Gets backend auth details.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

"""
get_backend_auth(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)/details", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
get_backend_auth(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)/details", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    get_backend_job(app_id, backend_environment_name, job_id)
    get_backend_job(app_id, backend_environment_name, job_id, params::Dict{String,<:Any})

Returns information about a specific job.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `job_id`: The ID for the job.

"""
get_backend_job(appId, backendEnvironmentName, jobId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("GET", "/backend/$(appId)/job/$(backendEnvironmentName)/$(jobId)"; aws_config=aws_config)
get_backend_job(appId, backendEnvironmentName, jobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("GET", "/backend/$(appId)/job/$(backendEnvironmentName)/$(jobId)", params; aws_config=aws_config)

"""
    get_token(app_id, session_id)
    get_token(app_id, session_id, params::Dict{String,<:Any})

Gets the challenge token based on the given appId and sessionId.

# Arguments
- `app_id`: The app ID.
- `session_id`: The session ID.

"""
get_token(appId, sessionId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("GET", "/backend/$(appId)/challenge/$(sessionId)"; aws_config=aws_config)
get_token(appId, sessionId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("GET", "/backend/$(appId)/challenge/$(sessionId)", params; aws_config=aws_config)

"""
    list_backend_jobs(app_id, backend_environment_name)
    list_backend_jobs(app_id, backend_environment_name, params::Dict{String,<:Any})

Lists the jobs for the backend of an Amplify app.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"jobId"`: The ID for the job.
- `"maxResults"`: The maximum number of results that you want in the response.
- `"nextToken"`: The token for the next set of results.
- `"operation"`: Filters the list of response objects to include only those with the
  specified operation name.
- `"status"`: Filters the list of response objects to include only those with the specified
  status.
"""
list_backend_jobs(appId, backendEnvironmentName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/job/$(backendEnvironmentName)"; aws_config=aws_config)
list_backend_jobs(appId, backendEnvironmentName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/job/$(backendEnvironmentName)", params; aws_config=aws_config)

"""
    remove_all_backends(app_id)
    remove_all_backends(app_id, params::Dict{String,<:Any})

Removes all backend environments from your Amplify project.

# Arguments
- `app_id`: The app ID.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"cleanAmplifyApp"`: Cleans up the Amplify Console app if this value is set to true.
"""
remove_all_backends(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/remove"; aws_config=aws_config)
remove_all_backends(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/remove", params; aws_config=aws_config)

"""
    remove_backend_config(app_id)
    remove_backend_config(app_id, params::Dict{String,<:Any})

Removes the AWS resources that are required to access the Amplify Admin UI.

# Arguments
- `app_id`: The app ID.

"""
remove_backend_config(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config/remove"; aws_config=aws_config)
remove_backend_config(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config/remove", params; aws_config=aws_config)

"""
    update_backend_api(app_id, backend_environment_name, resource_name)
    update_backend_api(app_id, backend_environment_name, resource_name, params::Dict{String,<:Any})

Updates an existing backend API resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_name`: The name of this resource.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"resourceConfig"`: Defines the resource configuration for the data model in your Amplify
  project.
"""
update_backend_api(appId, backendEnvironmentName, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)", Dict{String, Any}("resourceName"=>resourceName); aws_config=aws_config)
update_backend_api(appId, backendEnvironmentName, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/api/$(backendEnvironmentName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    update_backend_auth(app_id, backend_environment_name, resource_config, resource_name)
    update_backend_auth(app_id, backend_environment_name, resource_config, resource_name, params::Dict{String,<:Any})

Updates an existing backend authentication resource.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `resource_config`: The resource configuration for this request object.
- `resource_name`: The name of this resource.

"""
update_backend_auth(appId, backendEnvironmentName, resourceConfig, resourceName; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)", Dict{String, Any}("resourceConfig"=>resourceConfig, "resourceName"=>resourceName); aws_config=aws_config)
update_backend_auth(appId, backendEnvironmentName, resourceConfig, resourceName, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/auth/$(backendEnvironmentName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("resourceConfig"=>resourceConfig, "resourceName"=>resourceName), params)); aws_config=aws_config)

"""
    update_backend_config(app_id)
    update_backend_config(app_id, params::Dict{String,<:Any})

Updates the AWS resources that are required to access the Amplify Admin UI.

# Arguments
- `app_id`: The app ID.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"loginAuthConfig"`: Describes the Amazon Cognito configuration for Admin UI access.
"""
update_backend_config(appId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config/update"; aws_config=aws_config)
update_backend_config(appId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/config/update", params; aws_config=aws_config)

"""
    update_backend_job(app_id, backend_environment_name, job_id)
    update_backend_job(app_id, backend_environment_name, job_id, params::Dict{String,<:Any})

Updates a specific job.

# Arguments
- `app_id`: The app ID.
- `backend_environment_name`: The name of the backend environment.
- `job_id`: The ID for the job.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"operation"`: Filters the list of response objects to include only those with the
  specified operation name.
- `"status"`: Filters the list of response objects to include only those with the specified
  status.
"""
update_backend_job(appId, backendEnvironmentName, jobId; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/job/$(backendEnvironmentName)/$(jobId)"; aws_config=aws_config)
update_backend_job(appId, backendEnvironmentName, jobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = amplifybackend("POST", "/backend/$(appId)/job/$(backendEnvironmentName)/$(jobId)", params; aws_config=aws_config)
