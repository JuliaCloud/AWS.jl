## AWS - Julia interface to Amazon Web Services

This package provides a native Julia interface to the Amazon Web Services API

The following services are supported as of now:

- EC2
- S3
- SQS


### Current status
- The basic APIs of EC2, S3 and SQS are tested
- The advanced APIs (e.g. VPC related APIs, etc) of EC2 are yet untested. Any testing will be helpful. 
- The REST API does not match exactly in certain cases
  with the WSDL. For the EC2 API, the bulk of the code is generated from the WSDL while it has been translated by hand for the
  S3 API.

  Please file issues on GitHub with the output from running the request in debug mode, i.e., with env.dbg = true.


### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    aws_id::String         # AWS Access Key id
    aws_seckey::String     # AWS Secret key for signing requests
    aws_token::String      # AWS Security Token for temporary credentials
    region::String      # region name
    ep_scheme::String      # URL scheme: http or https
    ep_host::String     # region endpoint (host)
    ep_path::String     # region endpoint (path)
    sig_ver::Int                # AWS signature version (2 or 4)
    timeout::Float64            # request timeout in seconds, if set to 0.0, request will never time out. Default is 0.0
    dry_run::Bool               # If true, no actual request will be made - implies dbg flag below
    dbg::Bool                   # print request and raw response to screen

end
```
Constructors:

```
AWSEnv(; id=AWS_ID, key=AWS_SECKEY, token=AWS_TOKEN, ec2_creds=false, scheme="https", region=AWS_REGION, ep="", sig_ver=4, timeout=0.0, dr=false, dbg=false)
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

    pd::Union(LightXML.XMLElement, Nothing)
end
```


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


### SQS API

This package uses the REST interface of SQS

- The type names, function names, etc follow the names specified in http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/Welcome.html as well as in http://queue.amazonaws.com/doc/2012-11-05/QueueService.wsdl

- Sample code

```
using AWS, AWS.SQS

include("config.jl")


env=AWSEnv(; id=id, key=key, dbg=dbg, region=region)
## env=AWSEnv(; id=id, key=key, dbg=dbg)

queueName="MyTest1"

println("List all queues !!!")
queues = SQS.ListQueues(env)

println("Create queue")
attributes = AttributeType[]
push!(attributes, AttributeType(name="DelaySeconds",value="300"))
push!(attributes, AttributeType(name="VisibilityTimeout",value="120"))
resp = CreateQueue(env; queueName=queueName, attributeSet=attributes)
if resp.http_code < 299 
    println("Test for Create Queue Passed")
else
    println("Test for Create Queue Failed")
end
    
qurl = resp.obj.queueUrl
@show qurl

println("Get queue attributes")
resp = GetQueueAttributes(env; queueUrl=qurl, attributeNameSet=["All"])
if resp.http_code < 299
    println("Test for Get Queue Attributes Passed")
else
    println("Test for Get Queue Attributes Failed")
end

println("Send Message")
msgAttributes = MessageAttributeType[]
push!(msgAttributes, MessageAttributeType(name="some-attribute",
  value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="0")))
push!(msgAttributes, MessageAttributeType(name="other-attribute",
  value=MessageAttributeValueType(dataType="String.yyy", stringValue="My yyy string")))
push!(msgAttributes, MessageAttributeType(name="bin-attribute",
  value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])))
resp = SendMessage(env; queueUrl=qurl, delaySeconds=0, messageBody="test", messageAttributeSet=msgAttributes)
if resp.http_code < 299
    println("Test for Send Message Passed")
else
    println("Test for Send Message Failed")
end


println("Receive Message")
resp=ReceiveMessage(env; queueUrl=qurl, attributeNameSet=["All"], messageAttributeNameSet=["All"])
if resp.http_code < 299
    println("Test for Receive Message Passed")
else
    println("Test for Receive Message Failed")
end

msg = resp.obj.messageSet[1]
msg_body = msg.body
  # msg_body == "test"

println("Delete Message")
resp = DeleteMessage(env; queueUrl=qurl, receiptHandle=msg.receiptHandle)
if resp.http_code < 299
    println("Test for Delete Message Passed")
else
    println("Test for Delete Message Failed")
end


println("Send Message Batch")
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
## Test for SendMessageBatch
id1 = "SendMessageBatchMessage1"
delaySeconds1 = 10
msgAttributes1 = MessageAttributeType[]
push!(msgAttributes1, MessageAttributeType(name="some-attribute",
  value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="111")))
