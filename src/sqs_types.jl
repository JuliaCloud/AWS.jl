type AttributeType
    name::Union{ASCIIString, Void}
    value::Union{ASCIIString, Void}

    AttributeType(; name=nothing, value=nothing) =
         new(name, value)
end
function AttributeType(pd::LightXML.XMLElement)
    o = AttributeType()
    o.name = LightXML.content(LightXML.find_element(pd, "Name"))
    o.value = LightXML.content(LightXML.find_element(pd, "Value"))
    o
end

export AttributeType


# Note: dataType="Binary" is not supported because HTTPC.urlencode_query_params is not presently capable of encoding binary data into a URL.
# Need to either enhance HTTPClient package, or place binary data into POST message instead of GET.
type MessageAttributeValueType
    dataType::Union{AbstractString, Void}
    binaryValue::Union{Vector{UInt8}, Void}
    stringValue::Union{AbstractString, Void}

    MessageAttributeValueType(; dataType=nothing, binaryValue=nothing, stringValue=nothing) =
         new(dataType, binaryValue, stringValue)
end
function MessageAttributeValueType(pd::LightXML.XMLElement)
    o = MessageAttributeValueType()
    o.dataType = LightXML.find_element(pd, "DataType") != nothing ? LightXML.content(LightXML.find_element(pd, "DataType")) : nothing
    o.binaryValue = LightXML.find_element(pd, "BinaryValue") != nothing ? AWS.safe_parseb64(LightXML.content(LightXML.find_element(pd, "BinaryValue"))) : nothing
    o.stringValue = LightXML.find_element(pd, "StringValue") != nothing ? LightXML.content(LightXML.find_element(pd, "StringValue")) : nothing
    o
end

export MessageAttributeValueType


type MessageAttributeType
    name::Union{ASCIIString, Void}
    value::Union{MessageAttributeValueType, Void}

    MessageAttributeType(; name=nothing, value=nothing) =
         new(name, value)
end
function MessageAttributeType(pd::LightXML.XMLElement)
    o = MessageAttributeType()
    o.name = LightXML.content(LightXML.find_element(pd, "Name"))
    o.value = MessageAttributeValueType(LightXML.find_element(pd, "Value"))
    o
end

export MessageAttributeType


type CreateQueueType
    queueName::Union{ASCIIString, Void}
    attributeSet::Union{Vector{AttributeType}, Void}

    CreateQueueType(; queueName=nothing, attributeSet=nothing) =
         new(queueName, attributeSet)
end
function CreateQueueType(pd::LightXML.XMLElement)
    o = CreateQueueType()
    o.queueName = LightXML.content(LightXML.find_element(pd, "QueueName"))
    o.attributeSet = AWS.@parse_vector(AWS.SQS.AttributeType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "Attribute")))
    o
end

export CreateQueueType


type CreateQueueResponseType
    queueUrl::Union{ASCIIString, Void}
    requestId::Union{ASCIIString, Void}

    CreateQueueResponseType(; queueUrl=nothing, requestId=nothing) =
         new(queueUrl, requestId)
end
function CreateQueueResponseType(pd::LightXML.XMLElement)
    o = CreateQueueResponseType()
    o.queueUrl = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "CreateQueueResult"), "QueueUrl"))
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export CreateQueueResponseType


type GetQueueUrlType
    queueName::Union{ASCIIString, Void}
    queueOwnerAWSAccountId::Union{ASCIIString, Void}

    GetQueueUrlType(; queueName=nothing, queueOwnerAWSAccountId=nothing) =
         new(queueName, queueOwnerAWSAccountId)
end
function GetQueueUrlType(pd::LightXML.XMLElement)
    o = GetQueueUrlType()
    o.queueName = LightXML.content(LightXML.find_element(pd, "QueueName"))
    o.queueOwnerAWSAccountId = LightXML.content(LightXML.find_element(pd, "QueueOwnerAWSAccountId"))
    o
end

export GetQueueUrlType


