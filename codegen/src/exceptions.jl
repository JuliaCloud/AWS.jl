struct ProtocolNotDefined <: Exception
    message::String
end
Base.show(io::IO, e::ProtocolNotDefined) = println(io, e.message)

struct InvalidFileName <: Exception
    message::String
end
Base.show(io::IO, e::InvalidFileName) = println(io, e.message)
