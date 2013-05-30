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
- Most of the APIs are yet untested. Any testing will be helpful. The REST API does not not match exactly in certain cases
  with the WSDL. Since the bulk of the code is generated from the WSDL, in certain cases breakage may occur due to wrong
  request syntax. Any issues filed on guthub with the output from running the request in debug mode, i.e., with env.dbg = true,
  will be helpful.
  

### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    ep::String          # region endpoint
    timeout::Float64    # request timeout in seconds, default is 180 seconds
    dry_run::Bool       # If true, no actual request will be made - implies dbg flag below
    dbg::Bool           # print request to screen
    
    AWSEnv(id, key) = AWSEnv(id, key, EP_US_EAST_NORTHERN_VIRGINIA)
    AWSEnv(id, key, ep) = AWSEnv(id, key, ep, 180.0, false, false)
    AWSEnv(id, key, ep, timeout, dr, dbg) = dr ? new(id, key, ep, timeout, dr, true) : new(id, key, ep, timeout, false, dbg)
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
    groupSet::Union(Vector{GroupItemType}, Nothing)
    additionalInfo::Union(ASCIIString, Nothing)
    userData::Union(UserDataType, Nothing)
    addressingType::Union(ASCIIString, Nothing)
    instanceType::Union(ASCIIString, Nothing)
    placement::Union(PlacementRequestType, Nothing)
    kernelId::Union(ASCIIString, Nothing)
    ramdiskId::Union(ASCIIString, Nothing)
    blockDeviceMapping::Union(Vector{BlockDeviceMappingItemType}, Nothing)
    monitoring::Union(MonitoringInstanceType, Nothing)
    subnetId::Union(ASCIIString, Nothing)
    disableApiTermination::Union(Bool, Nothing)
    instanceInitiatedShutdownBehavior::Union(ASCIIString, Nothing)
    license::Union(InstanceLicenseRequestType, Nothing)
    privateIpAddress::Union(ASCIIString, Nothing)
    clientToken::Union(ASCIIString, Nothing)
    networkInterfaceSet::Union(Vector{InstanceNetworkInterfaceSetItemRequestType}, Nothing)
    iamInstanceProfile::Union(IamInstanceProfileRequestType, Nothing)
    ebsOptimized::Union(Bool, Nothing)

    RunInstancesType(; imageId=nothing, minCount=nothing, maxCount=nothing, keyName=nothing, groupSet=nothing, additionalInfo=nothing, userData=nothing, addressingType=nothing, instanceType=nothing, placement=nothing, kernelId=nothing, ramdiskId=nothing, blockDeviceMapping=nothing, monitoring=nothing, subnetId=nothing, disableApiTermination=nothing, instanceInitiatedShutdownBehavior=nothing, license=nothing, privateIpAddress=nothing, clientToken=nothing, networkInterfaceSet=nothing, iamInstanceProfile=nothing, ebsOptimized=nothing) = 
         new(imageId, minCount, maxCount, keyName, groupSet, additionalInfo, userData, addressingType, instanceType, placement, kernelId, ramdiskId, blockDeviceMapping, monitoring, subnetId, disableApiTermination, instanceInitiatedShutdownBehavior, license, privateIpAddress, clientToken, networkInterfaceSet, iamInstanceProfile, ebsOptimized)
end
```

Each of the functions returns an object of type:

```
type EC2Response
    http_code::Int
    headers
    body::Union(String, Nothing)
    pd::Union(ParsedData, Nothing)
    error::Union(EC2Error, Nothing)
    obj::Any
    
    EC2Response() = new(0, Dict{Any, Any}(), "", nothing, nothing, nothing)

end
```

In the event of an error, EC2Response.error has an object of type

```
type EC2Error
    code::String
    msg::String
    request_id::Union(String, Nothing)
end
```

For succcessful requests, EC2Response.obj will contain an object of the appropriate type.

For example, for RunInstances, the EC2Response.obj will be of type RunInstancesResponseType 


```ec2_generic(env::AWSEnv, action::String, params_in::Array{Tuple})``` just bundles the 
supplied params_in into an EC2 request. It is meant to be used while bugs, if any, in the 
generated code exist for any of the APIs.


### Julia Dependencies

Calendar

Codecs

LibExpat

libCURL


### Binary dependencies

libcurl must be installed


### NOTE

- DateTime fields returned by the APIs may be invalid due to this bug - https://github.com/nolta/Calendar.jl/issues/20

- The crypto functions required for this package are in https://github.com/amitmurthy/AWS.jl/blob/master/src/crypto.jl , since
  both libsodium and OpenSSL.jl do not yet support the functions this package needs. This will be replaced with calls
  to Sodium or OpenSSL.jl when they support the same.








