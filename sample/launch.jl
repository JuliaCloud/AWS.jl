using AWS.EC2
using AWS

include("config.jl")

instances = ec2_launch(ec2_ami, ec2_sshkey, insttype=ec2_insttype, n=ec2_instnum, clustername=ec2_clustername)
instances

hosts = ec2_hostnames(instances)
sshflags = `-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -i $(ec2_sshkey_file)`
if ec2_install_julia
    println("Installing Julia on launched nodes")
    @sync begin
        for host in hosts
            @async begin 
                run(`scp $sshflags jinstall.sh ubuntu@$(host[2]):/home/ubuntu/`)
                run(`ssh $sshflags ubuntu@$(host[2]) "./jinstall.sh"`)
            end
        end
    end
    
    
    println("Configuring ssh for passwordless login in-between hosts")
    run(`ssh $sshflags ubuntu@$(hosts[1][2]) "ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N \"\""`)
    run(`scp $sshflags ubuntu@$(hosts[1][2]):/home/ubuntu/.ssh/id_rsa ubuntu@$(hosts[1][2]):/home/ubuntu/.ssh/id_rsa.pub /tmp/`)
    
    @sync begin
        for host in hosts
            @async begin 
                run(`scp $sshflags /tmp/id_rsa  /tmp/id_rsa.pub ubuntu@$(host[2]):/home/ubuntu/.ssh/`)
                run(`ssh $sshflags ubuntu@$(host[2]) "cat /home/ubuntu/.ssh/id_rsa.pub >> /home/ubuntu/.ssh/authorized_keys"`)
            end
        end
    end
    
    println("DONE installing Julia on all launched nodes")
end

