using SHA: hmac_sha1
using CodecBase: Base32Decoder, Base64Decoder, transcode

# As defined in https://datatracker.ietf.org/doc/html/rfc4226#section-5
# Using fixed number of digits (6)
function hotp(k, c)
    digits = 6
    hs = hmac_sha1(k, c)
    dbc1 = dynamic_truncation(hs)
    otp = Int32(dbc1 % 10^digits)
    return lpad(otp, digits, '0')
end

function dynamic_truncation(hmac_result::Vector{UInt8})
    offset = hmac_result[20] & 0x0f  # lower 4-bits
    return (
        UInt32(hmac_result[offset + 1] & 0x7f) << 24 |
        UInt32(hmac_result[offset + 2] & 0xff) << 16 |
        UInt32(hmac_result[offset + 3] & 0xff) << 8 |
        UInt32(hmac_result[offset + 4] & 0xff)
    )  # big-endian
end

# As defined in https://datatracker.ietf.org/doc/html/rfc6238#section-4
function totp(k::Vector{UInt8}; duration=30, offset=0)
    t = time_step_window(; duration)
    c = reinterpret(UInt8, [hton(t + offset)]) # Convert to big-endian
    return hotp(k, c)
end

totp(k::AbstractString; kwargs...) = totp(transcode(Base32Decoder(), k); kwargs...)

"""
    time_step_window(; duration=30, t=time(), t0=0) -> Int

# Keywords
- `duration::Integer`: Time step in seconds.
- `t::Number=time()`: Number of seconds since midnight UTC of January 1, 1970 (UNIX epoch).
- `t0::Number=0`: UNIX time to start counting time steps (default 0 is the UNIX epoch).
"""
time_step_window(; duration=30, t=time(), t0=0) = div(floor(Int64, t - t0), duration)
