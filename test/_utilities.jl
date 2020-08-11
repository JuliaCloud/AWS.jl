@testset "_merge - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a"=>1)
        b = Dict("b"=>2)

        @test expected == AWS._merge(a, b)

    end

    @testset "Complex Different Nested Dict Keys" begin
        expected = Dict("common" => Dict("b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test expected == AWS._merge(a, b)
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test expected == AWS._merge(a1, a2)
    end
end

@testset "mergewith(_merge) - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a"=>1)
        b = Dict("b"=>2)

        @test expected == mergewith(AWS._merge, a, b)
    end

    @testset "Complex Differed Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 1, "b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test expected == mergewith(AWS._merge, a, b)
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test expected == mergewith(AWS._merge, a1, a2)
    end
end

@testset "_merge - AbstractString" begin
    expected = "b"

    @test expected == AWS._merge("a", "b")
end

@testset "mergewith(_merge) - AbstractString" begin
    expected = "b"

    @test expected ==  mergewith(AWS._merge, "a", "b")
end
