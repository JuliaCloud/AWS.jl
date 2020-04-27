macro test_ecode(error_codes, expr)
    quote
        try
            $expr
            @test false
        catch e
            if e isa AWSException
                @test ecode(e) in [$error_codes;]
            else
                rethrow(e)
            end
        end
    end
end

@testset "Load Credentials" begin
    user = AWS.aws_user_arn(aws)  # TODO: Remove qualification when dep on AWSCore is removed
    @test occursin(r"^arn:aws:(iam|sts)::[0-9]+:[^:]+$", user)
    aws[:region] = "us-east-1"

    @test_ecode(
        "InvalidAction",
        AWSCore.Services.iam("GetFoo", Dict("ContentType" => "JSON"))
    )

    @test_ecode(
        ["AccessDenied", "NoSuchEntity"],
        AWSCore.Services.iam("GetUser", Dict("UserName" => "notauser", "ContentType" => "JSON"))
    )

    @test_ecode(
        "ValidationError",
        AWSCore.Services.iam("GetUser", Dict("UserName" => "@#!%%!", "ContentType" => "JSON"))
    )

    @test_ecode(
        ["AccessDenied", "EntityAlreadyExists"],
        AWSCore.Services.iam("CreateUser", Dict("UserName" => "root", "ContentType" => "JSON"))
    )
end

@testset "NoAuth" begin
    pub_request1 = Dict{Symbol, Any}(
        :service => "s3",
        :headers => Dict{String, String}("Range" => "bytes=0-0"),
        :content => "",
        :resource => "/invenia-static-website-content/invenia_ca/index.html",
        :url => "https://s3.us-east-1.amazonaws.com/invenia-static-website-content/invenia_ca/index.html",
        :verb => "GET",
        :region => "us-east-1",
        :creds => nothing,
    )
    pub_request2 = Dict{Symbol, Any}(
        :service => "s3",
        :headers => Dict{String, String}("Range" => "bytes=0-0"),
        :content => "",
        :resource => "ryft-public-sample-data/AWS-x86-AMI-queries.json",
        :url => "https://s3.amazonaws.com/ryft-public-sample-data/AWS-x86-AMI-queries.json",
        :verb => "GET",
        :region => "us-east-1",
        :creds => nothing,
    )

    try
        response = AWSCore.do_request(pub_request1)
        @test response == "<"
    catch e
        @test_ecode(
            ["AccessDenied", "NoSuchEntity"],
            AWSCore.do_request(pub_request1)
        )
    end

    try
        response = AWSCore.do_request(pub_request2)
        @test response == UInt8['[']
    catch e
        @test_ecode(
            ["AccessDenied", "NoSuchEntity"],
            AWSCore.do_request(pub_request2)
        )
    end
end

