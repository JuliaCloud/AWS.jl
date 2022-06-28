@testset "AWSException" begin
    function _test_exception(ex::AWSException, expected::AbstractDict, msg::String)
        @test ex.code == expected["code"]
        @test ex.message == ex.info[msg] == expected["message"]
        @test ex.cause.response.body == expected["body"]
        @test ex.cause.status == expected["status_code"]
        @test ex.cause.response.headers == expected["headers"]
        @test ex.streamed_body == expected["streamed_body"]
    end

    cases = [
        ("Error", "message"),
        ("Error", "Message"),
        ("Errors", "message"),
        ("Errors", "Message"),
    ]
    @testset "XMLRequest $err -- $msg" for (err, msg) in cases
        expected = Dict(
            "code" => "NoSuchKey",
            "message" => "The resource you requested does not exist",
            "resource" => "/mybucket/myfoto.jpg",
            "requestId" => "4442587FB7D0A2F9",
            "headers" => ["Content-Type" => "application/xml"],
            "status_code" => 400,
        )

        expected["body"] = IOBuffer()
        expected["streamed_body"] = """
            <?xml version="1.0" encoding="UTF-8"?>
            <$err>
            <Code>$(expected["code"])</Code>
            <$msg>$(expected["message"])</$msg>
            <Resource>$(expected["resource"])</Resource>
            <RequestId>$(expected["requestId"])</RequestId>
            </$err>
            """

        # This does not actually send a request, just creates the object to test with
        req = HTTP.Request("GET", "https://aws.com", expected["headers"], expected["body"])
        resp = HTTP.Response(
            expected["status_code"], expected["headers"]; body=expected["body"], request=req
        )
        status_error = AWS.statuserror(expected["status_code"], resp)
        ex = AWSException(status_error, expected["streamed_body"])

        _test_exception(ex, expected, msg)
        @test ex.info["Resource"] == expected["resource"]
        @test ex.info["RequestId"] == expected["requestId"]
    end

    @testset "XMLRequest - Invalid XML" begin
        expected = Dict(
            "body" => IOBuffer(),
            "streamed_body" => """<?xml version="1.0" encoding="UTF-8"?>InvalidXML""",
            "headers" => ["Content-Type" => "application/xml"],
            "status_code" => 404,
        )
        req = HTTP.Request("GET", "https://aws.com", expected["headers"], expected["body"])
        resp = HTTP.Response(
            expected["status_code"], expected["headers"]; body=expected["body"], request=req
        )
        status_error = AWS.statuserror(expected["status_code"], resp)
        ex = @test_logs (:error,) AWSException(status_error, expected["streamed_body"])

        @test ex.code == "404"
        @test ex.streamed_body == expected["streamed_body"]
    end

    @testset "JSON Request -- $msg" for msg in ["message", "Message"]
        expected = Dict(
            "code" => "InvalidSignatureException",
            "message" => "Signature expired: ...",
            "headers" => ["Content-Type" => "application/x-amz-json-1.1"],
            "status_code" => 400,
        )

        expected["body"] = IOBuffer()
        expected["streamed_body"] = """
            {
            "__type": "$(expected["code"])",
            "$msg": "$(expected["message"])"
            }
            """

        # This does not actually send a request, just creates the object to test with
        req = HTTP.Request("GET", "https://aws.com", expected["headers"], expected["body"])
        resp = HTTP.Response(
            expected["status_code"], expected["headers"]; body=expected["body"], request=req
        )
        status_error = AWS.statuserror(expected["status_code"], resp)
        ex = AWSException(status_error, expected["streamed_body"])

        _test_exception(ex, expected, "$msg")
        @test ex.info["__type"] == expected["code"]
    end
end
