## ec2_simple API

#### ec2_launch

```
    ec2_launch(ami::String, seckey::String; env=AWSEnv(), insttype::String="m1.small", 
        n::Integer=1, owner::String="julia", clustername::String="julia", 
        launchset::String="")
```

- can be used to launch `n` instances of ami `ami`. 

- AWS security credentials and region are defined as usual in the `env` object.

`insttype` is the EC2 instance type.

The created instances are tagged with the following keys:

- `LaunchSet` => value of keyword argument `launchset`. If `""`, current datetime is used to tag. 
    
- `ClusterName` => value of keyword argument `clustername`. This is mainly used to 
    identify different clusters of nodes on the same AWS account.   

- `Owner` => value of keyword argument `owner`.

`ec2_launch` returns an array of `instanceId` s    
    

#### ec2_addprocs
    
```
    ec2_addprocs(instances, ec2_keyfile::String; env=AWSEnv(), hostuser::String="ubuntu", 
        dir=JULIA_HOME, tunnel=true, use_public_dnsname=true, workers_per_instance=0, num_workers=0)
```

is the AWS:EC2 equivalent of the built-in `addprocs`

- `instances` is an array of EC2 instance ids
- `ec2_keyfile` is the private key associated with the `seckey` used in `ec2_launch` above.  Complete path and filename are required. It is 
  important that the file has the correct permissions set. 

-  `hostuser`, `dir` and `tunnel` are as defined in the julia builtin `addprocs`
- set `use_public_dnsname` to true if you are creating a julia cluster from a julia session outside of EC2 - for example, from your laptop.
- `workers_per_instance=n` results in 'n' workers being started on each instance. If unspecified(or 0), `n` is taken to be the number of 
  CPU cores on the machine and an equal number of processes are started on the node. 
- If num_workers > 0, it takes precendence over workers_per_instance, and the total of num_workers is distributed across all instances
  in propotion to the number of cores on each instance.
    

#### ec2_start

 `ec2_start(instances; env=AWSEnv())` starts stopped EC2 instances


#### ec2_stop

 `ec2_stop(instances; env=AWSEnv())` stops running EC2 instances

#### ec2_terminate

 `ec2_terminate (instances; env=AWSEnv())` terminates the EC2 instances


#### ec2_show_status

 `ec2_show_status(instances; env=AWSEnv())` prints and returns an array of `(instanceId, instanceState.code, instanceState.name)` for each of the instances specified.


#### ec2_instances_by_tag

 `ec2_instances_by_owner (tag, tagvalue; env=AWSEnv(), running_only=true)` returns all instances with the requested tag.
 By default, the following tags are available for each instance
 
 - "Owner" - Identifies the owner of the instances. Helpful when an AWS account is shared by more than one person. Defaults to "julia"
 
 - "LaunchSet" - Identifies a set of EC2 instances launched together. Defaults to a stringified timestamp.
 
 - "ClusterName" - Identifies a set of logically related instances. Defaults to "julia"

 - "Name" - Same as ClusterName.
 
 Also, by default the call only returns running instances, not stopped or terminated ones. To see all instances
 pass running_only=false
 
 

#### ec2_mount_snapshot

```
    ec2_mount_snapshot (instance::String, snapshot::String, mount::String, 
        ec2_keyfile::String; env=AWSEnv(), dev="/dev/xvdh", hostuser::String="ubuntu")
```
    
    attaches the specified `snapshot` to `dev` and then mounts it at mountpoint `mount` on the instance specified by `instance`
