@testset "@service" begin
    @testset "ID only" begin
        #! format: off
        @eval baremodule __service_id_only
            using AWS: @service
            @service STS
        end
        #! format: on

        @test :STS in names(__service_id_only; all=true)
        @test __service_id_only.STS isa Module
    end

    @testset "non-existent service" begin
        #! format: off
        @eval module __service_non_existent_service
            using AWS: @service
            const ex = try
                @service x
            catch e
                e
            end
        end
        #! format: on

        @test __service_non_existent_service.ex isa SystemError
        @test :x in names(__service_non_existent_service; all=true)
    end

    @testset "returns module" begin
        #! format: off
        @eval baremodule __service_returns_module
            using AWS: @service
            const M = @service STS
        end
        #! format: on

        @test :STS in names(__service_returns_module; all=true)
        @test :M in names(__service_returns_module; all=true)
        @test nameof(__service_returns_module.M) === :STS
        @test __service_returns_module.M isa Module
        @test __service_returns_module.M === __service_returns_module.STS
    end

    @testset "case-insensitive" begin
        #! format: off
        @eval module __service_case_insenstive
            using AWS: @service
            @service Secrets_Manager
            @service SECRETS_MANAGER
            @service sECRETS_MANAGER
        end
        #! format: on

        @test :Secrets_Manager in names(__service_case_insenstive; all=true)
        @test :SECRETS_MANAGER in names(__service_case_insenstive; all=true)
        @test :sECRETS_MANAGER in names(__service_case_insenstive; all=true)

        @test __service_case_insenstive.Secrets_Manager !==
            __service_case_insenstive.SECRETS_MANAGER
        @test __service_case_insenstive.Secrets_Manager !==
            __service_case_insenstive.sECRETS_MANAGER
        @test __service_case_insenstive.SECRETS_MANAGER !==
            __service_case_insenstive.sECRETS_MANAGER
    end

    # The lowercase service ID conflicts with the low-level API binding name
    # (e.g. `using AWS.AWSServices: sts`)
    @testset "lowercase" begin
        # Produces this warning:
        # WARNING: import of AWSServices.sts into sts conflicts with an existing identifier; ignored
        #! format: off
        @eval module __service_lowercase
            using AWS: @service
            @service sts
        end
        #! format: on

        @test :sts in names(__service_lowercase; all=true)
        @test __service_lowercase.sts isa Module
        @test_broken __service_lowercase.sts.sts isa AWS.Service
    end

    @testset "as" begin
        #! format: off
        @eval module __service_as
            using AWS: @service
            @service STS as SecurityTokenService
        end
        #! format: on

        @test nameof(__service_as.SecurityTokenService) === :SecurityTokenService
        @test __service_as.SecurityTokenService isa Module
        @test !(:STS in names(__service_as))
    end

    # These uses of the `@service` macro should not create a module
    @testset "invalid syntax" begin
        ex = VERSION >= v"1.7" ? MethodError : LoadError
        @test_throws ex @macroexpand @service()

        # Service ID is an expression
        ex = VERSION >= v"1.7" ? ArgumentError : LoadError
        @test_throws ex @macroexpand @service STS.X
        @test !(Symbol("STS.X") in names(@__MODULE__; all=true))

        # Module name is an expression
        ex = VERSION >= v"1.7" ? ArgumentError : LoadError
        @test_throws ex @macroexpand @service STS as STS.X
        @test !(:STS in names(@__MODULE__; all=true))
        @test !(Symbol("STS.X") in names(@__MODULE__; all=true))
    end
end

@testset "global config, kwargs" begin
    creds = AWS.AWSCredentials("access-key", "secret")
    region = "us-east-2"

    old_config = isassigned(AWS.aws_config) ? AWS.aws_config[] : nothing
    try
        AWS.global_aws_config(; creds, region)

        result = AWS.global_aws_config()
        @test result.region == region
        @test result.credentials == creds
    finally
        if !isnothing(old_config)
            AWS.aws_config[] = old_config
        end
    end
