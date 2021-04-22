@testset "depwarn" begin
    req = Request(; service="", api_version="", request_method="")

    @test_logs (:warn, AWS.RR_DEPWARN) req.return_raw
    @test_logs (:warn, AWS.RR_DEPWARN) req.return_raw = true
end
