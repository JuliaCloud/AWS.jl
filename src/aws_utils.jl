
safe_parseint32(s) = (s != nothing) ? Base.parse(Int32, s) : nothing
safe_parseint64(s) = (s != nothing) ? Base.parse(Int64, s) : nothing
safe_parseint(s) = (s != nothing) ? Base.parse(Int, s) : nothing
safe_parsebool(s) = (s != nothing) ? ((lowercase(s) == "true") ? true : false) : nothing
safe_parseb64(s) = (s != nothing) ? base64decode(s) : nothing

function safe_parse_as(as::Type, s::Union{AbstractString, Void})
    if (as == AbstractString) || (s == nothing)
        return s
    elseif (as == Int)
        return Base.parse(Int, s)
    elseif (as == Int32)
        return int32(s)
    elseif (as == Float64)
        return float64(s)
    elseif (as == Int64)
        return int64(s)
    elseif (as == Bool)
        return (lowercase(s) == "true" ? true : false)
    elseif (as == DateTime)
        return DateTime(s[1:end-1])
    end
    error("Unsupported parse type")
end
export safe_parse_as

macro parse_vector(typ, vect)
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
export @parse_vector
 

function parse_vector_as(as_type::Type, typ_str::AbstractString, vect)
    jl_vect = as_type[]
    if (vect == nothing) return jl_vect end
    for pd in vect
        val = LightXML.content(LightXML.find_element(pd, typ_str))
        val = safe_parse_as(as_type, val)
        if (val == nothing) error("Invalid $(typ_str) for pd vector") end
        push!(jl_vect, val)
    end

    jl_vect
end
export parse_vector_as

function parse_calendar_time(pd, elem::AbstractString, format::AbstractString)
    datestr = LightXML.content(LightXML.find_element(pd, elem))
    DateTime(datestr[1:end-1], format)
end
parse_calendar_time(pd, elem::AbstractString) = parse_calendar_time(pd, elem, "yyyy-MM-DD'T'HH:mm:ss")


xml(o::Any) = string(o)
xml(tag::AbstractString, value::Any) = (value != nothing) ? "<$(tag)>" * xml(value) * "</$(tag)>" : ""

function xml(tag::AbstractString, children::Array; xmlns="", xsi_type="")
    if (xsi_type != "")
        open_tag = "<$(tag)$(xmlns) xsi:type=\"$(xsi_type)\">"
    else
        open_tag = "<$(tag)$(xmlns)>"
    end

    children_xml = ""
    for child in children
        if isa(child, Tuple)
            (child_tag, child_value) = child
            children_xml = children_xml * xml(child_tag, child_value)
        else
            children_xml = children_xml * xml(child)
        end
    end

    return open_tag * children_xml * "</$(tag)>"
end


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
export aws_string


#ISO8601
function get_utc_timestamp(addsecs=0;basic=false)
    dt = Dates.unix2datetime(Dates.datetime2unix(now(Dates.UTC)) + addsecs)
    dstr = aws_string(dt)
    if basic
        dstr = replace(dstr, Set(":-"), "")
    end
    return string(dstr, "Z")
end
export get_utc_timestamp
