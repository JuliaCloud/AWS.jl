A typical computational task on EC2 may involve most or all of the following steps:

- Setup AWS configuration

- Create a config.jl specifying EC2 related configuration

- Launch a bunch of EC2 instances

- Optionally log into one of the newly started hosts 

- Add workers from a local REPL or a REPL on a newly started host

- Compute

- Terminate the cluster.

THIS LAST STEP IS VERY IMPORTANT AS THE MACHINES LAUNCHED 
WILL CONTINUE TO BE BILLED BY AMAZON TILL THEY ARE EXPLICITLY STOPPED.

## Setting up AWS config

All the APIs accept an AWSEnv object that specifies, among other things
- aws access key id (REQUIRED)
- aws secret access key (REQUIRED)
- aws region (defaults to US East)

To make it convenient, all APIs accept a default AWSEnv that pick up the 
the AWS Access Keys (Access Key ID and Secret Access Key) either from the environment
or from a file as specified below

Assign and export AWS_ID and AWS_SECKEY in the shell environment like
AWS_ID=AKIAICDLWMNDJZF6GJB5
AWS_SECKEY=HHgUj8G6BNmkuFGtGBDR9KJhTEr2GGtdmnaU9Q/s

or 

Specify the same in seperate lines in a file `.awssecret` in your HOME directory
```
AKIAICDLWMNDJZF6GJB5
HHgUj8G6BNmkuFGtGBDR9KJhTEr2GGtdmnaU9Q/s
```


## config.jl

Create a config file, config.jl, for your run. This file will conatin all EC2
related configuration.

config.jl should contain the following fields:

Specify the AMI to use. 
ami-0d848f64 is a public AMI created by the Julia team with a base Julia install.
Replace it, if desired with your own AMI
For example : __ec2_ami = "ami-0d848f64"__

Specify the ssh key pair you will use to ssh into the launched instances
For example : __ec2_sshkey = "xxxxx"__

Specify the full path to the private key associated with ec2_sshkey 
For example : __ec2_sshkey_file = "/path/to/private/keyfile.pem"__ 

 
Specify the AWS instance type you wish to launch
The section "Instance Type Processor Details" at http://aws.amazon.com/ec2/instance-types/
lists the number of virtual CPUs available with each instance type and the physical
CPU type backing it. 
For example : __ec2_insttype = "m1.large"__  


Specify the number of ec2_insttype instances to launch. Will typically be equal to 
num_workers / num_cores_per_instance where num_workers is the total number 
of workers desired and num_cores_per_instance is the number of CPU cores 
on each instance
For example : __ec2_instnum = 2__


Specify the Julia installed path on the public AMI provided by the Julia team.
Change appropriately if you have your own AMI with a custom Julia
installation 
For example : __ec2_julia_dir = "/home/ubuntu/julia/usr/bin"__ 


Specify an EC2 cluster name. 
All instances launched will be tagged with the key "Owner" set to ec2_uname
For example : __ec2_clustername = "amitm"__ 




A sample config.jl 
```
ec2_ami = "ami-0d848f64"   
ec2_sshkey = "jukey"
ec2_sshkey_file = "/home/myname/mykeys/jukey.pem"
ec2_insttype = "m1.large"
ec2_instnum = 2
ec2_julia_dir = "/home/ubuntu/julia/usr/bin"
ec2_clustername = "amitm"
```

## Sample commands to launch the instances

```
    instances = ec2_launch(ec2_ami, ec2_sshkey, insttype=ec2_insttype, n=ec2_instnum, clustername=clustername)
    hosts = ec2_hostnames(instances)
    println("To ssh into an instance, type : ")
    println("ssh -i $ec2_sshkey_file ubuntu@$(hosts[1][2])")
```

## Launching julia workers

If you want to execute from one of the AWS instances, open an ssh session to the same and
setup 
- AWS credentials
- AWS private key file 
- config.jl
- Pkg.install("AWS"), etc 

Start a julia REPL and add julia workers

To start n workers, spread in a weighted manner(by number of cores) across all nodes in the 
cluster, execute:

```
n = 500
instances = ec2_instances_by_tag("ClusterName", ec2_clustername)
newp = ec2_addprocs(instances, ec2_sshkey_file; dir=ec2_julia_dir, num_workers=n)
```

## Terminate the cluster
```
ec2_terminate(instances)
ec2_show_status(instances)
```

Make sure that the status shows "shutting-down" or equivalent for the instances. If, in a running state
you will continue to be billed by Amazon for the same.


A sample script with the commands described above is available in `sample.jl`


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

- julia is memory hungry - it limits the number of julia workers that can be started on an EC2 node

