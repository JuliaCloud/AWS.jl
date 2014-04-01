using AWS.EC2
using AWS

include("config.jl")

instances = ec2_instances_by_tag("ClusterName", ec2_clustername)
println("Stopping EC2 nodes : ", instances)

ec2_stop(instances)
ec2_show_status(instances)
