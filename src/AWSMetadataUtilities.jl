module AWSMetadataUtilities

using ..AWSExceptions
using Base64
using GitHub
using OrderedCollections: OrderedDict, LittleDict
using JSON
using Mocking


"""
    _get_aws_sdk_js_files(repo_name::String, auth::GitHub.OAuth2)

Get a list of all AWS service API definition files from the `awsk-sdk-js` GitHub repository.

# Arguments
- `repo_name::String`: aws-sdk-js repository
- `auth::GitHub.OAuth2`: OAuth2 credentials for authenticated requests

# Returns
- `Array{OrderedDict}`: Array of Dictionaries which contains information about each AWS Service
"""
function _get_aws_sdk_js_files(repo_name::String, auth::GitHub.OAuth2)
    master_tree = @mock tree(repo_name, "master"; auth=auth)
    apis_sha = [t for t in master_tree.tree if t["path"]=="apis"][1]["sha"]
    files = @mock tree(repo_name, apis_sha)
    files = files.tree

    filter!(f -> endswith(f["path"], ".normal.json"), files)

    return _filter_latest_service_version(files)
end

"""
    _filter_latest_service_version(services::AbstractArray)

Return a list of all AWS Services and their latest version.

# Arguments
- `services::AbstractArray`: Array of all AWS APIs and their versions

# Returns
- `Vector{OrderedDict}`: Array of the latest AWS Service definitions
"""
function _filter_latest_service_version(services::AbstractArray)
    seen_services = Set{String}()
    latest_versions = OrderedDict[]

    for service in reverse(services)
        service_name, _ = _get_service_and_version(service["path"])

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
        # Remove ".normal.json" suffix
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
    _generate_low_level_definitions(services::AbstractArray{<:AbstractDict}, repo_name::String, auth::GitHub.OAuth2)

Get the low-level definitions for all AWS Services.

# Arguments
- `services::Abstract{<:AbstractDict}`: List of AWS Services to generate low-level definitions
- `repo_name::String`: aws-sdk-js repository
- `auth::GitHub.OAuth2`: OAuth2 credentials for authenticated requests

# Returns
- `Vector{String}`: Array of low-level service code to be written into `AWSServices.jl`
"""
function _generate_low_level_definitions(services::AbstractArray, repo_name::String, auth::GitHub.OAuth2)
    service_definitions = String[]

    for service in services
        service_name = service["path"]
        @info "Generating low level wrapper for $service_name"

        # Get the contents of the ${Service}.normal.json file
        service_blob = blob(repo_name, service["sha"]; auth=auth)
        service = JSON.parse(String(base64decode(service_blob.content)))
        service_metadata = service["metadata"]

        definition = _generate_low_level_definition(service_metadata)
        push!(service_definitions, definition)
    end

    return service_definitions
end

"""
    _generate_low_level_definition(service::AbstractDict)

Get the low-level definition for an AWS Service.

# Arguments
- `service::AbstractDict`: AWS Service to generate the low-level code definition

# Returns
- `String`: Low-level definition for the AWS Service

# Throws
- `ProtocolNotFound`: If `service` is using a protocol that's not either `[rest-xml, rest-json, json, query]`
"""
function _generate_low_level_definition(service::AbstractDict)
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
    elseif protocol == "rest-json" && haskey(service_specifics, service_id)
        return "const $service_id = AWS.RestJSONService(\"$service_name\", \"$api_version\", $(service_specifics[service_id]))"
    elseif protocol == "rest-json"
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

- Remove any HTML tags
- Remove any dollar signs
- Remove any backslashes
- Escape any double-quotes

# Arguments
- `documentation::String`: Documentation to be cleaned

# Returns
- `String`: Cleaned documentation string
"""
function _clean_documentation(documentation::String)
    documentation = replace(documentation, r"\<.*?\>" => "")
    documentation = replace(documentation, '$' => "")
    documentation = replace(documentation, '\\' => "")
    documentation = replace(documentation, '"' => "\\\"")

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
    _format_name(function_name::String)

Convert a function name from CamelCase to snake_case

# Arguments
- `function_name::String`: Function name to be converted to snake_case

# Returns:
- `String`: snake_case version of the function_name
"""
function _format_name(function_name::String)
    # Replace a string of uppercase characters with themselves prefaced by an underscore
    # [A-Z](?![A-Z]) => Match a single uppercase character that is not followed by another uppercase character
    # |(A-Z]{1,})    => Match 1-Infinite amounts of uppercase characters
    function_name = replace(function_name, r"[A-Z](?![A-Z])|([A-Z]{1,})" => s"_\g<0>")

    # Lowercase the entire string
    function_name = lowercase(function_name)

    # Chop off the leading underscore
    return if startswith(function_name, "_")
        chop(function_name, head=1, tail=0)
    else
        function_name
    end
end

"""
    _get_function_parameters(input, shapes)

