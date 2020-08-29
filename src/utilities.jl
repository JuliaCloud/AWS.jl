# This file contains functions used in the high level service definitions

_merge(a::AbstractDict, b::AbstractDict) = merge(a, b)
_merge(a::AbstractString, b::AbstractString) = b
Base.merge(_merge, a::AbstractString, b::AbstractString) = _merge(a, b)
