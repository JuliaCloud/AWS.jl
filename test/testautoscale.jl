module TestAutoscale
using AWS
using AWS.Autoscale
using Base.Test

function check_resp(resp, resp_obj_type=Any)
    info("response: ", resp.obj)
    @test 200 <= resp.http_code <= 206
    @test isa(resp, AWS.Autoscale.AutoScalingResponse)
    @test isa(resp.obj, resp_obj_type)
    @test !isa(resp.obj, AutoScalingError)
end

function runtests(env, config)
    println("getting autoscale limits")
    resp = DescribeAccountLimits(env)
    check_resp(resp, DescribeAccountLimitsResult)
    @test resp.obj.numberOfLaunchConfigurations >= 0
    @test resp.obj.maxNumberOfLaunchConfigurations >= 0
    @test resp.obj.numberOfAutoScalingGroups >= 0
    @test resp.obj.maxNumberOfAutoScalingGroups >= 0

    println("listing autoscale groups")
    resp = DescribeAutoScalingGroups(env)
    check_resp(resp, DescribeAutoScalingGroupsResult)
    valid_autoscale_groups = Vector{String}()
    for grp in resp.obj.autoScalingGroups
        println(grp.autoScalingGroupName)
        @test isa(grp.autoScalingGroupName, String)
        push!(valid_autoscale_groups, grp.autoScalingGroupName)
    end

    println("listing launch configurations")
    resp = DescribeLaunchConfigurations(env)
    check_resp(resp, DescribeLaunchConfigurationsResult)
    for lc in resp.obj.launchConfigurations
        println(lc.launchConfigurationName)
        @test isa(lc.launchConfigurationName, String)
    end

    println("listing load balancers")
    for grp in valid_autoscale_groups
        req = DescribeLoadBalancersRequest(; autoScalingGroupName=grp)
        resp = DescribeLoadBalancers(env, req)
        check_resp(resp, DescribeLoadBalancersResult)
        for lb in resp.obj.loadBalancers
            println(lc.loadBalancerName)
            @test isa(lc.loadBalancerName, String)
        end
    end

    ami = get(config, "ami-generic", "")
    insttype = get(config, "insttype", "")
    keyname = get(config, "keyname", "")
    ownertag = get(config, "ownertag", "")
    nametag = get(config, "nametag", "")
    az = get(config, "availability-zones", [])

    for v in (ami, insttype, keyname, ownertag, nametag, az)
        if isempty(v)
            warn("skipping further autoscaling tests, not all parameters configured")
            return
        end
    end

    println("create a launch configuration")
    req = CreateLaunchConfigurationRequest(; launchConfigurationName="awstest", imageId=ami, instanceType=insttype, instanceMonitoring=InstanceMonitoring(;enabled=false), keyName=keyname)
    resp = CreateLaunchConfiguration(env, req)
    check_resp(resp)

    println("create a autoscaling group")
    tags = [Tag(;key="Name", value=nametag), Tag(;key="Owner", value=ownertag)]
    req = CreateAutoScalingGroupRequest(; autoScalingGroupName="awstest", availabilityZones=az, desiredCapacity=0, launchConfigurationName="awstest", maxSize=2, minSize=0, tags=tags)
    resp = CreateAutoScalingGroup(env, req)
    check_resp(resp)

    println("scale the group up")
    req = SetDesiredCapacityRequest(; autoScalingGroupName="awstest", desiredCapacity=1)
    resp = SetDesiredCapacity(env, req)
    check_resp(resp)

    println("wait for group to scale up")
    while true
        req = DescribeAutoScalingGroupsRequest(; autoScalingGroupNames=["awstest"])
        resp = DescribeAutoScalingGroups(env, req)
        check_resp(resp, DescribeAutoScalingGroupsResult)
        grps = resp.obj.autoScalingGroups
        @test isa(grps, Vector{AutoScalingGroup})
        grp = grps[1]
        @test grp.autoScalingGroupName == "awstest"
        @test grp.desiredCapacity == 1
        @test grp.maxSize == 2
        @test grp.minSize == 0
        instances = grp.instances
        @test isa(instances, Vector{Instance})
        healthy = 0
        for instance in instances
            println("instance ", instance.instanceId, " - ", instance.healthStatus)
            (instance.healthStatus == "Healthy") && (healthy += 1)
        end
        (healthy >= 1) && break
        println("only ", healthy, "/1 instances up")
    end

    println("scale the group down")
    req = SetDesiredCapacityRequest(; autoScalingGroupName="awstest", desiredCapacity=0)
    resp = SetDesiredCapacity(env, req)
    check_resp(resp)

    println("wait for group to scale down")
    while true
        req = DescribeAutoScalingGroupsRequest(; autoScalingGroupNames=["awstest"])
        resp = DescribeAutoScalingGroups(env, req)
        check_resp(resp, DescribeAutoScalingGroupsResult)
        grps = resp.obj.autoScalingGroups
        @test isa(grps, Vector{AutoScalingGroup})
        grp = grps[1]
        @test grp.autoScalingGroupName == "awstest"
        @test grp.desiredCapacity == 0
        @test grp.maxSize == 2
        @test grp.minSize == 0
        instances = grp.instances
        @test isa(instances, Vector{Instance})
        healthy = 0
        for instance in instances
            println("instance ", instance.instanceId, " - ", instance.healthStatus)
            (instance.healthStatus == "Healthy") && (healthy += 1)
        end
        (healthy == 0) && break
        println("still ", healthy, "/1 instances up")
    end

    println("delete autoscaling group")
    req = DeleteAutoScalingGroupRequest(; autoScalingGroupName="awstest", forceDelete=true)
    resp = DeleteAutoScalingGroup(env, req)
    check_resp(resp)

    println("delete launch configuration")
    req = DeleteLaunchConfigurationRequest(; launchConfigurationName="awstest")
    resp = DeleteLaunchConfiguration(env, req)
    check_resp(resp)
end

end # module TestAutoscale
