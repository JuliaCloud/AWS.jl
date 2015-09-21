module Showing

using AWS
using AWS.EC2
using AWS.S3

import Base.show, Base.Meta.quot

print_indented(io::IO,s,indent) = print(io," "^indent,s)
show_indented(io::IO,s::ASCIIString,indent) = print(io,s*"\n")
show_indented(io::IO,::Void,indent) = print(io,"Not set\n")
show_indented(io::IO,i,indent) = println(io,i)

function show_indented(io::IO, s::Array, indent)
    println(io,eltype(s)," Array")
    for x in s
        print_indented(io,"",indent)
        show_indented(io,x,indent+4)
    end
end

function show_indented(io::IO, s::Dict, indent)
    println(io,eltype(s)," Dict")
    for (k,v) in collect(s)
        print_indented(io,"",indent)
        show_indented(io,string(k," => ",v),indent+4)
    end
end

macro show_func(n, t)
    #n,t,id_sym = eval(n),eval(t),eval(id_sym)
    block = Expr(:block)
    for x in fieldnames(t)
        push!(block.args,quote
            $(esc(:print_indented))(io,$(string(x)*": "),indent)
            $(esc(:show_indented))(io,r.($(quot(x))),indent+4)
        end)
    end
    ret = quote
        function $(esc(:show_indented))(io::IO,r::$(t),indent)
            $(esc(:print))(io,$(string(n)))
            println(io)
            $(block)
        end
        $(esc(:show))(io::IO,r::$(t)) = $(esc(:show_indented))(io,r,0)
    end
    ret
end

# Create default show method for all types
for m in [AWS, AWS.EC2, AWS.S3]
    for n in names(m)
        t = (m).(n)
        if isa(t,Type)
            @eval @show_func $n $t
        end
    end
end

end
