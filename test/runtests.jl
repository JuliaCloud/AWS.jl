using AWS

config_file = isempty(ARGS) ? "config.jl" : ARGS[1]
include(config_file)

include("tests3.jl")
include("testsqs.jl")
include("ec2_utils.jl")
#include("testec2.jl")

const dbg = get(config, "dbg", false)
const key = get(config, "key", AWS.AWS_SECKEY)
const id = get(config, "key", AWS.AWS_ID)
const region = get(config, "region", AWS.AWS_REGION)

env = AWSEnv(timeout=60.0, id=id, key=key, region=region, dbg=dbg)

TestS3.runtests(env, config)
TestSQS.runtests(env, config)
TestEC2Utils.runtests(env, config)