type GetQueueUrlResponseType
    queueUrl::Union{ASCIIString, Void}
    requestId::Union{ASCIIString, Void}

    GetQueueUrlResponseType(; queueUrl=nothing, requestId=nothing) =
         new(queueUrl, requestId)
end
function GetQueueUrlResponseType(pd::LightXML.XMLElement)
    o = GetQueueUrlResponseType()
    o.queueUrl = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "GetQueueUrlResult"), "QueueUrl"))
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export GetQueueUrlResponseType


type ListQueuesType
    queueNamePrefix::Union{ASCIIString, Void}

    ListQueuesType(; queueNamePrefix=nothing) =
         new(queueNamePrefix)
end
function ListQueuesType(pd::LightXML.XMLElement)
    o = ListQueuesType()
    o.queueName = LightXML.content(LightXML.find_element(pd, "QueueNamePrefix"))
    o
end

export ListQueuesType


type ListQueuesResponseType
    queueUrlSet::Union{Vector{ASCIIString}, Void}
    requestId::Union{ASCIIString, Void}

    ListQueuesResponseType(; queueUrlSet=nothing, requestId=nothing) =
         new(queueUrlSet, requestId)
end
function ListQueuesResponseType(pd::LightXML.XMLElement)
    o = ListQueuesResponseType()
    o.queueUrlSet = ASCIIString[LightXML.content(url) for url in LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ListQueuesResult"), "QueueUrl")]
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export ListQueuesResponseType


# ChangeMessageVisibilityType
# ChangeMessageVisibilityResponseType

type DeleteMessageType
    queueUrl::Union{ASCIIString, Void}
    receiptHandle::Union{ASCIIString, Void}

    DeleteMessageType(; queueUrl=nothing, receiptHandle=nothing) =
         new(queueUrl, receiptHandle)
end
function DeleteMessageType(pd::LightXML.XMLElement)
    o = DeleteMessageType()
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o.receiptHandle = LightXML.content(LightXML.find_element(pd, "ReceiptHandle"))
    o
end

export DeleteMessageType


type DeleteMessageResponseType
    requestId::Union{ASCIIString, Void}

    DeleteMessageResponseType(; requestId=nothing) =
         new(requestId)
end
function DeleteMessageResponseType(pd::LightXML.XMLElement)
    o = DeleteMessageResponseType()
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export DeleteMessageResponseType

type DeleteQueueType
    queueUrl::Union{ASCIIString, Void}

    DeleteQueueType(; queueUrl=nothing) =
         new(queueUrl)
end
function DeleteQueueType(pd::LightXML.XMLElement)
    o = DeleteQueueType()
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o
end

export DeleteQueueType


type DeleteQueueResponseType
    requestId::Union{ASCIIString, Void}

    DeleteQueueResponseType(; requestId=nothing) =
         new(requestId)
end
function DeleteQueueResponseType(pd::LightXML.XMLElement)
    o = DeleteQueueResponseType()
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export DeleteQueueResponseType


type GetQueueAttributesType
    attributeNameSet::Union{Vector{ASCIIString}, Void}
    queueUrl::Union{ASCIIString, Void}

    GetQueueAttributesType(; attributeNameSet=nothing, queueUrl=nothing) =
         new(attributeNameSet, queueUrl)
end
function GetQueueAttributesType(pd::LightXML.XMLElement)
    o = GetQueueAttributesType()
    o.attributeNameSet = AWS.@parse_vector(ASCIIString, LightXML.get_elements_by_tagname(pd, "AttributeName"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o
end

export GetQueueAttributesType


type GetQueueAttributesResponseType
    attributeSet::Union{Vector{AttributeType}, Void}
    requestId::Union{ASCIIString, Void}

    GetQueueAttributesResponseType(; attributeSet=nothing, requestId=nothing) =
         new(attributeSet, requestId)
end
function GetQueueAttributesResponseType(pd::LightXML.XMLElement)
    o = GetQueueAttributesResponseType()
    o.attributeSet = AWS.@parse_vector(AWS.SQS.AttributeType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "GetQueueAttributesResult"), "Attribute"))
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export GetQueueAttributesResponseType


type ReceiveMessageType
    maxNumberOfMessages::Union{Int, Void}
    visibilityTimeout::Union{Int, Void}
    waitTimeSeconds::Union{Int, Void}
    attributeNameSet::Union{Vector{ASCIIString}, Void}
    messageAttributeNameSet::Union{Vector{ASCIIString}, Void}
    queueUrl::Union{ASCIIString, Void}

    ReceiveMessageType(; maxNumberOfMessages=nothing, visibilityTimeout=nothing, waitTimeSeconds=nothing, attributeNameSet=nothing, messageAttributeNameSet=nothing, queueUrl=nothing) =
         new(maxNumberOfMessages, visibilityTimeout, waitTimeSeconds, attributeNameSet, messageAttributeNameSet, queueUrl)
end
function ReceiveMessageType(pd::LightXML.XMLElement)
    o = ReceiveMessageType()
    o.maxNumberOfMessages = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "MaxNumberOfMessages")))
    o.visibilityTimeout = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "VisibilityTimeout")))
    o.waitTimeSeconds = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "WaitTimeSeconds")))
    o.attributeNameSet = AWS.@parse_vector(ASCIIString, LightXML.content(LightXML.get_elements_by_tagname(pd, "AttributeName")))
    o.messageAttributeNameSet = AWS.@parse_vector(ASCIIString, LightXML.content(LightXML.get_elements_by_tagname(pd, "MessageAttributeName")))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o
