module Cryptography

using OpenSSL_jll: libcrypto

const _OPENSSL_LIB_CTX = Ref{Ptr{Cvoid}}(C_NULL)  # OSSL_LIB_CTX
const _OPENSSL_EVP_HMAC = Ref{Ptr{Cvoid}}(C_NULL)  # EVP_MAC

function _terminate()
    if _OPENSSL_EVP_HMAC[] !== C_NULL
        ccall((:EVP_MAC_free, libcrypto), Cvoid, (Ptr{Cvoid},), _OPENSSL_EVP_HMAC[])
        _OPENSSL_EVP_HMAC[] = C_NULL
    end

    if _OPENSSL_LIB_CTX[] !== C_NULL
        ccall((:OSSL_LIB_CTX_free, libcrypto), Cvoid, (Ptr{Cvoid},), _OPENSSL_LIB_CTX[])
        _OPENSSL_LIB_CTX[] = C_NULL
    end
end

function __init__()
    _OPENSSL_LIB_CTX[] = ccall((:OSSL_LIB_CTX_new, libcrypto), Ptr{Cvoid}, ())
    _OPENSSL_LIB_CTX[] === C_NULL && error("OSSL_LIB_CTX_new failed during module init")

    try
        _OPENSSL_EVP_HMAC[] = ccall(
            (:EVP_MAC_fetch, libcrypto), Ptr{Cvoid}, (Ptr{Cvoid}, Cstring, Cstring),
            _OPENSSL_LIB_CTX[], "HMAC", C_NULL,
        )
        _OPENSSL_EVP_HMAC[] === C_NULL && error("EVP_MAC_fetch failed during module init")
    catch
        ccall((:OSSL_LIB_CTX_free, libcrypto), Cvoid, (Ptr{Cvoid},), _OPENSSL_LIB_CTX[])
        rethrow()
    end

    atexit(_terminate)
end

hmac_sha256(key, data) = hmac("SHA256", key, data)
hmac_md5(key, data) = hmac("MD5", key, data)

md5(data) = digest("MD5", data)
sha256(data) = digest("SHA256", data)

# https://github.com/openssl/openssl/blob/b2ed1b72fa56e71d53af213e6e5557dcce171a2c/demos/mac/hmac-sha512.c
function hmac(
    algorithm::AbstractString,
    key::AbstractVector{UInt8},
    data::AbstractVector{UInt8},
)::Vector{UInt8}
    mctx = C_NULL
    bld = C_NULL
    params = C_NULL

    try
        # Create a context for the HMAC operation
        mctx = ccall(
            (:EVP_MAC_CTX_new, libcrypto), Ptr{Cvoid}, (Ptr{Cvoid},),
            _OPENSSL_EVP_HMAC[],
        )
        mctx === C_NULL && error("EVP_MAC_CTX_new failed")

        # The underlying digest to be used
        bld = ccall((:OSSL_PARAM_BLD_new, libcrypto), Ptr{Cvoid}, ())
        bld === C_NULL && error("OSSL_PARAM_BLD_new failed")

        ccall((:OSSL_PARAM_BLD_push_utf8_string, libcrypto), Cint,
            (Ptr{Cvoid}, Cstring, Cstring, Csize_t),
            bld, "digest", algorithm, 0,
        )

        params = ccall((:OSSL_PARAM_BLD_to_param, libcrypto), Ptr{Cvoid}, (Ptr{Cvoid},), bld)
        params === C_NULL && error("OSSL_PARAM_BLD_to_param failed")

        # Initialise the HMAC operation
        GC.@preserve key begin
            ret = ccall(
                (:EVP_MAC_init, libcrypto), Cint,
                (Ptr{Cvoid}, Ptr{UInt8}, Csize_t, Ptr{Cvoid}),
                mctx, pointer(key), length(key), params,
            )
            ret == 1 || error("EVP_MAC_init failed")
        end

        # Determine the output size now that the algorithm is initialised
        digest_len = ccall(
            (:EVP_MAC_CTX_get_mac_size, libcrypto), Csize_t, (Ptr{Cvoid},),
            mctx,
        )
        digest_len > 0 || error("EVP_MAC_CTX_get_mac_size failed")

        # Process the data to be authenticated. We can call this function multiple times.
        GC.@preserve data begin
            ret = ccall(
                (:EVP_MAC_update, libcrypto), Cint, (Ptr{Cvoid}, Ptr{UInt8}, Csize_t),
                mctx, pointer(data), length(data),
            )
            ret == 1 || error("EVP_MAC_update failed")
        end

        # Get the MAC digest
        digest = Vector{UInt8}(undef, digest_len)
        GC.@preserve digest begin
            ret = ccall(
                (:EVP_MAC_final, libcrypto), Cint,
                (Ptr{Cvoid}, Ptr{UInt8}, Ptr{Csize_t}, Csize_t),
                mctx, pointer(digest), Ref{Csize_t}(digest_len), digest_len,
            )
            ret == 1 || error("EVP_MAC_final failed")
        end

        return digest
    finally
        params !== C_NULL && ccall((:OSSL_PARAM_free, libcrypto), Cvoid, (Ptr{Cvoid},), params)
        bld !== C_NULL && ccall((:OSSL_PARAM_BLD_free, libcrypto), Cvoid, (Ptr{Cvoid},), bld)
        mctx !== C_NULL && ccall((:EVP_MAC_CTX_free, libcrypto), Cvoid, (Ptr{Cvoid},), mctx)
    end
