# generated from SQSTypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

mutable struct BatchResultErrorEntry <: AbstractAWSType
    code::Union{Void,String}
    id::Union{Void,String}
    message::Union{Void,String}
    senderFault::Union{Void,Bool}
    function BatchResultErrorEntry(;code=nothing, id=nothing, message=nothing, senderFault=nothing)
        new(code, id, message, senderFault)
    end
    BatchResultErrorEntry(pd) = parse_from_xml(BatchResultErrorEntry, SQSTypeDict, pd)
end # BatchResultErrorEntry
export BatchResultErrorEntry

mutable struct ChangeMessageVisibilityBatchRequestEntry <: AbstractAWSType
    id::Union{Void,String}
    receiptHandle::Union{Void,String}
    visibilityTimeout::Union{Void,Int64}
    function ChangeMessageVisibilityBatchRequestEntry(;id=nothing, receiptHandle=nothing, visibilityTimeout=nothing)
        new(id, receiptHandle, visibilityTimeout)
    end
    ChangeMessageVisibilityBatchRequestEntry(pd) = parse_from_xml(ChangeMessageVisibilityBatchRequestEntry, SQSTypeDict, pd)
end # ChangeMessageVisibilityBatchRequestEntry
export ChangeMessageVisibilityBatchRequestEntry

mutable struct ChangeMessageVisibilityBatchResultEntry <: AbstractAWSType
    id::Union{Void,String}
    function ChangeMessageVisibilityBatchResultEntry(;id=nothing)
        new(id)
    end
    ChangeMessageVisibilityBatchResultEntry(pd) = parse_from_xml(ChangeMessageVisibilityBatchResultEntry, SQSTypeDict, pd)
end # ChangeMessageVisibilityBatchResultEntry
export ChangeMessageVisibilityBatchResultEntry

mutable struct DeleteMessageBatchRequestEntry <: AbstractAWSType
    id::Union{Void,String}
    receiptHandle::Union{Void,String}
    function DeleteMessageBatchRequestEntry(;id=nothing, receiptHandle=nothing)
        new(id, receiptHandle)
    end
    DeleteMessageBatchRequestEntry(pd) = parse_from_xml(DeleteMessageBatchRequestEntry, SQSTypeDict, pd)
end # DeleteMessageBatchRequestEntry
export DeleteMessageBatchRequestEntry

mutable struct DeleteMessageBatchResultEntry <: AbstractAWSType
    id::Union{Void,String}
    function DeleteMessageBatchResultEntry(;id=nothing)
        new(id)
    end
    DeleteMessageBatchResultEntry(pd) = parse_from_xml(DeleteMessageBatchResultEntry, SQSTypeDict, pd)
end # DeleteMessageBatchResultEntry
export DeleteMessageBatchResultEntry

mutable struct Message <: AbstractAWSType
    attribute::Union{Void,Dict{String,String}}
    body::Union{Void,String}
    mD5OfBody::Union{Void,String}
    mD5OfMessageAttributes::Union{Void,String}
    messageAttribute::Union{Void,Dict{String,String}}
    messageId::Union{Void,String}
    receiptHandle::Union{Void,String}
    function Message(;attribute=nothing, body=nothing, mD5OfBody=nothing, mD5OfMessageAttributes=nothing, messageAttribute=nothing, messageId=nothing, receiptHandle=nothing)
        new(attribute, body, mD5OfBody, mD5OfMessageAttributes, messageAttribute, messageId, receiptHandle)
    end
    Message(pd) = parse_from_xml(Message, SQSTypeDict, pd)
end # Message
export Message

mutable struct MessageAttributeValue <: AbstractAWSType
    binaryListValue::Union{Void,Array{Array{UInt8,1},1}}
    binaryValue::Union{Void,Array{UInt8,1}}
    dataType::Union{Void,String}
    stringListValue::Union{Void,Array{String,1}}
    stringValue::Union{Void,String}
    function MessageAttributeValue(;binaryListValue=nothing, binaryValue=nothing, dataType=nothing, stringListValue=nothing, stringValue=nothing)
        new(binaryListValue, binaryValue, dataType, stringListValue, stringValue)
    end
    MessageAttributeValue(pd) = parse_from_xml(MessageAttributeValue, SQSTypeDict, pd)
end # MessageAttributeValue
export MessageAttributeValue

mutable struct SendMessageBatchRequestEntry <: AbstractAWSType
    delaySeconds::Union{Void,Int64}
    id::Union{Void,String}
    messageAttribute::Union{Void,Dict{String,MessageAttributeValue}}
    messageBody::Union{Void,String}
    messageDeduplicationId::Union{Void,String}
    messageGroupId::Union{Void,String}
    function SendMessageBatchRequestEntry(;delaySeconds=nothing, id=nothing, messageAttribute=nothing, messageBody=nothing, messageDeduplicationId=nothing, messageGroupId=nothing)
        new(delaySeconds, id, messageAttribute, messageBody, messageDeduplicationId, messageGroupId)
    end
    SendMessageBatchRequestEntry(pd) = parse_from_xml(SendMessageBatchRequestEntry, SQSTypeDict, pd)
end # SendMessageBatchRequestEntry
export SendMessageBatchRequestEntry

mutable struct SendMessageBatchResultEntry <: AbstractAWSType
    id::Union{Void,String}
    mD5OfMessageAttributes::Union{Void,String}
    mD5OfMessageBody::Union{Void,String}
    messageId::Union{Void,String}
    sequenceNumber::Union{Void,String}
    function SendMessageBatchResultEntry(;id=nothing, mD5OfMessageAttributes=nothing, mD5OfMessageBody=nothing, messageId=nothing, sequenceNumber=nothing)
        new(id, mD5OfMessageAttributes, mD5OfMessageBody, messageId, sequenceNumber)
    end
    SendMessageBatchResultEntry(pd) = parse_from_xml(SendMessageBatchResultEntry, SQSTypeDict, pd)
end # SendMessageBatchResultEntry
export SendMessageBatchResultEntry
