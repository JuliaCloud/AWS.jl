function _clean_high_level_definition(definition::String)
    # Required Julia 1.5 or higher with how triple quoted strings are dealt with.
    definition = replace(definition, " " => "")
    definition = replace(definition, "\n" => "")

    return definition
end

@testset "_replace" begin
    @testset "overlap" begin
        @test _replace("aaa", r"^(.*)a" => (m -> "$(m[1])b"); overlap=false) == "aab"
        @test _replace("aaa", r"^(.*)a" => (m -> "$(m[1])b"); overlap=true) == "bbb"
    end

    @testset "avoid overlap infinite loop" begin
        # Unless the logic is carefully crafted we'll infinite loop when we perform a
        # replacement with the exact same value we matched on
        @test _replace("aaa", r"a" => (m -> m.match); overlap=true) == "aaa"
    end
end

@testset "_get_service_model_trees" begin
    apply(Patches._github_tree_patch) do
        trees = _get_service_model_trees(; auth=GitHub.OAuth2("foobar"), tree_sha="main")

        @test length(trees) == 1
        tree = only(trees)

        @test issubset(keys(tree), ["url", "type", "path", "sha"])
        @test tree["url"] == "https://api.github.com/repos/aws/aws-sdk-js-v3/git/blobs/0"
        @test tree["type"] == "blob"
        @test tree["path"] == "test.json"
        @test tree["sha"] == "test-sha"
    end
end

@testset "_shape_name" begin
    @test _shape_name("com.amazonaws.s3#BucketName") == "BucketName"
    @test _shape_name("smithy.api#Unit") == "Unit"
end

@testset "_preferred_protocol" begin
    @test _preferred_protocol(Dict("aws.protocols#awsQuery" => Dict())) ==
        ("query", nothing)
    @test _preferred_protocol(Dict("aws.protocols#ec2Query" => Dict())) == ("ec2", nothing)
    @test _preferred_protocol(Dict("aws.protocols#restXml" => Dict())) ==
        ("rest-xml", nothing)
    @test _preferred_protocol(Dict("aws.protocols#restJson1" => Dict())) ==
        ("rest-json", nothing)
    @test _preferred_protocol(Dict("aws.protocols#awsJson1_1" => Dict())) == ("json", "1.1")
    @test _preferred_protocol(Dict("aws.protocols#awsJson1_0" => Dict())) == ("json", "1.0")

    @testset "\"query\" takes priority over \"json\" 1.0" begin
        traits = Dict(
            "aws.protocols#awsQuery" => Dict(), "aws.protocols#awsJson1_0" => Dict()
        )
        @test _preferred_protocol(traits) == ("query", nothing)
    end

    @testset "unsupported protocol" begin
        traits = Dict("smithy.protocols#rpcv2Cbor" => Dict())
        @test_throws ProtocolNotDefined _preferred_protocol(traits)

        traits = Dict("aws.protocols#unknown" => Dict())
        @test_throws ProtocolNotDefined _preferred_protocol(traits)

        # Real protocol which we do not currently support
        traits = Dict("aws.protocols#awsQueryCompatible" => Dict())
        @test_throws ProtocolNotDefined _preferred_protocol(traits)
    end
end

