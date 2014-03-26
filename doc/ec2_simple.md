## ec2_simple API

#### ec2_launch

```
    ec2_launch(ami::String, seckey::String; env=AWSEnv(), insttype::String="m1.small", 
        n::Integer=1, uname::String="julia", instname::String="julia", 
        launchset::String="")
```

- can be used to launch `n` instances of ami `ami`. 

- AWS security credentials and region are defined as usual in the `env` object.

`insttype` is the EC2 instance type.

The created instances are tagged with the following keys:

- `LaunchSet` => value of keyword argument `launchset`. If `""`, current datetime is used to tag. This is mainly used to 
    identify different clusters of nodes on the same AWS account.
    
- `Name` => value of keyword argument `instname`.    

- `Owner` => value of keyword argument `uname`.    

`ec2_launch` returns an array of `instanceId` s    
    

#### ec2_addprocs
    
```
    ec2_addprocs(instances, ec2_keyfile::String; env=AWSEnv(), hostuser::String="ubuntu", 
        dir=JULIA_HOME, tunnel=true, use_public_dnsname=true, workers_per_instance=0)
```

is the AWS:EC2 equivalent of the built-in `addprocs`

- `instances` is an array of EC2 instance ids
- `ec2_keyfile` is the private key associated with the `seckey` used in `ec2_launch` above.  Complete path and filename are required. It is 
  important that the file has the correct permissions set. 

-  `hostuser`, `dir` and `tunnel` are as defined in the julia builtin `addprocs`
- set `use_public_dnsname` to true if you are creating a julia cluster from a julia session outside of EC2 - for example, from your laptop.
- `workers_per_instance=n` results in 'n' workers being started on each instance. If unspecified(or 0), `n` is taken to be the number of 
  CPU cores on the machine and an equal number of processes are started on the node. 
    

#### ec2_start

 `ec2_start(instances; env=AWSEnv())` starts stopped EC2 instances


#### ec2_stop

 `ec2_stop(instances; env=AWSEnv())` stops running EC2 instances

#### ec2_terminate

 `ec2_terminate (instances; env=AWSEnv())` terminates the EC2 instances


#### ec2_show_status

 `ec2_show_status(instances; env=AWSEnv())` prints and returns an array of `(instanceId, instanceState.code, instanceState.name)` for each of the instances specified.


#### ec2_instances_by_owner

 `ec2_instances_by_owner (owner::String; env=AWSEnv())` returns all running instances tagged with "Owner" 'owner'

#### ec2_mount_snapshot

```
    ec2_mount_snapshot (instance::String, snapshot::String, mount::String, 
        ec2_keyfile::String; env=AWSEnv(), dev="/dev/xvdh", hostuser::String="ubuntu")
```
    
    attaches the specified `snapshot` to `dev` and then mounts it at mountpoint `mount` on the instance specified by `instance`
