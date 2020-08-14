module AWSMetadataUtilities

include("AWSExceptions.jl")

using .AWSExceptions
using OrderedCollections: OrderedDict, LittleDict
using HTTP
using JSON


"""
    _get_aws_sdk_js_files()

Get a list of all AWS service API definition files from the `awsk-sdk-js` GitHub repository.

# Returns
- `Array{OrderedDict}`: Array of Dictionaries which contains information about each AWS Service
"""
function _get_aws_sdk_js_files()
    headers = ["User-Agent" => "JuliaCloud/AWS.jl"]
    url = "https://api.github.com/repos/aws/aws-sdk-js/contents/apis"

    req = HTTP.get(url, headers)
    files = JSON.parse(String(req.body), dicttype=OrderedDict)
    filter!(f -> endswith(f["name"], ".normal.json"), files)  # Only get ${Service}.normal.json files
    files = _filter_latest_service_version(files)

    return files
end

"""
    _filter_latest_service_version(services::Array{Any})

Return a list of all AWS Services and their latest version.

# Arguments
- `services::Array`: Array of all AWS APIs and their versions

# Returns
- `Array{Dict}`: Array of the latest AWS Service definitions
"""
function _filter_latest_service_version(services::Array)
    seen_services = String[]
    latest_versions = OrderedDict[]

    services = reverse(services)

    for service in services
        service_name, _ = _get_service_and_version(service["name"])

        if !(service_name in seen_services)
            push!(seen_services, service_name)
            push!(latest_versions, service)
        end
    end

    return latest_versions
end

"""
    _get_service_and_version(filename::String)

Get the `service` and `version` from a filename.

# Arguments
- `filename`: Name of the file, ex. `{Service}-{Version}.normal.json`

# Returns
- `Tuple{String, String}`: `service` and `version` for an AWS service
"""
function _get_service_and_version(filename::String)
    try
        service_and_version = join(split(filename, '.')[1:end-2],'.')
        service_and_version = split(service_and_version, '-')
        service = join(service_and_version[1:end-3], '-')
        version = join(service_and_version[end-2:end], '-')

        return (service, version)
    catch e
        if e isa BoundsError
            throw(InvalidFileName("$filename is an invalid AWS JSON filename."))
        else
            rethrow()
        end
    end
end

"""
    _generate_low_level_definitions(services::Array{OrderedDict{String, Any}})

Get the low-level definitions for all AWS Services.

# Arguments
- `services::Array{OrderedDict}`: List of AWS Services to generate low-level definitions

# Returns
- `String[]`: Array of low-level service code to be written into `AWSServices.jl`
"""
function _generate_low_level_definitions(services::Array{OrderedDict})
    service_definitions = String[]

    for service in services
        service_name = service["name"]
        @info "Generating low level wrapper for $service_name"

        # Get the contents of the ${Service}.normal.json file
        request = HTTP.get(service["download_url"])
        service_metadata = JSON.parse(String(request.body))["metadata"]

        definition = _generate_low_level_definition(service_metadata)
        push!(service_definitions, definition)
    end

    return service_definitions
end

"""
    _generate_low_level_definition(service::Dict{String, Any})

Get the low-level definition for an AWS Service.

# Arguments
- `service::Dict{String, Any}`: AWS Service to generate the low-level code definition

# Returns
- `String`: Low-level definition for the AWS Service

# Throws
- `ProtocolNotFound`: If `service` is using a protocol that's not either `[rest-xml, rest-json, json, query]`
"""
function _generate_low_level_definition(service::Dict)
    protocol = service["protocol"]
    service_name = service["endpointPrefix"]
    service_id = replace(lowercase(service["serviceId"]), ' ' => '_')
    api_version = service["apiVersion"]

    service_specifics = LittleDict{String, String}()

    if service_id == "glacier"
        service_specifics[service_id] = "LittleDict(\"x-amz-glacier-version\" => \"$(service["apiVersion"])\")"
    end

    if protocol == "rest-xml"
        return "const $service_id = AWS.RestXMLService(\"$service_name\", \"$api_version\")"
    elseif protocol in ("ec2", "query")
        return "const $service_id = AWS.QueryService(\"$service_name\", \"$api_version\")"
    elseif protocol == "rest-json"
         if haskey(service_specifics, service_id)
             return "const $service_id = AWS.RestJSONService(\"$service_name\", \"$api_version\", $(service_specifics[service_id]))"
         end

        return "const $service_id = AWS.RestJSONService(\"$service_name\", \"$api_version\")"
    elseif protocol == "json"
        json_version = service["jsonVersion"]
        target = service["targetPrefix"]
        return "const $service_id = AWS.JSONService(\"$service_name\", \"$api_version\", \"$json_version\", \"$target\")"
    else
        throw(ProtocolNotDefined("$service_id is using a new protocol; $protocol which is not supported."))
    end
