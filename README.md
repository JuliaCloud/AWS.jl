## AWS - Julia interface to Amazon Web Services

This package is a WIP for providing a native Julia interface to the Amazon Web Services API

Initially, the EC2 and S3 API will be supported.


### Current status
- Most of the APIs are yet untested. Any testing will be helpful. The REST API does not not match exactly in certain cases
  with the WSDL. For the EC2 API, the bulk of the code is generated from the WSDL while it has been translated by hand for the
  S3 API. In certain cases breakage may occur due to wrong request syntax.

  Please file issues on GitHub with the output from running the request in debug mode, i.e., with env.dbg = true.


### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    aws_id::ASCIIString         # AWS Access Key id
    aws_seckey::ASCIIString     # AWS Secret key for signing requests
    aws_token::ASCIIString      # AWS Security Token for temporary credentials
    region::AbstractString      # region name
    ep_host::AbstractString     # region endpoint (host)
    ep_path::AbstractString     # region endpoint (path)
    sig_ver::Int                # AWS signature version (2 or 4)
    timeout::Float64            # request timeout in seconds, if set to 0.0, request will never time out. Default is 0.0
    dry_run::Bool               # If true, no actual request will be made - implies dbg flag below
    dbg::Bool                   # print request and raw response to screen

end
```
Constructors:

```
AWSEnv(; id=AWS_ID, key=AWS_SECKEY, token=AWS_TOKEN, ec2_creds=false, region=US_EAST_1, ep="", sig_ver=2, timeout=0.0, dr=false, dbg=false)
```

- The ```AWS_ID``` and ```AWS_SECKEY``` are initialized from env if available. Else a file ~/.awssecret is read (if available) for the same.
- The ```AWS_TOKEN``` is an empty string by default. Override ```token``` if the ```id``` and ```key``` are temporary security credentials.
- Set ```ec2_creds``` to true to automatically retrieve temporary security credentials if running on an EC2 instance that has such credentials.
- Set ```region``` to one of the AWS region name strings, e.g., "us-east-1". Not needed if setting ```ep```.
- ```ep``` can contain both a hostname and a pathname for an AWS endpoint. It is generally not needed when using native AWS services; use ```region``` instead. If using a service that emulates AWS, set ```ep``` to the hostname of the endpoint to be used. If both ```region``` and ```ep``` are set, the host portion of ```ep``` will override region, and the path portion of ```ep``` will be used in conjunction with ```region```.
- ```sig_ver``` must be set to 2 or 4. Some AWS services require one signature version or the other, in which case this value will be ignored.


### S3 API
- This package uses the REST interface of S3

- The type names, function names, etc follow the names specified in http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html as well
  as in http://s3.amazonaws.com/doc/2006-03-01/AmazonS3.wsdl

- Sample code

```
using AWS
using AWS.S3

env = AWSEnv(timeout=60.0)

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
                            # Else it will contain an IOBuffer object

    pd::Union(ETree, Nothing)
end
```


### EC2 API

EC2 has two sets of APIs

- One is a lower level API that directly maps onto Amazon's WSDL for the service.

- The other is a simple API that provides limited functionality but with a a higher abstraction.

### EC2 Simple API

- Currently the following are available:

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
    imageId::Union(ASCIIString, Nothing)
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
    pd::Union(ETree, Nothing)
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




### Julia Dependencies

Calendar

LibExpat

libCURL


### Binary dependencies

libcurl must be installed

libexpat must be installed

### NOTE

- The crypto functions required for this package are in https://github.com/amitmurthy/AWS.jl/blob/master/src/crypto.jl, since
  OpenSSL.jl does not yet support the functions this package needs. This will be replaced with calls to OpenSSL.jl when
  it supports the same.
