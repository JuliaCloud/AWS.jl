using AWS
using AWS: AWSCredentials
using AWS: AWSServices
using AWS.AWSExceptions: AWSException, InvalidFileName, NoCredentials, ProtocolNotDefined
using AWS.AWSMetadata:
    _clean_documentation,
    _filter_latest_service_version,
    _generate_low_level_definition,
    _generate_high_level_definition,
    _generate_high_level_definitions,
    _get_aws_sdk_js_files,
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
using Downloads: Downloads
using GitHub
using HTTP
using IniFile: Inifile
using JSON
using OrderedCollections: LittleDict, OrderedDict
using MbedTLS: digest, MD_SHA256, MD_MD5
using Mocking
using Pkg
using Random
using Retry
using Suppressor
using Test
using UUIDs
using XMLDict

Mocking.activate()

include("patch.jl")

const TEST_MINIO = begin
    all(k -> haskey(ENV, k), ("MINIO_ACCESS_KEY", "MINIO_SECRET_KEY", "MINIO_REGION_NAME"))
end

aws = AWSConfig()

function _now_formatted()
    return lowercase(Dates.format(now(Dates.UTC), dateformat"yyyymmdd\THHMMSSsss\Z"))
end

@testset "AWS.jl" begin
    include("AWSExceptions.jl")
    include("AWSMetadataUtilities.jl")
    include("test_pkg.jl")
    include("utilities.jl")
    include("AWSConfig.jl")

    backends = [AWS.HTTPBackend, AWS.DownloadsBackend]
    @testset "Backend: $(nameof(backend))" for backend in backends
        AWS.DEFAULT_BACKEND[] = backend()
        include("AWS.jl")
        include("AWSCredentials.jl")
        include("issues.jl")

        if TEST_MINIO
            include("minio.jl")
        end
    end
end
