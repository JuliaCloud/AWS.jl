using AWS
using AWSCore
using AWSCore: Services
using AWS: AWSCredentials
using AWS.AWSMetadataUtilities: _documentation_cleaning, _filter_latest_service_version,
    _generate_low_level_definition, _generate_high_level_definition, _generate_high_level_definitions,
    _get_aws_sdk_js_files, _get_service_and_version, _get_function_parameters,
    InvalidFileName, ProtocolNotDefined
using Dates
using HTTP
using JSON
using OrderedCollections: OrderedDict
using Mocking
using Retry
using Test

Mocking.activate()
aws = aws_config()

include("AWS.jl")
include("AWSCredentials.jl")
include("AWSMetadataUtilities.jl")
