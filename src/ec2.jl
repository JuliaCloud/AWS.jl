module EC2

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS
using Compat

import AWS: AbstractAWSType, AWSError, AWSResponse, _ename, _parse_from_xml, _prep_params, aws_execute

const EC2Error = AWSError
const EC2Response = AWSResponse

parse_from_xml{T<:AbstractAWSType}(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::Union{LightXML.XMLElement,Void}) = _parse_from_xml(T, types, pd; member_pfx="item")
prep_params{T<:AbstractAWSType}(obj::T) = _prep_params(obj; member_pfx="")

ec2_execute(env::AWSEnv, action::String, params::Vector{Tuple}=Vector{Tuple}()) = aws_execute(env, action, "ec2", EC2ApiVer, params)
ec2_execute(env::AWSEnv, action::String, req::AbstractAWSType) = ec2_execute(env, action, prep_params(req))
ec2_execute(env::AWSEnv, action::String, req::Void) = ec2_execute(env, action)

include("ec2_types.jl")
include("ec2_operations.jl")
include("ec2_spec.jl")

export EC2Error, EC2Response

end # module EC2