end

function hmac(algorithm::AbstractString, key::AbstractVector{UInt8}, data::AbstractString)
    return hmac(algorithm, key, Vector{UInt8}(data))
end

function digest(algorithm::AbstractString, data::AbstractVector{UInt8})::Vector{UInt8}
    md  = C_NULL
    mctx = C_NULL

    try
        md = ccall((:EVP_MD_fetch, libcrypto), Ptr{Cvoid},
            (Ptr{Cvoid}, Cstring, Cstring),
            _OPENSSL_LIB_CTX[], algorithm, C_NULL,
        )
        md === C_NULL && error("EVP_MD_fetch failed for algorithm: $algorithm")

        digest_len = ccall((:EVP_MD_get_size, libcrypto), Cint, (Ptr{Cvoid},), md)
        digest_len > 0 || error("EVP_MD_get_size failed")

        mctx = ccall((:EVP_MD_CTX_new, libcrypto), Ptr{Cvoid}, ())
        mctx === C_NULL && error("EVP_MD_CTX_new failed")

        ret = ccall((:EVP_DigestInit_ex, libcrypto), Cint,
            (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}),
            mctx, md, C_NULL,
        )
        ret == 1 || error("EVP_DigestInit_ex failed")

        GC.@preserve data begin
            ret = ccall((:EVP_DigestUpdate, libcrypto), Cint,
                (Ptr{Cvoid}, Ptr{UInt8}, Csize_t),
                mctx, pointer(data), length(data),
            )
            ret == 1 || error("EVP_DigestUpdate failed")
        end

        digest = Vector{UInt8}(undef, digest_len)
        GC.@preserve digest begin
            ret = ccall((:EVP_DigestFinal_ex, libcrypto), Cint,
                (Ptr{Cvoid}, Ptr{UInt8}, Ptr{Cuint}),
                mctx, pointer(digest), Ref{Cuint}(digest_len),
            )
            ret == 1 || error("EVP_DigestFinal_ex failed")
        end

        return digest
    finally
        mctx !== C_NULL && ccall((:EVP_MD_CTX_free, libcrypto), Cvoid, (Ptr{Cvoid},), mctx)
        md !== C_NULL && ccall((:EVP_MD_free, libcrypto), Cvoid, (Ptr{Cvoid},), md)
    end
end

function digest(algorithm::AbstractString, data::AbstractString)
    return digest(algorithm, Vector{UInt8}(data))
end

end
