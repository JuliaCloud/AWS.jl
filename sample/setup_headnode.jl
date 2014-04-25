using AWS.EC2
using AWS

include("config.jl")

instances = ec2_instances_by_tag("ClusterName", ec2_clustername)
hosts = ec2_hostnames(instances)

println("Creating addprocs_headnode.jl")
f = open("addprocs_headnode.jl", "w")
machines = ec2_addprocs(instances, ec2_sshkey_file; 
                        use_public_dnsname=false, 
                        num_workers=ec2_num_workers, 
                        workers_per_instance=ec2_workers_per_instance,
                        machines_only=true)
                        
for mset in machines
    print(f, "addprocs([")
    lenmset = length(mset)
    for (i,m) in enumerate(mset)
        print(f, "\"$m", i == lenmset ? "\"" : "\"," )
    end
    print(f, "]; sshflags=`-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR`)\n\n")
end
println(f, "println(\"nworkers = \$(nworkers())\")")
flush(f)
close(f)

println("Copy files to head node into directory /home/ubuntu/run")

sshflags = `-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -i $(ec2_sshkey_file)`
run(`ssh $sshflags ubuntu@$(hosts[1][2]) "mkdir -p /home/ubuntu/run"`)
run(`scp $sshflags compute_headnode.jl config.jl addprocs_headnode.jl test_workers.jl ubuntu@$(hosts[1][2]):/home/ubuntu/run`)
if isfile("compute.jl")
    run(`scp $sshflags compute.jl ubuntu@$(hosts[1][2]):/home/ubuntu/run`)
end

println()
println("Use the following commands to connect, cd and execute on the head node")
println()
println("  ssh -i $(ec2_sshkey_file) ubuntu@$(hosts[1][2])")
println("  cd run")
println("  julia compute_headnode.jl")
println("OR")
println("  ssh -i $(ec2_sshkey_file) ubuntu@$(hosts[1][2])")
println("  cd run")
println("  julia")
println("  julia> include(\"compute_headnode.jl\")")
println()


