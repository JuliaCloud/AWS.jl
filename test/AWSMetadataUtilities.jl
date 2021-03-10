function _clean_high_level_definition(definition::String)
    # Required Julia 1.5 or higher with how triple quoted strings are dealt with.
    definition = replace(definition, " " => "")
    definition = replace(definition, "\n" => "")

    return definition
end

@testset "_get_aws_sdk_js_files" begin
    apply(Patches._github_tree_patch) do
        files = _get_aws_sdk_js_files("foobar", GitHub.OAuth2("foobar"))

        @test length(files) == 1
        @test files[1] == OrderedDict("path" => "test-2020-01-01.normal.json")
    end
end

@testset "_filter_latest_service_version" begin
    migration_hub_v1 = Dict("path" => "AWSMigrationHub-2017-05-31.normal.json")
    migration_hub_v2 = Dict("path" => "AWSMigrationHub-2020-01-01.normal.json")

    access_analyzer_v1 = Dict("path" => "accessanalyzer-2019-11-01.normal.json")
    access_analyzer_v2 = Dict("path" => "accessanalyzer-2020-01-01.normal.json")

    @testset "empty" begin
        @test isempty(_filter_latest_service_version([]))
    end

    @testset "single service - single version" begin
        result = _filter_latest_service_version([migration_hub_v1])
        @test result == [migration_hub_v1]
    end

    @testset "single service - multiple versions" begin
        result = _filter_latest_service_version([migration_hub_v1, migration_hub_v2])
        @test result == [migration_hub_v2]
    end

    @testset "multiple service - single version" begin
        result = _filter_latest_service_version([migration_hub_v1, access_analyzer_v1])
        @test result == [access_analyzer_v1, migration_hub_v1]
    end

    @testset "multiple services - multiple versions" begin
        result = _filter_latest_service_version([migration_hub_v1, migration_hub_v2, access_analyzer_v1, access_analyzer_v2])
        @test result == [access_analyzer_v2, migration_hub_v2]
    end
end

@testset "_get_service_and_version" begin
    @testset "empty string" begin
        filename = ""
        @test_throws InvalidFileName _get_service_and_version(filename)
    end

    @testset "invalid filename" begin
        filename = "This is an invalid file name."
        @test_throws InvalidFileName _get_service_and_version(filename)
    end

    @testset "valid filename" begin
        filename = "AWSMigrationHub-2017-05-31.normal.json"
        service, version = _get_service_and_version(filename)

        @test service == "AWSMigrationHub"
        @test version == "2017-05-31"
    end
end

@testset "_generate_low_level_definitions" begin
    services = JSON.parsefile(joinpath(@__DIR__, "resources/services.json"))

    @testset "rest-xml" begin
        expected = "const s3 = AWS.RestXMLService(\"s3\", \"2006-03-01\")"
        response = _generate_low_level_definition(services["s3"])

        @test response == expected
    end

    @testset "rest-json" begin
        expected = "const glacier = AWS.RestJSONService(\"glacier\", \"2012-06-01\", LittleDict(\"x-amz-glacier-version\" => \"2012-06-01\"))"
        response = _generate_low_level_definition(services["glacier"])

        @test response == expected
    end

    @testset "ec2 / query" begin
        expected = "const ec2 = AWS.QueryService(\"ec2\", \"2016-11-15\")"
        response = _generate_low_level_definition(services["ec2"])

        @test response == expected
    end

    @testset "json" begin
        expected = "const budgets = AWS.JSONService(\"budgets\", \"2016-10-20\", \"1.1\", \"AWSBudgetServiceGateway\")"
        response = _generate_low_level_definition(services["budgets"])

        @test response == expected
    end

    @testset "invalid protocol" begin
        @test_throws ProtocolNotDefined _generate_low_level_definition(services["invalid"])
    end
end

@testset "_generate_low_level_definition" begin
    service = Dict(
        "serviceId" => "sample_service",
        "protocol" => "invalid-protocol",
        "endpointPrefix" => "endpoint",
        "apiVersion" => "api_version",
        "jsonVersion" => "json_version",
        "targetPrefix" => "target"
    )

    @testset "Invalid Protocol" begin
        @test_throws ProtocolNotDefined _generate_low_level_definition(service)
    end

    @testset "rest-xml" begin
        service["protocol"] = "rest-xml"
        expected_result = "const sample_service = AWS.RestXMLService(\"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "rest-json" begin
        service["protocol"] = "rest-json"
        expected_result = "const sample_service = AWS.RestJSONService(\"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "json" begin
        service["protocol"] = "json"
        expected_result = "const sample_service = AWS.JSONService(\"endpoint\", \"api_version\", \"json_version\", \"target\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "query" begin
        service["protocol"] = "query"
        expected_result = "const sample_service = AWS.QueryService(\"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "ec2" begin
        service["protocol"] = "ec2"
        expected_result = "const sample_service = AWS.QueryService(\"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end
