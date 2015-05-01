using LibExpat

# 0-indexed
#AssignPrivateIpAddresses

# not reduced to string
#IpRanges

#TODO : handle XML Group definitions

type TypeContext
    name
    const_lhs
    const_rhs
    deps
    definition
    f
    constructor

    TypeContext(name, f) = new(
            name,
            "    $(name)(; " ,
            " new(",
            Set(),
            "type $(name)\n",
            f,
            "function " * name * "(pd::ETree)\n    o = $name()\n"
        )
end

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
empty_types = Set()
all_ctypes_map = Dict{String, ETree}()
valid_rqst_msgs=[]

function get_type_in_jl(xtype_name, ns_pfx)
    if startswith(xtype_name, ns_pfx)
        if xtype_name == "$(ns_pfx)string"
            native_type = ASCIIString
        elseif xtype_name == "$(ns_pfx)integer"
            native_type = Int
        elseif xtype_name == "$(ns_pfx)int"
            native_type = Int
        elseif xtype_name == "$(ns_pfx)long"
            native_type = Int
        elseif xtype_name == "$(ns_pfx)double"
            native_type = Float64
        elseif xtype_name == "$(ns_pfx)dateTime"
            native_type = DateTime
        elseif xtype_name == "$(ns_pfx)boolean"
            native_type = Bool
        else
            error("Unhandled xs type!")
        end

        return (native_type, true)
    elseif startswith(xtype_name, "tns:")
        return (xtype_name[5:end], false)
    end
end

function is_set_type(type_name, is_native, ns_pfx, findpath)
    if !haskey(all_ctypes_map, type_name)
        println("WARNING : type $type_name not defined yet. Skipping...")
        return (false, type_name, is_native, "", "")
    end

    ctype = all_ctypes_map[type_name]
    elements = LibExpat.find (ctype, "$(ns_pfx)sequence/$(ns_pfx)element")
    if isa(elements, Array) && (length(elements) == 1)
        ele = elements[1]
        ele_name = ele.attr["name"]
        if haskey(ele.attr, "maxOccurs") && (ele.attr["maxOccurs"] == "unbounded")
            ele_type_name = ele.attr["type"]
#            println("Found type with single entry of type $ele_type_name array for $type_name")
            startswith(ele_type_name, "tns:") ? ele_type_name = ele_type_name[5:end] : nothing

            ele_type = all_ctypes_map[ele_type_name]
            ele_elements = LibExpat.find (ele_type, "$(ns_pfx)sequence/$(ns_pfx)element")
            ele_choices = LibExpat.find (ele_type, "$(ns_pfx)sequence/$(ns_pfx)choice")
            total_ele = (ele_choices == nothing ? 0 : length(ele_choices)) + (ele_elements == nothing ? 0 : length(ele_elements))

            if isa(ele_elements, Array) && (total_ele == 1)
                ele_ele = ele_elements[1]
                ele_ele_name = ele_ele.attr["name"]
                ele_ele_type_name = ele_ele.attr["type"]

                (jl_type, is_native) =  get_type_in_jl(ele_ele_type_name, ns_pfx)
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


function get_type_for_elements(tctx, elements, ns_pfx)
    lhs_pfx = ""
    rhs_pfx = ""
    path = ""

    for x in elements
        xtype = x.attr["type"]
        rawname = x.attr["name"]
        xname = check_member_name(rawname)


        isarrtype = false
        if haskey(x.attr, "maxOccurs")
            if x.attr["maxOccurs"] == "unbounded"
                isarrtype = true
            else
                maxOccurs = parseint(x.attr["maxOccurs"])
                if (maxOccurs > 1) isarrtype = true end
            end
        end


        (jltype, native) = get_type_in_jl(xtype, ns_pfx)
        jltype_str = string(jltype)

        if native
            replacewitharr = false
            new_jltype_str = jltype_str
        else
            # If this element type is a single element array type and
            # the array is not of a compound type, just create the array
            # directly here.

            (replacewitharr, new_jltype_str, native, findpath, roottype) = is_set_type(jltype_str, native, ns_pfx, rawname)
            if !native
                push!(tctx.deps, new_jltype_str)
            end
        end
#        if endswith(new_jltype_str, "SetType") println("$xname depends on $new_jltype_str") end

