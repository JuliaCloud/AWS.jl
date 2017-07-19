@compat abstract type AbstractAWSType end

const BASIC_TYPES = Union{String, Integer, AbstractFloat, DateTime}
is_basic_type{T<:BASIC_TYPES}(v::T) = true
is_basic_type(v) = false

_ename(name::Symbol) = _ename(string(name))
_ename(name::String) = lcfirst(name)
tbasename{T<:AbstractAWSType}(obj::T) = tbasename(T)
tbasename{T}(::Type{T}) = rsplit(string(T), "."; limit=2)[end]

function parse_from_xml{T<:AbstractAWSType}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::Union{LightXML.XMLElement,Void})
    typename = Symbol(tbasename(T))
    typeprops = types[typename]
    parse_from_xml(T, types, typeprops, pd)
end

function parse_from_xml{T<:AbstractAWSType}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, typeprops::Vector{Pair{Symbol,DataType}}, pd::Union{LightXML.XMLElement,Void})
    kwargs = Dict{Symbol,Any}()
    if pd !== nothing
        pd_type = LightXML.find_element(pd, tbasename(T))
        (pd_type === nothing) && (pd_type = pd)
        for (elemname,elemtype) in typeprops
            ename = string(elemname)
            elem = LightXML.find_element(pd_type, ename)
            (elem === nothing) && continue
            kwargs[Symbol(_ename(ename))] = parse_from_xml(elemtype, types, elem)
        end
    end
    T(; kwargs...)
end

parse_from_xml{T<:BASIC_TYPES}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::LightXML.XMLElement) = AWS.safe_parse_as(T, LightXML.content(pd))

function parse_from_xml{T}(::Type{Vector{T}}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd_list::Union{LightXML.XMLElement,Void})
    result = Vector{T}()
    if pd_list !== nothing
        for pd in LightXML.child_elements(pd_list)
            push!(result, parse_from_xml(T, types, pd))
        end
    end
    result
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

function prep_params{T<:AbstractAWSType}(obj::T, params::Vector{Tuple}=Vector{Tuple}(), pfx::String="")
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
        elseif isa(fld_val, Array)
            for (idx, fv) in enumerate(fld_val)
                subarg_name = "$(pfx)$(arg_name).member.$(idx)"
                if is_basic_type(fv)
                    push!(params, (subarg_name, aws_string(fv)))
                else
                    prep_params(fv, params, subarg_name*".")
                end
            end
        else # compound type
            prep_params(fld_val, params, "$(pfx)$(arg_name).")
        end
    end
    params
end
