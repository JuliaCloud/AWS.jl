mutable struct ServiceFile
    repo::String
    name::String
    sha::String
    definition::Union{AbstractDict,Nothing}
end

function ServiceFile(repo::String, tree_item::AbstractDict)
    return ServiceFile(repo, tree_item["path"], tree_item["sha"], nothing)
end

function service_definition(
    service_file::ServiceFile; auth::GitHub.Authorization=GitHub.AnonymousAuth()
)
    if service_file.definition === nothing
        # Retrieve the contents of the ${service}.normal.json file
        service_blob = blob(service_file.repo, service_file.sha; auth=auth)
        def = JSON.parse(String(base64decode(service_blob.content)))
        service_file.definition = def
    end

    return service_file.definition
end

function Base.:(==)(a::ServiceFile, b::ServiceFile)
    return (
        a.repo == b.repo &&
        a.name == b.name &&
        a.sha == b.sha &&
        a.definition == b.definition
    )
end

"""
Get a list of all AWS service API definition files from the `awsk-sdk-js` GitHub repository.
"""
function _get_service_files(repo_name::String, auth::GitHub.Authorization)
    master_tree = @mock tree(repo_name, "master"; auth=auth)
    apis_sha = [t for t in master_tree.tree if t["path"] == "apis"][1]["sha"]
    files = @mock tree(repo_name, apis_sha)
    tree_items = files.tree

    filter!(f -> endswith(f["path"], ".normal.json"), tree_items)
    tree_items = _filter_latest_service_version(tree_items)

    return [ServiceFile(repo_name, item) for item in tree_items]
end

"""
Return a list of all AWS Services and their latest version.
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
Return a valid index into the string `str`, rounding towards the first index of `str` if `i` is not itself a valid index into `str`.
`i` must be within the bounds of `string`. `_validindex(str, i)` only protects against a `StringIndexError`, not a `BoundsError`.
"""
function _validindex(str, limit)
    prev = max(firstindex(str), prevind(str, limit))
    next = nextind(str, prev)

    return next == limit ? limit : prev
end

"""
Convert a function name from CamelCase to snake_case
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
        chop(function_name; head=1, tail=0)
    else
        function_name
    end
end

"""
Replace URI parameters with the appropriate syntax for Julia interpolation.

Find all URI parameters, and apply the following replacements:
    * { => \$(
    * } => )
    * - => _
    * + => empty string

Example: "/v1/configurations/{configuration-id}" => "/v1/configurations/\$(configuration_id)"
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
Clean up the documentation to make it Julia compiler and human-readable.
    * Remove any HTML tags
    * Remove any dollar signs
    * Remove any backslashes
    * Escape any double-quotes
"""
function _clean_documentation(documentation::String)
    documentation = replace(documentation, r"\<.*?\>" => "")
    documentation = replace(documentation, '$' => "")
    documentation = replace(documentation, '\\' => "")
    documentation = replace(documentation, '"' => "\\\"")

    return documentation
end

"""
Get the `service` and `version` from a filename.
Example filename: `{Service}-{Version}.normal.json`
"""
function _get_service_and_version(filename::String)
    try
        # Remove ".normal.json" suffix
        service_and_version = join(split(filename, '.')[1:(end - 2)], '.')

        service_and_version = split(service_and_version, '-')
        service = join(service_and_version[1:(end - 3)], '-')
        version = join(service_and_version[(end - 2):end], '-')

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
Get the required and optional parameters for a given operation.
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
    function _get_parameter_name(parameter::String, input_shape::AbstractDict{String,<:Any})
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

    required_parameters = LittleDict{String,Any}()
    optional_parameters = LittleDict{String,Any}()
    input_shape = shapes[input]

    if haskey(input_shape, "required")
        for parameter in input_shape["required"]
            parameter_name = _get_parameter_name(parameter, input_shape)

            # Check if the parameter needs to be in a certain place
            parameter_location = get(input_shape["members"][parameter], "location", "")

            documentation = _clean_documentation(
                get(input_shape["members"][parameter], "documentation", "")
            )

            required_parameters[parameter_name] = LittleDict{String,String}(
                "location" => parameter_location, "documentation" => documentation
            )
        end
    end

    if haskey(input_shape, "members")
        for (member_key, member_value) in input_shape["members"]
            parameter_name = get(
                input_shape["members"][member_key], "locationName", member_key
            )

            if !haskey(required_parameters, parameter_name)
                documentation = _clean_documentation(get(member_value, "documentation", ""))
                idempotent = get(member_value, "idempotencyToken", false)

                optional_parameters[parameter_name] = LittleDict{String,Union{String,Bool}}(
                    "documentation" => documentation, "idempotent" => idempotent
                )
            end
        end
    end

    return (sort(required_parameters), sort(optional_parameters))
end
