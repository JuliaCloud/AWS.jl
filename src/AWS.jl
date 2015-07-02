module AWS
using LibExpat


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


const AP_NORTHEAST_1 = "ap-northeast-1" # Asia Pacific (Tokyo) Region
const AP_SOUTHEAST_1 = "ap-southeast-1" # Asia Pacific (Singapore) Region
const AP_SOUTHEAST_2 = "ap-southeast-2" # Asia Pacific (Sydney) Region
const EU_WEST_1 = "eu-west-1" # EU (Ireland) Region
const SA_EAST_1 = "sa-east-1" # South America (Sao Paulo) Region
const US_EAST_1 = "us-east-1" # US East (Northern Virginia) Region
const US_WEST_1 = "us-west-1" # US West (Northern California) Region
const US_WEST_2 = "us-west-2" # US West (Oregon) Region

# Search for default AWS_ID and AWS_SECKEY
AWS_ID = ""
AWS_SECKEY = ""
if haskey(ENV, "AWS_ID") && haskey(ENV, "AWS_SECKEY")
    AWS_ID = ENV["AWS_ID"]
    AWS_SECKEY = ENV["AWS_SECKEY"]
else
    secret_path = "$(homedir())/.awssecret"
    @windows_only begin
        secret_path = "$(ENV["APPDATA"])/.awssecret"
    end

    if isfile(secret_path)
        AWS_ID, AWS_SECKEY = split(readchomp(open(secret_path)))
    end
end

type AWSEnv
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    ep_host::String     # region endpoint (host)
    ep_path::String     # region eddpoint (path)
    timeout::Float64    # request timeout in seconds, default is no timeout.
    dry_run::Bool       # If true, no actual request will be made - implies dbg flag below
    dbg::Bool           # print request to screen


    function AWSEnv(; id=AWS_ID, key=AWS_SECKEY, ep=EP_US_EAST_NORTHERN_VIRGINIA, timeout=0.0, dr=false, dbg=false)
        if (id == "") || (key == "")
            error("Invalid AWS security credentials provided")
        end

        s = search(ep,"/")
        if length(s) == 0
            ep_host = ep
            ep_path = "/"
        else
            ep_host = ep[1:(first(s)-1)]
            ep_path = ep[first(s):end]
        end

        if dr
            new(id, key, ep_host, ep_path, timeout, dr, true)
        else
            new(id, key, ep_host, ep_path, timeout, false, dbg)
        end
    end

end
export AWSEnv



include("aws_utils.jl")
include("crypto.jl")
include("EC2.jl")
include("S3.jl")

include("show.jl")


end
