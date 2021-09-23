@testset "service module" begin
    @service S3
    @test :S3 in names(Main)
end

@testset "global config, kwargs" begin
    try
        region = "us-east-2"
        AWS.global_aws_config(; region=region)

        @test AWS.global_aws_config().region == region
    finally
        AWS.aws_config[] = AWSConfig()
    end
end

@testset "set global aws config" begin
    test_region = "test region"
    expected = AWSConfig(; region=test_region)

    try
        AWS.global_aws_config(expected)
        result = AWS.global_aws_config()

        @test result.region == test_region
    finally
        AWS.global_aws_config(AWSConfig())
    end
end

@testset "set user agent" begin
    old_user_agent = AWS.user_agent[]
    new_user_agent = "new user agent"

    try
        @test AWS.user_agent[] == "AWS.jl/1.0.0"
        set_user_agent(new_user_agent)
        @test AWS.user_agent[] == new_user_agent
    finally
        set_user_agent(old_user_agent)
    end
end

@testset "sign" begin
    aws = AWS.AWSConfig(; region="us-east-1")

    access_key = "access-key"
    secret_key = "ssh... it is a secret"

    aws.credentials.access_key_id = access_key
    aws.credentials.secret_key = secret_key

    time = DateTime(2020)
    date = Dates.format(time, dateformat"yyyymmdd")

    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        headers=LittleDict(
            "Host" => "s3.us-east-1.amazonaws.com", "User-Agent" => "AWS.jl/1.0.0"
        ),
        resource="/test-resource",
        url="https://s3.us-east-1.amazonaws.com/test-resource",
    )

    @testset "sign v2" begin
        result = AWS.sign_aws2!(aws, request, time)
        content = result.content
        content_type = result.headers["Content-Type"]

        expected_access_key = "AWSAccessKeyId=$access_key"
        expected_expires = "Expires=2020-01-01T00%3A02%3A00Z"
        expected_signature_method = "SignatureMethod=HmacSHA256"
        expected_signature_version = "SignatureVersion=2"
        expected_signature = "Signature=O0MLzMKpEcfVZeHy0tyxVAuZF%2BvrvbgIGgqbWtJLTQ0%3D"

        expected_content = join(
            [
                expected_access_key,
                expected_expires,
                expected_signature_method,
                expected_signature_version,
                expected_signature,
            ],
            '&',
        )

        @test content == expected_content
    end

    @testset "sign v4" begin
        expected_x_amz_content_sha256 = bytes2hex(digest(MD_SHA256, request.content))
        expected_content_md5 = base64encode(digest(MD_MD5, request.content))
        expected_x_amz_date = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

        result = AWS.sign_aws4!(aws, request, time)
        headers = result.headers

        @test headers["x-amz-content-sha256"] == expected_x_amz_content_sha256
        @test headers["Content-MD5"] == expected_content_md5
        @test headers["x-amz-date"] == expected_x_amz_date

        authorization_header = split(headers["Authorization"], ' ')
        @test length(authorization_header) == 4
        @test authorization_header[1] == "AWS4-HMAC-SHA256"
        @test authorization_header[2] ==
              "Credential=$access_key/$date/us-east-1/$(request.service)/aws4_request,"
        @test authorization_header[3] ==
              "SignedHeaders=content-md5;content-type;host;user-agent;x-amz-content-sha256;x-amz-date,"
        @test authorization_header[4] ==
              "Signature=0f292eaf0b66cf353bafcb1b9b6d90ee27064236a60f17f6fc5bd7d40173a0be"
    end
end

