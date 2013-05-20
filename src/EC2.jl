module EC2

using LibExpat
using Calendar
using Sodium
using Codecs
using libCURL
using libCURL.HTTPC
using AWSLib.AWSEnv


type XSDateTime
    yr::Int
    mo::Int
    da::Int
    hr::Int
    mi::Int
    se::Int
end
export XSDateTime


#import AWSLib.AWSEnv
include("ec2_types.jl")
include("ec2_operations.jl")


const EP_US_EAST_NORTHERN_VIRGINIA     = "ec2.us-east-1.amazonaws.com"
const EP_US_WEST_OREGON                = "ec2.us-west-2.amazonaws.com"
const EP_US_WEST_NORTHERN_CALIFORNIA   = "ec2.us-west-1.amazonaws.com"
const EP_EU_IRELAND                    = "ec2.eu-west-1.amazonaws.com"
const EP_AP_SINGAPORE                  = "ec2.ap-southeast-1.amazonaws.com"
const EP_AP_SYDNEY                     = "ec2.ap-southeast-2.amazonaws.com"
const EP_AP_TOKYO                      = "ec2.ap-northeast-1.amazonaws.com"
const EP_SA_SAO_PAULO                  = "ec2.sa-east-1.amazonaws.com"

export EP_US_EAST_NORTHERN_VIRGINIA, EP_US_WEST_OREGON, EP_US_WEST_NORTHERN_CALIFORNIA
export EP_EU_IRELAND, EP_AP_SINGAPORE, EP_AP_SYDNEY, EP_AP_TOKYO, EP_SA_SAO_PAULO


function aws_string(v::XSDateTime)
    return "$(v.yr)-$(v.mo)-$(v.da)T$(v.hr):$(v.mi):$(v.se)"
end

aws_string(v::Bool) = v ? "True" : "False"
aws_string(v::Any) = string(v)


function is_basic_type(v)
    if  isa(v, String) || isa(v, Int) || isa(v, Int32) || 
        isa(v, Int64) || isa(v, Float64) || isa(v, Bool) || 
        isa(v, XSDateTime)
        
        return true
    end
    return false
end



function add_to_params(params, obj, pfx)
    for m in names(typeof(obj))
        fld_val = getfield(obj, m)
        if (fld_val != nothing)  
            fld_name = string(m)
            if endswith(fld_name, "Set")
                arg_name = fld_name[1:end-3]
            else
                arg_name = fld_name
            end
            
            if beginswith(arg_name, "_")
                # handle field names that match julia reserved types....
                arg_name =  arg_name[2:]
            end
            
            #Captitalize the first letter for the argument.
            arg_name = uppercase(arg_name[1:1]) * arg_name[2:]

            if is_basic_type(fld_val)
                push!(params, (pfx * arg_name, aws_string(fld_val)))
            elseif isa(fld_val, Array)
                for (idx, fv) in enumerate(fld_val)
                    subarg_name = "$(pfx)$(arg_name).$(idx)"
                    if is_basic_type(fv)
                        push!(params, (pfx * subarg_name, aws_string(fv)))
                    else
                        add_to_params(params, fv, subarg_name*".") 
                    end
                end
            else
                # compound type
                add_to_params(params, fld_val, "$(pfx)$(arg_name).")
            end
        end
    end
end

function get_utc_timestamp(addsecs=0)
    t = Calendar.now() + Calendar.seconds(addsecs)
    utc = Calendar.tz(t, "UTC")
    yr = Calendar.year(utc)
    mo = Calendar.month(utc)
    da = Calendar.day(utc)
    hr = Calendar.hour(utc)
    mi = Calendar.minute(utc)
    se = Calendar.second(utc)
    
    return string(dec(yr,4),"-", dec(mo,2),"-",dec(da,2),"T",dec(hr,2),":",dec(mi,2),":",dec(se,2),"Z")

end


function urlencode_params(params)
    curl = curl_easy_init()
    if (curl == C_NULL) throw("curl_easy_init() failed") end

    querystr = 
    mapreduce(
            i -> begin
                    k,v = i;
                    sk = string(k)
                    sv = string(v)
                    
                    ek = curl_easy_escape( curl, sk, length(sk))
                    ev = curl_easy_escape( curl, sv, length(sv))

                    ep = bytestring(ek) * "=" * bytestring(ev)

                    curl_free(ek)
                    curl_free(ev)
                    
                    ep
                end,
                
            (ep1,ep2) -> ep1 * "&" * ep2,
            
            params
    )
    
    curl_easy_cleanup(curl)
    return querystr
end

ec2_generic(env::AWSEnv, action::String, params_in::Array{Tuple}) = call_ec2(env, action, nothing, params_in)
export ec2_generic

function call_ec2(env::AWSEnv, action::String, msg=nothing, params_in=nothing)
    # Prepare the standard params
    params=Array(Tuple,0)
    if params_in != nothing
        for p in params_in
            push!(params, p)
        end
    end 
    
    push!(params, ("Action", action))
    push!(params, ("AccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2013-02-01"))
#    push!(params, ("Expires", get_utc_timestamp(300))) # Request expires after 300 seconds
    push!(params, ("SignatureVersion", "2"))
    push!(params, ("SignatureMethod", "HmacSHA256"))

    if (msg != nothing) 
        # make sure it is a valid type
        msg_type = typeof(msg)
        msg_name = string(msg_type)
        
        if !haskey(ValidRqstMsgs, msg_name) error("Invalid message for request: $msg_name") end
        
        add_to_params(params, msg, "")
    end

    sorted = sort(params)
    
    querystr = urlencode_params(params)
    
    str2sign = "GET\n" * lowercase(env.ep) * "\n" * "/\n" * querystr
    
    signature_bytes = zeros(Uint8, 32)
    key_bytes = zeros(Uint8, 64)
    
    if length(env.aws_seckey) <= 64
        copy!(key_bytes, convert(Array{Uint8,1}, env.aws_seckey))
    else
        Sodium.crypto_hash_sha256(key_bytes, env.aws_seckey, length(env.aws_seckey));
    end
    
    
    rc = Sodium.crypto_auth_hmacsha256(signature_bytes, str2sign, length(str2sign), key_bytes)
    
    signature_b64 = Codecs.encode(Base64, signature_bytes)
    
    #escape the signature
    signature_querystr = urlencode_params([("Signature", bytestring(signature_b64))])
    
    complete_url = "http://" * env.ep * "/?" * querystr * "&" * signature_querystr
    
    #make the request
    if !(env.dry_run)
        resp = HTTPC.get(complete_url)
        
        if (resp.http_code == 200)
            xom = xp_parse(resp.body)
            return xom
        else
            error("HTTP error : $(resp.http_code)")
        end
    else
        for (k, v) in sorted
            println("$k => $v")
        end
        println("Signature => " * bytestring(signature_b64) * "\n")
        
        println("URL:\n$complete_url \n")
        return nothing
    end
end

        
end