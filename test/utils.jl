function _now_formatted()
    return lowercase(Dates.format(now(Dates.UTC), dateformat"yyyymmdd\THHMMSSsss\Z"))
end

testset_role(role_name) = "AWS.jl-$role_name"

http_header(h::Dict, k, d="") = get(h, k, d)
http_header(h::Vector, k, d="") = http_header(Dict(h), k, d)
http_header(args...) = HTTP.header(args...)

macro test_ecode(error_codes, expr)
    quote
        try
            $expr
            @test false
        catch e
            if e isa AWSException
                @test e.code in [$error_codes;]
            else
                rethrow(e)
            end
        end
    end
end

function get_assumed_role(aws_config::AbstractAWSConfig=current_aws_config())
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

function mfa_user_credentials(config::AbstractAWSConfig)
    r = AWSServices.secrets_manager(
        "GetSecretValue",
        Dict("SecretId" => "AWS.jl-mfa-user-credentials");
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    json = JSON.parse(parse(r)["SecretString"])
    mfa_user_creds = AWSCredentials(json["access_key_id"], json["secret_access_key"])
    mfa_user_cfg = AWSConfig(; creds=mfa_user_creds)

    r = AWSServices.secrets_manager(
        "GetSecretValue",
        Dict("SecretId" => "AWS.jl-mfa-user-virtual-mfa-devices");
        aws_config=config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    json = JSON.parse(parse(r)["SecretString"])
    mfa_devices = [(; mfa_serial=d["mfa_serial"], seed=d["seed"]) for d in json]

    return mfa_user_cfg, mfa_devices
end

struct MinioConfig <: AbstractAWSConfig
    endpoint::String
    region::String
    creds
end
struct SimpleCredentials
    access_key_id::String
    secret_key::String
    token::String
end

AWS.region(c::MinioConfig) = c.region
AWS.credentials(c::MinioConfig) = c.creds
AWS.check_credentials(c::SimpleCredentials) = c

function AWS.generate_service_url(aws::MinioConfig, service::String, resource::String)
    service == "s3" || throw(ArgumentError("Can only handle s3 requests to Minio"))
    return string(aws.endpoint, resource)
end

function gen_ini(content)
    buffer = IOBuffer(content)
    ini = Inifile()
    read(ini, buffer)
    return ini
end
