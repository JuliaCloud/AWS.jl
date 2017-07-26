@compat abstract type AbstractAWSType end

import Base: show

type AWSError
    code::String
    msg::String
end
function AWSError(pd::LightXML.XMLElement)
    code = ""
    msg = ""
    epd = LightXML.find_element(pd, "Error")
    if epd !== nothing
        elem = LightXML.find_element(epd, "Code")
        (elem === nothing) || (code = LightXML.content(elem))
        elem = LightXML.find_element(epd, "Message")
        (elem === nothing) || (msg = LightXML.content(elem))
    end
    AWSError(code, msg)
end
export AWSError

#show(io::IO, o::AWSError) = print("code: $(o.code), msg : $(o.msg), $(o.request_id)")

type AWSResponse
    http_code::Int
    headers::Dict{AbstractString,AbstractString}
    body::Union{String, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any

    AWSResponse() = new(0, Dict{AbstractString, AbstractString}(), "", nothing, nothing)
end
export AWSResponse

const BASIC_TYPES = Union{String, Integer, AbstractFloat, DateTime}
is_basic_type{T<:BASIC_TYPES}(v::T) = true
is_basic_type(v) = false

_ename(name::Symbol) = _ename(string(name))
function _ename(name::String)
    name = lcfirst(name)
    if name in ("type", "return", "end")
        name = "_" * name
    end
    name
end
tbasename{T<:AbstractAWSType}(obj::T) = tbasename(T)
tbasename{T}(::Type{T}) = rsplit(string(T), "."; limit=2)[end]

function aws_execute(env::AWSEnv, action::String, api_name::String, api_ver::String, params::Vector{Tuple}=Vector{Tuple}())
    # prepare the standard params
    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", api_ver))

    amz_headers, data, signed_querystr = canonicalize_and_sign(env, api_name, false, params)

    ep_path = env.ep_path
    endswith(ep_path, '/') && (ep_path = ep_path * "/")
    complete_url = "https://" * ep_host(env, api_name) * ep_path * "?" * signed_querystr
    (env.dbg || env.dry_run) && info("URL:\n$complete_url")

	headers = Dict{String, String}(k=>v for (k,v) in amz_headers)

    apiresp = AWSResponse()
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
            apiresp.obj = AWSError(LightXML.root(LightXML.parse_string(apiresp.body)))
        else
            error("HTTP error: $(resp.status)")
        end
    else
        error("HTTP error: $(resp.status), $(apiresp.body)")
    end

    apiresp
end

function _parse_from_xml{T<:AbstractAWSType}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::Union{LightXML.XMLElement,Void}; member_pfx="")
    typename = Symbol(tbasename(T))
    typeprops = types[typename]
    _parse_from_xml(T, types, typeprops, pd; member_pfx=member_pfx)
end

function _parse_from_xml{T<:AbstractAWSType}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, typeprops::Vector{Pair{Symbol,DataType}}, pd::Union{LightXML.XMLElement,Void}; member_pfx="")
    kwargs = Dict{Symbol,Any}()
    if pd !== nothing
        pd_type = LightXML.find_element(pd, tbasename(T))
        (pd_type === nothing) && (pd_type = pd)
        for (elemname,elemtype) in typeprops
            ename = string(elemname)
            # handle field names that match julia reserved types
            startswith(ename, "_") && (ename = ename[2:end])
            if ((elemtype <: Dict) || ((elemtype <: Vector) && !(elemtype <: Vector{UInt8}))) && isempty(member_pfx)
                elem = LightXML.get_elements_by_tagname(pd_type, ename)
            else
                elem = LightXML.find_element(pd_type, ename)
            end
            (elem === nothing) && continue
            kwargs[Symbol(_ename(ename))] = _parse_from_xml(elemtype, types, elem; member_pfx=member_pfx)
        end
    end
    T(; kwargs...)
end

_parse_from_xml{T<:BASIC_TYPES}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::LightXML.XMLElement; member_pfx="") = AWS.safe_parse_as(T, LightXML.content(pd))

function _parse_from_xml{T}(::Type{Vector{T}}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd_list::Union{LightXML.XMLElement,Void}; member_pfx="")
    result = Vector{T}()
    if pd_list !== nothing
        for pd in LightXML.child_elements(pd_list)
            push!(result, _parse_from_xml(T, types, pd; member_pfx=member_pfx))
        end
    end
    result
end

function _parse_from_xml{T}(::Type{Vector{T}}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd_list::Union{Vector{LightXML.XMLElement},Void}; member_pfx="")
    result = Vector{T}()
    if pd_list !== nothing
        for pd in pd_list
            push!(result, _parse_from_xml(T, types, pd; member_pfx=member_pfx))
        end
    end
    result
end