@testset "submit_request" begin
    aws = AWS.AWSConfig()

    function _expected_xml(body::AbstractString, dict_type::Type)
        parsed = parse_xml(body)
        return xml_dict(XMLDict.root(parsed.x), dict_type)
    end

    @testset "301 redirect" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="HEAD",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )
        apply(Patches._aws_http_request_patch(Patches._response(; status=301))) do
            @test_throws AWSException AWS.submit_request(aws, request)
        end
    end

    @testset "HEAD response" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="HEAD",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        response = apply(Patches._aws_http_request_patch()) do
            AWS.submit_request(aws, request)
        end

        # Access to response headers
        @test response.response.headers == Patches.headers
        @test response.response.headers isa Vector

        # Access to streaming content
        @test response.io isa IO

        # Content as a string
        @test String(take!(response.io)) == Patches.body

        # Backwards compatibility with those expecting an `HTTP.Response`
        @test response.headers == Patches.headers
        @test response.headers isa Vector
        @test String(response.body) == Patches.body
    end

    @testset "GET response" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        response = apply(Patches._aws_http_request_patch()) do
            AWS.submit_request(aws, request)
        end

        # Access to response headers
        @test response.response.headers == Patches.headers
        @test response.response.headers isa Vector

        # Access to streaming content
        @test response.io isa IO

        # Content as a string
        @test String(take!(response.io)) == Patches.body

        # Backwards compatibility with those expecting an `HTTP.Response`
        @test response.headers == Patches.headers
        @test response.headers isa Vector
        @test String(response.body) == Patches.body
    end

    @testset "Not authorized" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        message = "User is not authorized to perform: action on resource with an explicit deny"
        body = "{\"__type\":\"AccessDeniedException\",\"Message\":\"$message\"}"
        headers = [
            "Content-Type" => "application/x-amz-json-1.1",
            "Content-Length" => string(sizeof(body)),
        ]

        # Simulate the HTTP.request behaviour with a HTTP 400 response
        patches = [
            @patch function HTTP.request(
                args...; status_exception=true, response_stream=nothing, kwargs...
            )
                request = HTTP.Request("GET", "/")

                if response_stream !== nothing
                    write(response_stream, body)
                    close(response_stream)  # Simulating current HTTP.jl 0.9.14 behaviour
                    body = AWS.AWSExceptions.BODY_STREAMED_PLACEHOLDER
                end

                response = HTTP.Response(400, headers; body=body, request=request)
                exception = HTTP.StatusError(400, response)
                return !status_exception ? response : throw(exception)
            end
            @patch function Downloads.request(args...; output=nothing, kwargs...)
                if output !== nothing
                    write(output, body)
                end

                return Downloads.Response(
                    "https",
                    "https://region.amazonaws.com/",
                    400,
                    "HTTP/1.1 400 Bad Request",
                    headers,
                )
            end
        ]

        exception = apply(patches) do
            try
                AWS.submit_request(aws, request)
                return nothing
            catch e
                if e isa AWSException
                    return e
                else
                    rethrow()
                end
            end
        end

        @test exception isa AWSException

        # If handled incorrectly using a `response_stream` may result in the body data being
        # lost. Mainly, this is a problem when using a temporary I/O stream instead of
        # writing directly to the `response_stream`.
        @test exception.message == message
    end

    @testset "read MIME-type" begin
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
            use_response_type=true,
        )

        @testset "invalid content type" begin
            headers = Pair["Content-Type" => ""]
            body = ""
            expected_body_type = Vector{UInt8}
            expected_body = b""

            r = Patches._response(; headers=headers, body=body)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "text/xml" begin
            headers = Pair["Content-Type" => "text/xml"]
            expected_body_type = OrderedDict{Union{String,Symbol},Any}
            expected_body = _expected_xml(Patches.body, expected_body_type)

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "application/xml" begin
            headers = Pair["Content-Type" => "application/xml"]
            expected_body_type = OrderedDict{Union{String,Symbol},Any}
            expected_body = _expected_xml(Patches.body, expected_body_type)

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "application/json" begin
            headers = ["Content-Type" => "application/json"]
            body = JSON.json(
                Dict{String,Any}(
                    "Marker" => nothing,
                    "VaultList" => Any[Dict{String,Any}(
                        "VaultName" => "test",
                        "SizeInBytes" => 0,
                        "NumberOfArchives" => 0,
                        "CreationDate" => "2020-06-22T03:14:41.754Z",
                        "VaultARN" => "arn:aws:glacier:us-east-1:000:vaults/test",
                        "LastInventoryDate" => nothing,
                    )],
                ),
            )

            expected_body_type = OrderedDict{String,Any}
            expected_body = JSON.parse(body; dicttype=expected_body_type)

            r = Patches._response(; body=body, headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa expected_body_type
            @test content == expected_body
        end

        @testset "text/html" begin
            headers = ["Content-Type" => "text/html"]
            expected_body = Patches.body

            r = Patches._response(; headers=headers)
            response = apply(Patches._aws_http_request_patch(r)) do
                AWS.submit_request(aws, request)
            end

            content = parse(response)
            @test content isa String
            @test content == expected_body
        end
    end
end

struct TestBackend <: AWS.AbstractBackend
    param::Int
end

function AWS._http_request(backend::TestBackend, ::AWS.Request, ::IO)
    return backend.param
end

@testset "HTTPBackend" begin
    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        backend=AWS.HTTPBackend(),
    )
    io = IOBuffer()

    apply(Patches._http_options_patches) do
        # No default options
        @test isempty(AWS._http_request(request.backend, request, io))

        # We can pass HTTP options via the backend
        custom_backend = AWS.HTTPBackend(Dict(:connection_limit => 5))
        @test custom_backend isa AWS.AbstractBackend
        @test AWS._http_request(custom_backend, request, io) == Dict(:connection_limit => 5)

        # We can pass options per-request
        request.http_options = Dict(:pipeline_limit => 20)
        @test AWS._http_request(request.backend, request, io) == Dict(:pipeline_limit => 20)
        @test AWS._http_request(custom_backend, request, io) ==
              Dict(:pipeline_limit => 20, :connection_limit => 5)

        # per-request options override backend options:
        custom_backend = AWS.HTTPBackend(Dict(:pipeline_limit => 5))
        @test AWS._http_request(custom_backend, request, io) == Dict(:pipeline_limit => 20)
    end

    request.backend = TestBackend(2)
    @test AWS._http_request(request.backend, request, io) == 2

    request = Request(;
        service="s3",
        api_version="api_version",
        request_method="GET",
        url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        backend=TestBackend(4),
    )
    @test AWS._http_request(request.backend, request, io) == 4

    # Let's test setting the default backend
    prev_backend = AWS.DEFAULT_BACKEND[]
    try
        AWS.DEFAULT_BACKEND[] = TestBackend(3)
        request = Request(;
            service="s3",
            api_version="api_version",
            request_method="GET",
            url="https://s3.us-east-1.amazonaws.com/sample-bucket",
        )
        @test AWS._http_request(request.backend, request, io) == 3
    finally
        AWS.DEFAULT_BACKEND[] = prev_backend
    end
