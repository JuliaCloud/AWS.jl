@testset "AWSException" begin
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
    @test ex.message == message
end