end

@testset "set global aws config" begin
    config = _fake_aws_config()

    old_config = isassigned(AWS.aws_config) ? AWS.aws_config[] : nothing
    try
        AWS.global_aws_config(config)

        result = AWS.global_aws_config()
        @test result.region == config.region
        @test result.credentials == config.credentials
    finally
        if !isnothing(old_config)
            AWS.aws_config[] = old_config
        end
    end
end

@testset "set user agent" begin
    old_user_agent = AWS.user_agent[]
    new_user_agent = "new user agent"

    try
        @test AWS.user_agent[] == "AWS.jl/$(pkgversion(AWS))"
        set_user_agent(new_user_agent)
        @test AWS.user_agent[] == new_user_agent
    finally
        set_user_agent(old_user_agent)
    end
end

@testset "sign" begin
    access_key = "access-key"
    secret_key = "ssh... it is a secret"

    creds = AWS.AWSCredentials(access_key, secret_key)
    aws = AWS.AWSConfig(; creds, region="us-east-1")

    time = DateTime(2020)
    date = Dates.format(time, dateformat"yyyymmdd")

    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        headers=LittleDict(
            "Host" => "s3.us-east-1.amazonaws.com", "User-Agent" => "AWS.jl/1.0.0"
        ),
        resource="/test-resource",
        url="https://s3.us-east-1.amazonaws.com/test-resource",
    )

    @testset "sign v2" begin
        result = AWS.sign_aws2!(aws, request, time)
        @test result === request
        content = result.content
        content_type = result.headers["Content-Type"]

        expected_access_key = "AWSAccessKeyId=$access_key"
        expected_expires = "Expires=2020-01-01T00%3A02%3A00Z"
        expected_signature_method = "SignatureMethod=HmacSHA256"
        expected_signature_version = "SignatureVersion=2"
        expected_signature = "Signature=O0MLzMKpEcfVZeHy0tyxVAuZF%2BvrvbgIGgqbWtJLTQ0%3D"

        expected_content = join(
            [
                expected_access_key,
                expected_expires,
                expected_signature_method,
                expected_signature_version,
                expected_signature,
            ],
            '&',
        )

        @test content == expected_content
    end

    @testset "sign v4" begin
        @testset "basic" begin
            expected_x_amz_content_sha256 = bytes2hex(digest(MD_SHA256, request.content))
            expected_content_md5 = base64encode(digest(MD_MD5, request.content))
            expected_x_amz_date = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

            result = AWS.sign_aws4!(aws, request, time)
            @test result === request
            headers = result.headers

            @test headers["x-amz-content-sha256"] == expected_x_amz_content_sha256
            @test headers["Content-MD5"] == expected_content_md5
            @test headers["x-amz-date"] == expected_x_amz_date

            authorization_header = split(headers["Authorization"], ' ')
            @test length(authorization_header) == 4
            @test authorization_header[1] == "AWS4-HMAC-SHA256"
            @test authorization_header[2] ==
                "Credential=$access_key/$date/us-east-1/$(request.service)/aws4_request,"
            @test authorization_header[3] ==
                "SignedHeaders=content-md5;content-type;host;user-agent;x-amz-content-sha256;x-amz-date,"
            @test authorization_header[4] ==
                "Signature=0f292eaf0b66cf353bafcb1b9b6d90ee27064236a60f17f6fc5bd7d40173a0be"
        end

        @testset "duplicate query params" begin
            request_query = deepcopy(request)
            request_query.url = "https://s3.us-east-1.amazonaws.com/test-resource?versions"

            request_dup = deepcopy(request)
            request_dup.url = "https://s3.us-east-1.amazonaws.com/test-resource?versions&versions="

            AWS.sign_aws4!(aws, request_query, time)
            AWS.sign_aws4!(aws, request_dup, time)

            authorization_header_query = split(request_query.headers["Authorization"], ' ')
            authorization_header_dup = split(request_dup.headers["Authorization"], ' ')

            @test length(authorization_header_query) == 4
            @test length(authorization_header_dup) == 4

            # Signatures should differ
            @test authorization_header_query[4] != authorization_header_dup[4]
        end
    end