end

@testset "_generate_rest_resource" begin
    request_uri = "/{Bucket}/{Key+}"
    args = Dict{String,Any}("Bucket" => "aws.jl-test", "Key" => "Test-Key")

    expected = "/$(args["Bucket"])/$(args["Key"])"
    result = AWS._generate_rest_resource(request_uri, args)
    @test result == expected
end

@testset "generate_service_url" begin
    region = "us-east-2"
    resource = "/aws.jl-test---timestamp"
    config = AWSConfig()
    config.region = region

    request = Request(;
        service="service",
        api_version="api_version",
        request_method="GET",
        resource=resource,
    )

    @testset "regionless endpoints" for regionless_endpoint in ("iam", "route53")
        endpoint = "sdb"
        request.service = regionless_endpoint
        expected_result = "https://$regionless_endpoint.amazonaws.com$resource"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end

    @testset "region service" begin
        endpoint = "sdb"
        request.service = endpoint
        expected_result = "https://$endpoint.$region.amazonaws.com$resource"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end

    @testset "sdb -- us-east-1 region exception" begin
        endpoint = "sdb"
        request.service = endpoint
        expected_result = "https://$endpoint.amazonaws.com$resource"
        config.region = "us-east-1"
        result = AWS.generate_service_url(config, request.service, request.resource)

        @test result == expected_result
    end
end

