mutable struct ServiceFile
    repo::String
    name::String
    sha::String
    definition::Union{AbstractDict,Nothing}
end

function ServiceFile(repo::String, blob::AbstractDict)
    return ServiceFile(repo, blob["path"], blob["sha"], nothing)
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
Get a list of all AWS service API definition files from the `aws-sdk-js` GitHub repository.
"""
function _get_service_files(auth::GitHub.Authorization)
    github_repo = "aws/aws-sdk-js"  # Owner and repository name
    master_tree = @mock tree(github_repo, "master"; auth=auth)
    apis_sha = [t for t in master_tree.tree if t["path"] == "apis"][1]["sha"]
    files = @mock tree(github_repo, apis_sha)
    tree_items = files.tree

    service_file_blobs = filter!(tree_items) do t
        t["type"] == "blob" && endswith(t["path"], ".normal.json")
    end
    service_file_blobs = _filter_latest_service_version(service_file_blobs)

    return [ServiceFile(github_repo, blob) for blob in service_file_blobs]
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
function _wraplines(str; limit=92, indent=0)
    lines = String[]

    first_line = true
    while !isempty(str)
        line_limit = limit - (first_line ? 0 : indent)

        line, str = try
            _splitline(str; limit=line_limit)
        catch e
            @warn "Unable to split line on string:\n$(repr(str))"
            rethrow()
        end

        # Avoid indenting an empty `str` as this will cause an infinite loop
        if !isempty(str)
            # Apply the indentation of the original line to where the line was split to
            # ensure Markdown indentation is respected.
            line_indent = !endswith(line, '\n') ? get_markdown_indent(line) : indent

            if line_indent > 0
                str = " "^line_indent * str
            end
        end

        # Remove trailing whitespace from each line (including the delimiter)
        line = rstrip(line)

        push!(lines, line)
        first_line = false
    end

    return join(lines, "\n")
end

function get_indent(str::AbstractString)
    indent = 0
    for c in str
        isspace(c) || break
        indent += 1
    end
    return indent
end

function get_markdown_indent(str::AbstractString)
    state = :whitespace_only
    indent = 0
    for (i, c) in enumerate(str)
        if state in (:whitespace_only, :unordered_list, :ordered_list) && c == ' '
            indent = i
        elseif state == :whitespace_only && c == '-'
            state = :unordered_list
            indent = i
        elseif state == :whitespace_only && isdigit(c)
            state = :ordered_list_partial
        elseif state == :ordered_list_partial && c == '.'
            state = :ordered_list
            indent = i
        else
            break
        end
    end
    return indent
end

"""
Split the string `str` at or before `limit`.
Prefers splitting the string on whitespace rather than mid-word, when possible.
`limit` is measured in codeunits, which is an upper-bound on the number of characters.
"""
function _splitline(str; limit)
    limit >= 1 || throw(DomainError(limit, "Lines cannot be split before the first char."))

    min_index = firstindex(str)
    max_index = lastindex(str)

    # Fast path: If a newline occurs before the limit we'll wrap the line there. When `str`
    # is shorter than the limit and doesn't contain a newline we'll return the string as is.
    stop = findfirst(==('\n'), str)
    if !isnothing(stop) && stop <= limit
        line = SubString(str, min_index, stop)
        i = nextind(str, stop)
        rest = i <= max_index ? SubString(str, i, max_index) : ""
        return line, rest
    elseif ncodeunits(str) <= limit
        return (str, "")
    end

    i = min_index
    col = 1
    stop = nothing

    link_state = Symbol[]
    indent = get_markdown_indent(str)

    function peek(state)
        isempty(link_state) && return nothing
        return state[end]
    end

    @inbounds while i <= max_index
        c, ii = iterate(str, i)::Tuple{Char,Int}
        at_limit = col >= limit

        if c == '['
            push!(link_state, :text)
        elseif c == ']' && peek(link_state) === :text
            old_state = pop!(link_state)
            push!(link_state, :post_text)
        elseif c == '(' && peek(link_state) === :post_text
            old_state = pop!(link_state)
            push!(link_state, :href)
        elseif c == ')' && peek(link_state) === :href
            pop!(link_state)
        end

        # TODO: It would be preferrable only avoid disallow wrapping when inside an href.
        # Unfortunately, changing that here would cause our state machine to not detect
        # the link on the next line.
        in_link = peek(link_state) !== nothing
        if in_link
            stop = nothing
        elseif c == '\n'
            stop = i
            break
        elseif i > indent && (isspace(c) || c == '-')
            stop = i
        end

        at_limit && !isnothing(stop) && break

        i = ii
        col += 1
    end

    if !isnothing(stop)
        line = SubString(str, min_index, stop)
        i = nextind(str, stop)
        rest = i <= max_index ? SubString(str, i, max_index) : ""
    else
        line, rest = (str, "")
    end

    return line, rest
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
function _format_name(function_name::AbstractString)
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

function html_to_markdown(html::AbstractString)
     markdown = run(Pandoc.Converter(; input=html, from="html", to="markdown", columns=92, wrap="auto"))
     markdown = reformat_dl(markdown)
     markdown = replace(markdown, r"(?<!\\)((?:\\\\)*)\\([`\"])" => s"\1\2")
     return markdown
end

function reformat_dl(input::AbstractString)
    output = IOBuffer()
    state = :title
    indent = 0
    for line in eachline(IOBuffer(input); keep=true)
        if state !== :body && occursin(r"^[A-Z ]"i, line)
            write(output, line)
            state = :blank
        elseif state === :blank && line == "\n"
            write(output, line)
            state = :colon
        elseif state === :colon && startswith(line, ':')
            m = match(r"^:\ *", line)
            indent = ncodeunits(m.match)
            write(output, line[(indent + 1):end])
            state = :body
        elseif state === :body && line == "\n"
            write(output, line)
        elseif state === :body && startswith(line, " "^indent)
            write(output, line[(indent + 1):end])
        else
            write(output, line)
            state = :title
        end
    end

    return String(take!(output))
end

"""
Clean up the documentation to make it Julia compiler and human-readable.

