@testset "@service" begin
    @testset "ID only" begin
        #! format: off
        @eval baremodule __service_id_only
            using AWS: @service
            @service STS
        end
        #! format: on

        @test :STS in names(__service_id_only; all=true)
        @test __service_id_only.STS isa Module
    end

    @testset "non-existent service" begin
        #! format: off
        @eval module __service_non_existent_service
            using AWS: @service
            const ex = try
                @service x
            catch e
                e
            end
        end
        #! format: on

        @test __service_non_existent_service.ex isa SystemError
        @test :x in names(__service_non_existent_service; all=true)
    end

    @testset "returns module" begin
        #! format: off
        @eval baremodule __service_returns_module
            using AWS: @service
            const M = @service STS
        end
        #! format: on

        @test :STS in names(__service_returns_module; all=true)
        @test :M in names(__service_returns_module; all=true)
        @test nameof(__service_returns_module.M) === :STS
        @test __service_returns_module.M isa Module
        @test __service_returns_module.M === __service_returns_module.STS
    end

    @testset "case-insensitive" begin
        #! format: off
        @eval module __service_case_insenstive
            using AWS: @service
            @service Secrets_Manager
            @service SECRETS_MANAGER
            @service sECRETS_MANAGER
        end
        #! format: on

        @test :Secrets_Manager in names(__service_case_insenstive; all=true)
        @test :SECRETS_MANAGER in names(__service_case_insenstive; all=true)
        @test :sECRETS_MANAGER in names(__service_case_insenstive; all=true)

        @test __service_case_insenstive.Secrets_Manager !==
            __service_case_insenstive.SECRETS_MANAGER
        @test __service_case_insenstive.Secrets_Manager !==
            __service_case_insenstive.sECRETS_MANAGER
        @test __service_case_insenstive.SECRETS_MANAGER !==
            __service_case_insenstive.sECRETS_MANAGER
    end

    # The lowercase service ID conflicts with the low-level API binding name
    # (e.g. `using AWS.AWSServices: sts`)
    @testset "lowercase" begin
        # Produces this warning:
        # WARNING: import of AWSServices.sts into sts conflicts with an existing identifier; ignored
        #! format: off
        @eval module __service_lowercase
            using AWS: @service
            @service sts
        end
        #! format: on

        @test :sts in names(__service_lowercase; all=true)
        @test __service_lowercase.sts isa Module
        @test_broken __service_lowercase.sts.sts isa AWS.Service
    end

    @testset "as" begin
        #! format: off
        @eval module __service_as
            using AWS: @service
            @service STS as SecurityTokenService
        end
        #! format: on

        @test nameof(__service_as.SecurityTokenService) === :SecurityTokenService
        @test __service_as.SecurityTokenService isa Module
        @test !(:STS in names(__service_as))
    end

    # These uses of the `@service` macro should not create a module
    @testset "invalid syntax" begin
        ex = VERSION >= v"1.7" ? MethodError : LoadError
        @test_throws ex @macroexpand @service()

        # Service ID is an expression
        ex = VERSION >= v"1.7" ? ArgumentError : LoadError
        @test_throws ex @macroexpand @service STS.X
        @test !(Symbol("STS.X") in names(@__MODULE__; all=true))

        # Module name is an expression
        ex = VERSION >= v"1.7" ? ArgumentError : LoadError
        @test_throws ex @macroexpand @service STS as STS.X
        @test !(:STS in names(@__MODULE__; all=true))
        @test !(Symbol("STS.X") in names(@__MODULE__; all=true))
    end

    @testset "module redefinition" begin
        #! format: off
        @eval baremodule __service_module_redefinition
            using AWS, Test
            @service S3 use_response_type = true
            features = S3.SERVICE_FEATURE_SET
            @service S3
            @test features === S3.SERVICE_FEATURE_SET  # ensures module wasn't replaced
        end
        #! format: on
    end
end
