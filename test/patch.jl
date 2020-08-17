module Patches

using AWS
using HTTP
using Mocking
using OrderedCollections: LittleDict

version = v"1.1.0"
status = 200
headers = Pair[
    "x-amz-id-2" => "x-amz-id-2",
    "x-amz-request-id" => "x-amz-request-id",
    "Date" => "Tue, 16 Jun 2020 21:29:18 GMT",
    "x-amz-bucket-region" => "us-east-1",
    "Content-Type" => "application/xml",
    "Transfer-Encoding" => "chunked",
    "Server" => "AmazonS3"
]

body = """
    <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n
    <ListBucketResult xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">
        <Name>sample-bucket</Name>
        <Prefix></Prefix>
        <Marker></Marker>
        <MaxKeys>1000</MaxKeys>
        <IsTruncated>false</IsTruncated>
        <Contents>
            <Key>test.txt</Key>
            <LastModified>2020-06-16T21:37:34.000Z</LastModified>
            <ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag>
            <Size>0</Size>
            <Owner>
                <ID>id</ID>
                <DisplayName>matt.brzezinski</DisplayName>
            </Owner>
            <StorageClass>STANDARD</StorageClass>
        </Contents>
    </ListBucketResult>
    """

response = HTTP.Messages.Response()

function _response!(; version::VersionNumber=version, status::Int64=status, headers::Array=headers, body::String=body)
    response.version = version
    response.status = status
    response.headers = headers
    response.body = Vector{UInt8}(body)

    return response
end

_aws_http_request_patch = @patch function AWS._http_request(request::Request)
    return response
end


aws_sdk_files =
    """
    [
        {"name": "test-2020-01-01.normal.json"},
        {"name": "test-2020-01-01.min.json"},
        {"name": "test-2020-01-01.paginators.json"},
        {"name": "test-2020-01-01.examples.json"}
    ]
    """

_http_get_patch = @patch function HTTP.get(url::String, headers)
    return HTTP.Response(200, aws_sdk_files)
end

end
