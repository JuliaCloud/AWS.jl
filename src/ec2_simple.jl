export ec2_terminate, ec2_addprocs, ec2_launch, ec2_start, ec2_stop, ec2_show_status, ec2_hostnames, ec2_instances_by_owner
export ec2_mount_snapshot


ec2_basic(env::AWSEnv, action::String, params_in::Dict{Any, Any}) = ec2_execute(env, action, flatten_params(params_in))
export ec2_basic



flatten_params(d::Dict{Any, Any}) = flatten_params(Array(Tuple, 0), "", d)
function flatten_params(ft::Array, pfx::String, d::Dict{Any, Any})
    for (k, v) in collect(d)
        if isa(v, Array)
            for (i, x) in enumerate(v)
                npfx = pfx * k * "." * string(i)
                if isa(x, Array) || isa(x, Dict)
                    flatten_params(ft, npfx * ".", x)
                else
                    push!(ft, (npfx, aws_string(x)))
                end
            end
            
        elseif isa(v, Dict)
            flatten_params(ft, pfx*k*".", v)
        else
            push!(ft, (pfx*k, aws_string(v)))
        end
    
    end
    ft
end


# Have a set of simple APIS for common use cases. Will grow as per feature requests.

CHK_ERR(resp::EC2Response) = (typeof(resp.obj) == EC2Error) ? error(ec2_error_str(resp.obj)) : resp.obj


function ec2_terminate (instances; env=AWSEnv())
    req = TerminateInstancesType(instancesSet=instances)
    resp = CHK_ERR(TerminateInstances(env, req))
    instances
end

function check_running(env, chk_instances)
    new_chk_instances = ASCIIString[]
    resp = CHK_ERR(DescribeInstanceStatus(env, instancesSet=chk_instances, includeAllInstances=true))
    statuses = resp.instanceStatusSet
    for status in statuses
        println("Status of $(status.instanceId) is $(status.instanceState.code):$(status.instanceState.name)")
        if status.instanceState.code != 16
            push!(new_chk_instances, status.instanceId)
        end
    end
    new_chk_instances
end

function ec2_hostnames(instances; env=AWSEnv())
    names = NTuple[]
    resp = CHK_ERR(DescribeInstances(env, instancesSet=instances))
    reservs = resp.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            push!(names, (i.instanceId, i.dnsName, i.privateDnsName))
        end
    end
    names
end



function ec2_launch(ami::String, seckey::String; env=AWSEnv(), insttype::String="m1.small", n::Integer=1, 
                    uname::String="julia", instname::String="julia", launchset::String="")
# "c1.medium"
# "m1.small"

    resp = CHK_ERR(RunInstances(env, RunInstancesType(imageId=ami, instanceType=insttype, minCount=n, maxCount=n, keyName=seckey)))
    instances = ASCIIString[]
    for inst in resp.instancesSet
        push!(instances, inst.instanceId)
    end
    println("Launched instances : $instances" )
    
    if launchset == ""
       launchset = convert(ASCIIString, format("YYYY-MM-dd HH:mm:SS", now()))
    end
    
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "CreateTags", {
        "ResourceId"=>instances, 
        "Tag"=>[
            {"Key"=>"LaunchSet","Value"=>launchset}, 
            {"Key"=>"Name","Value"=>instname}, 
            {"Key"=>"Owner","Value"=>uname}]})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    else
        resp.obj = CreateTagsResponseType(resp.pd)
        if resp.obj._return != true
            error("error adding tags!")
        end
    end
    println("Tagged instances : $instances" )

    # Wait for the instances to come to a running state....
    wait_till_running(env, instances, 600.0)

    println("Lanched launchset $launchset" )
    
    instances
end

function ec2_addprocs(instances, ec2_keyfile::String; env=AWSEnv(), hostuser::String="ubuntu", dir=JULIA_HOME, tunnel=true, use_public_dnsname=true)
    hostnames = ec2_hostnames(instances, env=env)
    idx = use_public_dnsname ? 2 : 3
    sshnames = String["$(hostuser)@$(host[idx])" for host in hostnames]

    addprocs(sshnames, sshflags=`-i $(ec2_keyfile) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no`, dir=dir, tunnel=tunnel)
end

function wait_till_running(env, instances, timeout)
    start = time()
    chk_instances = check_running(env, instances)
    wait_time = 5.0
    while (((time() - start) < timeout) && (length(chk_instances) > 0))
        println("All instances not yet in a running state. Trying again in $wait_time seconds....")
        sleep(wait_time)
        
        chk_instances = check_running(env, chk_instances)
    end
    
    if (length(chk_instances) > 0)
        println("All instances not yet in a running state. Please check after some time.")
    end
end

function ec2_start(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "StartInstances", {"InstanceId"=>instances})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    end

    # Wait for the instances to come to a running state....
    wait_till_running(env, instances, 600.0)
    
    instances
end


function ec2_stop(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "StopInstances", {"InstanceId"=>instances})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    end

    instances
end

function ec2_show_status(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "DescribeInstanceStatus", {"InstanceId"=>instances, "IncludeAllInstances"=>true})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    end
    
    resp.obj = DescribeInstanceStatusResponseType(resp.pd)
    
    statuses = resp.obj.instanceStatusSet
    for status in statuses
        println("Status of $(status.instanceId) is $(status.instanceState.code):$(status.instanceState.name)")
    end

    [(status.instanceId, status.instanceState.code, status.instanceState.name) for status in statuses]
end



function ec2_instances_by_owner (owner::String; env=AWSEnv())
    instances = ASCIIString[]
    
    tagfilter = FilterType(name="tag:Owner", valueSet=[owner])
    statefilter = FilterType(name="instance-state-name", valueSet=["running"])
    
    req = DescribeInstancesType(filterSet=[tagfilter, statefilter])
    resp = CHK_ERR(DescribeInstances(env, req))
    reservs = resp.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            push!(instances, i.instanceId)
        end
    end
    instances
end


function ec2_mount_snapshot (instance::String, snapshot::String, mount::String, ec2_keyfile::String; env=AWSEnv(), dev="/dev/xvdh", 
                                hostuser::String="ubuntu")
    # first get the availability zone....
    resp = CHK_ERR(DescribeInstances(env, instancesSet=[instance]))
    zone = resp.reservationSet[1].instancesSet[1].placement.availabilityZone
    hostname = resp.reservationSet[1].instancesSet[1].dnsName

    resp = CHK_ERR(CreateVolume(env, snapshotId=snapshot, availabilityZone=zone))
    volumeId = resp.volumeId
    status = resp.status
    
    println("Created volume $volumeId")
    
    while (status == "creating")
        resp = CHK_ERR(DescribeVolumes(env, volumeSet=[volumeId]))
        status = resp.volumeSet[1].status
    end
    
    if (status != "available")
        error("Volume is unavailable. Status $status")
    end
    
    resp = CHK_ERR(AttachVolume(env, instanceId=instance, volumeId=volumeId, device=dev))
    status = resp.status    
    while (status == "attaching")
        resp = CHK_ERR(DescribeVolumes(env, volumeSet=[volumeId]))
        status = resp.volumeSet[1].attachmentSet[1].status
    end
    
    if (status != "attached")
        error("Unable to attach volume. Status $status")
    end

    println("Attached $volumeId to $instance")
    
    
    run(`ssh -i $(ec2_keyfile) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $(hostuser)@$(hostname) "mkdir -p $(mount); sudo mount $dev $mount"`)

    println("Mounted volume $volumeId at $mount")
    println("To login use 'ssh -i $(ec2_keyfile) $(hostuser)@$(hostname)'")
    
    volumeId
end

