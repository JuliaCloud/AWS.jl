using AWS
using AWS.AWSMetadataUtilities: _documentation_cleaning, _filter_latest_service_version,
    _generate_low_level_definition, _generate_high_level_definition, _generate_high_level_definitions,
    _get_aws_sdk_js_files, _get_service_and_version, _get_function_parameters,
    InvalidFileName, ProtocolNotDefined
using JSON
using OrderedCollections: OrderedDict
using Test

include("AWS.jl")
include("AWSMetadataUtilities.jl")
