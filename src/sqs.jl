module SQS

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS
using Compat

import AWS: AbstractAWSType, AWSError, AWSResponse, _ename, _parse_from_xml, _prep_params, aws_execute

const SQSError = AWSError
const SQSResponse = AWSResponse

parse_from_xml(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::Union{LightXML.XMLElement,Void}) where {T<:AbstractAWSType} = _parse_from_xml(T, types, pd; member_pfx="")
prep_params(obj::T) where {T<:AbstractAWSType} = _prep_params(obj; member_pfx="")

sqs_execute(env::AWSEnv, action::String, params::Vector{Tuple}=Vector{Tuple}()) = aws_execute(env, action, "sqs", SQSApiVer, params)
sqs_execute(env::AWSEnv, action::String, req::AbstractAWSType) = sqs_execute(env, action, prep_params(req))
sqs_execute(env::AWSEnv, action::String, req::Void) = sqs_execute(env, action)

include("sqs_types.jl")
include("sqs_operations.jl")
include("sqs_spec.jl")

export SQSError, SQSResponse

end # module SQS
