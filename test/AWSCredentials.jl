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

const EXPIRATION_FMT = dateformat"yyyy-mm-dd\THH:MM:SS\Z"

http_header(h::Vector, k, d="") = get(Dict(h), k, d)
http_header(args...) = HTTP.header(args...)

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

    # Please note: If testing in a managed Corporate AWS environment, this can set off alarms...
    @test_ecode(
        ["AccessDenied", "EntityAlreadyExists"],
        AWSServices.iam("CreateUser", Dict("UserName" => "root"))
    )
end

@testset "_role_session_name" begin
    @test AWS._role_session_name("prefix-", "name", "-suffix") == "prefix-name-suffix"
    @test AWS._role_session_name("a"^22, "b"^22, "c"^22) == "a"^22 * "b"^20 * "c"^22
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
            "AWS_PROFILE" => nothing,
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

    # Verify that the search order for credentials mirrors the behavior of the AWS CLI
    # (version 2.11.13). Whenever support is added for new credential types new tests should
    # be added to this test set. To determine the credential preference order used by AWS
    # CLI it is recommended you use a set of valid credentials and a set of invalid
    # credentials to determine the precedence.
    #
    # Documentation on credential precedence:
    # - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-authentication.html#cli-chap-authentication-precedence
    # - https://docs.aws.amazon.com/sdk-for-net/v3/developer-guide/creds-assign.html
    # - https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/credentials.html
    @testset "Credential Precedence" begin
        mktempdir() do dir
            config_file = joinpath(dir, "config")
            creds_file = joinpath(dir, "creds")

            basic_creds_content = """
                [profile1]
                aws_access_key_id = AKI1
                aws_secret_access_key = SAK1

                [profile2]
                aws_access_key_id = AKI2
                aws_secret_access_key = SAK2
                """

            ec2_json = Dict(
                "AccessKeyId" => "AKI_EC2",
                "SecretAccessKey" => "SAK_EC2",
                "Token" => "TOK_EC2",
                "Expiration" => Dates.format(now(UTC), EXPIRATION_FMT),
            )

            function ec2_metadata(url::AbstractString)
                name = "local-credentials"
                metadata_uri = "http://169.254.169.254/latest/meta-data"
                if url == "$metadata_uri/iam/info"
                    return HTTP.Response(200, JSON.json("InstanceProfileArn" => "ARN0"))
                elseif url == "$metadata_uri/iam/security-credentials/"
                    return HTTP.Response(200, name)
                elseif url == "$metadata_uri/iam/security-credentials/$name"
                    return HTTP.Response(200, JSON.json(ec2_json))
                else
                    return HTTP.Response(404)
                end
            end

            ecs_json = Dict(
                "AccessKeyId" => "AKI_ECS",
                "SecretAccessKey" => "SAK_ECS",
                "Token" => "TOK_ECS",
                "Expiration" => Dates.format(now(UTC), EXPIRATION_FMT),
            )

            function ecs_metadata(url::AbstractString)
                if startswith(url, "http://169.254.170.2/")
                    return HTTP.Response(200, JSON.json(ecs_json))
                else
                    return HTTP.Response(404)
                end
            end

            function ecs_metadata_localhost(url::AbstractString)
                if startswith(url, "http://localhost:8080")
                    return HTTP.Response(200, JSON.json(ecs_json))
                else
                    return HTTP.Response(404)
                end
            end

            function http_request_patcher(funcs)
                @patch function HTTP.request(method, url, args...; kwargs...)
                    local r
                    for f in funcs
                        r = f(string(url))
                        r.status != 404 && break
                    end
                    return r
                end
            end

            withenv(
                [k => nothing for k in filter(startswith("AWS_"), keys(ENV))]...,
                "AWS_SHARED_CREDENTIALS_FILE" => creds_file,
                "AWS_CONFIG_FILE" => config_file,
            ) do
                @testset "explicit profile preferred" begin
                    isfile(config_file) && rm(config_file)
                    write(creds_file, basic_creds_content)

                    withenv("AWS_PROFILE" => "profile1") do
                        creds = AWSCredentials(; profile="profile2")
                        @test creds.access_key_id == "AKI2"
                    end

                    withenv(
                        "AWS_ACCESS_KEY_ID" => "AKI0",
                        "AWS_SECRET_ACCESS_KEY" => "SAK0",
                        # format trick: using this comment to force use of multiple lines
                    ) do
                        creds = AWSCredentials(; profile="profile2")
                        @test creds.access_key_id == "AKI2"
                    end
                end

                @testset "AWS_ACCESS_KEY_ID preferred over AWS_PROFILE" begin
                    isfile(config_file) && rm(config_file)
                    write(creds_file, basic_creds_content)

                    withenv(
                        "AWS_PROFILE" => "profile1",
                        "AWS_ACCESS_KEY_ID" => "AKI0",
                        "AWS_SECRET_ACCESS_KEY" => "SAK0",
                    ) do
                        creds = AWSCredentials()
                        @test creds.access_key_id == "AKI0"
                    end
                end

                # The AWS CLI used to use `AWS_DEFAULT_PROFILE` to set the AWS profile via the
                # command line but this was deprecated in favor of `AWS_PROFILE`. We'll probably
                # keeps support for this as long as AWS CLI continues to support it.
                # https://github.com/aws/aws-cli/issues/2597
                @testset "AWS_PROFILE preferred over AWS_DEFAULT_PROFILE" begin
                    isfile(config_file) && rm(config_file)
                    write(creds_file, basic_creds_content)

                    withenv(
                        "AWS_DEFAULT_PROFILE" => "profile1",
                        "AWS_PROFILE" => "profile2",
                        # format trick: using this comment to force use of multiple lines
                    ) do
                        creds = AWSCredentials()
                        @test creds.access_key_id == "AKI2"
                    end
                end

                @testset "Web identity preferred over SSO" begin
                    write(
                        config_file,
                        """
                        [default]
                        sso_start_url = https://my-sso-portal.awsapps.com/start
                        sso_role_name = role1
                        """,
                    )
                    isfile(creds_file) && rm(creds_file)

                    web_identity_file = joinpath(dir, "web_identity")
                    write(web_identity_file, "webid")

                    patches = [
                        Patches._assume_role_patch(
                            "AssumeRoleWithWebIdentity";
                            access_key="AKI_WEB",
                            secret_key="SAK_WEB",
                            session_token="TOK_WEB",
                        ),
                        Patches.sso_service_patches("AKI_SSO", "SAK_SSO"),
                        Patches._imds_region_patch(nothing),
                    ]

                    withenv(
                        "AWS_WEB_IDENTITY_TOKEN_FILE" => web_identity_file,
                        "AWS_ROLE_ARN" => "webid",
                    ) do
                        apply(patches) do
                            creds = AWSCredentials()
                            @test creds.access_key_id == "AKI_WEB"
                        end
                    end
                end

                # TODO: Additional, precedence tests should be added for IAM Identity Center
                # once support has been introduced.
                @testset "IAM Identity Center preferred over legacy SSO" begin
                    write(
                        config_file,
                        """
                        [sso-session my-sso]
                        sso_region = us-east-1
                        sso_start_url = https://my-sso-portal.awsapps.com/start

                        [default]
                        sso_session = my-sso
                        sso_start_url = https://my-legacy-sso-portal.awsapps.com/start
                        sso_role_name = role1
                        """,
                    )
                    isfile(creds_file) && rm(creds_file)

                    apply(Patches.sso_service_patches("AKI_SSO", "SAK_SSO")) do
                        @test_throws ErrorException AWSCredentials()
                    end
                end

                @testset "SSO preferred over credentials file" begin
                    write(
                        config_file,
                        """
                        [profile profile1]
                        sso_start_url = https://my-sso-portal.awsapps.com/start
                        sso_role_name = role1
                        """,
                    )
                    write(creds_file, basic_creds_content)

                    apply(Patches.sso_service_patches("AKI_SSO", "SAK_SSO")) do
                        creds = AWSCredentials(; profile="profile1")
                        @test creds.access_key_id == "AKI_SSO"
                    end
                end

                @testset "Credential file over credential_process" begin
                    json = Dict(
                        "Version" => 1,
                        "AccessKeyId" => "AKI0",
                        "SecretAccessKey" => "SAK0",
                        # format trick: using this comment to force use of multiple lines
                    )
                    write(
                        config_file,
                        """
                        [profile profile1]
                        credential_process = echo '$(JSON.json(json))'
                        """,
                    )
                    write(creds_file, basic_creds_content)

                    creds = AWSCredentials(; profile="profile1")
                    @test creds.access_key_id == "AKI1"
                end

                @testset "credential_process over config credentials" begin
                    json = Dict(
                        "Version" => 1,
                        "AccessKeyId" => "AKI0",
                        "SecretAccessKey" => "SAK0",
                        # format trick: using this comment to force use of multiple lines
                    )
                    write(
                        config_file,
                        """
                        [profile profile1]
                        aws_access_key_id = AKI1
                        aws_secret_access_key = SAK1
                        credential_process = echo '$(JSON.json(json))'
                        """,
                    )
                    isfile(creds_file) && rm(creds_file)

                    creds = AWSCredentials(; profile="profile1")
                    @test creds.access_key_id == "AKI0"
                end

                @testset "default config credentials over ECS container credentials ENV variables" begin
                    write(
                        config_file,
                        """
                        [default]
                        aws_access_key_id = AKI1
                        aws_secret_access_key = SAK1
                        """,
                    )
                    isfile(creds_file) && rm(creds_file)

                    withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/get-creds") do
                        apply(http_request_patcher([ecs_metadata])) do
                            @test isnothing(AWS._aws_get_profile(; default=nothing))

                            creds = AWSCredentials()
                            @test creds.access_key_id == "AKI1"
                        end
                    end

                    withenv(
                        "AWS_CONTAINER_CREDENTIALS_FULL_URI" => "http://localhost:8080"
                    ) do
                        apply(http_request_patcher([ecs_metadata_localhost])) do
                            @test isnothing(AWS._aws_get_profile(; default=nothing))

                            creds = AWSCredentials()
                            @test creds.access_key_id == "AKI1"
                        end
                    end
                end

                @testset "default config credentials over EC2 instance credentials" begin
                    write(
                        config_file,
                        """
                        [default]
                        aws_access_key_id = AKI1
                        aws_secret_access_key = SAK1
                        """,
                    )
                    isfile(creds_file) && rm(creds_file)

                    apply(http_request_patcher([ec2_metadata])) do
                        @test isnothing(AWS._aws_get_profile(; default=nothing))

                        creds = AWSCredentials()
                        @test creds.access_key_id == "AKI1"
                    end
                end

                @testset "ECS container credentials ENV variables over EC2 instance credentials" begin
                    isfile(config_file) && rm(config_file)
                    isfile(creds_file) && rm(creds_file)

                    withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/get-creds") do
                        apply(http_request_patcher([ec2_metadata, ecs_metadata])) do
                            creds = AWSCredentials()
                            @test creds.access_key_id == "AKI_ECS"
                        end
                    end

                    withenv(
                        "AWS_CONTAINER_CREDENTIALS_FULL_URI" => "http://localhost:8080"
                    ) do
                        p = http_request_patcher([ec2_metadata, ecs_metadata_localhost])
                        apply(p) do
                            creds = AWSCredentials()
                            @test creds.access_key_id == "AKI_ECS"
                        end
                    end
                end

                # Note: It appears that the ECS container credentials are only used when
                # a `AWS_CONTAINER_*` environmental variable is set. However, this test
                # ensures that if we do add implicit support that the documented precedence
                # order is not violated.
                @testset "EC2 instance credentials over ECS container credentials" begin
                    isfile(config_file) && rm(config_file)
                    isfile(creds_file) && rm(creds_file)

                    apply(http_request_patcher([ec2_metadata, ecs_metadata])) do
                        creds = AWSCredentials()
                        @test creds.access_key_id == "AKI_EC2"
                    end
                end
            end
        end
    end
