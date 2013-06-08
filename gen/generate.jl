using LibExpat
using Calendar

# 0-indexed
#AssignPrivateIpAddresses

# not reduced to string
#IpRanges

function check_member_name(mname)
    if mname == "return"
        return "_return"
    elseif mname == "type"
        return "_type"
    end
    return mname
end

types_map = Dict{String, String}()
dep_map = Dict{String, Set}()
written = Set()
pending = Set()
skip = Set()
empty_types = Set("EmptyElementType")
all_ctypes_map = Dict{String, ParsedData}()
all_groups_map = Dict{String, ParsedData}()
groups_type_map = Dict{String, (Array{ASCIIString,1},Array{ASCIIString,1},Array)}()
valid_rqst_msgs={}

function get_type_in_jl(xtype_name, ns_pfx)
    if beginswith(xtype_name, ns_pfx)
        if xtype_name == "$(ns_pfx)string"
            native_type = ASCIIString
        elseif xtype_name == "$(ns_pfx)integer"
            native_type = Int
        elseif xtype_name == "$(ns_pfx)int"
            native_type = Int32
        elseif xtype_name == "$(ns_pfx)long"
            native_type = Int64
        elseif xtype_name == "$(ns_pfx)double"
            native_type = Float64
        elseif xtype_name == "$(ns_pfx)dateTime"
            native_type = CalendarTime
        elseif xtype_name == "$(ns_pfx)boolean"
            native_type = Bool
        else
            error("Unhandled xs type!")
        end
        return (native_type, false, true)
    elseif beginswith(xtype_name, "tns:")
        name = xtype_name[5:]
        if contains(empty_types,name)
            return ("Nothing", false, true)
        else
            if name == "EmptyElementType"
                error(name)
            end
            return (name, false, false)
        end
    end 
end

function is_set_type(type_name, is_native, ns_pfx, findpath)
    if !haskey(all_ctypes_map, type_name)
        println("WARNING : type $type_name not defined yet. Skipping...")
        return (false, type_name, is_native, "", "")
    end
    
    ctype = all_ctypes_map[type_name]
    elements = find (ctype, "$(ns_pfx)sequence/$(ns_pfx)element")
    if isa(elements, Array) && (length(elements) == 1)
        ele = elements[1]
        ele_name = ele.attr["name"]
        if haskey(ele.attr, "maxOccurs") && (ele.attr["maxOccurs"] == "unbounded")
            (ele_type_name,_,is_native) = get_type_in_jl(ele.attr["type"],ns_pfx)
            ele_type_name = string(ele_type_name)
            #println("Found type with single entry of type $ele_type_name array for $type_name")

            ele_type = all_ctypes_map[ele_type_name]
            ele_elements = find (ele_type, "$(ns_pfx)sequence/$(ns_pfx)element")
            ele_choices = find (ele_type, "$(ns_pfx)sequence/$(ns_pfx)choice")
            total_ele = (ele_choices == nothing ? 0 : length(ele_choices)) + (ele_elements == nothing ? 0 : length(ele_elements))
            
            if isa(ele_elements, Array) && (total_ele == 1)
                ele_ele = ele_elements[1]
                ele_ele_name = ele_ele.attr["name"]
                ele_ele_type_name = ele_ele.attr["type"]

                (jl_type, _ , is_native) =  get_type_in_jl(ele_ele_type_name, ns_pfx) 
                return (true, string(jl_type), is_native, "$(ele_name)/$(ele_ele_name)", jl_type)
            elseif isa(ele_elements, Array)
#                println("$ele_type_name is not reduceable further")
                return (true, ele_type_name, is_native, "$(findpath)/$(ele_name)", ele_type_name)
            else
#                println("$ele_type_name is probably a choice")
                return (true, ele_type_name, is_native, "$(findpath)/$(ele_name)", ele_type_name)
            end
        end
    end
    return (false, type_name, is_native, "", "")
end

