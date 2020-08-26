using AWS
using AWS: AWSCredentials
using AWS: AWSServices
using AWS.AWSExceptions: AWSException
using AWS.AWSMetadataUtilities: _clean_documentation, _filter_latest_service_version,
    _generate_low_level_definition, _generate_high_level_definition, _generate_high_level_definitions,
    _get_aws_sdk_js_files, _get_service_and_version, _get_function_parameters, _clean_uri,
    InvalidFileName, ProtocolNotDefined
using Base64
using Compat: mergewith
using Dates
using HTTP
using JSON
using OrderedCollections: LittleDict, OrderedDict
using MbedTLS: digest, MD_SHA256, MD_MD5
using Mocking
using Retry
using Test
using UUIDs
using XMLDict

Mocking.activate()

include("patch.jl")

aws = AWSConfig()

@testset "AWS.jl" begin
    include("utilities.jl")
    include("AWS.jl")
    include("AWSCredentials.jl")
    include("AWSExceptions.jl")
    include("AWSMetadataUtilities.jl")
end
