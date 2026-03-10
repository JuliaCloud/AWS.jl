struct ServiceFile
    file_name::String
    content::String
end

function ServiceFile(tree::AbstractDict; auth::GitHub.Authorization)
    m = match(r"^\Qhttps://api.github.com/repos/\E(?<repo>[^/]+/[^/]+)", tree["url"])
    if isnothing(m)
        throw(ArgumentError("Unable to determine GitHub repo from: \"$(tree["url"])\""))
    end
    github_repo = m[:repo]
    blob = GitHub.blob(github_repo, tree["sha"]; auth)
    return ServiceFile(tree["path"], String(blob))
end

# Avoid printing contents to the REPL as they can be quite large
function Base.show(io::IO, sf::ServiceFile)
    println(io, "ServiceFile($(repr(sf.file_name)), \"...\")")
    return nothing
end

"""
    _get_service_model_trees(; auth::GitHub.Authorization) -> Vector{Dict}

List of all of the tree blobs pertaining to AWS service API definition files. These can be
loaded by `ServiceFile`.
"""
function _get_service_model_trees(; auth::GitHub.Authorization)
    # Navigating to: https://github.com/aws/aws-sdk-js-v3/tree/main/codegen/sdk-codegen/aws-models
    # via https://docs.github.com/en/rest/git/trees?apiVersion=2022-11-28#get-a-tree
    github_repo = "aws/aws-sdk-js-v3"  # Owner and repository name
    subdir = "codegen/sdk-codegen/aws-models"
    tree = @mock GitHub.tree(github_repo, "main"; auth)

    function descend(tree::GitHub.Tree, dir)
        sha = only(t["sha"] for t in tree.tree if t["type"] == "tree" && t["path"] == dir)
        return @mock GitHub.tree(github_repo, sha; auth)
    end

    for dir in split(subdir, '/')
        tree = descend(tree, dir)
    end

    return filter!(tree.tree) do t
        t["type"] == "blob" && endswith(t["path"], ".json")
    end
end

function _parse_smithy_model(model::AbstractString)
    return _parse_smithy_model(JSON.parse(model))
end


"""
Convert a Smithy 2.0 model (parsed from JSON) into the legacy format which was used by
`aws-sdk-js` and is expected by AWS.jl code generators.
"""
function _parse_smithy_model(model::AbstractDict)
    smithy_version = get(model, "smithy", nothing)
    if smithy_version != "2.0"
        error("Model version is not Smithy 2.0 (found version \"$smithy_version\")")
    end

    raw_shapes = model["shapes"]

    # Find the service shape
    service_shape_id, service_shape = only(
        (k, v) for (k, v) in raw_shapes if get(v, "type", nothing) == "service"
    )

    traits = get(service_shape, "traits", Dict())
    service_info = get(traits, "aws.api#service", Dict())

    # Extract service metadata
    signing_name = get(get(traits, "aws.auth#sigv4", Dict()), "name", nothing)
    endpoint_prefix = get(service_info, "endpointPrefix", signing_name)
    service_id = get(service_info, "sdkId", _shape_name(service_shape_id))

    # Version is on the service shape; fall back to extracting from docId (e.g. acm-pca)
    api_version = get(service_shape, "version") do
        doc_id = get(service_info, "docId", "")
        m = match(r"\d{4}-\d{2}-\d{2}$", doc_id)
        if !isnothing(m)
            m.match
        else
            error("Unable to determine API version model: \"$endpoint_prefix\"")
        end
    end

    protocol, json_version = _preferred_protocol(traits)

    metadata = Dict{String,Any}(
        "protocol" => protocol,
        "endpointPrefix" => endpoint_prefix,
        "serviceId" => service_id,
        "apiVersion" => api_version,
    )

    # `signingName` only need to be defined when it differs from `endpointPrefix`
    if signing_name !== nothing && signing_name != endpoint_prefix
        metadata["signingName"] = signing_name
    end

    if protocol == "json"
        metadata["jsonVersion"] = json_version
        metadata["targetPrefix"] = _shape_name(service_shape_id)
    end

    # Build shapes dict (strip namespaces, convert member traits to legacy format)
    shapes = Dict{String,Any}()
    for (shape_id, shape) in raw_shapes
        if get(shape, "type", nothing) in ("structure", "list", "set")
            shapes[_shape_name(shape_id)] = _smithy_to_legacy_shape(shape)
        end
    end

    # Build operations dict
    operations = Dict{String,Any}()
    for (k, v) in raw_shapes
        get(v, "type", nothing) == "operation" || continue

        operation_name = _shape_name(k)
        operation_traits = get(v, "traits", Dict())
        http = get(operation_traits, "smithy.api#http", nothing)

        operation = Dict{String,Any}("name" => operation_name)

        if haskey(operation_traits, "smithy.api#http")
            http = operation_traits["smithy.api#http"]
            operation["http"] = Dict{String,Any}(
                "method" => http["method"], "requestUri" => http["uri"]
            )
        else
            # JSON/Query/EC2 protocol operations don't use HTTP routing
            operation["http"] = Dict{String,Any}("method" => "POST", "requestUri" => "/")
        end

        if haskey(v, "input")
            operation["input"] = Dict{String,Any}(
                "shape" => _shape_name(v["input"]["target"])
            )
        end

        if haskey(operation_traits, "smithy.api#documentation")
            operation["documentation"] = operation_traits["smithy.api#documentation"]
        end

        operations[operation_name] = operation
    end

    return Dict{String,Any}(
        "metadata" => metadata, "operations" => operations, "shapes" => shapes
    )
