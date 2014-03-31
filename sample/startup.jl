using AWS.EC2
using AWS

include("config.jl")

instances = ec2_launch(ec2_ami, ec2_sshkey, insttype=ec2_insttype, n=ec2_instnum, clustername=ec2_clustername)





