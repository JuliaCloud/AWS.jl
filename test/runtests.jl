using AWS
using AWS: AWSCredentials, AWSServices, assume_role_creds
using AWS.AWSExceptions:
    AWSException, IMDSUnavailable, InvalidFileName, NoCredentials, ProtocolNotDefined
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
using Compat: mergewith, pkgversion
using Dates
using Downloads
using GitHub
using HTTP
using IniFile: Inifile, sections
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

include("patch.jl")
include("resource/totp.jl")

function _now_formatted()
    return lowercase(Dates.format(now(Dates.UTC), dateformat"yyyymmdd\THHMMSSsss\Z"))
end

testset_role(role_name) = "AWS.jl-$role_name"

const RUN_UNIT_TESTS = get(ENV, "RUN_UNIT_TESTS", "true") == "true"
const RUN_INTEGRATION_TESTS = get(ENV, "RUN_INTEGRATION_TESTS", "true") == "true"
const RUN_MINIO_INTEGRATION_TESTS = begin
    all(k -> haskey(ENV, k), ("MINIO_ACCESS_KEY", "MINIO_SECRET_KEY", "MINIO_REGION_NAME"))
end

# Avoid the situation where we all tests are silently skipped. Most likely due to the wrong
# environmental variables being used.
if !RUN_UNIT_TESTS && !RUN_INTEGRATION_TESTS
    error("All tests have been disabled")
end

@testset "AWS.jl" begin
    # Unit tests do not requires access to an AWS account
    @testset "Unit Tests" begin
        if RUN_UNIT_TESTS
            # Force unit tests to run without a valid AWS configuration being present
            withenv(
                [k => nothing for k in filter(startswith("AWS_"), keys(ENV))]...,
                "AWS_CONFIG_FILE" => "/dev/null",
                "AWS_SHARED_CREDENTIALS_FILE" => "/dev/null",
            ) do
                include("unit/AWS.jl")
                include("unit/AWSExceptions.jl")
                include("unit/AWSMetadataUtilities.jl")
                include("unit/test_pkg.jl")
                include("unit/utilities.jl")
                include("unit/AWSConfig.jl")
                include("unit/IMDS.jl")
                include("unit/AWSCredentials.jl")
                include("unit/issues.jl")
            end
        else
            @warn "Skipping unit tests"
        end
    end

    # Integration tests require access to an AWS account
    @testset "Integration Tests" begin
        if RUN_INTEGRATION_TESTS
            backends = [AWS.HTTPBackend, AWS.DownloadsBackend]
            @testset "Backend: $(nameof(backend))" for backend in backends
                AWS.DEFAULT_BACKEND[] = backend()
                include("integration/AWS.jl")
                include("integration/AWSCredentials.jl")
                include("integration/role.jl")
                include("integration/issues.jl")

                if RUN_MINIO_INTEGRATION_TESTS
                    include("integration/minio.jl")
                else
                    @warn "Skipping MinIO integration tests"
                end
            end
        else
            @warn "Skipping integration tests"
        end
    end
end