end

"""
    _shape_name(id::String) -> String

Extract the short name from a Smithy shape ID by stripping the namespace.

Example: `"com.amazonaws.s3#BucketName"` => `"BucketName"`
"""
function _shape_name(id::String)
    # https://smithy.io/2.0/spec/model.html#shape-id
    return String(last(split(id, '#'; limit=2)))
end

"""
    _preferred_protocol(traits::AbstractDict) -> Tuple{String,String}

Determine the preferred legacy protocol and JSON version from the available Smithy protocol
traits.
"""
function _preferred_protocol(traits::AbstractDict)
    # Order mostly doesn't matter here as only two services utilize multiple primary
    # protocols:
    #
    # - monitoring: awsJson1_0, awsQuery, awsQueryCompatible
    # - sqs: awsJson1_0, awsQueryCompatible

    return if haskey(traits, "aws.protocols#awsQuery")
        ("query", nothing)
    elseif haskey(traits, "aws.protocols#ec2Query")
        ("ec2", nothing)
    elseif haskey(traits, "aws.protocols#restXml")
        ("rest-xml", nothing)
    elseif haskey(traits, "aws.protocols#restJson1")
        ("rest-json", nothing)
    elseif haskey(traits, "aws.protocols#awsJson1_1")
        ("json", "1.1")
    elseif haskey(traits, "aws.protocols#awsJson1_0")
        ("json", "1.0")
    else
        aws_protocol_traits = filter(startswith("aws.protocols#"), collect(keys(traits)))
        if !isempty(aws_protocol_traits)
            throw(
                ProtocolNotDefined(
                    "Service only uses unsupported AWS protocol(s): $(join(aws_protocol_traits, ", "))",
                ),
            )
        else
            throw(ProtocolNotDefined("Service does not define any AWS protocols"))
        end
    end
end

"""
Convert a Smithy shape into the legacy `aws-sdk-js` model format.
"""
function _smithy_to_legacy_shape(shape::AbstractDict)
    shape_type = get(shape, "type", nothing)
    if shape_type == "structure"
        return _smithy_to_legacy_structure(shape)
    elseif shape_type in ("list", "set")
        return _smithy_to_legacy_list(shape)
    elseif !isnothing(shape_type)
        throw(ArgumentError("Unhandled Smithy shape type: $shape_type"))
    else
        throw(ArgumentError("Smithy shape has no type"))
    end