@testset "_flatten_query" begin
    high_level_value = "high_level_value"
    entry_1 = LittleDict(
        "low_level_key_1" => "low_level_value_1", "low_level_key_2" => "low_level_value_2"
    )
    entry_2 = LittleDict(
        "low_level_key_3" => "low_level_value_3", "low_level_key_4" => "low_level_value_4"
    )

    args = LittleDict(
        "high_level_key" => high_level_value, "high_level_array" => [entry_1, entry_2]
    )

    @testset "non-special case suffix" begin
        service = "sts"
        result = AWS._flatten_query(service, args)

        expected = Pair{String,String}[
            "high_level_key" => "high_level_value",
            "high_level_array.member.1.low_level_key_1" => "low_level_value_1",
            "high_level_array.member.1.low_level_key_2" => "low_level_value_2",
            "high_level_array.member.2.low_level_key_3" => "low_level_value_3",
            "high_level_array.member.2.low_level_key_4" => "low_level_value_4",
        ]

        @test result == expected
    end

    @testset "sqs - special casing suffix" begin
        service = "sqs"
        result = AWS._flatten_query(service, args)

        expected = Pair{String,String}[
            "high_level_key" => "high_level_value",
            "high_level_array.1.low_level_key_1" => "low_level_value_1",
            "high_level_array.1.low_level_key_2" => "low_level_value_2",
            "high_level_array.2.low_level_key_3" => "low_level_value_3",
            "high_level_array.2.low_level_key_4" => "low_level_value_4",
        ]

        @test result == expected
    end
end

@testset "_clean_s3_uri" begin
    uri = "/test-bucket/*)=('! +@,:.txt?list-objects=v2"
    expected_uri = "/test-bucket/%2A%29%3D%28%27%21%20%2B%40%2C%3A.txt?list-objects=v2"
    @test AWS._clean_s3_uri(uri) == expected_uri

    # make sure that other parts of the uri aren't changed by `_clean_s3_uri`
    for uri in (
        "https://julialang.org",
        "http://julialang.org",
        "http://julialang.org:8080",
        "/onlypath",
        "/path?query=  +99",
        "/anchor?query=yes#anchor1",
    )
        @test AWS._clean_s3_uri(uri) == uri
    end
end

@testset "STS" begin
    @testset "high-level" begin
        @service STS

        response = STS.get_caller_identity()
        d = response["GetCallerIdentityResult"]

        @test Set(keys(d)) == Set(["Arn", "UserId", "Account"])
        @test occursin(r"^arn:aws:(iam|sts):", d["Arn"])
        @test all(isdigit, d["Account"])
    end

    @testset "low-level" begin
        response = AWSServices.sts("GetCallerIdentity")
        d = response["GetCallerIdentityResult"]

        @test Set(keys(d)) == Set(["Arn", "UserId", "Account"])
        @test occursin(r"^arn:aws:(iam|sts):", d["Arn"])
        @test all(isdigit, d["Account"])
    end
end

@testset "json" begin
    @testset "high-level secrets manager" begin
        @service Secrets_Manager

        secret_name = "aws-jl-test---" * _now_formatted()
        secret_string = "sshhh it is a secret!"

        function _get_secret_string(secret_name)
            response = Secrets_Manager.get_secret_value(secret_name)

            return response["SecretString"]
        end

        Secrets_Manager.create_secret(
            secret_name,
            LittleDict(
                "SecretString" => secret_string, "ClientRequestToken" => string(uuid4())
            ),
        )

        try
            @test _get_secret_string(secret_name) == secret_string
        finally
            Secrets_Manager.delete_secret(
                secret_name, LittleDict("ForceDeleteWithoutRecovery" => "true")
            )
        end

        @test_throws AWSException _get_secret_string(secret_name)
    end

    @testset "low-level secrets manager" begin
        secret_name = "aws-jl-test---" * _now_formatted()
        secret_string = "sshhh it is a secret!"

        function _get_secret_string(secret_name)
            response = AWSServices.secrets_manager(
                "GetSecretValue", LittleDict("SecretId" => secret_name)
            )

            return response["SecretString"]
        end

        resp = AWSServices.secrets_manager(
            "CreateSecret",
            LittleDict(
                "Name" => secret_name,
                "SecretString" => secret_string,
                "ClientRequestToken" => string(uuid4()),
            ),
        )

        try
            @test _get_secret_string(secret_name) == secret_string
        finally
            AWSServices.secrets_manager(
                "DeleteSecret",
                LittleDict(
                    "SecretId" => secret_name, "ForceDeleteWithoutRecovery" => "true"
                ),
            )
        end

        @test_throws AWSException _get_secret_string(secret_name)
    end