end

@testset "Retrieving AWS Credentials" begin
    test_values = Dict{String,Any}(
        "Default-Profile" => "default",
        "Test-Profile" => "test",
        "Test-Config-Profile" => "test",
        "AccessKeyId" => "Default-Key",
        "SecretAccessKey" => "Default-Secret",
        "Test-AccessKeyId" => "Test-Key",
        "Test-SecretAccessKey" => "Test-Secret",
        "Token" => "Test-Token",
        "InstanceProfileArn" => "Test-Arn",
        "RoleArn" => "Test-Arn",
        "Expiration" => now(UTC),
        "Security-Credentials" => "Test-Security-Credentials",
        "Test-SSO-Profile" => "sso-test",
        "Test-SSO-start-url" => "https://test-sso.com/start",
        "Test-SSO-Role" => "SSORoleName",
    )

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
                default_profile = dot_aws_config(test_values["Default-Profile"])

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
                [profile $(test_values["Test-Config-Profile"])]
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

    @testset "~/.aws/config - Specified SSO Profile" begin
        mktemp() do config_file, config_io
            write(
                config_io,
                """
                [profile $(test_values["Test-SSO-Profile"])]
                sso_start_url=$(test_values["Test-SSO-start-url"])
                sso_role_name=$(test_values["Test-SSO-Role"])
                """,
            )
            close(config_io)

            withenv("AWS_CONFIG_FILE" => config_file) do
                apply(
                    Patches.sso_service_patches(
                        test_values["AccessKeyId"], test_values["SecretAccessKey"]
                    ),
                ) do
                    specified_result = sso_credentials(test_values["Test-SSO-Profile"])

                    @test specified_result.access_key_id == test_values["AccessKeyId"]
                    @test specified_result.secret_key == test_values["SecretAccessKey"]
                end
            end
        end
    end

    @testset "~/.aws/config - Credential Process" begin
        mktempdir() do dir
            config_file = joinpath(dir, "config")
            credential_process_file = joinpath(dir, "cred_process")
            open(credential_process_file, "w") do io
                println(io, "#!/bin/sh")
                println(io, "cat <<EOF")
                json = Dict(
                    "Version" => 1,
                    "AccessKeyId" => test_values["Test-AccessKeyId"],
                    "SecretAccessKey" => test_values["Test-SecretAccessKey"],
                )
                JSON.print(io, json)
                println(io, "\nEOF")
            end
            chmod(credential_process_file, 0o700)

            withenv("AWS_CONFIG_FILE" => config_file) do
                open(config_file, "w") do io
                    write(
                        io,
                        """
                        [profile $(test_values["Test-Config-Profile"])]
                        credential_process = $(abspath(credential_process_file))
                        """,
                    )
                end

                result = dot_aws_config(test_values["Test-Config-Profile"])

                @test result.access_key_id == test_values["Test-AccessKeyId"]
                @test result.secret_key == test_values["Test-SecretAccessKey"]
                @test isempty(result.token)
                @test result.expiry == typemax(DateTime)
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
                specified_result = dot_aws_credentials(test_values["Default-Profile"])

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

        assume_role_patch = Patches._assume_role_patch(
            "AssumeRole";
            access_key=access_key,
            secret_key=secret_key,
            session_token=session_token,
            role_arn=role_arn,
        )
        ec2_metadata_patch = @patch function HTTP.request(method, url, args...; kwargs...)
            url = string(url)
            security_credentials = test_values["Security-Credentials"]

            metadata_uri = "http://169.254.169.254/latest/meta-data"
            if url == "$metadata_uri/iam/info"
                json = JSON.json("InstanceProfileArn" => test_values["InstanceProfileArn"])
                return HTTP.Response(200, json)
            elseif url == "$metadata_uri/iam/security-credentials/"
                return HTTP.Response(200, security_credentials)
            elseif url == "$metadata_uri/iam/security-credentials/$security_credentials"
                return HTTP.Response(200, JSON.json(test_values))
            else
                return HTTP.Response(404)
            end
        end

        apply([assume_role_patch, ec2_metadata_patch]) do
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
        expiration = floor(now(UTC), Second)
        rel_uri_json = Dict(
            "AccessKeyId" => "AKI_REL_ECS",
            "SecretAccessKey" => "SAK_REL_ECS",
            "Token" => "TOK_REL_ECS",
            "Expiration" => Dates.format(expiration, dateformat"yyyy-mm-dd\THH:MM:SS\Z"),
            "RoleArn" => "ROLE_REL_ECS",
        )

        rel_uri_patch = @patch function HTTP.request(::String, url, headers=[]; kwargs...)
            url = string(url)

            @test url == "http://169.254.170.2/get-credentials"
            @test isempty(headers)

            if url == "http://169.254.170.2/get-credentials"
                return HTTP.Response(200, JSON.json(rel_uri_json))
            else
                return HTTP.Response(404)
            end
        end

        withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/get-credentials") do
            apply(rel_uri_patch) do
                result = ecs_instance_credentials()
                @test result.access_key_id == rel_uri_json["AccessKeyId"]
                @test result.secret_key == rel_uri_json["SecretAccessKey"]
                @test result.token == rel_uri_json["Token"]
                @test result.user_arn == rel_uri_json["RoleArn"]
                @test result.expiry == expiration
                @test result.renew == ecs_instance_credentials
            end
        end

        # When the environmental variable isn't set then the ECS credential provider is
        # unavailable.
        withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => nothing) do
            @test ecs_instance_credentials() === nothing
        end

        # Specifying the environmental variable results in us attempting to connect to the
        # ECS credential provider.
        withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/invalid") do
            # Internally throws a `ConnectError` exception
            @test ecs_instance_credentials() === nothing
        end

        full_uri_json = Dict(
            "AccessKeyId" => "AKI_FULL_ECS",
            "SecretAccessKey" => "SAK_FULL_ECS",
            "Token" => "TOK_FULL_ECS",
            "Expiration" => Dates.format(expiration, dateformat"yyyy-mm-dd\THH:MM:SS\Z"),
            "RoleArn" => "ROLE_FULL_ECS",
        )

        full_uri_patch = @patch function HTTP.request(::String, url, headers=[]; kwargs...)
            url = string(url)
            authorization = http_header(headers, "Authorization")

            @test url == "http://localhost/get-credentials"
            @test authorization == "Basic abcd"

            if url == "http://localhost/get-credentials" && authorization == "Basic abcd"
                return HTTP.Response(200, JSON.json(full_uri_json))
            else
                return HTTP.Response(403)
            end
        end

        withenv(
            "AWS_CONTAINER_CREDENTIALS_FULL_URI" => "http://localhost/get-credentials",
            "AWS_CONTAINER_AUTHORIZATION_TOKEN" => "Basic abcd",
        ) do
            apply(full_uri_patch) do
                result = ecs_instance_credentials()
                @test result.access_key_id == full_uri_json["AccessKeyId"]
                @test result.secret_key == full_uri_json["SecretAccessKey"]
                @test result.token == full_uri_json["Token"]
                @test result.user_arn == full_uri_json["RoleArn"]
                @test result.expiry == expiration
                @test result.renew == ecs_instance_credentials
            end
        end

        # `AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` should be preferred over
        # `AWS_CONTAINER_CREDENTIALS_FULL_URI`.
        withenv(
            "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => "/get-credentials",
            "AWS_CONTAINER_CREDENTIALS_FULL_URI" => "http://localhost/get-credentials",
        ) do
            apply(rel_uri_patch) do
                result = ecs_instance_credentials()
                @test result.access_key_id == rel_uri_json["AccessKeyId"]
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

    @testset "Credential Process" begin
        gen_process(json) = Cmd(["echo", JSON.json(json)])

        long_term_resp = Dict(
            "Version" => 1,
            "AccessKeyId" => "access-key",
            "SecretAccessKey" => "secret-key",
            # format trick: using this comment to force use of multiple lines
        )
        creds = external_process_credentials(gen_process(long_term_resp))
        @test creds.access_key_id == long_term_resp["AccessKeyId"]
        @test creds.secret_key == long_term_resp["SecretAccessKey"]
        @test isempty(creds.token)
        @test creds.expiry == typemax(DateTime)

        expiration = floor(now(UTC), Second)
        temporary_resp = Dict(
            "Version" => 1,
            "AccessKeyId" => "access-key",
            "SecretAccessKey" => "secret-key",
            "SessionToken" => "session-token",
            "Expiration" => Dates.format(expiration, EXPIRATION_FMT),
        )
        creds = external_process_credentials(gen_process(temporary_resp))
        @test creds.access_key_id == temporary_resp["AccessKeyId"]
        @test creds.secret_key == temporary_resp["SecretAccessKey"]
        @test creds.token == temporary_resp["SessionToken"]
        @test creds.expiry == expiration

        unhandled_version_resp = Dict("Version" => 2)
        json = sprint(JSON.print, unhandled_version_resp, 2)
        ex = ErrorException("Credential process returned unhandled version 2:\n$json")
        @test_throws ex external_process_credentials(gen_process(unhandled_version_resp))

        missing_token_resp = Dict(
            "Version" => 1,
            "AccessKeyId" => "access-key",
            "SecretAccessKey" => "secret-key",
            "Expiration" => Dates.format(expiration, EXPIRATION_FMT),
        )
        ex = KeyError("SessionToken")
        @test_throws ex external_process_credentials(gen_process(missing_token_resp))

        missing_expiration_resp = Dict(
            "Version" => 1,
            "AccessKeyId" => "access-key",
            "SecretAccessKey" => "secret-key",
            "SessionToken" => "session-token",
        )
        ex = KeyError("Expiration")
        @test_throws ex external_process_credentials(gen_process(missing_expiration_resp))
    end

    @testset "Credentials Not Found" begin
        patches = [
            @patch function HTTP.request(method::String, url, args...; kwargs...)
                throw(HTTP.Exceptions.ConnectError(string(url), "host is unreachable"))
            end
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

        @testset "environmental variable (DEFAULT)" begin
            withenv("AWS_REGION" => nothing, "AWS_DEFAULT_REGION" => "us-gov-east-1") do
                @test aws_get_region(; config=ini, profile="default") == "us-gov-east-1"
                @test aws_get_region() == "us-gov-east-1"
            end
        end

        @testset "environmental variable" begin
            withenv("AWS_DEFAULT_REGION" => "us-gov-east-1") do
                @test aws_get_region(; config=ini, profile="default") == "us-gov-east-1"
                @test aws_get_region() == "us-gov-east-1"
            end
        end

        @testset "environmental variable (AWS_REGION)" begin
             withenv("AWS_REGION" => "eu-west-1", "AWS_DEFAULT_REGION" => nothing) do
                 @test aws_get_region(; config=ini, profile="default") == "eu-west-1"
                 @test aws_get_region() == "eu-west-1"
             end

             withenv("AWS_REGION" => "eu-west-1", "AWS_DEFAULT_REGION" => "us-gov-east-1") do
                 @test aws_get_region(; config=ini, profile="default") == "eu-west-1"
                 @test aws_get_region() == "eu-west-1"
             end
         end

        @testset "default profile" begin
            withenv("AWS_REGION" => nothing, "AWS_DEFAULT_REGION" => nothing) do
                @test aws_get_region(; config=ini, profile="default") == "us-west-2"
                @test aws_get_region(; config=config_file, profile="default") == "us-west-2"
            end

            withenv(
                "AWS_REGION" => nothing, # Ensure not set
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
                apply(Patches._imds_region_patch(nothing)) do
                    @test aws_get_region(; config=ini, profile="unknown") ==
                        AWS.DEFAULT_REGION
                    @test aws_get_region(; config=config_file, profile="unknown") ==
                        AWS.DEFAULT_REGION
                end
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => "unknown",
            ) do
                apply(Patches._imds_region_patch(nothing)) do
                    @test aws_get_region() == AWS.DEFAULT_REGION
                end
            end
        end

        @testset "default keyword" begin
            default = nothing
            withenv("AWS_DEFAULT_REGION" => nothing) do
                apply(Patches._imds_region_patch(nothing)) do
                    @test aws_get_region(; config=ini, profile="unknown", default) ===
                        default
                    @test aws_get_region(;
                        config=config_file, profile="unknown", default
                    ) === default
                end
            end

            withenv(
                "AWS_DEFAULT_REGION" => nothing,
                "AWS_CONFIG_FILE" => config_file,
                "AWS_PROFILE" => "unknown",
            ) do
                apply(Patches._imds_region_patch(nothing)) do
                    @test aws_get_region(; default=default) === default
                end
            end
        end

        @testset "no such config file" begin
            withenv("AWS_DEFAULT_REGION" => nothing, "AWS_CONFIG_FILE" => tempname()) do
                apply(Patches._imds_region_patch(nothing)) do
                    @test aws_get_region() == AWS.DEFAULT_REGION
                end
            end
        end

        @testset "instance profile" begin
            withenv("AWS_DEFAULT_REGION" => nothing, "AWS_CONFIG_FILE" => tempname()) do
                apply(Patches._imds_region_patch("ap-atlantis-1")) do
                    @test aws_get_region() == "ap-atlantis-1"
                end
            end
        end
    end
end
