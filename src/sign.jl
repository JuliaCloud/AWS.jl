
function canonicalize_and_sign(env::AWSEnv, service, method, params)
    if env.sig_ver == 2
      signature_version_2(env, service, method, copy(params))
    elseif env.sig_ver == 4
      signature_version_4(env, service, method, copy(params))
    else
      error("invalid signature version $(env.sig_ver)")
    end
end
export canonicalize_and_sign

#=
import URIParser
function urlencode_params(params::Vector{Tuple})
    buf = IOBuffer()
    for param in params
        print(buf, URIParser.escape(param[1]))
        print(buf, '=')
        print(buf, URIParser.escape(param[2]))
        print(buf, '&')
    end
    if buf.size > 0
        buf.size -= 1  # trim off last &
    end
    return takebuf_string(buf)
end

function urlencode_form(params::Vector{Tuple})
    buf = IOBuffer()
    for param in params
        print(buf, URIParser.escape_form(param[1]))
        print(buf, '=')
        print(buf, URIParser.escape_form(param[2]))
        print(buf, '&')
    end
    if buf.size > 0
        buf.size -= 1  # trim off last &
    end
    return takebuf_string(buf)
end
=#


function signature_version_2(env::AWSEnv, service, use_post, request_parameters)
    if env.aws_token != ""
        push!(request_parameters, ("SecurityToken", env.aws_token))
    end
    push!(request_parameters, ("SignatureVersion", "2"))
    push!(request_parameters, ("SignatureMethod", "HmacSHA256"))
    sort!(request_parameters)

    canonical_querystring = Requests.format_query_str(request_parameters)

	method = use_post ? "POST" : "GET"

    string_to_sign = method * "\n" * ep_host(env, service) * "\n" * env.ep_path * "\n" * canonical_querystring

    signature = String(copy(base64encode(sign(env.aws_seckey, string_to_sign))))

    push!(request_parameters, ("Signature", signature))

    if (env.dbg) || (env.dry_run)
        println("Parameters:")
        for (k, v) in request_parameters
            println("  $k => $v")
        end
        println("--------\nString to sign:\n" * string_to_sign * "\n--------")
    end

    return (Tuple[], Requests.format_query_str(request_parameters))
end

function signature_version_4(env::AWSEnv, service, use_post, request_parameters)
    # inputs to request
    sort!(request_parameters)
    amzdate = get_utc_timestamp(; basic=true)
    datestamp = amzdate[1:searchindex(amzdate, "T")-1]
    payload = "" ##### Assume empty payload for the moment.

	if use_post
        ## payload = urlencode_form(request_parameters)
        payload = Requests.format_query_str(request_parameters)
        request_parameters = Array(Tuple, 0)
    end

	method = use_post ? "POST" : "GET"

    # Task 1: canonical request
    canonical_uri = env.ep_path
    canonical_querystring = Requests.format_query_str(request_parameters)
    ## canonical_querystring = urlencode_params(request_parameters)
    canonical_headers = "host:" * ep_host(env, service) * "\n" * "x-amz-date:" * amzdate * "\n"
    signed_headers = "host;x-amz-date"
    payload_hash = bytes2hex(Crypto.sha256(payload))
    canonical_request = method * "\n" * canonical_uri * "\n" * canonical_querystring * "\n" *
        canonical_headers * "\n" * signed_headers * "\n" * payload_hash


    # Task 2: string to sign
    algorithm = "AWS4-HMAC-SHA256"
	credential_scope = datestamp * "/" * env.region * "/" * service * "/" * "aws4_request"

    string_to_sign = algorithm * "\n" * amzdate * "\n" * credential_scope * "\n" * bytes2hex(Crypto.sha256(canonical_request))

    # Task 3: calculate the signature
    signing_key = get_signature_key(env.aws_seckey, datestamp, env.region, service, method)
    signature = bytes2hex(sign(signing_key, string_to_sign))

    # Task 4: add signing information to request ##### how to return header to caller?
    authorization_header = algorithm * " " * "Credential=" * env.aws_id * "/" * credential_scope * ", " *
        "SignedHeaders=" * signed_headers * ", " * "Signature=" * signature
    headers = [("Authorization", authorization_header),
              ("X-Amz-Date", amzdate)]
    if env.aws_token != ""
        push!(headers, ("X-Amz-Security-Token", env.aws_token))
    end

    if use_post
        push!(headers, ("Content-Type", "application/x-www-form-urlencoded"))
    end

    if (env.dbg) || (env.dry_run)
        println("Parameters:")
        for (k, v) in request_parameters
            println("  $k => $v")
        end
        println("--------\nCanonical request:\n" * canonical_request)
        println("--------\nString to sign:\n" * string_to_sign * "\n--------")
        println("Headers:")
        println("  Host: " * ep_host(env, service))
        for (k, v) in headers
            println("  $k: $v")
        end
    end

    return (headers, canonical_querystring, Requests.format_query_str(request_parameters))
    ## return (headers, canonical_querystring, urlencode_params(request_parameters))
end

function get_signature_key(key, datestamp, region, service, method)
    kDate = sign("AWS4" * key, datestamp)
    kRegion = sign(kDate, region)
    kService = sign(kRegion, service)
    kSigning = sign(kService, "aws4_request")
    return kSigning
end

sign(key, msg) = Crypto.hmacsha256_digest(msg, key)
