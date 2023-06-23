using SHA: hmac_sha1
using CodecBase: Base32Decoder, Base64Decoder, transcode

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

# As defined in https://datatracker.ietf.org/doc/html/rfc4226#section-5
# Using fixed number of digits (6)
function hotp(k, c)
    digits = 6
    hs = hmac_sha1(k, c)
    dbc1 = dynamic_truncation(hs)
    otp = Int32(dbc1 % 10^digits)
    return lpad(otp, digits, '0')
end

function dynamic_truncation(hmac_result::Vector{UInt8})
    offset = hmac_result[20] & 0x0f  # lower 4-bits
    return (
        UInt32(hmac_result[offset + 1] & 0x7f) << 24 |
        UInt32(hmac_result[offset + 2] & 0xff) << 16 |
        UInt32(hmac_result[offset + 3] & 0xff) << 8 |
        UInt32(hmac_result[offset + 4] & 0xff)
    )  # big-endian
end

# As defined in https://datatracker.ietf.org/doc/html/rfc6238#section-4
function totp(k::Vector{UInt8}; duration=30, skip=0)
    t = time_step(; duration)
    c = reinterpret(UInt8, [hton(t + skip)]) # Convert to big-endian
    return hotp(k, c)
end

totp(k::AbstractString; kwargs...) = totp(transcode(Base32Decoder(), k); kwargs...)

# `t` is number of seconds since midnight UTC of January 1, 1970 (UNIX epoch)
time_step(; duration=30, t=time(), t0=0) = div(floor(Int64, t - t0), duration)


function gen_mfa_device(f, config::AbstractAWSConfig; username, mfa_device_name)
     # IAM users are limited to 8 MFA devices.
    # https://aws.amazon.com/blogs/security/you-can-now-assign-multiple-mfa-devices-in-iam/
    r = AWSServices.iam(
        "CreateVirtualMFADevice",
        Dict("VirtualMFADeviceName" => mfa_device_name);
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    body = parse(r)
    mfa_device = body["CreateVirtualMFADeviceResult"]["VirtualMFADevice"]
    mfa_serial = mfa_device["SerialNumber"]
    secret = String(transcode(Base64Decoder(), mfa_device["Base32StringSeed"]))

    AWSServices.iam(
        "EnableMFADevice",
        Dict(
            "UserName" => username,
            "SerialNumber" => mfa_serial,
            "AuthenticationCode1" => totp(secret),
            "AuthenticationCode2" => totp(secret; skip=1),
        );
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )

    try
        return f(mfa_serial, secret)
    finally
        AWSServices.iam(
            "DeactivateMFADevice",
            Dict(
                "UserName" => username,
                "SerialNumber" => mfa_serial,
            );
            aws_config=config,
            feature_set=AWS.FeatureSet(; use_response_type=true),
        )

        AWSServices.iam(
            "DeleteVirtualMFADevice",
            Dict("SerialNumber" => mfa_serial);
            aws_config=config,
            feature_set=AWS.FeatureSet(; use_response_type=true),
        )
    end
end

@testset "assume_role / assume_role_creds" begin
    # In order to mitigate the effects of using `assume_role` in order to test itself we'll
    # use the lowest-level call with as many defaults as possible.
    base_config = aws
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
        drift = Second(1)

        creds = assume_role_creds(config, role_a; duration=nothing)
        t = floor(now(UTC), Second)
        @test t <= creds.expiry <= t + Second(3600) + drift

        creds = assume_role_creds(config, role_a; duration=900)
        t = floor(now(UTC), Second)
        @test t <= creds.expiry <= t + Second(900) + drift
    end

    @testset "session_name" begin
        session_prefix = "AWS.jl-" * ENV["USER"]
        creds = assume_role_creds(config, role_a; session_name=nothing)
        regex = r":assumed-role/" * (role_a * '/' * session_prefix) * r"-\d{8}T\d{6}Z$"
        @test contains(creds.user_arn, regex)
        @test get_assumed_role(creds) == role_a

        session_name = "assume-role-session-name-testset-" * randstring(5)
        creds = assume_role_creds(config, role_a; session_name)
        regex = r":assumed-role/" * (role_a * '/' * session_name) * r"$"
        @test contains(creds.user_arn, regex)
        @test get_assumed_role(creds) == role_a
    end

    @testset "mfa_serial / token" begin
        creds = AWSCredentials(ENV["MFA_USER_ACCESS_KEY_ID"], ENV["MFA_USER_SECRET_ACCESS_KEY"])
        mfa_user_cfg = AWSConfig(; creds)

        gen_mfa_device(mfa_user_cfg; username="aws-jl-mfa-user", mfa_device_name="aws-jl-$(randstring(5))") do mfa_serial, secret
            creds = assume_role_creds(mfa_user_cfg, role_a; mfa_serial, token=totp(secret))
            @test get_assumed_role(creds) == role_a

            @test_throws AWSException assume_role_creds(mfa_user_cfg, role_a)
        end
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
