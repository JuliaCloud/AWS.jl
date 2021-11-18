@service S3

BUCKET_NAME = "aws-jl-test-issues---" * _now_formatted()

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

    if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
        @testset "issue 515" begin
            # https://github.com/JuliaCloud/AWS.jl/issues/515
            data = rand(UInt8, 100)
            ATTEMPT_NUM = 0 # reset
            patch = @patch function HTTP.request(args...; response_stream, kwargs...)
                @show ATTEMPT_NUM += 1
                if ATTEMPT_NUM == 1
                    write(response_stream, rand(UInt8, 34)) # an incomplete stream that shouldn't be retained
                    throw(HTTP.IOError(EOFError(), "msg"))
                else
                    write(response_stream, data)
                end
                headers = [
                    "Content-Length" => string(length(data)),
                ]
                return HTTP.Response(200, "{\"Location\": \"us-east-1\"}")  # Made up region
            end
            config = AWSConfig(; creds=nothing)
            apply(patch) do
                resp = S3.get_object("www.invenia.ca", "index.html"; aws_config=config) # use public bucket as dummy
                @test resp == data
            end
        end
    end

finally
    S3.delete_bucket(BUCKET_NAME)
end