push!(msgAttributes1, MessageAttributeType(name="other-attribute",
  value=MessageAttributeValueType(dataType="String.yyy", stringValue="My 111 string")))
push!(msgAttributes1, MessageAttributeType(name="bin-attribute",
  value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])))
messageBody1 = "Message Body 1"
sendMessageBatchRequestEntryType1 = SendMessageBatchRequestEntryType(; delaySeconds=delaySeconds1, id=id1, messageAttributeSet=msgAttributes1, messageBody=messageBody1)

id2 = "SendMessageBatchMessage2"
delaySeconds2 = 10
msgAttributes2 = MessageAttributeType[]
push!(msgAttributes2, MessageAttributeType(name="some-attribute",
  value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="222")))
push!(msgAttributes2, MessageAttributeType(name="other-attribute",
  value=MessageAttributeValueType(dataType="String.yyy", stringValue="My 222 string")))
push!(msgAttributes2, MessageAttributeType(name="bin-attribute",
  value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])))
messageBody2 = "Message Body 2"
sendMessageBatchRequestEntryType2 = SendMessageBatchRequestEntryType(; delaySeconds=delaySeconds2, id=id2, messageAttributeSet=msgAttributes2, messageBody=messageBody2)


id3 = "SendMessageBatchMessage3"
delaySeconds3 = 10
messageBody3 = "Message Body 3"
sendMessageBatchRequestEntryType3 = SendMessageBatchRequestEntryType(; delaySeconds=delaySeconds3, id=id3, messageBody=messageBody3)

id4 = "SendMessageBatchMessage4"
delaySeconds4 = 10
messageBody4 = "Message Body 4"
sendMessageBatchRequestEntryType4 = SendMessageBatchRequestEntryType(; delaySeconds=delaySeconds4, id=id4, messageBody=messageBody4)

sendMessageBatchRequestEntrySet = Vector{SendMessageBatchRequestEntryType}()
push!(sendMessageBatchRequestEntrySet, sendMessageBatchRequestEntryType1)
push!(sendMessageBatchRequestEntrySet, sendMessageBatchRequestEntryType2)
push!(sendMessageBatchRequestEntrySet, sendMessageBatchRequestEntryType3)
push!(sendMessageBatchRequestEntrySet, sendMessageBatchRequestEntryType4)

sendMessageBatchType = SendMessageBatchType(; sendMessageBatchRequestEntrySet=sendMessageBatchRequestEntrySet, queueUrl=qurl)
resp = SendMessageBatch(env, sendMessageBatchType)
if resp.http_code < 299
    println("Test for Send Message Batch Passed")
else
    println("Test for Send Message Batch Failed")
end

println("Sleeping for 20 secs !!!")
sleep(20)

println("Delete Message Batch")
## Test case for DeleteMessageBatch
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
## resp1=ReceiveMessage(env; queueUrl=qurl, attributeNameSet=["All"], messageAttributeNameSet=["All"])
resp1=ReceiveMessage(env; queueUrl=qurl)
msg1 = resp1.obj.messageSet[1]
## resp2=ReceiveMessage(env; queueUrl=qurl, attributeNameSet=["All"], messageAttributeNameSet=["All"])
resp2=ReceiveMessage(env; queueUrl=qurl)
msg2 = resp2.obj.messageSet[1]

deleteMessageBatchRequestEntryType1 = DeleteMessageBatchRequestEntryType(; id=id1, receiptHandle=msg1.receiptHandle)
deleteMessageBatchRequestEntryType2 = DeleteMessageBatchRequestEntryType(; id=id2, receiptHandle=msg2.receiptHandle)
deleteMessageBatchRequestEntrySet = Vector{DeleteMessageBatchRequestEntryType}()
push!(deleteMessageBatchRequestEntrySet, deleteMessageBatchRequestEntryType1)
push!(deleteMessageBatchRequestEntrySet, deleteMessageBatchRequestEntryType2)

deleteMessageBatchType = DeleteMessageBatchType(; deleteMessageBatchRequestEntrySet=deleteMessageBatchRequestEntrySet, queueUrl=qurl)
resp = DeleteMessageBatch(env, deleteMessageBatchType)
if resp.http_code < 299
    println("Test for Delete Message Batch Passed")
else
    println("Test for Delete Message Batch Failed")
end



println("Change Message Visibility")
## Test case for ChangeMessageVisibility
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
resp=ReceiveMessage(env; queueUrl=qurl)
msg = resp.obj.messageSet[1]