function _parse_from_xml{Tn,Tv}(::Type{Dict{Tn,Tv}}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd_list::Union{Vector{LightXML.XMLElement},Void}; member_pfx="")
    result = Dict{Tn,Tv}()
    for elem in pd_list
        name = _parse_from_xml(Tn, types, LightXML.find_element(elem, "Name"); member_pfx=member_pfx)
        value = _parse_from_xml(Tv, types, LightXML.find_element(elem, "Value"); member_pfx=member_pfx)
        result[name] = value
    end
    result
end

function _prep_params{T<:AbstractAWSType}(obj::T, params::Vector{Tuple}=Vector{Tuple}(), pfx::String=""; member_pfx="")
    for m in fieldnames(T)
        fld_val = getfield(obj, m)
        (fld_val == nothing) && continue

        arg_name = string(m)
        # handle field names that match julia reserved types
        startswith(arg_name, "_") && (arg_name = arg_name[2:end])
        # captitalize the first letter for the argument
        arg_name = ucfirst(arg_name)

        if is_basic_type(fld_val)
            push!(params, (pfx * arg_name, aws_string(fld_val)))
        elseif isa(fld_val, Vector{UInt8})
            push!(params, (pfx * arg_name, aws_string(fld_val)))
        elseif isa(fld_val, Array)
            for (idx, fv) in enumerate(fld_val)
                subarg_name = "$(pfx)$(arg_name).$(member_pfx)$(idx)"
                if is_basic_type(fv)
                    push!(params, (subarg_name, aws_string(fv)))
                else
                    _prep_params(fv, params, subarg_name*".")
                end
            end
        elseif isa(fld_val, Dict)
            for (idx, nv) in enumerate(fld_val)
                subarg_name = "$(pfx)$(arg_name).$(member_pfx)$(idx).Name"
                subarg_value = "$(pfx)$(arg_name).$(member_pfx)$(idx).Value"
                push!(params, (subarg_name, aws_string(nv[1])))
                fv = nv[2]
                if is_basic_type(fv)
                    push!(params, (subarg_value, aws_string(fv)))
                else
                    _prep_params(fv, params, subarg_value*".")
                end
            end
        else # compound type
            _prep_params(fld_val, params, "$(pfx)$(arg_name).")
        end
    end
    params
end

function generate_type(outfile::IO, specname::String, typename::String, typeprops::Vector{Pair{Symbol,DataType}})
    println(outfile, "")
    println(outfile, "type $typename <: AbstractAWSType")
    for (elemname,elemtype) in typeprops
        println(outfile, "    $(_ename(elemname))::Union{Void,$(elemtype)}")
    end

    elemkws = ["$(_ename(elemname))=nothing" for (elemname,elemtype) in typeprops]
    println(outfile, "    function $(typename)(;", join(elemkws, ", "), ")")
    elemparams = [_ename(elemname) for (elemname,elemtype) in typeprops]
    println(outfile, "        new(", join(elemparams, ", "), ")")
    println(outfile, "    end")

    println(outfile, "    $(typename)(pd) = parse_from_xml($(typename), $(specname), pd)")
    println(outfile, "end # $typename")
    println(outfile, "export $typename") 
end

function generate_types(filename::String, specname::String, types::Vector{Pair{Symbol,Vector{Pair{Symbol,DataType}}}})
    open(filename, "w") do outfile
        println(outfile, "# generated from $specname via AWS/src/codegen.jl")
        println(outfile, "# do not edit, edit specification file and regenerate instead")
        for (typename,typeprops) in types
            generate_type(outfile, specname, string(typename), typeprops)
        end
    end
end

function generate_apis(filename::String, specname::String, apis::Dict)
    open(filename, "w") do outfile
        println(outfile, "# generated from $specname via AWS/src/codegen.jl")
        println(outfile, "# do not edit, edit specification file and regenerate instead")

        for (apiname,apiprops) in apis
            for (reqresptype,reqrespspec) in apiprops
                generate_type(outfile, specname, "$(apiname)$(reqresptype)", reqrespspec)
            end

            has_req = :Request in keys(apiprops)
            has_resp = :Result in keys(apiprops)
            resptype = specname[1:end-8] * "Response"
            apicall = lowercase(specname[1:end-8]) * "_execute"
            println(outfile, "")
            println(outfile, "function $(apiname)(env::AWSEnv", has_req ? ", msg::$(apiname)Request)" : ")")
            println(outfile, "    resp::$(resptype) = $(apicall)(env, \"$(apiname)\"", has_req ? ", msg)" : ")")
            if has_resp
                println(outfile, "    if (resp.pd !== nothing) && (resp.obj === nothing)")
                println(outfile, "        resp.obj = $(apiname)Result(resp.pd)")
                println(outfile, "    end")
            end
            println(outfile, "    resp")
            println(outfile, "end")
            if has_req
                println(outfile, "$(apiname)(env::AWSEnv; kwargs...) = $(apiname)(env, $(apiname)Request(; kwargs...))")
            end
            println(outfile, "export $(apiname)")
        end
    end
end
