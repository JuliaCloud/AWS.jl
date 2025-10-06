with_aws_config(
    MinioConfig(
        "http://127.0.0.1:9000",
        ENV["MINIO_REGION_NAME"],
        SimpleCredentials(ENV["MINIO_ACCESS_KEY"], ENV["MINIO_SECRET_KEY"], ""),
    ),
) do
    datadir = joinpath(dirname(pathof(AWS)), "..", "data")

    # Create bucket and place objects in it
    S3.create_bucket("anewbucket")
    try
        S3.put_object("anewbucket", "myobject", Dict("body" => "Hi from Minio"))
        S3.put_object("anewbucket", "empty")
        S3.put_object("anewbucket", "foo/bar", Dict("body" => "a nested object"))
        S3.put_object("anewbucket", "foo/baz", Dict("body" => "a secondnested object"))

        # Test retrieving an object
        @test String(S3.get_object("anewbucket", "myobject")) == "Hi from Minio"

        # Test retrieving an object into a stream target
        mktemp() do f, io
            S3.get_object("anewbucket", "myobject", Dict("response_stream" => io))
            flush(io)
            @test read(f, String) == "Hi from Minio"
        end

        # Test listing
        objs = S3.list_objects_v2("anewbucket")
        @test length(objs["Contents"]) == 4

        # Test api version 2 of list-objects
        objs_truncated = S3.list_objects_v2("anewbucket", Dict("max-keys" => 2))
        @test length(objs_truncated["Contents"]) == 2
        @test objs_truncated["IsTruncated"] == "true"
        @test haskey(objs_truncated, "NextContinuationToken")

        # Test listing with prefixes
        objs_prefix = S3.list_objects_v2(
            "anewbucket", Dict("prefix" => "", "delimiter" => "/")
        )
        @test length(objs_prefix["Contents"]) == 2
        @test sort(getindex.(objs_prefix["Contents"], "Key")) == ["empty", "myobject"]
        @test objs_prefix["CommonPrefixes"]["Prefix"] == "foo/"

        # Duplicated testset from "test/issues.jl". Useful for testing outside the CI. Ideally,
        # the tests should be revised such that local testing works without having to duplicate
        # testsets.

        @testset "issue 466" begin
            file_name = "hang.txt"

            try
                S3.put_object("anewbucket", file_name)

                # Note: Using `eof` for these tests can hang when using an unclosed `Base.BufferStream`

                stream = S3.get_object(
                    "anewbucket", file_name, Dict("return_stream" => true)
                )
                if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                    @test !isopen(stream)
                else
                    @test isopen(stream)
                end

                stream = Base.BufferStream()
                S3.get_object("anewbucket", file_name, Dict("response_stream" => stream))
                if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                    @test !isopen(stream)
                else
                    @test_broken isopen(stream)
                end

                stream = Base.BufferStream()
                S3.get_object(
                    "anewbucket",
                    file_name,
                    Dict("response_stream" => stream, "return_stream" => true),
                )
                if AWS.DEFAULT_BACKEND[] isa AWS.HTTPBackend
                    @test !isopen(stream)
                else
                    @test isopen(stream)
                end
            finally
                S3.delete_object("anewbucket", file_name)
            end
        end

        @testset "issue 474" begin
            body = "foo\0bar"
            expected = Vector{UInt8}(body)
            file_name = "null.txt"
            bucket_name = "anewbucket"

            try
                S3.put_object(bucket_name, file_name, Dict("body" => body))

                raw = S3.get_object(bucket_name, file_name, Dict("return_raw" => true))
                @test raw isa Vector{UInt8}
                @test raw == expected

                stream = S3.get_object(
                    bucket_name, file_name, Dict("return_stream" => true)
                )
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
                S3.delete_object(bucket_name, file_name)
            end
        end

    finally
        # Delete all objects and the bucket
        objs = S3.list_objects_v2("anewbucket")

        for obj in objs["Contents"]
            S3.delete_object("anewbucket", obj["Key"])
        end

        S3.delete_bucket("anewbucket")
    end

    @test isempty(filter(!isequal(".minio.sys"), readdir(datadir)))
end