end

export ReceiveMessageType


type MessageType
    messageId::Union{ASCIIString, Void}
    receiptHandle::Union{ASCIIString, Void}
    MD5OfBody::Union{ASCIIString, Void}
    MD5OfMessageAttributes::Union{ASCIIString, Void}
    body::Union{AbstractString, Void}
    attributeSet::Union{Vector{AttributeType}, Void}
    messageAttributeSet::Union{Vector{MessageAttributeType}, Void}

    MessageType(; messageId=nothing, receiptHandle=nothing, MD5OfBody=nothing, MD5OfMessageAttributes=nothing, body=nothing, attributeSet=nothing, messageAttributeSet=nothing) =
        new(messageId, receiptHandle, MD5OfBody, MD5OfMessageAttributes, body, attributeSet, messageAttributeSet)
end
function MessageType(pd::LightXML.XMLElement)
    o = MessageType()
    o.messageId = LightXML.content(LightXML.find_element(pd, "MessageId"))
    o.receiptHandle = LightXML.content(LightXML.find_element(pd, "ReceiptHandle"))
    o.MD5OfBody = LightXML.content(LightXML.find_element(pd, "MD5OfBody"))
    ## MDP o.MD5OfMessageAttributes = LightXML.content(LightXML.find_element(pd, "MD5OfMessageAttributes"))
    o.body = LightXML.content(LightXML.find_element(pd, "Body"))
    o.attributeSet = AWS.@parse_vector(AWS.SQS.AttributeType, LightXML.get_elements_by_tagname(pd, "Attribute"))
    o.messageAttributeSet = AWS.@parse_vector(AWS.SQS.MessageAttributeType, LightXML.get_elements_by_tagname(pd, "MessageAttribute"))
    o
end

export MessageType


type ReceiveMessageResponseType
    messageSet::Union{Vector{MessageType}, Void}
    requestId::Union{ASCIIString, Void}

    ReceiveMessageResponseType(; messageSet=nothing, requestId=nothing) =
         new(messageSet, requestId)
