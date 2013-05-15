module EC2

using LibExpat
using libCURL.HTTPC


function send_ec2_request()

end


include("ec2_types.jl")
include("ec2_operations.jl")

end