end

function _smithy_to_legacy_structure(shape::AbstractDict)
    members = get(shape, "members", Dict())
    required_list = String[]
    legacy_members = Dict{String,Any}()

    for (member_name, member) in members
        member_traits = get(member, "traits", Dict())
        legacy_member = Dict{String,Any}()

        # Determine location and locationName from HTTP binding traits
        if haskey(member_traits, "smithy.api#httpLabel")
            legacy_member["location"] = "uri"
            legacy_member["locationName"] = get(
                member_traits, "smithy.api#xmlName", member_name
            )
        elseif haskey(member_traits, "smithy.api#httpHeader")
            legacy_member["location"] = "header"
            legacy_member["locationName"] = member_traits["smithy.api#httpHeader"]
        elseif haskey(member_traits, "smithy.api#httpQuery")
            legacy_member["location"] = "querystring"
            legacy_member["locationName"] = member_traits["smithy.api#httpQuery"]
        elseif haskey(member_traits, "smithy.api#xmlName")
            legacy_member["location"] = ""
            legacy_member["locationName"] = member_traits["smithy.api#xmlName"]
        else
            legacy_member["location"] = ""
        end

        legacy_member["shape"] = _shape_name(member["target"])

        if haskey(member_traits, "smithy.api#documentation")
            legacy_member["documentation"] = member_traits["smithy.api#documentation"]
        end

        if haskey(member_traits, "smithy.api#idempotencyToken")
            legacy_member["idempotencyToken"] = true
        end

        if haskey(member_traits, "smithy.api#required")
            push!(required_list, member_name)
        end

        legacy_members[member_name] = legacy_member
    end

    result = Dict{String,Any}("members" => legacy_members)
    isempty(required_list) || (result["required"] = required_list)
    return result
end

function _smithy_to_legacy_list(shape::AbstractDict)
    member = get(shape, "member", Dict())
    member_traits = get(member, "traits", Dict())
    legacy_member = Dict{String,Any}()

    if haskey(member_traits, "smithy.api#xmlName")
        legacy_member["locationName"] = member_traits["smithy.api#xmlName"]
    end

    return Dict{String,Any}("member" => legacy_member)
end

"""
Return a string with line breaks added such that lines are wrapped at or before the limit.
"""
function _wraplines(str; limit=92, base_indent=0)
    limit >= 1 || throw(DomainError(limit, "Lines limit must at least be 1."))
    lines = String[]

    first_line = true
    prev_str = ""
    while !isempty(str)
        line_limit = limit

        if str == prev_str
            error("Internal failure: Splitting $(repr(str)) would cause an infinite loop")
            break
        end
        prev_str = str

        line, str = try
            _splitline(str; limit)
        catch e
            @warn "Unable to split line on string:\n$(repr(str))"
            rethrow()
        end

        # println("===")
        # @show line str

        # Avoid indenting an empty `str` as this will cause an infinite loop
        if !isempty(str)

            # Inherit the indentation of the original line were we've introduced the split
            # to ensure Markdown indentation is respected. If the split occurs on an
            # existing newline we'll apply the `base_indent` which allows the user to alter
            # the indentation.
            if !endswith(line, '\n')
                indent = get_markdown_indent(line)
                str = lstrip(str, ' ')
            else
                indent = base_indent
            end

            # @show line_indent

            if indent > 0
                str = " "^indent * str
            end
        end

        # @show line str

        if lstrip(line, ' ') == "\n"
            push!(lines, "")
        else
            # Remove trailing whitespace from each line
            line = rstrip(line)
            !isempty(line) && push!(lines, line)
        end

        # @show lines

        first_line = false
    end

    # Remove empty lines at the end of the string
    while !isempty(lines) && isempty(lines[end])
        pop!(lines)
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
    prev_i = 0
    for (i, c) in enumerate(str)
        if state == :whitespace_only && c == '-'
            state = :unordered_list
            indent = i
        elseif state == :whitespace_only && isdigit(c)
            state = :ordered_list_partial
        elseif state == :ordered_list_partial && c == '.'
            state = :ordered_list
            indent = i
        elseif state in (:unordered_list, :ordered_list) && c == ' '
            indent = i
        elseif state === :whitespace_only && c != ' '
            indent = prev_i
            break
        elseif state !== :whitespace_only
            break
        end
        prev_i = i
    end
    return indent
