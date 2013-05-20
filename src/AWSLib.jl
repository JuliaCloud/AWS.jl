module AWSLib

type AWSEnv
    ep::String          # region endpoint
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    dry_run::Bool         # If true, no actual request will be made - it will only be printed to screen
    
    AWSEnv(ep, id, key) = new(ep, id, key, false)
    AWSEnv(ep, id, key, dbg) = new(ep, id, key, dbg)
end
export AWSEnv

include("EC2.jl")
end