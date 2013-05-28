module EC2

using LibExpat
using Calendar
using AWS.Crypto
using Codecs
using libCURL
using libCURL.HTTPC
using AWS.AWSEnv



#import AWSLib.AWSEnv
include("ec2_types.jl")
include("ec2_operations.jl")




function aws_string(v::CalendarTime)
    return format("yyyy-MM-DD'T'HH:mm:ss", v)
end

aws_string(v::Bool) = v ? "True" : "False"
aws_string(v::Any) = string(v)


function is_basic_type(v)
    if  isa(v, String) || isa(v, Int) || isa(v, Int32) || 
        isa(v, Int64) || isa(v, Float64) || isa(v, Bool) || 
        isa(v, CalendarTime)
        
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

#ISO8601
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
    push!(params, ("AWSAccessKeyId", env.aws_id))
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
    querystr = HTTPC.urlencode_query_params(sorted)
    
    str2sign = "GET\n" * lowercase(env.ep) * "\n" * "/\n" * querystr
    println(str2sign)
    sb = Crypto.hmacsha256_digest(str2sign, env.aws_seckey)
    
    signature_b64 = Codecs.encode(Base64, sb)
    
    #escape the signature
    signature_querystr = HTTPC.urlencode_query_params([("Signature", bytestring(signature_b64))])
    
    complete_url = "http://" * env.ep * "/?" * querystr * "&" * signature_querystr
    
    #make the request
    if (env.dbg)
        for (k, v) in sorted
            println("$k => $v")
        end
        println("Signature => " * bytestring(signature_b64) * "\n")
        
        println("URL:\n$complete_url \n")
    end
    
    if !(env.dry_run)
        resp = HTTPC.get(complete_url)
        
        if (resp.http_code >= 200)
            xom = xp_parse(resp.body)
            return xom
        elseif (resp.http_code >= 400) && (resp.http_code <= 599)
            ec = ""
            ec_msg = ""
            rid = ""
            if length(resp.body) > 0
                xom = xp_parse(resp.body)
                rid = find(xom, "RequestID#text")
                ec = find(xom, "Errors/Error/Code#text")
                ec_msg = find(xom, "Errors/Error/Message#text")
            end
        
            return (rid, resp.http_code, ec, ec_msg)
        else
            error("HTTP error : $(resp.http_code), $(resp.body)")
        end
    end 
    
    return nothing
end

        
end