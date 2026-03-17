using APIGeneration:
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
using Test

@testset "AWS.jl codegen" begin
    include("APIGenerationUtilities.jl")
end
