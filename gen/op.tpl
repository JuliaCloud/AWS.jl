function [[OP_NAME]](env::AWSEnv[[OP_PARAMS]])
    ec2resp::EC2Response = call_ec2(env, "[[OP_NAME]]" [[OP_MSG]])
    if  (ec2resp.pd != nothing) && (ec2resp.obj == nothing)
        ec2resp.obj = [[OP_NAME]]ResponseType(ec2resp.pd)
    end
    ec2resp
end
[[OP_ALTSIG]]
export [[OP_NAME]]
