@service S3 use_response_type = true
struct MinioConfig <: AbstractAWSConfig
    endpoint::String
    region::String
    creds
end
struct SimpleCredentials
    access_key_id::String
    secret_key::String
    token::String
end

AWS.region(c::MinioConfig) = c.region
AWS.credentials(c::MinioConfig) = c.creds
AWS.check_credentials(c::SimpleCredentials) = c

function AWS.generate_service_url(aws::MinioConfig, service::String, resource::String)
    service == "s3" || throw(ArgumentError("Can only handle s3 requests to Minio"))
    return string(aws.endpoint, resource)
end

AWS.global_aws_config(
    MinioConfig(
        "http://127.0.0.1:9000",
        ENV["MINIO_REGION_NAME"],
        SimpleCredentials(ENV["MINIO_ACCESS_KEY"], ENV["MINIO_SECRET_KEY"], ""),
    ),
)
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
    objs_prefix = S3.list_objects_v2("anewbucket", Dict("prefix" => "", "delimiter" => "/"))
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

            response = S3.get_object("anewbucket", file_name)
            @test isopen(response.io)

            stream = Base.BufferStream()
            S3.get_object("anewbucket", file_name, Dict("response_stream" => stream))
            @test isopen(stream)
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

            response = S3.get_object(bucket_name, file_name)
            @test response.body == expected

            @test response.io isa IOBuffer
            @test isopen(response.io)

            seekstart(response.io)
            @test read(response.io) == expected
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
