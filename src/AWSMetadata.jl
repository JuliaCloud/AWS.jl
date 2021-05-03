module AWSMetadata

using Base64
using ..AWSExceptions
using GitHub
using HTTP
using JSON
using Mocking
using OrderedCollections: LittleDict, OrderedDict

const services_path = joinpath(@__DIR__, "AWSServices.jl")

include(joinpath("api_generation", "utilities.jl"))
include(joinpath("api_generation", "high_level.jl"))
include(joinpath("api_generation", "low_level.jl"))

"""
    parse_aws_metadata()

Generate low and high level wrappers for each AWS Service based on their definitions in the
[aws-sdk-js GitHub Repository](https://github.com/aws/aws-sdk-js/tree/master/apis).

Low level wrappers are written into `src/AWSServices.jl`, while high level wrappers API
wrappers are written into their respective files in `src/services/{service}.jl`.
"""
function parse_aws_metadata()
    auth = GitHub.authenticate(ENV["GITHUB_AUTH"])
    repo_name = "aws/aws-sdk-js"

    files = _get_aws_sdk_js_files(repo_name, auth)

    _generate_low_level_wrappers(files, repo_name, auth)
    _generate_high_level_wrapper(files, repo_name, auth)
end

end
