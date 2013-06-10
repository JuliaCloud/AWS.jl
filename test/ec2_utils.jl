using AWS.EC2
using AWS

    
const ami_ubuntu_13_04_64_bit_US_east = "ami-59482230" # This is the Julia installed version of 13_04
const ami_ubuntu_13_04_32_bit_US_east = "ami-5b8be132" # With Julia

const ami_ubuntu_13_04_32bit_USeast_dev = "ami-8bdda8e2"

env = AWSEnv(ENV["AWS_ID"], ENV["AWS_SECKEY"], EP_US_EAST_NORTHERN_VIRGINIA)
# env.dbg=true
# env.dry_run=true

CHK_ERR(resp::EC2Response) = (typeof(resp.obj) == EC2Error) ? error(ec2_error_str(resp.obj)) : resp.obj

function desc_avail_zones()
    resp = CHK_ERR(DescribeAvailabilityZones(env))
    resp
end


function terminate_instances (instances)
    req = TerminateInstancesType(instancesSet=instances)
    resp = CHK_ERR(TerminateInstances(env, req))
    instances
end

function terminate_instances_by_owner (owner::String)
    instances = get_instances_by_owner (owner)
    println("$owner has the following [$instances] instances")
    terminate_instances (instances)
end


function get_running_instances_by_owner (owner::String)
    instances = ASCIIString[]
    req = DescribeInstancesType(filterSet=[FilterType(name="tag:Owner", valueSet=[owner])])
    resp = CHK_ERR(DescribeInstances(env, req))
    reservs = resp.reservationSet
    for reserv in reservs
        instancesSet = reserv.instancesSet
        for i in instancesSet
            if i.instanceState.code == 16
                push!(instances, i.instanceId)
            end
        end
    end
    instances
end

function check_running(chk_instances)
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

function get_hostnames(instances)
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



function launch_n_ec2(n::Int)
# "c1.medium"
# "m1.small"

    resp = CHK_ERR(RunInstances(env, RunInstancesType(imageId=ami_ubuntu_13_04_32bit_USeast_dev, instanceType="m1.small", minCount=n, maxCount=n, keyName="jublr")))
    instances = ASCIIString[]
    for inst in resp.instancesSet
        push!(instances, inst.instanceId)
    end
    println("Launched instances : $instances" )
    
    # Tag the instances....
    tags = [ResourceTagSetItemType(key="Name", value="AWSTest"), ResourceTagSetItemType(key="Owner", value="amitm")]
    tag_rqst = CreateTagsType(resourcesSet=instances, tagSet=tags)
    resp = CHK_ERR(CreateTags(env, tag_rqst))
    if resp._return == true
        println("Successfully added tags!")
    else
        error("error adding tags!")
    end
    println("Tagged instances : $instances" )

    # Wait for the instances to come to a running state....
    start = time()
    chk_instances = check_running(instances)
    while (((time() - start) < 60.0) && (length(chk_instances) > 0))
        println("All instances not yet in a running state. Waiting and trying again....")
        sleep(5.0)
        
        chk_instances = check_running(chk_instances)
    end
    
    if (length(chk_instances) > 0)
        println("All instances not yet in a running state. Please check after some time.")
    end
    instances
end


