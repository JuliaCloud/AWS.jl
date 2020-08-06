@testset "_get_aws_sdk_js_files" begin
    files = _get_aws_sdk_js_files()
    @test files != nothing
end

@testset "_filter_latest_service_version" begin
    migration_hub_v1 = Dict("name"=>"AWSMigrationHub-2017-05-31.normal.json")
    migration_hub_v2 = Dict("name"=>"AWSMigrationHub-2020-01-01.normal.json")

    access_analyzer_v1 = Dict("name"=>"accessanalyzer-2019-11-01.normal.json")
    access_analyzer_v2 = Dict("name"=>"accessanalyzer-2020-01-01.normal.json")

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
    # one full example, e.g. s3
end

@testset "_generate_low_level_definition" begin
    service = Dict(
        "serviceId"=>"sample_service",
        "protocol"=>"invalid-protocol",
        "endpointPrefix"=>"endpoint",
        "apiVersion"=>"api_version",
        "jsonVersion"=>"json_version",
        "targetPrefix"=>"target"
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

@testset "_documentation_cleaning" begin
    documentation = "<p>To remove one or more tags, use the <a>RemoveTagsFromCertificate</a> action. \$ \\ To view all of the tags that have been applied to the certificate, use the <a>ListTagsForCertificate</a> action."
    expected_result = "To remove one or more tags, use the RemoveTagsFromCertificate action.     To view all of the tags that have been applied to the certificate, use the ListTagsForCertificate action."
    result = _documentation_cleaning(documentation)

    @test result == expected_result
end

@testset "_clean_uri" begin
    @testset "no parameters" begin
        uri = "/v1/configurations/"
        expected = "/v1/configurations/"

        @test expected == _clean_uri(uri)
    end

    @testset "single parameter" begin
        uri = "/v1/configurations/{parameter-one}"
        expected = "/v1/configurations/\$(parameter_one)"

        @test expected == _clean_uri(uri)
    end

    @testset "multiple parameters" begin
        uri = "/v1/configurations/{parameter_one}/{parameter_two}"
        expected = "/v1/configurations/\$(parameter_one)/\$(parameter_two)"

        @test expected == _clean_uri(uri)
    end

    @testset "hyphen not in parameter" begin
        uri = "/v1/configuration-parameters/{parameter-one}"
        expected = "/v1/configuration-parameters/\$(parameter_one)"

        @test expected == _clean_uri(uri)
    end

    @testset "remove plus signs" begin
        uri = "/v1/configuration-parameters/{parameter-one+}"
        expected = "/v1/configuration-parameters/\$(parameter_one)"

        @test expected == _clean_uri(uri)
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
            "OptionalParam1"=>"Optional param 1",
            "OptionalParam2"=>"Optional param 2"
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
            "OptionalParam"=>"Optional param",
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
    shapes = shapes = JSON.parsefile(joinpath(@__DIR__, "resources/shapes.json"))

    expected_result = """
    \"\"\"
        SampleOperation()

    The documentation for this operation.

    # Required Parameters
    - `RequiredParam1`: Required param 1
    - `RequiredParam2`: Required param 2

    # Optional Parameters
    - `OptionalParam`: Optional param
    \"\"\"
    SampleOperation(RequiredParam1, RequiredParam2) = sample_service("POST", "/", Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2))
    SampleOperation(RequiredParam1, RequiredParam2, args::AbstractDict{String, <:Any}) = sample_service("POST", "/", Dict{String, Any}("RequiredParam1"=>RequiredParam1, "RequiredParam2"=>RequiredParam2, args...))
    SampleOperation(a...; b...) = SampleOperation(a..., b)
    """

    result = _generate_high_level_definitions(
        service_name,
        protocol,
        operations,
        shapes
    )

    @test expected_result == result[1]
    @test size(result)[1] == 1
end

@testset "_generate_high_level_definition" begin
    service_name = "service_name"
    name = "service_name"
    method = "GET"
    request_uri = "request_uri"
    required_params = Dict("RequiredParam"=>Dict("location"=>"", "documentation"=>"This parameter is required."))
    optional_params = Dict("OptionalParam"=>"This parameter is optional.")
    documentation = "Documentation for $service_name."

    @testset "rest-xml" begin
        protocol = "rest-xml"
        expected_result = """
        \"\"\"
            service_name()

        Documentation for service_name.

        # Required Parameters
        - `RequiredParam`: This parameter is required.

        # Optional Parameters
        - `OptionalParam`: This parameter is optional.
        \"\"\"
        service_name(RequiredParam) = service_name("GET", "request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam))
        service_name(RequiredParam, args::AbstractDict{String, <:Any}) = service_name("GET", "request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam, args...))
        service_name(a...; b...) = service_name(a..., b)
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

        @test expected_result == result
    end

    @testset "rest-json" begin
        protocol = "rest-json"
        expected_result = """
        \"\"\"
            service_name()

        Documentation for service_name.

        # Required Parameters
        - `RequiredParam`: This parameter is required.

        # Optional Parameters
        - `OptionalParam`: This parameter is optional.
        \"\"\"
        service_name(RequiredParam) = service_name("GET", "request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam))
        service_name(RequiredParam, args::AbstractDict{String, <:Any}) = service_name("GET", "request_uri", Dict{String, Any}("RequiredParam"=>RequiredParam, args...))
        service_name(a...; b...) = service_name(a..., b)
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

        @test expected_result == result
    end

    @testset "json" begin
        protocol = "json"

        expected_result = """
        \"\"\"
            service_name()

        Documentation for service_name.

        # Required Parameters
        - `RequiredParam`: This parameter is required.

        # Optional Parameters
        - `OptionalParam`: This parameter is optional.
        \"\"\"
        service_name(RequiredParam) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam))
        service_name(RequiredParam, args::AbstractDict{String, <:Any}) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam, args...))
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

        @test expected_result == result
    end

    @testset "query" begin
        protocol = "query"
        expected_result = """
        \"\"\"
            service_name()

        Documentation for service_name.

        # Required Parameters
        - `RequiredParam`: This parameter is required.

        # Optional Parameters
        - `OptionalParam`: This parameter is optional.
        \"\"\"
        service_name(RequiredParam) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam))
        service_name(RequiredParam, args::AbstractDict{String, <:Any}) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam, args...))
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

        @test expected_result == result
    end

    @testset "ec2" begin
        protocol = "ec2"
        expected_result = """
        \"\"\"
            service_name()

        Documentation for service_name.

        # Required Parameters
        - `RequiredParam`: This parameter is required.

        # Optional Parameters
        - `OptionalParam`: This parameter is optional.
        \"\"\"
        service_name(RequiredParam) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam))
        service_name(RequiredParam, args::AbstractDict{String, <:Any}) = service_name("service_name", Dict{String, Any}("RequiredParam"=>RequiredParam, args...))
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

        @test expected_result == result
    end
end
