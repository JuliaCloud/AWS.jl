A typical computational task on EC2 may involve most or all of the following steps:

- Setup AWS configuration

- Create a config.jl specifying EC2 related configuration

- Launch (or Start a previously stopped) a bunch of EC2 instances

- Optionally log into one of the newly started hosts and perform computations from an EC2 head node

- Or execute from a julia session external to EC2

- Terminate(or Stop) the cluster.

THIS LAST STEP IS VERY IMPORTANT AS THE MACHINES LAUNCHED 
WILL CONTINUE TO BE BILLED BY AMAZON TILL THEY ARE EXPLICITLY STOPPED/TERMINATED.

## Setting up AWS config

All the APIs accept an AWSEnv object that specifies, among other things
- aws access key id (REQUIRED)
- aws secret access key (REQUIRED)
- aws region (defaults to US East)

To make it convenient, all APIs accept a default AWSEnv that pick up the 
the AWS Access Keys (Access Key ID and Secret Access Key) either from the environment
or from a file as specified below

Assign and export AWS_ID and AWS_SECKEY in the shell environment like

```
AWS_ID=AKIAICDLWMNDJZF6GJB5
AWS_SECKEY=HHgUj8G6BNmkuFGtGBDR9KJhTEr2GGtdmnaU9Q/s
```

or 

Specify the same in seperate lines in a file `.awssecret` in your HOME directory
```
AKIAICDLWMNDJZF6GJB5
HHgUj8G6BNmkuFGtGBDR9KJhTEr2GGtdmnaU9Q/s
```


## config.jl

Create a config file, config.jl, for your run. This file will contain all EC2
related configuration.

config.jl should contain the following fields:

__ec2_ami = "ami-0d848f64"__

Specify the AMI to use. The sample config.jl will by default have a public AMI
with a base Julia install. Replace it, if desired with your own AMI



__ec2_sshkey = "xxxxx"__

Specify the ssh key pair you will use to ssh into the launched instances



__ec2_sshkey_file = "/path/to/private/keyfile.pem"__ 

Specify the full path to the private key associated with ec2_sshkey 



__ec2_insttype = "m1.large"__

Specify the AWS instance type you wish to launch
The section "Instance Type Processor Details" at http://aws.amazon.com/ec2/instance-types/
lists the number of virtual CPUs available with each instance type and the physical
CPU type backing it. 



__ec2_instnum = 2__

Specify the number of ec2_insttype instances to launch. Will typically be equal to 
num_workers / num_cores_per_instance where num_workers is the total number 
of workers desired and num_cores_per_instance is the number of CPU cores 
on each instance


__workers_per_instance = 8__

Specify the number of workers_per_instance to be launched. If set to 0,
it is set to the number of cores for each instance.



__ec2_num_workers = 50__

Alternatively, you can just specify the total number of workers. This count is 
distributed across the instances weighted by the number of cores on each insatnce.



__ec2_julia_dir = "/home/ubuntu/julia/usr/bin"__ 

Specify the Julia installed path on the public AMI provided by the Julia team.
Change appropriately if you have your own AMI with a custom Julia
installation 


__ec2_clustername = "test1000"__ 
Specify an EC2 cluster name. 
All instances launched will be tagged with the key "Owner" set to ec2_clustername





A sample config.jl 
```
ec2_ami = "ami-ab8190c2"   
ec2_sshkey = "juec2key"
ec2_sshkey_file = "/home/user/keys/juec2key.pem"
ec2_insttype = "m2.4xlarge"
ec2_instnum = 1
ec2_workers_per_instance = 0
ec2_num_workers = 10
ec2_julia_dir = "/home/ubuntu/julia/usr/bin" 
ec2_clustername = "jusample"
```

## Available helper scripts for executing on EC2

- launch.jl - Launches EC2 nodes based on values specified in config.jl

- start.jl - Starts previously stopped EC2 nodes based on values specified in config.jl

- addprocs_*.jl - Generated files with "addprocs" statements to add the appropriate 
                  number of workers either from a headnode or an external host
                  
- setup_headnode.jl - Creates addprocs_headnode.jl, 
                      copies the scripts into /home/ubuntu/run onto one of the EC2 nodes, 
                      prints instructions to connect and execute from the headnode.
                      
- setup_external.jl - Creates addprocs_external.jl,
                      prints instructions to execute from an external host.

- compute_headnode.jl - This adds workers based on the generated, addprocs_headnode.jl file
                        Also includes a user file "compute.jl" if present. User code can thus 
                        be added to compute.jl and it will be executed after the workers have been 
                        added

- compute_external.jl - Similar to compute_headnode.jl above, but for execution from an external 
                        host(like a laptop)

- stop.jl - Stops all instances associated with the cluster. This allows for having a set of machines
            ready and primed to be started whenever required.

- terminate.jl - Terminates all instances associated with the cluster


## Typical workflow for executing from a head node

From the localhost, i.e. machine external to EC2
- Change and edit config.jl
- julia launch.jl
- julia setup_headnode.jl
- ssh into a headnode

At the headnode
- cd run
- julia 
- julia include("compute_headnode.jl")
- do other work

After all work is done, exit from the host, and from localhost
- julia terminate.jl           # VERY VERY IMPORTANT


## Typical workflow for executing an external host

From the local, i.e. machine external to EC2
- Change and edit config.jl
- julia launch.jl
- julia setup_external.jl
- julia 
- julia include("compute_external.jl")
- do other work

After all work is done, 
- julia terminate.jl           # VERY VERY IMPORTANT




NOTE: In the steps above, launch.jl and terminate.jl can be replaced by start.jl and stop.jl respectively, if you intend to 
work off a previously launched cluster.


## AMI NOTES
- Increase MaxStartups field in /etc/ssh/sshd_config in order to support a large number of open ssh connections to each host
- edit /etc/security/limits.conf and increase the open fd count allowed to a process. For example to set it to 8192, add
```
*             soft       nofile          8192
*             hard       nofile          8192
```
- The default security group must allow connections to port 22 from the Internet and direct connections to all ports on
  from the private network
  
- Password less login from other hosts in the cluster (for cases when addprocs is done from a head node)

- julia to be built using 'make dist' since we may run across different EC2 machines types

- julia is memory hungry - it effectively limits the number of julia workers that can be started on an EC2 node