- Remove any HTML tags
- Remove any dollar signs
- Remove any backslashes
- Escape any double-quotes
- Escape any patterns which would be interpreted as markdown links
"""
function _clean_documentation(documentation::AbstractString)
    # Note: The HTML we're dealing with is overall pretty simple and I don't believe we need
    # to deal with recursive blocks. If we do we'd need something like:
    # r"<p>((?:(?=<p>)(?R)|.*?)*)</p>"

    # documentation = replace(documentation, r"\n(?!\n)\s+"s => "")

    # Add extra newline between adjacent paragraphs.
    documentation = replace(documentation, r"\ *<p>\ *((?:(?!<p>).)*?)\ *</p>(?=\s*<p>)"s => s"\1\n\n")

    # Remove remaining paragraphs
    documentation = replace(documentation, r"\ *<p>\ *(.*?)\ *</p>"s => s"\1")


    documentation = replace(
        documentation, r"<a href=\"([^\"]*)\">(.*?)</a>"s => s"[\2](\1)"
    )
    documentation = replace(
        documentation, r"<replaceable>{(.*?)}</replaceable>" => s"\\$(\1)"
    )
    documentation = replace(
        documentation, r"<replaceable></replaceable>{(.*?)}" => s"\\$(\1)"
    ) # Correctable mistake

    # TODO: Need to do more advance handling here as parameter names here won't match
    # modified parameters (see `accessanalyzer.check_no_new_access`)
    documentation = _replace(
        documentation,
        r"\ *<code>\s*(.*?)\s*</code> (request parameter)" => function (m)
            return "`$(_format_name(m[1]))` $(m[2])"
        end,
    )
    documentation = replace(documentation, r"<code>\ *(.*?)\ *</code>" => s"`\1`")

    # See: `accessanalyzer.create_archive_rule`
    documentation = replace(documentation, r"<b>(.*?)</b>" => s"**\1**")

    # See: `account.list_regions`
    documentation = replace(documentation, r"<i>(.*?)</i>"s => s"*\1*")

    documentation = _replace(
        documentation,
        r"<a>(.*?)</a> action" => (m -> "[`$(_format_name(m[1]))`](@ref) action"),
    )

    # _replace("<ul> <li> foo </li> <li> bar </li> </ul>", r"<ul>\s*(.*?)\s*</ul>" => (m -> replace(m[1], r"<li>\s*(.*?)\s*</li>" => s"- \1\n")))
    # documentation = "<ul> <li>
    #  `(63 octets).(63 octets).(63 octets).(61 octets)` is legal because the total length is 253
    # octets (63+1+63+1+63+1+61) and no label exceeds 63 octets. </li> <li>  `(64 octets).(63
    # octets).(63 octets).(61 octets)` is not legal because the total length exceeds 253 octets
    # (64+1+63+1+63+1+61) and the first label exceeds 63 octets. </li> <li>  `(63 octets).(63
    # octets).(63 octets).(62 octets)` is not legal because the total length of the DNS name
    # (63+1+63+1+63+1+62) exceeds 253 octets. </li> </ul>"
    documentation = _replace(
        documentation,
        r"<ul>\s*(.*?)\s*</ul>"s => function (m)
            return "\n\n" * replace(m[1], r"\s*<li>\s*(.*?)\s*</li>"s => s"- \1\n") * "\n"
        end,
    )

    # <ol> <li> In Amazon Web Services Private CA, call the
    # [CreateCertificateAuthority](https://docs.aws.amazon.com/privateca/latest/APIReference/API_C
    # reateCertificateAuthority.html) action to create the private CA that you plan to back with
    # the imported certificate. </li> <li> Call the
    # [GetCertificateAuthorityCsr](https://docs.aws.amazon.com/privateca/latest/APIReference/API_G
    # etCertificateAuthorityCsr.html) action to generate a certificate signing request (CSR).
    # </li> <li> Sign the CSR using a root or intermediate CA hosted by either an on-premises PKI
    # hierarchy or by a commercial CA. </li> <li> Create a certificate chain and copy the signed
    # certificate and the certificate chain to your working directory. </li> </ol>

    # Markdown does support using `1.` repeatedly for ordered lists but we'll populte the
    # actual value to make the code easier to read.
    documentation = _replace(
        documentation,
        r"<ol>\s*(.*?)\s*</ol>"s => function (m)
            i = 0
            return "\n\n" * _replace(
                m[1], r"\s*<li>\s*(.*?)\s*</li>"s => (m -> (i += 1; "$i. $(m[1])\n"))
            ) * "\n"
        end,
    )

    # <p class="title"> **About Permissions** </p>
    # Making an assumption about header depth
    documentation = replace(
        documentation, r"\s*<p class=\"title\"> \*\*(.*?)\*\* </p>\s*" => s"\n\n## \1\n\n"
    )

    # Escape any backslashes
    documentation = replace(documentation, "\\" => "\\\\")

    documentation = replace(documentation, r"(?<!\\)\$" => "\\\$")
    documentation = replace(documentation, "\"\"\"" => "\\\"\\\"\\\"")

    documentation = _replace(
        documentation,
        r"\s*<(note|important)>\s*(.*?)\s*</\1>"s => function (m)
            note = replace(m[2], "\n" => "\n    ") # Update indentation
            return "\n\n!!! $(m[1])\n    $note\n\n"
        end,
    )

    # Remove extra blank lines
    documentation = replace(documentation, r"\n([ \t]*\n){2,}" => "\n\n")

    contains(documentation, "scanrange") && @info documentation

    return documentation
end

# Custom `replace` function which allows arbitrary code to be executed in the replacment
function _replace(str::AbstractString, (pat, sub)::Pair{Regex,<:Function})
    i = firstindex(str)
    m = match(pat, str, i)
    while !isnothing(m)
        replacement = sub(m)

        before = SubString(str, firstindex(str), prevind(str, m.offset))
        after = SubString(str, m.offset + ncodeunits(m.match))
        str = string(before, replacement, after)

        i = ncodeunits(before) + ncodeunits(replacement)
        m = match(pat, str, i)
    end

    return str
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