end

"""
Split the string `str` at or before `limit`.
Prefers splitting the string on whitespace rather than mid-word, when possible.
`limit` is measured in codeunits, which is an upper-bound on the number of characters.
"""
function _splitline(str; limit)
    limit >= 1 || throw(DomainError(limit, "Lines limit must at least be 1."))

    min_index = firstindex(str)
    max_index = lastindex(str)

    i = min_index
    col = 1
    prev_c = '\0'
    stop = nothing

    whitespace_only = true
    link_state = Symbol[]
    code_state = nothing
    indent = get_markdown_indent(str)

    function peek(state)
        isempty(link_state) && return nothing
        return state[end]
    end

    @inbounds while i <= max_index
        c, ii = iterate(str, i)::Tuple{Char,Int}
        # at_limit = col >= limit

        # Basic code block handling. Not dealing with multi-line code blocks currently
        if code_state === nothing && c == '`'
            code_state = :body
        elseif code_state === :body && c == '`'
            code_state = nothing
        end

        # Avoid line wrapping inside of a code block.
        in_code = code_state === :body

        if !in_code
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
        end

        # TODO: It would be preferrable only avoid disallow wrapping when inside an href.
        # Unfortunately, changing that here would cause our state machine to not detect
        # the link on the next line.
        in_link = peek(link_state) !== nothing

        if !in_link && !in_code && c == '\n'
            stop = ii
            break
        elseif whitespace_only && !isspace(c)
            whitespace_only = false
        elseif in_link
            stop = nothing
        elseif !whitespace_only && !in_code && (c == ' ' || prev_c == ' ' || prev_c == '-')
            stop = i
        end

        at_limit = col > limit

        # println("---")
        # @show c prev_c i col stop limit at_limit max_index whitespace_only in_code

        # Break early if:
        # - We are at the line limit
        # - We have a stop index
        # - We have iterated through the entire whitespace block
        at_limit && !isnothing(stop) && !isspace(c) && break

        # Ignore any previously found `stop` when we read the end of the string and have
        # yet to it the limit.
        if i == max_index
            stop = nothing
            break
        end

        i = ii
        col += 1
        prev_c = c
    end

    if !isnothing(stop)
        line = SubString(str, min_index, prevind(str, stop))
        rest = SubString(str, stop, max_index)

        # line = SubString(str, min_index, stop)
        # i = nextind(str, stop)
        # rest = i <= max_index ? SubString(str, i, max_index) : ""
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
Clean up the documentation to make it Julia compiler and human-readable.

