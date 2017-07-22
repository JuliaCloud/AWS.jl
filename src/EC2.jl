module EC2

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS

import AWS: xml, elements_by_tagname
import Base.show

type EC2Error
    code::String
    msg::String
    request_id::Union{String, Void}
end
export EC2Error

ec2_error_str(o::EC2Error) = "code: $(o.code), msg : $(o.msg), $(o.request_id)"
export ec2_error_str

type EC2Response
    http_code::Int
    headers
    body::Union{String, Void}
    ## pd::Union{ETree, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any

    EC2Response() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export EC2Response

function ec2_execute(env::AWSEnv, action::String, params_in=nothing)
    # Prepare the standard params
    params = Vector{Tuple}()
    (params_in === nothing) || append!(params, params_in)

    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2015-04-15"))
    # push!(params, ("Expires", get_utc_timestamp(300))) # Request expires after 300 seconds

    amz_headers, data, signed_querystr = canonicalize_and_sign(env, "ec2", false, params)

    ep_path = env.ep_path * (env.ep_path[end] == '/' ? "" : "/")
    complete_url = "https://" * ep_host(env, "ec2") * ep_path * "?" * signed_querystr
    (env.dbg || env.dry_run) && info("URL:\n$complete_url")

	headers = Dict{String, String}()
	for (k,v) in amz_headers
		setindex!(headers, v, k)
	end

    #make the request
    ec2resp = EC2Response()
    if !(env.dry_run)
        resp = Requests.get(complete_url; headers = headers, timeout = env.timeout)

        ec2resp.http_code = resp.status
        ec2resp.headers = resp.headers
        ec2resp.body = String(copy(resp.data))

        env.dbg && info("HTTPCode: ", ec2resp.http_code, "\nHeaders: ", ec2resp.headers, "\nBody : ", ec2resp.body)

        if (resp.status >= 200) && (resp.status <= 299)
            for (n,v) in resp.headers
                if lowercase(n) == "content-type"
                    if contains(v, "/xml")
                        ec2resp.pd = LightXML.root(LightXML.parse_string(ec2resp.body))
                    end
                    break
                end
            end
        elseif (resp.status >= 400) && (resp.status <= 599)
            if length(ec2resp.body) > 0
                xom = LightXML.root(LightXML.parse_string(ec2resp.body))
                epd = LightXML.find_element(LightXML.find_element(xom, "Errors"), "Error")
                ec2resp.obj = EC2Error(LightXML.content(LightXML.find_element(epd, "Code")), LightXML.content(LightXML.find_element(epd, "Message")), LightXML.content(LightXML.find_element(xom, "RequestID")))
            else
                error("HTTP error: $(resp.status)")
            end
        else
            error("HTTP error: $(resp.status), $(ec2resp.body)")
        end
    end

    ec2resp
end

include("ec2_simple.jl")
include("ec2_typed.jl")

end