end
function ReceiveMessageResponseType(pd::LightXML.XMLElement)
    o = ReceiveMessageResponseType()
    o.messageSet = AWS.@parse_vector(AWS.SQS.MessageType, LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ReceiveMessageResult"), "Message"))
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export ReceiveMessageResponseType


type SendMessageType
    delaySeconds::Union{Int, Void}
    messageAttributeSet::Union{Vector{MessageAttributeType}, Void}
    messageBody::Union{AbstractString, Void}
    queueUrl::Union{ASCIIString, Void}

    SendMessageType(; delaySeconds=nothing, messageBody=nothing, queueUrl=nothing) =
         new(delaySeconds, messageBody, queueUrl)
end
function SendMessageType(pd::LightXML.XMLElement)
    o = SendMessageType()
    o.delaySeconds = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "DelaySeconds")))
    o.messageAttributeSet = AWS.@parse_vector(AWS.SQS.MessageAttributeType, LightXML.get_elements_by_tagname(pd, "MessageAttribute"))
    o.messageBody = LightXML.content(LightXML.find_element(pd, "MessageBody"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o
end

export SendMessageType


type SendMessageResponseType
    MD5OfMessageBody::Union{ASCIIString, Void}
    MD5OfMessageAttributes::Union{ASCIIString, Void}
    messageId::Union{ASCIIString, Void}
    requestId::Union{ASCIIString, Void}

    SendMessageResponseType(; MD5OfMessageBody=nothing, MD5OfMessageAttributes=nothing, messageId=nothing, requestId=nothing) =
         new(MD5OfMessageBody, MD5OfMessageAttributes, messageId, requestId)
end
function SendMessageResponseType(pd::LightXML.XMLElement)
    o = SendMessageResponseType()
    o.MD5OfMessageBody = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MD5OfMessageBody"))
    ## MDP TODO o.MD5OfMessageAttributes = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MD5OfMessageAttributes"))
    o.messageId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MessageId"))
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export SendMessageResponseType


type SetQueueAttributesType
    attributeSet::Union{Vector{AttributeType}, Void}
    queueUrl::Union{ASCIIString, Void}

    SetQueueAttributesType(; attributeSet=nothing, queueUrl=nothing) =
         new(attributeSet, queueUrl)
end
function SetQueueAttributesType(pd::LightXML.XMLElement)
    o = SetQueueAttributesType()
    o.attributeSet = AWS.@parse_vector(AWS.SQS.AttributeType, LightXML.get_elements_by_tagname(pd, "Attribute"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
    o
end

export SetQueueAttributesType


type SetQueueAttributesResponseType
    requestId::Union{ASCIIString, Void}

    SetQueueAttributesResponseType(; requestId=nothing) =
         new(requestId)
end
function SetQueueAttributesResponseType(pd::LightXML.XMLElement)
    o = SetQueueAttributesResponseType()
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export SetQueueAttributesResponseType

type SendMessageBatchRequestEntryType
    delaySeconds::Union{Int, Void}
    id::Union{ASCIIString, Void}
    messageAttributeSet::Union{Vector{MessageAttributeType}, Void}
    messageBody::Union{AbstractString, Void}

	SendMessageBatchRequestEntryType(; delaySeconds=nothing, id=nothing, messageAttributeSet=nothing, messageBody=nothing) = 
		new(delaySeconds, id, messageAttributeSet, messageBody)
end

function SendMessageBatchRequestEntryType(pd::LightXML.XMLElement)
	o = SendMessageBatchRequestEntryType()
    o.delaySeconds = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "DelaySeconds")))
    o.messageAttributeSet = AWS.@parse_vector(AWS.SQS.MessageAttributeType, LightXML.get_elements_by_tagname(pd, "MessageAttribute"))
    o.messageBody = LightXML.content(LightXML.find_element(pd, "MessageBody"))
end

export SendMessageBatchRequestEntryType

type SendMessageBatchType
    sendMessageBatchRequestEntrySet::Union{Vector{SendMessageBatchRequestEntryType}, Void}
    queueUrl::Union{ASCIIString, Void}

    SendMessageBatchType(; sendMessageBatchRequestEntrySet=nothing, queueUrl=nothing) =
         new(sendMessageBatchRequestEntrySet, queueUrl)
end

function SendMessageBatchType(pd::LightXML.XMLElement)
	o = SendMessageBatchType()
	o.sendMessageBatchRequestSet = AWS.@parse_vector(AWS.SQS.SendMessageBatchRequestEntryType, LightXML.get_elements_by_tagname(pd, "SendMessageBatchRequestEntry"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
end

export SendMessageBatchType

type SendMessageBatchResultEntryType 
    id::Union{ASCIIString, Void}
    MD5OfMessageAttributes::Union{ASCIIString, Void}
    MD5OfBody::Union{ASCIIString, Void}
    messageId::Union{ASCIIString, Void}

	SendMessageBatchResultEntryType(; id=nothing, MD5OfMessageAttributes=nothing, MD5OfBody=nothing, messageId=nothing) = 
		new(id, MD5OfMessageAttributes, MD5OfBody, messageId)
end

function SendMessageBatchResultEntryType(pd::LightXML.XMLElement)
	o = SendMessageBatchResultEntryType()
    o.id = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "Id"))
    ## MDP TODO o.MD5OfMessageAttributes = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MD5OfMessageAttributes"))
    o.MD5OfBody = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MD5OfBody"))
    o.messageId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "SendMessageResult"), "MessageId"))
