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

aWSAccountIdSet = Vector{ASCIIString}()
actionNameSet = Vector{ASCIIString}()

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

