@testset "service module" begin
    @service S3
    @test :S3 in names(Main)
end

@testset "User Agent" begin
    new_user_agent = "new user agent"

    @test AWS.user_agent == "AWS.jl/1.0.0"
    set_user_agent(new_user_agent)
    @test AWS.user_agent == new_user_agent
end

@testset "sign" begin
    aws = AWS.AWSConfig()

    access_key = "access-key"
    secret_key = "ssh... it is a secret"

    aws.credentials.access_key_id = access_key
    aws.credentials.secret_key = secret_key

    time = DateTime(2020)
    date = Dates.format(time, "yyyymmdd")

    request = LittleDict(
        :service => "s3",
        :version => "2006-03-01",
        :request_method => "HEAD",
        :headers => Dict(
            "Host" => "s3.us-east-1.amazonaws.com",
            "User-Agent" => "AWS.jl/1.0.0"
        ),
        :content => "",
        :resource => "/test-resource",
        :url => "https://s3.us-east-1.amazonaws.com/test-resource"
    )

    @testset "sign v2" begin
        result = AWS._sign_aws2!(aws, request, time)
        content = result[:content]
        content_type = result[:headers]["Content-Type"]

        expected_access_key = "AWSAccessKeyId=$access_key"
        expected_expires = "Expires=2020-01-01T00%3A02%3A00Z"
        expected_signature_method = "SignatureMethod=HmacSHA256"
        expected_signature_version = "SignatureVersion=2"
        expected_signature = "Signature=O0MLzMKpEcfVZeHy0tyxVAuZF%2BvrvbgIGgqbWtJLTQ0%3D"

        expected_content = join([
            expected_access_key,
            expected_expires,
            expected_signature_method,
            expected_signature_version,
            expected_signature
        ], '&')

        @test expected_content == content
    end

    @testset "sign v4" begin
        expected_x_amz_content_sha256 = bytes2hex(digest(MD_SHA256, request[:content]))
        expected_content_md5 = base64encode(digest(MD_MD5, request[:content]))
        expected_x_amz_date = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

        result = AWS._sign_aws4!(aws, request, time)
        headers = result[:headers]

        @test headers["x-amz-content-sha256"] == expected_x_amz_content_sha256
        @test headers["Content-MD5"] == expected_content_md5
        @test headers["x-amz-date"] == expected_x_amz_date

        authorization_header = split(headers["Authorization"], ' ')
        @test authorization_header[1] == "AWS4-HMAC-SHA256"
        @test authorization_header[2] == "Credential=$access_key/$date/us-east-1/$(request[:service])/aws4_request,"
        @test authorization_header[3] == "SignedHeaders=content-md5;content-type;host;user-agent;x-amz-content-sha256;x-amz-date,"
        @test authorization_header[4] == "Signature=c30f329e4e7090dadfa91f14cbdc45a4a842878b03724c4fda7d5274b239293a"
    end
end