Get the required and optional parameters for a given operation.

# Arguments
- `input::String`: The input object for the given operation
- `shapes::AbstractDict{String, Any}`: Dictionary of all shapes for this AWS Service

# Returns
- `Tuple(Dict, Dict)`: (required_parameters, optional_parameters)
"""
function _get_function_parameters(input::String, shapes::AbstractDict{String})
    """
        _get_parameter_name(parameter::String, input_shape::AbstractDict{String, <:Any})

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
        nested_member = get(shapes[nested_shape], "member", Dict())

        # If nested_shape[member] exists return locationName (if exists), otherwise return the original parameter name
        return get(nested_member, "locationName", parameter)
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
        for (member_key, member_value) in input_shape["members"]
            parameter_name = get(input_shape["members"][member_key], "locationName", member_key)

            if !haskey(required_parameters, parameter_name)
                documentation = _clean_documentation(get(member_value, "documentation", ""))
                idempotent = get(member_value, "idempotencyToken", false)

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
        operations::AbstractDict{String, Any},
        shapes::AbstractDict{String, Any}
    )

Generate high-level definitions for the `service`.

# Arguments
- `service_name::String`: AWS `service`
- `protocol::String`: API protocol type
- `operations::AbstractDict{String, Any}`: Service API operations
- `shapes::AbstractDict{String, Any}`: All input shapes for this service

