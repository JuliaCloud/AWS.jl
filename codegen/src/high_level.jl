"""
Generate the `src/services/{service}.jl` file.
"""
function _generate_high_level_wrapper(service_files::AbstractArray{ServiceFile})
    # Remove old service files to ensure services that no longer exist are removed.
    for file in readdir(HIGH_LEVEL_SERVICES_DIR)
        path = joinpath(HIGH_LEVEL_SERVICES_DIR, file)
        if endswith(path, ".jl")
            rm(path)
        end
    end

    Threads.@threads for service_file in service_files
        @info "Generating high-level wrapper for $(service_file.file_name)"
        service = _parse_smithy_model(service_file.content)

        service_name = lowercase(service["metadata"]["serviceId"])
        service_name = replace(service_name, ' ' => '_')
        operations = service["operations"]
        shapes = service["shapes"]

        protocol = service["metadata"]["protocol"]

        operations = sort!(
            _generate_high_level_definitions(service_name, protocol, operations, shapes)
        )

        service_path = joinpath(HIGH_LEVEL_SERVICES_DIR, "$service_name.jl")
        open(service_path, "w") do f
            println(
                f,
                """
             # $AUTO_GENERATED_SIGNATURE
             # Note: `SERVICE_FEATURE_SET` is embedded by `@service`
             using AWS: AbstractAWSConfig, current_aws_config
             using AWS.AWSServices: $service_name
             using AWS.UUIDs: uuid4
             """,
            )
            join(f, operations, "\n")
        end
    end
end

"""
Generate high-level definitions for the `service`.
All high-level definitions and documentation to be written into `services/{Service}.jl`
"""
function _generate_high_level_definitions(
    service_name::String, protocol::String, operations::AbstractDict, shapes::AbstractDict
)
    operation_definitions = String[]

    # Determine the list of operation names to function names for docstring links
    doc_refs = Dict(op["name"] => _format_name(op["name"]) for op in values(operations))

    for (_, operation) in operations
        operation_name = operation["name"]
        method = operation["http"]["method"]
        request_uri = operation["http"]["requestUri"]

        documentation = ""

        if haskey(operation, "documentation")
            documentation = _html_to_markdown(operation["documentation"], doc_refs)
        end

        required_parameters = Dict{String,Any}()
        optional_parameters = Dict{String,Any}()

        if haskey(operation, "input")
            required_parameters, optional_parameters = _get_function_parameters(
                operation["input"]["shape"], shapes
            )
        end

        operation_definition = _generate_high_level_definition(
            service_name,
            protocol,
            operation_name,
            method,
            request_uri,
            required_parameters,
            optional_parameters,
            documentation,
        )

        push!(operation_definitions, operation_definition)
    end

    return operation_definitions
end

