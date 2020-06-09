@testset "service module" begin
    @service S3
    @test :S3 in names(Main)
end

@testset "rest-xml" begin
    bucket_name = "aws.jl-test---" * lowercase(Dates.format(now(Dates.UTC), "yyyymmddTHHMMSSZ"))
    file_name = string(uuid4())

    function _bucket_exists(bucket_name)
        try
            AWSServices.s3("HEAD", "/$bucket_name")
            return true
        catch e
            if e isa AWSException && e.cause.status == 404
                return false
            else
                rethrow(e)
            end
        end
    end

    @testset "HEAD" begin
        @test _bucket_exists(bucket_name) == false
    end

    @testset "PUT" begin
        AWSServices.s3("PUT", "/$bucket_name")

        @test _bucket_exists(bucket_name)
    end

    @testset "PUT - w/ Params" begin
        body = "sample-file-body"
        AWSServices.s3("PUT", "/$bucket_name/$file_name"; Body=body)

        @test !isempty(AWSServices.s3("GET", "/$bucket_name/$file_name"))
    end

    @testset "GET" begin
        result = AWSServices.s3("GET", "/$bucket_name")
        @test file_name == result["ListBucketResult"]["Contents"]["Key"]
    end

    @testset "GET - w/ Params" begin
        max_keys = 1
        result = AWSServices.s3("GET", "/$bucket_name"; max_keys=max_keys)

        @test max_keys == length([result["ListBucketResult"]["Contents"]])
    end

    @testset "POST - w/ Params" begin
        AWSServices.s3("POST", "/$bucket_name?delete"; Body="""
            <Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
                <Object>
                    <Key>$file_name</Key>
                </Object>
            </Delete>
        """
        )

        try
            AWSServices.s3("GET", "/$bucket_name/$file_name")
            @test false
        catch e
            if e isa AWSException && e.code == "NoSuchKey"
                @test true
            else
                rethrow(e)
            end
        end
    end

    @testset "DELETE" begin
        AWSServices.s3("DELETE", "/$bucket_name")

        sleep(2)
        @test _bucket_exists(bucket_name) == false
    end
end

@testset "User Agent" begin
    new_user_agent = "new user agent"

    @test AWS.user_agent == "AWS.jl/1.0.0"
    set_user_agent(new_user_agent)
    @test AWS.user_agent == new_user_agent
end