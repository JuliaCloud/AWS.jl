@service S3

bucket_name = "aws-jl-test-issues---" * _now_formatted()
S3.create_bucket(bucket_name)

@testset "issue 223" begin
    # https://github.com/JuliaCloud/AWS.jl/issues/223
    body = "Hello World!"
    file_name = "contains spaces"
    S3.put_object(bucket_name, file_name, Dict("body" => body))

    resp = S3.get_object(bucket_name, file_name)

    @test String(resp) == body
end