end

export SendMessageBatchResultEntryType

type SendMessageBatchResultErrorEntryType
    code::Union{ASCIIString, Void}
    id::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}
    senderFault::Union{Bool, Void}

	SendMessageBatchResultErrorEntryType(; code=nothing, id=nothing, message=nothing, senderFault=nothing) = 
		new(code, id, message, senderFault)
end

function SendMessageBatchResultErrorEntryType(pd::LightXML.XMLElement)
    o = SendMessageBatchResultErrorEntryType()
    o.code = LightXML.content(LightXML.find_element(pd, "Code"))
    o.id = LightXML.content(LightXML.find_element(pd, "Id"))
    o.message = LightXML.content(LightXML.find_element(pd, "Message"))
    o.senderFault = LightXML.content(LightXML.find_element(pd, "SenderFault"))
end

export SendMessageBatchResultErrorEntryType

type SendMessageBatchResponseType
    sendMessageBatchResultSet::Union{Vector{SendMessageBatchResultEntryType}, Void}
    sendMessageBatchErrorSet::Union{Vector{SendMessageBatchResultErrorEntryType}, Void}

	SendMessageBatchResponseType(; sendMessageBatchResultSet=nothing, sendMessageBatchErrorSet=nothing) = 
		new(sendMessageBatchResultSet, sendMessageBatchErrorSet)
end

function SendMessageBatchResponseType(pd::LightXML.XMLElement)
	o = SendMessageBatchResponseType()
    o.sendMessageBatchResultSet = AWS.@parse_vector(AWS.SQS.SendMessageBatchResultEntryType, LightXML.get_elements_by_tagname(pd, "SendMessageBatchResultEntry"))
    o.sendMessageBatchErrorSet = AWS.@parse_vector(AWS.SQS.SendMessageBatchResultErrorEntryType, LightXML.get_elements_by_tagname(pd, "SendMessageBatchResultErrorEntry"))
end

export SendMessageBatchResponseType

type DeleteMessageBatchRequestEntryType
    id::Union{ASCIIString, Void}
    receiptHandle::Union{ASCIIString, Void}

	DeleteMessageBatchRequestEntryType(; id=nothing, receiptHandle=nothing) =
		new(id, receiptHandle)
end

function DeleteMessageBatchRequestEntryType(pd::LightXML.XMLElement)
	o = DeleteMessageBatchRequestEntryType()
    o.id = LightXML.content(LightXML.find_element(pd, "Id"))
    o.receiptHandle = LightXML.content(LightXML.find_element(pd, "ReceiptHandle"))
end

export DeleteMessageBatchRequestEntryType

type DeleteMessageBatchType
    deleteMessageBatchRequestEntrySet::Union{Vector{DeleteMessageBatchRequestEntryType}, Void}
    queueUrl::Union{ASCIIString, Void}

    DeleteMessageBatchType(; deleteMessageBatchRequestEntrySet=nothing, queueUrl=nothing) =
         new(deleteMessageBatchRequestEntrySet, queueUrl)
end