"""
Generate the high-level definition for a services function.
"""
function _generate_high_level_definition(
    service_name::String,
    protocol::String,
    operation_name::String,
    method::String,
    request_uri::String,
    required_parameters::AbstractDict,
    optional_parameters::AbstractDict,
    documentation::String,
)
    """
    The `:Symbol` literals a caller may use for `member_key`: the exact Smithy member name,
    plus its snake_case form (via `camelcase_to_snakecase`) so users can write idiomatic Julia
    keywords without needing to know AWS's own PascalCase naming. Omits the snake_case form
    when it's identical to the member name (e.g. already-lowercase single-word members).
    """
    function _keyword_aliases(member_key::String)
        snake = camelcase_to_snakecase(member_key)
        aliases = [":$member_key"]
        snake == member_key || push!(aliases, ":$snake")
        return aliases
    end

    """
    The human-readable label for `member_key` used in docstrings and error messages: `` `Member` ``,
    or `` `Member` (or `snake`) `` when its snake_case alias (see `_keyword_aliases`) differs.
    """
    function _keyword_doc_label(member_key::String)
        snake = camelcase_to_snakecase(member_key)
        return snake == member_key ? "`$member_key`" : "`$member_key` (or `$snake`)"
    end

    """
    The Julia local variable name bound to a URI-located required parameter (see
    `_dispatch_target`) — its snake_case form, since it's a real Julia identifier used both in
    the dispatch loop and the generated request URI's string interpolation, not a wire-format
    dict key.
    """
    _uri_local_name(member_key::String) = camelcase_to_snakecase(member_key)

    """
    The dict a parameter's value should be routed to: `"headers"` when `use_headers` is set and
    the parameter is header-located, `"params"` otherwise. URI-located parameters have no target
    dict at all — they're only ever used via string interpolation in the request URI/target —
    so this returns `nothing` for those (callers must check `meta["location"] == "uri"` first,
    or handle the `nothing` explicitly).
    """
    function _dispatch_target(meta::AbstractDict; use_headers::Bool)
        meta["location"] == "uri" && return nothing
        return use_headers && meta["location"] == "header" ? "headers" : "params"
    end

    """
    Generate the single `if k === :Member ... elseif ... else ... end` dispatch loop over the
    function's `kwargs...` catch-all, covering both required and optional parameters (all
    parameters are extracted this way now, since Julia keyword arguments can't be aliased —
    `required_params` come first, then `optional_params`, then the catch-all `else`):

    - a URI-located required parameter's branch assigns its local variable (`Bucket = v`), since
      it's only ever used via string interpolation in the request URI/target, never inserted
      into a dict — checked for presence afterwards via `_required_missing_check_line`;
    - every other parameter's branch (required or optional, idempotent or not) inserts directly
      into `target` (`"params"` or `"headers"`) — non-URI required parameters are checked for
      presence via `haskey` afterwards (`_required_missing_check_line`); idempotent optional ones
      still need a separate fallback line for when they're absent (`_idempotent_fallback_line`);
    - any unrecognized keyword raises a clear `ArgumentError` naming the bad keyword and the
      function, rather than silently being dropped.

    Every branch condition matches either a parameter's exact member name or its snake_case
    alias (see `_keyword_aliases`). Returns no lines when both dicts are empty.
    """
    function _dispatch_lines(
        required_params::AbstractDict,
        optional_params::AbstractDict;
        use_headers::Bool,
        function_name::AbstractString,
    )
        isempty(required_params) && isempty(optional_params) && return String[]

        lines = ["for (k, v) in kwargs"]
        branch_num = 0
        for (member_key, meta) in required_params
            branch_num += 1
            keyword = branch_num == 1 ? "if" : "elseif"
            condition = join(("k === $alias" for alias in _keyword_aliases(member_key)), " || ")
            push!(lines, "    $keyword $condition")
            target = _dispatch_target(meta; use_headers)
            if target === nothing
                push!(lines, "        $(_uri_local_name(member_key)) = v")
            else
                push!(lines, "        $target[$(repr(meta["locationName"]))] = v")
            end
        end
        for (member_key, meta) in optional_params
            branch_num += 1
            keyword = branch_num == 1 ? "if" : "elseif"
            target = _dispatch_target(meta; use_headers)
            condition = join(("k === $alias" for alias in _keyword_aliases(member_key)), " || ")
            push!(lines, "    $keyword $condition")
            push!(lines, "        $target[$(repr(meta["locationName"]))] = v")
        end
        push!(lines, "    else")
        push!(
            lines,
            "        throw(ArgumentError(\"unsupported keyword argument \$(repr(k)) for `$function_name`\"))",
        )
        push!(lines, "    end")
        push!(lines, "end")

        return lines
    end

    """
    Generate the fallback line for an idempotent optional parameter: when the caller didn't
    supply one under either accepted spelling (via the dispatch loop above), insert a freshly
    generated token into `target`.
    """
    function _idempotent_fallback_line(member_key::String, meta::AbstractDict; use_headers::Bool)
        target = _dispatch_target(meta; use_headers)
        key = repr(meta["locationName"])
        haskey_checks = join(
            ("haskey(kwargs, $alias)" for alias in _keyword_aliases(member_key)), " || "
        )
        return "$haskey_checks || ($target[$key] = string(uuid4()))"
    end

    """
    Generate the line which, after the dispatch loop, throws a clear `ArgumentError` if a
    required parameter is still missing — i.e. the caller supplied neither accepted spelling.
    URI-located parameters (which the dispatch loop assigns to a local variable rather than a
    dict, see `_dispatch_lines`) are checked via `!isnothing`; everything else is checked via
    `haskey` on its target dict, since the loop already inserted it there directly.
    """
    function _required_missing_check_line(
        member_key::String, meta::AbstractDict, function_name::AbstractString; use_headers::Bool
    )
        label = _keyword_doc_label(member_key)
        message = "missing required keyword argument: $label for `$function_name`"
        target = _dispatch_target(meta; use_headers)
        condition = if target === nothing
            "!isnothing($(_uri_local_name(member_key)))"
        else
            "haskey($target, $(repr(meta["locationName"])))"
        end
        return "$condition || throw(ArgumentError(\"$message\"))"
    end

    """
    Generate the function signature: `aws_config` is an optional positional argument
    (defaulting to `current_aws_config()`), followed, if there are any required or optional
    parameters, by a trailing `kwargs...` catch-all — every parameter (required or optional) is
    extracted and validated from `kwargs` at runtime rather than declared individually, since
    that's what lets both PascalCase and snake_case spellings be accepted (see
    `_dispatch_lines`).
    """
    function _operation_signature(function_name::AbstractString, has_any_params::Bool)
        aws_config_arg = "aws_config::AbstractAWSConfig=current_aws_config()"
        return if has_any_params
            "$function_name($aws_config_arg; kwargs...)"
        else
            "$function_name($aws_config_arg)"
        end
    end

    """
    Generate function definition for a service request given required, header and optional
    parameters.
    """
    function _generate_rest_operation_defintion(
        required_params::AbstractDict,
        optional_params::AbstractDict,
        operation_name::String,
        service_name::String,
        method::String,
        request_uri::String,
    )
        # Each `{Member}` (or greedy `{Member+}`) URI label refers to a URI-located required
        # parameter, bound to a snake_case Julia local variable (see `_uri_local_name`) — so the
        # interpolated identifier here must be snake_cased to match.
        request_uri = replace(
            request_uri,
            r"\{[^}]*\}" =>
                m -> "\$(" * _uri_local_name(replace(m, r"[{}+]" => "")) * ")",
        )

        header_required = filter(p -> (p[2]["location"] == "header"), required_params)
        body_required = filter(p -> !(p[2]["location"] in ("uri", "header")), required_params)

        header_optional = filter(p -> (p[2]["location"] == "header"), optional_params)
        idempotent_optional = filter(p -> (p[2]["idempotent"]), optional_params)

        has_required = !isempty(required_params)
        has_optional = !isempty(optional_params)
        has_any_params = has_required || has_optional
        function_name = _format_name(operation_name)

        needs_headers = !isempty(header_required) || !isempty(header_optional)
        needs_params = needs_headers || !isempty(body_required) || has_optional

        signature = _operation_signature(function_name, has_any_params)

        body_lines = String[]
        for (member_key, meta) in required_params
            meta["location"] == "uri" &&
                push!(body_lines, "$(_uri_local_name(member_key)) = nothing")
        end

        needs_headers && push!(body_lines, "headers = Dict{String, Any}()")
        needs_params && push!(body_lines, "params = Dict{String, Any}()")

        if has_any_params
            append!(
                body_lines,
                _dispatch_lines(required_params, optional_params; use_headers=true, function_name),
            )
            for (member_key, meta) in required_params
                push!(
                    body_lines,
                    _required_missing_check_line(member_key, meta, function_name; use_headers=true),
                )
            end
            for (member_key, meta) in idempotent_optional
                push!(body_lines, _idempotent_fallback_line(member_key, meta; use_headers=true))
            end
        end

        needs_headers && push!(body_lines, "isempty(headers) || (params[\"headers\"] = headers)")

        call_args = ["\"$method\"", "\"$request_uri\""]
        needs_params && push!(call_args, "params")

        push!(
            body_lines,
            "$service_name($(join(call_args, ", ")); aws_config, feature_set=SERVICE_FEATURE_SET)",
        )

        return """
            function $signature
                $(join(body_lines, "\n"))
            end
            """
    end

    """
    Generate a JSON/Query high-level definition.
    """
    function _generate_json_query_opeation_definition(
        required_params::AbstractDict,
        optional_params::AbstractDict,
        operation_name::String,
        service_name::String,
    )
        idempotent_optional = filter(p -> (p[2]["idempotent"]), optional_params)

        has_required = !isempty(required_params)
        has_optional = !isempty(optional_params)
        has_any_params = has_required || has_optional
        function_name = _format_name(operation_name)

        needs_params = has_any_params

        signature = _operation_signature(function_name, has_any_params)

        body_lines = String[]
        for (member_key, meta) in required_params
            meta["location"] == "uri" &&
                push!(body_lines, "$(_uri_local_name(member_key)) = nothing")
        end

        needs_params && push!(body_lines, "params = Dict{String, Any}()")

        if has_any_params
            append!(
                body_lines,
                _dispatch_lines(
                    required_params, optional_params; use_headers=false, function_name
                ),
            )
            for (member_key, meta) in required_params
                push!(
                    body_lines,
                    _required_missing_check_line(
                        member_key, meta, function_name; use_headers=false
                    ),
                )
            end
            for (member_key, meta) in idempotent_optional
                push!(body_lines, _idempotent_fallback_line(member_key, meta; use_headers=false))
            end
        end

        call_args = ["\"$operation_name\""]
        needs_params && push!(call_args, "params")

        push!(
            body_lines,
            "$service_name($(join(call_args, ", ")); aws_config, feature_set=SERVICE_FEATURE_SET)",
        )

        return """
            function $signature
                $(join(body_lines, "\n"))
            end
            """
    end

    """
    Generate the docstring for the `function_name`.
    """
    function _generate_docstring(
        function_name, documentation, required_parameters, optional_parameters
    )
        # `aws_config` is an optional positional argument, shown in brackets per Julia's
        # documentation convention for optional positional arguments (e.g. `Base.open`). All
        # other parameters — required and optional alike — are keyword arguments (boto3-style),
        # so even the "required-only" signature needs a leading `;` once there's at least one
        # required parameter.
        args = join(keys(required_parameters), ", ")

        signatures = [isempty(args) ? "$function_name([aws_config])" : "$function_name([aws_config]; $args)"]
        if !isempty(optional_parameters)
            prefix = isempty(args) ? "; " : "; $args, "
            push!(signatures, "$function_name([aws_config]$(prefix)kwargs...)")
        end

        aws_config_note = _wraplines(
            "Accepts an optional `aws_config::AbstractAWSConfig` as the first positional " *
            "argument, defaulting to the global configuration (`current_aws_config()`).",
        )

        operation_definition = """
            $(repeat('"', 3))
                $(join(signatures, "\n    "))

            $(_wraplines(documentation))

            $aws_config_note
            """

        # Determine if any of the docstring arguments are considered long such that all
        # arguments should be separated by two newlines.
        long_arg(str) = occursin("\n\n", str) || count('\n', str) > 3

        # Add in the required parameters if applicable
        if !isempty(required_parameters)
            if !endswith(operation_definition, "\n\n")
                operation_definition *= "\n"
            end

            operation_definition *= "# Required Keywords\n\n"

            argument_docstrings = String[]
            for (required_key, required_value) in required_parameters
                label = _keyword_doc_label(required_key)
                push!(
                    argument_docstrings,
                    _wraplines("- $label: $(required_value["documentation"])"; base_indent=2),
                )
            end

            operation_definition *= if any(long_arg, argument_docstrings)
                join(argument_docstrings, "\n\n")
            else
                join(argument_docstrings, "\n")
            end

            operation_definition *= "\n"
        end

        # Add in the optional parameters if applicable
        if !isempty(optional_parameters)
            if !endswith(operation_definition, "\n\n")
                operation_definition *= "\n"
            end

            operation_definition *= """
                # Optional Keywords

                The following optional keyword arguments can be provided:

                """

            optional_docstrings = String[]
            for (optional_key, optional_value) in optional_parameters
                label = _keyword_doc_label(optional_key)
                push!(
                    optional_docstrings,
                    _wraplines("- $label: $(optional_value["documentation"])"; base_indent=2),
                )
            end

            operation_definition *= if any(long_arg, optional_docstrings)
                join(optional_docstrings, "\n\n")
            else
                join(optional_docstrings, "\n")
            end

            operation_definition *= "\n"
        end

        return operation_definition *= repeat('"', 3)
    end

    function_name = _format_name(operation_name)
    doc_string = _generate_docstring(
        function_name, documentation, required_parameters, optional_parameters
    )
    generic_function_string = "function $function_name end"

    if protocol in ("json", "query", "ec2")
        function_string = _generate_json_query_opeation_definition(
            required_parameters, optional_parameters, operation_name, service_name
        )
    elseif protocol in ("rest-json", "rest-xml")
        function_string = _generate_rest_operation_defintion(
            required_parameters,
            optional_parameters,
            operation_name,
            service_name,
            method,
            request_uri,
        )
    else
        throw(
            ProtocolNotDefined(
                "$function_name is using a new protocol; $protocol which is not supported."
            ),
        )
    end

    return """
        $doc_string
        $generic_function_string

        $function_string
        """
end
