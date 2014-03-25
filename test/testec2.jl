using AWS.EC2
using AWS

const ami_ubuntu_13_04_64_bit_US_east = "ami-0d848f64" # This is the Julia installed version of 13_04
instances = ec2_launch(ami_ubuntu_13_04_64_bit_US_east, "jublr")
println(instances)

instances=ec2_instances_by_owner("julia")
println(instances)

ec2_show_status(instances)

hostnames = ec2_hostnames(instances)
println(hostnames)

ec2_terminate(instances)

ec2_show_status(instances)
