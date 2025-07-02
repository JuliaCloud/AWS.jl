@testset "_aws_profile_config" begin
    using AWS: _aws_profile_config

    @testset "non-recursive" begin
        #! format: off
        buffer = IOBuffer(
            """
            [profile test]
            output = json
            region = us-east-1

            [profile test:dev]
            source_profile = test
            role_arn = arn:aws:iam::123456789000:role/Dev
            """
        )
        #! format: on
        ini = Inifile()
        read(ini, buffer)

        # Only the fields from profile "test"
        config = _aws_profile_config(ini, "test")
        @test keys(config) ⊆ Set(["output", "region"])
        @test config["output"] == "json"
        @test config["region"] == "us-east-1"

        # Only the fields from profile "test:dev"
        config = _aws_profile_config(ini, "test:dev")
        @test keys(config) ⊆ Set(["source_profile", "role_arn"])
        @test config["source_profile"] == "test"
        @test config["role_arn"] == "arn:aws:iam::123456789000:role/Dev"
    end

    @testset "recursive" begin
        #! format: off
        buffer = IOBuffer(
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
            """
        )
        #! format: on
        ini = Inifile()
        read(ini, buffer)

        # Only the fields from profile "test"
        config = _aws_profile_config(ini, "test"; recursive=true)
        @test keys(config) ⊆ Set(["output", "region"])
        @test config["output"] == "json"
        @test config["region"] == "us-east-1"

        # Combine the profile "test:dev" section with fields from profile "test"
        config = _aws_profile_config(ini, "test:dev"; recursive=true)
        @test keys(config) ⊆ Set(["output", "region", "role_arn"])
        @test config["output"] == "json"
        @test config["region"] == "us-east-1"
        @test config["role_arn"] == "arn:aws:iam::123456789000:role/Dev"

        # Ensure we haven't mutated the contents of the `ini`
        section = sections(ini)["profile test:dev"]
        @test !haskey(section, "region")
        @test !haskey(section, "output")

        # Conflicting keys should use the first defined entry
        config = _aws_profile_config(ini, "test:sub-dev"; recursive=true)
        @test keys(config) ⊆ Set(["output", "region", "role_arn"])
        @test config["output"] == "json"
        @test config["region"] == "us-east-1"
        @test config["role_arn"] == "arn:aws:iam::123456789000:role/SubDev"

        # Ensure we haven't mutated the contents of the `ini`
        section = sections(ini)["profile test:sub-dev"]
        @test !haskey(section, "region")
        @test !haskey(section, "output")
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