@testset "_parse_smithy_model" begin
    # Minimal Smithy model for a restJson1 service
    smithy = Dict(
        "smithy" => "2.0",
        "shapes" => Dict(
            "com.example#MyService" => Dict(
                "type" => "service",
                "version" => "2021-01-01",
                "operations" => [Dict("target" => "com.example#GetThing")],
                "traits" => Dict(
                    "aws.api#service" => Dict(
                        "sdkId" => "My Service",
                        "endpointPrefix" => "myservice",
                    ),
                    "aws.auth#sigv4" => Dict("name" => "myservice"),
                    "aws.protocols#restJson1" => Dict(),
                ),
            ),
            "com.example#GetThing" => Dict(
                "type" => "operation",
                "input" => Dict("target" => "com.example#GetThingRequest"),
                "output" => Dict("target" => "smithy.api#Unit"),
                "traits" => Dict(
                    "smithy.api#http" =>
                        Dict("method" => "GET", "uri" => "/things/{id}"),
                    "smithy.api#documentation" => "Gets a thing.",
                ),
            ),
            "com.example#GetThingRequest" => Dict(
                "type" => "structure",
                "members" => Dict(
                    "id" => Dict(
                        "target" => "smithy.api#String",
                        "traits" => Dict(
                            "smithy.api#httpLabel" => Dict(),
                            "smithy.api#required" => Dict(),
                            "smithy.api#documentation" => "The thing ID.",
                        ),
                    ),
                    "clientToken" => Dict(
                        "target" => "smithy.api#String",
                        "traits" => Dict("smithy.api#idempotencyToken" => Dict()),
                    ),
                ),
            ),
            "smithy.api#Unit" => Dict("type" => "structure", "members" => Dict()),
        ),
    )

    result = _parse_smithy_model(smithy)

    @testset "metadata" begin
        meta = result["metadata"]
        @test meta["protocol"] == "rest-json"
        @test meta["endpointPrefix"] == "myservice"
        @test meta["serviceId"] == "My Service"
        @test meta["apiVersion"] == "2021-01-01"
        @test !haskey(meta, "signingName")  # same as endpointPrefix, not included
    end

    @testset "operations" begin
        ops = result["operations"]
        @test haskey(ops, "GetThing")
        op = ops["GetThing"]
        @test op["name"] == "GetThing"
        @test op["http"]["method"] == "GET"
        @test op["http"]["requestUri"] == "/things/{id}"
        @test op["documentation"] == "Gets a thing."
        @test op["input"]["shape"] == "GetThingRequest"
    end

    @testset "shapes" begin
        shapes = result["shapes"]
        @test haskey(shapes, "GetThingRequest")
        req = shapes["GetThingRequest"]
        @test req["required"] == ["id"]
        @test req["members"]["id"]["location"] == "uri"
        @test req["members"]["id"]["documentation"] == "The thing ID."
        @test req["members"]["clientToken"]["idempotencyToken"] == true
    end
end

@testset "_parse_smithy_model JSON service" begin
    smithy = Dict(
        "smithy" => "2.0",
        "shapes" => Dict(
            "com.example#MyJsonService" => Dict(
                "type" => "service",
                "version" => "2020-05-01",
                "traits" => Dict(
                    "aws.api#service" =>
                        Dict("sdkId" => "MyJSON", "endpointPrefix" => "myjson"),
                    "aws.auth#sigv4" => Dict("name" => "myjson"),
                    "aws.protocols#awsJson1_1" => Dict(),
                ),
            ),
        ),
    )

    result = _parse_smithy_model(smithy)
    meta = result["metadata"]
    @test meta["protocol"] == "json"
    @test meta["jsonVersion"] == "1.1"
    @test meta["targetPrefix"] == "MyJsonService"
end

@testset "_parse_smithy_model signing name differs from endpoint prefix" begin
    smithy = Dict(
        "smithy" => "2.0",
        "shapes" => Dict(
            "com.example#MyService" => Dict(
                "type" => "service",
                "version" => "2020-01-01",
                "traits" => Dict(
                    "aws.api#service" => Dict(
                        "sdkId" => "MyService",
                        "endpointPrefix" => "myendpoint",
                    ),
                    "aws.auth#sigv4" => Dict("name" => "mysigning"),
                    "aws.protocols#restJson1" => Dict(),
                ),
            ),
        ),
    )

    meta = _parse_smithy_model(smithy)["metadata"]
    @test meta["endpointPrefix"] == "myendpoint"
    @test meta["signingName"] == "mysigning"
end

@testset "_parse_smithy_model version from docId" begin
    smithy = Dict(
        "smithy" => "2.0",
        "shapes" => Dict(
            "com.example#MyService" => Dict(
                "type" => "service",
                # no "version" key — must be extracted from docId
                "traits" => Dict(
                    "aws.api#service" => Dict(
                        "sdkId" => "MyService",
                        "endpointPrefix" => "myservice",
                        "docId" => "myservice-2017-08-22",
                    ),
                    "aws.auth#sigv4" => Dict("name" => "myservice"),
                    "aws.protocols#awsJson1_1" => Dict(),
                ),
            ),
        ),
    )

    @test _parse_smithy_model(smithy)["metadata"]["apiVersion"] == "2017-08-22"
