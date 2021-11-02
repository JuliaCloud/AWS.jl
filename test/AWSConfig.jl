@testset "AWSConfig" begin
    @testset "default profile assumes role" begin
        access_key_id = "assumed_access_key_id"
        config_dir = joinpath(@__DIR__, "configs", "default-role")

        # Avoid calling out to STS with invalid credentials
        patch = Patches._assume_role_patch("AssumeRole"; access_key=access_key_id)

        config = withenv(
            "AWS_CONFIG_FILE" => joinpath(config_dir, "config"),
            "AWS_SHARED_CREDENTIALS_FILE" => joinpath(config_dir, "credentials"),
            "AWS_ACCESS_KEY_ID" => nothing,
            "AWS_SECRET_ACCESS_KEY" => nothing,
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
                @test aws_get_region(; profile="default", config=config_path) == "xx-yy-1"
            end
        end
    end
end
