@testset "IMDS" begin
    @testset "get" begin
        @testset "connect timeout" begin
            apply(Patches._instance_metadata_timeout_patch) do
                @test IMDS.get("/latest/meta-data") === nothing
            end
        end
    end

    @testset "region" begin
        @testset "available" begin
            patch = @patch function HTTP.request(method, uri::HTTP.URI, args...; kwargs...)
                if method == "GET" && uri.path == "/latest/meta-data/placement/region"
                    HTTP.Response("ap-atlantis-1")  # Made up region
                elseif method == "PUT" && uri.path == "/latest/api/token"
                    HTTP.Response(404)
                else
                    HTTP.Response(501; request=HTTP.Request(method, uri.path))
                end
            end

            apply(patch) do
                @test IMDS.region() == "ap-atlantis-1"
            end
        end

        @testset "unavailable" begin
            apply(Patches._instance_metadata_timeout_patch) do
                @test IMDS.region() === nothing
            end
        end
    end
end
