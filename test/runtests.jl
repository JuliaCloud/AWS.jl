using AWS
using AWS: AWSCredentials
using AWS: AWSServices
using AWS.AWSExceptions: AWSException, NoCredentials
using AWS.AWSMetadataUtilities: _clean_documentation, _filter_latest_service_version,
    _generate_low_level_definition, _generate_high_level_definition, _generate_high_level_definitions,
    _get_aws_sdk_js_files, _get_service_and_version, _get_function_parameters, _clean_uri, _format_name,
    _splitline, _wraplines, _validindex, InvalidFileName, ProtocolNotDefined
using Base64
using Compat: mergewith
using Dates
using GitHub
using HTTP
using JSON
using OrderedCollections: LittleDict, OrderedDict
using MbedTLS: digest, MD_SHA256, MD_MD5
using Mocking
using Pkg
using Retry
using Suppressor
using Test
using UUIDs
using XMLDict

Mocking.activate()

include("patch.jl")

aws = AWSConfig()

function _now_formatted()
    return lowercase(Dates.format(now(Dates.UTC), dateformat"yyyymmdd\THHMMSSsss\Z"))
end

@testset "AWS.jl" begin
    include("AWS.jl")
    include("AWSCredentials.jl")
    include("AWSExceptions.jl")
    include("AWSMetadataUtilities.jl")
    include("issues.jl")
    include("test_pkg.jl")
    include("utilities.jl")

    if haskey(ENV, "TEST_MINIO")
        include("minio.jl")
    end
end
