function canonicalize_and_sign!(params, env::AWSEnv, service::ASCIIString, method::ASCIIString="GET")
    if env.sig_ver == 2
      signature_version_2!(params, env, service, method)
    elseif env.sig_ver == 4
      error("signature version 4 not yet implemented")
    else
      error("invalid signature version $(env.sig_ver)")
    end
end
export canonicalize_and_sign!

function signature_version_2!(params, env::AWSEnv, service::ASCIIString, method)
    push!(params, ("SignatureVersion", "2"))
    push!(params, ("SignatureMethod", "HmacSHA256"))

    sort!(params)
    querystr = HTTPC.urlencode_query_params(params)

    ep_host = env.ep_host=="" ? "$service.$(env.region).amazonaws.com" : env.ep_host

    str2sign = "$method\n" * lowercase(ep_host) * "\n" * env.ep_path * "\n" * querystr
    sb = Crypto.hmacsha256_digest(str2sign, env.aws_seckey)

    signature_b64 = bytestring(base64encode(sb))

    push!(params, ("Signature", signature_b64))

    if (env.dbg) || (env.dry_run)
        for (k, v) in params
            println("$k => $v")
        end
        println("--------\nString to sign:\n" * str2sign * "\n--------")
    end

    return HTTPC.urlencode_query_params(params)
end
