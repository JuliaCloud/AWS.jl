# Avoids calling out to STS with invalid credentials
assume_role_patch = @patch function AWS.AWSServices.sts(op::String, ::AbstractDict; kwargs...)
    if op == "AssumeRole"
        return Dict(
            "AssumeRoleResult" => Dict(
                "Credentials" => Dict(
                    "AccessKeyId" => "assumed_access_key_id",
                    "SecretAccessKey" => "assumed_secret_access_key",
                    "SessionToken" => "assumed_session_token",
                    "Expiration" => string(now(UTC) + Hour(1)) * "Z",
                )
            )
        )
    else
        error("Unhandled op: $op")
    end
end

@testset "AWSConfig" begin
    withenv(
        "AWS_CONFIG_FILE" => joinpath(@__DIR__, "configs", "default-role", "config"),
        "AWS_SHARED_CREDENTIALS_FILE" => joinpath(@__DIR__, "configs", "default-role", "credentials"),
    ) do
        config = apply(assume_role_patch) do
            AWSConfig(; profile="default")
        end

        @test config.credentials.access_key_id == "assumed_access_key_id"
    end
end
