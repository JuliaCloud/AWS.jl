module Autoscale

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS
using Compat

import AWS: xml, AbstractAWSType, _ename, parse_from_xml, prep_params
import Base.show
import LightXML: get_elements_by_tagname

type AutoScalingError
    code::String
    msg::String
end
function AutoScalingError(pd::LightXML.XMLElement)
    code = ""
    msg = ""
    epd = LightXML.find_element(pd, "Error")
    if epd !== nothing
        elem = LightXML.find_element(epd, "Code")
        (elem === nothing) || (code = LightXML.content(elem))
        elem = LightXML.find_element(epd, "Message")
        (elem === nothing) || (msg = LightXML.content(elem))
    end
    AutoScalingError(code, msg)
end
export AutoScalingError

autoscale_error_str(o::AutoScalingError) = "code: $(o.code), msg : $(o.msg), $(o.request_id)"
export autoscale_error_str

type AutoScalingResponse
    http_code::Int
    headers::Dict{AbstractString,AbstractString}
    body::Union{String, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any

    AutoScalingResponse() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export AutoScalingResponse

function autoscaling_execute(env::AWSEnv, action::String, params::Vector{Tuple}=Vector{Tuple}())
    # prepare the standard params
    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2011-01-01"))

    amz_headers, data, signed_querystr = canonicalize_and_sign(env, "autoscaling", false, params)

    ep_path = env.ep_path
    endswith(ep_path, '/') && (ep_path = ep_path * "/")
    complete_url = "https://" * ep_host(env, "autoscaling") * ep_path * "?" * signed_querystr
    (env.dbg || env.dry_run) && info("URL:\n$complete_url")

	headers = Dict{String, String}(k=>v for (k,v) in amz_headers)

    apiresp = AutoScalingResponse()
    env.dry_run && (return apiresp)

    # make the request
    resp = Requests.get(complete_url; headers=headers, timeout=env.timeout)

    apiresp.http_code = resp.status
    apiresp.headers = resp.headers
    apiresp.body = String(copy(resp.data))

    env.dbg && info("HTTPCode: ", apiresp.http_code, "\nHeaders: ", apiresp.headers, "\nBody : ", apiresp.body)

    if (resp.status >= 200) && (resp.status <= 299)
        for (n,v) in resp.headers
            if lowercase(n) == "content-type"
                if contains(v, "/xml")
                    apiresp.pd = LightXML.root(LightXML.parse_string(apiresp.body))
                end
                break
            end
        end
    elseif (resp.status >= 400) && (resp.status <= 599)
        if length(apiresp.body) > 0
            apiresp.obj = AutoScalingError(LightXML.root(LightXML.parse_string(apiresp.body)))
        else
            error("HTTP error: $(resp.status)")
        end
    else
        error("HTTP error: $(resp.status), $(apiresp.body)")
    end

    apiresp
end

autoscaling_execute(env::AWSEnv, action::String, req::AbstractAWSType) = autoscaling_execute(env, action, prep_params(req))
autoscaling_execute(env::AWSEnv, action::String, req::Void) = autoscaling_execute(env, action)

include("autoscaling_types.jl")
include("autoscaling_operations.jl")
include("autoscaling_spec.jl")

end # module Autoscale
