@testset "AWSException" begin
    @testset "XML Request" begin
        code = "NoSuchKey"
        message = "The resource you requested does not exist"
        resource = "/mybucket/myfoto.jpg"
        requestId = "4442587FB7D0A2F9"

        body = """
            <?xml version="1.0" encoding="UTF-8"?>
            <Error>
              <Code>$code</Code>
              <Message>$message</Message>
              <Resource>$resource</Resource>
              <RequestId>$requestId</RequestId>
            </Error>
            """
        headers = ["Content-Type" => "application/xml"]
        status_code = 400

        # This does not actually send a request, just creates the object to test with
        req = HTTP.Request("GET", "https://amazon.ca", headers, body)
        resp = HTTP.Response(status_code, headers; body=body, request=req)
        ex = AWSException(HTTP.StatusError(status_code, resp))

        @test ex.code == code
        @test ex.message == ex.info["Message"] == message
        @test ex.info["Resource"] == resource
        @test ex.info["RequestId"] == requestId
        @test String(ex.cause.response.body) == body
        @test ex.cause.status == status_code
        @test ex.cause.response.headers == headers
    end


    @testset "JSON Request" begin
        code = "InvalidSignatureException"
        message = "Signature expired: ..."
        body = """
            {
               "__type": "$code",
               "message": "$message"
            }
            """
        headers = ["Content-Type" => "application/x-amz-json-1.1"]
        status_code = 400

        # This does not actually send a request, just creates the object to test with
        req = HTTP.Request("GET", "https://amazon.ca", headers, body)
        resp = HTTP.Response(status_code, headers; body=body, request=req)
        ex = AWSException(HTTP.StatusError(status_code, resp))

        @test ex.code == code
        @test ex.message == ex.info["message"] == message
        @test ex.info["__type"] == code
        @test String(ex.cause.response.body) == body
        @test ex.cause.status == status_code
        @test ex.cause.response.headers == headers
    end
end