end

@testset "submit_request" begin
    aws = _fake_aws_config()

    function _expected_xml(body::AbstractString, dict_type::Type)
        parsed = parse_xml(body)
        return xml_dict(XMLDict.root(parsed.x), dict_type)
    end

    @testset "301 redirect" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="HEAD",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )
        apply(Patches._aws_http_request_patch(Patches._response(; status=301))) do
            @test_throws AWSException AWS.submit_request(aws, request)
        end
    end

    @testset "HEAD response" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="HEAD",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        response = apply(Patches._aws_http_request_patch()) do
            AWS.submit_request(aws, request)
        end

        # Access to response headers
        @test response.response.headers == Patches.headers
        @test response.response.headers isa Vector

        # Access to streaming content
        @test response.io isa IO

        # Content as a string
        @test String(take!(response.io)) == Patches.body

        # Backwards compatibility with those expecting an `HTTP.Response`
        @test response.headers == Patches.headers
        @test response.headers isa Vector
        @test String(response.body) == Patches.body
    end

    @testset "GET response" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        response = apply(Patches._aws_http_request_patch()) do
            AWS.submit_request(aws, request)
        end

        # Access to response headers
        @test response.response.headers == Patches.headers
        @test response.response.headers isa Vector

        # Access to streaming content
        @test response.io isa IO

        # Content as a string
        @test String(take!(response.io)) == Patches.body

        # Backwards compatibility with those expecting an `HTTP.Response`
        @test response.headers == Patches.headers
        @test response.headers isa Vector
        @test String(response.body) == Patches.body
    end

    @testset "Default throttling" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        retries = Ref{Int}(0)
        exception = apply(Patches._throttling_patch(retries)) do
            try
                AWS.submit_request(aws, request)
                return nothing
            catch e
                if e isa AWSException
                    return e
                else
                    rethrow()
                end
            end
        end

        @test exception isa AWSException
        @test exception.code == "SlowDown"
        @test retries[] == AWS.max_attempts(aws)
    end

    @testset "Custom throttling" begin
        aws = _fake_aws_config(; max_attempts=1)
        @test AWS.max_attempts(aws) == 1

        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        retries = Ref{Int}(0)
        exception = apply(Patches._throttling_patch(retries)) do
            try
                AWS.submit_request(aws, request)
                return nothing
            catch e
                if e isa AWSException
                    return e
                else
                    rethrow()
                end
            end
        end

        @test exception isa AWSException
        @test exception.code == "SlowDown"
        @test retries[] == AWS.max_attempts(aws)
    end

    @testset "Not authorized" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        message = "User is not authorized to perform: action on resource with an explicit deny"

        # Simulate the HTTP.request behaviour with a HTTP 400 response
        exception = apply(Patches.gen_http_options_400_patches(message)) do
            try
                AWS.submit_request(aws, request)
                return nothing
            catch e
                if e isa AWSException
                    return e
                else
                    rethrow()
                end
            end
        end

        @test exception isa AWSException

        # If handled incorrectly using a `response_stream` may result in the body data being
        # lost. Mainly, this is a problem when using a temporary I/O stream instead of
        # writing directly to the `response_stream`.
        @test exception.message == message
        @test exception.streamed_body !== nothing
    end

    @testset "Not authorized with BufferStream response_stream" begin
        buf = Base.BufferStream()
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            response_stream=buf,
            use_response_type=true,
        )
        message = "User is not authorized to perform: action on resource with an explicit deny"
        # Simulate the HTTP.request behaviour with a HTTP 400 response
        exception = apply(Patches.gen_http_options_400_patches(message)) do
            try
                AWS.submit_request(aws, request)
                return nothing
            catch e
                if e isa AWSException
                    return e
                else
                    rethrow()
                end
            end
        end
        @test exception isa AWSException
        # If handled incorrectly using a `response_stream` may result in the body data being
        # lost. Mainly, this is a problem when using a temporary I/O stream instead of
        # writing directly to the `response_stream`.
        @test exception.message == message
        @test exception.streamed_body !== nothing
    end

    @testset "read MIME-type" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        @testset "invalid content type" begin
            headers = Pair["Content-Type" => ""]
            body = ""
            expected_body_type = Vector{UInt8}
            expected_body = b""

            r = Patches._response(; headers=headers, body=body)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "text/xml" begin
            headers = Pair["Content-Type" => "text/xml"]
            expected_body_type = LittleDict{Union{String,Symbol},Any}
            expected_body = _expected_xml(Patches.body, expected_body_type)

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "application/xml" begin
            headers = Pair["Content-Type" => "application/xml"]
            expected_body_type = LittleDict{Union{String,Symbol},Any}
            expected_body = _expected_xml(Patches.body, expected_body_type)

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "application/json" begin
            headers = ["Content-Type" => "application/json"]
            body = JSON.json(
                Dict{String,Any}(
                    "Marker" => nothing,
                    "VaultList" => Any[Dict{String,Any}(
                        "VaultName" => "test",
                        "SizeInBytes" => 0,
                        "NumberOfArchives" => 0,
                        "CreationDate" => "2020-06-22T03:14:41.754Z",
                        "VaultARN" => "arn:aws:glacier:us-east-1:000:vaults/test",
                        "LastInventoryDate" => nothing,
                    )],
                ),
            )

            expected_body_type = LittleDict{String,Any}
            expected_body = JSON.parse(body; dicttype=expected_body_type)

            r = Patches._response(; body=body, headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "text/html" begin
            headers = ["Content-Type" => "text/html"]
            expected_body = Patches.body

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa String
            @test content == expected_body
        end

        # Note: `S3.create_multipart_upload` is an example of a response type that doesn't
        # specify a Content-Type.
        @testset "missing content type" begin
            headers = Pair[]
            body = """
                <?xml version="1.0" encoding="UTF-8"?>
                <root><body>text</body></root>
                """
            expected_body_type = AbstractDict
            expected_body = Dict{String,Any}("body" => "text")

            r = Patches._response(; headers=headers, body=body)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body

            content = parse(response, MIME"text/plain"())
            @test content isa String
            @test content == body
        end
    end
end

struct TestBackend <: AWS.AbstractBackend
    param::Int
end

function AWS._http_request(backend::TestBackend, ::AWS.Request, ::IO)
    return backend.param
end

@testset "HTTPBackend" begin
    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        backend=AWS.HTTPBackend(),
    )
    io = IOBuffer()

    apply(Patches._http_options_patches) do
        # No default options
        @test isempty(AWS._http_request(request.backend, request, io))

        # We can pass HTTP options via the backend
        custom_backend = AWS.HTTPBackend(Dict(:connection_limit => 5))
        @test custom_backend isa AWS.AbstractBackend
        @test AWS._http_request(custom_backend, request, io) == Dict(:connection_limit => 5)

        # We can pass options per-request
        request.http_options = Dict(:pipeline_limit => 20)
        @test AWS._http_request(request.backend, request, io) == Dict(:pipeline_limit => 20)
        @test AWS._http_request(custom_backend, request, io) ==
            Dict(:pipeline_limit => 20, :connection_limit => 5)

        # per-request options override backend options:
        custom_backend = AWS.HTTPBackend(Dict(:pipeline_limit => 5))
        @test AWS._http_request(custom_backend, request, io) == Dict(:pipeline_limit => 20)
    end

    request.backend = TestBackend(2)
    @test AWS._http_request(request.backend, request, io) == 2

    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        backend=TestBackend(4),
    )
    @test AWS._http_request(request.backend, request, io) == 4

    # Let's test setting the default backend
    prev_backend = AWS.DEFAULT_BACKEND[]
    try
        AWS.DEFAULT_BACKEND[] = TestBackend(3)
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        )
        @test AWS._http_request(request.backend, request, io) == 3
    finally
        AWS.DEFAULT_BACKEND[] = prev_backend
    end
