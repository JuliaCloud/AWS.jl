@testset "_merge - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a" => 1)
        b = Dict("b" => 2)

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

        a = Dict("a" => 1)
        b = Dict("b" => 2)

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

@testset "_assignment_to_kw!" begin
    @testset "non-expression" begin
        ex = :(true)
        @test_throws ArgumentError AWS._assignment_to_kw!(ex)
    end

    @testset "non-assignment" begin
        ex = :(a => true)
        @test_throws ArgumentError AWS._assignment_to_kw!(ex)
    end

    @testset "assignment" begin
        ex = :(a = true)
        @test AWS._assignment_to_kw!(ex) == Expr(:kw, :a, true)
        @test ex == Expr(:kw, :a, true)
    end
end
