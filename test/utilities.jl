@testset "_merge - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a"=>1)
        b = Dict("b"=>2)

        @test AWS._merge(a, b) == expected

    end

    @testset "Complex Different Nested Dict Keys" begin
        expected = Dict("common" => Dict("b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test AWS._merge(a, b) == expected
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test AWS._merge(a1, a2) == expected
    end
end

@testset "mergewith(_merge) - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a"=>1)
        b = Dict("b"=>2)

        @test mergewith(AWS._merge, a, b) == expected
    end

    @testset "Complex Differed Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 1, "b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test mergewith(AWS._merge, a, b) == expected
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test mergewith(AWS._merge, a1, a2) == expected
    end
end

@testset "_merge - AbstractString" begin
    expected = "b"

    @test AWS._merge("a", "b") == expected
end

@testset "@something" begin
    @test_throws ArgumentError AWS.@something()
    @test_throws ArgumentError AWS.@something(nothing)
    @test AWS.@something(1) === 1
    @test AWS.@something(Some(nothing)) === nothing

    @test AWS.@something(1, error("failed")) === 1
    @test_throws ErrorException AWS.@something(nothing, error("failed"))
end