@testset "AWSCredentials" begin
    @testset "Defaults" begin
        creds = AWS.AWSCredentials("access_key_id" ,"secret_key")
        @test creds.token == ""
        @test creds.user_arn == ""
        @test creds.account_number == ""
        @test creds.expiry == typemax(DateTime)
        @test creds.renew == nothing
    end

    @testset "Renewal" begin
        # Credentials shouldn't throw an error if no renew function is supplied
        creds = AWS.AWSCredentials("access_key_id", "secret_key", renew=nothing)
        # TODO: Remove qualification when dep on AWSCore is removed
        newcreds = AWS.check_credentials(creds, force_refresh = true)

        # Creds should remain unchanged if no renew function exists
        @test creds === newcreds
        @test creds.access_key_id == "access_key_id"
        @test creds.secret_key == "secret_key"
        @test creds.renew == nothing

        # Creds should error if the renew function returns nothing
        creds = AWS.AWSCredentials("access_key_id", "secret_key", renew = () -> nothing)
        # TODO: Remove qualification when dep on AWSCore is removed
        @test_throws ErrorException AWS.check_credentials(creds, force_refresh=true)

        # Creds should remain unchanged
        @test creds.access_key_id == "access_key_id"
        @test creds.secret_key == "secret_key"

        # Creds should take on value of a returned AWSCredentials except renew function
        function gen_credentials()
            i = 0
            () -> (i += 1; AWSCredentials("NEW_ID_$i", "NEW_KEY_$i"))
        end

        creds = AWS.AWSCredentials(
            "access_key_id",
            "secret_key",
            renew=gen_credentials(),
            expiry=now(UTC),
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
        # TODO: Remove qualification when dep on AWSCore is removed
        newcreds = AWS.check_credentials(creds, force_refresh=false)
        @test creds === newcreds
        @test creds.access_key_id == "NEW_ID_2"
        @test creds.secret_key == "NEW_KEY_2"
        @test creds.renew !== nothing
        @test creds.renew === renew
        @test creds.expiry == typemax(DateTime)
        @test !AWS._will_expire(creds)

        # Check renewal doesn't happen if not forced or timed out
        # TODO: Remove qualification when dep on AWSCore is removed
        newcreds = AWS.check_credentials(creds, force_refresh=false)
        @test creds === newcreds
        @test creds.access_key_id == "NEW_ID_2"
        @test creds.secret_key == "NEW_KEY_2"
        @test creds.renew !== nothing
        @test creds.renew === renew
        @test creds.expiry == typemax(DateTime)

        # Check forced renewal works
        # TODO: Remove qualification when dep on AWSCore is removed
        newcreds = AWS.check_credentials(creds, force_refresh=true)
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
            """
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
            """
        )

        withenv(
            "AWS_SHARED_CREDENTIALS_FILE" => creds_file,
            "AWS_CONFIG_FILE" => config_file,
            "AWS_DEFAULT_PROFILE" => "test",
            "AWS_ACCESS_KEY_ID" => nothing
        ) do

            @testset "Loading" begin
                # Check credentials load
                config = aws_config()
                creds = config[:creds]

                # TODO: Resolve test after AWSConfig is rewritten
                @test_broken creds isa AWS.AWSCredentials

                @test creds.access_key_id == "TEST_ACCESS_ID"
                @test creds.secret_key == "TEST_ACCESS_KEY"
                @test creds.renew !== nothing

                # Check credential file takes precedence over config
                ENV["AWS_DEFAULT_PROFILE"] = "test2"
                config = aws_config()
                creds = config[:creds]

                @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                @test creds.secret_key == "RIGHT_ACCESS_KEY2"

                # Check credentials take precedence over role
                ENV["AWS_DEFAULT_PROFILE"] = "test3"
                config = aws_config()
                creds = config[:creds]

                @test creds.access_key_id == "RIGHT_ACCESS_ID3"
                @test creds.secret_key == "RIGHT_ACCESS_KEY3"

                ENV["AWS_DEFAULT_PROFILE"] = "test4"
                config = aws_config()
                creds = config[:creds]

                @test creds.access_key_id == "RIGHT_ACCESS_ID4"
                @test creds.secret_key == "RIGHT_ACCESS_KEY4"

            end

            @testset "Refresh" begin
                ENV["AWS_DEFAULT_PROFILE"] = "test"
                # Check credentials refresh on timeout
                config = aws_config()
                creds = config[:creds]
                creds.access_key_id = "EXPIRED_ACCESS_ID"
                creds.secret_key = "EXPIRED_ACCESS_KEY"
                creds.expiry = now(UTC)

                @test creds.renew !== nothing
                renew = creds.renew

                # TODO: Resolve test after AWSConfig is rewritten
                @test_broken renew() isa AWS.AWSCredentials

                # TODO: Remove qualification when dep on AWSCore is removed
                creds = AWSCore.check_credentials(config[:creds])

                @test creds.access_key_id == "TEST_ACCESS_ID"
                @test creds.secret_key == "TEST_ACCESS_KEY"
                @test creds.expiry > now(UTC)

                # Check renew function remains unchanged
                @test creds.renew !== nothing
                @test creds.renew === renew

                # Check force_refresh
                creds.access_key_id = "WRONG_ACCESS_KEY"
                # TODO: Remove qualification when dep on AWSCore is removed
                creds = AWSCore.check_credentials(creds, force_refresh = true)
                @test creds.access_key_id == "TEST_ACCESS_ID"
            end

            @testset "Profile" begin
                # Check profile kwarg
                ENV["AWS_DEFAULT_PROFILE"] = "test"
                creds = AWS.AWSCredentials(profile="test2")
                @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                @test creds.secret_key == "RIGHT_ACCESS_KEY2"

                config = aws_config(profile="test2")
                creds = config[:creds]
                @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                @test creds.secret_key == "RIGHT_ACCESS_KEY2"

                # Check profile persists on renewal
                creds.access_key_id = "WRONG_ACCESS_ID2"
                creds.secret_key = "WRONG_ACCESS_KEY2"
                # TODO: Remove qualification when dep on AWSCore is removed
                creds = AWSCore.check_credentials(creds, force_refresh=true)

                @test creds.access_key_id == "RIGHT_ACCESS_ID2"
                @test creds.secret_key == "RIGHT_ACCESS_KEY2"
            end

            @testset "Assume Role" begin
                # Check we try to assume a role
                ENV["AWS_DEFAULT_PROFILE"] = "test:dev"

                @test_ecode(
                    "InvalidClientTokenId",
                    aws_config()
                )

                # Check we try to assume a role
                ENV["AWS_DEFAULT_PROFILE"] = "test:sub-dev"
                let oldout = stdout
                    r,w = redirect_stdout()

                    @test_ecode(
                        "InvalidClientTokenId",
                        aws_config()
                    )
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
    test_values = Dict{String, Any}(
        "Default-Profile" => "default",
        "Test-Profile" => "test",
        "Test-Config-Profile" => "profile test",

        # Default profile values, needs to match due to AWSCredentials.jl:239
        "AccessKeyId" => "Default-Key",
        "SecretAccessKey" => "Default-Secret",

        "Test-AccessKeyId" => "Test-Key",
        "Test-SecretAccessKey" => "Test-Secret",

        "Token" => "Test-Token",
        "InstanceProfileArn" => "Test-Arn",
        "RoleArn" => "Test-Arn",
        "Expiration" => now(),

        "URI" => "/Test-URI/",
        "Security-Credentials" => "Test-Security-Credentials"
    )

    http_get_patch = @patch function http_get(url::String)
        security_credentials = test_values["Security-Credentials"]
        uri = test_values["URI"]

        if url == "http://169.254.169.254/latest/meta-data/iam/info"
            instance_profile_arn = test_values["InstanceProfileArn"]
            return  HTTP.Response("{\"InstanceProfileArn\": \"$instance_profile_arn\"}")
        elseif url == "http://169.254.169.254/latest/meta-data/iam/security-credentials/"
            return  HTTP.Response(test_values["Security-Credentials"])
        elseif url == "http://169.254.169.254/latest/meta-data/iam/security-credentials/$security_credentials" || url == "http://169.254.170.2$uri"
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
                """
            )
            close(config_io)

            withenv("AWS_CONFIG_FILE" => config_file) do
                # TODO: Remove qualification when dep on AWSCore is removed
                default_profile = AWS.dot_aws_config()

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
                """
            )
            close(config_io)

            withenv("AWS_CONFIG_FILE" => config_file) do
                # TODO: Remove qualification when dep on AWSCore is removed
                specified_result = AWS.dot_aws_config(test_values["Test-Profile"])

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
                """
            )
            close(creds_io)

            withenv("AWS_SHARED_CREDENTIALS_FILE" => creds_file) do
                # TODO: Remove qualification when dep on AWSCore is removed
                specified_result = AWS.dot_aws_credentials()

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
                """
            )
            close(creds_io)

            withenv("AWS_SHARED_CREDENTIALS_FILE" => creds_file) do
                # TODO: Remove qualification when dep on AWSCore is removed
                specified_result = AWS.dot_aws_credentials(test_values["Test-Profile"])

                @test specified_result.access_key_id == test_values["Test-AccessKeyId"]
                @test specified_result.secret_key == test_values["Test-SecretAccessKey"]
            end
        end
    end

    @testset "Environment Variables" begin
        withenv(
            "AWS_ACCESS_KEY_ID" => test_values["AccessKeyId"],
            "AWS_SECRET_ACCESS_KEY" => test_values["SecretAccessKey"]
        ) do
            # TODO: Remove qualification when dep on AWSCore is removed
            aws_creds = AWS.env_var_credentials()
            @test aws_creds.access_key_id == test_values["AccessKeyId"]
            @test aws_creds.secret_key == test_values["SecretAccessKey"]
        end
    end

    @testset "Instance - EC2" begin
        apply([http_get_patch]) do
            # TODO: Remove qualification when dep on AWSCore is removed
            result = AWS.ec2_instance_credentials()
            @test result.access_key_id == test_values["AccessKeyId"]
            @test result.secret_key == test_values["SecretAccessKey"]
            @test result.token == test_values["Token"]
            @test result.user_arn == test_values["InstanceProfileArn"]
            @test result.expiry == test_values["Expiration"]
            # TODO: Remove qualification when dep on AWSCore is removed
            @test result.renew == AWS.ec2_instance_credentials
        end
    end

    @testset "Instance - ECS" begin
        withenv("AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => test_values["URI"]) do
            apply([http_get_patch]) do
                # TODO: Remove qualification when dep on AWSCore is removed
                result = AWS.ecs_instance_credentials()
                @test result.access_key_id == test_values["AccessKeyId"]
                @test result.secret_key == test_values["SecretAccessKey"]
                @test result.token == test_values["Token"]
                @test result.user_arn == test_values["RoleArn"]
                @test result.expiry == test_values["Expiration"]
                # TODO: Remove qualification when dep on AWSCore is removed
                @test result.renew == AWS.ecs_instance_credentials
            end
        end
    end

    @testset "Helper functions" begin
        @testset "Check Credentials - EnvVars" begin
            withenv(
                "AWS_ACCESS_KEY_ID" => test_values["AccessKeyId"],
                "AWS_SECRET_ACCESS_KEY" => test_values["SecretAccessKey"]
            ) do
                testAWSCredentials = AWS.AWSCredentials(
                    test_values["AccessKeyId"],
                    test_values["SecretAccessKey"],
                    expiry=Dates.now() - Minute(10),
                    # TODO: Remove qualification when dep on AWSCore is removed
                    renew=AWS.env_var_credentials
                )

                # TODO: Remove qualification when dep on AWSCore is removed
                result = AWS.check_credentials(testAWSCredentials, force_refresh=true)
                @test result.access_key_id == testAWSCredentials.access_key_id
                @test result.secret_key == testAWSCredentials.secret_key
                @test result.expiry == typemax(DateTime)
                @test result.renew == testAWSCredentials.renew
            end
        end
    end
end
