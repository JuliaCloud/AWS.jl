# A transient request-path failure surfaces differently across HTTP.jl versions: 1.x wraps
# it in a `RequestError`, whereas 2.x lets the underlying transport error (e.g. `EOFError`)
# propagate. Both are classified as recoverable by AWS.jl's retry logic.
@static if isdefined(HTTP, :Exceptions)  # HTTP.jl 1.x
    _transient_request_error() = HTTP.RequestError(HTTP.Request(), EOFError())
    const _TransientRequestError = HTTP.RequestError
else  # HTTP.jl 2.x
    _transient_request_error() = EOFError()
    const _TransientRequestError = EOFError
end

# https://github.com/JuliaCloud/AWS.jl/issues/515
@testset "issue 515" begin
    function _incomplete_patch(; data, num_attempts_to_fail=4)
        attempt_num = 0
        n = length(data)

        function _downloads_response(content_length)
            headers = ["content-length" => string(content_length)]
            return Downloads.Response("http", "", 200, "HTTP/1.1 200 OK", headers)
        end

        patch = if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
            @patch function HTTP.request(args...; response_stream, kwargs...)
                attempt_num += 1
                if attempt_num <= num_attempts_to_fail
                    write(response_stream, data[1:(n - 1)]) # an incomplete stream that shouldn't be retained
                    throw(_transient_request_error())
                else
                    write(response_stream, data)
                    return HTTP.Response(200, "{\"Location\": \"us-east-1\"}")
                end
            end
        elseif AWS.DEFAULT_BACKEND[] isa AWS.DownloadsBackend
            @patch function Downloads.request(args...; output, kwargs...)
                attempt_num += 1
                if attempt_num <= num_attempts_to_fail
                    write(output, data[1:(n - 1)])  # an incomplete stream that shouldn't be retained
                    message = "transfer closed with 1 bytes remaining to read"
                    e = Downloads.RequestError("", 18, message, _downloads_response(n))
                    throw(e)
                else
                    write(output, data)
                    return _downloads_response(n)
                end
            end
        end

        return patch
    end

    n = 100
    data = rand(UInt8, n)
    bucket = "julialang2"  # use public bucket as dummy
    key = "bin/versions.json"
    config = AWSConfig(; creds=nothing, region="us-east-1")

    @testset "Fail 2 attempts then succeed" begin
        apply(_incomplete_patch(; data=data, num_attempts_to_fail=2)) do
            retrieved = S3.get_object(bucket, key; aws_config=config)

            @test length(retrieved) == n
            @test retrieved == data
        end
    end

    @testset "Fail all 4 attempts then throw" begin
        err_t = if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
            _TransientRequestError
        else
            Downloads.RequestError
        end
        io = IOBuffer()

        apply(_incomplete_patch(; data=data, num_attempts_to_fail=4)) do
            params = Dict("response_stream" => io)
            @test_throws err_t S3.get_object(bucket, key, params; aws_config=config)

            seekstart(io)
            retrieved = read(io)
            @test length(retrieved) == n - 1
            @test retrieved == data[1:(n - 1)]
        end
    end
end
