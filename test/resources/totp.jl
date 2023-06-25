using SHA: hmac_sha1
using CodecBase: Base32Decoder, Base64Decoder, transcode

function get_assumed_role(aws_config::AbstractAWSConfig=global_aws_config())
    r = AWSServices.sts(
        "GetCallerIdentity";
        aws_config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    result = parse(r)
    arn = result["GetCallerIdentityResult"]["Arn"]
    m = match(r":assumed-role/(?<role>[^/]+)", arn)
    if m !== nothing
        return m["role"]
    else
        error("Caller Identity ARN is not an assumed role: $arn")
    end
end

get_assumed_role(creds::AWSCredentials) = get_assumed_role(AWSConfig(; creds))

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
function totp(k::Vector{UInt8}; duration=30, skip=0)
    t = time_step(; duration)
    c = reinterpret(UInt8, [hton(t + skip)]) # Convert to big-endian
    return hotp(k, c)
end

totp(k::AbstractString; kwargs...) = totp(transcode(Base32Decoder(), k); kwargs...)

# `t` is number of seconds since midnight UTC of January 1, 1970 (UNIX epoch)
time_step(; duration=30, t=time(), t0=0) = div(floor(Int64, t - t0), duration)
