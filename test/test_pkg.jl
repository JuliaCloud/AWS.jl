path = joinpath(@__DIR__, "resources", "TestPkg")

if VERSION >= v"1.5"
    Pkg.develop(path=path)
else
    Pkg.develop(PackageSpec(path=path))
end

# Check to see if we get any warnings when using AWS.jl inside of another package.
mktemp() do out_file, out_io
    mktemp() do err_file, err_io
        redirect_stdout(out_io) do
            redirect_stderr(err_io) do 
                @eval using TestPkg
            end
        end

        @test isempty(read(err_file))
    end

    @test isempty(read(out_file))
end
