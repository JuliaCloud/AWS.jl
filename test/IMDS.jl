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
            HTTP.Response(400)  # Behavior when required header is missing
        end
    end

    return Route("PUT", "/latest/api/token", handler)
end

function secure_route(route::Route, token)
    wrapper = function (req::HTTP.Request)
        if HTTP.header(req, "X-aws-ec2-metadata-token", nothing) == token
            route.handler(req)
        else
            HTTP.Response(401)  # Behavior when IMDSv2 is required
        end
    end

    return Route(route.method, route.path, wrapper)
end

function response_route(method, path, response::HTTP.Response)
    handler = function (req::HTTP.Request)
        return HTTP.Response(
            response.version, response.status, response.headers, response.body, req
        )
    end
    return Route(method, path, handler)
end

# Use Mocking to re-route requests to 169.254.169.254 without having to actually start an
# HTTP.jl server. Should result in faster running tests.
function _imds_patch(router::HTTP.Router=HTTP.Router(); listening=true, enabled=true)
    patch = @patch function HTTP.request(
        method, url, headers=[], body=HTTP.nobody; status_exception=true, kwargs...
    )
        uri = HTTP.URI(url)
        if uri.host != "169.254.169.254"
            error("Internal error: Unexpected HTTP call to non-IMDS service: $url")
        end

        request = HTTP.Request(method, uri.path, headers, body)
        response = if listening && enabled
            router(request)
        elseif listening && !enabled
            HTTP.Response(403)
        else
            connect_timeout = HTTP.ConnectionPool.ConnectTimeout(uri.host, uri.port)
            throw(HTTP.Exceptions.ConnectError(string(uri), connect_timeout))
        end

        if status_exception && response.status >= 300
            ex = HTTP.Exceptions.StatusError(
                response.status, request.method, request.target, response
            )
            throw(ex)
        end
        return response
    end
end

@testset "IMDS" begin
    @testset "refresh_token!" begin
        # Running outside of an EC2 instance
        apply(_imds_patch(; listening=false)) do
            session = IMDS.Session()
            @test isempty(session.token)
            @test session.duration == 21600
            @test IMDS.token_expired(session)

            @test_throws IMDSUnavailable IMDS.refresh_token!(session)
        end

        # Running on an EC2 instance where IMDS is disabled
        apply(_imds_patch(; enabled=false)) do
            session = IMDS.Session()
            @test_throws IMDSUnavailable IMDS.refresh_token!(session)
        end

        # IMDS is non-functional
        router = Router([response_route("PUT", "/latest/api/token", HTTP.Response(500))])
        apply(_imds_patch(router)) do
            session = IMDS.Session()
            @test_throws HTTP.Exceptions.StatusError IMDS.refresh_token!(session)
        end

        # IMDSv1 is available
        router = Router([response_route("PUT", "/latest/api/token", HTTP.Response(404))])
        apply(_imds_patch(router)) do
            session = IMDS.Session()
            @test IMDS.refresh_token!(session) === session
            @test isempty(session.token)
            @test session.duration == 0
            @test session.expiration == typemax(Int64)
        end

        # IMDSv2 is available
        token = "foo"
        router = Router([token_route(token)])
        apply(_imds_patch(router)) do
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

        # Running outside of an EC2 instance
        apply(_imds_patch(; listening=false)) do
            session = IMDS.Session()
            @test_throws IMDSUnavailable IMDS.request(session, "GET", path)
        end

        # Running on an EC2 instance where IMDS is disabled
        apply(_imds_patch(; enabled=false)) do
            session = IMDS.Session()
            @test_throws IMDSUnavailable IMDS.request(session, "GET", path)
        end

        # Requested metadata is missing
        router = Router([response_route("GET", path, HTTP.Response(500))])
        apply(_imds_patch(router)) do
            session = IMDS.Session()
            @test_throws HTTP.Exceptions.StatusError IMDS.request(session, "GET", path)
        end

        # Requested metadata available via IMDSv1
        router = Router([response_route("GET", path, HTTP.Response(instance_id))])
        apply(_imds_patch(router)) do
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
            secure_route(response_route("GET", path, HTTP.Response(instance_id)), token),
        ])
        apply(_imds_patch(router)) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path)
            @test r isa HTTP.Response
            @test r.status == 200
            @test String(r.body) == instance_id
            @test session.token == token
        end

        # Invalid token used with IMDSv2
        router = Router([
            token_route("good"),
            secure_route(response_route("GET", path, HTTP.Response(instance_id)), "bad"),
        ])
        apply(_imds_patch(router)) do
            session = IMDS.Session()
            r = IMDS.request(session, "GET", path; status_exception=false)
            @test r isa HTTP.Response
            @test r.status == 401
        end

        # Unlikely scenario where the instance metadata services has switched over from
        # IMDSv2 being optional to required while a long running Julia service on that
        # instance has session which is set to use IMDSv1 indefinitely.
        # TODO: We may want to have the code automatically attempt a token refresh when this
        # occurs but I doubt this scenario will occur in scenario will occur in reality as
        # instances cannot be configured to use IMDSv1 only.
        token = "token"
        router = Router([
            token_route(token),
            secure_route(response_route("GET", path, HTTP.Response(instance_id)), token),
        ])
        apply(_imds_patch(router)) do
            # Emulate a pre-existing session where IMDSv2 was not available.
            session = IMDS.Session("", 60, typemax(Int64))

            # Request attempts to use IMDSv1 but now only IMDSv2 is enabled
            r = IMDS.request(session, "GET", path; status_exception=false)
            @test r isa HTTP.Response
            @test r.status == 401
        end
    end

    @testset "get" begin
        instance_id = "123"
        path = "/latest/meta-data/instance-id"

        # Running outside of an EC2 instancee
        apply(_imds_patch(; listening=false)) do
            @test IMDS.get(path) === nothing
        end

        # Requested metadata available via IMDSv1
        router = Router([response_route("GET", path, HTTP.Response(instance_id))])
        apply(_imds_patch(router)) do
            @test IMDS.get(path) == instance_id
        end
    end

    @testset "region" begin
        region = "ap-atlantis-1"  # Made up region
        path = "/latest/meta-data/placement/region"

        # Running outside of an EC2 instance
        apply(_imds_patch(; listening=false)) do
            @test IMDS.region() === nothing
        end

        # Requested metadata available via IMDSv1
        router = Router([response_route("GET", path, HTTP.Response(region))])
        apply(_imds_patch(router)) do
            @test IMDS.region() == region
        end
    end
end