function DeleteMessageBatchType(pd::LightXML.XMLElement)
	o = DeleteMessageBatchType()
	o.deleteMessageBatchRequestSet = AWS.@parse_vector(AWS.SQS.DeleteMessageBatchRequestEntryType, LightXML.get_elements_by_tagname(pd, "DeleteMessageBatchRequestEntry"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
end

export DeleteMessageBatchType

type DeleteMessageBatchResultErrorEntryType
    code::Union{ASCIIString, Void}
    id::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}
    senderFault::Union{Bool, Void}

    DeleteMessageBatchResultErrorEntryType(; code=nothing, id=nothing, message=nothing, senderFault=nothing) =
        new(code, id, message, senderFault)
end

function DeleteMessageBatchResultErrorEntryType(pd::LightXML.XMLElement)
    o = DeleteMessageBatchResultErrorEntryType()
    o.code = LightXML.content(LightXML.find_element(pd, "Code"))
    o.id = LightXML.content(LightXML.find_element(pd, "Id"))
    o.message = LightXML.content(LightXML.find_element(pd, "Message"))
    o.senderFault = LightXML.content(LightXML.find_element(pd, "SenderFault"))
end

export DeleteMessageBatchResultErrorEntryType

type DeleteMessageBatchResultEntryType
    deleteMessageBatchResultEntrySet::Union{Vector{DeleteMessageBatchResultEntryType}, Void}
    queueUrl::Union{ASCIIString, Void}

    DeleteMessageBatchResultEntryType(; deleteMessageBatchResultEntrySet=nothing, queueUrl=nothing) =
         new(deleteMessageBatchResultEntrySet, queueUrl)
end

function DeleteMessageBatchResultEntryType(pd::LightXML.XMLElement)
	o = DeleteMessageBatchResultEntryType()
	o.deleteMessageBatchResultSet = AWS.@parse_vector(AWS.SQS.DeleteMessageBatchResultEntryType, LightXML.get_elements_by_tagname(pd, "DeleteMessageBatchResultEntry"))
    o.queueUrl = LightXML.content(LightXML.find_element(pd, "QueueUrl"))
end

export DeleteMessageBatchResultEntryType

type DeleteMessageBatchResponseType
    deleteMessageBatchResultSet::Union{Vector{DeleteMessageBatchResultEntryType}, Void}
    deleteMessageBatchErrorSet::Union{Vector{DeleteMessageBatchResultErrorEntryType}, Void}

	DeleteMessageBatchResponseType(; deleteMessageBatchResultSet=nothing, deleteMessageBatchErrorSet=nothing) = 
		new(deleteMessageBatchResultSet, deleteMessageBatchErrorSet)
end

function DeleteMessageBatchResponseType(pd::LightXML.XMLElement)
	o = DeleteMessageBatchResponseType()
    o.deleteMessageBatchResultSet = AWS.@parse_vector(AWS.SQS.DeleteMessageBatchResultEntryType, LightXML.get_elements_by_tagname(pd, "DeleteMessageBatchResultEntry"))
    o.deleteMessageBatchErrorSet = AWS.@parse_vector(AWS.SQS.DeleteMessageBatchResultErrorEntryType, LightXML.get_elements_by_tagname(pd, "DeleteMessageBatchResultErrorEntry"))
end

export DeleteMessageBatchResponseType

type ChangeMessageVisibilityType
    queueUrl::Union{ASCIIString, Void}
    receiptHandle::Union{ASCIIString, Void}
    visibilityTimeout::Union{Int64, Void}

    ChangeMessageVisibilityType(; queueUrl=nothing, receiptHandle=nothing, visibilityTimeout=nothing) =
         new(queueUrl, receiptHandle, visibilityTimeout)
end

export ChangeMessageVisibilityType

type ChangeMessageVisibilityResponseType
    requestId::Union{ASCIIString, Void}

    ChangeMessageVisibilityResponseType(; requestId=nothing) =
         new(requestId)
end
function ChangeMessageVisibilityResponseType(pd::LightXML.XMLElement)
    o = ChangeMessageVisibilityResponseType()
    o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o
end

export ChangeMessageVisibilityResponseType

type ChangeMessageVisibilityBatchRequestEntryType
    id::Union{ASCIIString, Void}
    receiptHandle::Union{ASCIIString, Void}
    visibilityTimeout::Union{Int64, Void}

    ChangeMessageVisibilityBatchRequestEntryType(; id=nothing, receiptHandle=nothing, visibilityTimeout=nothing) =
         new(id, receiptHandle, visibilityTimeout)
end

export ChangeMessageVisibilityBatchRequestEntryType


type ChangeMessageVisibilityBatchType
    queueUrl::Union{ASCIIString, Void}
	changeMessageVisibilityBatchRequestEntrySet::Union{Vector{ChangeMessageVisibilityBatchRequestEntryType}, Void}

    ChangeMessageVisibilityBatchType(; queueUrl=nothing, changeMessageVisibilityBatchRequestEntrySet=nothing) =
         new(queueUrl, changeMessageVisibilityBatchRequestEntrySet)
end

export ChangeMessageVisibilityBatchType

type ChangeMessageVisibilityBatchResultEntryType
	id::Union{Int64, Void}

	ChangeMessageVisibilityBatchResultEntryType(; id=nothing) = 
		new(id)
end

function ChangeMessageVisibilityBatchResultEntryType(pd::LightXML.XMLElement)
    o = ChangeMessageVisibilityBatchResultEntryType()
    o.id = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "Id")))
    o
