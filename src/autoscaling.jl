module Autoscale

using LightXML
using AWS.Crypto
using Requests
using AWS.AWSEnv
using AWS
using Compat

import AWS: AbstractAWSType, AWSError, AWSResponse, _ename, _parse_from_xml, _prep_params, aws_execute

const AutoScalingError = AWSError
const AutoScalingResponse = AWSResponse

parse_from_xml(::Type{T}, types::Dict{Symbol,Vector{Pair{Symbol,DataType}}}, pd::Union{LightXML.XMLElement,Void}) where {T<:AbstractAWSType} = _parse_from_xml(T, types, pd; member_pfx="member.")
prep_params(obj::T) where {T<:AbstractAWSType} = _prep_params(obj; member_pfx="member.")

autoscaling_execute(env::AWSEnv, action::String, params::Vector{Tuple}=Vector{Tuple}()) = aws_execute(env, action, "autoscaling", AutoScalingApiVer, params)
autoscaling_execute(env::AWSEnv, action::String, req::AbstractAWSType) = autoscaling_execute(env, action, prep_params(req))
autoscaling_execute(env::AWSEnv, action::String, req::Void) = autoscaling_execute(env, action)

include("autoscaling_types.jl")
include("autoscaling_operations.jl")
include("autoscaling_spec.jl")

export AutoScalingError, AutoScalingResponse

end # module Autoscale
