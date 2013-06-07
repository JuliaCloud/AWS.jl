module Showing

using AWS
using AWS.EC2

import Base.show, Base.Meta.quot

print_indented(io::IO,s,indent) = print(io," "^indent,s)
show_indented(io::IO,s::ASCIIString,indent) = print(io,s*"\n")
show_indented(io::IO,::Nothing,indent) = print(io,"Not set\n")
show_indented(io::IO,i,indent) = println(io,i)

function show_indented(io::IO, s::Array, indent)
    println(io,eltype(s)," Array")
    for x in s 
        print_indented(io,"",indent)
        show_indented(io,x,indent+4)
    end
end

macro show_func(n, t)
    #n,t,id_sym = eval(n),eval(t),eval(id_sym)
    block = Expr(:block)
    for i in 1:length(t.names)
        x = t.names[i]
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

# Create default show method for all types in EC2
for n in names(AWS.EC2)
    t = AWS.EC2.(n)
    if isa(t,Type)
        id_sym = t.names[1]
        @eval @show_func $n $t 
    end
end

end