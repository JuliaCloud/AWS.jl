using AWS.EC2
using AWS

include("config.jl")

instances = ec2_launch(ami, keyname; uname=uname, insttype=insttype)
println(instances)

instances=ec2_instances_by_owner(uname)
println(instances)

try
    ec2_show_status(instances)

    hostnames = ec2_hostnames(instances)
    println(hostnames)


    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami)
    if length(newp) != 2
        println("ERROR : Did not auto-detect number of cores")
    end
    println("Launched workers on instance type $insttype pids: \n$newp ")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, workers_per_instance=3)
    if length(newp) != 3
        println("ERROR : Did not launch required number of workers")
    end
    println("Launched workers with pids: \n$newp")
catch
    println("ERROR")
    # We anyway need to terminate the instances....
end

ec2_terminate(instances)

ec2_show_status(instances)