end

@testset "_clean_documentation" begin
    documentation = "<p>To remove one or more tags, use the <a>RemoveTagsFromCertificate</a> action. \$ \\ To view all of the tags that have been applied to the certificate, use the <a>ListTagsForCertificate</a> action."
    expected_result = "To remove one or more tags, use the RemoveTagsFromCertificate action.   To view all of the tags that have been applied to the certificate, use the ListTagsForCertificate action."
    result = _clean_documentation(documentation)

    @test result == expected_result
end

@testset "_clean_uri" begin
    @testset "no parameters" begin
        uri = "/v1/configurations/"
        expected = "/v1/configurations/"

        @test _clean_uri(uri) == expected
    end

    @testset "single parameter" begin
        uri = "/v1/configurations/{parameter-one}"
        expected = "/v1/configurations/\$(parameter_one)"

        @test _clean_uri(uri) == expected
    end

    @testset "multiple parameters" begin
        uri = "/v1/configurations/{parameter_one}/{parameter_two}"
        expected = "/v1/configurations/\$(parameter_one)/\$(parameter_two)"

        @test _clean_uri(uri) == expected
    end

    @testset "hyphen not in parameter" begin
        uri = "/v1/configuration-parameters/{parameter-one}"
        expected = "/v1/configuration-parameters/\$(parameter_one)"

        @test _clean_uri(uri) == expected
    end

    @testset "remove plus signs" begin
        uri = "/v1/configuration-parameters/{parameter-one+}"
        expected = "/v1/configuration-parameters/\$(parameter_one)"

        @test _clean_uri(uri) == expected
    end
end

@testset "_format_name" begin
    @testset "single captial" begin
        function_name = "Testfunctionname"
        expected = "testfunctionname"

        @test _format_name(function_name) == expected
    end

    @testset "all capitals" begin
        function_name = "TESTFUNCTIONNAME"
        expected = "testfunctionname"

        @test _format_name(function_name) == expected
    end

    @testset "subsequent capitals" begin
        function_name = "TestFUNCTIONName"
        expected = "test_functionname"

        @test _format_name(function_name) == expected
    end

    @testset "normal" begin
        function_name = "TestFunctionName"
        expected = "test_function_name"

        @test _format_name(function_name) == expected
    end
end

@testset "_get_function_parameters" begin
    shapes = JSON.parsefile(joinpath(@__DIR__, "resources/shapes.json"))

    @testset "required params" begin
        input = "RequiredParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test required_params == Dict("RequiredParam" => LittleDict("location" => "", "documentation" => "Required param"))
        @test isempty(optional_params)
    end

    @testset "optional params" begin
        input = "OptionalParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test isempty(required_params)
        @test optional_params == Dict(
            "OptionalParam1" => Dict("documentation" => "Optional param 1", "idempotent" => false),
            "OptionalParam2" => Dict("documentation" => "Optional param 2", "idempotent" => false)
        )
    end

    @testset "required and optional params" begin
        input = "RequiredAndOptionalParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test required_params == Dict(
            "RequiredParam1" => LittleDict("location" => "", "documentation" => "Required param 1"),
            "RequiredParam2" => LittleDict("location" => "", "documentation" => "Required param 2")
        )

        @test optional_params == Dict(
            "OptionalParam" => Dict("documentation" => "Optional param", "idempotent" => false)
        )
    end

    @testset "no params" begin
        input = "NoParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test isempty(required_params)
        @test isempty(optional_params)
    end
end

@testset "_generate_high_level_definitions" begin
    service_name = "sample_service"
    protocol = "rest-xml"
    operations = JSON.parsefile(joinpath(@__DIR__, "resources/operations.json"))
    shapes = JSON.parsefile(joinpath(@__DIR__, "resources/shapes.json"))

    expected_result = """
    \"\"\"
        sample_operation(required_param1, required_param2)
        sample_operation(required_param1, required_param2, params::Dict{String,<:Any})

    The documentation for this operation.

    # Arguments
    - `required_param1`: Required param 1
    - `required_param2`: Required param 2

    # Optional Parameters
    Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
    - `"OptionalParam"`: Optional param
    \"\"\"
    sample_operation(RequiredParam1, RequiredParam2; aws_config::AbstractAWSConfig=global_aws_config()) = sample_service("POST", "/", Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2); aws_config=aws_config)
    sample_operation(RequiredParam1, RequiredParam2, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = sample_service("POST", "/", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2), params)); aws_config=aws_config)
    """

    result = _generate_high_level_definitions(
        service_name,
        protocol,
        operations,
        shapes
    )

    @test size(result)[1] == 1

    expected_result = _clean_high_level_definition(expected_result)
    result = _clean_high_level_definition(result[1])

    @test result == expected_result