end

@testset "query" begin
    @testset "high-level iam" begin
        @service IAM

        policy_arn = ""
        expected_policy_name = "aws-jl-test---" * _now_formatted()
        expected_policy_document = LittleDict(
            "Version" => "2012-10-17",
            "Statement" => [
                LittleDict(
                    "Effect" => "Allow",
                    "Action" => ["s3:Get*", "s3:List*"],
                    "Resource" => ["arn:aws:s3:::my-bucket/shared/*"],
                ),
            ],
        )
        expected_policy_document = JSON.json(expected_policy_document)

        response = IAM.create_policy(expected_policy_document, expected_policy_name)
        policy_arn = response["CreatePolicyResult"]["Policy"]["Arn"]

        try
            response_policy_version = IAM.get_policy_version(policy_arn, "v1")
            response_document = response_policy_version["GetPolicyVersionResult"]["PolicyVersion"]["Document"]
            @test HTTP.unescapeuri(response_document) == expected_policy_document
        finally
            IAM.delete_policy(policy_arn)
        end

        @test_throws AWSException IAM.get_policy(policy_arn)
    end

    @testset "low-level iam" begin
        policy_arn = ""
        expected_policy_name = "aws-jl-test---" * _now_formatted()
        expected_policy_document = LittleDict(
            "Version" => "2012-10-17",
            "Statement" => [
                LittleDict(
                    "Effect" => "Allow",
                    "Action" => ["s3:Get*", "s3:List*"],
                    "Resource" => ["arn:aws:s3:::my-bucket/shared/*"],
                ),
            ],
        )
        expected_policy_document = JSON.json(expected_policy_document)

        response = AWSServices.iam(
            "CreatePolicy",
            LittleDict(
                "PolicyName" => expected_policy_name,
                "PolicyDocument" => expected_policy_document,
            ),
        )
        policy_arn = response["CreatePolicyResult"]["Policy"]["Arn"]

        try
            response_policy_version = AWSServices.iam(
                "GetPolicyVersion",
                LittleDict("PolicyArn" => policy_arn, "VersionId" => "v1"),
            )
            response_document = response_policy_version["GetPolicyVersionResult"]["PolicyVersion"]["Document"]
            @test HTTP.unescapeuri(response_document) == expected_policy_document
        finally
            AWSServices.iam("DeletePolicy", LittleDict("PolicyArn" => policy_arn))
        end

        @test_throws AWSException AWSServices.iam(
            "GetPolicy", LittleDict("PolicyArn" => policy_arn)
        )
    end

    @testset "high-level sqs" begin
        @service SQS

        queue_name = "aws-jl-test---" * _now_formatted()
        expected_message = "Hello for AWS.jl"

        function _get_queue_url(queue_name)
            result = SQS.get_queue_url(queue_name)

            return result["GetQueueUrlResult"]["QueueUrl"]
        end

        # Create Queue
        SQS.create_queue(queue_name)
        queue_url = _get_queue_url(queue_name)

        try
            # Get Queues
            @test !isempty(queue_url)

            # Change Message Visibility Batch Request
            expected_message_id = "aws-jl-test"

            SQS.send_message(expected_message, queue_url)

            response = SQS.receive_message(queue_url)
            receipt_handle = response["ReceiveMessageResult"]["Message"]["ReceiptHandle"]

            response = SQS.delete_message_batch(
                [
                    LittleDict(
                        "Id" => expected_message_id, "ReceiptHandle" => receipt_handle
                    ),
                ],
                queue_url,
            )

            message_id = response["DeleteMessageBatchResult"]["DeleteMessageBatchResultEntry"]["Id"]
            @test message_id == expected_message_id

            SQS.send_message(expected_message, queue_url)

            result = SQS.receive_message(queue_url)
            message = result["ReceiveMessageResult"]["Message"]["Body"]
            @test message == expected_message
        finally
            SQS.delete_queue(queue_url)
        end

        @test_throws AWSException _get_queue_url(queue_name)
    end

    @testset "low-level sqs" begin
        queue_name = "aws-jl-test---" * _now_formatted()
        expected_message = "Hello for AWS.jl"

        function _get_queue_url(queue_name)
            result = AWSServices.sqs("GetQueueUrl", LittleDict("QueueName" => queue_name))

            return result["GetQueueUrlResult"]["QueueUrl"]
        end

        # Create Queue
        AWSServices.sqs("CreateQueue", LittleDict("QueueName" => queue_name))

        queue_url = _get_queue_url(queue_name)
        @test !isempty(queue_url)

        try
            # Change Message Visibility Batch Request
            expected_message_id = "aws-jl-test"

            AWSServices.sqs(
                "SendMessage",
                LittleDict("QueueUrl" => queue_url, "MessageBody" => expected_message),
            )

            response = AWSServices.sqs(
                "ReceiveMessage", LittleDict("QueueUrl" => queue_url)
            )
            receipt_handle = response["ReceiveMessageResult"]["Message"]["ReceiptHandle"]

            response = AWSServices.sqs(
                "DeleteMessageBatch",
                LittleDict(
                    "QueueUrl" => queue_url,
                    "DeleteMessageBatchRequestEntry" => [
                        LittleDict(
                            "Id" => expected_message_id,
                            "ReceiptHandle" => receipt_handle,
                        ),
                    ],
                ),
            )

            message_id = response["DeleteMessageBatchResult"]["DeleteMessageBatchResultEntry"]["Id"]
            @test message_id == expected_message_id

            # Send message
            AWSServices.sqs(
                "SendMessage",
                LittleDict("QueueUrl" => queue_url, "MessageBody" => expected_message),
            )

            # Receive Message
            result = AWSServices.sqs("ReceiveMessage", LittleDict("QueueUrl" => queue_url))
            message = result["ReceiveMessageResult"]["Message"]["Body"]
            @test message == expected_message
        finally
            AWSServices.sqs("DeleteQueue", LittleDict("QueueUrl" => queue_url))
        end

        @test_throws AWSException _get_queue_url(queue_name)
    end
