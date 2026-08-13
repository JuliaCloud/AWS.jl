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
    Generate the `if k === :Member ... elseif ... else ... end` dispatch loop over the function's
    `kwargs...` catch-all: each optional parameter (idempotent or not) is routed into `target`
    (`"params"` or `"headers"`), and any unrecognized keyword raises a clear `ArgumentError`
    naming the bad keyword and the function, rather than silently being dropped. Idempotent
    parameters get a branch here too (so a caller-supplied value is honored), but still need a
    separate fallback line for when they're absent — see `_idempotent_fallback_line`. Returns no
    lines when `optional_params` is empty.
    """
    function _optional_dispatch_lines(
        optional_params::AbstractDict; use_headers::Bool, function_name::AbstractString
    )
        isempty(optional_params) && return String[]

        lines = ["for (k, v) in kwargs"]
        for (i, (member_key, meta)) in enumerate(optional_params)
            target = use_headers && meta["location"] == "header" ? "headers" : "params"
            keyword = i == 1 ? "if" : "elseif"
            push!(lines, "    $keyword k === :$member_key")
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
    supply one (via the dispatch loop above), insert a freshly generated token into `target`.
    """
    function _idempotent_fallback_line(member_key::String, meta::AbstractDict; use_headers::Bool)
        target = use_headers && meta["location"] == "header" ? "headers" : "params"
        key = repr(meta["locationName"])
        sym = ":$member_key"
        return "haskey(kwargs, $sym) || ($target[$key] = string(uuid4()))"
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
        request_uri = replace(request_uri, '{' => "\$(")  # Replace { with $(
        request_uri = replace(request_uri, '}' => ')')  # Replace } with )
        request_uri = replace(request_uri, '+' => "")  # Remove + from the request URI

        req_keys = collect(keys(required_params))

        body_params = filter(p -> !(p[2]["location"] in ("uri", "header")), required_params)
        header_params = filter(p -> (p[2]["location"] == "header"), required_params)

        req_kv = ["\"$(p[2]["locationName"])\" => $(p[1])" for p in body_params]
        header_kv = ["\"$(p[2]["locationName"])\" => $(p[1])" for p in header_params]

        header_optional = filter(p -> (p[2]["location"] == "header"), optional_params)
        idempotent_optional = filter(p -> (p[2]["idempotent"]), optional_params)

        has_optional = !isempty(optional_params)
        function_name = _format_name(operation_name)

        routing_lines = vcat(
            _optional_dispatch_lines(optional_params; use_headers=true, function_name),
            [
                _idempotent_fallback_line(k, v; use_headers=true) for
                (k, v) in idempotent_optional
            ],
        )

        needs_headers = !isempty(header_kv) || !isempty(header_optional)
        needs_params = needs_headers || !isempty(req_kv) || has_optional

        # All parameters — required and optional alike — are keyword arguments (boto3-style);
        # required ones simply have no default, so Julia raises `UndefKeywordError` if omitted.
        required_kw = isempty(req_keys) ? "" : join(req_keys, ", ") * ", "
        kwargs_suffix = has_optional ? ", kwargs..." : ""
        signature = "$function_name(; $(required_kw)aws_config::AbstractAWSConfig=current_aws_config()$kwargs_suffix)"

        body_lines = String[]
        call_args = ["\"$method\"", "\"$request_uri\""]

        if needs_params
            if needs_headers
                push!(body_lines, "headers = Dict{String, Any}($(join(header_kv, ", ")))")
                params_kv = vcat(["\"headers\" => headers"], req_kv)
            else
                params_kv = req_kv
            end
            push!(body_lines, "params = Dict{String, Any}($(join(params_kv, ", ")))")
            append!(body_lines, routing_lines)
            push!(call_args, "params")
        end

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
        req_keys = collect(keys(required_params))
        req_kv = ["\"$(p[2]["locationName"])\" => $(p[1])" for p in required_params]

        idempotent_optional = filter(p -> (p[2]["idempotent"]), optional_params)

        has_optional = !isempty(optional_params)
        function_name = _format_name(operation_name)

        routing_lines = vcat(
            _optional_dispatch_lines(optional_params; use_headers=false, function_name),
            [
                _idempotent_fallback_line(k, v; use_headers=false) for
                (k, v) in idempotent_optional
            ],
        )

        needs_params = !isempty(req_kv) || has_optional

        # All parameters — required and optional alike — are keyword arguments (boto3-style);
        # required ones simply have no default, so Julia raises `UndefKeywordError` if omitted.
        required_kw = isempty(req_keys) ? "" : join(req_keys, ", ") * ", "
        kwargs_suffix = has_optional ? ", kwargs..." : ""
        signature = "$function_name(; $(required_kw)aws_config::AbstractAWSConfig=current_aws_config()$kwargs_suffix)"

        body_lines = String[]
        call_args = ["\"$operation_name\""]

        if needs_params
            push!(body_lines, "params = Dict{String, Any}($(join(req_kv, ", ")))")
            append!(body_lines, routing_lines)
            push!(call_args, "params")
        end

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
        # All parameters are keyword arguments (boto3-style), so even the "required-only"
        # signature needs a leading `;` once there's at least one required parameter.
        args = join(keys(required_parameters), ", ")

        signatures = [isempty(args) ? "$function_name()" : "$function_name(; $args)"]
        if !isempty(optional_parameters)
            prefix = isempty(args) ? "; " : "; $args, "
            push!(signatures, "$function_name($(prefix)kwargs...)")
        end

        operation_definition = """
            $(repeat('"', 3))
                $(join(signatures, "\n    "))

            $(_wraplines(documentation))
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
                push!(
                    argument_docstrings,
                    _wraplines(
                        "- `$required_key`: $(required_value["documentation"])"; base_indent=2
                    ),
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
                push!(
                    optional_docstrings,
                    _wraplines(
                        "- `$optional_key`: $(optional_value["documentation"])"; base_indent=2
                    ),
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
