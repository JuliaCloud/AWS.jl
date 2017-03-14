using AWS.EC2
using AWS

env = AWSEnv()

### Config related to EC2 only
const ami = "ami-0d848f64" # This is the Julia installed version of 13_04
const dir_on_ami = "/home/ubuntu/julia/usr/bin"
const insttype = "m1.large"
const keyname = "<put ec2keyname here>"
const owner = "awstest"
const keyfile = "<put full path to ec2keyfile here>"

n=2
## env=AWSEnv(; id=id, key=key, dbg=dbg, region=region)
env=AWSEnv()
instances = ec2_launch(ami, keyname; env=env, owner=owner, insttype=insttype, n=n, clustername="ec2test")
println(instances)

all_instances=ec2_instances_by_tag("Owner", owner, env=env, running_only=false)
println(all_instances)

try
    ec2_show_status(instances)

    hostnames = ec2_hostnames(instances)
    println(hostnames)

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, exename=joinpath(dir_on_ami, "julia"))
    if length(newp) != (n*2)
        println("ERROR : Did not auto-detect number of cores $(length(newp)) != $(2*n)")
    end
#    println("Launched workers on instance type $insttype pids: \n$newp ")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, exename=joinpath(dir_on_ami, "julia"), workers_per_instance=3)
    if length(newp) != (n*3)
        println("ERROR : Did not launch required number of workers $(length(newp)) != $(3*n)")
    end
#    println("Launched workers with pids: \n$newp")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, exename=joinpath(dir_on_ami, "julia"), num_workers=5)
    if length(newp) != 5
        println("ERROR : Did not launch required number of workers $(length(newp)) != 5")
    end
#    println("Launched workers with pids: \n$newp")

    newp = ec2_addprocs(instances, keyfile; dir=dir_on_ami, exename=joinpath(dir_on_ami, "julia"), num_workers=1)
    if length(newp) != 1
        println("ERROR : Did not launch required number of workers $(length(newp)) != 1")
    end
#    println("Launched workers with pids: \n$newp")

catch e
    println("ERROR: $e")
    # We anyway need to terminate the instances....
end

resp = EC2.DescribeInstances(env)
## @show resp

EC2.check_running(env, instances)
EC2.MonitorInstances(env)



rmprocs(workers())

println("Sleeping for 20 secs !!!")
sleep(20)

println("Stopping instances !!!")
ec2_stop(instances; env=env)

println("Terminating instances !!!")
@show instances
ec2_terminate(instances; env=env)

println("Checking instance status !!!")
ec2_show_status(instances; env=env)