end

@testset "rest-xml" begin
    @testset "high-level s3" begin
        @service S3

        bucket_name = "aws-jl-test---" * _now_formatted()
        file_name = string(uuid4())

        function _bucket_exists(bucket_name)
            try
                S3.head_bucket(bucket_name)
                return true
            catch e
                if e isa AWSException && e.cause.status == 404
                    return false
                else
                    rethrow(e)
                end
            end
        end

        # HEAD operation
        @test _bucket_exists(bucket_name) == false

        # PUT operation
        S3.create_bucket(bucket_name)
        @test _bucket_exists(bucket_name)

        try
            # PUT with parameters operation
            body = "sample-file-body"
            S3.put_object(bucket_name, file_name, Dict("body" => body))
            @test !isempty(S3.get_object(bucket_name, file_name))

            # GET operation
            result = S3.list_objects(bucket_name)
            @test result["Contents"]["Key"] == file_name

            # GET with parameters operation
            max_keys = 1
            result = S3.list_objects(bucket_name, Dict("max_keys" => max_keys))
            @test length([result["Contents"]]) == max_keys

            # GET with an IO target
            mktemp() do f, io
                S3.get_object(bucket_name, file_name, Dict("response_stream" => io))
                flush(io)
                @test read(f, String) == body
            end
        finally
            # DELETE with parameters operation
            S3.delete_object(bucket_name, file_name)
            @test_throws AWSException S3.get_object(bucket_name, file_name)

            # DELETE operation
            S3.delete_bucket(bucket_name)

            sleep(2)
        end

        @test _bucket_exists(bucket_name) == false
    end

    @testset "low-level s3" begin
        bucket_name = "aws-jl-test---" * _now_formatted()
        file_name = "*)=('! +@,:.txt"  # Special characters which S3 allows

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

        # HEAD operation
        @test _bucket_exists(bucket_name) == false

        # PUT operation
        AWSServices.s3("PUT", "/$bucket_name")
        @test _bucket_exists(bucket_name)

        try
            # PUT with parameters operation
            body = Array{UInt8}("sample-file-body")
            AWSServices.s3("PUT", "/$bucket_name/$file_name", Dict("body" => body))
            @test AWSServices.s3("GET", "/$bucket_name/$file_name").body == body

            # GET operation
            result = AWSServices.s3("GET", "/$bucket_name")
            @test result["Contents"]["Key"] == file_name

            # GET with parameters operation
            max_keys = 1
            result = AWSServices.s3("GET", "/$bucket_name", Dict("max_keys" => max_keys))
            @test length([result["Contents"]]) == max_keys

            # POST with parameters operation
            body = """
                <Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
                    <Object>
                        <Key>$file_name</Key>
                    </Object>
                </Delete>
                """

            AWSServices.s3("POST", "/$bucket_name?delete", Dict("body" => body))
            @test_throws AWSException AWSServices.s3("GET", "/$bucket_name/$file_name")
        finally
            # DELETE operation
            AWSServices.s3("DELETE", "/$bucket_name")

            sleep(2)
        end

        @test _bucket_exists(bucket_name) == false
    end
