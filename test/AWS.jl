@testset "service module" begin
    @service S3
    @test :S3 in names(Main)
end