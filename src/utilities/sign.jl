function sign!(aws::AbstractAWSConfig, request::Request; time::DateTime=now(Dates.UTC))
    if request.service in ("sdb", "importexport")
        sign_aws2!(aws, request, time)
    else
        sign_aws4!(aws, request, time)
    end
end

function sign_aws2!(aws::AbstractAWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 2 Authentication query parameters.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html

    query = Dict{String,String}()
    for elem in split(request.content, '&'; keepempty=false)
        (n, v) = split(elem, "=")
        query[n] = HTTP.unescapeuri(v)
    end

    request.headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"

    creds = check_credentials(credentials(aws))
    signing_key = Vector{UInt8}(creds.secret_key)

    query["AWSAccessKeyId"] = creds.access_key_id
    query["Expires"] = Dates.format(
        time + Dates.Minute(2), dateformat"yyyy-mm-dd\THH:MM:SS\Z"
    )
    query["SignatureVersion"] = "2"
    query["SignatureMethod"] = "HmacSHA256"

    if !isempty(creds.token)
        query["SecurityToken"] = creds.token
    end

    query = [k => query[k] for k in sort!(collect(keys(query)))]
    uri = HTTP.URI(request.url)
    to_sign = "POST\n$(uri.host)\n$(uri.path)\n$(HTTP.escapeuri(query))"
    signature = strip(base64encode(hmac_sha256(signing_key, to_sign)))
    push!(query, "Signature" => signature)

    request.content = HTTP.escapeuri(query)

    return request
end

function sign_aws4!(aws::AbstractAWSConfig, request::Request, time::DateTime)
    # Create AWS Signature Version 4 Authentication Headers.
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html
    # https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html

    date = Dates.format(time, dateformat"yyyymmdd")
    datetime = Dates.format(time, dateformat"yyyymmdd\THHMMSS\Z")

    # Authentication scope...
    authentication_scope = [date, region(aws), request.service, "aws4_request"]

    creds = check_credentials(credentials(aws))
    signing_key = Vector{UInt8}("AWS4$(creds.secret_key)")

    for scope in authentication_scope
        signing_key = hmac_sha256(signing_key, scope)
    end

    # Authentication scope string...
    authentication_scope = join(authentication_scope, "/")

    # SHA256 hash of content...
    content_hash = bytes2hex(sha256(request.content))

    # HTTP headers...
    delete!(request.headers, "Authorization")

    merge!(
        request.headers,
        Dict(
            "x-amz-content-sha256" => content_hash,
            "x-amz-date" => datetime,
        ),
    )

    if !isempty(creds.token)
        request.headers["x-amz-security-token"] = creds.token
    end

    # Sort and lowercase() Headers to produce canonical form...
    canonical_headers = join(
        sort!(["$(lowercase(k)):$(strip(v))" for (k, v) in request.headers]), "\n"
    )
    signed_headers = join(sort!([lowercase(k) for k in keys(request.headers)]), ";")

    # Sort query parameters...
    # Ensure we retain duplicate query parameters when computing the signature
    uri = HTTP.URI(request.url)
    query = HTTP.URIs.queryparampairs(uri.query)
    query = sort!(query)

    # Create hash of canonical request...
    canonical_form = string(
        request.request_method,
        "\n",
        request.service == "s3" ? uri.path : HTTP.escapepath(uri.path),
        "\n",
        HTTP.escapeuri(query),
        "\n",
        canonical_headers,
        "\n\n",
        signed_headers,
        "\n",
        content_hash,
    )

    canonical_hash = bytes2hex(sha256(canonical_form))

    # Create and sign "String to Sign"...
    string_to_sign = "AWS4-HMAC-SHA256\n$datetime\n$authentication_scope\n$canonical_hash"
    signature = bytes2hex(hmac_sha256(signing_key, string_to_sign))

    # Append Authorization header...
    request.headers["Authorization"] = join(
        [
            "AWS4-HMAC-SHA256 Credential=$(creds.access_key_id)/$authentication_scope",
            "SignedHeaders=$signed_headers",
            "Signature=$signature",
        ],
        ", ",
    )

    return request
end
