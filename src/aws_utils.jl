
safe_parseint32(s) = (s != nothing) ? int32(s) : nothing 
safe_parseint64(s) = (s != nothing) ? int64(s) : nothing 
safe_parseint(s) = (s != nothing) ? parseint(s) : nothing 
safe_parsebool(s) = (s != nothing) ? ((lowercase(s) == "true") ? true : false) : nothing 

function safe_parse_as(as::Type, s::Union(String, Nothing))
    if (as == String) || (s == nothing)
        return s
    elseif (as == Int)
        return parseint(s)
    elseif (as == Int32)
        return int32(s)   
    elseif (as == Float64)
        return float64(s)   
    elseif (as == Int64)
        return int64(s)   
    elseif (as == Bool)
        return (lowercase(s) == "true" ? true : false)
    elseif (as == CalendarTime)
        return Calendar.parse("yyyy-MM-DD'T'HH:mm:ss", s[1:end-1], "GMT")
    end
    error("Unsupported parse type")
end

macro parse_vector (typ, vect)
     quote
        jl_vect = $(esc(typ))[]
        if ($(esc(vect)) != nothing) 
            for pd in $(esc(vect))
                push!(jl_vect, $(typ)(pd))
            end
        end
        jl_vect
     end
end
export parse_vector


function parse_vector_as (as_type::Type, typ_str::String, vect)
    jl_vect = as_type[]
    if (vect == nothing) return jl_vect end
    for pd in vect
        val = find(pd, "/" * typ_str * "#text")
        val = safe_parse_as(as_type, val)
        if (val == nothing) error("Invalid $(typ_str) for pd vector") end
        push!(jl_vect, val)
    end
    
    jl_vect
end
export parse_vector_as

function parse_calendar_time(pd::ParsedData, elem::String, format::String)
    datestr = find(pd, "$(elem)#text")
    Calendar.parse(format, datestr[1:end-1], "GMT")
end
parse_calendar_time(pd::ParsedData, elem::String) = parse_calendar_time(pd, elem, "yyyy-MM-DD'T'HH:mm:ss")


