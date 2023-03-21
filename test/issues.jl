@service S3

BUCKET_NAME = "aws-jl-test-issues---" * _now_formatted()

# We try to be insensitive to the existence of other logging messages, so we test
# by counting the number of messages that meet some criteria
function log_is_retry(successful)
    return record ->
        record.level == Logging.Debug &&
        get(record.kwargs, :retry, nothing) == successful
end

try
    S3.create_bucket(BUCKET_NAME)

    @testset "issue 223" begin
        # https://github.com/JuliaCloud/AWS.jl/issues/223
        body = "Hello World!"
        file_name = "contains spaces"

        try
            S3.put_object(BUCKET_NAME, file_name, Dict("body" => body))
            resp = S3.get_object(BUCKET_NAME, file_name)

            @test String(resp) == body
        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

    @testset "issue 227" begin
        @testset "s3 public bucket" begin
            # https://github.com/JuliaCloud/AWS.jl/issues/227
            config = AWSConfig(; creds=nothing)
            resp = S3.get_object("www.invenia.ca", "index.html"; aws_config=config)

            @test !isempty(resp)
        end

        @testset "s3 private bucket" begin
            bucket_name = "aws-jl-test-issues---" * _now_formatted()
            file_name = "hello_world"

            try
                S3.create_bucket(bucket_name)
                S3.put_object(bucket_name, file_name)

                @test_throws AWSException S3.get_object(
                    bucket_name, file_name; aws_config=AWSConfig(; creds=nothing)
                )
            finally
                S3.delete_object(bucket_name, file_name)
                S3.delete_bucket(bucket_name)
            end
        end

        @testset "lambda" begin
            @service Lambda

            @test_throws NoCredentials Lambda.list_functions(;
                aws_config=AWSConfig(; creds=nothing)
            )
        end
    end

    @testset "issue 324" begin
        body = "Hello World!"
        file_name = "streaming.bin"

        try
            S3.put_object(BUCKET_NAME, file_name, Dict("body" => body))
            resp = S3.get_object(BUCKET_NAME, file_name)
            @test String(resp) == body

            # ERROR: MethodError: no method matching iterate(::Base.BufferStream)
            #   => BUG: header `response_stream` is pushed into the query...
            io = Base.BufferStream()
            S3.get_object(
                BUCKET_NAME,
                file_name,
                Dict("response_stream" => io, "return_stream" => true),
            )
            if bytesavailable(io) > 0
                @test String(readavailable(io)) == body
            else
                @test "no body data was available" == body
            end

        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

    @testset "issue 466" begin
        file_name = "hang.txt"

        try
            S3.put_object(BUCKET_NAME, file_name)

            # The tests below validate the current behavior of how streams are handled.
            # Note: Avoid using `eof` for these tests can hang when using an unclosed `Base.BufferStream`

            stream = S3.get_object(BUCKET_NAME, file_name, Dict("return_stream" => true))
            if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                @test !isopen(stream)
            else
                @test isopen(stream)
            end

            stream = Base.BufferStream()
            S3.get_object(BUCKET_NAME, file_name, Dict("response_stream" => stream))
            if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                @test !isopen(stream)
            else
                # See: https://github.com/JuliaCloud/AWS.jl/issues/471
                @test_broken isopen(stream)
            end

            stream = Base.BufferStream()
            S3.get_object(
                BUCKET_NAME,
                file_name,
                Dict("response_stream" => stream, "return_stream" => true),
            )
            if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                @test !isopen(stream)
            else
                @test isopen(stream)
            end
        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

    @testset "issue 474" begin
        body = "foo\0bar"
        expected = Vector{UInt8}(body)
        file_name = "null.txt"

        try
            S3.put_object(BUCKET_NAME, file_name, Dict("body" => body))

            raw = S3.get_object(BUCKET_NAME, file_name, Dict("return_raw" => true))
            @test raw == expected

            stream = S3.get_object(BUCKET_NAME, file_name, Dict("return_stream" => true))
            if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                @test stream isa Base.BufferStream
                @test !isopen(stream)

                if !isopen(stream)
                    @test read(stream) == expected
                end
            else
                @test stream isa IOBuffer
                @test isopen(stream)

                seekstart(stream)
                @test read(stream) == expected
            end
        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
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
                        throw(HTTP.RequestError(HTTP.Request(), EOFError()))
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
        bucket = "www.invenia.ca"  # use public bucket as dummy
        key = "index.html"
        config = AWSConfig(; creds=nothing)

        @testset "Fail 2 attempts then succeed" begin
            logger = Test.TestLogger(; min_level=Logging.Debug)
            with_logger(logger) do
                apply(_incomplete_patch(; data=data, num_attempts_to_fail=2)) do
                    retrieved = S3.get_object(bucket, key; aws_config=config)

                    @test length(retrieved) == n
                    @test retrieved == data
                end
            end
            logs = logger.logs

            println("Fail two ")
            println(logs)

            # Two successful retries
            @test count(log_is_retry(true), logs) == 2
            # No unsuccessful ones
            @test count(log_is_retry(false), logs) == 0
        end

        @testset "Fail all 4 attempts then throw" begin
            err_t = if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                HTTP.RequestError
            else
                Downloads.RequestError
            end
            io = IOBuffer()

            logger = Test.TestLogger(; min_level=Logging.Debug)
            with_logger(logger) do
                apply(_incomplete_patch(; data=data, num_attempts_to_fail=4)) do
                    params = Dict("response_stream" => io)
                    @test_throws err_t S3.get_object(bucket, key, params; aws_config=config)

                    seekstart(io)
                    retrieved = read(io)
                    @test length(retrieved) == n - 1
                    @test retrieved == data[1:(n - 1)]
                end
            end
            logs = logger.logs

            println("Fail 4")
            println(logs)

            # Three successful retries - from the inner retry loop
            @test count(log_is_retry(true), logs) == 3
            # One unsuccessful one - from the outer loop where we pass it on
            @test count(log_is_retry(false), logs) == 1
        end
    end

finally
    S3.delete_bucket(BUCKET_NAME)
end
