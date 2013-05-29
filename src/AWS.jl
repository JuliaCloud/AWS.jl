module AWS
using LibExpat
using Calendar


const EP_US_EAST_NORTHERN_VIRGINIA     = "ec2.us-east-1.amazonaws.com"
const EP_US_WEST_OREGON                = "ec2.us-west-2.amazonaws.com"
const EP_US_WEST_NORTHERN_CALIFORNIA   = "ec2.us-west-1.amazonaws.com"
const EP_EU_IRELAND                    = "ec2.eu-west-1.amazonaws.com"
const EP_AP_SINGAPORE                  = "ec2.ap-southeast-1.amazonaws.com"
const EP_AP_SYDNEY                     = "ec2.ap-southeast-2.amazonaws.com"
const EP_AP_TOKYO                      = "ec2.ap-northeast-1.amazonaws.com"
const EP_SA_SAO_PAULO                  = "ec2.sa-east-1.amazonaws.com"

export EP_US_EAST_NORTHERN_VIRGINIA, EP_US_WEST_OREGON, EP_US_WEST_NORTHERN_CALIFORNIA
export EP_EU_IRELAND, EP_AP_SINGAPORE, EP_AP_SYDNEY, EP_AP_TOKYO, EP_SA_SAO_PAULO

type AWSEnv
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    ep::String          # region endpoint
    timeout::Float64    # request timeout in seconds, default is 180 seconds
    dry_run::Bool       # If true, no actual request will be made - implies dbg flag below
    dbg::Bool           # print request to screen
    
    AWSEnv(id, key) = AWSEnv(id, key, EP_US_EAST_NORTHERN_VIRGINIA)
    AWSEnv(id, key, ep) = AWSEnv(id, key, ep, 180.0, false, false)
    AWSEnv(id, key, ep, timeout, dr, dbg) = dr ? new(id, key, ep, timeout, dr, true) : new(id, key, ep, timeout, false, dbg)
end
export AWSEnv



include("crypto.jl")
include("EC2.jl")
end