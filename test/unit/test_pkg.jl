path = joinpath(@__DIR__, "..", "resource", "TestPkg")

Pkg.develop(; path=path)
VERSION >= v"1.9.4" && Pkg.precompile("TestPkg")

# Check to see if we get any warnings when using AWS.jl inside of another package.
out = @capture_out begin
    err = @capture_err begin
        @eval using TestPkg
    end

    @test isempty(err)
end

@test isempty(out)
