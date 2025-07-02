@testset "query service" begin
    @testset "STS" begin
        @test AWSServices.sts isa AWS.QueryService

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

    @testset "IAM" begin
        @test AWSServices.iam isa AWS.QueryService

        @testset "high-level" begin
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

        @testset "low-level" begin
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
    end

    @testset "SQS" begin
        @test AWSServices.sqs isa AWS.QueryService

        @testset "high-level" begin
            @service SQS

            queue_name = "aws-jl-test---" * _now_formatted()
            expected_message = "Hello for AWS.jl"

            function _get_queue_url(queue_name)
                result = SQS.get_queue_url(queue_name)

                return result["QueueUrl"]
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
                receipt_handle = only(response["Messages"])["ReceiptHandle"]

                response = SQS.delete_message_batch(
                    [
                        LittleDict(
                            "Id" => expected_message_id, "ReceiptHandle" => receipt_handle
                        ),
                    ],
                    queue_url,
                )

                message_id = only(response["Successful"])["Id"]
                @test message_id == expected_message_id

                SQS.send_message(expected_message, queue_url)

                result = SQS.receive_message(queue_url)
                message = only(result["Messages"])["Body"]
                @test message == expected_message
            finally
                SQS.delete_queue(queue_url)
            end

            @test_throws AWSException _get_queue_url(queue_name)
        end

        @testset "low-level" begin
            queue_name = "aws-jl-test---" * _now_formatted()
            expected_message = "Hello for AWS.jl"

            function _get_queue_url(queue_name)
                result = AWSServices.sqs("GetQueueUrl", LittleDict("QueueName" => queue_name))

                return result["QueueUrl"]
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
                receipt_handle = only(response["Messages"])["ReceiptHandle"]

                response = AWSServices.sqs(
                    "DeleteMessageBatch",
                    LittleDict(
                        "QueueUrl" => queue_url,
                        "Entries" => [
                            LittleDict(
                                "Id" => expected_message_id,
                                "ReceiptHandle" => receipt_handle,
                            ),
                        ],
                    ),
                )

                message_id = only(response["Successful"])["Id"]
                @test message_id == expected_message_id

                # Send message
                AWSServices.sqs(
                    "SendMessage",
                    LittleDict("QueueUrl" => queue_url, "MessageBody" => expected_message),
                )

                # Receive Message
                result = AWSServices.sqs("ReceiveMessage", LittleDict("QueueUrl" => queue_url))
                message = only(result["Messages"])["Body"]
                @test message == expected_message
            finally
                AWSServices.sqs("DeleteQueue", LittleDict("QueueUrl" => queue_url))
            end

            @test_throws AWSException _get_queue_url(queue_name)
        end
    end
end

@testset "JSON service" begin
    @testset "Secrets Manager"
        @test AWSServices.secrets_manager isa AWS.JSONService

        @testset "high-level" begin
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

        @testset "low-level" begin
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
end



@testset "Rest XML" begin
    @testset "S3" begin
        @test AWSServices.s3 isa RestXMLService

        @testset "high-level" begin
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

        @testset "low-level" begin
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
                @test AWSServices.s3("GET", "/$bucket_name/$file_name") == body

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

        @testset "additional operations" begin
            @service S3

            bucket_name = "aws-jl-test---" * _now_formatted()

            # Testing a file name with various special & Unicode characters
            file_name = "$(uuid4())/📁!!/@ +*"

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
            finally
                # DELETE the file, check that it's gone, and then DELETE the bucket
                S3.delete_object(bucket_name, file_name)
                @test_throws AWSException S3.get_object(bucket_name, file_name)
                S3.delete_bucket(bucket_name)
                sleep(2)
            end

            @test _bucket_exists(bucket_name) == false
        end
    end
end

@testset "Rest JSON" begin
    @testset "Glacier" begin
        @test AWSServices.glacier isa RestJSONService

        @testset "high-level" begin
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
                    result_tags = Glacier.list_tags_for_vault("-", vault)
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

        @testset "low-level" begin
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
                    result_tags = AWSServices.glacier("GET", "/-/vaults/$vault/tags")

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
end
