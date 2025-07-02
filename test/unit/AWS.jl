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
    creds = AWS.AWSCredentials("access-key", "secret")
    region = "test region"
    config = AWSConfig(; creds, region)

    old_config = isassigned(AWS.aws_config) ? AWS.aws_config[] : nothing
    try
        AWS.global_aws_config(config)

        result = AWS.global_aws_config()
        @test result.region == region
        @test result.credentials == creds
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
