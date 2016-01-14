function CreateQueue(env::AWSEnv, msg::CreateQueueType)
    sqsresp::SQSResponse = call_sqs(env, "CreateQueue" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = CreateQueueResponseType(sqsresp.pd)
    end
    sqsresp
end
function CreateQueue(env::AWSEnv; kwargs...)
    msg=CreateQueueType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    CreateQueue(env, msg)
end
export CreateQueue


function DeleteQueue(env::AWSEnv, msg::DeleteQueueType)
    sqsresp::SQSResponse = call_sqs(env, "DeleteQueue" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = DeleteQueueResponseType(sqsresp.pd)
    end
    sqsresp
end
function DeleteQueue(env::AWSEnv; kwargs...)
    msg=DeleteQueueType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteQueue(env, msg)
end
export DeleteQueue


function GetQueueAttributes(env::AWSEnv, msg::GetQueueAttributesType)
    sqsresp::SQSResponse = call_sqs(env, "GetQueueAttributes" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = GetQueueAttributesResponseType(sqsresp.pd)
    end
    sqsresp
end
function GetQueueAttributes(env::AWSEnv; kwargs...)
    msg=GetQueueAttributesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    GetQueueAttributes(env, msg)
end
export GetQueueAttributes


function GetQueueUrl(env::AWSEnv, msg::GetQueueUrlType)
    sqsresp::SQSResponse = call_sqs(env, "GetQueueUrl" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = GetQueueUrlResponseType(sqsresp.pd)
    end
    sqsresp
end
function GetQueueUrl(env::AWSEnv; kwargs...)
    msg=GetQueueUrlType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    GetQueueUrl(env, msg)
end
export GetQueueUrl


function ListQueues(env::AWSEnv, msg::ListQueuesType)
    sqsresp::SQSResponse = call_sqs(env, "ListQueues" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = ListQueuesResponseType(sqsresp.pd)
    end
    sqsresp
end
function ListQueues(env::AWSEnv; kwargs...)
    msg=ListQueuesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ListQueues(env, msg)
end
export ListQueues


function ReceiveMessage(env::AWSEnv, msg::ReceiveMessageType)
    sqsresp::SQSResponse = call_sqs(env, "ReceiveMessage" , msg, false)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = ReceiveMessageResponseType(sqsresp.pd)
    end
    sqsresp
end
function ReceiveMessage(env::AWSEnv; kwargs...)
    msg=ReceiveMessageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ReceiveMessage(env, msg)
end
export ReceiveMessage


function SendMessage(env::AWSEnv, msg::SendMessageType)
    sqsresp::SQSResponse = call_sqs(env, "SendMessage" , msg, false)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = SendMessageResponseType(sqsresp.pd)
    end
    sqsresp
end
function SendMessage(env::AWSEnv; kwargs...)
    msg=SendMessageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    SendMessage(env, msg)
end
export SendMessage


function SetQueueAttributes(env::AWSEnv, msg::SetQueueAttributesType)
    sqsresp::SQSResponse = call_sqs(env, "SetQueueAttributes" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = SetQueueAttributesResponseType(sqsresp.pd)
    end
    sqsresp
end
function SetQueueAttributes(env::AWSEnv; kwargs...)
    msg=SetQueueAttributesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    SetQueueAttributes(env, msg)
end
export SetQueueAttributes


function DeleteMessage(env::AWSEnv, msg::DeleteMessageType)
    sqsresp::SQSResponse = call_sqs(env, "DeleteMessage" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = DeleteMessageResponseType(sqsresp.pd)
    end
    sqsresp
end
function DeleteMessage(env::AWSEnv; kwargs...)
    msg=DeleteMessageType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteMessage(env, msg)
end
export DeleteMessage

#=
ChangeMessageVisibility
ChangeMessageVisibilityBatch
ListDeadLetterSourceQueues
PurgeQueue
AddPermission
RemovePermission
=#

function SendMessageBatch(env::AWSEnv, msg::SendMessageBatchType)
    sqsresp::SQSResponse = call_sqs(env, "SendMessageBatch" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = SendMessageBatchResponseType(sqsresp.pd)
    end
    sqsresp
end
function SendMessageBatch(env::AWSEnv; kwargs...)
    msg=SendMessageBatchType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    SendMessageBatch(env, msg)
end
export SendMessageBatch


function DeleteMessageBatch(env::AWSEnv, msg::DeleteMessageBatchType)
    sqsresp::SQSResponse = call_sqs(env, "DeleteMessageBatch" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = DeleteMessageBatchResponseType(sqsresp.pd)
    end
    sqsresp
end
function DeleteMessageBatch(env::AWSEnv; kwargs...)
    msg=DeleteMessageBatchType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    DeleteMessageBatch(env, msg)
end
export DeleteMessageBatch


function ChangeMessageVisibility(env::AWSEnv, msg::ChangeMessageVisibilityType)
    sqsresp::SQSResponse = call_sqs(env, "ChangeMessageVisibility" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = ChangeMessageVisibilityResponseType(sqsresp.pd)
    end
    sqsresp
end
function ChangeMessageVisibility(env::AWSEnv; kwargs...)
    msg=ChangeMessageVisibilityType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ChangeMessageVisibility(env, msg)
end
export ChangeMessageVisibility

function ChangeMessageVisibilityBatch(env::AWSEnv, msg::ChangeMessageVisibilityBatchType)
    sqsresp::SQSResponse = call_sqs(env, "ChangeMessageVisibilityBatch" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = ChangeMessageVisibilityResponseBatchType(sqsresp.pd)
    end
    sqsresp
end
function ChangeMessageVisibilityBatch(env::AWSEnv; kwargs...)
    msg=ChangeMessageVisibilityBatchType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ChangeMessageVisibilityBatch(env, msg)
end
export ChangeMessageVisibilityBatch

function ListDeadLetterSourceQueues(env::AWSEnv, msg::ListDeadLetterSourceQueuesType)
    sqsresp::SQSResponse = call_sqs(env, "ListDeadLetterSourceQueues" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = ListDeadLetterSourceQueuesResponseType(sqsresp.pd)
    end
    sqsresp
end
function ListDeadLetterSourceQueues(env::AWSEnv; kwargs...)
    msg=ListDeadLetterSourceQueuesType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    ListDeadLetterSourceQueues(env, msg)
end
export ListDeadLetterSourceQueues

function PurgeQueue(env::AWSEnv, msg::PurgeQueueType)
    sqsresp::SQSResponse = call_sqs(env, "PurgeQueue" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = PurgeQueueResponseType(sqsresp.pd)
    end
    sqsresp
end
function PurgeQueue(env::AWSEnv; kwargs...)
    msg=PurgeQueueType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    PurgeQueue(env, msg)
end
export PurgeQueue

function AddPermission(env::AWSEnv, msg::AddPermissionType)
    sqsresp::SQSResponse = call_sqs(env, "AddPermission" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = AddPermissionResponseType(sqsresp.pd)
    end
    sqsresp
end
function AddPermission(env::AWSEnv; kwargs...)
    msg=AddPermissionType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    AddPermission(env, msg)
end
export AddPermission

function RemovePermission(env::AWSEnv, msg::RemovePermissionType)
    sqsresp::SQSResponse = call_sqs(env, "RemovePermission" , msg)
    if  (sqsresp.pd != nothing) && (sqsresp.obj == nothing)
        sqsresp.obj = RemovePermissionResponseType(sqsresp.pd)
    end
    sqsresp
end
function RemovePermission(env::AWSEnv; kwargs...)
    msg=RemovePermissionType()
    for p in kwargs
        setfield!(msg, p[1], p[2])
    end
    RemovePermission(env, msg)
end
export RemovePermission


ValidRqstMsgs = Dict(
    "CreateQueueType"=>true,
    "GetQueueUrlType"=>true,
    "ListQueuesType"=>true,
    "DeleteQueueType"=>true,
    "DeleteMessageType"=>true,
    "GetQueueAttributesType"=>true,
    "ReceiveMessageType"=>true,
    "SendMessageType"=>true,
    "SetQueueAttributesType"=>true,
    "SendMessageBatchType"=>true,
    "DeleteMessageBatchType"=>true,
    "ChangeMessageVisibilityType"=>true,
    "ChangeMessageVisibilityBatchType"=>true,
    "ListDeadLetterSourceQueuesType"=>true,
    "PurgeQueueType"=>true,
    "AddPermissionType"=>true,
    "RemovePermissionType"=>true
)
