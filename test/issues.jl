@service S3

bucket_name = "aws-jl-test-issues---" * _now_formatted()
S3.create_bucket(bucket_name)

@testset "issue 223" begin
    # https://github.com/JuliaCloud/AWS.jl/issues/223
    body = "Hello World!"
    file_name = "contains spaces"

    try
        S3.put_object(bucket_name, file_name, Dict("body" => body))
        resp = S3.get_object(bucket_name, file_name)

        @test String(resp) == body
    finally
        S3.delete_object(bucket_name, file_name)
        S3.delete_bucket(bucket_name)
    end
end

@testset "issue 227" begin
    @testset "s3 public bucket" begin
        # https://github.com/JuliaCloud/AWS.jl/issues/227
        config = AWSConfig(creds=nothing)
        resp = S3.get_object("www.invenia.ca", "index.html"; aws_config=config)

        @test !isempty(resp)
    end

    @testset "s3 private bucket" begin
        bucket_name = "aws-jl-test-issues---" * _now_formatted()
        file_name = "hello_world"

        try
            S3.create_bucket(bucket_name)
            S3.put_object(bucket_name, file_name)

            @test_throws AWSException S3.get_object(bucket_name, file_name; aws_config=AWSConfig(creds=nothing))
        finally
            S3.delete_object(bucket_name, file_name)
            S3.delete_bucket(bucket_name)
        end
    end

    @testset "lambda" begin
        @service Lambda

        @test_throws AWSException Lambda.list_functions(;aws_config=AWSConfig(creds=nothing))
    end
end