function get_type_for_element(element,deps,ns_pfx)
    xtype = element.attr["type"]
    xname = element.attr["name"]
    isarrtype = false
    mandatory = true
    if haskey(element.attr, "maxOccurs")
        if element.attr["maxOccurs"] == "unbounded"
            isarrtype = true
        else
            maxOccurs = parseint(element.attr["maxOccurs"])
            if (maxOccurs > 1) isarrtype = true end
        end
    end
    if haskey(element.attr, "minOccurs")
        if parseint(element.attr["minOccurs"])==0
            mandatory = false
        end
    end
    (jltype, is_array, native) = get_type_in_jl(xtype, ns_pfx)
    type_str = string(jltype)
    if !native
        (isarrtype, type_str, native, findpath, roottype) = is_set_type(type_str, native, ns_pfx, xname)
        if !native
            #println("New Dependency: ",type_str)
            add!(deps,type_str)
        end
    else 
        findpath = xname
    end
    if isarrtype || is_array
        type_str = "Vector{$type_str}"
    end
    if !mandatory
        type_str = "Union($type_str,Nothing)"
    end
    type_str, "\"$findpath\""
end

function process_choice_tag(choice,deps,ns_pfx)
    xs_elements = choice["$(ns_pfx)element"]
    if length(xs_elements) > 0
        types = ASCIIString[]
        findpaths = ASCIIString[]
        for el in xs_elements
            t, findpath = get_type_for_element(el,deps,ns_pfx)
            push!(types,t)
            push!(findpaths,findpath)
        end
        return ("Union("*join(types,",")*")","["*join(findpaths,",")*"]")
    else
        error("No 'element's under choice!")
    end
end

function process_group_el(el,deps,ns_pfx)
    name = normalize_type(el.attr["ref"])
    if !haskey(groups_type_map,name)
        new_fieldnames, new_types, new_findpaths = parse_type_or_group(all_groups_map[name],deps,ns_pfx)
        groups_type_map[name] = (new_fieldnames, new_types, new_findpaths)
    end
    groups_type_map[name] 
end


function parse_type_or_group(ctype,deps,ns_pfx)
    tag_sequence = ns_pfx * "sequence"
    tag_element = ns_pfx * "element"
    tag_choice = ns_pfx * "choice"
    tag_group = ns_pfx * "group"

    fieldnames = ASCIIString[]
    types = ASCIIString[]
    findpaths = ASCIIString[]
    seq_elems = ctype[tag_sequence]
    choice_elems = ctype[tag_choice]
    group_elems = ctype[tag_group]
    if (length(seq_elems) > 0)
        # sanity check
        if length(seq_elems) > 1 error("More than one sequence!") end

        sequence = seq_elems[1]
        xs_elements = sequence[tag_element]
        choice_elems = sequence[tag_choice]
        group_elems = sequence[tag_group]

        for el in sequence.elements
            if isa(el,ParsedData)
                name = el.name
                if name == ns_pfx*"element"
                    push!(fieldnames,el.attr["name"])
                    t,fp = get_type_for_element(el,deps,ns_pfx)
                    push!(types,t)
                    push!(findpaths,fp)
                elseif name == ns_pfx*"choice"
                    # TODO: Fix name
                    push!(fieldnames,join(map(x->x.attr["name"],el[tag_element]),"or"))
                    t,fp = process_choice_tag(el,deps,ns_pfx)
                    push!(types,t)
                    push!(findpaths,fp)
                elseif name == ns_pfx*"group"
                    new_fieldnames,new_types,new_findpaths = process_group_el(el,deps,ns_pfx)
                    append!(fieldnames,new_fieldnames)
                    append!(types, new_types) 
                    append!(findpaths, new_findpaths)
                else
                    error("Unknown SEQUENCE TYPE $name (for prefix $(ns_pfx))!")
                end
                
            end
        end            
    elseif length(choice_elems) > 0
        for el in choice_elems
            push!(fieldnames,join(map(x->x.attr["name"],el[tag_element]),"or"))
            t,fd = process_choice_tag(el,deps,ns_pfx)
            push!(types,t)
            push!(findpaths,fd)
        end
    elseif length(group_elems) > 0
        for el in group_elems
            new_fieldnames,new_types,new_findpaths = process_group_el(el,deps,ns_pfx)
            append!(fieldnames,new_fieldnames)
            append!(types, new_types)  
            append!(findpaths, new_findpaths)
        end 
    elseif length(ctype["*"]) == 0 
        println(ctype)
        add!(empty_types, ctype.attr["name"]) 
    else
        println("Skipping " * ctype.attr["name"] * ". Define manually if required")
    end 
    (fieldnames,types,findpaths)
end

