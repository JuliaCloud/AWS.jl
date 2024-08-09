const TOP_LEVEL_STUFF = quote
    using AWS
    using AWS: AWSCredentials, AWSServices, assume_role_creds
    using AWS.AWSExceptions:
        AWSException,
        IMDSUnavailable,
        InvalidFileName,
        NoCredentials,
        ProtocolNotDefined
    using AWS.AWSMetadata:
        ServiceFile,
        _clean_documentation,
        _filter_latest_service_version,
        _generate_low_level_definition,
        _generate_high_level_definition,
        _generate_high_level_definitions,
        _get_service_files,
        _get_service_and_version,
        _get_function_parameters,
        _clean_uri,
        _format_name,
        _splitline,
        _wraplines,
        _validindex
    using Base64
    using Compat: mergewith
    using Dates
    using Downloads
    using GitHub
    using HTTP
    using IniFile: Inifile
    using JSON
    using OrderedCollections: LittleDict, OrderedDict
    using MbedTLS: digest, MD_SHA256, MD_MD5
    using Mocking
    using Pkg
    using Random
    using Suppressor
    using Test
    using UUIDs
    using XMLDict
    using StableRNGs

    Mocking.activate()

    Base.include(@__MODULE__, "patch.jl")
    Base.include(@__MODULE__, "resources/totp.jl")

    const _NOW_FMT = DateFormat("yyyymmdd\\THHMMSSsss\\Z")

    function _now_formatted()
        return lowercase(Dates.format(now(Dates.UTC), _NOW_FMT))
    end

    testset_role(role_name) = string("AWS.jl-", role_name)
end
eval(TOP_LEVEL_STUFF)  # ensure things are loaded/defined in Main

const TEST_MINIO = begin
    all(k -> haskey(ENV, k), ("MINIO_ACCESS_KEY", "MINIO_SECRET_KEY", "MINIO_REGION_NAME"))
end

aws = AWSConfig()

@testset "AWS.jl" begin
    include("AWSExceptions.jl")
    include("AWSMetadataUtilities.jl")
    include("test_pkg.jl")
    include("utilities.jl")
    include("AWSConfig.jl")

    backends = [AWS.HTTPBackend, AWS.DownloadsBackend]
    @testset "Backend: $(nameof(backend))" for backend in backends
        AWS.DEFAULT_BACKEND[] = backend()
        M = Module(Symbol(:Test, nameof(backend)))
        Core.eval(M, TOP_LEVEL_STUFF)  # ensure things are loaded/defined in this module too
        Core.eval(M, :(using ..Main: aws))
        Base.include(M, "AWS.jl")
        Base.include(M, "IMDS.jl")
        Base.include(M, "AWSCredentials.jl")
        Base.include(M, "role.jl")
        Base.include(M, "issues.jl")

        if TEST_MINIO
            Base.include(M, "minio.jl")
        end
    end
end
