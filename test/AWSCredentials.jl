macro test_ecode(error_codes, expr)
    quote
        try
            $expr
            @test false
        catch e
            if e isa AWSException
                @test e.code in [$error_codes;]
            else
                rethrow(e)
            end
        end
    end
end

@testset "Load Credentials" begin
    user = aws_user_arn(aws)
    @test occursin(r"^arn:aws:(iam|sts)::[0-9]+:[^:]+$", user)
    aws.region = "us-east-1"

    @test_ecode("InvalidAction", AWSServices.iam("GetFoo"))

    @test_ecode(
        ["AccessDenied", "NoSuchEntity"],
        AWSServices.iam("GetUser", Dict("UserName" => "notauser"))
    )

    @test_ecode("ValidationError", AWSServices.iam("GetUser", Dict("UserName" => "@#!%%!")))

    @test_ecode(
        ["AccessDenied", "EntityAlreadyExists"],
        AWSServices.iam("CreateUser", Dict("UserName" => "root"))
    )
end

@testset "_role_session_name" begin
    @test AWS._role_session_name("prefix-", "name", "-suffix") == "prefix-name-suffix"
    @test AWS._role_session_name("a"^22, "b"^22, "c"^22) == "a"^22 * "b"^20 * "c"^22
end

@testset "ec2_instance_metadata" begin
    @testset "connect timeout" begin
        apply(Patches._instance_metadata_timeout_patch) do
            @test AWS.ec2_instance_metadata("/latest/meta-data") === nothing
        end
    end
end

@testset "ec2_instance_region" begin
    @testset "available" begin
        patch = @patch function HTTP.request(method::String, url; kwargs...)
            return HTTP.Response("ap-atlantis-1")  # Made up region
        end

        apply(patch) do
            @test AWS.ec2_instance_region() == "ap-atlantis-1"
        end
    end

    @testset "unavailable" begin
        apply(Patches._instance_metadata_timeout_patch) do
            @test AWS.ec2_instance_region() === nothing
        end
    end
end

@testset "aws_get_profile_settings" begin
    @testset "no profile" begin
        @test aws_get_profile_settings("foo", Inifile()) === nothing
    end
end

@testset "_aws_get_role" begin
    profile = "foobar"
    ini = Inifile()

    @testset "settings early exit" begin
        apply(Patches.get_profile_settings_empty_patch) do
            @test AWS._aws_get_role(profile, ini) === nothing
        end
    end

    @testset "source_profile early exit" begin
        apply(Patches.get_profile_settings_empty_patch) do
            @test AWS._aws_get_role(profile, ini) === nothing
        end
    end

    @testset "default profile" begin
        access_key_id = "assumed_access_key_id"
        config_dir = joinpath(@__DIR__, "configs", "default-role")

        patch = Patches._assume_role_patch("AssumeRole"; access_key=access_key_id)

        cred = withenv(
            "AWS_CONFIG_FILE" => joinpath(config_dir, "config"),
            "AWS_SHARED_CREDENTIALS_FILE" => joinpath(config_dir, "credentials"),
            "AWS_ACCESS_KEY_ID" => nothing,
            "AWS_SECRET_ACCESS_KEY" => nothing,
        ) do
            ini = read(Inifile(), ENV["AWS_CONFIG_FILE"])
            apply(patch) do
                AWS._aws_get_role("default", ini)
            end
        end

        @test cred.access_key_id == access_key_id
    end

    @testset "profile with role and MFA" begin
        access_key_id = "assumed_access_key_id"
        config_dir = joinpath(@__DIR__, "configs", "role-with-mfa")

        mfa_token = "123456"
        sent_token = Ref("")
        server_time = DateTime(0)
        patches = [
            Patches._assume_role_patch(
                "AssumeRole";
                access_key=access_key_id,
                expiry=duration -> server_time + duration,
                token_code_ref=sent_token,
            ),
            Patches._getpass_patch(; secret=mfa_token),
        ]

        cred = withenv(
            "AWS_CONFIG_FILE" => joinpath(config_dir, "config"),
            "AWS_SHARED_CREDENTIALS_FILE" => joinpath(config_dir, "credentials"),
            "AWS_ACCESS_KEY_ID" => nothing,
            "AWS_SECRET_ACCESS_KEY" => nothing,
        ) do
            ini = read(Inifile(), ENV["AWS_CONFIG_FILE"])
            apply(patches) do
                AWS._aws_get_role("role_and_mfa", ini)
            end
        end

        @test cred.access_key_id == access_key_id
        @test cred.expiry == server_time + Second(1234)
        @test sent_token[] == mfa_token
    end
