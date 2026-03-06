using Codegen:
    InvalidFileName,
    ProtocolNotDefined,
    ServiceFile,
    _convert_smithy_shape
    _format_name,
    _generate_low_level_definition,
    _generate_high_level_definition,
    _generate_high_level_definitions,
    get_markdown_indent,
    _get_service_files,
    _get_function_parameters,
    _html_to_markdown,
    _parse_smithy_model,
    _shape_name,
    _smithy_protocol,
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
    if tree_obj == "main"
        return GitHub.Tree("main-sha", HTTP.URI(), [Dict("path" => "codegen", "sha" => "codegen-sha", "type" => "tree")], false)
    elseif tree_obj == "codegen-sha"
        return GitHub.Tree("codegen-sha", HTTP.URI(), [Dict("path" => "sdk-codegen", "sha" => "sdk-codegen-sha", "type" => "tree")], false)
    elseif tree_obj == "sdk-codegen-sha"
        return GitHub.Tree("sdk-codegen-sha", HTTP.URI(), [Dict("path" => "aws-models", "sha" => "aws-models-sha", "type" => "tree")], false)
    else  # aws-models-sha
        return GitHub.Tree("aws-models-sha", HTTP.URI(), [Dict("path" => "test.json", "sha" => "test-sha", "type" => "blob")], false)
    end
end

end

Mocking.activate()

@testset "AWS.jl codegen" begin
    include("codegen.jl")
end
