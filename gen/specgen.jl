# A spec file generator for AWS APIs.
#
# Since AWS does not publish WSDL files anymore,
# this crawls AWS API specification web pages and
# extracts relevant information as a Julia specification file.
#
# Parsing (of copmplex types particularly) is not very accurate.
# Since scraping web pages is inherently flaky, it seems better
# to keep the logic simple and easy to change. Scraping logic
# may need tweaks if changes to the HTML pages break it. The 
# generated file needs manual verification and minor edits.

using Cascadia
using Gumbo
using Requests

function attr_type(elem)
    txt = nodeText(elem)
    is_array = contains(txt, "Array")
    parts = split(txt)
    !is_array && (return String(parts[2]))
    return "Vector{$(parts[4])}"
end

function parse_type_attrs(elem)
    qs = matchall(Selector(".term"), elem)
    attr_names = map(nodeText, qs)

    qs = matchall(Selector("p:contains(\"Type:\")"), elem)
    attr_types = map(attr_type, qs)

    attributes = Vector{Pair{String,String}}()
    for (a,b) in zip(attr_names, attr_types)
        push!(attributes, a=>b)
    end

    attributes
end

function parse_type_name(elem)
    qs = matchall(Selector(".topictitle"), elem)
    nodeText(qs[1])
end

function parse_type_id(elem)
    qs = matchall(Selector(".topictitle"), elem)
    qs[1].attributes["id"]
end

"""
Generate type specification for an individual type.
"""
function gen_type(url)
    r = get(url)
    h = parsehtml(bytestring(r.data))

    typename = parse_type_name(h.root)
    attributes = parse_type_attrs(h.root)

    info(typename, " => ", attributes)
    typename => attributes
end

"""
Parse the type collection page and
iterate through individual type pages.
"""
function gen_types(url)
    all_types = Vector{Pair{String,Vector{Pair{String,String}}}}()

    info("type list: ", url)
    r = get(url)
    h = parsehtml(bytestring(r.data))

    qs = matchall(Selector(".listitem > p > a"), h.root)
    baseurl = rsplit(url, '/'; limit=2)[1]
    info("got ", length(qs), " types")
    for elem in qs
        typeuri = elem.attributes["href"]
        typeurl = baseurl * "/" * typeuri
        info("type spec ", length(all_types)+1, " of ", length(qs), ": ", typeurl)
        push!(all_types, gen_type(typeurl))
    end

    all_types
end

"""
Generate API specification for an individual operation.
"""
function gen_api(url)
    r = get(url)
    h = parsehtml(bytestring(r.data))

    apiname = parse_type_name(h.root)
    apiid = parse_type_id(h.root)

    q_reqp = matchall(Selector("#"*apiid*"_RequestParameters"), h.root)
    q_resp = matchall(Selector("#"*apiid*"_ResponseElements"), h.root)
    params_list = String[]
    isempty(q_reqp) || push!(params_list, "Request")
    isempty(q_resp) || push!(params_list, "Result")
    var_list = matchall(Selector(".variablelist"), h.root)

    req_resp = Dict()
    for idx in 1:length(params_list)
        param_type = params_list[idx]
        vars = var_list[idx]
        attributes = parse_type_attrs(vars)
        req_resp[param_type] = attributes
    end

    info(apiname, " => ", req_resp)
    apiname => req_resp
end

"""
Parse the operations collection page and
iterate through individual operation pages.
"""
function gen_apis(url)
    all_apis = Dict()

    info("api list: ", url)
    r = get(url) 
    h = parsehtml(bytestring(r.data))

    qs = matchall(Selector(".listitem > p > a"), h.root)
    baseurl = rsplit(url, '/'; limit=2)[1]
    info("got ", length(qs), " apis")
    for elem in qs
        apiuri = elem.attributes["href"]
        apiurl = baseurl * "/" * apiuri
        info("api spec ", length(all_apis)+1, " of ", length(qs), ": ", apiurl)
        push!(all_apis, gen_api(apiurl))
    end

    all_apis
end

"""
Generate API specification for `apiname` from the provided
URLs pointing to types and operations specifications.
Also create a Julia specification file with appropriate name
that can be used subsequently with `gen.jl`.
"""
function write_spec(apiname, typesurl, apisurl)
    all_types = gen_types(typesurl)
    all_apis = gen_apis(apisurl)

    specfile = lowercase(apiname)*"_spec.jl"
    open(specfile, "w") do outfile
        println(outfile, "const ", apiname, "Types = [")
        isfirst = true
        for (type_name,type_spec) in all_types
            println(outfile, isfirst ? "    :" : "    ,:", type_name, " => [")
            isfirstattr = true
            for (attr_name,attr_type) in type_spec
                println(outfile, isfirstattr ? "        :" : "        ,:", attr_name, " => ", attr_type)
                isfirstattr = false
            end
            println(outfile, "    ]")
            isfirst = false
        end
        println(outfile, "]")
        println(outfile, "")
        println(outfile, "const ", apiname, "Api = Dict(")
            isfirst = true
            for (api_name,api_spec) in all_apis
                println(outfile, isfirst ? "    :" : "    ,:", api_name, " => Dict(")
                isfirstparam = true
                for (param_name,param_spec) in api_spec
                    println(outfile, isfirstparam ? "        :" : "        ,:", param_name, " => [")
                    isfirstattr = true
                    for (attr_name,attr_type) in param_spec
                        println(outfile, isfirstattr ? "            :" : "            ,:", attr_name, " => ", attr_type)
                        isfirstattr = false
                    end
                    println(outfile, "        ]")
                    isfirstparam = false
                end
                println(outfile, "    )")
                isfirst = false
            end
        println(outfile, ")")
    end

    typefile = lowercase(apiname)*"_gen_types.jl"
    open(typefile, "w") do outfile
        for (type_name,type_spec) in all_types
            println(outfile, "type $type_name end")
        end
    end
end

# generate and write out specification for each API class
write_spec("AutoScaling", "http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_Types.html", "http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_Operations.html")
write_spec("SQS", "http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_Types.html", "http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_Operations.html")
write_spec("EC2", "http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Types.html", "http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Operations.html")
