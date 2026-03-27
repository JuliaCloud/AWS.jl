using Codegen:
    InvalidFileName,
    ProtocolNotDefined,
    ServiceFile,
    _filter_latest_service_version,
    _format_name,
    _generate_low_level_definition,
    _generate_high_level_definition,
    _generate_high_level_definitions,
    get_markdown_indent,
    _get_service_files,
    _get_service_and_version,
    _get_function_parameters,
    _html_to_markdown,
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
    if tree_obj == "master"
        tree = [Dict("path" => "apis", "sha" => "apis-sha", "type" => "tree")]
        return GitHub.Tree("test-sha", HTTP.URI(), tree, false)
    else
        tree = [
            Dict(
                "path" => "test-2020-01-01.normal.json",
                "sha" => "test-sha",
                "type" => "blob",
            ),
        ]
        return GitHub.Tree("test-sha", HTTP.URI(), tree, false)
    end
end

end

Mocking.activate()

@testset "AWS.jl codegen" begin
    include("codegen.jl")
end
