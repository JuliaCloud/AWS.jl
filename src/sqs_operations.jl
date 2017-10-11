# generated from SQSTypeDict via AWS/src/codegen.jl
# do not edit, edit specification file and regenerate instead

type GetQueueUrlResult <: AbstractAWSType
    queueUrl::Union{Void,String}
    function GetQueueUrlResult(;queueUrl=nothing)
        new(queueUrl)
    end
    GetQueueUrlResult(pd) = parse_from_xml(GetQueueUrlResult, SQSTypeDict, pd)
end # GetQueueUrlResult
export GetQueueUrlResult

type GetQueueUrlRequest <: AbstractAWSType
    queueName::Union{Void,String}
    queueOwnerAWSAccountId::Union{Void,String}
    function GetQueueUrlRequest(;queueName=nothing, queueOwnerAWSAccountId=nothing)
        new(queueName, queueOwnerAWSAccountId)
    end
    GetQueueUrlRequest(pd) = parse_from_xml(GetQueueUrlRequest, SQSTypeDict, pd)
end # GetQueueUrlRequest
export GetQueueUrlRequest

function GetQueueUrl(env::AWSEnv, msg::GetQueueUrlRequest)
    resp::SQSResponse = sqs_execute(env, "GetQueueUrl", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetQueueUrlResult(resp.pd)
    end
    resp
end
GetQueueUrl(env::AWSEnv; kwargs...) = GetQueueUrl(env, GetQueueUrlRequest(; kwargs...))
export GetQueueUrl

type GetQueueAttributesResult <: AbstractAWSType
    attribute::Union{Void,Dict{String,String}}
    function GetQueueAttributesResult(;attribute=nothing)
        new(attribute)
    end
    GetQueueAttributesResult(pd) = parse_from_xml(GetQueueAttributesResult, SQSTypeDict, pd)
end # GetQueueAttributesResult
export GetQueueAttributesResult

type GetQueueAttributesRequest <: AbstractAWSType
    attributeName::Union{Void,Array{String,1}}
    queueUrl::Union{Void,String}
    function GetQueueAttributesRequest(;attributeName=nothing, queueUrl=nothing)
        new(attributeName, queueUrl)
    end
    GetQueueAttributesRequest(pd) = parse_from_xml(GetQueueAttributesRequest, SQSTypeDict, pd)
end # GetQueueAttributesRequest
export GetQueueAttributesRequest

function GetQueueAttributes(env::AWSEnv, msg::GetQueueAttributesRequest)
    resp::SQSResponse = sqs_execute(env, "GetQueueAttributes", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = GetQueueAttributesResult(resp.pd)
    end
    resp
end
GetQueueAttributes(env::AWSEnv; kwargs...) = GetQueueAttributes(env, GetQueueAttributesRequest(; kwargs...))
export GetQueueAttributes

type DeleteMessageRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    receiptHandle::Union{Void,String}
    function DeleteMessageRequest(;queueUrl=nothing, receiptHandle=nothing)
        new(queueUrl, receiptHandle)
    end
    DeleteMessageRequest(pd) = parse_from_xml(DeleteMessageRequest, SQSTypeDict, pd)
end # DeleteMessageRequest
export DeleteMessageRequest

function DeleteMessage(env::AWSEnv, msg::DeleteMessageRequest)
    resp::SQSResponse = sqs_execute(env, "DeleteMessage", msg)
    resp
end
DeleteMessage(env::AWSEnv; kwargs...) = DeleteMessage(env, DeleteMessageRequest(; kwargs...))
export DeleteMessage

type SetQueueAttributesRequest <: AbstractAWSType
    attribute::Union{Void,Dict{String,String}}
    queueUrl::Union{Void,String}
    function SetQueueAttributesRequest(;attribute=nothing, queueUrl=nothing)
        new(attribute, queueUrl)
    end
    SetQueueAttributesRequest(pd) = parse_from_xml(SetQueueAttributesRequest, SQSTypeDict, pd)
end # SetQueueAttributesRequest
export SetQueueAttributesRequest

function SetQueueAttributes(env::AWSEnv, msg::SetQueueAttributesRequest)
    resp::SQSResponse = sqs_execute(env, "SetQueueAttributes", msg)
    resp
end
SetQueueAttributes(env::AWSEnv; kwargs...) = SetQueueAttributes(env, SetQueueAttributesRequest(; kwargs...))
export SetQueueAttributes

type ChangeMessageVisibilityBatchResult <: AbstractAWSType
    batchResultErrorEntry::Union{Void,Array{BatchResultErrorEntry,1}}
    changeMessageVisibilityBatchResultEntry::Union{Void,Array{ChangeMessageVisibilityBatchResultEntry,1}}
    function ChangeMessageVisibilityBatchResult(;batchResultErrorEntry=nothing, changeMessageVisibilityBatchResultEntry=nothing)
        new(batchResultErrorEntry, changeMessageVisibilityBatchResultEntry)
    end
    ChangeMessageVisibilityBatchResult(pd) = parse_from_xml(ChangeMessageVisibilityBatchResult, SQSTypeDict, pd)
end # ChangeMessageVisibilityBatchResult
export ChangeMessageVisibilityBatchResult

type ChangeMessageVisibilityBatchRequest <: AbstractAWSType
    changeMessageVisibilityBatchRequestEntry::Union{Void,Array{ChangeMessageVisibilityBatchRequestEntry,1}}
    queueUrl::Union{Void,String}
    function ChangeMessageVisibilityBatchRequest(;changeMessageVisibilityBatchRequestEntry=nothing, queueUrl=nothing)
        new(changeMessageVisibilityBatchRequestEntry, queueUrl)
    end
    ChangeMessageVisibilityBatchRequest(pd) = parse_from_xml(ChangeMessageVisibilityBatchRequest, SQSTypeDict, pd)
end # ChangeMessageVisibilityBatchRequest
export ChangeMessageVisibilityBatchRequest

function ChangeMessageVisibilityBatch(env::AWSEnv, msg::ChangeMessageVisibilityBatchRequest)
    resp::SQSResponse = sqs_execute(env, "ChangeMessageVisibilityBatch", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ChangeMessageVisibilityBatchResult(resp.pd)
    end
    resp
end
ChangeMessageVisibilityBatch(env::AWSEnv; kwargs...) = ChangeMessageVisibilityBatch(env, ChangeMessageVisibilityBatchRequest(; kwargs...))
export ChangeMessageVisibilityBatch

type ReceiveMessageResult <: AbstractAWSType
    message::Union{Void,Array{Message,1}}
    function ReceiveMessageResult(;message=nothing)
        new(message)
    end
    ReceiveMessageResult(pd) = parse_from_xml(ReceiveMessageResult, SQSTypeDict, pd)
end # ReceiveMessageResult
export ReceiveMessageResult

type ReceiveMessageRequest <: AbstractAWSType
    attributeName::Union{Void,Array{String,1}}
    maxNumberOfMessages::Union{Void,Int64}
    messageAttributeName::Union{Void,Array{String,1}}
    queueUrl::Union{Void,String}
    receiveRequestAttemptId::Union{Void,String}
    visibilityTimeout::Union{Void,Int64}
    waitTimeSeconds::Union{Void,Int64}
    function ReceiveMessageRequest(;attributeName=nothing, maxNumberOfMessages=nothing, messageAttributeName=nothing, queueUrl=nothing, receiveRequestAttemptId=nothing, visibilityTimeout=nothing, waitTimeSeconds=nothing)
        new(attributeName, maxNumberOfMessages, messageAttributeName, queueUrl, receiveRequestAttemptId, visibilityTimeout, waitTimeSeconds)
    end
    ReceiveMessageRequest(pd) = parse_from_xml(ReceiveMessageRequest, SQSTypeDict, pd)
end # ReceiveMessageRequest
export ReceiveMessageRequest

function ReceiveMessage(env::AWSEnv, msg::ReceiveMessageRequest)
    resp::SQSResponse = sqs_execute(env, "ReceiveMessage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ReceiveMessageResult(resp.pd)
    end
    resp
end
ReceiveMessage(env::AWSEnv; kwargs...) = ReceiveMessage(env, ReceiveMessageRequest(; kwargs...))
export ReceiveMessage

type ChangeMessageVisibilityRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    receiptHandle::Union{Void,String}
    visibilityTimeout::Union{Void,Int}
    function ChangeMessageVisibilityRequest(;queueUrl=nothing, receiptHandle=nothing, visibilityTimeout=nothing)
        new(queueUrl, receiptHandle, visibilityTimeout)
    end
    ChangeMessageVisibilityRequest(pd) = parse_from_xml(ChangeMessageVisibilityRequest, SQSTypeDict, pd)
end # ChangeMessageVisibilityRequest
export ChangeMessageVisibilityRequest

function ChangeMessageVisibility(env::AWSEnv, msg::ChangeMessageVisibilityRequest)
    resp::SQSResponse = sqs_execute(env, "ChangeMessageVisibility", msg)
    resp
end
ChangeMessageVisibility(env::AWSEnv; kwargs...) = ChangeMessageVisibility(env, ChangeMessageVisibilityRequest(; kwargs...))
export ChangeMessageVisibility

type DeleteQueueRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    function DeleteQueueRequest(;queueUrl=nothing)
        new(queueUrl)
    end
    DeleteQueueRequest(pd) = parse_from_xml(DeleteQueueRequest, SQSTypeDict, pd)
end # DeleteQueueRequest
export DeleteQueueRequest

function DeleteQueue(env::AWSEnv, msg::DeleteQueueRequest)
    resp::SQSResponse = sqs_execute(env, "DeleteQueue", msg)
    resp
end
DeleteQueue(env::AWSEnv; kwargs...) = DeleteQueue(env, DeleteQueueRequest(; kwargs...))
export DeleteQueue

type RemovePermissionRequest <: AbstractAWSType
    label::Union{Void,String}
    queueUrl::Union{Void,String}
    function RemovePermissionRequest(;label=nothing, queueUrl=nothing)
        new(label, queueUrl)
    end
    RemovePermissionRequest(pd) = parse_from_xml(RemovePermissionRequest, SQSTypeDict, pd)
end # RemovePermissionRequest
export RemovePermissionRequest

function RemovePermission(env::AWSEnv, msg::RemovePermissionRequest)
    resp::SQSResponse = sqs_execute(env, "RemovePermission", msg)
    resp
end
RemovePermission(env::AWSEnv; kwargs...) = RemovePermission(env, RemovePermissionRequest(; kwargs...))
export RemovePermission

type AddPermissionRequest <: AbstractAWSType
    actionName::Union{Void,Array{String,1}}
    aWSAccountId::Union{Void,Array{String,1}}
    label::Union{Void,String}
    queueUrl::Union{Void,String}
    function AddPermissionRequest(;actionName=nothing, aWSAccountId=nothing, label=nothing, queueUrl=nothing)
        new(actionName, aWSAccountId, label, queueUrl)
    end
    AddPermissionRequest(pd) = parse_from_xml(AddPermissionRequest, SQSTypeDict, pd)
end # AddPermissionRequest
export AddPermissionRequest

function AddPermission(env::AWSEnv, msg::AddPermissionRequest)
    resp::SQSResponse = sqs_execute(env, "AddPermission", msg)
    resp
end
AddPermission(env::AWSEnv; kwargs...) = AddPermission(env, AddPermissionRequest(; kwargs...))
export AddPermission

type ListQueuesResult <: AbstractAWSType
    queueUrl::Union{Void,Array{String,1}}
    function ListQueuesResult(;queueUrl=nothing)
        new(queueUrl)
    end
    ListQueuesResult(pd) = parse_from_xml(ListQueuesResult, SQSTypeDict, pd)
end # ListQueuesResult
export ListQueuesResult

type ListQueuesRequest <: AbstractAWSType
    queueNamePrefix::Union{Void,String}
    function ListQueuesRequest(;queueNamePrefix=nothing)
        new(queueNamePrefix)
    end
    ListQueuesRequest(pd) = parse_from_xml(ListQueuesRequest, SQSTypeDict, pd)
end # ListQueuesRequest
export ListQueuesRequest

function ListQueues(env::AWSEnv, msg::ListQueuesRequest)
    resp::SQSResponse = sqs_execute(env, "ListQueues", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ListQueuesResult(resp.pd)
    end
    resp
end
ListQueues(env::AWSEnv; kwargs...) = ListQueues(env, ListQueuesRequest(; kwargs...))
export ListQueues

type CreateQueueResult <: AbstractAWSType
    queueUrl::Union{Void,String}
    function CreateQueueResult(;queueUrl=nothing)
        new(queueUrl)
    end
    CreateQueueResult(pd) = parse_from_xml(CreateQueueResult, SQSTypeDict, pd)
end # CreateQueueResult
export CreateQueueResult

type CreateQueueRequest <: AbstractAWSType
    attribute::Union{Void,Dict{String,String}}
    queueName::Union{Void,String}
    function CreateQueueRequest(;attribute=nothing, queueName=nothing)
        new(attribute, queueName)
    end
    CreateQueueRequest(pd) = parse_from_xml(CreateQueueRequest, SQSTypeDict, pd)
end # CreateQueueRequest
export CreateQueueRequest

function CreateQueue(env::AWSEnv, msg::CreateQueueRequest)
    resp::SQSResponse = sqs_execute(env, "CreateQueue", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = CreateQueueResult(resp.pd)
    end
    resp
end
CreateQueue(env::AWSEnv; kwargs...) = CreateQueue(env, CreateQueueRequest(; kwargs...))
export CreateQueue

type SendMessageBatchResult <: AbstractAWSType
    batchResultErrorEntry::Union{Void,Array{BatchResultErrorEntry,1}}
    sendMessageBatchResultEntry::Union{Void,Array{SendMessageBatchResultEntry,1}}
    function SendMessageBatchResult(;batchResultErrorEntry=nothing, sendMessageBatchResultEntry=nothing)
        new(batchResultErrorEntry, sendMessageBatchResultEntry)
    end
    SendMessageBatchResult(pd) = parse_from_xml(SendMessageBatchResult, SQSTypeDict, pd)
end # SendMessageBatchResult
export SendMessageBatchResult

type SendMessageBatchRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    sendMessageBatchRequestEntry::Union{Void,Array{SendMessageBatchRequestEntry,1}}
    function SendMessageBatchRequest(;queueUrl=nothing, sendMessageBatchRequestEntry=nothing)
        new(queueUrl, sendMessageBatchRequestEntry)
    end
    SendMessageBatchRequest(pd) = parse_from_xml(SendMessageBatchRequest, SQSTypeDict, pd)
end # SendMessageBatchRequest
export SendMessageBatchRequest

function SendMessageBatch(env::AWSEnv, msg::SendMessageBatchRequest)
    resp::SQSResponse = sqs_execute(env, "SendMessageBatch", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = SendMessageBatchResult(resp.pd)
    end
    resp
end
SendMessageBatch(env::AWSEnv; kwargs...) = SendMessageBatch(env, SendMessageBatchRequest(; kwargs...))
export SendMessageBatch

type SendMessageResult <: AbstractAWSType
    mD5OfMessageAttributes::Union{Void,String}
    mD5OfMessageBody::Union{Void,String}
    messageId::Union{Void,String}
    sequenceNumber::Union{Void,String}
    function SendMessageResult(;mD5OfMessageAttributes=nothing, mD5OfMessageBody=nothing, messageId=nothing, sequenceNumber=nothing)
        new(mD5OfMessageAttributes, mD5OfMessageBody, messageId, sequenceNumber)
    end
    SendMessageResult(pd) = parse_from_xml(SendMessageResult, SQSTypeDict, pd)
end # SendMessageResult
export SendMessageResult

type SendMessageRequest <: AbstractAWSType
    delaySeconds::Union{Void,Int}
    messageAttribute::Union{Void,Dict{String,MessageAttributeValue}}
    messageBody::Union{Void,String}
    messageDeduplicationId::Union{Void,String}
    messageGroupId::Union{Void,String}
    queueUrl::Union{Void,String}
    function SendMessageRequest(;delaySeconds=nothing, messageAttribute=nothing, messageBody=nothing, messageDeduplicationId=nothing, messageGroupId=nothing, queueUrl=nothing)
        new(delaySeconds, messageAttribute, messageBody, messageDeduplicationId, messageGroupId, queueUrl)
    end
    SendMessageRequest(pd) = parse_from_xml(SendMessageRequest, SQSTypeDict, pd)
end # SendMessageRequest
export SendMessageRequest

function SendMessage(env::AWSEnv, msg::SendMessageRequest)
    resp::SQSResponse = sqs_execute(env, "SendMessage", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = SendMessageResult(resp.pd)
    end
    resp
end
SendMessage(env::AWSEnv; kwargs...) = SendMessage(env, SendMessageRequest(; kwargs...))
export SendMessage

type DeleteMessageBatchResult <: AbstractAWSType
    batchResultErrorEntry::Union{Void,Array{BatchResultErrorEntry,1}}
    deleteMessageBatchResultEntry::Union{Void,Array{DeleteMessageBatchResultEntry,1}}
    function DeleteMessageBatchResult(;batchResultErrorEntry=nothing, deleteMessageBatchResultEntry=nothing)
        new(batchResultErrorEntry, deleteMessageBatchResultEntry)
    end
    DeleteMessageBatchResult(pd) = parse_from_xml(DeleteMessageBatchResult, SQSTypeDict, pd)
end # DeleteMessageBatchResult
export DeleteMessageBatchResult

type DeleteMessageBatchRequest <: AbstractAWSType
    deleteMessageBatchRequestEntry::Union{Void,Array{DeleteMessageBatchRequestEntry,1}}
    queueUrl::Union{Void,String}
    function DeleteMessageBatchRequest(;deleteMessageBatchRequestEntry=nothing, queueUrl=nothing)
        new(deleteMessageBatchRequestEntry, queueUrl)
    end
    DeleteMessageBatchRequest(pd) = parse_from_xml(DeleteMessageBatchRequest, SQSTypeDict, pd)
end # DeleteMessageBatchRequest
export DeleteMessageBatchRequest

function DeleteMessageBatch(env::AWSEnv, msg::DeleteMessageBatchRequest)
    resp::SQSResponse = sqs_execute(env, "DeleteMessageBatch", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = DeleteMessageBatchResult(resp.pd)
    end
    resp
end
DeleteMessageBatch(env::AWSEnv; kwargs...) = DeleteMessageBatch(env, DeleteMessageBatchRequest(; kwargs...))
export DeleteMessageBatch

type PurgeQueueRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    function PurgeQueueRequest(;queueUrl=nothing)
        new(queueUrl)
    end
    PurgeQueueRequest(pd) = parse_from_xml(PurgeQueueRequest, SQSTypeDict, pd)
end # PurgeQueueRequest
export PurgeQueueRequest

function PurgeQueue(env::AWSEnv, msg::PurgeQueueRequest)
    resp::SQSResponse = sqs_execute(env, "PurgeQueue", msg)
    resp
end
PurgeQueue(env::AWSEnv; kwargs...) = PurgeQueue(env, PurgeQueueRequest(; kwargs...))
export PurgeQueue

type ListDeadLetterSourceQueuesResult <: AbstractAWSType
    queueUrl::Union{Void,Array{String,1}}
    function ListDeadLetterSourceQueuesResult(;queueUrl=nothing)
        new(queueUrl)
    end
    ListDeadLetterSourceQueuesResult(pd) = parse_from_xml(ListDeadLetterSourceQueuesResult, SQSTypeDict, pd)
end # ListDeadLetterSourceQueuesResult
export ListDeadLetterSourceQueuesResult

type ListDeadLetterSourceQueuesRequest <: AbstractAWSType
    queueUrl::Union{Void,String}
    function ListDeadLetterSourceQueuesRequest(;queueUrl=nothing)
        new(queueUrl)
    end
    ListDeadLetterSourceQueuesRequest(pd) = parse_from_xml(ListDeadLetterSourceQueuesRequest, SQSTypeDict, pd)
end # ListDeadLetterSourceQueuesRequest
export ListDeadLetterSourceQueuesRequest

function ListDeadLetterSourceQueues(env::AWSEnv, msg::ListDeadLetterSourceQueuesRequest)
    resp::SQSResponse = sqs_execute(env, "ListDeadLetterSourceQueues", msg)
    if (resp.pd !== nothing) && (resp.obj === nothing)
        resp.obj = ListDeadLetterSourceQueuesResult(resp.pd)
    end
    resp
end
ListDeadLetterSourceQueues(env::AWSEnv; kwargs...) = ListDeadLetterSourceQueues(env, ListDeadLetterSourceQueuesRequest(; kwargs...))
export ListDeadLetterSourceQueues
