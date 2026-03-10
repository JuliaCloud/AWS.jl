using Codegen:
    InvalidFileName,
    ProtocolNotDefined,
    ServiceFile,
    _format_name,
    _generate_low_level_definition,
    _generate_high_level_definition,
    _generate_high_level_definitions,
    get_markdown_indent,
    _get_service_model_trees,
    _get_function_parameters,
    _html_to_markdown,
    _parse_smithy_model,
    _preferred_protocol,
    _shape_name,
    _smithy_to_legacy_shape,
    _replace,
    _splitline,
    _wraplines,
    _validindex
using GitHub: GitHub
using JSON: JSON
using Mocking: Mocking, apply
using OrderedCollections: LittleDict
using Test

module Patches

using GitHub: GitHub
using HTTP: HTTP
using Mocking: @patch

_github_tree_patch = @patch function GitHub.tree(repo, tree_obj; kwargs...)
    return if tree_obj == "main"
        tree = [Dict("path" => "codegen", "sha" => "codegen-sha", "type" => "tree")]
        GitHub.Tree("main-sha", HTTP.URI(), tree, false)
    elseif tree_obj == "codegen-sha"
        tree = [Dict("path" => "sdk-codegen", "sha" => "sdk-codegen-sha", "type" => "tree")]
        GitHub.Tree("codegen-sha", HTTP.URI(), tree, false)
    elseif tree_obj == "sdk-codegen-sha"
        tree = [Dict("path" => "aws-models", "sha" => "aws-models-sha", "type" => "tree")]
        GitHub.Tree("sdk-codegen-sha", HTTP.URI(), tree, false)
    elseif tree_obj == "aws-models-sha"
        url = "https://api.github.com/repos/aws/aws-sdk-js-v3/git/blobs/0"
        tree = [
            Dict(
                "path" => "test.json",
                "sha" => "test-sha",
                "type" => "blob",
                "url" => url,
            ),
        ]
        GitHub.Tree("aws-models-sha", HTTP.URI(), tree, false)
    else
        error("Unhandled tree object: \"$tree_obj\"")
    end
end

end

Mocking.activate()

@testset "AWS.jl codegen" begin
    include("codegen.jl")
end
