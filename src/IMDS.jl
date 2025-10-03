"""
    IMDS

Front-end for retrieving AWS instance metadata via the Instance Metadata Service (IMDS). For
details on available metadata see the official AWS documentation on:
["Instance metadata and user data"](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html).

The IMDS module supports instances using either IMDSv1 or IMDSv2 (preferring IMDSv2 for
security reasons).
"""
module IMDS

using ..AWSExceptions: IMDSUnavailable

using HTTP: HTTP
using HTTP.Exceptions: ConnectError, StatusError
using Mocking
using URIs: URI

# Local-link address (https://en.wikipedia.org/wiki/Link-local_address)
const IPv4_ADDRESS = "169.254.169.254"
const DEFAULT_DURATION = 600  # 5 minutes, in seconds

mutable struct Session
    token::String
    duration::Int16
    expiration::Int64
end

const _SESSION = Ref{Session}()

function __init__()
    _SESSION[] = Session()
    return nothing
end

"""
    Session(; duration=$DEFAULT_DURATION)

An IMDS `Session` which retains the IMDSv2 token over multiple requests. When IMDSv2 is
unavailable the session switches to IMDSv1 mode and avoids future requests for IMDSv2
tokens.

# Keywords
- `duration` (optional): Requested session duration, in seconds, for the IMDSv2 token. Can
  be a minimum of one second and a maximum of six hours (21600).
"""
Session(; duration=DEFAULT_DURATION) = Session("", duration, 0)

token_expired(session::Session; drift=10) = time() - session.expiration - drift > 0

function refresh_token!(session::Session, duration::Integer=session.duration)
    t = floor(Int64, time())
    headers = ["X-aws-ec2-metadata-token-ttl-seconds" => string(duration)]

    # For IMDSv2, you must use `/latest/api/token` when retrieving the token instead of a
    # version specific path.
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#imds-considerations
    uri = URI(; scheme="http", host=IPv4_ADDRESS, path="/latest/api/token")
    r = try
        _http_request("PUT", uri, headers; status_exception=false, retry=false)
    catch e
        # The IMDSv2 uses a default Time To Live (TTL) of 1 (also known as the hop limit) at
        # the IP layer to ensure token requests occur on the instance. When this occurs we
        # need to fall back to using IMDSv1. Users may wish to increase the hop limit to
        # allow for IMDSv2 use in container based environments:
        # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#imds-considerations
        if is_ttl_expired_exception(e)
            @warn "IMDSv2 token request rejected due to reaching hop limit. Consider " *
                "increasing the hop limit to avoid delays upon initial use:\n" *
                "https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/" *
                "instancedata-data-retrieval.html#imds-considerations"

            session.token = ""
            session.duration = 0
            session.expiration = typemax(Int64)  # Use IMDSv1 indefinitely
            return session
        else
            rethrow()
        end
    end

    # Store the session token when we receive an HTTP 200. If we receive an HTTP 404 assume
    # that the server is only supports IMDSv1. Otherwise "rethrow" the `StatusError`.
    if r.status == 200
        session.token = String(r.body)
        session.duration = duration
        session.expiration = t + duration
    elseif r.status == 404
        session.token = ""
        session.duration = 0
        session.expiration = typemax(Int64)  # Use IMDSv1 indefinitely
    else
        # Could also populate the `StatusError` via `r.request.method` and
        # `r.request.target` however `r.request` may not be populated under test scenarios.
        throw(StatusError(r.status, "PUT", uri.path, r))
    end

    return session
end

