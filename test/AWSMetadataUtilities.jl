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

@testset "_format_function_name" begin
    @testset "single captial" begin
        function_name = "Testfunctionname"
        expected = "testfunctionname"

        @test _format_function_name(function_name) == expected
    end

    @testset "all capitals" begin
        function_name = "TESTFUNCTIONNAME"
        expected = "testfunctionname"

        @test _format_function_name(function_name) == expected
    end

    @testset "subsequent capitals" begin
        function_name = "TestFUNCTIONName"
        expected = "test_functionname"

        @test _format_function_name(function_name) == expected
    end

    @testset "normal" begin
        function_name = "TestFunctionName"
        expected = "test_function_name"

        @test _format_function_name(function_name) == expected
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

# @testset "_generate_high_level_definitions" begin
#     service_name = "sample_service"
#     protocol = "rest-xml"
#     operations = JSON.parsefile(joinpath(@__DIR__, "resources/operations.json"))
#     shapes = shapes = JSON.parsefile(joinpath(@__DIR__, "resources/shapes.json"))

#     expected_result = """
#     \"\"\"
#         SampleOperation()

#     The documentation for this operation.

#     # Required Parameters
#     - `RequiredParam1`: Required param 1
#     - `RequiredParam2`: Required param 2

#     # Optional Parameters
#     - `OptionalParam`: Optional param
#     \"\"\"
#     sample_operation(RequiredParam1, RequiredParam2; aws_config::AWSConfig=global_aws_config()) = sample_service("POST", "/", Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2); aws_config=aws_config)
#     sample_operation(RequiredParam1, RequiredParam2, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = sample_service("POST", "/", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2), args)); aws_config=aws_config)
#     """

#     result = _generate_high_level_definitions(
#         service_name,
#         protocol,
#         operations,
#         shapes
#     )

#     @test size(result)[1] == 1

#     expected_result = _clean_high_level_definition(expected_result)
#     result = _clean_high_level_definition(result[1])
    
#     @test result == expected_result
# end

# @testset "_generate_high_level_definition" begin
#     service_name = "service_name"
#     name = "FunctionName"
#     method = "GET"
#     request_uri = "request_uri"
#     documentation = "Documentation for $name."

#     @testset "locationless and non-idempotent" begin
#         required_params = Dict("RequiredParam" => Dict("location" => "", "documentation" => "This parameter is required."))
#         optional_params = Dict("OptionalParam" => Dict("idempotent" => false, "documentation" => "This parameter is optional."))

#         @testset "rest protocol" begin
#             protocol = "rest-xml"
#             expected_result = """
#             \"\"\"
#                 $name()

#             Documentation for $name.

#             # Required Parameters
#             - `RequiredParam`: This parameter is required.

#             # Optional Parameters
#             - `OptionalParam`: This parameter is optional.
#             \"\"\"
#             function_name(RequiredParam; aws_config::AWSConfig=global_aws_config()) = $service_name("$method", "$request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam); aws_config=aws_config)
#             function_name(RequiredParam, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = $service_name("$method", "$request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam), args)); aws_config=aws_config)
#             """

#             result = _generate_high_level_definition(
#                 service_name,
#                 protocol,
#                 name,
#                 method,
#                 request_uri,
#                 required_params,
#                 optional_params,
#                 documentation
#             )

#             expected_result = _clean_high_level_definition(expected_result)
#             result = _clean_high_level_definition(result)
            
#             @test result == expected_result
#         end

#         @testset "json, query, ec2 protocol" begin
#             protocol = "ec2"
#             expected_result = """
#             \"\"\"
#                 $name()

#             Documentation for $name.

#             # Required Parameters
#             - `RequiredParam`: This parameter is required.

#             # Optional Parameters
#             - `OptionalParam`: This parameter is optional.
#             \"\"\"
#             function_name(RequiredParam; aws_config::AWSConfig=global_aws_config()) = $service_name("$name", Dict{String, Any}("RequiredParam"=>RequiredParam); aws_config=aws_config)
#             function_name(RequiredParam, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = $service_name("$name", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam), args)); aws_config=aws_config)
#             """

#             result = _generate_high_level_definition(
#                 service_name,
#                 protocol,
#                 name,
#                 method,
#                 request_uri,
#                 required_params,
#                 optional_params,
#                 documentation
#             )

#             expected_result = _clean_high_level_definition(expected_result)
#             result = _clean_high_level_definition(result)
            
#             @test result == expected_result
#         end
#     end

#     @testset "header location and idempotent" begin
#         required_params = Dict("RequiredParam" => Dict("location" => "header", "documentation" => "This parameter is required."))
#         optional_params = Dict("OptionalParam" => Dict("idempotent" => true, "documentation" => "This parameter is optional."))

#         @testset "rest protocol" begin
#             protocol = "rest-xml"
#             expected_result = """
#             \"\"\"
#                 $name()

#             Documentation for $name.

#             # Required Parameters
#             - `RequiredParam`: This parameter is required.

#             # Optional Parameters
#             - `OptionalParam`: This parameter is optional.
#             \"\"\"
#             function_name(RequiredParam; aws_config::AWSConfig=global_aws_config()) = $service_name("$method", "$request_uri", Dict{String, Any}("OptionalParam"=>string(uuid4()), "headers"=>Dict{String, Any}("RequiredParam"=>RequiredParam)); aws_config=aws_config)
#             function_name(RequiredParam, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = $service_name("$method", "$request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("OptionalParam"=>string(uuid4()), "headers"=>Dict{String, Any}("RequiredParam"=>RequiredParam)), args)); aws_config=aws_config)
#             """
#             result = _generate_high_level_definition(
#                 service_name,
#                 protocol,
#                 name,
#                 method,
#                 request_uri,
#                 required_params,
#                 optional_params,
#                 documentation
#             )

#             expected_result = _clean_high_level_definition(expected_result)
#             result = _clean_high_level_definition(result)
            
#             @test result == expected_result
#         end

#         @testset "json, query, ec2 protocol" begin
#             protocol = "ec2"
#             expected_result = """
#             \"\"\"
#                 $name()
            
#             Documentation for $name.
            
#             # Required Parameters
#             - `RequiredParam`: This parameter is required.
            
#             # Optional Parameters
#             - `OptionalParam`: This parameter is optional.
#             \"\"\"
#             function_name(RequiredParam; aws_config::AWSConfig=global_aws_config()) = $service_name("$name", Dict{String, Any}("RequiredParam"=>RequiredParam, "OptionalParam"=>string(uuid4())); aws_config=aws_config)
#             function_name(RequiredParam, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = $service_name("$name", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam"=>RequiredParam, "OptionalParam"=>string(uuid4())), args)); aws_config=aws_config)
#             """

#             result = _generate_high_level_definition(
#                 service_name,
#                 protocol,
#                 name,
#                 method,
#                 request_uri,
#                 required_params,
#                 optional_params,
#                 documentation
#             )
            
#             expected_result = _clean_high_level_definition(expected_result)
#             result = _clean_high_level_definition(result)
            
#             @test result == expected_result
#         end
#     end
# end
