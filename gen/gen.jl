using Compat
using LightXML

# define placeholder types
mutable struct AWSEnv end

include("../src/codegen.jl")

const DIR = dirname(@__FILE__)
const SRCDIR = joinpath(DIR, "..", "src")

const SPEC_NAMES = [
    "AutoScaling",
    "SQS",
    "EC2"
]

function do_gen(spec_name::String, includes::Vector{String}, out_types_file::String, out_operations_file::String)
    map(include, includes)

    info("generating ", spec_name, " types...")
    generate_types(out_types_file, "$(spec_name)TypeDict", eval(Symbol("$(spec_name)Types")))

    info("generating ", spec_name, " apis...")
    generate_apis(out_operations_file, "$(spec_name)TypeDict", eval(Symbol("$(spec_name)Api")))
end

function gen_all()
    for spec_name in SPEC_NAMES
        lower_spec_name = lowercase(spec_name)
        spec_file = joinpath("..", "src", lower_spec_name * "_spec.jl")
        placeholder_types_file = lower_spec_name * "_gen_types.jl"
        out_types_file = joinpath(SRCDIR, "$(lower_spec_name)_types.jl")
        out_operations_file = joinpath(SRCDIR, "$(lower_spec_name)_operations.jl")

        pid = addprocs(1)[1]
        remotecall_fetch(include, pid, @__FILE__)
        remotecall_fetch(do_gen, pid, spec_name, [placeholder_types_file, spec_file], out_types_file, out_operations_file)
        rmprocs(pid)
    end
end

(length(ARGS) > 0) && (ARGS[1] == "gen_all") && gen_all()
