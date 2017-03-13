export ec2_terminate, ec2_addprocs, ec2_launch, ec2_start, ec2_stop, ec2_show_status, ec2_hostnames, ec2_instances_by_tag
export ec2_mount_snapshot


ec2_basic(env::AWSEnv, action::String, params_in::Dict) = ec2_execute(env, action, flatten_params(params_in))
export ec2_basic



flatten_params(d::Dict) = flatten_params(Array(Tuple, 0), "", d)
function flatten_params(ft::Array, pfx::String, d::Dict)
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


function ec2_terminate(instances; env=AWSEnv())
    if length(instances) > 0
        req = TerminateInstancesType(instancesSet=instances)
        resp = CHK_ERR(TerminateInstances(env, req))
    end
    instances
end

function check_running(env, chk_instances)
    new_chk_instances = String[]
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
                    owner::String="julia", clustername::String="julia", launchset::String="")
# "c1.medium"
# "m1.small"

    resp = CHK_ERR(RunInstances(env, RunInstancesType(imageId=ami, instanceType=insttype, minCount=n, maxCount=n, keyName=seckey)))
    instances = String[]
    for inst in resp.instancesSet
        push!(instances, inst.instanceId)
    end
    println("Launched instances : " )
    println(instances)

    if launchset == ""
       launchset =  aws_string(now(Dates.UTC))
    end

    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "CreateTags", Dict(
        "ResourceId"=>instances,
        "Tag"=>[
            Dict("Key"=>"LaunchSet","Value"=>launchset),
            Dict("Key"=>"ClusterName","Value"=>clustername),
            Dict("Key"=>"Name","Value"=>clustername), # Just so that it is visible on the AWS Web console
            Dict("Key"=>"Owner","Value"=>owner)]))
    if (typeof(resp.obj) == EC2Error)
        error(ec2_error_str(resp.obj))
    else
        resp.obj = CreateTagsResponseType(resp.pd)
        if resp.obj._return != true
            error("error adding tags!")
        end
    end
    println("Tagged instances")

    # Wait for the instances to come to a running state....
    wait_till_running(env, instances, 600.0)

    println("Lanched LaunchSet $launchset, ClusterName $clustername, Owner $owner" )

    instances
end


function generate_sshnames(hostnames, num_workers, workers_per_instance, use_public_dnsname, sshflags, hostuser="ubuntu")
    num_hosts = length(hostnames)
    idx = use_public_dnsname ? 2 : 3
    sshnames = Dict{String, Any}()
    if num_workers > 0
        if num_workers < num_hosts
            for i in 1:num_workers
                host = hostnames[i][idx]
                sshnames["$(hostuser)@$(host)"] = 1
            end
        else
            # distribute it equally across available hosts
            nwmap = Array(Tuple, 0)
            for i in 1:length(hostnames)
                host = hostnames[i][idx]
                push!(nwmap, (host, round(Int, floor(num_workers/num_hosts))))
            end

            # distribute any remaining equally
            num_rem = num_workers - foldl((x,y)->((k,v)=y; x+v), 0, nwmap)
            for i in 1:num_rem
                idxnwmap = ((i-1) % num_hosts) + 1
                (host,nw) = nwmap[idxnwmap]
                nwmap[idxnwmap] = (host,nw+1)
            end

            for (host,nw) in nwmap
                sshnames["$(hostuser)@$(host)"] = nw
            end
        end

    elseif workers_per_instance > 0
        for i in 1:length(hostnames)
            host = hostnames[i][idx]
            sshnames["$(hostuser)@$(host)"] = workers_per_instance
        end
    else
        for i in 1:length(hostnames)
            host = hostnames[i][idx]
            sshnames["$(hostuser)@$(host)"] = :auto
        end
    end
    [(k,v) for (k,v) in sshnames]
end


function ec2_addprocs(instances, ec2_keyfile::String; env=AWSEnv(), hostuser::String="ubuntu",
                        dir=JULIA_HOME, tunnel=true, use_public_dnsname=true, exename=joinpath(JULIA_HOME,Base.julia_exename()),
                        workers_per_instance=0, num_workers=0, machines_only=false)

    hostnames = ec2_hostnames(instances, env=env)
    sshflags = `-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -i $(ec2_keyfile)`

    sshnames = generate_sshnames(hostnames, num_workers, workers_per_instance, use_public_dnsname, sshflags, hostuser)

    println(sshnames)

    if machines_only
        return sshnames
    else
        pids = addprocs(sshnames, sshflags=sshflags, dir=dir, tunnel=tunnel, exename=exename)
        println("Added workers $pids")
        return pids
    end
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

    # Wait till they are pingable, the network interfaces take some time to come up
    println("Testing TCP connects (on port 22) to all newly started hosts...")
    hosts = ec2_hostnames(instances, env=env)
    testhosts = copy(hosts)
    testidx = 1
    while true
        try
            for (i,h) in enumerate(testhosts)
                println("Testing connection to ", h[2])
                s=connect(h[2], 22)
                close(s)
                testidx = i
            end
            break;
        catch
            println("Some newly started hosts are still unreachable. Trying again in 2.0 seconds.")
            sleep(2.0)
            testhosts=testhosts[testidx:end]
        end
    end

    println(hosts)
    :ok
end

function ec2_start(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    if length(instances) > 0
        resp = ec2_basic(env, "StartInstances", Dict("InstanceId"=>instances))
        if (typeof(resp.obj) == EC2Error)
            error(ec2_error_str(resp.obj))
        end

        # Wait for the instances to come to a running state....
        wait_till_running(env, instances, 600.0)
    end
    instances
end


function ec2_stop(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    if length(instances) > 0
        resp = ec2_basic(env, "StopInstances", Dict("InstanceId"=>instances))
        if (typeof(resp.obj) == EC2Error)
            error(ec2_error_str(resp.obj))
        end
    end
    instances
end

function ec2_show_status(instances; env=AWSEnv())
    # Tag the instances..also tests ec2_basic API..
    resp = ec2_basic(env, "DescribeInstanceStatus", Dict("InstanceId"=>instances, "IncludeAllInstances"=>true))
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


function ec2_instances_by_tag(tag, tagvalue; env=AWSEnv(), running_only=true)
    tagfilter = FilterType(name="tag:" * tag, valueSet=[tagvalue])

    if running_only
        filterset = [tagfilter, FilterType(name="instance-state-name", valueSet=["running"])]
    else
        filterset = [tagfilter]
    end
    instances = String[]

    req = DescribeInstancesType(filterSet=filterset)
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


function ec2_mount_snapshot(instance::String, snapshot::String, mount::String, ec2_keyfile::String; env=AWSEnv(), dev="/dev/xvdh",
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


    run(`ssh -i $(ec2_keyfile) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -o LogLevel=ERROR $(hostuser)@$(hostname) "mkdir -p $(mount); sudo mount $dev $mount"`)

    println("Mounted volume $volumeId at $mount")
    println("To login use 'ssh -i $(ec2_keyfile) $(hostuser)@$(hostname)'")

    volumeId
end

