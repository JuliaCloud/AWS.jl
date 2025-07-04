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
function _get_profile_value(ini::Inifile, profile, key; kwargs...)
    return _get_ini_value(ini, "profile" => profile, key; kwargs...)
end

"""
Get the value for `key` in the `ini` file for a given `sso_session`.
"""
function _get_sso_session_value(ini::Inifile, sso_session, key; kwargs...)
    return _get_ini_value(ini, "sso-session" => sso_session, key; kwargs...)
end

function _get_ini_value(
    ini::Inifile,
    section::Pair{<:AbstractString,<:AbstractString},
    key::AbstractString;
    default_value=nothing,
)
    section_type, section_name = section
    value = get(ini, "$section_type $section_name", key)
    value === :notfound && (value = get(ini, section_name, key))
    value === :notfound && (value = default_value)

    return value
end

function _aws_profile_config(ini::Inifile, profile::AbstractString)
    # Prefer using "profile default" over "default"
    section_name = if profile != "default" || haskey(sections(ini), "profile default")
        "profile $profile"
    else
        "default"
    end

    return copy(get(sections(ini), section_name, IniFile.HTSS()))
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
    for f in (sso_credentials, dot_aws_credentials, dot_aws_config)
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
    access_key = _get_profile_value(ini, profile, "aws_access_key_id")
    secret_key = _get_profile_value(ini, profile, "aws_secret_access_key")
    token = _get_profile_value(ini, profile, "aws_session_token"; default_value="")

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
        e isa HTTP.RequestError || e isa HTTP.StatusError && e.status == 404 || rethrow(e)
    end

    return nothing
end

"""
Retrieve the existing SSO access token from AWS CLI cache using the SSO session name.
"""
function _sso_cache_access_token(session_name::AbstractString)
    cache_path = joinpath(homedir(), ".aws", "sso", "cache")
    cache_file = joinpath(cache_path, bytes2hex(sha1(session_name)) * ".json")

    !isfile(cache_file) && return nothing

    _cache = JSON.parsefile(cache_file)
    token = get(_cache, "accessToken", nothing)

    return token
end