end

@testset "rest-json" begin
    @testset "high-level glacier" begin
        @service Glacier

        timestamp = _now_formatted()
        vault_names = ["aws-jl-test-01---$timestamp", "aws-jl-test-02---$timestamp"]

        # PUT
        for vault in vault_names
            Glacier.create_vault("-", vault)
        end

        try
            # POST
            tags = Dict("Tags" => LittleDict("Tag-01" => "Tag-01", "Tag-02" => "Tag-02"))

            for vault in vault_names
                Glacier.add_tags_to_vault("-", vault, tags)
            end

            for vault in vault_names
                result_tags = Dict(Glacier.list_tags_for_vault("-", vault))
                @test result_tags == tags
            end

            # GET
            # If this is an Integer AWS Coral cannot convert it to a String
            # "class com.amazon.coral.value.json.numbers.TruncatingBigNumber can not be converted to an String"
            limit = "1"
            args = LittleDict("limit" => limit)
            result = Glacier.list_vaults("-", args)
            @test length(result["VaultList"]) == parse(Int, limit)
        finally
            # DELETE
            for vault in vault_names
                Glacier.delete_vault("-", vault)
            end
        end

        result = Glacier.list_vaults("-")
        res_vault_names = [v["VaultName"] for v in result["VaultList"]]

        for vault in vault_names
            @test !(vault in res_vault_names)
        end
    end

    @testset "low-level glacier" begin
        timestamp = _now_formatted()
        vault_names = ["aws-jl-test-01---$timestamp", "aws-jl-test-02---$timestamp"]

        # PUT
        for vault in vault_names
            AWSServices.glacier("PUT", "/-/vaults/$vault")
        end

        try
            # POST
            tags = Dict("Tags" => LittleDict("Tag-01" => "Tag-01", "Tag-02" => "Tag-02"))

            for vault in vault_names
                AWSServices.glacier("POST", "/-/vaults/$vault/tags?operation=add", tags)
            end

            for vault in vault_names
                result_tags = Dict(AWSServices.glacier("GET", "/-/vaults/$vault/tags"))

                @test result_tags == tags
            end

            # GET
            # If this is an Integer AWS Coral cannot convert it to a String
            # "class com.amazon.coral.value.json.numbers.TruncatingBigNumber can not be converted to an String"
            limit = "1"
            params = LittleDict("limit" => limit)
            result = AWSServices.glacier("GET", "/-/vaults/", params)

            @test length(result["VaultList"]) == parse(Int, limit)
        finally
            # DELETE
            for vault in vault_names
                AWSServices.glacier("DELETE", "/-/vaults/$vault")
            end
        end

        result = AWSServices.glacier("GET", "/-/vaults")
        res_vault_names = [v["VaultName"] for v in result["VaultList"]]

        for vault in vault_names
            @test !(vault in res_vault_names)
        end
    end
end
