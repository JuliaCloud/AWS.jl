# Used to allow custom dispatches to `_http_request`
abstract type AbstractBackend end

"""
    AWS.HTTPBackend <: AWS.AbstractBackend

An `HTTPBackend` can hold default `http_options::AbstractDict{Symbol,<:Any}`
to pass to HTTP.jl, which can be overwritten per-request by any `http_options`
supplied there.
"""
struct HTTPBackend <: AbstractBackend
    http_options::AbstractDict{Symbol,<:Any}
end

function HTTPBackend(; kwargs...)
    return if isempty(kwargs)
        HTTPBackend(LittleDict{Symbol,Any}())
    else
        HTTPBackend(LittleDict(kwargs))
    end
end
# populated in `__init__`
const DEFAULT_BACKEND = Ref{AbstractBackend}()

Base.@kwdef mutable struct Request
    service::String
    api_version::String
    request_method::String

    headers::AbstractDict{String,String} = LittleDict{String,String}()
    content::Union{String,Vector{UInt8}} = ""
    resource::String = ""
    url::String = ""

    # Note: User provided `IO` should support seeking in order to support API error handling
    response_stream::Union{IO,Nothing} = nothing

    http_options::AbstractDict{Symbol,<:Any} = LittleDict{Symbol,String}()
    backend::AbstractBackend = DEFAULT_BACKEND[]

    # Deprecated fields
    use_response_type::Bool = false
    return_stream::Union{Bool,Nothing} = nothing
    return_raw::Union{Bool,Nothing} = nothing
    response_dict_type::Union{Type{<:AbstractDict},Nothing} = nothing
end

"""
    submit_request(aws::AbstractAWSConfig, request::Request; return_headers::Bool=false)

Submit the request to AWS.

# Arguments
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `request::Request`: All the information about making a request to AWS

# Keywords
- `return_headers::Bool=false`: Set to `true` if you want the headers from the response returned back. Only
  used if `request.use_response_type = false`.

# Returns
- `AWS.Response`: A struct containing the response details
"""
function submit_request(aws::AbstractAWSConfig, request::Request; return_headers=nothing)
    aws_response = nothing
    TOO_MANY_REQUESTS = 429
    EXPIRED_ERROR_CODES = ["ExpiredToken", "ExpiredTokenException", "RequestExpired"]
    REDIRECT_ERROR_CODES = [301, 302, 303, 304, 305, 307, 308]
    THROTTLING_ERROR_CODES = [
        "Throttling",
        "ThrottlingException",
        "ThrottledException",
        "RequestThrottledException",
        "TooManyRequestsException",
        "ProvisionedThroughputExceededException",
        "LimitExceededException",
        "RequestThrottled",
        "PriorRequestNotComplete",
    ]

    request.headers["User-Agent"] = user_agent[]
    request.headers["Host"] = HTTP.URI(request.url).host
    stream = @something request.response_stream IOBuffer()

    @repeat 3 try
        credentials(aws) === nothing || sign!(aws, request)

        aws_response = @mock _http_request(request.backend, request, stream)
        response = aws_response.response

        if response.status in REDIRECT_ERROR_CODES
            if HTTP.header(response, "Location") != ""
                request.url = HTTP.header(response, "Location")
            else
                e = HTTP.StatusError(response.status, response)
                throw(AWSException(e, stream))
            end
        end
    catch e
        if e isa HTTP.StatusError
            e = AWSException(e, stream)
        elseif !(e isa AWSException)
            rethrow(e)
        end

        @retry if occursin("Signature expired", e.message)
        end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        @retry if e isa AWSException && e.code in EXPIRED_ERROR_CODES
            check_credentials(credentials(aws); force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        @delay_retry if _http_status(e.cause) == TOO_MANY_REQUESTS ||
            e.code in THROTTLING_ERROR_CODES
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if _header(e.cause, "crc32body") == "x-amz-crc32" ||
            e.code in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        end

        if occursin("Missing Authentication Token", e.message) &&
            aws.credentials === nothing
            return throw(
                NoCredentials(
                    "You're attempting to perform a request without credentials set."
                ),
            )
        end
    end

    if request.use_response_type
        return aws_response
    else
        return legacy_response(request, aws_response; return_headers=return_headers)
    end
end

function _http_request(http_backend::HTTPBackend, request::Request, response_stream::IO)
    http_options = merge(http_backend.http_options, request.http_options)

    # HTTP options such as `status_exception` need to be used when creating the stack
    http_stack = HTTP.stack(;
        redirect=false, retry=false, aws_authorization=false, http_options...
    )

    local buffer
    local response
    try
        @repeat 4 try
            # Use a sacrificial I/O stream so that we only write to the `response_stream`
            # once even with multiple attempted requests. Additionally this works around the
            # HTTP.jl issue (https://github.com/JuliaWeb/HTTP.jl/issues/543) where the
            # `response_stream` is closed automatically. Effectively, this works as if we're
            # not using streaming I/O at all, as we write all data at once, but only
            # returning data via I/O ensures we aren't relying on response's body being
            # populated.
            buffer = Base.BufferStream()

            response = @mock HTTP.request(
                http_stack,
                request.request_method,
                HTTP.URI(request.url),
                HTTP.mkheaders(request.headers),
                request.content;
                require_ssl_verification=false,
                response_stream=buffer,
                http_options...,
            )
        catch e
            # `Base.IOError` is needed because HTTP.jl can often have errors that aren't
            # caught and wrapped in an `HTTP.IOError`
            # https://github.com/JuliaWeb/HTTP.jl/issues/382
            @delay_retry if isa(e, Sockets.DNSError) ||
                isa(e, HTTP.ParseError) ||
                isa(e, HTTP.IOError) ||
                isa(e, Base.IOError) ||
                (isa(e, HTTP.StatusError) && _http_status(e) >= 500)
            end
        end
    finally
        # We're unable to read from the `Base.BufferStream` until it has been closed.
        # HTTP.jl will close passed in `response_stream` keyword. This ensures that it
        # is always closed (e.g. HTTP.jl 0.9.15)
        close(buffer)

        # Transfer the contents of the `BufferStream` into `response_stream` variable.
        write(response_stream, buffer)
    end

    return @mock Response(response, response_stream)
end

_http_status(e::HTTP.StatusError) = e.status
_header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)
