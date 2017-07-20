### Auto Scaling API

The `AWS.Autoscale` sub package provides Auto Scaling APIs over REST interface.

Specification: http://docs.aws.amazon.com/AutoScaling/latest/APIReference/Welcome.html

API Version: 2011-01-01

Sample code (see [testautoscale.jl](test/testautoscale.jl) for more examples):

```
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

env = AWSEnv()

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
```
