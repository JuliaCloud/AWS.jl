using AWS.EC2
using AWS

include("config.jl")

n=2
instances = ec2_launch(ami, keyname; owner=owner, insttype=insttype, n=n, clustername="ec2test")
println(instances)

instances=ec2_instances_by_tag("Owner", owner)
println(instances)

try
    ec2_show_status(instances)

    hostnames = ec2_hostnames(instances)
    println(hostnames)

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami)
    if length(newp) != (n*2)
        println("ERROR : Did not auto-detect number of cores $(length(newp)) != $(2*n)")
    end
#    println("Launched workers on instance type $insttype pids: \n$newp ")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, workers_per_instance=3)
    if length(newp) != (n*3)
        println("ERROR : Did not launch required number of workers $(length(newp)) != $(3*n)")
    end
#    println("Launched workers with pids: \n$newp")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, num_workers=5)
    if length(newp) != 5
        println("ERROR : Did not launch required number of workers $(length(newp)) != 5")
    end
#    println("Launched workers with pids: \n$newp")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, num_workers=1)
    if length(newp) != 1
        println("ERROR : Did not launch required number of workers $(length(newp)) != 1")
    end
#    println("Launched workers with pids: \n$newp")
    
catch
    println("ERROR")
    # We anyway need to terminate the instances....
end

ec2_terminate(instances)

ec2_show_status(instances)
