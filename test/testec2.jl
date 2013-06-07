using AWS.EC2
using AWS

include("ec2_utils.jl")

println("desc_avail_zones")
desc_avail_zones()
println("launch_n_ec2")
instances = launch_n_ec2(1)
println("get_hostnames")
hostnames = get_hostnames(instances)
println("get_running_instances_by_owner")
instances = get_running_instances_by_owner ("amitm")
println("terminate_instances")
terminate_instances(instances)
println("DONE!!")