end

export ChangeMessageVisibilityBatchResultEntryType

type ChangeMessageVisibilityBatchResultErrorEntryType
    code::Union{ASCIIString, Void}
    id::Union{ASCIIString, Void}
    message::Union{ASCIIString, Void}
    senderFault::Union{Bool, Void}

    ChangeMessageVisibilityBatchResultErrorEntryType(; code=nothing, id=nothing, message=nothing, senderFault=nothing) =
        new(code, id, message, senderFault)
end

function ChangeMessageVisibilityBatchResultErrorEntryType(pd::LightXML.XMLElement)
    o = ChangeMessageVisibilityBatchResultErrorEntryType()
    o.code = LightXML.content(LightXML.find_element(pd, "Code"))
    o.id = LightXML.content(LightXML.find_element(pd, "Id"))
    o.message = LightXML.content(LightXML.find_element(pd, "Message"))
    o.senderFault = LightXML.content(LightXML.find_element(pd, "SenderFault"))
end

export ChangeMessageVisibilityBatchResultErrorEntryType


type ChangeMessageVisibilityResponseBatchType
	changeMessageVisibilityBatchResultEntrySet::Union{Vector{ChangeMessageVisibilityBatchResultEntryType}, Void}
	changeMessageVisibilityBatchResultErrorEntrySet::Union{Vector{ChangeMessageVisibilityBatchResultErrorEntryType}, Void}

    ChangeMessageVisibilityResponseBatchType(; changeMessageVisibilityBatchResultEntrySet=nothing, changeMessageVisibilityBatchResultErrorEntrySet=nothing) =
         new(changeMessageVisibilityBatchResultEntrySet, changeMessageVisibilityBatchResultErrorEntrySet)
end

function ChangeMessageVisibilityResponseBatchType(pd::LightXML.XMLElement)
    o = ChangeMessageVisibilityResponseBatchType()
    o.changeMessageVisibilityBatchResultEntrySet = AWS.@parse_vector(AWS.SQS.ChangeMessageVisibilityBatchResultEntryType, LightXML.get_elements_by_tagname(pd, "ChangeMessageVisibilityBatchResultEntry"))
    o.changeMessageVisibilityBatchResultErrorEntrySet = AWS.@parse_vector(AWS.SQS.ChangeMessageVisibilityBatchResultErrorEntryType, LightXML.get_elements_by_tagname(pd, "ChangeMessageVisibilityBatchResultErrorEntry"))
    o
end

export ChangeMessageVisibilityResponseBatchType

type ListDeadLetterSourceQueuesType
	queueUrl::Union{ASCIIString, Void}

	ListDeadLetterSourceQueuesType(; queueUrl=nothing) = 
		new(queueUrl)
end

export ListDeadLetterSourceQueuesType

