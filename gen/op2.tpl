function [[OP_NAME]](env::AWSEnv; kwargs...)
    msg=[[OP_NAME]]Type()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    [[OP_NAME]](env, msg)
end