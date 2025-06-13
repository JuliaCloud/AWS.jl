function get_assumed_role(aws_config::AbstractAWSConfig=global_aws_config())
    r = AWSServices.sts(
        "GetCallerIdentity";
        aws_config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    result = parse(r)
    arn = result["GetCallerIdentityResult"]["Arn"]
    m = match(r":assumed-role/(?<role>[^/]+)", arn)
    if m !== nothing
        return m["role"]
    else
        error("Caller Identity ARN is not an assumed role: $arn")
    end
end

get_assumed_role(creds::AWSCredentials) = get_assumed_role(AWSConfig(; creds))

function mfa_user_credentials(config::AbstractAWSConfig)
    r = AWSServices.secrets_manager(
        "GetSecretValue",
        Dict("SecretId" => "AWS.jl-mfa-user-credentials");
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    json = JSON.parse(parse(r)["SecretString"])
    mfa_user_creds = AWSCredentials(json["access_key_id"], json["secret_access_key"])
    mfa_user_cfg = AWSConfig(; creds=mfa_user_creds)

    r = AWSServices.secrets_manager(
        "GetSecretValue",
        Dict("SecretId" => "AWS.jl-mfa-user-virtual-mfa-devices");
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    json = JSON.parse(parse(r)["SecretString"])
    mfa_devices = [(; mfa_serial=d["mfa_serial"], seed=d["seed"]) for d in json]

    return mfa_user_cfg, mfa_devices
end

@testset "_whoami" begin
    user = AWS._whoami()
    @test user isa AbstractString
    @test !isempty(user)
end

@testset "assume_role / assume_role_creds" begin
    # In order to mitigate the effects of using `assume_role` in order to test itself we'll
    # use the lowest-level call with as many defaults as possible.
    base_config = AWS_CONFIG[]
    creds = assume_role_creds(base_config, testset_role("AssumeRoleTestset"))
    config = AWSConfig(; creds)
    @test get_assumed_role(config) == testset_role("AssumeRoleTestset")

    role_a = testset_role("RoleA")
    role_b = testset_role("RoleB")

    @testset "basic" begin
        creds = assume_role_creds(config, role_a)
        @test creds isa AWSCredentials
        @test creds.token != ""  # Temporary credentials
        @test creds.renew !== nothing

        cfg = assume_role(config, role_a)
        @test cfg isa AWSConfig
        @test cfg.credentials isa AWSCredentials
        @test cfg.region == config.region
        @test cfg.output == config.output
        @test cfg.max_attempts == config.max_attempts
    end

    @testset "role name/ARN" begin
        account_id = aws_account_number(config)

        creds = assume_role_creds(config, role_a)
        @test contains(creds.user_arn, r":assumed-role/" * (role_a * '/'))
        @test creds.account_number == account_id

        creds = assume_role_creds(config, "arn:aws:iam::$account_id:role/$role_a")
        @test contains(creds.user_arn, r":assumed-role/" * (role_a * '/'))
        @test creds.account_number == ""
    end

    @testset "duration" begin
        # Have seen up to 3 seconds of drift on CI jobs
        drift = Second(5)

        creds = assume_role_creds(config, role_a; duration=nothing)
        t = floor(now(UTC), Second)
        @test t <= creds.expiry <= t + Second(3600) + drift

        duration = 900  # Minimum allowed duration
        creds = assume_role_creds(config, role_a; duration)
        t = floor(now(UTC), Second)
        @test t <= creds.expiry <= t + Second(duration) + drift
    end

    @testset "session_name" begin
        session_prefix = "AWS.jl-"
        creds = assume_role_creds(config, role_a; session_name=nothing)
        regex = r":assumed-role/" * (role_a * '/' * session_prefix) * r".*-\d{8}T\d{6}Z$"
        @test contains(creds.user_arn, regex)
        @test get_assumed_role(creds) == role_a

        session_name = "assume-role-session-name-testset-" * randstring(5)
        creds = assume_role_creds(config, role_a; session_name)
        regex = r":assumed-role/" * (role_a * '/' * session_name) * r"$"
        @test contains(creds.user_arn, regex)
        @test get_assumed_role(creds) == role_a
    end

    @testset "mfa_serial / token" begin
        mfa_user_cfg, mfa_devices = mfa_user_credentials(config)

        # User policy should deny "sts:AssumeRole" when MFA is not present.
        @test_throws AWSException assume_role_creds(mfa_user_cfg, role_a)

        creds = mfa_device_pool(mfa_devices) do mfa_serial, token
            assume_role_creds(mfa_user_cfg, role_a; mfa_serial, token)
        end
        @test get_assumed_role(creds) == role_a
    end

    @testset "renew" begin
        creds = assume_role_creds(config, role_a; duration=nothing)
        @test creds.renew isa Function
        @test get_assumed_role(creds) == role_a

        new_creds = creds.renew()
        @test new_creds isa AWSCredentials
        @test get_assumed_role(new_creds) == role_a
        @test new_creds.access_key_id != creds.access_key_id
        @test new_creds.secret_key != creds.secret_key
        @test new_creds.expiry >= creds.expiry
    end

    @testset "role chaining" begin
        cfg = assume_role(assume_role(config, role_a), role_b)
        @test get_assumed_role(cfg) == role_b

        #! format: off
        cfg = config |> assume_role(role_a) |> assume_role(role_b)
        #! format: on
        @test get_assumed_role(cfg) == role_b
    end
end
