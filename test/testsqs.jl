module TestSQS
using AWS
using AWS.SQS
using Base.Test

function check_resp(resp, resp_obj_type=Any)
    info("response: ", resp.obj)
    @test 200 <= resp.http_code <= 206
    @test isa(resp, AWS.SQS.SQSResponse)
    @test isa(resp.obj, resp_obj_type)
end

function runtests(env, config)
    awsAccountID = get(config, "awsAccountID", "")

    if isempty(awsAccountID)
        warn("skipping SQS tests, awsAccountID not set")
        return
    end

    queueName = "MyTest1"

    println("list all queues")
    resp = SQS.ListQueues(env)
    check_resp(resp, AWS.SQS.ListQueuesResponseType)
    @test isa(resp.obj.queueUrlSet, Vector{String})

    println("create queue")
    attributes = [
        AttributeType(name="DelaySeconds", value="300"),
        AttributeType(name="VisibilityTimeout", value="120")
    ]
    resp = CreateQueue(env; queueName=queueName, attributeSet=attributes)
    check_resp(resp, AWS.SQS.CreateQueueResponseType)
    @test endswith(resp.obj.queueUrl, queueName)

    qurl = resp.obj.queueUrl
    @show qurl
    @test qurl == GetQueueUrl(env; queueName=queueName).obj.queueUrl

    println("get queue attributes")
    resp = GetQueueAttributes(env; queueUrl=qurl, attributeNameSet=["All"])
    check_resp(resp, AWS.SQS.GetQueueAttributesResponseType)
    @test isa(resp.obj.attributeSet, Vector{AWS.SQS.AttributeType})
    @test !isempty(resp.obj.attributeSet)

    println("send message")
    msgAttributes = [
        MessageAttributeType(name="some-attribute", value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="0")),
        MessageAttributeType(name="other-attribute", value=MessageAttributeValueType(dataType="String.yyy", stringValue="My yyy string")),
        MessageAttributeType(name="bin-attribute", value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6]))
    ]
    resp = SendMessage(env; queueUrl=qurl, delaySeconds=0, messageBody="test", messageAttributeSet=msgAttributes)
    check_resp(resp, AWS.SQS.SendMessageResponseType)
    msgid = resp.obj.messageId

    println("receive messages")
    resp = ReceiveMessage(env; queueUrl=qurl, attributeNameSet=["All"], messageAttributeNameSet=["All"])
    check_resp(resp, AWS.SQS.ReceiveMessageResponseType)
    @test isa(resp.obj.messageSet, Vector{AWS.SQS.MessageType})
    info("received ", length(resp.obj.messageSet), " messages")

    msgids = [x.messageId for x in resp.obj.messageSet]
    @test msgid in msgids
    msgbodies = [x.body for x in resp.obj.messageSet]
    @test "test" in msgbodies

    println("delete messages")
    for hndl in [x.receiptHandle for x in resp.obj.messageSet]
        resp = DeleteMessage(env; queueUrl=qurl, receiptHandle=hndl)
        check_resp(resp, AWS.SQS.DeleteMessageResponseType)
        info("deleted ", resp.obj.requestId)
    end

    println("send message batch")
    id1 = "SendMessageBatchMessage1"
    delaySeconds1 = 10
    msgAttributes1 = [
        MessageAttributeType(name="some-attribute", value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="111")),
        MessageAttributeType(name="other-attribute", value=MessageAttributeValueType(dataType="String.yyy", stringValue="My 111 string")),
        MessageAttributeType(name="bin-attribute", value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6]))
    ]
    messageBody1 = "Message Body 1"
    sendMessageBatchRequestEntryType1 = SendMessageBatchRequestEntryType(; delaySeconds=delaySeconds1, id=id1, messageAttributeSet=msgAttributes1, messageBody=messageBody1)

    id2 = "SendMessageBatchMessage2"
    delaySeconds2 = 10
    msgAttributes2 = [
        MessageAttributeType(name="some-attribute", value=MessageAttributeValueType(dataType="Number.integer-ish", stringValue="222")),
        MessageAttributeType(name="other-attribute", value=MessageAttributeValueType(dataType="String.yyy", stringValue="My 222 string")),
        MessageAttributeType(name="bin-attribute", value=MessageAttributeValueType(dataType="Binary.jpg", binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6]))
    ]
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

    sendMessageBatchRequestEntrySet = [
        sendMessageBatchRequestEntryType1,
        sendMessageBatchRequestEntryType2,
        sendMessageBatchRequestEntryType3,
        sendMessageBatchRequestEntryType4
    ]

    sendMessageBatchType = SendMessageBatchType(; sendMessageBatchRequestEntrySet=sendMessageBatchRequestEntrySet, queueUrl=qurl)
    resp = SendMessageBatch(env, sendMessageBatchType)
    check_resp(resp, Vector{AWS.SQS.SendMessageBatchResultErrorEntryType})

    println("Sleeping for 20 secs !!!")
    sleep(20)

    println("change message visibility")
    resp = ReceiveMessage(env; queueUrl=qurl)
    check_resp(resp, AWS.SQS.ReceiveMessageResponseType)
    msg = resp.obj.messageSet[1]

    changeMessageVisibilityType = ChangeMessageVisibilityType(; queueUrl=qurl, receiptHandle=msg.receiptHandle, visibilityTimeout=30)
    resp = ChangeMessageVisibility(env, changeMessageVisibilityType)
    check_resp(resp, AWS.SQS.ChangeMessageVisibilityResponseType)

    println("change message visibility batch")
    resp1 = ReceiveMessage(env; queueUrl=qurl)
    msg1 = resp1.obj.messageSet[1]
    id1 = resp1.obj.messageSet[1].messageId

    resp2 = ReceiveMessage(env; queueUrl=qurl)
    msg2 = resp2.obj.messageSet[1]
    id2 = resp2.obj.messageSet[1].messageId

    changeMessageVisibilityBatchRequestEntryType1 = ChangeMessageVisibilityBatchRequestEntryType(; id=id1, receiptHandle=msg1.receiptHandle, visibilityTimeout=60)
    changeMessageVisibilityBatchRequestEntryType2 = ChangeMessageVisibilityBatchRequestEntryType(; id=id2, receiptHandle=msg2.receiptHandle, visibilityTimeout=90)
    changeMessageVisibilityBatchRequestEntrySet = [
        changeMessageVisibilityBatchRequestEntryType1,
        changeMessageVisibilityBatchRequestEntryType2
    ]

    changeMessageVisibilityBatchType = ChangeMessageVisibilityBatchType(; queueUrl=qurl, changeMessageVisibilityBatchRequestEntrySet=changeMessageVisibilityBatchRequestEntrySet)
    resp = ChangeMessageVisibilityBatch(env, changeMessageVisibilityBatchType)
    check_resp(resp, AWS.SQS.ChangeMessageVisibilityResponseBatchType)

    println("delete message batch")
    deleteMessageBatchRequestEntryType1 = DeleteMessageBatchRequestEntryType(; id=id1, receiptHandle=msg1.receiptHandle)
    deleteMessageBatchRequestEntryType2 = DeleteMessageBatchRequestEntryType(; id=id2, receiptHandle=msg2.receiptHandle)
    deleteMessageBatchRequestEntrySet = [
        deleteMessageBatchRequestEntryType1,
        deleteMessageBatchRequestEntryType2
    ]

    deleteMessageBatchType = DeleteMessageBatchType(; deleteMessageBatchRequestEntrySet=deleteMessageBatchRequestEntrySet, queueUrl=qurl)
    resp = DeleteMessageBatch(env, deleteMessageBatchType)
    check_resp(resp, Vector{AWS.SQS.DeleteMessageBatchResultErrorEntryType})

    println("list dead letter source queues")
    resp = ListDeadLetterSourceQueues(env; queueUrl=qurl)
    check_resp(resp, Void)

    println("purge queue")
    resp = PurgeQueue(env; queueUrl=qurl)
    check_resp(resp, String)

    println("add permission")
    aWSAccountIdSet = [awsAccountID, awsAccountID]
    actionNameSet = ["SendMessage", "ReceiveMessage"]

    resp = AddPermission(env; queueUrl=qurl, label="My Permission 1", aWSAccountIdSet=aWSAccountIdSet, actionNameSet=actionNameSet)
    check_resp(resp, String)

    println("remove  permission")
    resp = RemovePermission(env; queueUrl=qurl, label="My Permission 1")
    check_resp(resp, String)

    println("testing delete queue")
    resp = DeleteQueue(env; queueUrl=qurl)
    check_resp(resp, AWS.SQS.DeleteQueueResponseType)
end

end # module TestSQS