# Return
- `Array`: Array of all high-level definitions and documentation to be written into `services/{Service}.jl`
"""
function _generate_high_level_definitions(
    service_name::String,
    protocol::String,
    operations::AbstractDict,
    shapes::AbstractDict
)
    operation_definitions = String[]

    for (_, operation) in operations
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
- `required_parameters::AbstractDict{Any, Any}`: Required parameters for this services function
- `optional_parameters::AbstractDict{Any, Any}`: Optional parameters for this services function
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
        _generate_rest_operation_defintion(required_params::AbstractDict{String, Any}, optional_params::AbstractDict{String, Any}, function_name::String, service_name::String, method::String, request_uri::String)

    Generate function definition for a service request given required, header and idempotent parameters.

    # Arguments
    - `required_params::AbstractDict{String, Any}`: All required parameters which the function needs
    - `optional_params::AbstractDict{String, Any}`: All optional parameters which can be passed in
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

        formatted_function_name = _format_name(function_name)

        if required_keys && (idempotent || headers)
            return """
                $formatted_function_name($(join(req_keys, ", ")); aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", $params_headers_str; aws_config=aws_config)
                $formatted_function_name($(join(req_keys, ", ")), params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $params_headers_str, params)); aws_config=aws_config)
                """
        elseif !required_keys && (idempotent || headers)
            return """
                $formatted_function_name(; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", $params_headers_str; aws_config=aws_config)
                $formatted_function_name(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $params_headers_str, params)); aws_config=aws_config)
                """
        elseif required_keys && !isempty(req_kv)
            return """
                $formatted_function_name($(join(req_keys, ", ")); aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", $req_str); aws_config=aws_config)
                $formatted_function_name($(join(req_keys, ", ")), params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", Dict{String, Any}(mergewith(_merge, $req_str), params)); aws_config=aws_config)
                """
        elseif required_keys
            return """
                $formatted_function_name($(join(req_keys, ", ")); aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\"; aws_config=aws_config)
                $formatted_function_name($(join(req_keys, ", ")), params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", params; aws_config=aws_config)
                """
        else
            return """
                $formatted_function_name(; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\"; aws_config=aws_config)
                $formatted_function_name(params::AbstractDict{String, Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$method\", \"$request_uri\", params; aws_config=aws_config)
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
        req_keys = [replace(key, '-' => '_') for key in collect(keys(required_params))]

        idempotent_params = filter(p -> (p[2]["idempotent"]), optional_params)

        req_kv = ["\"$(p[1])\"=>$(replace(p[1], "-" => "_"))" for p in required_params]
        idempotent_kv = ["\"$(p[1])\"=>string(uuid4())" for p in idempotent_params]

        required = !isempty(req_kv)
        idempotent = !isempty(idempotent_kv)

        formatted_function_name = _format_name(function_name)

        if required && idempotent
            return """
                $formatted_function_name($(join(req_keys, ", ")); aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}($(join(req_kv, ", ")), $(join(idempotent_kv, ", "))); aws_config=aws_config)
                $formatted_function_name($(join(req_keys, ", ")), params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(req_kv, ", ")), $(join(idempotent_kv, ", "))), params)); aws_config=aws_config)
                """
        elseif required
            return """
                $formatted_function_name($(join(req_keys, ", ")); aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}($(join(req_kv, ", "))); aws_config=aws_config)
                $formatted_function_name($(join(req_keys, ", ")), params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(req_kv, ", "))), params)); aws_config=aws_config)
                """
        elseif idempotent
            return """
                $formatted_function_name(; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}($(join(idempotent_kv, ", "))); aws_config=aws_config)
                $formatted_function_name(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", Dict{String, Any}(mergewith(_merge, Dict{String, Any}($(join(idempotent_kv, ", "))), params)); aws_config=aws_config)
                """
        else
            return """
                $formatted_function_name(; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\"; aws_config=aws_config)
                $formatted_function_name(params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = $service_name(\"$function_name\", params; aws_config=aws_config)
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
        function_name = _format_name(function_name)
        args = join((_format_name(key) for (key, val) in required_parameters), ", ")
        maybejoin = isempty(args) ? "" : ", "
        operation_definition = """
            $(repeat('"', 3))
                $function_name($(args))
                $function_name($(args)$(maybejoin)params::Dict{String,<:Any})

            $(_wraplines(documentation))\n
            """

        # Add in the required parameters if applicable
        if !isempty(required_parameters)
            operation_definition *= "# Arguments\n"

            for (required_key, required_value) in required_parameters
                key = _format_name(required_key)
                operation_definition *= _wraplines("- `$key`: $(required_value["documentation"])"; delim="\n  ")
                operation_definition *= "\n"
            end

            operation_definition *= "\n"
        end

        # Add in the optional parameters if applicable
        if !isempty(optional_parameters)
            operation_definition *= """
                # Optional Parameters
                Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
                """

            for (optional_key, optional_value) in optional_parameters
                operation_definition *= _wraplines("- `\"$optional_key\"`: $(optional_value["documentation"])"; delim="\n  ")
                operation_definition *= "\n"
            end
        end

        operation_definition *= repeat('"', 3)
    end

    doc_string = _generate_docstring(name, documentation, required_parameters, optional_parameters)

    if protocol in ("json", "query", "ec2")
        function_string = _generate_json_query_opeation_definition(required_parameters, optional_parameters, name, service_name)
    elseif protocol in ("rest-json", "rest-xml")
        function_string = _generate_rest_operation_defintion(required_parameters, optional_parameters, name, service_name, method, request_uri)
    else
        throw(ProtocolNotDefined("$function_name is using a new protocol; $protocol which is not supported."))
    end

    return string(doc_string, '\n', function_string)
end

"""
    _wraplines(str, limit=92) -> String

Return a string with line breaks added such that lines are wrapped at or before the limit.
"""
function _wraplines(str, limit=92; delim="\n")
    lines = String[]

    while !isempty(str)
        line, str = _splitline(str, limit)
        push!(lines, rstrip(line))  # strip trailing whitespace
    end

    return join(lines, delim)
end

"""
    _splitline(str, limit) -> Tuple{String,String}

Split the string `str` at or before `limit`.

Prefers splitting the string on whitespace rather than mid-word, when possible.
`limit` is measured in codeunits, which is an upper-bound on the number of characters.
"""
function _splitline(str, limit)
    limit >= 1 || throw(DomainError(limit, "Lines cannot be split before the first char."))
    ncodeunits(str) <= limit && return (str, "")
    limit = _validindex(str, limit)
    first_line = str[1:limit]
    # split on whitespace if possible, else just split when we hit the limit.
    split_point = something(findlast(==(' '), first_line), limit)
    stop = _validindex(first_line, split_point)

    while ispunct(first_line[stop])  # avoid splitting escaped characters.
        stop = prevind(first_line, stop)
    end

    restart = nextind(first_line, stop)

    return (str[1:stop], str[restart:end])
end

"""
    _validindex(str, i)

Return a valid index into the string `str`, rounding towards the first index of `str` if
`i` is not itself a valid index into `str`.

`i` must be within the bounds of `string`. `_validindex(str, i)` only protects against a
`StringIndexError`, not a `BoundsError`.
"""
function _validindex(str, limit)
    prev = max(firstindex(str), prevind(str, limit))
    next = nextind(str, prev)

    return next == limit ? limit : prev
end

end  # Module
