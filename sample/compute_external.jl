include("config.jl")

println("Adding workers")
include("addprocs_external.jl")
include("test_workers.jl")

if isfile("compute.jl")
    include("compute.jl")
end

