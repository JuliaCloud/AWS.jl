module EC2

using LibExpat
using AWS.Crypto
using HTTPClient.HTTPC
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
    code::String
    msg::String
    request_id::Union(String, Nothing)
end
export EC2Error

ec2_error_str(o::EC2Error) = "code: $(o.code), msg : $(o.msg), $(o.request_id)"
export ec2_error_str


type EC2Response
    http_code::Int
    headers
    body::Union(String, Nothing)
    pd::Union(ETree, Nothing)
    obj::Any

    EC2Response() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export EC2Response




function aws_string(dt::DateTime)
    y,m,d = Dates.yearmonthday(dt)
    h,mi,s = Dates.hour(dt),Dates.minute(dt),Dates.second(dt)
    yy = y < 0 ? @sprintf("%05i",y) : lpad(y,4,"0")
    mm = lpad(m,2,"0")
    dd = lpad(d,2,"0")
    hh = lpad(h,2,"0")
    mii = lpad(mi,2,"0")
    ss = lpad(s,2,"0")
    return "$yy-$mm-$(dd)T$hh:$mii:$ss"
end

aws_string(v::Bool) = v ? "True" : "False"
aws_string(v::Any) = string(v)


#ISO8601
function get_utc_timestamp(addsecs=0)
    dt = Dates.unix2datetime(Dates.datetime2unix(now(Dates.UTC)) + addsecs)
    return string(aws_string(dt), "Z")
end


function ec2_execute(env::AWSEnv, action::String, params_in=nothing)
    # Prepare the standard params
    params=Array(Tuple,0)
    if params_in != nothing
        params = [params;params_in]
    end

    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2013-02-01"))
#    push!(params, ("Expires", get_utc_timestamp(300))) # Request expires after 300 seconds
    push!(params, ("SignatureVersion", "2"))
    push!(params, ("SignatureMethod", "HmacSHA256"))
    if env.aws_token != ""
        push!(params, ("SecurityToken", env.aws_token))
    end


    sorted = sort(params)
    querystr = HTTPC.urlencode_query_params(sorted)

    str2sign = "GET\n" * lowercase(env.ep_host) * "\n" * env.ep_path * "\n" * querystr
    sb = Crypto.hmacsha256_digest(str2sign, env.aws_seckey)

    signature_b64 = base64encode(sb)

    #escape the signature
    signature_querystr = HTTPC.urlencode_query_params([("Signature", bytestring(signature_b64))])

    complete_url = "http://" * env.ep_host * env.ep_path * (env.ep_path[end] == '/' ? "" : "/") * "?" * querystr * "&" * signature_querystr

    #make the request
    if (env.dbg) || (env.dry_run)
        for (k, v) in sorted
            println("$k => $v")
        end
        println("String to sign => " * str2sign)
        println("Signature => " * bytestring(signature_b64) * "\n")

        println("URL:\n$complete_url \n")
    end

    ec2resp = EC2Response()
    if !(env.dry_run)
        ro = HTTPC.RequestOptions(request_timeout = env.timeout)
        resp = HTTPC.get(complete_url, ro)

        ec2resp.http_code = resp.http_code
        ec2resp.headers = resp.headers
        ec2resp.body = bytestring(resp.body)

        if (env.dbg)
            print("HTTPCode: ", ec2resp.http_code, "\nHeaders: ", ec2resp.headers, "\nBody : ", ec2resp.body, "\n")
        end

        if (resp.http_code >= 200) && (resp.http_code <= 299)
#             println(typeof(resp.headers))

             if (search(Base.get(resp.headers, "Content-Type", [""])[1], "/xml") != 0:-1)
#            if  haskey(resp.headers, "Content-Type") && (resp.headers["Content-Type"] == "application/xml")
                ec2resp.pd = xp_parse(ec2resp.body)
            end
        elseif (resp.http_code >= 400) && (resp.http_code <= 599)
            if length(ec2resp.body) > 0
                xom = xp_parse(ec2resp.body)
                epd = LibExpat.find(xom, "Errors/Error[1]")
                ec2resp.obj = EC2Error(LibExpat.find(epd, "Code#string"), LibExpat.find(epd, "Message#string"), LibExpat.find(xom, "RequestID#string"))
            else
                error("HTTP error : $(resp.http_code)")
            end
        else
            error("HTTP error : $(resp.http_code), $(ec2resp.body)")
        end
    end

    ec2resp
end

include("ec2_simple.jl")
include("ec2_typed.jl")


end