end

"""
    _clean_documentation(documentation::String)

Clean up the documentation to make it Julia compiler and human-readable.

- Remove anything in-between <> HTML tags
- Remove any dollar signs
- Remove any \\
- Replace " with \"

# Arguments
- `documentation::String`: Documentation to be cleaned

# Returns
- `String`: Cleaned documentation string
"""
function _clean_documentation(documentation::String)
    documentation = replace(documentation, r"\<.*?\>" => "")
    documentation = replace(documentation, '$' => ' ')
    documentation = replace(documentation, '\\' => ' ')
    documentation = replace(documentation, '\"' => "\\\"")

    return documentation
end

"""
    _clean_uri(uri::String)

Replace URI parameters with the appropriate syntax for Julia interpolation.

Find all URI parameters, and apply the following replacements:
* { => \$(
* } => )
* - => _
* + => empty string

Example:
"/v1/configurations/{configuration-id}" => "/v1/configurations/\$(configuration_id)"

# Arguments
- `uri::String`: URI to be cleaned

# Returns
- `String`: Cleaned URI
"""
function _clean_uri(uri::String)
    uri_parameters = eachmatch(r"{.*?}", uri) # Match anything surrounded in "{ }"

    for param in uri_parameters
        match = param.match
        original_match = match

        match = replace(match, '{' => "\$(")  # Replace { with $(
        match = replace(match, '}' => ')')  # Replace } with )
        match = replace(match, '-' => '_')  # Replace hyphens with underscores
        match = replace(match, '+' => "")  # Remove +

        uri = replace(uri, original_match => match)
    end

    return uri
end

"""
    _get_function_parameters(input, shapes)

Get the required and optional parameters for a given operation.

# Arguments
- `input::String`: The input object for the given operation
- `shapes::Dict{String, Any}`: Dictionary of all shapes for this AWS Service

# Returns
- `Tuple(Dict, Dict)`: (required_parameters, optional_parameters)
"""
function _get_function_parameters(input::String, shapes::Dict)
    """
        _get_parameter_name(parameter::String, input_shape::AbstractDict){String, <:Any}

    Find the correct parameter name for making requests. Certain ones have a specific locationName, for Batch requests this locationName is nested one shape deeper.

    # Arguments
    - `parameter::String`: Name of the original parameter
    - `input_shape::AbstractDict{String, <:Any}`: The parameter shape
    
    # Returns
    - `String`: Either the original parameter name, the locationName for the parameter, or the locationName nested one shape deeper
    """
    function _get_parameter_name(parameter::String, input_shape::AbstractDict{String, <:Any})
        # If the parameter has a locationName, return it
        if haskey(input_shape["members"][parameter], "locationName")
            return input_shape["members"][parameter]["locationName"]
        end

        # Check to see if the nested shape has a locationName
        nested_shape = input_shape["members"][parameter]["shape"]
        nested_member = get(shapes[nested_shape], "member", "")

        # If nested_shape[member] exists return locationName (if exists), otherwise return the original parameter name
        return !isempty(nested_member) ? get(nested_member, "locationName", parameter) : parameter
    end

    required_parameters = LittleDict{String, Any}()
    optional_parameters = LittleDict{String, Any}()
    input_shape = shapes[input]

    if haskey(input_shape, "required")
        for parameter in input_shape["required"]
            parameter_name = _get_parameter_name(parameter, input_shape)

            # Check if the parameter needs to be in a certain place
            parameter_location = get(input_shape["members"][parameter], "location", "")

            documentation = _clean_documentation(get(input_shape["members"][parameter], "documentation", ""))

            required_parameters[parameter_name] = LittleDict{String, String}(
                "location" => parameter_location,
                "documentation" => documentation,
            )
        end
    end

    if haskey(input_shape, "members")
        for parameter in input_shape["members"]
            parameter_name = get(input_shape["members"][parameter[1]], "locationName", parameter[1])

            if !haskey(required_parameters, parameter_name)
                documentation = _clean_documentation(get(parameter[2], "documentation", ""))
                idempotent = get(parameter[2], "idempotencyToken", false)
                
                optional_parameters[parameter_name] = LittleDict{String, Union{String, Bool}}(
                    "documentation" => documentation,
                    "idempotent" => idempotent,
                )
            end
        end
    end

    return (sort(required_parameters), sort(optional_parameters))
end