function write_info(io::IO,name,fieldnames,types,findpaths)
    write(f,"(")
    # write typename
    show(f,name)
    add!(written,name)
    # write fields
    write(f,",Symbol[")
    for x in fieldnames
        write(f,":")
        write(f,x)
        write(f,",")
    end
    write(f,"],")
    # write types
    write(f,"{")
    for x in types
        write(f,":(")
        write(f,x)
        write(f,"),")
    end
    write(f,"},")
    # write findpaths
    write(f,"{")
    for x in findpaths
        write(f,x)
        write(f,",")
    end
    write(f,"}),\n")
end

function generate_all_types(ctypes, f, ns_pfx)
    #populate the global map of ctypes
    for ctype in ctypes
        all_ctypes_map[ctype.attr["name"]] = ctype
    end

    for ctype in ctypes
        # Skip abstract types (for now)
        if haskey(ctype.attr, "abstract")
            println("Skipping " * ctype.attr["name"] * " - Define manually.")
            continue
        end

        deps = Set()
        fieldnames, types, findpaths = parse_type_or_group(ctype,deps,ns_pfx)
        name = ctype.attr["name"]

        # We don't bother creating a type if it's empty
        if isempty(fieldnames) || endswith(name, "SetType") || contains(skip, name)
            continue
        end

        if length(deps) == 0 
            write_info(f,name,fieldnames,types,findpaths)
        else
            add!(pending,(name,fieldnames,types,findpaths))
            dep_map[name] = deps
        end
    end

end

function normalize_type(t)
    if beginswith(t, "tns:")
        t = t[5:]
    end
    t
end

function generate_operations(wsdl, operations, f, ns_pfx)
    msg_elements = find(wsdl, "types/$(ns_pfx)schema/$(ns_pfx)element")
    msg_type_map = Dict{String, String}()

    for m in msg_elements
        msg_type_map[m.attr["name"]] = normalize_type(m.attr["type"])
    end
    
    write(f,"operations = {")
    
    for op in operations
        op_name = op.attr["name"]
        
        # Just following the typical way stuff is done across EC2 APIs
        rqst_type = msg_type_map[op_name]
        resp_type = msg_type_map[op_name * "Response"]

        # make sure that the rqst type is not a NULL type....
        if contains(empty_types, rqst_type)
            rqst_type = "nothing"
        end

        write(f,"(")
        show(f,op_name)
        write(f,","*rqst_type*","*resp_type*"),\n")
    end

    write(f,"}")
end

function write_dependent_types(f)
    # Make multiple passes on the dep_map list and keep writing out whatever is possible in each pass
    while true
        #println("New Loop")
        start_cnt = length(pending)
        pending_copy =  copy(pending)   
        for (name,fieldnames,types,findpaths) in pending_copy
            deps = dep_map[name]
            
            #check to see if all the dependcies have been met
            deps_met = true
            #println(name)
            for dep in deps 
                if !contains(written, dep) && !endswith(dep, "SetType") && !contains(empty_types,dep)
                    #println("\tDependency not met $dep")
                    deps_met = false
                    break
                end
            end
            
            if deps_met
                #filter out the "SetTypes", not required...
                if !endswith(name, "SetType") && !contains(skip, name)
                    write_info(f,name,fieldnames,types,findpaths)
                end
                delete!(pending, (name,fieldnames,types,findpaths), nothing)
            end
        end
        
        new_cnt = length(pending)
        if (new_cnt == 0) 
            break
        elseif (new_cnt == start_cnt)
            #showall(map(x->x[1],collect(pending)))
            error("Circular dependency detected!")
        end
    end

end

# Generate for EC2
wsdl = xp_parse(open(readall, "./wsdl/ec2_2013_02_01.wsdl"))

# EC2 types....
f = open("../src/ec2_types.jl", "w+")

ctypes = find(wsdl, "types/xs:schema/xs:complexType")
groups = find(wsdl, "types/xs:schema/xs:group")

for g in groups
    all_groups_map[g.attr["name"]] = g
end
write(f,"types = {")
generate_all_types(ctypes, f, "xs:")
write_dependent_types(f)
write(f,"}")
close(f)

# EC2 calls....
f = open("../src/ec2_operations.jl", "w+")
operations = find(wsdl, "portType/operation")
generate_operations(wsdl, operations, f, "xs:")

close(f)