using AWS
using Documenter


# Generate a docs page for each high-level service API.
const SERVICES_DIR = joinpath(@__DIR__, "src", "services")
const SERVICES_PAGES = Pair{String,String}[]
mkpath(SERVICES_DIR)

"Transform snake-case names, like `this_name`, to pascal-snake-case, like `This_Name`."
pascal_snake_case(s) = join(titlecase.(split(s, "_")), "_")

for jl_file in readdir(joinpath(pkgdir(AWS), "src", "services"))
    service = first(splitext(jl_file))
    # Create a module, e.g. `@service S3`, so we can extract docstrings from it.
    service_module = Symbol(pascal_snake_case(service))
    @eval @service $service_module
    @info "Generating documentation pages for `@service $service_module`"

    md_file = string(service, ".md")
    open(joinpath(SERVICES_DIR, md_file), "w") do md
        write(md, """
            ```@meta
            CurrentModule = Main.$service_module
            ```

            # $service_module

            This page documents function available when using the `$service_module` module,
            created with [`@service $service_module`](@ref AWS.@service).

            ```@index
            Pages   = ["$md_file"]
            Modules = [$service_module]
            ```

            ```@autodocs
            Modules = [$service_module]
            ```
            """
        )
    end
    push!(SERVICES_PAGES, string(service_module) => joinpath("services", md_file))
end

makedocs(;
    modules=[AWS],
    repo="https://github.com/JuliaCloud/AWS.jl/blob/{commit}{path}#{line}",
    sitename="AWS.jl",
    format=Documenter.HTML(;
        prettyurls=false,
        canonical="https://invenia.github.io/AWS.jl",
    ),
    pages=[
        "Home" => "index.md",
        "AWS" => "aws.md",
        "@services" => SERVICES_PAGES,
    ],
    strict=true,
    checkdocs=:exports,
)

deploydocs(;
    repo="github.com/JuliaCloud/AWS.jl",
    push_preview=true,
)
