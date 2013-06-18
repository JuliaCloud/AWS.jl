
export ec2_terminate, ec2_addprocs, ec2_launch, ec2_start, ec2_stop, ec2_show_status, ec2_get_hostnames, ec2_instances_by_owner


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

def_env() = AWSEnv(ENV["AWS_ID"], ENV["AWS_SECKEY"], EP_US_EAST_NORTHERN_VIRGINIA)
function ec2_terminate (instances; env=def_env())
    req = TerminateInstancesType(instancesSet=instances)
    resp = CHK_ERR(TerminateInstances(env, req))
    instances
end

function check_running(env, chk_instances)
    new_chk_instances = ASCIIString[]
    req = DescribeInstanceStatusType(instancesSet=chk_instances, includeAllInstances=true)
    resp = CHK_ERR(DescribeInstanceStatus(env, req))
    statuses = resp.instanceStatusSet
    for status in statuses
        println("Status of $(status.instanceId) is $(status.instanceState.code):$(status.instanceState.name)")
        if status.instanceState.code != 16
            push!(new_chk_instances, status.instanceId)
        end
    end
    new_chk_instances
end

function ec2_get_hostnames(instances; env=def_env())
    names = NTuple[]
    req = DescribeInstancesType(instancesSet=instances)
    resp = CHK_ERR(DescribeInstances(env, req))
    reservs = resp.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            push!(names, (i.instanceId, i.dnsName))
        end
    end
    names
end



function ec2_launch(ami::String, seckey::String; env=def_env(), insttype::String="m1.small", n::Integer=1, 
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
    
    (instances, launchset)
end

function ec2_addprocs(instances, ec2_keyfile::String; env=def_env(), hostuser::String="ubuntu", dir=JULIA_HOME)
    hostnames = ec2_get_hostnames(instances, env=env)
    sshnames = String["$(hostuser)@$(host)" for host in hostnames]

    addprocs(sshnames, sshflags=`-i $(ec2_keyfile) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no`, tunnel=true)
end

function wait_till_running(env, instances, timeout)
    start = time()
    chk_instances = check_running(env, instances)
    wait_time = 15.0
    while (((time() - start) < timeout) && (length(chk_instances) > 0))
        println("All instances not yet in a running state. Trying again after $wait_time seconds....")
        sleep(wait_time)
        
        chk_instances = check_running(env, chk_instances)
    end
    
    if (length(chk_instances) > 0)
        println("All instances not yet in a running state. Please check after some time.")
    end
end

function ec2_start(instances; env=def_env())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "StartInstances", {"InstanceId"=>instances})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    end

    # Wait for the instances to come to a running state....
    wait_till_running(env, instances, 600.0)
    
    instances
end


function ec2_stop(instances; env=def_env())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "StopInstances", {"InstanceId"=>instances})
    if (typeof(resp.obj) == EC2Error) 
        error(ec2_error_str(resp.obj))
    end

    instances
end

function ec2_show_status(instances; env=def_env())
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



function ec2_instances_by_owner (owner::String; env=def_env())
    instances = ASCIIString[]
    req = DescribeInstancesType(filterSet=[FilterType(name="tag:Owner", valueSet=[owner])])
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
