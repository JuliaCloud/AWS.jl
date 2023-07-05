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
using Mocking

const IPv4_ADDRESS = "169.254.169.254"

mutable struct Session
    duration::Int
    token::String
    expiration::Int64
end

Session(; duration=21600) = Session(duration, "", 0)

token_expired(session::Session) = time() - session.expiration > 0

function refresh_token!(session::Session, duration::Integer=session.duration)
    t = floor(Int64, time())
    headers = ["X-aws-ec2-metadata-token-ttl-seconds" => string(duration)]

    # For IMDSv2, you must use `/latest/api/token` when retrieving the token instead of a
    # version specific path.
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#imds-considerations
    uri = HTTP.URI(; scheme="http", host=IPv4_ADDRESS, path="/latest/api/token")
    r = _http_request("PUT", uri, headers; status_exception=false)

    # Store the session token when we receive an HTTP 200. If we receive an HTTP 404 assume
    # that the server is only supports IMDSv1. Otherwise throw the `StatusError`.
    if r.status == 200
        session.token = String(r.body)
        session.duration = duration
        session.expiration = t + duration - 10
    elseif r.status == 404
        session.duration = 0
        session.expiration = typemax(Int64)  # Use IMDSv1 indefinitly
    else
        throw(HTTP.Exceptions.StatusError(r.status, r.request.method, r.request.target, r))
    end

    return session
end

function request(session::Session, method::AbstractString, path::AbstractString; kwargs...)
    # Attempt to generate token for use with IMDSv2. If we're unable to generate a token
    # we'll fall back on using IMDSv1. We prefer using IMDSv2 as instances can be configured
    # to disable IMDSv1 access: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances
    token_expired(session) && refresh_token!(session)
    headers = Pair{String,String}[]
    !isempty(session.token) && push!(headers, "X-aws-ec2-metadata-token" => session.token)

    # Only using the IPv4 endpoint as the IPv6 endpoint has to be explicitly enabled and
    # does not disable IPv4 support.
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ipv4-ipv6-endpoints
    uri = HTTP.URI(; scheme="http", host=IPv4_ADDRESS, path)
    return _http_request(method, uri, headers; kwargs...)
end

function _http_request(args...; status_exception=true, kwargs...)
    response = try
        # Always throw status exceptions so we can determine if the IMDS service is available
        @mock HTTP.request(args...; connect_timeout=1, retry=false, kwargs..., status_exception=true)
    catch e
        # TODO: Verify that when running on EC2 instances where IMDS is turned off that a 403 is returned
        # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#instance-metadata-returns
        if e isa HTTP.Exceptions.ConnectError || e isa HTTP.Exceptions.StatusError && e.status == 403
            throw(IMDSUnavailable())
        # Return the status exception when `status_exception=false`
        elseif !status_exception && e isa HTTP.Exceptions.StatusError
            e.response
        else
            rethrow()
        end
    end

    return response
end

"""
    get([session::Session], path::AbstractString) -> Union{String, Nothing}

Retrieve the AWS instance metadata from the provided HTTP `path`. If no instance metadata is
available (typically due to being executed outside of an EC2 instance) then `nothing` will
be returned. For details on available metadata see the official AWS documentation on:
["Instance metadata and user data"](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html).

# Arguments
- `session` (optional): The IMDS `Session` used to store the IMDSv2 token.
- `path`: The HTTP path to used to specify the metadata to return.
"""
function get(session::Session, path::AbstractString)
    response = try
        request(session, "GET", path)
    catch e
        if e isa IMDSUnavailable
            nothing
        else
            rethrow()
        end
    end

    return !isnothing(response) ? String(response.body) : nothing
end

"""
    region([session::Session]) -> Union{String, Nothing}

Determine the AWS region of the machine executing this code if running inside of an EC2
instance, otherwise `nothing` is returned.
"""
function region(session::Session)
    # return try
        get(session, "/latest/meta-data/placement/region")
    # catch
    #     nothing
    # end
end

const _SESSION = Ref{Session}()

function __init__()
    _SESSION[] = Session()
end

get(path::AbstractString) = get(_SESSION[], path)
region() = region(_SESSION[])

end
