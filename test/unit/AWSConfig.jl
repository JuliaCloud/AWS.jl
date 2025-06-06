@testset "AWSConfig" begin
    @testset "default profile assumes role" begin
        access_key_id = "assumed_access_key_id"
        config_dir = joinpath(@__DIR__, "..", "config", "default-role")

        # Avoid calling out to STS with invalid credentials
        patch = Patches._assume_role_patch("AssumeRole"; access_key=access_key_id)

        config = withenv(
            "AWS_CONFIG_FILE" => joinpath(config_dir, "config"),
            "AWS_SHARED_CREDENTIALS_FILE" => joinpath(config_dir, "credentials"),
        ) do
            apply(patch) do
                AWSConfig(; profile="default")
            end
        end

        @test config.credentials.access_key_id == access_key_id
    end

    @testset "default profile section names" begin
        allowed_default_sections = ["default", "profile default"]
        mktemp() do config_path, _
            for default_section_str in allowed_default_sections
                config = """
                [$default_section_str]
                region = xx-yy-1
                """
                write(config_path, config)
                region = aws_get_region(; profile="default", config=config_path)
                @test region == "xx-yy-1"
            end
        end
    end
end

@testset "with_aws_config / current_aws_config" begin
    no_fallback_patch = @patch AWS._fallback_aws_config() = Some(nothing)
    config1 = AWSConfig(; creds=nothing, region="us-example-1")
    config2 = AWSConfig(; creds=nothing, region="us-example-2")

    apply(no_fallback_patch) do
        @test current_aws_config() === nothing

        with_aws_config(config1) do
            @test current_aws_config() === config1

            with_aws_config(config2) do
                @test current_aws_config() === config2
            end

            @test current_aws_config() === config1
        end

        @test current_aws_config() === nothing
    end
end

@testset "global_aws_config" begin
    # Imperfect as we can't make a reference unassigned once assigned
    function revert_fallback(body)
        old_config = if isassigned(AWS._FALLBACK_AWS_CONFIG)
            AWS._FALLBACK_AWS_CONFIG[]
        else
            nothing
        end

        try
            body()
        finally
            if !isnothing(old_config)
                AWS._FALLBACK_AWS_CONFIG[] = old_config
            end
        end
    end

    @testset "kwargs" begin
        # Fake AWS credentials as shown in the AWS documentation:
        # https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
        access_key_id = "AKIAIOSFODNN7EXAMPLE"
        secret_access_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
        creds = AWS.AWSCredentials(access_key_id, secret_access_key)
        region = "us-example-1"

        revert_fallback() do
            @test_deprecated global_aws_config(; creds, region)

            result = @test_deprecated global_aws_config()
            @test result.region == region
            @test result.credentials == creds
        end
    end

    @testset "config" begin
        config = AWSConfig(; creds=nothing, region="us-example-2")

        revert_fallback() do
            @test_deprecated global_aws_config(config)
            @test (@test_deprecated global_aws_config()) === config
        end
    end

    @testset "scoped interaction" begin
        config1 = AWSConfig(; creds=nothing, region="us-example-1")
        config2 = AWSConfig(; creds=nothing, region="us-example-2")

        revert_fallback() do
            @test_deprecated global_aws_config(config1)
            @test (@test_deprecated global_aws_config()) === config1
            @test current_aws_config() === config1

            with_aws_config(config2) do
                @test (@test_deprecated global_aws_config()) === config1
                @test current_aws_config() === config2
            end

            @test (@test_deprecated global_aws_config()) === config1
            @test current_aws_config() === config1
        end
    end
end