end

@testset "AWSCredentials" begin
    @testset "Defaults" begin
        creds = AWSCredentials("access_key_id", "secret_key")
        @test creds.token == ""
        @test creds.user_arn == ""
        @test creds.account_number == ""
        @test creds.expiry == typemax(DateTime)
        @test creds.renew === nothing
    end

    @testset "Renewal" begin
        # Credentials shouldn't throw an error if no renew function is supplied
        creds = AWSCredentials("access_key_id", "secret_key"; renew=nothing)
        newcreds = check_credentials(creds; force_refresh=true)

        # Creds should remain unchanged if no renew function exists
        @test creds === newcreds
        @test creds.access_key_id == "access_key_id"
        @test creds.secret_key == "secret_key"
        @test creds.renew === nothing

        # Creds should error if the renew function returns nothing
        creds = AWSCredentials("access_key_id", "secret_key"; renew=() -> nothing)
        @test_throws NoCredentials check_credentials(creds; force_refresh=true)

        # Creds should remain unchanged
        @test creds.access_key_id == "access_key_id"
        @test creds.secret_key == "secret_key"

        # Creds should take on value of a returned AWSCredentials except renew function
        function gen_credentials()
            i = 0
            return () -> (i += 1; AWSCredentials("NEW_ID_$i", "NEW_KEY_$i"))
        end

        creds = AWSCredentials(
            "access_key_id", "secret_key"; renew=gen_credentials(), expiry=now(UTC)
        )

        @test creds.renew !== nothing
        renewed = creds.renew()

        @test creds.access_key_id == "access_key_id"
        @test creds.secret_key == "secret_key"
        @test creds.expiry <= now(UTC)
        @test AWS._will_expire(creds)

        @test renewed.access_key_id === "NEW_ID_1"
        @test renewed.secret_key == "NEW_KEY_1"
        @test renewed.renew === nothing
        @test renewed.expiry == typemax(DateTime)
        @test !AWS._will_expire(renewed)
        renew = creds.renew

        # Check renewal on time out
        newcreds = check_credentials(creds; force_refresh=false)
        @test creds === newcreds
        @test creds.access_key_id == "NEW_ID_2"
        @test creds.secret_key == "NEW_KEY_2"
        @test creds.renew !== nothing
        @test creds.renew === renew
        @test creds.expiry == typemax(DateTime)
        @test !AWS._will_expire(creds)

        # Check renewal doesn't happen if not forced or timed out
        newcreds = check_credentials(creds; force_refresh=false)
        @test creds === newcreds
        @test creds.access_key_id == "NEW_ID_2"
        @test creds.secret_key == "NEW_KEY_2"
        @test creds.renew !== nothing
        @test creds.renew === renew
        @test creds.expiry == typemax(DateTime)

        # Check forced renewal works
        newcreds = check_credentials(creds; force_refresh=true)
        @test creds === newcreds
        @test creds.access_key_id == "NEW_ID_3"
        @test creds.secret_key == "NEW_KEY_3"
        @test creds.renew !== nothing
        @test creds.renew === renew
        @test creds.expiry == typemax(DateTime)
    end

    mktempdir() do dir
        config_file = joinpath(dir, "config")
        creds_file = joinpath(dir, "creds")
        write(
            config_file,
            """
            [profile test]
            output = json
            region = us-east-1

            [profile test:dev]
            source_profile = test
            role_arn = arn:aws:iam::123456789000:role/Dev

            [profile test:sub-dev]
            source_profile = test:dev
            role_arn = arn:aws:iam::123456789000:role/SubDev

            [profile test2]
            aws_access_key_id = WRONG_ACCESS_ID
            aws_secret_access_key = WRONG_ACCESS_KEY
            output = json
            region = us-east-1

            [profile test3]
            source_profile = test:dev
            role_arn = arn:aws:iam::123456789000:role/test3

            [profile test4]
            aws_access_key_id = RIGHT_ACCESS_ID4
            aws_secret_access_key = RIGHT_ACCESS_KEY4
            source_profile = test:dev
            role_arn = arn:aws:iam::123456789000:role/test3
            """,
        )

        write(
            creds_file,
            """
            [test]
            aws_access_key_id = TEST_ACCESS_ID
            aws_secret_access_key = TEST_ACCESS_KEY

            [test2]
            aws_access_key_id = RIGHT_ACCESS_ID2
            aws_secret_access_key = RIGHT_ACCESS_KEY2

            [test3]
            aws_access_key_id = RIGHT_ACCESS_ID3
            aws_secret_access_key = RIGHT_ACCESS_KEY3
            """,
        )

        withenv(
            "AWS_SHARED_CREDENTIALS_FILE" => creds_file,
            "AWS_CONFIG_FILE" => config_file,
            "AWS_DEFAULT_PROFILE" => "test",
            "AWS_ACCESS_KEY_ID" => nothing,
        ) do
            @testset "Loading" begin
                # Check credentials load
                config = AWSConfig()
                creds = config.credentials

                @test creds isa AWSCredentials

                @test creds.access_key_id == "TEST_ACCESS_ID"
                @test creds.secret_key == "TEST_ACCESS_KEY"
                @test creds.renew !== nothing

                # Check credential file takes precedence over config
                withenv("AWS_DEFAULT_PROFILE" => "test2") do
                    config = AWSConfig()
                    creds = config.credentials

                    @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY2"
                end

                # Check credentials take precedence over role
                withenv("AWS_DEFAULT_PROFILE" => "test3") do
                    config = AWSConfig()
                    creds = config.credentials

                    @test creds.access_key_id == "RIGHT_ACCESS_ID3"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY3"
                end

                withenv("AWS_DEFAULT_PROFILE" => "test4") do
                    config = AWSConfig()
                    creds = config.credentials

                    @test creds.access_key_id == "RIGHT_ACCESS_ID4"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY4"
                end
            end

            @testset "Refresh" begin
                withenv("AWS_DEFAULT_PROFILE" => "test") do
                    # Check credentials refresh on timeout
                    config = AWSConfig()
                    creds = config.credentials
                    creds.access_key_id = "EXPIRED_ACCESS_ID"
                    creds.secret_key = "EXPIRED_ACCESS_KEY"
                    creds.expiry = now(UTC)

                    @test creds.renew !== nothing
                    renew = creds.renew

                    @test renew() isa AWSCredentials

                    creds = check_credentials(config.credentials)

                    @test creds.access_key_id == "TEST_ACCESS_ID"
                    @test creds.secret_key == "TEST_ACCESS_KEY"
                    @test creds.expiry > now(UTC)

                    # Check renew function remains unchanged
                    @test creds.renew !== nothing
                    @test creds.renew === renew

                    # Check force_refresh
                    creds.access_key_id = "WRONG_ACCESS_KEY"
                    creds = check_credentials(creds; force_refresh=true)
                    @test creds.access_key_id == "TEST_ACCESS_ID"
                end
            end

            @testset "Profile" begin
                # Check profile kwarg
                withenv("AWS_DEFAULT_PROFILE" => "test") do
                    creds = AWSCredentials(; profile="test2")
                    @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY2"

                    config = AWSConfig(; profile="test2")
                    creds = config.credentials
                    @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY2"

                    # Check profile persists on renewal
                    creds.access_key_id = "WRONG_ACCESS_ID2"
                    creds.secret_key = "WRONG_ACCESS_KEY2"
                    creds = check_credentials(creds; force_refresh=true)

                    @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                    @test creds.secret_key == "RIGHT_ACCESS_KEY2"
                end
            end

            @testset "Assume Role" begin
                # Check we try to assume a role
                withenv("AWS_DEFAULT_PROFILE" => "test:dev") do
                    @test_ecode("InvalidClientTokenId", AWSConfig())
                end

                # Check we try to assume a role
                withenv("AWS_DEFAULT_PROFILE" => "test:sub-dev") do
                    oldout = stdout
                    r, w = redirect_stdout()

                    @test_ecode("InvalidClientTokenId", AWSConfig())
                    redirect_stdout(oldout)
                    close(w)
                    output = String(read(r))
                    occursin("Assuming \"test:dev\"", output)
                    occursin("Assuming \"test\"", output)
                    close(r)
                end
            end
        end
    end
