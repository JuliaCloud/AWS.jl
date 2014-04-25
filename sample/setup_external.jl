using AWS.EC2
using AWS

include("config.jl")

instances = ec2_instances_by_tag("ClusterName", ec2_clustername)
hosts = ec2_hostnames(instances)

println("Creating addprocs_external.jl")
f = open("addprocs_external.jl", "w")
machines = ec2_addprocs(instances, ec2_sshkey_file; 
                        use_public_dnsname=true, 
                        num_workers=ec2_num_workers, 
                        workers_per_instance=ec2_workers_per_instance,
                        machines_only=true)

if ec2_install_julia
    ec2_julia_dir = "/usr/bin"
end

for mset in machines
    print(f, "addprocs([")
    lenmset = length(mset)
    for (i,m) in enumerate(mset)
        print(f, "\"$m", i == lenmset ? "\"" : "\"," )
    end
    print(f, "]; tunnel=true, dir=\"$(ec2_julia_dir)\",  sshflags=`-i $ec2_sshkey_file -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR`)\n\n")
end
println(f, "println(\"nworkers = \$(nworkers())\")")
flush(f)
close(f)

println()
println("Use the following commands to execute from a external node on EC2")
println()
println("  julia compute_external.jl")
println("OR")
println("  julia")
println("  julia> include(\"compute_external.jl\")")
println()