changeMessageVisibilityType = ChangeMessageVisibilityType(; queueUrl=qurl, receiptHandle=msg.receiptHandle, visibilityTimeout=30)
resp = ChangeMessageVisibility(env, changeMessageVisibilityType)
if resp.http_code < 299
    println("Test for Change Message Visibility Passed")
else
    println("Test for Change Message Visibility Failed")
end



println("Change Message Visibility Batch")
## Test case for ChangeMessageVisibilityBatch
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
resp1=ReceiveMessage(env; queueUrl=qurl)
msg1 = resp1.obj.messageSet[1]
id1=resp1.obj.messageSet[1].messageId

resp2=ReceiveMessage(env; queueUrl=qurl)
msg2 = resp2.obj.messageSet[1]
id2=resp2.obj.messageSet[1].messageId

changeMessageVisibilityBatchRequestEntryType1 = ChangeMessageVisibilityBatchRequestEntryType(; id=id1, receiptHandle=msg1.receiptHandle, visibilityTimeout=60)
changeMessageVisibilityBatchRequestEntryType2 = ChangeMessageVisibilityBatchRequestEntryType(; id=id2, receiptHandle=msg2.receiptHandle, visibilityTimeout=90)
changeMessageVisibilityBatchRequestEntrySet = Vector{ChangeMessageVisibilityBatchRequestEntryType}()
push!(changeMessageVisibilityBatchRequestEntrySet, changeMessageVisibilityBatchRequestEntryType1)
push!(changeMessageVisibilityBatchRequestEntrySet, changeMessageVisibilityBatchRequestEntryType2)

changeMessageVisibilityBatchType = ChangeMessageVisibilityBatchType(; queueUrl=qurl, changeMessageVisibilityBatchRequestEntrySet=changeMessageVisibilityBatchRequestEntrySet)
resp = ChangeMessageVisibilityBatch(env, changeMessageVisibilityBatchType)
if resp.http_code < 299
    println("Test for Change Message Visibility Batch Passed")
else
    println("Test for Change Message Visibility Batch Failed")
end



println("List Dead Letter Source Queues")
## Test case for ListDeadLetterSourceQueues
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
resp = ListDeadLetterSourceQueues(env; queueUrl=qurl)
if resp.http_code < 299
    println("Test for List Dead Letter Source Queues Passed")
else
    println("Test for List Dead Letter Source Queues Failed")
end


println("Purge Queue")
## Test case for PurgeQueue
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
resp = PurgeQueue(env; queueUrl=qurl)
if resp.http_code < 299
    println("Test for Purge Queue Passed")
else
    println("Test for Purge Queue Failed")
end


println("Add  Permission")
## Test case for AddPermission
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl

aWSAccountIdSet = Vector{String}()
actionNameSet = Vector{String}()

push!(aWSAccountIdSet, awsAccountID)
push!(actionNameSet, "SendMessage")

push!(aWSAccountIdSet, awsAccountID)
push!(actionNameSet, "ReceiveMessage")

resp = AddPermission(env; queueUrl=qurl, label="My Permission 1", aWSAccountIdSet=aWSAccountIdSet, actionNameSet=actionNameSet)
if resp.http_code < 299
    println("Test for Add Permission Passed")
else
    println("Test for Add Permission Failed")
    println("Check if the AWS Account ID exists !!")
end


println("Remove  Permission")
## Test case for RemovePermission
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
resp = RemovePermission(env; queueUrl=qurl, label="My Permission 1")
if resp.http_code < 299
    println("Test for Remove Permission Passed")
else
    println("Test for Remove Permission Failed")
end


println("Testing DeleteQueue")
qurl=GetQueueUrl(env; queueName=queueName).obj.queueUrl
DeleteQueue(env; queueUrl=qurl)
if resp.http_code < 299
    println("Test for Delete Queue Passed")
else
    println("Test for Delete Queue Failed")
end



```

The response object is as below:

```
type SQSResponse
    http_code::Int
    headers
    body::Union{String, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any
end

```

The error object is as below:

```
type SQSError
    typ::String
    code::String
    msg::String
    detail::String
    request_id::Union{String, Void}
end
```


### Julia Dependencies

Calendar

Requests

LightXML


### Binary dependencies

libz must be installed

libxml2 must be installed

### NOTE

- The crypto functions required for this package are in https://github.com/amitmurthy/AWS.jl/blob/master/src/crypto.jl, since
  OpenSSL.jl does not yet support the functions this package needs. This will be replaced with calls to OpenSSL.jl when
  it supports the same.