end

@testset "_generate_rest_resource" begin
    request_uri = "/{Bucket}/{Key+}"
    args = Dict{String,Any}("Bucket" => "aws.jl-test", "Key" => "Test-Key")

    expected = "/$(args["Bucket"])/$(args["Key"])"
    result = AWS._generate_rest_resource(request_uri, args)
    @test result == expected
end

@testset "generate_service_url" begin
    region = "us-east-2"
    resource = "/aws.jl-test---timestamp"
    config = _fake_aws_config(; region)

    request = Request(;
        service="service",
        api_version="api_version",
        request_method="GET",
        resource=resource,
    )

    @testset "regionless endpoints" for regionless_endpoint in ("iam", "route53")
        endpoint = "sdb"
        request.service = regionless_endpoint
        expected_result = "https://$regionless_endpoint.amazonaws.com$resource"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end

    @testset "region service" begin
        endpoint = "sdb"
        request.service = endpoint
        expected_result = "https://$endpoint.$region.amazonaws.com$resource"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end

    @testset "sdb -- us-east-1 region exception" begin
        endpoint = "sdb"
        request.service = endpoint
        expected_result = "https://$endpoint.amazonaws.com$resource"
        config.region = "us-east-1"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end
end

@testset "_flatten_query" begin
    high_level_value = "high_level_value"
    entry_1 = LittleDict(
        "low_level_key_1" => "low_level_value_1", "low_level_key_2" => "low_level_value_2"
    )
    entry_2 = LittleDict(
        "low_level_key_3" => "low_level_value_3", "low_level_key_4" => "low_level_value_4"
    )

    args = LittleDict(
        "high_level_key" => high_level_value, "high_level_array" => [entry_1, entry_2]
    )

    @testset "non-special case suffix" begin
        service = "sts"
        result = AWS._flatten_query(service, args)

        expected = Pair{String,String}[
            "high_level_key" => "high_level_value",
            "high_level_array.member.1.low_level_key_1" => "low_level_value_1",
            "high_level_array.member.1.low_level_key_2" => "low_level_value_2",
            "high_level_array.member.2.low_level_key_3" => "low_level_value_3",
            "high_level_array.member.2.low_level_key_4" => "low_level_value_4",
        ]

        @test result == expected
    end

    @testset "sqs - special casing suffix" begin
        service = "sqs"
        result = AWS._flatten_query(service, args)

        expected = Pair{String,String}[
            "high_level_key" => "high_level_value",
            "high_level_array.1.low_level_key_1" => "low_level_value_1",
            "high_level_array.1.low_level_key_2" => "low_level_value_2",
            "high_level_array.2.low_level_key_3" => "low_level_value_3",
            "high_level_array.2.low_level_key_4" => "low_level_value_4",
        ]

        @test result == expected
    end
end

@testset "_clean_s3_uri" begin
    uri = "/test-bucket/*)=('! +@,:.txt?list-objects=v2"
    expected_uri = "/test-bucket/%2A%29%3D%28%27%21%20%2B%40%2C%3A.txt?list-objects=v2"
    @test AWS._clean_s3_uri(uri) == expected_uri

    # make sure that other parts of the uri aren't changed by `_clean_s3_uri`
    for uri in (
        "https://julialang.org",
        "http://julialang.org",
        "http://julialang.org:8080",
        "/onlypath",
        "/path?query=  +99",
        "/anchor?query=yes#anchor1",
    )
        @test AWS._clean_s3_uri(uri) == uri
    end
end