"""
Retrieve sso-specific details for the given `profile`.
"""
function _aws_get_sso_credential_details(profile::AbstractString, ini::Inifile)
    sso_session = _get_profile_value(ini, profile, "sso_session")

    # > Typically, `sso_account_id` and `sso_role_name` must be set in the profile section
    # > so that the SDK can request SSO credentials.
    # – https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-manual
    sso_account_id = _get_profile_value(ini, profile, "sso_account_id")
    sso_role_name = _get_profile_value(ini, profile, "sso_role_name")

    if isnothing(sso_account_id)
        throw(
            InvalidAWSConfig(
                "Profile \"$profile\" must define `sso_account_id` in order to request " *
                "SSO credentials.",
            ),
        )
    elseif isnothing(sso_role_name)
        throw(
            InvalidAWSConfig(
                "Profile \"$profile\" must define `sso_role_name` in order to request " *
                "SSO credentials.",
            ),
        )
    end

    if !isnothing(sso_session)
        # IAM identity center authentication
        # https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-manual
        sso_start_url = _get_sso_session_value(ini, sso_session, "sso_start_url")
        sso_region = _get_sso_session_value(ini, sso_session, "sso_region")

        # The AWS documentation documents the `sso_start_url` and `sso_region` keys as
        # required. AWS.jl doesn't actually require `sso_start_url` in this case but we'll
        # still validate this key is set.
        if isnothing(sso_start_url)
            throw(
                InvalidAWSConfig(
                    "The SSO session \"$sso_session\" section must define `sso_start_url`."
                ),
            )
        elseif isnothing(sso_region)
            throw(
                InvalidAWSConfig(
                    "The SSO session \"$sso_session\" section must define `sso_region`."
                ),
            )
        end

        # The AWS CLI requires that these settings which be set on the profile and
        # sso-session are at least consistent:
        # - "The value for sso_start_url is inconsistent between profile (https://my-legacy-sso-portal.awsapps.com/start) and sso-session (https://my-legacy-sso-portal.awsapps.com/start)."
        # - "The value for sso_region is inconsistent between profile (us-legacy-1) and sso-session (us-east-1)."
        legacy_sso_start_url = _get_profile_value(ini, profile, "sso_start_url")
        legacy_sso_region = _get_profile_value(ini, profile, "sso_region")

        if !isnothing(legacy_sso_start_url) && sso_start_url != legacy_sso_start_url
            throw(
                InvalidAWSConfig(
                    "The value for `sso_start_url` is inconsistent between the profile " *
                    "($legacy_sso_start_url) and the sso-session ($sso_start_url).",
                ),
            )
        elseif !isnothing(legacy_sso_region) && sso_region != legacy_sso_region
            throw(
                InvalidAWSConfig(
                    "The value for `sso_region` is inconsistent between the profile " *
                    "($legacy_sso_region) and the sso-session ($sso_region).",
                ),
            )
        end

        access_token = @mock _sso_cache_access_token(sso_session)
    else
        # Legacy IAM identity center authentication
        # https://docs.aws.amazon.com/cli/latest/userguide/sso-configure-profile-legacy.html#sso-configure-profile-manual

        # > To manually add IAM Identity Center support to a named profile, you must add the
        # > following keys and values to the profile definition in the config file.
        # > - `sso_start_url`
        # > - `sso_region`
        # > - `sso_account_id`
        # > - `sso_role_name`

        sso_start_url = _get_profile_value(ini, profile, "sso_start_url")
        sso_region = _get_profile_value(ini, profile, "sso_region")

        if isnothing(sso_start_url)
            throw(
                InvalidAWSConfig(
                    "Profile \"$profile\" must define `sso_start_url` in order to " *
                    "request SSO credentials.",
                ),
            )
        elseif isnothing(sso_region)
            throw(
                InvalidAWSConfig(
                    "Profile \"$profile\" must define `sso_region` in order to " *
                    "request SSO credentials.",
                ),
            )
        end

        access_token = @mock _sso_cache_access_token(sso_start_url)
    end

    if isnothing(access_token)
        help_url = "https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-login"
        error(
            "You must first sign in to a IAM Identity Center session via " *
            "`aws sso login --profile $profile`. See $help_url for more details.",
        )
    end

    headers = Dict{String,String}("x-amz-sso_bearer_token" => access_token)
    tmp_config = AWSConfig(; creds=nothing, region=sso_region)

    # https://docs.aws.amazon.com/singlesignon/latest/PortalAPIReference/API_GetRoleCredentials.html
    sso_creds = @mock AWSServices.sso(
        "GET",
        "/federation/credentials?account_id=$(sso_account_id)&role_name=$(sso_role_name)",
        Dict{String,Any}("headers" => headers),
        aws_config=tmp_config,
    )

    access_key = sso_creds["roleCredentials"]["accessKeyId"]
    secret_key = sso_creds["roleCredentials"]["secretAccessKey"]
    token = sso_creds["roleCredentials"]["sessionToken"]
    expiry = DateTime(
        Dates.UTM(Dates.UNIXEPOCH + sso_creds["roleCredentials"]["expiration"])
    )

    return (access_key, secret_key, token, expiry)
end

"""
    _read_credential_process(io::IO) -> NamedTuple

Parse the AWS CLI external process output out as defined in:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html
"""
function _read_credential_process(io::IO)
    # `JSON.parse` chokes on `Base.Process` I/O streams.
    json = JSON.parse(read(io, String))

    version = json["Version"]
    if version != 1
        error(
            "Credential process returned unhandled version $version:\n",
            sprint(JSON.print, json, 2),
        )
    end

    access_key_id = json["AccessKeyId"]
    secret_access_key = json["SecretAccessKey"]

    # The presence of the "Expiration" key determines if the provided credentials are
    # long-term credentials or temporary credentials. Temporary credentials must include a
    # session token (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html)
    if haskey(json, "Expiration") || haskey(json, "SessionToken")
        expiration = parse(DateTime, json["Expiration"], dateformat"yyyy-mm-dd\THH:MM:SS\Z")
        session_token = json["SessionToken"]
    else
        expiration = nothing
        session_token = nothing
    end

    return @compat (; access_key_id, secret_access_key, session_token, expiration)
end
