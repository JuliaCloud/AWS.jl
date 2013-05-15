using LibExpat

type TypeContext
    type_name
    const_lhs
    const_rhs
    type_deps
    type_definition
end



types_map = Dict{String, String}()
dep_map = Dict{String, Set}()
written = Set()
pending = Set()


function get_type_for_elements(ctype_name, constructor_lhs, constructor_rhs, type_deps, elements, typedef, optional_in=false)
    lhs_pfx = ""
    rhs_pfx = ""
    
    for x in elements
        xtype = x.attr["type"]
        
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

        type_name = "    " * x.attr["name"] * "::"
        if isarrtype
            valid_type = "Array{TYPE,1}"
        else
            valid_type = "TYPE"
        end
        
        
        
        if !optional
            constructor_lhs = constructor_lhs * lhs_pfx * x.attr["name"]
            constructor_rhs = constructor_rhs * rhs_pfx * x.attr["name"]
            lhs_pfx = ", "
        else
            constructor_rhs = constructor_rhs * rhs_pfx *  "nothing"
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
            eletype = "DateTime"
        elseif xtype == "xs:boolean"
            eletype = "Bool"
        else
            if beginswith(xtype, "tns:") 
                eletype = xtype[5:]
                add!(type_deps, eletype)
            else
                error("Unknown element datatype $xtype !")
            end
        end
        
        typestr = replace(typetpl, "TYPE", eletype)
        typedef = typedef * typestr*"\n"
    end
    
    return typedef, constructor_lhs, constructor_rhs
end


f = open("../src/ec2_types.jl", "w+")

# Load all the WSDLs
for wsdl_file in split(readall(`ls ./wsdl`))
    wsdl = xp_parse(open(readall, "./wsdl/" * wsdl_file))
    
    # print out the relevant stuff
    ctypes = find(wsdl, "definitions/types/xs:schema/xs:complexType")
    
    for ctype in ctypes
        ctype_name = ctype.attr["name"]
        constructor_lhs = "    " * ctype_name * "(" 
        constructor_rhs = " new(" 
        typedef = "type " * ctype_name * "\n"
        type_deps = Set()
        
        if haskey(ctype.elements, "xs:sequence")
            seq_elems = ctype.elements["xs:sequence"]
            if haskey(seq_elems[1].elements, "xs:element")
                xs_elements = seq_elems[1].elements["xs:element"]
                (typedef, constructor_lhs, constructor_rhs) = get_type_for_elements(ctype_name, constructor_lhs, constructor_rhs, type_deps, xs_elements, typedef)
                
            elseif haskey(seq_elems[1].elements, "xs:choice")
                println("SEQUENCE THEN CHOICE!")
            elseif haskey(seq_elems[1].elements, "xs:group")
                typedef = "    attribute::String\n"
            else
                error("Unknown SEQUENCE TYPE!")
            end
        elseif haskey(ctype.elements, "xs:choice")
            choice_elems = ctype.elements["xs:choice"]
            if haskey(choice_elems[1].elements, "xs:element")
                xs_elements = choice_elems[1].elements["xs:element"]
                (typedef, constructor_lhs, constructor_rhs) = get_type_for_elements(ctype_name, constructor_lhs, constructor_rhs, type_deps, xs_elements, typedef, true)
            else
                error("No elements under choice!")
            end
            
            # TODO: handle multiple choice sections...
            
        elseif length(ctype.elements) == 0
            println("NO ELEMENTS!")
        else
            error("Unknown elements type!")
        end 
        typedef = typedef * "\n" * constructor_lhs * ") = " * constructor_rhs * ")\n" * "end\n\n"
        
        
        if length(type_deps) == 0
            write(f, typedef)
            flush(f)
            add!(written, ctype_name)
            #println("$ctype_name has no dependencies")
        else
            types_map[ctype_name] = typedef
            add!(pending, ctype_name)
            dep_map[ctype_name] = type_deps
            #println("$ctype_name has $type_deps dependencies")
        end
    end 
end

# Make multiple passed on the dep_map list and keep writing out whatever is possible in each pass

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


close(f)