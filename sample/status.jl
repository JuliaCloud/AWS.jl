using AWS.EC2
using AWS

include("config.jl")

instances = ec2_instances_by_tag("ClusterName", ec2_clustername)
hosts = ec2_hostnames(instances)

println("Running hosts in cluster $ec2_clustername")
println(hosts)