- Remove any HTML tags
- Remove any dollar signs
- Remove any backslashes
- Escape any double-quotes
- Escape any patterns which would be interpreted as markdown links
"""
function _html_to_markdown(doc::AbstractString, doc_refs::AbstractDict=Dict())
    # Note: The HTML we're dealing with is overall pretty simple and I don't believe we need
    # to deal with recursive blocks. If we do we'd need something like:
    # r"<p>((?:(?=<p>)(?R)|.*?)*)</p>"

    # Whitespace isn't very meaningful in HTML so this should be safe. We could run into
    # issues with code blocks.
    doc = replace(doc, r"\s{2,}|\n"s => " ")

    # Indicates portions of the text the user is intented to replace
    doc = replace(doc, r"<replaceable>{(.*?)}</replaceable>" => s"\\$(\1)")
    doc = replace(doc, r"<replaceable></replaceable>{(.*?)}" => s"\\$(\1)") # Correctable mistake

    # Update documentation references to modified function names and arguments to match
    # TODO: More advance handling could be done here.
    doc = _replace(
        doc,
        r"<code>\s*((?:(?!<code>).)*?)\s*</code>(?= request parameter)"s => function (m)
            return "`$(_format_name(m[1]))`"
        end,
    )

    # Only creating references for a set of operations
    doc = _replace(
        doc,
        r"<code>\s*((?:(?!<code>).)*?)\s*</code>(?= operation)"s => function (m)
            func_name = get(doc_refs, m[1], nothing)
            return !isnothing(func_name) ? "[`$func_name`](@ref)" : "`$(m[1])`"
        end,
    )

    doc = replace(doc, r"<code>\s*(.*?)\s*</code>"s => s"`\1`")

    # Wrap patterns (regex) in code blocks to avoid these from being interpreted as Markdown
    # links
    doc = replace(doc, r"(?<=Pattern: )(?|\"(.*?)\"|`(.*?)`|(\S+))" => s"`\1`")
    doc = replace(doc, r"(?<=regular expression terms: )\"(.*?)\"" => s"`\1`")
    doc = replace(doc, r"(?<=Pattern )\"(.*?)\"" => s"`\1`")

    # TODO: Sometimes bold entries are used as keys in unordered lists. This matches pretty
    # well but sometimes there are keys which aren't bolded.
    # doc = replace(doc, r"<b> *(.*?) *</b> - " => s"**\1**: ")

    doc = replace(doc, r"<b> *(.*?) *</b>"s => s"**\1**")
    doc = replace(doc, r"<i> *(.*?) *</i>"s => s"*\1*")

    # Add extra newline between adjacent paragraphs.
    doc = replace(doc, r" *<p> *((?:(?!<p>).)*?) *</p>(?=\s*<p>)"s => s"\1\n\n")
    doc = replace(doc, r" *<p> *(.*?) *</p>"s => s"\1")

    # doc = replace(doc, r"<a href=\"([^\"]*)\">\s*(.*?)\s*</a>"s => s"[\2](\1)")
    doc = _replace(
        doc,
        r"<a href=\"([^\"]*)\">\s*(.*?)\s*</a>"s => function (m)
            href = strip(m[1])
            text = m[2]

            # Avoid making a link when the href is empty
            isempty(href) && return "$text"

            # Update relative/absolute links to be fully qualified
            if !occursin(r"^(?:https?|mailto):", href)
                href = string(
                    "https://docs.aws.amazon.com",
                    startswith(href, '/') ? "" : "/",
                    href,
                )
            end

            return "[$text]($href)"
        end,
    )

    # Update documentation references to modified function names
    doc = _replace(
        doc,
        r"<a> *(.*?) *</a>" => function (m)
            func_name = get(doc_refs, m[1], nothing)
            return !isnothing(func_name) ? "[`$func_name`](@ref)" : "`$(m[1])`"
        end,
    )

    doc = html_to_md_unordered_list(doc)

    # Markdown does support using `1.` repeatedly for ordered lists but we'll populte the
    # actual value to make the code easier to read.
    doc = _replace(
        doc,
        r"\ *<ol>\s*(.*?)\s*</ol>\ *"s => function (m)
            i = 0
            return "\n\n" *
                   _replace(
                       m[1],
                       r"\ *<li>\s*(.*?)\s*</li>\ *"s =>
                           (m -> (i += 1; "$i. $(m[1])\n")),
                   ) *
                   "\n\n"
        end,
    )

    # e.g. `<p class="title"> **About Permissions** </p>`
    # Making an assumption about header depth
    doc = replace(doc, r"\s*<p class=\"title\"> \*\*(.*?)\*\* </p>\s*" => s"\n\n## \1\n\n")

    # Escape any backslashes
    doc = replace(doc, r"(?<!\\)(\\(?:\\\\)*)(?![\\$])" => s"\\\1")
    doc = replace(doc, r"(?<!\\)\$" => "\\\$")
    doc = replace(doc, "\"\"\"" => "\\\"\\\"\\\"")

    # Note blocks. We need to be careful to respect any existing Markdown indentation
    doc = _replace(
        doc,
        r"((?<=\n)[^\n]+)?<(note|important)>\s*(.*?)\s*</\2>"s => function (m)
            prefix = @something(m[1], "")
            base_indent = get_markdown_indent(prefix)
            base_ind = " "^base_indent
            note_ind = " "^(base_indent + 4)
            note = note_ind * replace(m[3], "\n" => "\n$note_ind") # Update indentation
            return "$(prefix)\n\n$(base_ind)!!! $(m[2])\n$(note)\n\n$(base_ind)"
        end;
        overlap=true,
    )

    # Description list
    # Making an assumption about header depth
    doc = _replace(
        doc,
        r"<dl>\s*(.*?)\s*</dl>"s => function (m)
            return replace(
                m[1],
                r"\s*<dt>\s*(.*?)\s*</dt>\s*<dd>\s*(.*?)\s*</dd>"s =>
                    s"\n\n### \1\n\n\2\n",
            )
        end,
    )

    doc = replace(doc, "<p/>" => "")

    # Remove extra blank lines
    doc = replace(doc, r"([ \t]*\n){3,}" => "\n\n")

    # Remove newlines at the start/end of the documentation
    doc = replace(doc, r"^\n+"s => "")
    doc = replace(doc, r"\n+$"s => "")

    # Remove trailing whitespace
    doc = replace(doc, r"\ +(?=\n)"s => "")

    return doc
end

function html_to_md_unordered_list(str::AbstractString, indent=0)
    _replace(
        str,
        r"\ *<ul>((?:(?=<ul>)(?R)|.*?)*)</ul>\ *"s => function (m)
            # Find the deepest nested `<ul>` list
            content = if occursin("<ul>", m[1])
                html_to_md_unordered_list(m[1], indent + 2)
            else
                m[1]
            end
            content =
                "\n" * _replace(
                    content,
                    r"\ *<li>\s*(.*?)\s*</li>\ *"s => function (m)
                        return string(" "^indent, "- ", m[1], "\n")
                    end,
                )

            if indent == 0
                content = "\n$content\n"
            end

            return content
        end,
    )
end

# Custom `replace` function which allows arbitrary code to be executed in the replacment
function _replace(
    str::AbstractString, (pat, sub)::Pair{Regex,<:Function}; overlap::Bool=false
)
    i = firstindex(str)
    m = match(pat, str, i)
    prev_str = ""
    while !isnothing(m)
        replacement = sub(m)

        before = SubString(str, firstindex(str), prevind(str, m.offset))
        after = SubString(str, m.offset + ncodeunits(m.match))
        str = string(before, replacement, after)

        i = if overlap
            ncodeunits(before) + (str == prev_str ? 1 : 0) + 1
        else
            ncodeunits(before) + ncodeunits(replacement) + 1
        end

        m = match(pat, str, i)
        prev_str = str
    end

    return str
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
        nested_member = get(get(shapes, nested_shape, Dict()), "member", Dict())

        # If nested_shape[member] exists return locationName (if exists), otherwise return the original parameter name
        return get(nested_member, "locationName", parameter)
    end

    required_parameters = LittleDict{String,Any}()
    optional_parameters = LittleDict{String,Any}()
    input_shape = get(shapes, input, Dict())

    if haskey(input_shape, "required")
        for parameter in input_shape["required"]
            parameter_name = _get_parameter_name(parameter, input_shape)

            # Check if the parameter needs to be in a certain place
            parameter_location = get(input_shape["members"][parameter], "location", "")

            documentation = _html_to_markdown(
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
                documentation = _html_to_markdown(get(member_value, "documentation", ""))
                idempotent = get(member_value, "idempotencyToken", false)

                optional_parameters[parameter_name] = LittleDict{String,Union{String,Bool}}(
                    "documentation" => documentation, "idempotent" => idempotent
                )
            end
        end
    end

    return (sort(required_parameters), sort(optional_parameters))
end
