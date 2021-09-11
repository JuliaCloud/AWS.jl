@testset "AWSConfig" begin
    @testset "default profile assumes role" begin
        # Avoid calling out to STS with invalid credentials
        patch = Patches._assume_role_patch("AssumeRole"; access_key="assumed_access_key_id")

        config = withenv(
            "AWS_CONFIG_FILE" => joinpath(@__DIR__, "configs", "default-role", "config"),
            "AWS_SHARED_CREDENTIALS_FILE" => joinpath(@__DIR__, "configs", "default-role", "credentials"),
        ) do
            apply(patch) do
                AWSConfig(; profile="default")
            end
        end

        @test config.credentials.access_key_id == "assumed_access_key_id"
    end
end
