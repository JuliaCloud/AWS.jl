module EC2

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS

import AWS.xml
import Base.show


const VM_CC_OXL = "cc2.8xlarge" ##Cluster Compute Eight Extra Large
const VM_CC_QXL = "c3.4xlarge" #Cluster Compute Quadruple Extra Large
const VM_CG_QXL = "cg1.4xlarge" #Cluster GPU Quadruple Extra Large
const VM_CPU_XL = "c1.xlarge"   #High-CPU Extra Large
const VM_CPU_M = "c1.medium"    #High-CPU Medium
const VM_HIO_QXL = "hi1.4xlarge"  #High I/O Quadruple Extra Large
const VM_HM_DXL = "m2.2xlarge"  #High-Memory Double Extra Large
const VM_HM_XL = "m2.xlarge"    #High-Memory Extra Large
const VM_HM_QXL = "m2.4xlarge"  #High-Memory Quadruple Extra Large
const VM_HMCC_OXL = "cr1.8xlarge" #High-Memory Cluster Eight Extra Large
const VM_HS_OXL = "hs1.8xlarge" #High Storage Eight Extra Large
const VM_XL = "m1.xlarge"       #M1 Extra Large
const VM_L = "m1.large"         #M1 Large
const VM_M = "m1.medium"        #M1 Medium
const VM_S = "m1.small"         #M1 Small
const VM_DXL = "m3.2xlarge"     #M3 Double Extra Large
const VM_XL2 = "m3.xlarge"      #M3 Extra Large
const VM_MICRO = "t1.micro"     #Micro


type EC2Error
    code::AbstractString
    msg::AbstractString
    request_id::Union{AbstractString, Void}
end
export EC2Error

ec2_error_str(o::EC2Error) = "code: $(o.code), msg : $(o.msg), $(o.request_id)"
export ec2_error_str


type EC2Response
    http_code::Int
    headers
    body::Union{AbstractString, Void}
    ## pd::Union{ETree, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any

    EC2Response() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export EC2Response


function ec2_execute(env::AWSEnv, action::AbstractString, params_in=nothing)
    # Prepare the standard params
    params=Array(Tuple,0)
    if params_in != nothing
        params = [params;params_in]
    end

    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2015-04-15"))
#    push!(params, ("Expires", get_utc_timestamp(300))) # Request expires after 300 seconds

    amz_headers, data, signed_querystr = canonicalize_and_sign(env, "ec2", false, params)

    ep_path = env.ep_path * (env.ep_path[end] == '/' ? "" : "/")
    complete_url = "https://" * ep_host(env, "ec2") * ep_path * "?" * signed_querystr
    if (env.dbg) || (env.dry_run)
        println("URL:\n$complete_url\n")
    end

	headers = Dict{String, String}()

	for (k,v) in amz_headers
		setindex!(headers, v, k)
	end

    #make the request
    ec2resp = EC2Response()
    if !(env.dry_run)
        resp = Requests.get(complete_url; headers = headers, timeout = env.timeout)

        ## ec2resp.http_code = resp.http_code
        ec2resp.http_code = resp.status
        ec2resp.headers = resp.headers
        ## ec2resp.body = bytestring(resp.body)
        ec2resp.body = bytestring(resp.data)

        if (env.dbg)
            print("HTTPCode: ", ec2resp.http_code, "\nHeaders: ", ec2resp.headers, "\nBody : ", ec2resp.body, "\n")
        end

        if (resp.status >= 200) && (resp.status <= 299)
             if (search(Base.get(resp.headers, "Content-Type", [""]), "/xml") != 0:-1)
#            if  haskey(resp.headers, "Content-Type") && (resp.headers["Content-Type"] == "application/xml")
                ec2resp.pd = LightXML.root(LightXML.parse_string(ec2resp.body))
            end
        elseif (resp.status >= 400) && (resp.status <= 599)
            if length(ec2resp.body) > 0
                ## xom = xp_parse(ec2resp.body)
                xom = LightXML.root(LightXML.parse_string(ec2resp.body))
                epd = LightXML.find_element(LightXML.find_element(xom, "Errors"), "Error")
                ec2resp.obj = EC2Error(LightXML.content(LightXML.find_element(epd, "Code")), LightXML.content(LightXML.find_element(epd, "Message")), LightXML.content(LightXML.find_element(xom, "RequestID")))
            else
                error("HTTP error : $(resp.status)")
            end
        else
            error("HTTP error : $(resp.status), $(ec2resp.body)")
        end
    end

    ec2resp
end

include("ec2_simple.jl")
include("ec2_typed.jl")


end
