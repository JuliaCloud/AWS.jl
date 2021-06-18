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

    http_options::AbstractDict{Symbol,<:Any} = LittleDict{Symbol,String}()
    backend::AbstractBackend = DEFAULT_BACKEND[]
end

"""
    submit_request(aws::AbstractAWSConfig, request::Request)

Submit the request to AWS.

# Arguments
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `request::Request`: All the information about making a request to AWS

# Returns
- `AWS.Response`: A struct containing the response details
"""
function submit_request(aws::AbstractAWSConfig, request::Request)
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
    stream = IOBuffer()

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
        end

        @retry if :message in fieldnames(typeof(e)) &&
                  occursin("Signature expired", e.message)
        end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        @retry if e.code in EXPIRED_ERROR_CODES
            check_credentials(credentials(aws); force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        @delay_retry if e isa AWSException && (
            _http_status(e.cause) == TOO_MANY_REQUESTS || e.code in THROTTLING_ERROR_CODES
        )
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if e isa AWSException && (
            _header(e.cause, "crc32body") == "x-amz-crc32" ||
            e.code in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        )
        end

        if e isa AWSException &&
           occursin("Missing Authentication Token", e.message) &&
           aws.credentials === nothing
            return throw(
                NoCredentials(
                    "You're attempting to perform a request without credentials set."
                ),
            )
        end
    end

    return aws_response
end

function _http_request(http_backend::HTTPBackend, request::Request, response_stream::IO)
    http_options = merge(http_backend.http_options, request.http_options)

    @repeat 4 try
        # HTTP options such as `status_exception` need to be used when creating the stack
        http_stack = HTTP.stack(;
            redirect=false, retry=false, aws_authorization=false, http_options...
        )

        # To work around around issue where HTTP.jl closes the `response_stream`
        # (https://github.com/JuliaWeb/HTTP.jl/issues/543) we'll use a sacrificial I/O
        # stream. Effectively, this works as if we're not using streaming I/O at all but we
        # will keep using the `response_stream` kwarg to ensure we aren't relying on the
        # response's body being populated.
        buffer = IOBuffer()

        r = try
            @mock HTTP.request(
                http_stack,
                request.request_method,
                HTTP.URI(request.url),
                HTTP.mkheaders(request.headers),
                request.content;
                require_ssl_verification=false,
                response_stream=buffer,
                http_options...,
            )
        finally
            # Read directly from the buffer's data as the I/O stream is closed by HTTP.jl.
            # We need to be careful to always write the buffer data to the `response_stream`
            # when an exception occurs as this data contains details about the AWS error.
            data = if isopen(buffer)
                take!(buffer)
            else
                # When closed the `IOBuffer` size will be set to 0. In order to retrieve the
                # raw data we need to determine the size from the first '\0' character.
                first_null = findfirst(==(0x00), buffer.data)
                last_index = if first_null !== nothing
                    first_null - 1
                else
                    lastindex(buffer.data)
                end

                buffer.data[firstindex(buffer.data):last_index]
            end

            write(response_stream, data)
            seekstart(response_stream)
        end

        return @mock Response(r, response_stream)
    catch e
        # Base.IOError is needed because HTTP.jl can often have errors that aren't
        # caught and wrapped in an HTTP.IOError
        # https://github.com/JuliaWeb/HTTP.jl/issues/382
        @delay_retry if isa(e, Sockets.DNSError) ||
                        isa(e, HTTP.ParseError) ||
                        isa(e, HTTP.IOError) ||
                        isa(e, Base.IOError) ||
                        (isa(e, HTTP.StatusError) && _http_status(e) >= 500)
        end
    end
end

_http_status(e::HTTP.StatusError) = e.status
_header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)
