## AWS - Julia interface to Amazon Web Services

This package is a WIP for providing a native julia interface to the Amazon Web Services API

Initially, the EC2 and S3 API will be supported.


### Current status
- Most of the APIs are yet untested. Any testing will be helpful. The REST API does not not match exactly in certain cases
  with the WSDL. For the EC2 API, the bulk of the code is generated from the WSDL while it has been translated by hand for the 
  S3 API. In certain cases breakage may occur due to wrong request syntax. 
  
  Please file issues on guthub with the output from running the request in debug mode, i.e., with env.dbg = true.
  

### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    aws_id::String      # AWS Access Key id
    aws_seckey::String  # AWS Secret key for signing requests
    ep::String          # region endpoint
    timeout::Float64    # request timeout in seconds, if set to 0.0, request will never time out. Default is 0.0
    dry_run::Bool       # If true, no actual request will be made - implies dbg flag below
    dbg::Bool           # print request and raw response to screen
    
    AWSEnv(id, key) = AWSEnv(id, key, EP_US_EAST_NORTHERN_VIRGINIA)
    AWSEnv(id, key, ep) = AWSEnv(id, key, ep, 180.0, false, false)
    AWSEnv(id, key, ep, timeout, dr, dbg) = dr ? new(id, key, ep, timeout, dr, true) : new(id, key, ep, timeout, false, dbg)
end
```

### S3 API
- This package uses the REST interface of S3

- The type names, function names, etc follow the names specified in http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html as well 
  as in http://s3.amazonaws.com/doc/2006-03-01/AmazonS3.wsdl‎ 
  
- Sample code

```
using AWS
using AWS.S3

env = AWSEnv(ENV["AWS_ID"], ENV["AWS_SECKEY"], EP_US_EAST_NORTHERN_VIRGINIA, 60.0, false, false)

bkt = "some_globally_unique_name"

println("List all buckets")
resp=S3.list_all_buckets(env)
println(resp.obj)

println("Create a bucket")
acl=S3.S3_ACL()
acl.acl="private"
resp=S3.create_bkt(env, bkt, acl=acl)
println("$(resp.http_code), $(resp.obj)")

println("Add a file")
resp = S3.put_object(env, bkt, "file1", "Hello ")
println("$(resp.http_code), $(resp.obj)")


println("Add another file")
resp = S3.put_object(env, bkt, "file2", "World ")
println("$(resp.http_code), $(resp.obj)")


println("List bucket")
resp = S3.get_bkt(env, bkt)
println("$(resp.http_code), $(resp.obj)")

println("Get file 1")
resp = S3.get_object(env, bkt, "file1")
println("$(resp.http_code), $(resp.obj)")

println("Get file 2")
resp = S3.get_object(env, bkt, "file2")
println("$(resp.http_code), $(resp.obj)")


println("Delete file 1")
resp = S3.del_object(env, bkt, "file1") 
println("$(resp.http_code), $(resp.obj)")

println("Delete file 2 using the multi api")
resp = S3.del_object_multi(env, bkt, S3.DeleteObjectsType([S3.ObjectType("file2")]))
println("$(resp.http_code), $(resp.obj)")


println("Delete Bucket")
resp = S3.del_bkt(env, bkt)
println("$(resp.http_code), $(resp.obj)")

```

- Each of the S3 APIs returns an object of type


```
type S3Response
    content_length::Int  
    date::String            # The date and time Amazon S3 responded, for example, Wed, 01 Mar 2009 12:00:00 GMT.
    server::String          # The name of the server that created the response.
    eTag::String
    http_code::Int

    # Common amz fields 
    delete_marker::Bool     
    id_2::String        
    request_id::String
    version_id::String

    headers::Dict           # All header fields
    
    obj::Any                # If the response was an XML representing a Julia S3 response type,
                            # it is parsed and set here.
                            # Else it will contain the raw string of the response
                            
    pd::Union(ParsedData, Nothing)
end
```


### EC2 API

Much of the boilerplate code is generated from the corresponding WSDL.
For example, for the EC2 API, the Julia types and functions are based on http://s3.amazonaws.com/ec2-downloads/ec2.wsdl

Exported functions are in ```ec2_operations.jl```

Types are defined in ```ec2_types.jl```

Names and usage are similar to the AWS documentation http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-api.pdf

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


```ec2_generic(env::AWSEnv, action::String, params_in::Array{Tuple})``` just bundles the 
supplied params_in into an EC2 request. It is meant to be used while bugs, if any, in the 
generated code exist for any of the APIs.


### EC2 Sample

- Given the large number of parameters for most EC2 APIs, most folks will likely customize this API into simpler
  calls. See ```test/ec2_utils.jl``` as a template for the same.
  
- Using ```test/ec2_utils.jl```, the following code makes it possible to boot up 'n' instances of EC2 nodes,
  add it to the worker pool using addprocs(), do work and then shut them down.
  

```
using AWS.EC2
using AWS

include("ec2_utils.jl")

println("launch_n_ec2")
instances = launch_n_ec2(10)

println("get_hostnames")
hostnames = get_hostnames(instances)

sshnames = ["ubuntu@" * h[2] for h in hostnames]
addprocs(sshnames, dir="/usr/bin", sshflags=`-i /path/to/key.pem -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no`)

#.... Do parallel work

println("terminate_instances")
terminate_instances(instances)
```

### Julia Dependencies

Calendar

Codecs

LibExpat

libCURL


### Binary dependencies

libcurl must be installed

libexpat must be installed

### NOTE

- The crypto functions required for this package are in https://github.com/amitmurthy/AWS.jl/blob/master/src/crypto.jl, since
  OpenSSL.jl does not yet support the functions this package needs. This will be replaced with calls to OpenSSL.jl when 
  it supports the same.

