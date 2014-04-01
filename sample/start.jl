using AWS.EC2
using AWS

include("config.jl")

instances = ec2_instances_by_tag("ClusterName", ec2_clustername; running_only=false)
println("Starting previously stopped EC2 nodes : ", instances)

ec2_start(instances)
ec2_show_status(instances)