type ListDeadLetterSourceQueuesResultType
	queueUrls::Union{Vector{ASCIIString}, Void}

	ListDeadLetterSourceQueuesResultType(; queueUrls=nothing) = 
		new(queueUrls)
end

function ListDeadLetterSourceQueuesResultType(pd::LightXML.XMLElement)
    o = ListDeadLetterSourceQueuesResultType()
    o.queueUrlSet = ASCIIString[LightXML.content(url) for url in LightXML.get_elements_by_tagname(LightXML.find_element(pd, "ListDeadLetterSourceQueuesResult"), "QueueUrl")]
end

export ListDeadLetterSourceQueuesResultType

type ListDeadLetterSourceQueuesResponseType
	requestId::Union{ASCIIString, Void}
	listDeadLetterSourceQueuesResultType::Union{ListDeadLetterSourceQueuesResultType, Void}

	ListDeadLetterSourceQueuesResponseType(; requestId=nothing, listDeadLetterSourceQueuesResultType=nothing) = 
		new(requestId, listDeadLetterSourceQueuesResultType)
end

function ListDeadLetterSourceQueuesResponseType(pd::LightXML.XMLElement)
    o = ListDeadLetterSourceQueuesResponseType()
	o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
    o.listDeadLetterSourceQueuesResultType = LightXML.find_element(LightXML.find_element(pd, "ListDeadLetterSourceQueuesResult"), "QueueUrl") != nothing ? ListDeadLetterSourceQueuesResultType(LightXML.find_element(LightXML.find_element(pd, "ListDeadLetterSourceQueuesResult"), "QueueUrl")) : nothing
end

export ListDeadLetterSourceQueuesResponseType


type PurgeQueueType
	queueUrl::Union{ASCIIString, Void}

	PurgeQueueType(; queueUrl=nothing) =
		new(queueUrl)
end

export PurgeQueueType

type PurgeQueueResponseType
	requestId::Union{ASCIIString, Void}

	PurgeQueueResponseType(; requestId=nothing) = 
		new(requestId)
end

function PurgeQueueResponseType(pd::LightXML.XMLElement)
    o = PurgeQueueResponseType()
	o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
end

export PurgeQueueResponseType


#=
type ActionAccountType
	aWSAccountId::Union{ASCIIString, Void}
	actionName::Union{ASCIIString, Void}

	ActionAccountType(; aWSAccountId=nothing, actionName=nothing) = 
		new(aWSAccountId, actionName)
end

export ActionAccountType
=#

type AddPermissionType
	queueUrl::Union{ASCIIString, Void}
	label::Union{ASCIIString, Void}
	aWSAccountIdSet::Union{Vector{ASCIIString}, Void}
	actionNameSet::Union{Vector{ASCIIString}, Void}
	## actionAccountSet::Union{Vector{ActionAccountType}, Void}

	AddPermissionType(; queueUrl=nothing, label=nothing, aWSAccountIdSet=nothing, actionNameSet=nothing) = 
		new(queueUrl, label, aWSAccountIdSet, actionNameSet)
end

export AddPermissionType

type AddPermissionResponseType
	requestId::Union{ASCIIString, Void}

	AddPermissionResponseType(; requestId=nothing) = 
		new(requestId)
end

function AddPermissionResponseType(pd::LightXML.XMLElement)
    o = AddPermissionResponseType()

	o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
end

export AddPermissionResponseType

type RemovePermissionType
	queueUrl::Union{ASCIIString, Void}
	label::Union{ASCIIString, Void}

	RemovePermissionType(; queueUrl=nothing, label=nothing) = 
		new(queueUrl, label)
end

export RemovePermissionType

type RemovePermissionResponseType
	requestId::Union{ASCIIString, Void}

	RemovePermissionResponseType(; requestId=nothing) = 
		new(requestId)
end

function RemovePermissionResponseType(pd::LightXML.XMLElement)
    o = RemovePermissionResponseType()

	o.requestId = LightXML.content(LightXML.find_element(LightXML.find_element(pd, "ResponseMetadata"), "RequestId"))
end

export RemovePermissionResponseType