function request(session::Session, method::AbstractString, path::AbstractString; status_exception=true)
    # Only allow the token to be refreshed once per call to `IMDS.request`.
    allow_refresh = true

    # Attempt to generate token for use with IMDSv2. If we're unable to generate a token
    # we'll fall back on using IMDSv1. We prefer using IMDSv2 as instances can be configured
    # to disable IMDSv1 access: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances
    if token_expired(session)
        refresh_token!(session)
        allow_refresh = false
    end
    headers = HTTP.Header[]
    !isempty(session.token) && HTTP.setheader(headers, "X-aws-ec2-metadata-token" => session.token)

    # Only using the IPv4 endpoint as the IPv6 endpoint has to be explicitly enabled and
    # does not disable IPv4 support.
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ipv4-ipv6-endpoints
    uri = URI(; scheme="http", host=IPv4_ADDRESS, path)

    # Refresh the token and immediately retry if we encounter "HTTP 401 Unauthorized".
    #
    # > When token usage is set to `required` (IMDSv2), requests without a valid token or
    # > with an expired token receive a `401 - Unauthorized` HTTP error code.
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-v2-how-it-works
    retry_delays = [0]
    function retry_check(s, e, request, response, response_body)
        if allow_refresh && e isa StatusError && e.status == 401 && !isempty(session.token)
            refresh_token!(session)
            allow_refresh = false
            HTTP.setheader(request.headers, "X-aws-ec2-metadata-token" => session.token)
            return true
        else
            return false
        end
    end

    return _http_request(method, uri, headers; retry_delays, retry_check, status_exception)
end

function _http_request(args...; status_exception=true, kwargs...)
    response = try
        # Override the user's `status_exception` so we can consistently handle status
        # exceptions. Additionally, by forcing `status_exception=true` this allows retries
        # to work.
        #
        # Additionally, we set a low connect timeout to have faster responses when
        # attempting to connect to IMDS outside of EC2.
        @mock HTTP.request(
            args...; connect_timeout=1, kwargs..., status_exception=true,
        )
    catch e
        # When running outside of an EC2 instance the link-local address will be unavailable
        # and connections will fail. On EC2 instances where IMDS is disabled a HTTP 403 is
        # returned.
        # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#instance-metadata-returns
        if is_connection_exception(e) || e isa StatusError && e.status == 403
            throw(IMDSUnavailable())

        #! format: off
        # Return the status exception when `status_exception=false`. We must always cause
        # `HTTP.request` to throw status errors for our `IMDSUnavailable` check.
        #! format: on
        elseif !status_exception && e isa StatusError
            e.response
        else
            rethrow()
        end
    end

    return response
end

is_connection_exception(e::ConnectError) = true
is_connection_exception(e::Exception) = false

# https://github.com/JuliaCloud/AWS.jl/issues/654
# https://github.com/JuliaCloud/AWS.jl/issues/649
function is_ttl_expired_exception(e::HTTP.Exceptions.RequestError)
    return e.error == Base.IOError("read: connection timed out (ETIMEDOUT)", -110)
end
is_ttl_expired_exception(e::Exception) = false

"""
    get([session::Session], path::AbstractString) -> Union{String, Nothing}

Retrieve the AWS instance metadata from the provided HTTP `path`. If the specific metadata
resource is unavailable or the instance metadata is unavailable (due to the instance metadata
service being disabled or not being run from within an EC2 instance) then `nothing` will be
returned. For details on available metadata see the official AWS documentation on:
["Instance metadata and user data"](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html).

# Arguments
- `session` (optional): The IMDS `Session` used to store the IMDSv2 token.
- `path`: The HTTP path to used to specify the metadata to return.
"""
function get(session::Session, path::AbstractString)
    response = try
        request(session, "GET", path)
    catch e
        if e isa IMDSUnavailable || e isa StatusError && e.status == 404
            nothing
        else
            rethrow()
        end
    end

    return !isnothing(response) ? String(response.body) : nothing
end

get(path::AbstractString) = get(_SESSION[], path)

"""
    region([session::Session]) -> Union{String, Nothing}

Determine the AWS region of the machine executing this code if running inside of an EC2
instance, otherwise `nothing` is returned.

# Arguments
- `session` (optional): The IMDS `Session` used to store the IMDSv2 token.
"""
region(session::Session) = get(session, "/latest/meta-data/placement/region")
region() = region(_SESSION[])

end