end

@testset "_generate_high_level_definition" begin
    service_name = "service_name"
    name = "FunctionName"
    method = "GET"
    request_uri = "request_uri"
    documentation = "Documentation for $name."

    @testset "locationless and non-idempotent" begin
        required_params = Dict("RequiredParam" => Dict("location" => "", "documentation" => "This parameter is required."))
        optional_params = Dict("OptionalParam" => Dict("idempotent" => false, "documentation" => "This parameter is optional."))

        @testset "rest protocol" begin
            protocol = "rest-xml"
            expected_result = """
            \"\"\"
                function_name(required_param)
                function_name(required_param, params::Dict{String,<:Any})

            Documentation for FunctionName.

            # Arguments
            - `required_param`: This parameter is required.

            # Optional Parameters
            Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
            - `"OptionalParam"`: This parameter is optional.
            \"\"\"
            function_name(RequiredParam; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("GET", "request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam); aws_config=aws_config)
            function_name(RequiredParam, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("GET", "request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam), params)); aws_config=aws_config)
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation
            )

            expected_result = _clean_high_level_definition(expected_result)
            result = _clean_high_level_definition(result)

            @test result == expected_result
        end

        @testset "json, query, ec2 protocol" begin
            protocol = "ec2"
            expected_result = """
            \"\"\"
                function_name(required_param)
                function_name(required_param, params::Dict{String,<:Any})

            Documentation for FunctionName.

            # Arguments
            - `required_param`: This parameter is required.

            # Optional Parameters
            Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
            - `"OptionalParam"`: This parameter is optional.
            \"\"\"
            function_name(RequiredParam; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("FunctionName", Dict{String, Any}("RequiredParam"=>RequiredParam); aws_config=aws_config)
            function_name(RequiredParam, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("FunctionName", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam), params)); aws_config=aws_config)
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation
            )

            expected_result = _clean_high_level_definition(expected_result)
            result = _clean_high_level_definition(result)

            @test result == expected_result
        end
    end

    @testset "header location and idempotent" begin
        required_params = Dict("RequiredParam" => Dict("location" => "header", "documentation" => "This parameter is required."))
        optional_params = Dict("OptionalParam" => Dict("idempotent" => true, "documentation" => "This parameter is optional."))

        @testset "rest protocol" begin
            protocol = "rest-xml"
            expected_result = """
            \"\"\"
                function_name(required_param)
                function_name(required_param, params::Dict{String,<:Any})

            Documentation for FunctionName.

            # Arguments
            - `required_param`: This parameter   is required.

            # Optional Parameters
            Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
            - `"OptionalParam"`: This parameter i  s optional.
            \"\"\"
            function_name(RequiredParam; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("GET", "request_uri", Dict{String, Any}("OptionalParam"=>string(uuid4()), "headers"=>Dict{String, Any}("RequiredParam"=>RequiredParam)); aws_config=aws_config)
            function_name(RequiredParam, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("GET", "request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("OptionalParam"=>string(uuid4()), "headers"=>Dict{String, Any}("RequiredParam"=>RequiredParam)), params)); aws_config=aws_config)
            """
            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation
            )

            expected_result = _clean_high_level_definition(expected_result)
            result = _clean_high_level_definition(result)

            @test result == expected_result
        end

        @testset "json, query, ec2 protocol" begin
            protocol = "ec2"
            expected_result = """
            \"\"\"
                function_name(required_param)
                function_name(required_param, params::Dict{String,<:Any})

            Documentation for FunctionName.

            # Arguments
            - `required_param`: This parameter   is required.

            # Optional Parameters
            Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
            - `"OptionalParam"`: This parameter i  s optional.
            \"\"\"
            function_name(RequiredParam; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("FunctionName", Dict{String, Any}("RequiredParam"=>RequiredParam, "OptionalParam"=>string(uuid4())); aws_config=aws_config)
            function_name(RequiredParam, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = service_name("FunctionName", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam, "OptionalParam"=>string(uuid4())), params)); aws_config=aws_config)
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation
            )

            expected_result = _clean_high_level_definition(expected_result)
            result = _clean_high_level_definition(result)

            @test result == expected_result
        end
    end
end

@testset "string wrapping functionality" begin
    @testset "_validindex" begin
        str = "jμΛIα"  # μ, Λ, α have 2 codeunits.
        @test _validindex(str, 1) == 1 # j
        @test _validindex(str, 2) == 2 # μ
        @test _validindex(str, 3) == 2 # μ still
        @test _validindex(str, 4) == 4 # Λ
        @test_throws BoundsError _validindex(str, 0)
        @test_throws BoundsError _validindex(str, 10)
    end

    @testset "_splitline" begin
        str = "This is a short sentence."

        @testset "limit < 1" begin
            @test_throws DomainError _splitline(str, 0)
            @test_throws DomainError _splitline(str, -1)
        end

        @testset "limit == 1" begin
            result = _splitline(str, 1)
            @test result isa Tuple{String,String}
            line1, line2 = result
            @test line1 == string(first(str)) == "T"
            @test line2 == str[2:end] == "his is a short sentence."
        end

        @testset "limit >= ncodeunits" begin
            for limit in (ncodeunits(str), ncodeunits(str) + 1)
                result = _splitline(str, limit)
                @test result isa Tuple{String,String}
                line1, line2 = result
                @test line1 == str
                @test line2 == ""
            end
        end

        @testset "split on whitespace when possible" begin
            abc = "Aa Bb Cc"
            @test _splitline(abc, 1) == ("A", "a Bb Cc")  # No preceding whitespace to split on
            @test _splitline(abc, 2) == ("Aa", " Bb Cc")
            @test _splitline(abc, 3) == ("Aa ", "Bb Cc")
            @test _splitline(abc, 4) == ("Aa ", "Bb Cc")  # 4 == `B`, split on preceding whitespace
            @test _splitline(abc, 5) == ("Aa ", "Bb Cc")  # 5 == 'b', split on preceding whitespace
            @test _splitline(abc, 6) == ("Aa Bb ", "Cc")
            @test _splitline(abc, ncodeunits(abc) - 1) == ("Aa Bb ", "Cc")
        end

        @testset "does not try to split mid-character" begin
            str = "jμΛIα"  # 'μ' starts at str[2], 'Λ' starts at str[4]
            @test _splitline(str, 2) == ("jμ", "ΛIα")
            @test _splitline(str, 3) == ("jμ", "ΛIα") # should not try to split mid-'μ'
            @test _splitline(str, 4) == ("jμΛ", "Iα")
        end

        @testset "does not split on punctuation" begin
            str = "\"arn:aws:health:us-west-1::event/EBS/AWS\""
            result = _splitline(str, ncodeunits(str) - 1)
            # don't split escaped closing quote `\"` into `\` and `"`
            @test result == ("\"arn:aws:health:us-west-1::event/EBS/AWS", "\"")
        end
    end

    @testset "_wraplines" begin
        str = "This sentence contains exactly `η = 50` codeunits"

        @testset "limit < 1" begin
            @test_throws DomainError _wraplines(str, 0)
            @test_throws DomainError _wraplines(str, -1)
        end

        @testset "limit == 1" begin
            wrapped = _wraplines(str, 1)
            @test wrapped isa String
            @test startswith(wrapped, "T\nh\ni\ns\n\ns\ne")
        end

        @testset "limit >= ncodeunits" begin
            for limit in (50, 99)
                wrapped = _wraplines(str, limit)
                @test wrapped isa String
                @test wrapped == str
            end
        end

        @testset "1 < limit < ncodeunits" begin
            @test _wraplines(str, 20) == """
                This sentence
                contains exactly
                `η = 50` codeunits"""
            @test _wraplines(str, 25) == """
                This sentence contains
                exactly `η = 50`
                codeunits"""
            @test _wraplines(str, 30) == """
                This sentence contains
                exactly `η = 50` codeunits"""
        end

        @testset "trailing whitespace is stripped" begin
            str = "16charactersthen    fourspaces "
            @test _wraplines(str, 16) == "16charactersthen\n    fourspaces"
            @test _wraplines(str, 17) == "16charactersthen\n   fourspaces"
            @test _wraplines(str, 18) == "16charactersthen\n  fourspaces"
        end

        @testset "has default `limit=92` argument" begin
            str = string(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            )
            @test _wraplines(str) == _wraplines(str, 92)
        end

        @testset "optional `delim` keyword" begin
            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            )
            @test _wraplines(str, 50; delim="\n  ") == """
                - Lorem ipsum dolor sit amet, consectetur
                  adipiscing elit, sed do eiusmod tempor incididunt
                  ut labore et dolore magna aliqua."""
        end
    end
end