end

@testset "_smithy_to_legacy_shape" begin
    @testset "header member" begin
        shape = Dict(
            "type" => "structure",
            "members" => Dict(
                "ContentType" => Dict(
                    "target" => "smithy.api#String",
                    "traits" => Dict("smithy.api#httpHeader" => "Content-Type"),
                ),
            ),
        )
        result = _smithy_to_legacy_shape(shape)
        m = result["members"]["ContentType"]
        @test m["location"] == "header"
        @test m["locationName"] == "Content-Type"
    end

    @testset "list shape with xmlName" begin
        shape = Dict(
            "type" => "list",
            "member" => Dict(
                "target" => "smithy.api#String",
                "traits" => Dict("smithy.api#xmlName" => "item"),
            ),
        )
        result = _smithy_to_legacy_shape(shape)
        @test result["member"]["locationName"] == "item"
    end

    @testset "struct member with xmlName does not set locationName" begin
        # xmlName is for XML serialization only. For JSON protocol services (e.g. SQS),
        # using xmlName as the locationName would produce the wrong JSON key in requests.
        shape = Dict(
            "type" => "structure",
            "members" => Dict(
                "Entries" => Dict(
                    "target" => "smithy.api#String",
                    "traits" => Dict(
                        "smithy.api#xmlName" => "DeleteMessageBatchRequestEntry",
                        "smithy.api#xmlFlattened" => Dict(),
                    ),
                ),
            ),
        )
        result = _smithy_to_legacy_shape(shape)
        m = result["members"]["Entries"]
        @test m["location"] == ""
        @test !haskey(m, "locationName")
    end
end

@testset "_generate_low_level_definitions" begin
    services = JSON.parsefile(joinpath(@__DIR__, "resource", "services.json"))

    @testset "rest-xml" begin
        expected = "const s3 = AWS.RestXMLService(\"s3\", \"s3\", \"2006-03-01\")"
        response = _generate_low_level_definition(services["s3"])

        @test response == expected
    end

    @testset "rest-json" begin
        expected = "const glacier = AWS.RestJSONService(\"glacier\", \"glacier\", \"2012-06-01\", LittleDict(\"x-amz-glacier-version\" => \"2012-06-01\"))"
        response = _generate_low_level_definition(services["glacier"])

        @test response == expected
    end

    @testset "ec2 / query" begin
        expected = "const ec2 = AWS.QueryService(\"ec2\", \"ec2\", \"2016-11-15\")"
        response = _generate_low_level_definition(services["ec2"])

        @test response == expected
    end

    @testset "json" begin
        expected = "const budgets = AWS.JSONService(\"budgets\", \"budgets\", \"2016-10-20\", \"1.1\", \"AWSBudgetServiceGateway\")"
        response = _generate_low_level_definition(services["budgets"])

        @test response == expected
    end

    @testset "signingName matches endpointPrefix" begin
        expected = "const serviceid = AWS.RestXMLService(\"signingName\", \"signingName\", \"2021-04-09\")"
        response = _generate_low_level_definition(services["signingNameMatch"])

        @test response == expected
    end

    @testset "signingName does not match endpointPrefix" begin
        expected = "const serviceid = AWS.RestXMLService(\"signingName\", \"endpointPrefix\", \"2021-04-09\")"
        response = _generate_low_level_definition(services["signingNameNonMatch"])

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
        "targetPrefix" => "target",
    )

    @testset "Invalid Protocol" begin
        @test_throws ProtocolNotDefined _generate_low_level_definition(service)
    end

    @testset "rest-xml" begin
        service["protocol"] = "rest-xml"
        expected_result = "const sample_service = AWS.RestXMLService(\"endpoint\", \"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "rest-json" begin
        service["protocol"] = "rest-json"
        expected_result = "const sample_service = AWS.RestJSONService(\"endpoint\", \"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "json" begin
        service["protocol"] = "json"
        expected_result = "const sample_service = AWS.JSONService(\"endpoint\", \"endpoint\", \"api_version\", \"json_version\", \"target\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "query" begin
        service["protocol"] = "query"
        expected_result = "const sample_service = AWS.QueryService(\"endpoint\", \"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end

    @testset "ec2" begin
        service["protocol"] = "ec2"
        expected_result = "const sample_service = AWS.QueryService(\"endpoint\", \"endpoint\", \"api_version\")"
        result = _generate_low_level_definition(service)

        @test result == expected_result
    end
