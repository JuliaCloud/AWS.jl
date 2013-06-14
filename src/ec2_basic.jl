


ec2_basic(env::AWSEnv, action::String, params_in::Dict{Any, Any}) = ec2_execute(env, action, flatten_params(params_in))
export ec2_basic



flatten_params(d::Dict{Any, Any}) = flatten_params(Array(Tuple, 0), "", d)
function flatten_params(ft::Array, pfx::String, d::Dict{Any, Any})
    for (k, v) in collect(d)
        if isa(v, Array)
            for (i, x) in enumerate(v)
                npfx = pfx * k * "." * string(i)
                if isa(x, Array) || isa(x, Dict)
                    flatten_params(ft, npfx * ".", x)
                else
                    push!(ft, (npfx, aws_string(x)))
                end
            end
            
        elseif isa(v, Dict)
            flatten_params(ft, pfx*k*".", v)
        else
            push!(ft, (pfx*k, aws_string(v)))
        end
    
    end
    ft
end


    