#         if replacewitharr
#             println("Replacing $jltype with $new_jltype")
#         end

        type_name = "    " * xname * "::"
        if isarrtype || replacewitharr
            valid_type = "Vector{TYPE}"
        else
            valid_type = "TYPE"
        end

        tctx.const_lhs = tctx.const_lhs * lhs_pfx * xname * "=nothing"
        tctx.const_rhs = tctx.const_rhs * rhs_pfx * xname

        lhs_pfx = ", "
        rhs_pfx = ", "

        # Constructor stuff
        if isarrtype || replacewitharr
            if native
                last_in_path = split(findpath, "/")[end]
                tctx.constructor = tctx.constructor * "    o.$(xname) = AWS.parse_vector_as($(new_jltype_str), \"$(last_in_path)\", LibExpat.find(pd, \"$(findpath)\"))\n"
            else
                if replacewitharr
                    tctx.constructor = tctx.constructor * "    o.$(xname) = AWS.@parse_vector(AWS.EC2.$(roottype), LibExpat.find(pd, \"$(findpath)\"))\n"
                else
                    # Looks like this can be safely ignored - added it to skip list.
                    # Uncomment the below line if you want them generated again
                    push!(skip, tctx.name)

                    tctx.constructor = tctx.constructor * "    o.$(xname) = AWS.@parse_vector(AWS.EC2.$(new_jltype_str), LibExpat.find(pd, \"$(rawname)\"))\n"
                end
            end
        else
            if native
                if jltype == ASCIIString
                    tctx.constructor = tctx.constructor * "    o.$(xname) = LibExpat.find(pd, \"$(rawname)#string\")\n"
                else
                    tctx.constructor = tctx.constructor * "    o.$(xname) = AWS.safe_parse_as($(jltype), LibExpat.find(pd, \"$(rawname)#string\"))\n"
                end
            else
#                 xml_tag_name = new_jltype_str
#                 if endswith(xml_tag_name, "Type") xml_tag_name = new_jltype_str[1:end-4] end
#                 xml_tag_name = lowercase(xml_tag_name[1:1]) * xml_tag_name[2:end]

                tctx.constructor = tctx.constructor * "    o.$(xname) = length(pd[\"$(rawname)\"]) > 0 ?  $(jltype)(LibExpat.find(pd,\"$(rawname)[1]\")) : nothing\n"
            end
        end

        # NOTE : Allowing "Nothing" for all elements since the WSDL is wrong is some places
        # w.r.t. mandatory elements.
        valid_type = "Union($valid_type, Nothing)"

        typetpl = type_name*valid_type


        typestr = replace(typetpl, "TYPE", new_jltype_str)
        tctx.definition = tctx.definition * typestr*"\n"
    end
end

function process_choice_tags(tctx, choice_elems, ns_pfx)
    for choice in choice_elems
        xs_elements = choice["$(ns_pfx)element"]
        if length(xs_elements) > 0
            get_type_for_elements(tctx, xs_elements, ns_pfx)
        else
            error("No 'element's under choice!")
        end
    end
end

function generate_all_types(ctypes, f, ns_pfx)
    #populate the global map of ctypes
    for ctype in ctypes
        all_ctypes_map[ctype.attr["name"]] = ctype
    end

    tag_sequence = ns_pfx * "sequence"
    tag_element = ns_pfx * "element"
    tag_choice = ns_pfx * "choice"
    tag_group = ns_pfx * "group"

    for ctype in ctypes
        if haskey(ctype.attr, "abstract")
            println("Skipping " * ctype.attr["name"] * " - Define manually.")
            continue
        end

        tctx = TypeContext(ctype.attr["name"], f)

        # Skip abstract types (for now)
        seq_elems = ctype[tag_sequence]
        choice_elems = ctype[tag_choice]
        if (length(seq_elems) > 0)
            # sanity check
            if length(seq_elems) > 1 error("More than one sequence!") end
            sequence = seq_elems[1]

            xs_elements = sequence[tag_element]
            choice_elems = sequence[tag_choice]
            group_elems = sequence[tag_group]

            if length(xs_elements) > 0
                get_type_for_elements(tctx, xs_elements, ns_pfx)

            elseif length(choice_elems) > 0
                process_choice_tags(tctx, choice_elems, ns_pfx)

            elseif length(group_elems) > 0
                tctx.definition = "    attribute::ASCIIString\n"
            else
                error("Unknown SEQUENCE TYPE!")
            end
        elseif length(choice_elems) > 0
            process_choice_tags(tctx, choice_elems, ns_pfx)

        elseif length(ctype["*"]) == 0
            push!(empty_types, ctype.attr["name"])
            continue
        else
            println("Skipping " * ctype.attr["name"] * ". Define manually if required")
            continue
        end
        tctx.definition = tctx.definition * "\n" * tctx.const_lhs * ") = \n        " * tctx.const_rhs * ")\nend\n"
        tctx.definition = tctx.definition * tctx.constructor * "    o\nend\n\n"

        if length(tctx.deps) == 0
            #filter out the "SetTypes", not required...
            if (!endswith(tctx.name, "SetType") && !(tctx.name in skip))
                write(f, tctx.definition)
                write(f, "export $(tctx.name)\n\n\n")
             end
            push!(written, tctx.name)
        else
            types_map[tctx.name] = tctx.definition
            push!(pending, tctx.name)
            dep_map[tctx.name] = tctx.deps
            #println("$tctx.name has $tctx.deps dependencies")
        end
    end
