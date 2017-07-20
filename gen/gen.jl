using Compat
using LightXML

include("../src/codegen.jl")
include("autoscaling_gen_types.jl")
include("../src/autoscaling_spec.jl")

const DIR = dirname(@__FILE__)
const SRCDIR = joinpath(DIR, "..", "src")

info("generating autoscaling apis...")
generate_types(joinpath(SRCDIR, "autoscaling_types.jl"), "AutoScalingTypeDict", AutoScalingTypes)
generate_apis(joinpath(SRCDIR, "autoscaling_operations.jl"), "AutoScalingTypeDict", AutoScalingApi)