@testset "do_request" begin
    aws = AWS.AWSConfig()

    @testset "HEAD request method" begin
        request = LittleDict{Symbol, Union{String, Dict}}(
            :content => "",
            :request_method => "HEAD",
            :service => "s3",
            :url => "https://s3.us-east-1.amazonaws.com/sample-bucket",
        )

        apply(Patches._http_request_patch) do
            Patches._response!()
            result = AWS.do_request(aws, request)

            @test Dict(Patches.headers) == result
        end
    end

    @testset "return stream" begin
        request = LittleDict(
            :content => "",
            :return_stream => true,
            :response_stream => "Response Stream",
            :request_method => "GET",
            :service => "s3",
            :url => "https://s3.us-east-1.amazonaws.com/sample-bucket"
        )

        apply(Patches._http_request_patch) do
            Patches._response!()
            result = AWS.do_request(aws, request)

            @test request[:response_stream] == result
        end
    end

    @testset "return raw" begin
        request = LittleDict(
            :content => "",
            :return_raw => true,
            :request_method => "GET",
            :service => "s3",
            :url => "https://s3.us-east-1.amazonaws.com/sample-bucket"
        )

        @testset "body" begin
            apply(Patches._http_request_patch) do
                Patches._response!()
                result = AWS.do_request(aws, request)

                @test Patches.body == String(result)
            end
        end

        @testset "body and headers" begin
            apply(Patches._http_request_patch) do
                Patches._response!()
                body, headers = AWS.do_request(aws, request; return_headers=true)

                @test Patches.body == String(body)
                @test Patches.headers == headers
            end
        end
    end

    @testset "MIME" begin
        request = LittleDict{Symbol, Union{String, Dict}}(
            :content => "",
            :request_method => "GET",
            :service => "s3",
            :url => "https://s3.us-east-1.amazonaws.com/sample-bucket"
        )

        @testset "empty" begin
            apply(Patches._http_request_patch) do
                @testset "default" begin
                    expected_body = ""
                    expected_headers = Pair["Content-Type"=>"",]

                    Patches._response!(headers=expected_headers, body=expected_body)

                    @testset "body" begin
                       result = AWS.do_request(aws, request)

                       @test expected_body == String(result)
                    end

                    @testset "body and headers" begin
                        body, headers = AWS.do_request(aws, request; return_headers=true)

                        @test expected_body == String(body)
                        @test expected_headers == headers
                    end
                end

                @testset "text/xml" begin
                    expected_headers = Pair["Content-Type"=>"",]
                    expected_body_type = OrderedDict{Union{Symbol, String}, Any}
                    expected_body = xml_dict((Patches.body), expected_body_type)

                    Patches._response!(headers=expected_headers)

                    @testset "body" begin
                        result = AWS.do_request(aws, request)

                        @test typeof(result) == expected_body_type
                        @test result == expected_body
                    end

                    @testset "body and headers" begin
                        body, headers = AWS.do_request(aws, request; return_headers=true)

                        @test body == expected_body
                        @test typeof(body) == expected_body_type

                        @test headers == Dict(expected_headers)
                        @test typeof(headers) == Dict{SubString{String}, SubString{String}}
                    end
                end
            end
        end

        @testset "xml" begin
            request = LittleDict{Symbol, Union{String, Dict}}(
                :content => "",
                :request_method => "GET",
                :service => "s3",
                :url => "https://s3.us-east-1.amazonaws.com/sample-bucket"
            )

            expected_body_type = OrderedDict{Union{Symbol, String}, Any}
            expected_body = xml_dict((Patches.body), expected_body_type)
            expected_headers = Pair["Content-Type"=>"application/xml",]

            apply(Patches._http_request_patch) do
                Patches._response!(headers=expected_headers,)

                @testset "body" begin
                    result = AWS.do_request(aws, request)

                    @test typeof(result) == expected_body_type
                    @test result == expected_body
                end

                @testset "body and headers" begin
                    body, headers = AWS.do_request(aws, request; return_headers=true)

                    @test body == expected_body
                    @test typeof(body) == expected_body_type

                    @test headers == Dict(expected_headers)
                    @test typeof(headers) == Dict{SubString{String}, SubString{String}}
               end
            end
        end
    end
end

@testset "_generate_rest_resource" begin
    request_uri = "/{Bucket}/{Key+}"
    args = Dict{String, Any}(
        "Bucket"=>"aws.jl-test",
        "Key"=>"Test-Key"
    )

    expected = "/$(args["Bucket"])/$(args["Key"])"
    result = AWS._generate_rest_resource(request_uri, args)
    @test expected == result
end

@testset "_generate_service_url" begin
    region = "us-east-2"
    resource = "/aws.jl-test---timestamp"

    request = LittleDict(
        :resource=>resource,
        :service=>"service",
    )

    @testset "regionless endpoints" for regionless_endpoint in ["iam", "route53"]
        endpoint = "sdb"
        request[:endpoint] = regionless_endpoint
        expected_result = "https://$regionless_endpoint.amazonaws.com$resource"
        result = AWS._generate_service_url(region, request)

        @test expected_result == result
    end

    @testset "region service" begin
        endpoint = "sdb"
        request[:endpoint] = endpoint
        expected_result = "https://$endpoint.$region.amazonaws.com$resource"
        result = AWS._generate_service_url(region, request)

        @test expected_result == result
    end


    @testset "sdb -- us-east-1 region exception" begin
        endpoint = "sdb"
        request[:endpoint] = endpoint
        expected_result = "https://$endpoint.amazonaws.com$resource"
        region = "us-east-1"
        result = AWS._generate_service_url(region, request)

        @test expected_result == result
    end
end

@testset "_return_headers" begin
    @testset "key exists" begin
        expected = true
        dict = Dict{String, Any}("return_headers"=>true)
        result = AWS._return_headers(dict)

        @test expected == result
        @test isempty(dict)
    end

    @testset "key dne" begin
        expected = false
        result = AWS._return_headers(Dict{String, Any}())

        @test expected == result
    end
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