end

function write_dependent_types(f)
    # Make multiple passes on the dep_map list and keep writing out whatever is possible in each pass
    while true
        start_cnt = length(pending)
        pending_copy =  copy(pending)
        for item in pending_copy
            deps = dep_map[item]

            #check to see if all the dependcies have been met
            deps_met = true
            for dep in deps
                if !(dep in written)
                    deps_met = false
                    break
                end
            end

            if deps_met
                #filter out the "SetTypes", not required...
                if (!endswith(item, "SetType") && !(item in skip))
                    write(f, types_map[item])
                    write(f, "export $(item)\n\n\n")
                end
                push!(written, item)
                delete!(pending, item)
            end
        end

        new_cnt = length(pending)
        if (new_cnt == 0)
            break
        elseif (new_cnt == start_cnt)
            error("Circular dependency detected!")
        end
    end

end

function generate_operations(wsdl, operations, f, ns_pfx)
    msg_elements = LibExpat.find(wsdl, "types/$(ns_pfx)schema/$(ns_pfx)element")
    msg_type_map = Dict{String, String}()


    for m in msg_elements
        m_type = m.attr["type"]
        if startswith(m_type, "tns:")
            m_type = m_type[5:end]
        end
        msg_type_map[m.attr["name"]] = m_type
    end


    op_tpl = open(readall, "op.tpl")

    for op in operations
        op_name = op.attr["name"]

        # Just following the typical way stuff is done across EC2 APIs
        rqst_type = msg_type_map[op_name]
        resp_type = msg_type_map[op_name * "Response"]

        # make sure that the rqst type is not a NULL type....
        if rqst_type in empty_types
            op_params = ""
            op_msg = ""
            op_altsig=""
        else
            op_params = ", msg::$rqst_type"
            op_msg = ", msg"
            op_altsig = open(readall, "op2.tpl")
        end

        push!(valid_rqst_msgs, rqst_type)

        op_str = replace(op_tpl, "[[OP_ALTSIG]]", op_altsig)
        # Due to a bug in replace() that wasn't replacing
        # all occurances. Delete loop once fixed.
        for i in 1:10
            op_str = replace(op_str, "[[OP_NAME]]", op_name)
            op_str = replace(op_str, "[[OP_MSG]]", op_msg)
            op_str = replace(op_str, "[[OP_PARAMS]]", op_params)
        end

        write (f, "$op_str\n\n")

    end

end



# Generate for EC2
wsdl = xp_parse(open(readall, "./wsdl/ec2_2013_02_01.wsdl"))
# EC2 types....
f = open("../src/ec2_types.jl", "w+")

ctypes = LibExpat.find(wsdl, "types/xs:schema/xs:complexType")

generate_all_types(ctypes, f, "xs:")
write_dependent_types(f)
close(f)

# EC2 calls....
f = open("../src/ec2_operations.jl", "w+")
operations = LibExpat.find(wsdl, "portType/operation")
generate_operations(wsdl, operations, f, "xs:")

# generate the list of valid rqst messages
write(f, "ValidRqstMsgs = Dict(\n    \"$(valid_rqst_msgs[1])\"=>true")
for v in valid_rqst_msgs[2:end]
    write(f, ",\n    \"$v\"=>true")
end
write(f, "\n)\n\n")

close(f)