"""
    _generate_high_level_definitions(
        service_name::String,
        protocol::String,
        operations::Dict{String, Any},
        shapes::Dict{String, Any}
    )

Generate high-level definitions for the `service`.

# Arguments
- `service_name::String`: AWS `service`
- `protocol::String`: API protocol type
- `operations::Dict{String, Any}`: Service API operations
- `shapes::Dict{String, Any}`: All input shapes for this service

# Return
- `Array`: Array of all high-level definitions and documentation to be written into `services/{Service}.jl`
"""
function _generate_high_level_definitions(
    service_name::String,
    protocol::String,
    operations::Dict,
    shapes::Dict
)
    operation_definitions = String[]

    for operation in operations
        operation = operation[2]
        name = operation["name"]
        method = operation["http"]["method"]
        request_uri = operation["http"]["requestUri"]

        documentation = ""

        if haskey(operation, "documentation")
            documentation = _clean_documentation(operation["documentation"])
        end

        required_parameters = Dict{String, Any}()
        optional_parameters = Dict{String, Any}()

        if haskey(operation, "input")
            required_parameters, optional_parameters = _get_function_parameters(operation["input"]["shape"], shapes)
        end

        operation_definition = _generate_high_level_definition(
            service_name,
            protocol,
            name,
            method,
            request_uri,
            required_parameters,
            optional_parameters,
            documentation
        )

        push!(operation_definitions, operation_definition)
    end

    return operation_definitions
end