end

@testset "_html_to_markdown" begin
    html = "<p>To remove one or more tags, use the <a>RemoveTagsFromCertificate</a> action. \$ \\ To view all of the tags that have been applied to the certificate, use the <a>ListTagsForCertificate</a> action.</p>"
    markdown = "To remove one or more tags, use the [`remove_tags_from_certificate`](@ref) action. \\\$ \\\\ To view all of the tags that have been applied to the certificate, use the `ListTagsForCertificate` action."
    doc_refs = Dict("RemoveTagsFromCertificate" => "remove_tags_from_certificate")
    @test _html_to_markdown(html, doc_refs) == markdown

    # From S3 target "com.amazonaws.s3#GrantFullControl"
    html = "<p>Specify access permissions explicitly to give the grantee READ, READ_ACP, and WRITE_ACP permissions\n      on the object.</p>\n         <p>By default, all objects are private. Only the owner has full access control. When uploading an\n      object, you can use this header to explicitly grant access permissions to specific Amazon Web Services accounts or\n      groups. This header maps to specific permissions that Amazon S3 supports in an ACL. For more information, see\n        <a href=\"https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html\">Access Control List (ACL)\n        Overview</a> in the <i>Amazon S3 User Guide</i>.</p>\n         <p>You specify each grantee as a type=value pair, where the type is one of the following:</p>\n         <ul>\n            <li>\n               <p>\n                  <code>id</code> – if the value specified is the canonical user ID of an Amazon Web Services account</p>\n            </li>\n            <li>\n               <p>\n                  <code>uri</code> – if you are granting permissions to a predefined group</p>\n            </li>\n            <li>\n               <p>\n                  <code>emailAddress</code> – if the value specified is the email address of an\n          Amazon Web Services account</p>\n               <note>\n                  <p>Using email addresses to specify a grantee is only supported in the following Amazon Web Services Regions: </p>\n                  <ul>\n                     <li>\n                        <p>US East (N. Virginia)</p>\n                     </li>\n                     <li>\n                        <p>US West (N. California)</p>\n                     </li>\n                     <li>\n                        <p> US West (Oregon)</p>\n                     </li>\n                     <li>\n                        <p> Asia Pacific (Singapore)</p>\n                     </li>\n                     <li>\n                        <p>Asia Pacific (Sydney)</p>\n                     </li>\n                     <li>\n                        <p>Asia Pacific (Tokyo)</p>\n                     </li>\n                     <li>\n                        <p>Europe (Ireland)</p>\n                     </li>\n                     <li>\n                        <p>South America (São Paulo)</p>\n                     </li>\n                  </ul>\n                  <p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href=\"https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region\">Regions and Endpoints</a> in the Amazon Web Services General Reference.</p>\n               </note>\n            </li>\n         </ul>"
    markdown = "Specify access permissions explicitly to give the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.\n\nBy default, all objects are private. Only the owner has full access control. When uploading an object, you can use this header to explicitly grant access permissions to specific Amazon Web Services accounts or groups. This header maps to specific permissions that Amazon S3 supports in an ACL. For more information, see [Access Control List (ACL) Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3 User Guide*.\n\nYou specify each grantee as a type=value pair, where the type is one of the following:\n\n- `id` – if the value specified is the canonical user ID of an Amazon Web Services account\n- `uri` – if you are granting permissions to a predefined group\n- `emailAddress` – if the value specified is the email address of an Amazon Web Services account\n\n  !!! note\n      Using email addresses to specify a grantee is only supported in the following Amazon Web Services Regions:\n        - US East (N. Virginia)\n        - US West (N. California)\n        - US West (Oregon)\n        - Asia Pacific (Singapore)\n        - Asia Pacific (Sydney)\n        - Asia Pacific (Tokyo)\n        - Europe (Ireland)\n        - South America (São Paulo)\n      For a list of all the Amazon S3 supported Regions and endpoints, see [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) in the Amazon Web Services General Reference."
    @test _html_to_markdown(html) == markdown

    html = "<note> hello! </note>"
    markdown = "!!! note\n    hello!"
    @test _html_to_markdown(html) == markdown

    html = "<ul><li>list item.<note>foo</note><note>bar</note></li></ul>"
    markdown = "- list item.\n\n  !!! note\n      foo\n\n  !!! note\n      bar"
    @test _html_to_markdown(html) == markdown
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
    shapes = JSON.parsefile(joinpath(@__DIR__, "resource", "shapes.json"))

    @testset "required params" begin
        input = "RequiredParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test required_params == Dict(
            "RequiredParam" =>
                LittleDict("location" => "", "documentation" => "Required param"),
        )
        @test isempty(optional_params)
    end

    @testset "optional params" begin
        input = "OptionalParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test isempty(required_params)
        @test optional_params == Dict(
            "OptionalParam1" =>
                Dict("documentation" => "Optional param 1", "idempotent" => false),
            "OptionalParam2" =>
                Dict("documentation" => "Optional param 2", "idempotent" => false),
        )
    end

    @testset "required and optional params" begin
        input = "RequiredAndOptionalParams"

        required_params, optional_params = _get_function_parameters(input, shapes)

        @test required_params == Dict(
            "RequiredParam1" =>
                LittleDict("location" => "", "documentation" => "Required param 1"),
            "RequiredParam2" =>
                LittleDict("location" => "", "documentation" => "Required param 2"),
        )

        @test optional_params == Dict(
            "OptionalParam" =>
                Dict("documentation" => "Optional param", "idempotent" => false),
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
    operations = JSON.parsefile(joinpath(@__DIR__, "resource", "operations.json"))
    shapes = JSON.parsefile(joinpath(@__DIR__, "resource", "shapes.json"))

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
    function sample_operation end

    function sample_operation(RequiredParam1, RequiredParam2; aws_config::AbstractAWSConfig=current_aws_config())
        sample_service("POST", "/", Dict{String, Any}("RequiredParam1" => RequiredParam1, "RequiredParam2" => RequiredParam2); aws_config, feature_set=SERVICE_FEATURE_SET)
    end

    function sample_operation(RequiredParam1, RequiredParam2, params::AbstractDict{String}; aws_config::AbstractAWSConfig=current_aws_config())
        sample_service("POST", "/", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam1" => RequiredParam1, "RequiredParam2" => RequiredParam2), params)); aws_config, feature_set=SERVICE_FEATURE_SET)
    end
    """

    result = _generate_high_level_definitions(service_name, protocol, operations, shapes)

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
        required_params = Dict(
            "RequiredParam" =>
                Dict("location" => "", "documentation" => "This parameter is required."),
        )
        optional_params = Dict(
            "OptionalParam" => Dict(
                "idempotent" => false, "documentation" => "This parameter is optional."
            ),
        )

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
            function function_name end

            function function_name(RequiredParam; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("GET", "request_uri", Dict{String, Any}("RequiredParam" => RequiredParam); aws_config, feature_set=SERVICE_FEATURE_SET)
            end

            function function_name(RequiredParam, params::AbstractDict{String}; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("GET", "request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam" => RequiredParam), params)); aws_config, feature_set=SERVICE_FEATURE_SET)
            end
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation,
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
            function function_name end

            function function_name(RequiredParam; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("FunctionName", Dict{String, Any}("RequiredParam" => RequiredParam); aws_config, feature_set=SERVICE_FEATURE_SET)
            end

            function function_name(RequiredParam, params::AbstractDict{String}; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("FunctionName", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam" => RequiredParam), params)); aws_config, feature_set=SERVICE_FEATURE_SET)
            end
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation,
            )

            expected_result = _clean_high_level_definition(expected_result)
            result = _clean_high_level_definition(result)

            @test result == expected_result
        end
    end

    @testset "header location and idempotent" begin
        required_params = Dict(
            "RequiredParam" => Dict(
                "location" => "header", "documentation" => "This parameter is required."
            ),
        )
        optional_params = Dict(
            "OptionalParam" => Dict(
                "idempotent" => true, "documentation" => "This parameter is optional."
            ),
        )

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
            function function_name end

            function function_name(RequiredParam; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("GET", "request_uri", Dict{String, Any}("OptionalParam" => string(uuid4()), "headers" => Dict{String, Any}("RequiredParam" => RequiredParam)); aws_config, feature_set=SERVICE_FEATURE_SET)
            end

            function function_name(RequiredParam, params::AbstractDict{String}; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("GET", "request_uri", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("OptionalParam" => string(uuid4()), "headers" => Dict{String, Any}("RequiredParam" => RequiredParam)), params)); aws_config, feature_set=SERVICE_FEATURE_SET)
            end
            """
            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation,
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
            function function_name end

            function function_name(RequiredParam; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("FunctionName", Dict{String, Any}("RequiredParam" => RequiredParam, "OptionalParam" => string(uuid4())); aws_config, feature_set=SERVICE_FEATURE_SET)
            end

            function function_name(RequiredParam, params::AbstractDict{String}; aws_config::AbstractAWSConfig=current_aws_config())
                service_name("FunctionName", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("RequiredParam" => RequiredParam, "OptionalParam" => string(uuid4())), params)); aws_config, feature_set=SERVICE_FEATURE_SET)
            end
            """

            result = _generate_high_level_definition(
                service_name,
                protocol,
                name,
                method,
                request_uri,
                required_params,
                optional_params,
                documentation,
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

    @testset "get_markdown_indent" begin
        @test get_markdown_indent("foo") == 0
        @test get_markdown_indent("  foo") == 2
        @test get_markdown_indent("    foo") == 4

        @test get_markdown_indent("  ") == 0
        @test get_markdown_indent("    ") == 0

        @test get_markdown_indent("- foo") == 2
        @test get_markdown_indent("  - foo") == 4

        @test get_markdown_indent("1. foo") == 3
        @test get_markdown_indent("   1. foo") == 6
        @test get_markdown_indent("2. foo") == 3
        @test get_markdown_indent("   2. foo") == 6
    end

    @testset "_splitline" begin
        str = "This is a short sentence."

        @testset "limit < 1" begin
            @test_throws DomainError _splitline(""; limit=0)
            @test_throws DomainError _splitline(""; limit=-1)
        end

        @testset "basic" begin
            str = "foo-bar baz"

            for limit in 1:(length(str) + 1)
                @testset let limit = limit
                    expected = if limit <= 6
                        ("foo-", "bar baz")
                    elseif limit <= 10
                        ("foo-bar ", "baz")
                    else
                        ("foo-bar baz", "")
                    end

                    result = _splitline(str; limit)

                    # Provides better context than using `isa`
                    @test typeof(result) <: Tuple{AbstractString,AbstractString}

                    @test result == expected
                end
            end
        end

        @testset "respect newlines" begin
            str = "  foo\n  bar"
            for limit in 1:length(str)
                @testset let limit = limit
                    @test _splitline(str; limit) == ("  foo\n", "  bar")
                end
            end

            # Even though we can split earlier (limit=5) we avoid treating trailing spaces
            # towards our line length to avoid adding extra newlines.
            str = "  foo \n  bar"
            for limit in 1:length(str)
                @testset let limit = limit
                    @test _splitline(str; limit) == ("  foo \n", "  bar")
                end
            end

            @test _splitline("\nfoo"; limit=5) == ("\n", "foo")
        end

        @testset "avoid split" begin
            # Avoid splitting within a word
            str = "jμΛIα"
            @test _splitline(str; limit=1) == (str, "")

            # Avoid splittling code blocks (would otherwise split on a hypen)
            str = "`arn:aws:health:us-west-1::event/EBS/AWS`"
            @test _splitline(str; limit=1) == (str, "")

            # Avoid splitting in links
            str = "[I'm an inline-style link](https://localhost:8000/inline-link)"
            @test _splitline(str; limit=1) == (str, "")

            # Avoid splittine nested links
            str = "[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE-VIDEO-ID-HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE-VIDEO-ID-HERE)"
            @test _splitline(str; limit=1) == (str, "")
        end
    end

    @testset "_wraplines" begin
        @testset "limit < 1" begin
            @test_throws DomainError _wraplines(""; limit=0)
            @test_throws DomainError _wraplines(""; limit=-1)
        end

        @testset "basic" begin
            str = "foo-bar baz"

            for limit in 1:ncodeunits(str)
                @testset let limit = limit
                    if limit <= 6
                        # Lines are wrapped when they can be.
                        @test _wraplines(str; limit) == "foo-\nbar\nbaz"
                    elseif limit <= 7
                        # Wrap immediately after "foo-bar" which could accidentally cause
                        # the space to indent the next line.
                        @test _wraplines(str; limit) == "foo-bar\nbaz"
                    elseif limit <= 10
                        # Limit is long enough we wrap at the the space.
                        @test _wraplines(str; limit) == "foo-bar\nbaz"
                    else
                        # Limit is large enough that no wrapping occurs
                        @test _wraplines(str; limit) == "foo-bar baz"
                    end
                end
            end
        end

        @testset "respect newlines" begin
            str = "  foo\n  bar"
            for limit in 1:length(str)
                @testset let limit = limit
                    @test _wraplines(str; limit) == "  foo\n  bar"
                end
            end

            # Trim trailing spaces
            str = "  foo \n  bar"
            for limit in 1:length(str)
                @testset let limit = limit
                    @test _wraplines(str; limit) == "  foo\n  bar"
                end
            end

            # Remove newlines at the end of the string
            str = "  foo\n\n\n\n"
            for limit in 1:length(str)
                @testset let limit = limit
                    @test _wraplines(str; limit) == "  foo"
                end
            end
        end

        @testset "code-block" begin
            # The `limit` is based upon number of characters
            str = "This sentence contains exactly `η = 50` codeunits"

            for limit in 1:length(str)
                @testset let limit = limit
                    if limit <= 12
                        # Lines are wrapped for each word or code-block.
                        @test _wraplines(str; limit) ==
                            "This\nsentence\ncontains\nexactly\n`η = 50`\ncodeunits"
                    elseif limit <= 15
                        @test _wraplines(str; limit) ==
                            "This sentence\ncontains\nexactly\n`η = 50`\ncodeunits"
                    elseif limit <= 17
                        @test _wraplines(str; limit) ==
                            "This sentence\ncontains exactly\n`η = 50`\ncodeunits"
                    elseif limit <= 21
                        @test _wraplines(str; limit) ==
                            "This sentence\ncontains exactly\n`η = 50` codeunits"
                    elseif limit <= 25
                        @test _wraplines(str; limit) ==
                            "This sentence contains\nexactly `η = 50`\ncodeunits"
                    elseif limit <= 29
                        @test _wraplines(str; limit) ==
                            "This sentence contains\nexactly `η = 50` codeunits"
                    elseif limit <= 38
                        @test _wraplines(str; limit) ==
                            "This sentence contains exactly\n`η = 50` codeunits"
                    elseif limit <= 48
                        @test _wraplines(str; limit) ==
                            "This sentence contains exactly `η = 50`\ncodeunits"
                    else
                        @test _wraplines(str; limit) ==
                            "This sentence contains exactly `η = 50` codeunits"
                    end
                end
            end
        end

        @testset "whitespace handling" begin
            str = "16charactersthen    fourspaces "

            for limit in 1:ncodeunits(str)
                @testset let limit = limit
                    if limit <= 29
                        # Set line break before or on the first whitespace character.
                        # Accidental indententation will be removed.
                        @test _wraplines(str; limit) == "16charactersthen\nfourspaces"
                    else
                        @test _wraplines(str; limit) == "16charactersthen    fourspaces"
                    end
                end
            end
        end

        @testset "`limit=92` default" begin
            str = string(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            )
            expected = """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                labore et dolore magna aliqua."""
            @test _wraplines(str) == expected
            @test _wraplines(str; limit=92) == expected
        end

        @testset "auto-indent text" begin
            str = string(
                "  Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            )
            expected = string(
                "  Lorem ipsum dolor sit amet, consectetur adipiscing\n",
                "  elit, sed do eiusmod tempor incididunt ut labore et\n",
                "  dolore magna aliqua.",
            )
            @test _wraplines(str; limit=53) == expected
        end

        @testset "auto-indent unordered list" begin
            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            )
            expected = """
                - Lorem ipsum dolor sit amet, consectetur adipiscing
                  elit, sed do eiusmod tempor incididunt ut labore et
                  dolore magna aliqua."""
            @test _wraplines(str; limit=53) == expected
        end

        @testset "auto-indent ordered list" begin
            str = string(
                "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            )
            expected = """
                1. Lorem ipsum dolor sit amet, consectetur adipiscing
                   elit, sed do eiusmod tempor incididunt ut labore
                   et dolore magna aliqua."""
            @test _wraplines(str; limit=53) == expected
        end

        @testset "auto-indent list nested" begin
            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n",
                "  - Maecenas scelerisque erat vitae dignissim tempus.\n",
                "  - Morbi lacinia tortor at nibh blandit, id dictum dui venenatis.\n",
                "- Nunc a augue eu mauris scelerisque maximus id vel neque.",
            )
            expected = """
                - Lorem ipsum dolor sit amet, consectetur adipiscing
                  elit.
                  - Maecenas scelerisque erat vitae dignissim tempus.
                  - Morbi lacinia tortor at nibh blandit, id dictum
                    dui venenatis.
                - Nunc a augue eu mauris scelerisque maximus id vel
                  neque."""
            @test _wraplines(str; limit=53) == expected

            str = string(
                "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n",
                "   1. Maecenas scelerisque erat vitae dignissim tempus.\n",
                "   2. Morbi lacinia tortor at nibh blandit, id dictum dui venenatis.\n",
                "2. Nunc a augue eu mauris scelerisque maximus id vel neque.",
            )
            expected = """
                1. Lorem ipsum dolor sit amet, consectetur adipiscing
                   elit.
                   1. Maecenas scelerisque erat vitae dignissim
                      tempus.
                   2. Morbi lacinia tortor at nibh blandit, id dictum
                      dui venenatis.
                2. Nunc a augue eu mauris scelerisque maximus id vel
                   neque."""
            @test _wraplines(str; limit=53) == expected

            str = string(
                "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n",
                "   - Maecenas scelerisque erat vitae dignissim tempus.\n",
                "   - Morbi lacinia tortor at nibh blandit, id dictum dui venenatis.\n",
                "2. Nunc a augue eu mauris scelerisque maximus id vel neque.",
            )
            expected = """
                1. Lorem ipsum dolor sit amet, consectetur adipiscing
                   elit.
                   - Maecenas scelerisque erat vitae dignissim
                     tempus.
                   - Morbi lacinia tortor at nibh blandit, id dictum
                     dui venenatis.
                2. Nunc a augue eu mauris scelerisque maximus id vel
                   neque."""
            @test _wraplines(str; limit=53) == expected

            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n",
                "  1. Maecenas scelerisque erat vitae dignissim tempus.\n",
                "  2. Morbi lacinia tortor at nibh blandit, id dictum dui venenatis.\n",
                "- Nunc a augue eu mauris scelerisque maximus id vel neque.",
            )
            expected = """
                - Lorem ipsum dolor sit amet, consectetur adipiscing
                  elit.
                  1. Maecenas scelerisque erat vitae dignissim
                     tempus.
                  2. Morbi lacinia tortor at nibh blandit, id dictum
                     dui venenatis.
                - Nunc a augue eu mauris scelerisque maximus id vel
                  neque."""
            @test _wraplines(str; limit=53) == expected
        end

        @testset "`base_indent` keyword" begin
            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\n",
                "Maecenas scelerisque erat vitae dignissim tempus.\n\n",
                "note !!!\n",
                "     Morbi lacinia tortor at nibh blandit, id dictum dui venenatis.",
            )
            expected = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing\n",
                "  elit.\n\n",
                "  Maecenas scelerisque erat vitae dignissim tempus.\n\n",
                "  note !!!\n",
                "       Morbi lacinia tortor at nibh blandit, id\n",
                "       dictum dui venenatis.",
            )
            @test _wraplines(str; limit=53, base_indent=2) == expected

            str = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing elit:\n\n",
                "`arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`.",
            )
            expected = string(
                "- Lorem ipsum dolor sit amet, consectetur adipiscing\n",
                "  elit:\n",
                "\n",
                "  `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`.",
            )
            @test _wraplines(str; limit=53, base_indent=2) == expected
        end
    end
end
