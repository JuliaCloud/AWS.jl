const SQSTypes = [
    :BatchResultErrorEntry => [
        :Code => String
        ,:Id => String
        ,:Message => String
        ,:SenderFault => Bool
    ]
    ,:ChangeMessageVisibilityBatchRequestEntry => [
        :Id => String
        ,:ReceiptHandle => String
        ,:VisibilityTimeout => Int
    ]
    ,:ChangeMessageVisibilityBatchResultEntry => [
        :Id => String
    ]
    ,:DeleteMessageBatchRequestEntry => [
        :Id => String
        ,:ReceiptHandle => String
    ]
    ,:DeleteMessageBatchResultEntry => [
        :Id => String
    ]
    ,:Message => [
        :Attribute => Dict{String,String}
        ,:Body => String
        ,:MD5OfBody => String
        ,:MD5OfMessageAttributes => String
        ,:MessageAttribute => Dict{String,String}
        ,:MessageId => String
        ,:ReceiptHandle => String
    ]
    ,:MessageAttributeValue => [
        :BinaryListValue => Vector{Vector{UInt8}}
        ,:BinaryValue => Vector{UInt8}
        ,:DataType => String
        ,:StringListValue => Vector{String}
        ,:StringValue => String
    ]
    ,:SendMessageBatchRequestEntry => [
        :DelaySeconds => Int
        ,:Id => String
        ,:MessageAttribute => Dict{String,MessageAttributeValue}
        ,:MessageBody => String
        ,:MessageDeduplicationId => String
        ,:MessageGroupId => String
    ]
    ,:SendMessageBatchResultEntry => [
        :Id => String
        ,:MD5OfMessageAttributes => String
        ,:MD5OfMessageBody => String
        ,:MessageId => String
        ,:SequenceNumber => String
    ]
]

const SQSApi = Dict(
    :ChangeMessageVisibility => Dict(
        :Request => [
            :QueueUrl => String
            ,:ReceiptHandle => String
            ,:VisibilityTimeout => Int
        ]
    )
    ,:DeleteMessage => Dict(
        :Request => [
            :QueueUrl => String
            ,:ReceiptHandle => String
        ]
    )
    ,:RemovePermission => Dict(
        :Request => [
            :Label => String
            ,:QueueUrl => String
        ]
    )
    ,:SendMessage => Dict(
        :Result => [
            :MD5OfMessageAttributes => String
            ,:MD5OfMessageBody => String
            ,:MessageId => String
            ,:SequenceNumber => String
        ]
        ,:Request => [
            :DelaySeconds => Int
            ,:MessageAttribute => Dict{String,MessageAttributeValue}
            ,:MessageBody => String
            ,:MessageDeduplicationId => String
            ,:MessageGroupId => String
            ,:QueueUrl => String
        ]
    )
    ,:CreateQueue => Dict(
        :Result => [
            :QueueUrl => String
        ]
        ,:Request => [
            :Attribute => Dict{String,String}
            ,:QueueName => String
        ]
    )
    ,:DeleteQueue => Dict(
        :Request => [
            :QueueUrl => String
        ]
    )
    ,:ReceiveMessage => Dict(
        :Result => [
            :Message => Vector{Message}
        ]
        ,:Request => [
            :AttributeName => Vector{String}
            ,:MaxNumberOfMessages => Int
            ,:MessageAttributeName => Vector{String}
            ,:QueueUrl => String
            ,:ReceiveRequestAttemptId => String
            ,:VisibilityTimeout => Int
            ,:WaitTimeSeconds => Int
        ]
    )
    ,:GetQueueAttributes => Dict(
        :Result => [
            :Attribute => Dict{String,String}
        ]
        ,:Request => [
            :AttributeName => Vector{String}
            ,:QueueUrl => String
        ]
    )
    ,:PurgeQueue => Dict(
        :Request => [
            :QueueUrl => String
        ]
    )
    ,:DeleteMessageBatch => Dict(
        :Result => [
            :BatchResultErrorEntry => Vector{BatchResultErrorEntry}
            ,:DeleteMessageBatchResultEntry => Vector{DeleteMessageBatchResultEntry}
        ]
        ,:Request => [
            :DeleteMessageBatchRequestEntry => Vector{DeleteMessageBatchRequestEntry}
            ,:QueueUrl => String
        ]
    )
    ,:SendMessageBatch => Dict(
        :Result => [
            :BatchResultErrorEntry => Vector{BatchResultErrorEntry}
            ,:SendMessageBatchResultEntry => Vector{SendMessageBatchResultEntry}
        ]
        ,:Request => [
            :QueueUrl => String
            ,:SendMessageBatchRequestEntry => Vector{SendMessageBatchRequestEntry}
        ]
    )
    ,:SetQueueAttributes => Dict(
        :Request => [
            :Attribute => Dict{String,String}
            ,:QueueUrl => String
        ]
    )
    ,:AddPermission => Dict(
        :Request => [
            :ActionName => Vector{String}
            ,:AWSAccountId => Vector{String}
            ,:Label => String
            ,:QueueUrl => String
        ]
    )
    ,:ChangeMessageVisibilityBatch => Dict(
        :Result => [
            :BatchResultErrorEntry => Vector{BatchResultErrorEntry}
            ,:ChangeMessageVisibilityBatchResultEntry => Vector{ChangeMessageVisibilityBatchResultEntry}
        ]
        ,:Request => [
            :ChangeMessageVisibilityBatchRequestEntry => Vector{ChangeMessageVisibilityBatchRequestEntry}
            ,:QueueUrl => String
        ]
    )
    ,:ListQueues => Dict(
        :Result => [
            :QueueUrl => Vector{String}
        ]
        ,:Request => [
            :QueueNamePrefix => String
        ]
    )
    ,:ListDeadLetterSourceQueues => Dict(
        :Result => [
            :QueueUrl => Vector{String}
        ]
        ,:Request => [
            :QueueUrl => String
        ]
    )
    ,:GetQueueUrl => Dict(
        :Result => [
            :QueueUrl => String
        ]
        ,:Request => [
            :QueueName => String
            ,:QueueOwnerAWSAccountId => String
        ]
    )
)

function _sqs_type_map()
    d = Dict(SQSTypes...)
    for (apiname,apispec) in SQSApi
        for (opname,optype) in apispec
            d[Symbol(string(apiname)*string(opname))] = optype
        end
    end
    d
end

const SQSTypeDict = _sqs_type_map()

const SQSApiVer = "2012-11-05"
