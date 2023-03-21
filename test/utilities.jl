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

# Count the elements in an iterator without using `length`
function count_len(itr)
    c = 0
    for _ in itr
        c += 1
    end
    return c
end

@testset "AWSExponentialBackoff" begin
    for (n, max_backoff) in [(3, 5.0), (10, 20.0)]
        itr = AWS.AWSExponentialBackoff(;
            max_attempts=n, max_backoff=max_backoff, rng=StableRNG(1)
        )
        @test count_len(itr) == n - 1
        @test length(collect(itr)) == n - 1
        @test all(>(0), itr)
        @test all(<=(max_backoff), itr)
    end
end

@testset "_clean_s3_uri" begin
    @test AWS._clean_s3_uri("/ !'()*+,:=@") == "/%20%21%27%28%29%2A%2B%2C%3A%3D%40"
    @test AWS._clean_s3_uri("/bucket/!'()*+,:=@ /file") ==
        "/bucket/%21%27%28%29%2A%2B%2C%3A%3D%40%20/file"
    @test AWS._clean_s3_uri("/📁/📁") == "/%F0%9F%93%81/%F0%9F%93%81"
end