end

@testset "Retrieving AWS Credentials" begin
    test_values = Dict{String,Any}(
        "Default-Profile" => "default",
        "Test-Profile" => "test",
        "Test-Config-Profile" => "profile test",

        # Default profile values, needs to match due to AWSCredentials.jl check_credentials()
        "AccessKeyId" => "Default-Key",
        "SecretAccessKey" => "Default-Secret",
        "Test-AccessKeyId" => "Test-Key",
        "Test-SecretAccessKey" => "Test-Secret",
        "Token" => "Test-Token",
        "InstanceProfileArn" => "Test-Arn",
        "RoleArn" => "Test-Arn",
        "Expiration" => now(UTC),
        "URI" => "/Test-URI/",
        "Security-Credentials" => "Test-Security-Credentials",
    )

    _http_request_patch = @patch function HTTP.request(method::String, url; kwargs...)
        security_credentials = test_values["Security-Credentials"]
        uri = test_values["URI"]
        url = string(url)

        if url == "http://169.254.169.254/latest/meta-data/iam/info"
            instance_profile_arn = test_values["InstanceProfileArn"]
            return HTTP.Response("{\"InstanceProfileArn\": \"$instance_profile_arn\"}")
        elseif url == "http://169.254.169.254/latest/meta-data/iam/security-credentials/"
            return HTTP.Response(test_values["Security-Credentials"])
        elseif url ==
               "http://169.254.169.254/latest/meta-data/iam/security-credentials/$security_credentials" ||
            url == "http://169.254.170.2$uri"
            my_dict = JSON.json(test_values)
            response = HTTP.Response(my_dict)
            return response
        else
            return nothing
        end
    end

    @testset "~/.aws/config - Default Profile" begin
        mktemp() do config_file, config_io
            write(
                config_io,
                """
                [$(test_values["Default-Profile"])]
                aws_access_key_id=$(test_values["AccessKeyId"])
                aws_secret_access_key=$(test_values["SecretAccessKey"])
                """,
            )
            close(config_io)

            withenv("AWS_CONFIG_FILE" => config_file) do
                default_profile = dot_aws_config()

                @test default_profile.access_key_id == test_values["AccessKeyId"]
                @test default_profile.secret_key == test_values["SecretAccessKey"]
            end
        end
    end

    @testset "~/.aws/config - Specified Profile" begin
        mktemp() do config_file, config_io
            write(
                config_io,
                """
                [$(test_values["Test-Config-Profile"])]
                aws_access_key_id=$(test_values["Test-AccessKeyId"])
                aws_secret_access_key=$(test_values["Test-SecretAccessKey"])
                """,
            )
            close(config_io)

            withenv("AWS_CONFIG_FILE" => config_file) do
                specified_result = dot_aws_config(test_values["Test-Profile"])

                @test specified_result.access_key_id == test_values["Test-AccessKeyId"]
                @test specified_result.secret_key == test_values["Test-SecretAccessKey"]
            end
        end
    end

    @testset "~/.aws/creds - Default Profile" begin
        mktemp() do creds_file, creds_io
            write(
                creds_io,
                """
                [$(test_values["Default-Profile"])]
                aws_access_key_id=$(test_values["AccessKeyId"])
                aws_secret_access_key=$(test_values["SecretAccessKey"])
                """,
            )
            close(creds_io)

            withenv("AWS_SHARED_CREDENTIALS_FILE" => creds_file) do
                specified_result = dot_aws_credentials()

                @test specified_result.access_key_id == test_values["AccessKeyId"]
                @test specified_result.secret_key == test_values["SecretAccessKey"]
            end
        end
    end

    @testset "~/.aws/creds - Specified Profile" begin
        mktemp() do creds_file, creds_io
            write(
                creds_io,
                """
                [$(test_values["Test-Profile"])]
                aws_access_key_id=$(test_values["Test-AccessKeyId"])
                aws_secret_access_key=$(test_values["Test-SecretAccessKey"])
                """,
            )
            close(creds_io)

            withenv("AWS_SHARED_CREDENTIALS_FILE" => creds_file) do
                specified_result = dot_aws_credentials(test_values["Test-Profile"])

                @test specified_result.access_key_id == test_values["Test-AccessKeyId"]
                @test specified_result.secret_key == test_values["Test-SecretAccessKey"]
            end
        end
    end

    @testset "Environment Variables" begin
        withenv(
            "AWS_ACCESS_KEY_ID" => test_values["AccessKeyId"],
            "AWS_SECRET_ACCESS_KEY" => test_values["SecretAccessKey"],
        ) do
            aws_creds = env_var_credentials()
            @test aws_creds.access_key_id == test_values["AccessKeyId"]
            @test aws_creds.secret_key == test_values["SecretAccessKey"]
        end
    end

    @testset "Instance - EC2" begin
        role_name = "foobar"
        role_arn = "arn:aws:sts::1234:assumed-role/$role_name"
        access_key = "access-key-$(randstring(6))"
        secret_key = "secret-key-$(randstring(6))"
        session_token = "session-token-$(randstring(6))"
        session_name = "$role_name-session"
        patch = Patches._assume_role_patch(
            "AssumeRole";
            access_key=access_key,
            secret_key=secret_key,
            session_token=session_token,
            role_arn=role_arn,
        )

        apply([patch, _http_request_patch]) do
            result = ec2_instance_credentials("default")
            @test result.access_key_id == test_values["AccessKeyId"]
            @test result.secret_key == test_values["SecretAccessKey"]
            @test result.token == test_values["Token"]
            @test result.user_arn == test_values["InstanceProfileArn"]
            @test result.expiry == test_values["Expiration"]
            @test result.renew !== nothing

            result = mktemp() do config_file, config_io
                write(
                    config_io,
                    """
                    [profile $role_name]
                    credential_source = Ec2InstanceMetadata
                    role_arn = $role_arn
                    """,
                )
                close(config_io)

                withenv(
                    "AWS_CONFIG_FILE" => config_file,
                    "AWS_ROLE_SESSION_NAME" => session_name,
                ) do
                    ec2_instance_credentials(role_name)
                end
            end

            @test result.access_key_id == access_key
            @test result.secret_key == secret_key
            @test result.token == session_token
            @test result.user_arn == "$(role_arn)/$(session_name)"
            @test result.renew !== nothing
        end
    end

    @testset "Instance - ECS" begin
        withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => test_values["URI"]) do
            apply(_http_request_patch) do
                result = ecs_instance_credentials()
                @test result.access_key_id == test_values["AccessKeyId"]
                @test result.secret_key == test_values["SecretAccessKey"]
                @test result.token == test_values["Token"]
                @test result.user_arn == test_values["RoleArn"]
                @test result.expiry == test_values["Expiration"]
                @test result.renew == ecs_instance_credentials
            end
        end
    end

    @testset "Web Identity File" begin
        @test credentials_from_webtoken() == nothing

        mktempdir() do dir
            web_identity_file = joinpath(dir, "web_identity")
            write(web_identity_file, "foobar")
            session_name = "foobar-session"

            access_key = "access-key-$(randstring(6))"
            secret_key = "secret-key-$(randstring(6))"
            session_token = "session-token-$(randstring(6))"
            role_arn = "arn:aws:sts::1234:assumed-role/foobar"

            patch = Patches._assume_role_patch(
                "AssumeRoleWithWebIdentity";
                access_key=access_key,
                secret_key=secret_key,
                session_token=session_token,
                role_arn=role_arn,
                expiry=duration -> now(UTC), # expire immediately to check renewal
            )

            withenv(
                "AWS_ROLE_ARN" => "foobar",
                "AWS_WEB_IDENTITY_TOKEN_FILE" => web_identity_file,
                "AWS_ROLE_SESSION_NAME" => session_name,
            ) do
                apply(patch) do
                    result = credentials_from_webtoken()

                    @test result.access_key_id == access_key
                    @test result.secret_key == secret_key
                    @test result.token == session_token
                    @test result.user_arn == "$(role_arn)/$(session_name)"
                    @test result.renew == credentials_from_webtoken
                    expiry = result.expiry
                    sleep(0.1)
                    result = check_credentials(result)

                    @test result.access_key_id == access_key
                    @test result.secret_key == secret_key
                    @test result.token == session_token
                    @test result.user_arn == "$(role_arn)/$(session_name)"
                    @test result.renew == credentials_from_webtoken
                    @test expiry != result.expiry
                end
            end

            session_name = "AWS.jl-role-foobar-20210101T000000Z"
            patches = [
                patch
                @patch Dates.now(::Type{UTC}) = DateTime(2021)
            ]

            withenv(
                "AWS_ROLE_ARN" => "foobar",
                "AWS_WEB_IDENTITY_TOKEN_FILE" => web_identity_file,
                "AWS_ROLE_SESSION_NAME" => nothing,
            ) do
                apply(patches) do
                    result = credentials_from_webtoken()
                    @test result.user_arn == "$(role_arn)/$(session_name)"
                end
            end
        end
    end

    @testset "Credentials Not Found" begin
        patches = [
            @patch HTTP.request(method::String, url; kwargs...) = nothing
            Patches._cred_file_patch
            Patches._config_file_patch
        ]

        withenv(
            "AWS_ACCESS_KEY_ID" => nothing,
            "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => nothing,
        ) do
            apply(patches) do
                @test_throws NoCredentials AWSConfig()
            end
        end
    end

    @testset "Helper functions" begin
        @testset "Check Credentials - EnvVars" begin
            withenv(
                "AWS_ACCESS_KEY_ID" => test_values["AccessKeyId"],
                "AWS_SECRET_ACCESS_KEY" => test_values["SecretAccessKey"],
            ) do
                testAWSCredentials = AWSCredentials(
                    test_values["AccessKeyId"],
                    test_values["SecretAccessKey"];
                    expiry=Dates.now(UTC) - Minute(10),
                    renew=env_var_credentials,
                )

                result = check_credentials(testAWSCredentials; force_refresh=true)
                @test result.access_key_id == testAWSCredentials.access_key_id
                @test result.secret_key == testAWSCredentials.secret_key
                @test result.expiry == typemax(DateTime)
                @test result.renew == testAWSCredentials.renew
            end
        end
    end
