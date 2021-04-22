const RR_DEPWARN = "Request.return_raw will be removed in AWS@2, use set_return_raw() instead."
const RR = :return_raw


Base.@kwdef mutable struct Request
    service::String
    api_version::String
    request_method::String

    headers::AbstractDict{String, String}=LittleDict{String, String}()
    content::Union{String, Vector{UInt8}}=""
    resource::String=""
    url::String=""

    return_stream::Bool=false
    response_stream::Union{<:IO, Nothing}=nothing
    http_options::Array{String}=[]
    return_raw::Bool=false
    response_dict_type::Type{<:AbstractDict}=LittleDict
end


function Base.getproperty(r::Request, sym::Symbol)
    if sym == RR
        @warn RR_DEPWARN
    end

    return getfield(r, sym)
end

function Base.setproperty!(r::Request, sym::Symbol, v)
    if sym == RR
        @warn RR_DEPWARN
    end

    return setfield!(r, sym, v)
end
