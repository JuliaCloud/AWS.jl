include("config.jl")

println("Adding workers")
include("addprocs_headnode.jl")
include("test_workers.jl")

if isfile("compute.jl")
    include("compute.jl")
end


