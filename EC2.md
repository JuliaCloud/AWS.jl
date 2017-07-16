### EC2 API

EC2 has two sets of APIs

- One is a lower level API that directly maps onto Amazon's WSDL for the service.

- The other is a simple API that provides limited functionality but with a a higher abstraction.

### EC2 Simple API

- Currently the following APIs are available:

- ec2_terminate
- ec2_launch
- ec2_start
- ec2_stop
- ec2_show_status
- ec2_get_hostnames
- ec2_instances_by_tag
- ec2_addprocs

These are described [here](doc/ec2_simple.md)
The source is in ```src/ec2_simple.jl```

A generic API is ```ec2_basic```

```ec2_basic(env::AWSEnv, action::String, params_in::Dict{Any, Any})``` just bundles the
supplied params_in into an EC2 request. It is meant to be used while bugs, if any, in the
advanced (generated) code exist for any of the APIs. Values in the params can be basic julia types,
CalendarTime, Dict or an Array itself. Keys in the Dict MUST be same as those mentioned in
the Amazon EC2 documentation for the corresponding action.

### EC2 Advanced API


Much of the boilerplate code is generated from the corresponding WSDL.
For example, for the advanced API, the Julia types and functions are based on http://s3.amazonaws.com/ec2-downloads/ec2.wsdl

Exported functions are in ```ec2_operations.jl```

Types are defined in ```ec2_types.jl```

Names and usage are similar to the AWS documentation http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-api.pdf

Each of the EC2 "actions" have a corresponding Julia function which takes in
the appropriate Julia type.

For example : ```RunInstances(env::AWSEnv , msg::RunInstancesType)``` (defined in ec2_operations.jl) where

RunInstancesType (defined in ec2_types.jl) is

```
type RunInstancesType
    imageId::Union(String, Nothing)
    minCount::Union(Int32, Nothing)
    maxCount::Union(Int32, Nothing)
    ...

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, groupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) =
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
```

Alternatively, the request can also be executed with the request type replaced by keyword arguments.

For example ```For example : ```RunInstances(env, imageId="ami-xxxxxxxx", minCount=1)```



Each of the functions returns an object of type:

```
type EC2Response
    http_code::Int
    headers
    body::Union(String, Nothing)
    pd::Union(LightXML.XMLElement, Nothing)
    obj::Any
end
```

In the event of an error, EC2Response.obj has an object of type

```
type EC2Error
    code::String
    msg::String
    request_id::Union(String, Nothing)
end
```

For succcessful requests, EC2Response.obj will contain an object of the appropriate type.

For example, for RunInstances, the EC2Response.obj will be of type RunInstancesResponseType
