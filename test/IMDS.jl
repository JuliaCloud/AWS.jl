struct Route
    method::String
    path::String
    handler
end

function register!(router::HTTP.Router, route::Route)
    return HTTP.register!(router, route.method, route.path, route.handler)
end

function Router(routes)
    router = HTTP.Router()
    for route in routes
        register!(router, route)
    end
    return router
end

function token_route(token)
    handler = function (req::HTTP.Request)
        ttl_secs = HTTP.header(req, "X-aws-ec2-metadata-token-ttl-seconds", nothing)
        if !isnothing(ttl_secs)
            HTTP.Response(200, token)
        else
            HTTP.Response(400)
        end
    end

    return Route("PUT", "/latest/api/token", handler)
end

function secure_route(route::Route, token)
    wrapper = function (req::HTTP.Request)
        if HTTP.header(req, "X-aws-ec2-metadata-token", nothing) == token
            route.handler(req)
        else
            HTTP.Response(403)
        end
    end

    return Route(route.method, route.path, wrapper)
end

function response_route(method, path, response::HTTP.Response)
    handler = function (req::HTTP.Request)
        return HTTP.Response(
            response.version,
            response.status,
            response.headers,
            response.body,
            req
        )
    end
    return Route(method, path, handler)
end

function _imds_patch(router::HTTP.Router=HTTP.Router(); available=true)
    patch = @patch function HTTP.request(method, url, headers=[], body=HTTP.nobody; status_exception=true, kwargs...)
        uri = HTTP.URI(url)
        if available && uri.host == "169.254.169.254"
            request = HTTP.Request(method, uri.path, headers, body)
            response = router(request)
            if status_exception && response.status >= 300
                throw(HTTP.Exceptions.StatusError(response.status, request.method, request.target, response))
            end
            return response
        elseif !available && uri.host == "169.254.169.254"
            connect_timeout = HTTP.ConnectionPool.ConnectTimeout(uri.host, uri.port)
            throw(HTTP.ConnectError(string(uri), connect_timeout))
        else
            error("Internal error: Unexpected HTTP call to non-IMDS service: $url")
        end
    end
end

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
        router = Router([response_route("PUT", "/latest/api/token", HTTP.Response(500))])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session()
            @test_throws HTTP.Exceptions.StatusError IMDS.refresh_token!(session)
        end

        # IMDSv1 is available
        router = Router([response_route("PUT", "/latest/api/token", HTTP.Response(404))])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session()
            @test IMDS.refresh_token!(session) === session
            @test isempty(session.token)
            @test session.duration == 0
            @test session.expiration == typemax(Int64)
        end

        # IMDSv2 is available
        token = "foo"
        router = Router([token_route(token)])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session(; duration=60)
            t = floor(Int64, time())
            @test IMDS.refresh_token!(session) === session
            @test session.token == token
            @test session.duration == 60
            @test 0 <= session.expiration - (t + session.duration) <= 5
        end
    end

    @testset "request" begin
        instance_id = "123"
        path = "/latest/meta-data/instance-id"

        # IMDS is unavailable
        apply(_imds_patch(; available=false)) do
            session = IMDS.Session()
            @test_throws IMDSUnavailable IMDS.request(session, "GET", path)
        end

        # Requested metadata is missing
        router = Router([response_route("GET", path, HTTP.Response(500))])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session()
            @test_throws HTTP.Exceptions.StatusError IMDS.request(session, "GET", path)
        end

        # Requested metadata available via IMDSv1
        router = Router([response_route("GET", path, HTTP.Response(instance_id))])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path)
            @test r isa HTTP.Response
            @test r.status == 200
            @test String(r.body) == instance_id
            @test isempty(session.token)
        end

        # Requested metadata available via IMDSv2
        token = "token"
        router = Router([
            token_route(token),
            response_route("GET", path, HTTP.Response(instance_id)),
        ])
        apply(_imds_patch(router; available=true)) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path)
            @test r isa HTTP.Response
            @test r.status == 200
            @test String(r.body) == instance_id
            @test session.token == token
        end
    end

    @testset "get" begin
        @testset "connect timeout" begin
            apply(_imds_patch(; available=false)) do
                @test IMDS.get("/latest/meta-data") === nothing
            end
        end
    end

    @testset "region" begin
        @testset "available" begin
            region = "ap-atlantis-1"  # Made up region
            path = "/latest/meta-data/placement/region"
            router = Router([response_route("GET", path, HTTP.Response(region))])
            apply(_imds_patch(router)) do
                @test IMDS.region() == "ap-atlantis-1"
            end
        end

        @testset "unavailable" begin
            apply(_imds_patch(; available=false)) do
                @test IMDS.region() === nothing
            end
        end
    end
end