"""
    _generate_high_level_definition(
        service_name::String,
        protocol::String,
        name::String,
        method::String,
        request_uri::String,
        required_parameters::Dict,
        optional_parameters::Dict,
        documentation::String
    )

Generate the high-level definition for a services function.

# Arguments
- `name::String`: Name of this services function
- `service_name::String`: Name of the AWS Service
- `protocol::String`: Request protocol for the AWS Service
- `method::String`: Request method for this services function
- `request_uri::String`: Endpoint for this services function
- `required_parameters::Dict{Any, Any}`: Required parameters for this services function
- `optional_parameters::Dict{Any, Any}`: Optional parameters for this services function
- `documentation::String`: Documentation for this services function

# Return
- `String`: High-level definition in Julia code for the services function
"""
function _generate_high_level_definition(
    service_name::String,
    protocol::String,
    name::String,
    method::String,
    request_uri::String,
    required_parameters::AbstractDict,
    optional_parameters::AbstractDict,
    documentation::String
)
    """
        _generate_rest_operation_defintion(required_params::LittleDict{String, Any}, optional_params::LittleDict{String, Any}, function_name::String, service_name::String, method::String, request_uri::String)

    Generate function definition for a service request given required, header and idempotent parameters.
    
    # Arguments
    - `required_params::LittleDict{String, Any}`: All required parameters which the function needs
    - `optional_params::LittleDict{String, Any}`: All optional parameters which can be passed in
    - `function_name::String`: Name of the function which we are generating a definition for
    - `service_name::String`: Name of the AWS service which this function is being defined for
    - `method::String`: The REST method that this function requires
    - `request_uri::String`: The endpoint of the function

    # Returns
    - `String`: Function definition as Julia code
    """
    function _generate_rest_operation_defintion(required_params::AbstractDict, optional_params::AbstractDict, function_name::String, service_name::String, method::String, request_uri::String)
        request_uri = replace(request_uri, '{' => "\$(")  # Replace { with $(
        request_uri = replace(request_uri, '}' => ')')  # Replace } with )
        request_uri = replace(request_uri, '+' => "")  # Remove + from the request URI

        # Pre Julia-1.3 workaround
        req_keys = [replace(key, "-"=>"_") for key in collect(keys(required_params))]
        
        required_params = filter(p -> (p[2]["location"] != "uri"), required_params)
        header_params = filter(p -> (p[2]["location"] == "header"), required_params)
        required_params = setdiff(required_params, header_params)

        idempotent_params = filter(p -> (p[2]["idempotent"]), optional_params)

        req_kv = ["\"$(p[1])\"=>$(replace(p[1], "-" => "_"))" for p in required_params]
        header_kv = ["\"$(p[1])\"=>$(replace(p[1], "-" => "_"))" for p in header_params]
        idempotent_kv = ["\"$(p[1])\"=>string(uuid4())" for p in idempotent_params]

        required_keys = !isempty(req_keys)
        headers = !isempty(header_params)
        idempotent = !isempty(idempotent_params)

        req_str = !isempty(req_kv) ? "Dict{String, Any}($(join(req_kv, ", "))" : ""
        params_str = (!isempty(req_kv) || idempotent) ? "$(join(vcat(req_kv, idempotent_kv), ", "))" : ""
        headers_str = headers ? "\"headers\"=>Dict{String, Any}($(join(header_kv, ", ")))" : ""
        params_headers_str = "Dict{String, Any}($(join([s for s in (params_str, headers_str) if !isempty(s)], ", ")))"
        
        if required_keys && (idempotent || headers)
            return """\n
                $function_name($(join(req_keys, ", ")); aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", $params_headers_str; aws=aws)
                $function_name($(join(req_keys, ", ")), args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $params_headers_str, args)); aws=aws)
                """
        elseif !required_keys && (idempotent || headers)
            return """\n
                $function_name(; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", $params_headers_str; aws=aws)
                $function_name(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $params_headers_str, args)); aws=aws)
                """
        elseif required_keys && !isempty(req_kv)
            return """\n
                $function_name($(join(req_keys, ", ")); aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", $req_str); aws=aws)
                $function_name($(join(req_keys, ", ")), args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $req_str), args)); aws=aws)
                """
        elseif required_keys
            return """\n
                $function_name($(join(req_keys, ", ")); aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\"; aws=aws)
                $function_name($(join(req_keys, ", ")), args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", args; aws=aws)
                """
        else
            return """\n
                $function_name(; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\"; aws=aws)
                $function_name(args::AbstractDict{String, Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$method\", \"$request_uri\", args; aws=aws)
                """
        end
    end

    """
        _generate_json_query_operation_definition(required_params::AbstractDict, optional_params::AbstractDict, function_name::String, service_name::String)

    Generate a JSON/Query high level definition.

    # Arguments
    - `required_params::AbstractDict`: Required parameters for the function
    - `optional_params::AbstractDict`: Optional parmaeters for the function
    - `function_name::String`: Name of the function to generate code
    - `service_name`: Name of the service associated with the function

    # Returns
    - `String`: Function definition as Julia code
    """
    function _generate_json_query_opeation_definition(required_params::AbstractDict, optional_params::AbstractDict, function_name::String, service_name::String)
        req_keys = [replace(key, "-"=>"_") for key in collect(keys(required_params))]

        idempotent_params = filter(p -> (p[2]["idempotent"]), optional_params)

        req_kv = ["\"$(p[1])\"=>$(replace(p[1], "-" => "_"))" for p in required_params]
        idempotent_kv = ["\"$(p[1])\"=>string(uuid4())" for p in idempotent_params]

        required = !isempty(req_kv)
        idempotent = !isempty(idempotent_kv)

        if required && idempotent
            return """\n
                $function_name($(join(req_keys, ", ")); aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}($(join(req_kv, ", ")), $(join(idempotent_kv, ", "))); aws=aws)
                $function_name($(join(req_keys, ", ")), args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(req_kv, ", ")), $(join(idempotent_kv, ", "))), args)); aws=aws)
                """
        elseif required
            return """\n
                $function_name($(join(req_keys, ", ")); aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}($(join(req_kv, ", "))); aws=aws)
                $function_name($(join(req_keys, ", ")), args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(req_kv, ", "))), args)); aws=aws)
                """
        elseif idempotent
            return """\n
                $function_name(; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}($(join(idempotent_kv, ", "))); aws=aws)
                $function_name(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(idempotent_kv, ", "))), args)); aws=aws)
                """
        else
            return """\n
                $function_name(; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\"; aws=aws)
                $function_name(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWS.aws_config) = $service_name(\"$function_name\", args; aws=aws)
                """
        end
    end

    """
        _generate_docstring(function_name, documentation, required_parameters, optional_parameters)

    Generate the docstring for the `function_name`.
    
    # Arguments
    - `function_name`: Name of the function
    - `documentation`: Documentation associated with the function
    - `required_parameters`: Required parameters for the function
    - `optional_parameters`: Optional parameters for the function

    # Returns
    - `String`: Docstring for the function
    """
    function _generate_docstring(function_name, documentation, required_parameters, optional_parameters)
        operation_definition = """
            $(repeat('"', 3))
                $function_name()

            $documentation\n
            """

        # Add in the required parameters if applicable
        if !isempty(required_parameters)
            operation_definition *= "# Required Parameters\n"

            for (required_key, required_value) in required_parameters
                operation_definition *= "- `$required_key`: $(required_value["documentation"])\n"
            end

            operation_definition *= "\n"
        end

        # Add in the optional parameters if applicable
        if !isempty(optional_parameters)
            operation_definition *= "# Optional Parameters\n"

            for (optional_key, optional_value) in optional_parameters
                operation_definition *= "- `$optional_key`: $(optional_value["documentation"])\n"
            end
        end

        operation_definition *= repeat('"', 3)
    end

    operation_definition = _generate_docstring(name, documentation, required_parameters, optional_parameters)

    if protocol in ("json", "query", "ec2")
        operation_definition *= _generate_json_query_opeation_definition(required_parameters, optional_parameters, name, service_name)
    elseif protocol in ("rest-json", "rest-xml")
        operation_definition *= _generate_rest_operation_defintion(required_parameters, optional_parameters, name, service_name, method, request_uri)
    end

    return operation_definition
end
end  # Module
