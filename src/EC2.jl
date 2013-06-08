module EC2

using LibExpat
using Calendar
using AWS.Crypto
using Codecs
using libCURL
using libCURL.HTTPC
using AWS.AWSEnv
using AWS

import AWS.xml

include("ec2_types.jl")

function check_member_name(mname)
    if mname == "return"
        return "_return"
    elseif mname == "type"
        return "_type"
    end
    return mname
end

# Generate Types

macro gentype(name,fields,types)
    args = Expr(:block)
    for i = 1:length(fields)
        t = types[i]
        push!(args.args,:($(symbol(fields[i]))::$t))
    end
    println(args)
    block = quote
        type $(esc(symbol(check_member_name(name))))
            $args
        end
    end
    Expr(:toplevel,Expr(:export,symbol(name)),block)
end

# Native types that are not bitstypes
native_types = [:CalendarTime,:DataTime]
isnative(t::Type) = isbits(t) || contains(native_types,t)

macro genconstructor(name,fields,types,findpaths)
    ret = Expr(:block)

    # Keyword constructor
    p = Expr(:parameters)
    p1 = Expr(:call,symbol(name))
    for i in 1:length(fields)
        if typeintersect(types[i],Nothing) == Nothing
            # Field may be empty
            push!(p.args,:($(fields[i])::$(types[i])=nothing))
        else  
            push!(p.args,:($(fields[i])::$(types[i])))
        end
        push!(p1.args,fields[i])
    end
    push!(ret.args,Expr(:function,Expr(:call,symbol(name),p),Expr(:block,p1)))
    
    # XML constructor
    block = Expr(:block)
    for i in 1:length(fields)
        n = fields[i]
        t = types[i]
        fp = findpaths[i]
        # TODO: Do Properly
        if isa(fp,Array)
            fp = fp[1]
        end
        if typeintersect(t,Array) != None
            if isnative(eval(t))
                last_in_path = split(fp, "/")[end]
                push!(block.args,:($n = AWS.parse_vector_as($t,$last_in_path,find(pd,$fp))))
            else
                push!(block.args,:($n = AWS.@parse_vector(AWS.EC2.($(quot(t))), find(pd, $fp))))
            end
        else
            if isnative(eval(t))
                if t == ASCIIString
                    push!(block.args,:($n = find(pd, $(fp*"#string"))))
                else
                    push!(block.args,:($n = AWS.safe_parse_as($t, $(fp*"#string"))))
                end
            else
                xml_tag_name = string(t)
                if endswith(xml_tag_name, "Type") xml_tag_name = xml_tag_name[1:end-4] end
                xml_tag_name = lowercase(xml_tag_name[1:1]) * xml_tag_name[2:end]
                push!(block.args,:($n = length(pd[$xml_tag_name]) > 0 ?  $(t)(find(pd,xml_tag_name)[1]) : nothing))
            end
        end
    end 
    push!(ret.args,Expr(:function,Expr(:call,symbol(name),:(pd::ParsedData)),block))
end

for (name,fieldnames,fieldtypes,findpaths) in types
    println(name)
    @assert length(fieldnames) == length(fieldtypes)
    @eval @gentype $name $fieldnames $fieldtypes
    @eval @genconstructor $name $fieldnames $fieldtypes $findpaths
end


# Generate Operations functions
include("ec2_operations.jl")
macro operation(name,rqst_type,resp_type)
    block = Expr(:block)
    if rqst_type == nothing
        push!(block.args,quote 
            function $(esc(symbol(name)))(env::AWSEnv)
                ec2resp::EC2Response = call_ec2(env, $name)::EC2Response
                if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
                    ec2resp.obj = $(resp_type)(ec2resp.pd)
                end
                ec2resp   
            end        
        end)
    else 
        push!(block.args,quote
            function $(esc(symbol(name)))(env::AWSEnv,msg::$(rqst_type)=$(rqst_type)())
                ec2resp::EC2Response = call_ec2(env, $name, msg)::EC2Response
                if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
                    ec2resp.obj = $(resp_type)(ec2resp.pd)
                end
                ec2resp
            end
        end)
    end
    Expr(:toplevel,block,Expr(:export,symbol(name)))
end

for (x,y,z) in operations
    @eval @operation $x $y $z
end


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
    pd::Union(ParsedData, Nothing)
    obj::Any
    
    EC2Response() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export EC2Response


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

corrections_map=[
    ("CreateTagsType", "resourcesSet") => "resourceId",
    ("DeleteTagsType", "resourcesSet") => "resourceId",

    ("MonitorInstancesType", "instancesSet") => "instanceId",
    ("DescribeInstancesType", "instancesSet") => "instanceId",
    ("DescribeInstanceStatusType", "instancesSet") => "instanceId",
    ("TerminateInstancesType", "instancesSet") => "instanceId",
    ("StopInstancesType", "instancesSet") => "instanceId",
    ("StartInstancesType", "instancesSet") => "instanceId",
    ("ReportInstanceStatusType", "instancesSet") => "instanceId"
    
]

function add_to_params(params, obj, pfx)
    for m in names(typeof(obj))
        fld_val = getfield(obj, m)
        if (fld_val != nothing)  
            fld_name = string(m)
            if haskey(corrections_map, (string(typeof(obj)), fld_name))
                arg_name = corrections_map[(string(typeof(obj)), fld_name)]
            elseif endswith(fld_name, "Set")
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
                        push!(params, (subarg_name, aws_string(fv)))
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
    push!(params, ("Version", "2010-08-31"))
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
    
    str2sign = "GET\n" * lowercase(env.ep_host) * "\n" * env.ep_path * "\n" * querystr
    sb = Crypto.hmacsha256_digest(str2sign, env.aws_seckey)
    
    signature_b64 = Codecs.encode(Base64, sb)
    
    #escape the signature
    signature_querystr = HTTPC.urlencode_query_params([("Signature", bytestring(signature_b64))])
    
    complete_url = "http://" * env.ep_host * env.ep_path * "/?" * querystr * "&" * signature_querystr
    
    #make the request
    if (env.dbg)
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
        ec2resp.body = resp.body
        
        if (resp.http_code >= 200) && (resp.http_code <= 299)
#             println(typeof(resp.headers))
                
             if (search(Base.get(resp.headers, "Content-Type", ""), "/xml") != 0:-1)
#            if  haskey(resp.headers, "Content-Type") && (resp.headers["Content-Type"] == "application/xml")
                ec2resp.pd = xp_parse(resp.body)
            end
        elseif (resp.http_code >= 400) && (resp.http_code <= 599)
            if length(resp.body) > 0
                xom = xp_parse(resp.body)
                epd = find(xom, "Errors/Error[1]")
                ec2resp.obj = EC2Error(find(epd, "Code#string"), find(epd, "Message#string"), find(xom, "RequestID#string"))
            else
                error("HTTP error : $(resp.http_code)")
            end
        else
            error("HTTP error : $(resp.http_code), $(resp.body)")
        end
    end 
    
    ec2resp
end

        
end
