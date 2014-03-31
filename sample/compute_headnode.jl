include("config.jl")

println("Adding workers")
include("addprocs_headnode.jl")
include("test_workers.jl")