end

@testset "aws_get_region" begin
    mktempdir() do dir
        config_str = """
            [default]
            region = us-west-2

            [profile test]
            region = ap-northeast-1
            """
        config_file = joinpath(dir, "config")
        write(config_file, config_str)
        ini = read(Inifile(), IOBuffer(config_str))

        @testset "environmental variable" begin
            withenv("AWS_DEFAULT_REGION" => "us-gov-east-1") do
                @test aws_get_region(; config=ini, profile="default") == "us-gov-east-1"
                @test aws_get_region() == "us-gov-east-1"
            end
        end

        @testset "default profile" begin
            withenv("AWS_DEFAULT_REGION" => nothing) do
                @test aws_get_region(; config=ini, profile="default") == "us-west-2"
                @test aws_get_region(; config=config_file, profile="default") == "us-west-2"
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => nothing,
                "AWS_DEFAULT_PROFILE" => nothing,
            ) do
                @test aws_get_region() == "us-west-2"
            end
        end

        @testset "specified profile" begin
            withenv("AWS_DEFAULT_REGION" => nothing) do
                @test aws_get_region(; config=ini, profile="test") == "ap-northeast-1"
                @test aws_get_region(; config=config_file, profile="test") ==
                    "ap-northeast-1"
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => "test",
            ) do
                @test aws_get_region() == "ap-northeast-1"
            end
        end

        @testset "unknown profile" begin
            withenv("AWS_DEFAULT_REGION" => nothing) do
                @test aws_get_region(; config=ini, profile="unknown") == AWS.DEFAULT_REGION
                @test aws_get_region(; config=config_file, profile="unknown") ==
                    AWS.DEFAULT_REGION
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => "unknown",
            ) do
                @test aws_get_region() == AWS.DEFAULT_REGION
            end
        end

        @testset "default keyword" begin
            default = nothing
            withenv("AWS_DEFAULT_REGION" => nothing) do
                @test aws_get_region(; config=ini, profile="unknown", default=default) ===
                    default
                @test aws_get_region(;
                    config=config_file, profile="unknown", default=default
                ) === default
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => "unknown",
            ) do
                @test aws_get_region(; default=default) === default
            end
        end

        @testset "no such config file" begin
            withenv("AWS_DEFAULT_REGION" => nothing, "AWS_CONFIG_FILE" => tempname()) do
                @test aws_get_region() == AWS.DEFAULT_REGION
            end
        end
    end
end
