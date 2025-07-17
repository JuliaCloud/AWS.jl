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
    no_fallback_patch = @patch AWS.default_aws_config() = Some(nothing)
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

@testset "default_aws_config" begin
    @testset "initial config" begin
        initial_config = AWSConfig(; creds=nothing, region="us-initial-1")
        call_count = Threads.Atomic{Int}(0)
        initial_config_patch = @patch function AWS.AWSConfig()
            call_count[] += 1
            return initial_config
        end

        # Test will only work if this variable is unassigned. This requires that no calls to
        # `default_aws_config()` have occurred yet.
        @test !isassigned(AWS._DEFAULT_AWS_CONFIG)

        apply(initial_config_patch) do
            config = default_aws_config()
            @test config === initial_config
            @test call_count[] == 1
            @test isassigned(AWS._DEFAULT_AWS_CONFIG)

            config = default_aws_config()
            @test config === initial_config
            @test call_count[] == 1
        end
    end

    @testset "set default" begin
        default_config = AWSConfig(; creds=nothing, region="us-default-1")

        # Ensure the current default differs
        config = default_aws_config()
        @test config !== default_config

        @test default_aws_config(default_config) === nothing
        @test default_aws_config() === default_config
    end

    @testset "scoped interaction" begin
        config1 = AWSConfig(; creds=nothing, region="us-default-scoped-1")
        config2 = AWSConfig(; creds=nothing, region="us-default-scoped-2")

        default_aws_config(config1)
        @test default_aws_config() === config1
        @test current_aws_config() === config1

        with_aws_config(config2) do
            @test default_aws_config() === config1
            @test current_aws_config() === config2
        end

        @test default_aws_config() === config1
        @test current_aws_config() === config1
    end
end

@testset "global_aws_config" begin
    @testset "kwargs" begin
        # Fake AWS credentials as shown in the AWS documentation:
        # https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
        access_key_id = "AKIAIOSFODNN7EXAMPLE"
        secret_access_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
        creds = AWS.AWSCredentials(access_key_id, secret_access_key)
        region = "us-global-kwargs-1"

        set_result = @test_deprecated global_aws_config(; creds, region)
        @test set_result.region == region
        @test set_result.credentials == creds

        get_result = @test_deprecated global_aws_config()
        @test get_result === set_result
    end

    @testset "config" begin
        config = AWSConfig(; creds=nothing, region="us-global-1")

        set_result = @test_deprecated global_aws_config(config)
        @test set_result === config

        get_result = @test_deprecated global_aws_config()
        @test get_result === config
    end

    @testset "scoped interaction" begin
        config1 = AWSConfig(; creds=nothing, region="us-global-scoped-1")
        config2 = AWSConfig(; creds=nothing, region="us-global-scoped-2")

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
