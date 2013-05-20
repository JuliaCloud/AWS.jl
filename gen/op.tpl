function [[OP_NAME]](env::AWSEnv [[OP_PARAMS]])
    return call_ec2(env, "[[OP_NAME]]" [[OP_MSG]])
end
export [[OP_NAME]]