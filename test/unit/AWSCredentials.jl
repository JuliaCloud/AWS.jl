@testset "_aws_profile_config" begin
    using AWS: _aws_profile_config

    @testset "access" begin
        #! format: off
        buffer = IOBuffer(
            """
            [profile A]
            output = json
            region = us-east-1

            [profile B]
            role_arn = arn:aws:iam::123456789000:role/A
            source_profile = A
            """
        )
        #! format: on
        ini = Inifile()
        read(ini, buffer)

        # Retrieve fields from profile "A"
        config = _aws_profile_config(ini, "A")
        @test keys(config) ⊆ Set(["output", "region"])
        @test config["output"] == "json"
        @test config["region"] == "us-east-1"

        # Ensure that mutating the returned dictionary does not mutated the contents of the
        # `ini`
        config["output"] = "yaml-stream"
        section = sections(ini)["profile A"]
        @test section["output"] == "json"

        # Use of `source_profile` does not inherit properties from the source. This mirrors
        # the AWS CLI (version v2.27.15) behavior for `region` which can be seen using
        # `aws configure list --profile X`
        config = _aws_profile_config(ini, "B")
        @test keys(config) ⊆ Set(["role_arn", "source_profile"])
        @test config["role_arn"] == "arn:aws:iam::123456789000:role/A"
        @test config["source_profile"] == "A"
    end

    # AWS CLI (version v2.27.15) will use "profile default" over "default" when both are
    # defined within the configuration. This is true when `AWS_PROFILE` is unset or
    # `AWS_PROFILE="default".
    @testset "default profile" begin
        #! format: off
        buffer = IOBuffer(
            """
            [default]
            region = default-1

            [profile default]
            region = default-2
            """
        )
        #! format: on
        ini = Inifile()
        read(ini, buffer)

        config = _aws_profile_config(ini, "default")
        @test config["region"] == "default-2"
    end
end
