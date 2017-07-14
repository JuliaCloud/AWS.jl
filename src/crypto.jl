module Crypto

using MbedTLS

hmacsha256_digest(s::String, k::Union{String, Vector{UInt8}}) = digest(MD_SHA256, s, k)
export hmacsha256_digest

hmacsha1_digest(s::String, k::Union{String, Vector{UInt8}}) = digest(MD_SHA1, s, k)
export hmacsha1_digest

function md5_file(s::String)
    f = open(s)
    md = nothing
    try
        md = md5(f)
    finally
        close(f)
    end
    md
end
export md5_file

md5(s::String) = digest(MD_MD5, s)

function md5(s::IO)
    md = MD(MD_MD5)
    success = false
    try
        while !eof(s)
            b = read(s, UInt8, min(nb_available(s), 65536))    # Read in 64 K chunks....
            write(md, b)
        end
        d = finish!(md)
        success = true
        return d
    finally
        success || finish!(md)
    end
end
export md5

sha256(s::String) = digest(MD_SHA256, s)

end # Module end
