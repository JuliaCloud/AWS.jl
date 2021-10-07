function _can_read_file(file_name::String)
    return isfile(file_name) && try
        isreadable(open(file_name, "r"))
    catch e
        false
    end
end
_begins_with_ec2(file_name::String) = uppercase(String(read(file_name, 3))) == "EC2"
function _ends_with_ec2(file_name::String)
    return endswith(strip(uppercase(read(file_name, String))), "EC2")
end

"""
Generate a valid role session name. Currently only ensures that the session name is
64-characters or less.
"""
function _role_session_name(prefix, name, suffix)
    b = IOBuffer()
    write(b, prefix, name)
    truncate(b, min(64 - length(suffix), b.size))  # Assumes ASCII
    write(b, suffix)
    return String(take!(b))
end

"""
Get the value for `key` in the `ini` file for a given `profile`.
"""
function _get_ini_value(
    ini::Inifile, profile::AbstractString, key::AbstractString; default_value=nothing
)
    value = get(ini, "profile $profile", key)
    value === :notfound && (value = get(ini, profile, key))
    value === :notfound && (value = default_value)

    return value
end

function _aws_profile_config(ini::Inifile, profile::AbstractString)
    if profile != "default" || !haskey(sections(ini), "default")
        profile = "profile $profile"
    end

    return get(sections(ini), profile, Dict())
end

function _aws_profile_config(ini::Inifile, profile::Nothing)
    return _aws_profile_config(ini, _aws_get_profile())
end

function _aws_profile_config(config_file::AbstractString, profile)
    isfile(config_file) || return Dict()
    return _aws_profile_config(read(Inifile(), config_file), profile)
end

function _aws_profile_config(config_file::Nothing, profile)
    return _aws_profile_config(dot_aws_config_file(), profile)
end

"""
Retrieve the `AWSCredentials` for a given role from Security Token Services (STS).
"""
function _aws_get_role(role::AbstractString, ini::Inifile)
    settings = @mock _aws_profile_config(ini, role)
    settings === nothing && return nothing

    source_profile = get(settings, "source_profile", nothing)
    source_profile === nothing && return nothing

    role_arn = get(settings, "role_arn", nothing)
    mfa_serial = get(settings, "mfa_serial", nothing)
    duration_seconds = get(settings, "duration_seconds", nothing)

    credentials = nothing
    for f in (dot_aws_credentials, dot_aws_config)
        credentials = f(source_profile)
        credentials === nothing || break
    end

    credentials === nothing && return nothing
    config = AWSConfig(;
        creds=credentials, region=aws_get_region(; config=ini, profile=source_profile)
    )

    params = LittleDict(
        "RoleArn" => role_arn, "RoleSessionName" => replace(role, r"[^\w+=,.@-]" => s"-")
    )

    if mfa_serial !== nothing
        params["SerialNumber"] = mfa_serial
        token = @mock Base.getpass("Enter MFA code for $mfa_serial")
        params["TokenCode"] = read(token, String)
        Base.shred!(token)
    end

    if duration_seconds !== nothing
        params["DurationSeconds"] = duration_seconds
    end

    # RoleSessionName Documentation
    # https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html
    response = @mock AWSServices.sts(
        "AssumeRole",
        params;
        aws_config=config,
        feature_set=FeatureSet(; use_response_type=true),
    )
    role = parse(response)
    role_creds = role["AssumeRoleResult"]["Credentials"]

    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"];
        expiry=DateTime(rstrip(role_creds["Expiration"], 'Z')),
    )
end

"""
Get `AWSCredentials` for the specified `profile` from the `inifile`. If targeting the
`~/.aws/config` file, with a non-default `profile`, you must specify `config=true` otherwise
the default credentials will be returned.
"""
function _aws_get_credential_details(profile::AbstractString, ini::Inifile)
    access_key = _get_ini_value(ini, profile, "aws_access_key_id")
    secret_key = _get_ini_value(ini, profile, "aws_secret_access_key")
    token = _get_ini_value(ini, profile, "aws_session_token"; default_value="")

    return (access_key, secret_key, token)
end

"""
Get the default AWS profile
"""
function _aws_get_profile(; default="default")
    @something(
        get(ENV, "AWS_PROFILE", nothing),
        get(ENV, "AWS_DEFAULT_PROFILE", nothing),
        Some(default),
    )
end

"""
Check if credentials will expire within 5 minutes
"""
function _will_expire(aws_creds::AWSCredentials)
    return aws_creds.expiry - now(UTC) <= Minute(5)
end

"""
Retrieve the EC2 meta data from the local AWS endpoint. Return the EC2 metadata request
body, or `nothing` if not running on an EC2 instance.
"""
function _ec2_metadata(metadata_endpoint::String)
    try
        request = @mock HTTP.request(
            "GET", "http://169.254.169.254/latest/meta-data/$metadata_endpoint"
        )

        return request === nothing ? nothing : String(request.body)
    catch e
        e isa HTTP.IOError || e isa HTTP.StatusError && e.status == 404 || rethrow(e)
    end

    return nothing
end
