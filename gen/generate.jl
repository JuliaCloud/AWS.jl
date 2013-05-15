using LibExpat


type TypeContext
    name
    const_lhs
    const_rhs
    deps
    definition
    f
    
    TypeContext(name, f) = new(
            name,
            "    " * name * "(" ,
            " new(", 
            Set(),
            "type " * name * "\n",
            f
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
empty_types = Set()
all_ctypes_map = Dict{String, ParsedData}()

function is_set_type(type_name)
    ctype = all_ctypes_map[type_name]
    elements = find (ctype, "xs:sequence/xs:element")
    if isa(elements, Array) && (length(elements) == 1)
        ele = elements[1]
        if haskey(ele.attr, "maxOccurs") && (ele.attr["maxOccurs"] == "unbounded")
            ele_type_name = ele.attr["type"]
            println("Found type with single entry of type $ele_type_name array for $type_name")
            
            if beginswith(ele_type_name, "tns:")
                ele_type_name = ele_type_name[5:]
            end
            
            ele_type = all_ctypes_map[ele_type_name]
            ele_elements = find (ele_type, "xs:sequence/xs:element")
            
            if isa(ele_elements, Array) && (length(ele_elements) == 1)
                ele_ele = ele_elements[1]
                ele_ele_name = ele_ele.attr["name"]
                ele_ele_type_name = ele_ele.attr["type"]
                
                if beginswith(ele_ele_type_name, "xs:")
                    println("$ele_type_name is of a basic type $ele_ele_type_name")
                    return (true, ele_ele_type_name[4:])
                else
                    println("$ele_type_name is of a compound type $ele_ele_type_name")
                    return (true, ele_ele_type_name[5:])
                end
            elseif isa(ele_elements, Array)
                println("$ele_type_name is not reduceable further")
                return (true, ele_type_name)
            else
                println("$ele_type_name is probably a choice")
                return (true, ele_type_name)
            end
        end
    end
    return (false, nothing)
end



function get_type_for_elements(tctx, elements, optional_in=false)
    lhs_pfx = ""
    rhs_pfx = ""
    
    for x in elements
        xtype = x.attr["type"]
        xname = check_member_name(x.attr["name"])
        
        optional = optional_in ? true : false
        if haskey(x.attr, "minOccurs")
            minOccurs = parseint(x.attr["minOccurs"])
            if (minOccurs == 0) optional = true end
        end
        
        isarrtype = false
        if haskey(x.attr, "maxOccurs")
            if x.attr["maxOccurs"] == "unbounded"
                isarrtype = true
            else
                maxOccurs = parseint(x.attr["maxOccurs"])
                if (maxOccurs > 1) isarrtype = true end
            end
        end

        type_name = "    " * xname * "::"
        if isarrtype
            valid_type = "Array{TYPE,1}"
        else
            valid_type = "TYPE"
        end
        
        
        
        if !optional
            tctx.const_lhs = tctx.const_lhs * lhs_pfx * xname
            tctx.const_rhs = tctx.const_rhs * rhs_pfx * xname
            lhs_pfx = ", "
        else
            tctx.const_rhs = tctx.const_rhs * rhs_pfx *  "nothing"
            valid_type = "Union($valid_type, Nothing)"
        end
        rhs_pfx = ", "

        typetpl = type_name*valid_type
        
        
        if xtype == "xs:string"
            eletype = "String"
        elseif xtype == "xs:integer"
            eletype = "Int"
        elseif xtype == "xs:int"
            eletype = "Int32"
        elseif xtype == "xs:long"
            eletype = "Int64"
        elseif xtype == "xs:double"
            eletype = "Float64"
        elseif xtype == "xs:dateTime"
            eletype = "XSDateTime"
        elseif xtype == "xs:boolean"
            eletype = "Bool"
        else
            if beginswith(xtype, "tns:") 
                eletype = xtype[5:]
                
                # If this element type is a single element array type and
                # the array is not of a compound type, just create the array 
                # directly here.
                is_set_type(eletype)
                
                add!(tctx.deps, eletype)
            else
                error("Unknown element datatype $xtype !")
            end
        end
        
        typestr = replace(typetpl, "TYPE", eletype)
        tctx.definition = tctx.definition * typestr*"\n"
    end
end


function process_choice_tags(tctx, choice_elems)
    for choice in choice_elems
        if haskey(choice.elements, "xs:element")
            xs_elements = choice_elems[1].elements["xs:element"]
            get_type_for_elements(tctx, xs_elements, true)
        else
            error("No 'element's under choice!")
        end
    end
end

function generate_all_types(ctypes, f)
    #populate the global map of ctypes
    for ctype in ctypes
        all_ctypes_map[ctype.attr["name"]] = ctype
    end

    for ctype in ctypes
        tctx = TypeContext(ctype.attr["name"], f)
        
        if haskey(ctype.elements, "xs:sequence")
            seq_elems = ctype.elements["xs:sequence"]
            # sanity check
            if length(seq_elems) > 1 error("More than one sequence!") end
            sequence = seq_elems[1]
            
            if haskey(sequence.elements, "xs:element")
                xs_elements = seq_elems[1].elements["xs:element"]
                get_type_for_elements(tctx, xs_elements)
                
            elseif haskey(sequence.elements, "xs:choice")
                process_choice_tags(tctx, seq_elems[1].elements["xs:choice"])
                
            elseif haskey(sequence.elements, "xs:group")
                tctx.definition = "    attribute::String\n"
            else
                error("Unknown SEQUENCE TYPE!")
            end
        elseif haskey(ctype.elements, "xs:choice")
            process_choice_tags(tctx, ctype.elements["xs:choice"])
            
        elseif length(ctype.elements) == 0
            add!(empty_types, ctype.attr["name"])
            continue
        else
            error("Unknown elements type!")
        end 
        tctx.definition = tctx.definition * "\n" * tctx.const_lhs * ") = " * tctx.const_rhs * ")\n" * "end\n"
        
        
        if length(tctx.deps) == 0
            write(f, tctx.definition)
            write(f, "export $(tctx.name)\n\n\n")
            flush(f)
            add!(written, tctx.name)
            #println("$tctx.name has no dependencies")
        else
            types_map[tctx.name] = tctx.definition
            add!(pending, tctx.name)
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
                if !contains(written, dep) 
                    deps_met = false
                    break
                end
            end
            
            if deps_met
                write(f, types_map[item])
                write(f, "export $(item)\n\n\n")
                add!(written, item)
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


function generate_operations(wsdl, operations, f)
    msg_elements = find(wsdl, "definitions/types/xs:schema/xs:element")
    msg_type_map = Dict{String, String}()
    
    
    for m in msg_elements
        m_type = m.attr["type"]
        if beginswith(m_type, "tns:")
            m_type = m_type[5:]
        end
        msg_type_map[m.attr["name"]] = m_type
    end
    
    
    for op in operations
        op_name = op.attr["name"]
        
        # Just following the typical way stuff is done across EC2 APIs
        rqst_type = msg_type_map[op_name]
        resp_type = msg_type_map[op_name * "Response"]

        # make sure that the rqst type is not a NULL type....
        if contains(empty_types, rqst_type)
            write (f, "function $op_name ()\n") 
        else
            write (f, "function $op_name (msg::$rqst_type)\n") 
        end
        
        write (f, "# response of type $resp_type\n") 
        write (f, "end\n") 
        write (f, "export $op_name\n\n\n") 
    
    end

end



# Load all the WSDLs
for wsdl_file in split(readall(`ls ./wsdl`))
    wsdl = xp_parse(open(readall, "./wsdl/" * wsdl_file))

    
    # EC2 types....
    f = open("../src/ec2_types.jl", "w+")
    write(f, "type XSDateTime\n\ty::Int\n\tm::Int\n\td::Int\n\th::Int\n\tmi::Int\n\ts::Int\nend\n\n")
    
    ctypes = find(wsdl, "definitions/types/xs:schema/xs:complexType")
    generate_all_types(ctypes, f)
    write_dependent_types(f)
    close(f)
    
    # EC2 calls....
    f = open("../src/ec2_operations.jl", "w+")
    operations = find(wsdl, "definitions/portType/operation")
    generate_operations(wsdl, operations, f)
    
    
    close(f)
    
    
end




