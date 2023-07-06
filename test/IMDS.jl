using HTTP.Messages: field_name_isequal
using HTTP.Pairs: getbyfirst

function get_header(h::Vector{<:Pair}, k, d="")
    return getbyfirst(h, k, k => d, field_name_isequal)[2]
end

function _imds_patch(; available=true, token=nothing, status=nothing, region=nothing, instance_id=nothing)
    patch = @patch function HTTP.request(method, uri::HTTP.URI, headers=[], body=""; kwargs...)
        if !available && uri.host == "169.254.169.254"
            connect_timeout = HTTP.ConnectionPool.ConnectTimeout(uri.host, uri.port)
            throw(HTTP.ConnectError(string(uri), connect_timeout))
        elseif !available
            error("Internal error: patch misconfigured")
        end

        header_token = get_header(headers, "X-aws-ec2-metadata-token", nothing)
        if token !== nothing
            ttl = get_header(headers, "X-aws-ec2-metadata-token-ttl-seconds", nothing)
            # @show token ttl
            if method == "PUT" && uri.path == "/latest/api/token" && ttl !== nothing
                return HTTP.Response(token)
            elseif token != header_token
                # TODO: Assuming response for IMDSv2 only setup
                return HTTP.Response(401)
            end
        elseif header_token !== nothing
            error("Internal error: Unexpected use of token header: $header_token")
        end

        if status !== nothing
            request = HTTP.Request(method, uri.path, headers, body)
            return HTTP.Response(status; request)
        elseif region !== nothing && method == "GET" && uri.path == "/latest/meta-data/placement/region"
            return HTTP.Response(region)
        elseif instance_id !== nothing && method == "GET" && uri.path == "/latest/meta-data/instance-id"
            return HTTP.Response(instance_id)
        else
            return HTTP.Response(404)
        end
    end
end

# function _imds_v1_patch(; available=false, region=nothing)


#     patch = @patch function HTTP.request(method, uri::URI, args...; kwargs...)
#         if !available && uri.host == "169.254.169.254"
#             connect_timeout = HTTP.ConnectionPool.ConnectTimeout(uri.host, uri.port)
#             throw(HTTP.ConnectError(string(uri), connect_timeout))
#         elseif region !== nothing && method == "GET" && uri.path == "/latest/meta-data/placement/region"
#             HTTP.Response("ap-atlantis-1")  # Made up region
#         elseif available
#             HTTP.Response(404)
#         else
#             error("Internal error: patch misconfigured")
#         end
#     end
# end

@testset "IMDS" begin
    @testset "refresh_token!" begin
        # IMDS is unavailable
        apply(_imds_patch(; available=false)) do
            session = IMDS.Session()
            @test isempty(session.token)
            @test session.duration == 21600
            @test IMDS.token_expired(session)

            @test_throws IMDSUnavailable IMDS.refresh_token!(session)
        end

        # HTTP server is available but non-functional
        apply(_imds_patch(; available=true, status=500)) do
            session = IMDS.Session()
            @test_throws HTTP.Exceptions.StatusError IMDS.refresh_token!(session)
        end

        # IMDSv1 is available
        apply(_imds_patch(; available=true)) do
            session = IMDS.Session()
            @test IMDS.refresh_token!(session) === session
            @test isempty(session.token)
            @test session.duration == 0
            @test session.expiration == typemax(Int64)
        end

        # IMDSv2 is available
        apply(_imds_patch(; available=true, token="foo")) do
            session = IMDS.Session(; duration=60)
            t = floor(Int64, time())
            @test IMDS.refresh_token!(session) === session
            @test session.token == "foo"
            @test session.duration == 60
            @test 0 <= session.expiration - (t + session.duration) <= 5
        end
    end

    @testset "request" begin
        path = "/latest/meta-data/instance-id"

        # IMDS is unavailable
        apply(_imds_patch(; available=false)) do
            session = IMDS.Session()
            @test_throws IMDSUnavailable IMDS.request(session, "GET", path)
        end

        # Requested metadata is missing
        apply(_imds_patch(; available=true, token="token")) do
            session = IMDS.Session()
            @show IMDS.request(session, "GET", path)
            @test_throws HTTP.Exceptions.StatusError IMDS.request(session, "GET", path)
        end

        # Requested metadata available via IMDSv1
        apply(_imds_patch(; available=true, instance_id="123")) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path)
            @test r isa HTTP.Response
            @test r.status == 200
            @test String(r.body) == "123"
        end

        # Requested metadata available via IMDSv2
        apply(_imds_patch(; available=true, token="token", instance_id="123")) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path)
            @test r isa HTTP.Response
            @test r.status == 200
            @test String(r.body) == "123"
        end
    end
#=
    @testset "get" begin
        @testset "connect timeout" begin
            apply(_imds_patch(; available=false)) do
                @test IMDS.get("/latest/meta-data") === nothing
            end
        end
    end

    @testset "region" begin
        @testset "available" begin
            apply(_imds_patch(; region="ap-atlantis-1")) do
                @test IMDS.region() == "ap-atlantis-1"
            end
        end

        @testset "unavailable" begin
            apply(_imds_patch(; available=false)) do
                @test IMDS.region() === nothing
            end
        end
    end
=#
end
