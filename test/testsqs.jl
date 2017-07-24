module TestSQS
using AWS
using AWS.SQS
using Base.Test

function check_resp(resp, resp_obj_type=Any)
    info("response: ", resp.obj)
    @test 200 <= resp.http_code <= 206
    @test isa(resp, AWS.SQS.SQSResponse)
    @test isa(resp.obj, resp_obj_type)
    @test !isa(resp.obj, SQSError)
end

function runtests(env, config)
    awsAccountID = get(config, "awsAccountID", "")

    if isempty(awsAccountID)
        warn("skipping SQS tests, awsAccountID not set")
        return
    end

    queueName = "MyTest1"

    println("list all queues")
    resp = ListQueues(env)
    check_resp(resp, ListQueuesResult)
    @test isa(resp.obj.queueUrl, Union{Void,Vector{String}})

    println("create queue")
    attributes = Dict(
        "DelaySeconds" => "300",
        "VisibilityTimeout" => "120"
    )
    resp = CreateQueue(env; queueName=queueName, attribute=attributes)
    check_resp(resp, CreateQueueResult)
    @test endswith(resp.obj.queueUrl, queueName)

    qurl = resp.obj.queueUrl
    @show qurl
    @test qurl == GetQueueUrl(env; queueName=queueName).obj.queueUrl

    println("get queue attributes")
    resp = GetQueueAttributes(env; queueUrl=qurl, attributeName=["All"])
    check_resp(resp, AWS.SQS.GetQueueAttributesResult)
    @test isa(resp.obj.attribute, Dict{String,String})
    @test !isempty(resp.obj.attribute)

    println("send message")
    msgAttributes = Dict(
        "some-attribute"  => MessageAttributeValue(; dataType="Number.integer-ish", stringValue="0"),
        "other-attribute" => MessageAttributeValue(; dataType="String.yyy",         stringValue="My yyy string"),
        "bin-attribute"   => MessageAttributeValue(; dataType="Binary.jpg",         binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])
    )
    resp = SendMessage(env; queueUrl=qurl, delaySeconds=0, messageBody="test", messageAttribute=msgAttributes)
    check_resp(resp, SendMessageResult)
    msgid = resp.obj.messageId

    println("receive messages")
    resp = ReceiveMessage(env; queueUrl=qurl, attributeName=["All"], messageAttributeName=["All"])
    check_resp(resp, ReceiveMessageResult)
    @test isa(resp.obj.message, Vector{Message})
    info("received ", length(resp.obj.message), " messages")

    msgids = [x.messageId for x in resp.obj.message]
    @test msgid in msgids
    msgbodies = [x.body for x in resp.obj.message]
    @test "test" in msgbodies

    println("delete messages")
    for hndl in [x.receiptHandle for x in resp.obj.message]
        resp = DeleteMessage(env; queueUrl=qurl, receiptHandle=hndl)
        check_resp(resp)
        info("deleted ", hndl)
    end

    println("send message batch")
    id1 = "SendMessageBatchMessage1"
    delaySeconds1 = 10
    msgAttributes1 = Dict(
        "some-attribute"  => MessageAttributeValue(; dataType="Number.integer-ish", stringValue="111"),
        "other-attribute" => MessageAttributeValue(; dataType="String.yyy",         stringValue="My 111 string"),
        "bin-attribute"   => MessageAttributeValue(; dataType="Binary.jpg",         binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])
    )
    messageBody1 = "Message Body 1"
    sendMessageBatchRequestEntry1 = SendMessageBatchRequestEntry(; delaySeconds=delaySeconds1, id=id1, messageAttribute=msgAttributes1, messageBody=messageBody1)

    id2 = "SendMessageBatchMessage2"
    delaySeconds2 = 10
    msgAttributes2 = Dict(
        "some-attribute"  => MessageAttributeValue(; dataType="Number.integer-ish", stringValue="222"),
        "other-attribute" => MessageAttributeValue(; dataType="String.yyy",         stringValue="My 222 string"),
        "bin-attribute"   => MessageAttributeValue(; dataType="Binary.jpg",         binaryValue=[0x0,0x1,0x2,0x3,0x4,0x5,0x6])
    )
    messageBody2 = "Message Body 2"
    sendMessageBatchRequestEntry2 = SendMessageBatchRequestEntry(; delaySeconds=delaySeconds2, id=id2, messageAttribute=msgAttributes2, messageBody=messageBody2)

    id3 = "SendMessageBatchMessage3"
    delaySeconds3 = 10
    messageBody3 = "Message Body 3"
    sendMessageBatchRequestEntry3 = SendMessageBatchRequestEntry(; delaySeconds=delaySeconds3, id=id3, messageBody=messageBody3)

    id4 = "SendMessageBatchMessage4"
    delaySeconds4 = 10
    messageBody4 = "Message Body 4"
    sendMessageBatchRequestEntry4 = SendMessageBatchRequestEntry(; delaySeconds=delaySeconds4, id=id4, messageBody=messageBody4)

    sendMessageBatchRequestEntry = [
        sendMessageBatchRequestEntry1,
        sendMessageBatchRequestEntry2,
        sendMessageBatchRequestEntry3,
        sendMessageBatchRequestEntry4
    ]

    req = SendMessageBatchRequest(; sendMessageBatchRequestEntry=sendMessageBatchRequestEntry, queueUrl=qurl)
    resp = SendMessageBatch(env, req)
    check_resp(resp)

    println("Sleeping for 20 secs !!!")
    sleep(20)

    println("change message visibility")
    resp = ReceiveMessage(env; queueUrl=qurl)
    check_resp(resp, ReceiveMessageResult)
    msg = resp.obj.message[1]

    req = ChangeMessageVisibilityRequest(; queueUrl=qurl, receiptHandle=msg.receiptHandle, visibilityTimeout=30)
    resp = ChangeMessageVisibility(env, req)
    check_resp(resp)

    println("change message visibility batch")
    resp1 = ReceiveMessage(env; queueUrl=qurl)
    msg1 = resp1.obj.message[1]
    id1 = msg1.messageId

    resp2 = ReceiveMessage(env; queueUrl=qurl)
    msg2 = resp2.obj.message[1]
    id2 = msg2.messageId

    changeMessageVisibilityBatchRequestEntry1 = ChangeMessageVisibilityBatchRequestEntry(; id=id1, receiptHandle=msg1.receiptHandle, visibilityTimeout=60)
    changeMessageVisibilityBatchRequestEntry2 = ChangeMessageVisibilityBatchRequestEntry(; id=id2, receiptHandle=msg2.receiptHandle, visibilityTimeout=90)
    changeMessageVisibilityBatchRequestEntry = [
        changeMessageVisibilityBatchRequestEntry1,
        changeMessageVisibilityBatchRequestEntry2
    ]

    req = ChangeMessageVisibilityBatchRequest(; queueUrl=qurl, changeMessageVisibilityBatchRequestEntry=changeMessageVisibilityBatchRequestEntry)
    resp = ChangeMessageVisibilityBatch(env, req)
    check_resp(resp)

    println("delete message batch")
    deleteMessageBatchRequestEntry1 = DeleteMessageBatchRequestEntry(; id=id1, receiptHandle=msg1.receiptHandle)
    deleteMessageBatchRequestEntry2 = DeleteMessageBatchRequestEntry(; id=id2, receiptHandle=msg2.receiptHandle)
    deleteMessageBatchRequestEntry = [
        deleteMessageBatchRequestEntry1,
        deleteMessageBatchRequestEntry2
    ]

    req = DeleteMessageBatchRequest(; deleteMessageBatchRequestEntry=deleteMessageBatchRequestEntry, queueUrl=qurl)
    resp = DeleteMessageBatch(env, req)
    check_resp(resp)

    println("list dead letter source queues")
    resp = ListDeadLetterSourceQueues(env; queueUrl=qurl)
    check_resp(resp)

    println("purge queue")
    resp = PurgeQueue(env; queueUrl=qurl)
    check_resp(resp)

    println("add permission")
    awsAccountIds = [awsAccountID, awsAccountID]
    actionNames = ["SendMessage", "ReceiveMessage"]

    resp = AddPermission(env; queueUrl=qurl, label="My Permission 1", aWSAccountId=awsAccountIds, actionName=actionNames)
    check_resp(resp)

    println("remove  permission")
    resp = RemovePermission(env; queueUrl=qurl, label="My Permission 1")
    check_resp(resp)

    println("testing delete queue")
    resp = DeleteQueue(env; queueUrl=qurl)
    check_resp(resp)
end

end # module TestSQS
