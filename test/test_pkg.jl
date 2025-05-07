path = joinpath(@__DIR__, "resources", "TestPkg")

if VERSION >= v"1.5"
    Pkg.develop(; path=path)
else
    Pkg.develop(PackageSpec(; path=path))
end

# Check to see if we get any warnings when using AWS.jl inside of another package.
out = @capture_out begin
    err = @capture_err begin
        @eval using TestPkg
    end

    @test isempty(err)
end

@test (isempty(out) || occursin("Precompiling TestPkg", out))
