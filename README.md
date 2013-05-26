## AWS - Julia interface to Amazon Web Services

This package is a WIP for providing a native julia interface to the AWS API

Initially, the EC2 and S3 API will be supported.

### Approach

Much of the boilerplate code is generated from the corresponding WSDL.
For example, for the EC2 API, the Julia types and functions are based on http://s3.amazonaws.com/ec2-downloads/ec2.wsdl

Exported functions are in ```ec2_operations.jl```

Types are defined in ```ec2_types.jl```

Names and usage are similar to the AWS documentation http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-api.pdf

### Current status
- Most of the APIs are yet untested. Any testing will be helpful

- While the requests take in native julia objects, the response currently is an XML object. It is of type ParsedData
  as provided by LibExpat - https://github.com/amitmurthy/LibExpat.jl .
  
- libsodium support for signing AWS requests needs to be implemented - see https://github.com/jedisct1/libsodium/issues/43
  

### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    ep::String          # region endpoint
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    dry_run::Bool       # If true, no actual request will be made - it will only be printed to screen
    
    AWSEnv(ep, id, key) = new(ep, id, key, false)
    AWSEnv(ep, id, key, dbg) = new(ep, id, key, dbg)
end
```

Each of the EC2 "actions" have a corresponding Julia function which takes in 
the appropriate Julia type.

For example : ```RunInstances(env::AWSEnv , msg::RunInstancesType)``` (defined in ec2_operations.jl) where 

RunInstancesType (defined in ec2_types.jl) is 

```
type RunInstancesType
    imageId::Union(ASCIIString, Nothing)
    minCount::Union(Int32, Nothing)
    maxCount::Union(Int32, Nothing)
    keyName::Union(ASCIIString, Nothing)
    groupSet::Union(Array{GroupItemType,1}, Nothing)
    additionalInfo::Union(ASCIIString, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(PlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Array{ASCIIString,1}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    disableApiTermination::Union(Bool, Nothing)
    instanceInitiatedShutdownBehavior::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseRequestType, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Array{InstanceNetworkInterfaceSetItemRequestType,1}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunInstancesType(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized) = 
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
    RunInstancesType() = 
        new(nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing, nothing)
end
```




```ec2_generic(env::AWSEnv, action::String, params_in::Array{Tuple})``` just bundles the 
supplied params_in into an EC2 request. It is meant to be used while bugs, if any, in the 
generated code exist for any of the APIs.


### Julia Dependencies

Calendar

Codecs

LibExpat

Sodium

libCURL


### Binary dependencies

libcurl must be installed

libsodium must be downloaded, compiled and installed - https://github.com/jedisct1/libsodium








