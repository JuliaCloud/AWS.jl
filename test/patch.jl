module Patches

using AWS
using Dates
using Downloads: Downloads
using HTTP
using JSON
using GitHub
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
    "Server" => "AmazonS3",
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

function _response(;
    version::VersionNumber=version,
    status::Int64=status,
    headers::Array=headers,
    body::String=body,
)
    response = HTTP.Messages.Response()

    response.version = version
    response.status = status
    response.headers = headers
    response.body = b"[Message Body was streamed]"

    b = IOBuffer(body)

    return AWS.Response(response, b)
end

function _aws_http_request_patch(response::AWS.Response=_response())
    p = @patch AWS._http_request(::AWS.AbstractBackend, request::Request, ::IO) = response
    return p
end

_cred_file_patch = @patch function dot_aws_credentials_file()
    return ""
end

_config_file_patch = @patch function dot_aws_config_file()
    return ""
end

_assume_role_patch = function (
    op;
    access_key="access_key",
    secret_key="secret_key",
    session_token="token",
    role_arn="arn:aws:sts:::assumed-role/role-name",
    expiry=duration -> now(UTC) + duration,
    token_code_ref=nothing,
)
    @patch function AWSServices.sts(op, params; aws_config, feature_set)
        duration = Second(parse(Int, get(params, "DurationSeconds", "3600")))
        expiration = expiry(duration)
        if token_code_ref !== nothing
            token_code_ref[] = params["TokenCode"]
        end
        xml = """
            <$(op)Response xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
              <$(op)Result>
                <AssumedRoleUser>
                  <Arn>$(role_arn)/$(params["RoleSessionName"])</Arn>
                </AssumedRoleUser>
                <Credentials>
                  <AccessKeyId>$access_key</AccessKeyId>
                  <SecretAccessKey>$secret_key</SecretAccessKey>
                  <SessionToken>$session_token</SessionToken>
                  <Expiration>$expiration</Expiration>
                </Credentials>
              </$(op)Result>
            </$(op)Response>
            """

        r = _response(; body=xml)
        return feature_set.use_response_type ? r : parse(r)::AbstractDict
    end
end

_getpass_patch = function (; secret="the_secret")
    @patch function Base.getpass(prompt)
        return Base.SecretBuffer(secret)
    end
end

_github_tree_patch = @patch function tree(repo, tree_obj; kwargs...)
    if tree_obj == "master"
        tree = [Dict("path" => "apis", "sha" => "apis-sha")]
        return Tree("test-sha", HTTP.URI(), tree, false)
    else
        tree = [Dict("path" => "test-2020-01-01.normal.json", "sha" => "test-sha")]
        return Tree("test-sha", HTTP.URI(), tree, false)
    end
end

_instance_metadata_timeout_patch = @patch function HTTP.request(
    method::String, url; kwargs...
)
    return throw(HTTP.ConnectionPool.ConnectTimeout("169.254.169.254", "80"))
end

# This patch causes `HTTP.request` to return all of its keyword arguments
# except `require_ssl_verification` and `response_stream`. This is used to
# test which other options are being passed to `HTTP.Request` inside of
# `_http_request`.
_http_options_patches = [
    @patch function HTTP.request(args...; kwargs...)
        options = Dict(kwargs)
        delete!(options, :require_ssl_verification)
        delete!(options, :response_stream)
        return options
    end
    @patch AWS.Response(options, args...) = options
]

get_profile_settings_empty_patch = @patch function aws_get_profile_settings(profile, ini)
    return nothing
end

get_profile_settings_patch = @patch function aws_get_profile_settings(profile, ini)
    return Dict("foo" => "bar")
end

# Simulate the HTTP.request behaviour with a HTTP 400 response
function gen_http_options_400_patches(message)
    body = "{\"__type\":\"AccessDeniedException\",\"Message\":\"$message\"}"
    headers = [
        "Content-Type" => "application/x-amz-json-1.1",
        "Content-Length" => string(sizeof(body)),
    ]

    return [
        @patch function HTTP.request(
            args...; status_exception=true, response_stream=nothing, kwargs...
        )
            request = HTTP.Request("GET", "/")

            if response_stream !== nothing
                write(response_stream, body)
                close(response_stream)  # Simulating current HTTP.jl 0.9.14 behaviour
                body = HTTP.MessageRequest.body_was_streamed
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
end

end
