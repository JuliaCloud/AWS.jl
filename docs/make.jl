using AWS
using Documenter

"Transform snake-case names, like `this_name`, to pascal-snake-case, like `This_Name`."
pascal_snake_case(s) = join(titlecase.(split(s, "_")), "_")

"""
    _generate_high_level_services_docs(service_dir) -> Vector{Pair{String,String}}

Generate a documentation page for each high-level AWS Service API, and
return a `Vector` of `"service name" => "docs/src/services/service_name.md"` pairs.

Documentation pages are created at `docs/src/services/{service_name}.md`, and
populated with all docstrings from a module created with `@service Service_Name`.
"""
function _generate_high_level_services_docs(
    services_dir=joinpath(@__DIR__, "src", "services")
)
    mkpath(services_dir)

    # Remove service doc files to ensure old services that no longer exist are removed.
    for path in readdir(services_dir; join=true)
        if isfile(path) && endswith(path, ".md")
            rm(path)
        end
    end

    services_pages = Pair{String,String}[]
    for jl_file in readdir(joinpath(pkgdir(AWS), "src", "services"))
        service = first(splitext(jl_file))
        # Create a module, e.g. `@service S3`, so we can extract docstrings from it.
        service_module = Symbol(pascal_snake_case(service))
        @eval @service $service_module

        # Avoid `_`s in sidebar/titles/contents as it causes italics in markdown contexts.
        service_name = replace(string(service_module), "_" => " ")

        @info "Generating documentation page for `@service $service_module`"
        md_file = string(service, ".md")
        open(joinpath(services_dir, md_file), "w") do md
            write(
                md,
                """
          ```@meta
          CurrentModule = Main.$service_module
          ```

          # $service_name

          This page documents function available when using the `$service_module`
          module, created with [`@service $service_module`](@ref AWS.@service).

          ### Index
          ```@index
          Pages   = ["$md_file"]
          Modules = [$service_module]
          ```

          ### Documentation
          ```@autodocs
          Modules = [$service_module]
          ```
          """,
            )
        end
        push!(services_pages, service_name => joinpath("services", md_file))
    end
    return services_pages
end

service_pages = _generate_high_level_services_docs()

makedocs(;
    modules=[AWS],
    repo="https://github.com/JuliaCloud/AWS.jl/blob/{commit}{path}#{line}",
    sitename="AWS.jl",
    format=Documenter.HTML(;
        canonical="https://juliacloud.github.io/AWS.jl",
        prettyurls=false,
        size_threshold_ignore=[last(page)::String for page in service_pages],
    ),
    pages=[
        "Home" => "index.md",
        "Backends" => "backends.md",
        "AWS" => "aws.md",
        "IMDS" => "imds.md",
        "Services" => service_pages,
    ],
    checkdocs=:exports,
)

deploydocs(; repo="github.com/JuliaCloud/AWS.jl", push_preview=true)
