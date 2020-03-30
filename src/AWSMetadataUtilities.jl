module AWSMetadataUtilities

include("AWSExceptions.jl")

using .AWSExceptions
using DataStructures: OrderedDict
using HTTP
using JSON

export _get_aws_sdk_js_files, _get_service_and_version, _filter_latest_service_version,
    _generate_low_level_definition, _documentation_cleaning, _get_function_parameters,
    _generate_high_level_definition, _generate_high_level_definitions,
    InvalidFileName, ProtocolNotDefined

"""
    _get_aws_api_definitions()

Get a list of all AWS service API definition files from the `awsk-sdk-js` GitHub repository.

# Returns
- ``: List of AWS service API definition files
"""
function _get_aws_sdk_js_files()
    headers = ["User-Agent" => "JuliaCloud/AWS.jl"]
    url = "https://api.github.com/repos/aws/aws-sdk-js/contents/apis"

    req = HTTP.get(url, headers)
    files = JSON.parse(String(req.body), dicttype=OrderedDict)
    filter!(f -> occursin(r".normal.json$", f["name"]), files)  # Only get ${Service}.normal.json files
    files = _filter_latest_service_version(files)

    return files
end

"""
    _filter_latest_service_version(services::Array{Any})

Return a list of all AWS Services and their latest version.

# Arguments
- `services::Array)`: List of all AWS APIs and their versions

# Returns
- `latest_versions::Dict[]`: List of the latest AWS Service definitions
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
- `Tuple`: (`service`, `version`)
"""
function _get_service_and_version(filename::String)
    try
        service_and_version = join(split(filename, '.')[1:end-2],'.')
        service_and_version = split(service_and_version, '-')
        service = join(service_and_version[1:end-3], '-')
        version = join(service_and_version[end-2:end], '-')

        return (service, version)
    catch BoundsError
        throw(InvalidFileName("$filename is an invalid AWS JSON filename."))
    end
end

"""
    _generate_low_level_definitions(services::Array{OrderedDict{String, Any}})

Get the low-level definitions for all AWS Services.

# Arguments
- `services::Array{OrderedDict{String, Any}}`: List of AWS Services to generate low-level definitions

# Returns
- `String[]`: List of low-level service code to be written into `AWSServices.jl`
"""
function _generate_low_level_definitions(services::Array{OrderedDict})
    service_definitions = String[]

    for service in services
        service_name = service["name"]
        println("Generating low level wrapper for $service_name")

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

    if protocol == "rest-xml"
        return "const $service_id = AWS.RestXMLService(\"$service_name\", \"$api_version\")"
    elseif protocol in ["ec2", "query"]
        return "const $service_id = AWS.QueryService(\"$service_name\", \"$api_version\")"
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
    _documentation_cleaning(documentation::String)

Clean up the documentation to make it Julia compiler and human-readable.

- Remove anything in-between <> HTML tags
- Remove any dollar signs
- Remove any \\

# Arguments
- `documentation::String`: Documentation to be cleaned

# Returns
- `String`: Cleaned documentation string
"""
function _documentation_cleaning(documentation::String)
    documentation = replace(documentation, r"\<.*?\>" => "")
    documentation = replace(documentation, '$' => ' ')
    documentation = replace(documentation, "\\" => ' ')

    return documentation
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
    required_parameters = Dict()
    optional_parameters = Dict()

    input_shape = shapes[input]

    if haskey(input_shape, "required")
        for parameter in input_shape["required"]
            required_parameters[parameter] = _documentation_cleaning(get(input_shape["members"][parameter], "documentation", ""))
        end
    end

    if haskey(input_shape, "members")
        for parameter in input_shape["members"]
            parameter_name = parameter[1]

            if !haskey(required_parameters, parameter_name)
                optional_parameters[parameter_name] = _documentation_cleaning(get(parameter[2], "documentation", ""))
            end
        end
    end

    return (required_parameters, optional_parameters)
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
- `List`: List of all high-level definitions and documentation to be written into `services/{Service}.jl`
"""
function _generate_high_level_definitions(
    service_name::String,
    protocol::String,
    operations::Dict,
    shapes::Dict
)
    operation_definitions = []

    for operation in operations
        operation = operation[2]
        name = operation["name"]
        method = operation["http"]["method"]
        request_uri = operation["http"]["requestUri"]

        documentation = ""

        if haskey(operation, "documentation")
            documentation = _documentation_cleaning(operation["documentation"])
        end

        required_parameters = Dict()
        optional_parameters = Dict()

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
    required_parameters::Dict,
    optional_parameters::Dict,
    documentation::String
)
    required_param_keys = collect(keys(required_parameters))

    operation_definition = """
    \"\"\"
        $name()

    $documentation
    """

    # Add in the required parameters if applicable
    if !isempty(required_parameters)
        operation_definition = operation_definition * """

        Required Parameters
        $(json(required_parameters, 2))"""
    end

    # Add in the optional parameters if applicable
    if !isempty(optional_parameters)
        operation_definition = operation_definition * """

        Optional Parameters
        $(json(optional_parameters, 2))"""
    end

    operation_definition = operation_definition * "\"\"\""

    # Depending on the protocol type of the operation we need to generate a different definition
    if protocol in ["json", "query", "ec2"]
        if !isempty(required_parameters)
            operation_definition = operation_definition * "\n$name(args) = $service_name(\"$name\", args)\n"
        else
            operation_definition = operation_definition * """\n
                $name() = $service_name(\"$name\")
                $name(args) = $service_name(\"$name\", args)
                """
        end
    elseif protocol == "rest-json"
        if !isempty(required_parameters)
            operation_definition = operation_definition * "\n$name(args) = $service_name(\"$method\", \"$request_uri\", args)\n"
        else
            operation_definition = operation_definition * """\n
            $name() = $service_name(\"$method\", \"$request_uri\")
            $name(args) = $service_name(\"$method\", \"$request_uri\", args)
            """
        end
    elseif protocol == "rest-xml"
        if !isempty(required_parameters)
            operation_definition = operation_definition * """\n
            $name($(join(required_param_keys, ", "))) = $service_name(\"$method\", \"$request_uri\")
            $name($(join(required_param_keys, ", ")), args) = $service_name(\"$method\", \"$request_uri\", args)
            $name(a...; b...) = $name(a..., b)
            """
        else
            operation_definition = operation_definition * """\n
            $name() = $service_name(\"$method\", \"$request_uri\")
            $name(args) = $service_name(\"$method\", \"$request_uri\", args)
            $name(a...; b...) = $name(a..., b)
            """
        end
    end

    return operation_definition
end

end
