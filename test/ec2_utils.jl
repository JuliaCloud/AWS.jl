module TestEC2Utils
using AWS.EC2
using AWS
using Base.Test

function runtests(env, config)
    desc_avail_zones(env)

    ami = get(config, "ami-generic", "")
    insttype = get(config, "insttype", "")
    keyname = get(config, "keyname", "")
    ownertag = get(config, "ownertag", "")
    nametag = get(config, "nametag", "")

    for v in (ami, insttype, keyname, ownertag, nametag)
        if isempty(v)
            warn("skipping further EC2 utils test, not all parameters configured")
            return
        end
    end

    info("launching instances...")
    instances = launch_n_ec2(env, 2, ami, insttype, keyname, ownertag, nametag)
    info("launched instances: ", instances)

    info("getting all running instances...")
    running_instances = get_running_instances_by_owner(env, ownertag)
    info("all running instances: ", running_instances)
    @test length(running_instances) >= length(instances)

    hostnames = get_hostnames(env, instances)
    info("hostnames of launched instances: ", hostnames)

    info("terminating instances...")
    terminate_instances_by_owner(env, ownertag)
end

function check_resp(resp, resp_obj_type=Any)
    info("response: ", resp.obj)
    @test 200 <= resp.http_code <= 206
    @test isa(resp, EC2Response)
    @test isa(resp.obj, resp_obj_type)
    @test !isa(resp.obj, EC2Error)
end

function desc_avail_zones(env)
    resp = DescribeAvailabilityZones(env)
    check_resp(resp, DescribeAvailabilityZonesResult)
    resp.obj
end

function terminate_instances(env, instances)
    resp = TerminateInstances(env; instanceId=instances)
    check_resp(resp, TerminateInstancesResult)
    instances
end

function terminate_instances_by_owner(env, owner::String)
    instances = get_instances_by_owner(env, owner)
    println("$owner has the following [$instances] instances")
    terminate_instances(env, instances)
end

get_running_instances_by_owner(env, owner::String) = get_instances_by_owner(env, owner; running_only=true)

function get_instances_by_owner(env, owner::String; running_only::Bool=false)
    instances = String[]
    resp = DescribeInstances(env; filter=[AWS.EC2.Filter(; name="tag:Owner", value=[owner])])
    check_resp(resp, DescribeInstancesResult)
    reservs = resp.obj.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            if !running_only || (running_only && (i.instanceState.code == 16))
                push!(instances, i.instanceId)
            end
        end
    end
    instances
end

function check_running(env, chk_instances)
    new_chk_instances = String[]
    resp = DescribeInstanceStatus(env; instanceId=chk_instances, includeAllInstances=true)
    check_resp(resp, DescribeInstanceStatusResult)
    statuses = resp.obj.instanceStatusSet
    for status in statuses
        println("Status of $(status.instanceId) is $(status.instanceState.code):$(status.instanceState.name)")
        if status.instanceState.code != 16
            push!(new_chk_instances, status.instanceId)
        end
    end
    new_chk_instances
end

function get_hostnames(env, instances)
    names = Vector{Tuple{String,String}}()
    resp = DescribeInstances(env; instanceId=instances)
    check_resp(resp, DescribeInstancesResult)
    reservs = resp.obj.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            push!(names, (i.instanceId, i.dnsName))
        end
    end
    names
end

function launch_n_ec2(env, n::Int, ami::String, insttype::String, keyname::String, ownertag::String, nametag::String)
    # use "c1.medium" or "m1.small"
    resp = RunInstances(env; imageId=ami, instanceType=insttype, minCount=n, maxCount=n, keyName=keyname)
    check_resp(resp, RunInstancesResult)
    instances = String[]
    for inst in resp.obj.instancesSet
        push!(instances, inst.instanceId)
    end
    println("Launched instances : $instances")

    # Tag the instances..also test ec2_basic API..
    resp = CreateTags(env; resourceId=instances, tag=[Tag(;key="Name",value=nametag), Tag(;key="Owner",value=ownertag)])
    check_resp(resp, CreateTagsResult)
    @test resp.obj._return
    println("Tagged instances : $instances")

    # Wait for the instances to come to a running state....
    start = time()
    chk_instances = check_running(env, instances)
    while (((time() - start) < 300.0) && (length(chk_instances) > 0))
        println("All instances not yet in a running state. Waiting and trying again....")
        sleep(5.0)

        chk_instances = check_running(env, chk_instances)
    end

    if (length(chk_instances) > 0)
        println("All instances not yet in a running state. Please check after some time.")
    end
    instances
end
end # module TestEC2Utils
