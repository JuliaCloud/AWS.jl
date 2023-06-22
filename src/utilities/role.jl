"""
    assume_role(role; kwargs...) -> AWSConfig
    assume_role(::Type{AWSConfig}, role; kwargs...) -> AWSConfig
    assume_role(::Type{AWSCredentials}, role; kwargs...) -> AWSCredentials

Assumes the IAM `role` via temporary credentials. The current user or role (specified via
the `aws_config` keyword) must be included in the trust policy of the `role`.

[Role chaining](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-role-chaining)
must be manually specified by nesting `assume_role` calls together (e.g. "role-a" has
permissions to assume "role-b": `assume_role("role-a"; aws_config=assume_role("role_a")`).

# Arguments
- `role::AbstractString`: The AWS IAM role to assume. Either a full role ARN or just the
  role name. If only the role name is specified the role will be assumed to reside in the
  same account used in `aws_config`.

# Keywords
- `aws_config::AbstractAWSConfig` (optional): User or role attempting to assume the
  specified `role`
- `duration::Integer` (optional): Role session duration in seconds.
- `mfa_serial::AbstractString` (optional): The identification number of the MFA device that
  is associated with the user making the `AssumeRole` API call. Either a serial number for a
  hardware device ("GAHT12345678") or an ARN for a virtual device
  ("arn:aws:iam::123456789012:mfa/user"). When specified a MFA token must be provided via
  `token` or an interactive prompt.
- `token::AbstractString` (optional): The value provided by the MFA device. Only can be
  specified when `mfa_serial` is set.
- `session_name::AbstractString` (optional): The unique role session name associated with
  this API request.
"""
function assume_role end

assume_role(role; kwargs...) = assume_role(AWSConfig, role; kwargs...)

function assume_role(::Type{AWSConfig}, role; aws_config=global_aws_config(), kwargs...)
    creds = assume_role(AWSCredentials, role; aws_config, kwargs...)
    return AWSConfig(creds, aws_config.region, aws_config.output, aws_config.max_attempts)
end

function assume_role(
    ::Type{AWSCredentials},
    role::AbstractString;
    aws_config::AbstractAWSConfig=global_aws_config(),
    duration::Union{Integer,Nothing}=nothing,
    mfa_serial::Union{AbstractString,Nothing}=nothing,
    token::Union{AbstractString,Nothing}=nothing,
    session_name::Union{AbstractString,Nothing}=nothing,
)
    if startswith(role, "arn:aws:iam")
        account_id = ""  # Avoiding unnecessary parsing ARN and expensive API call
        role_arn = role
    else
        account_id = aws_account_number(aws_config)
        role_arn = "arn:aws:iam::$account_id:role/$role"
    end

    params = Dict{String,Any}("RoleArn" => role_arn)
    if session_name !== nothing
        params["RoleSessionName"] = session_name
    else
        params["RoleSessionName"] = _role_session_name(
            "AWS.jl-",
            ENV["USER"],
            "-" * Dates.format(now(UTC), dateformat"yyyymmdd\THHMMSS\Z"),
        )
    end

    if duration !== nothing
        params["DurationSeconds"] = duration
    end

    if mfa_serial !== nothing && token !== nothing
        params["SerialNumber"] = mfa_serial
        params["TokenCode"] = token
    elseif mfa_serial !== nothing && token === nothing
        params["SerialNumber"] = mfa_serial
        token = Base.getpass("Enter MFA code for $mfa_serial")
        params["TokenCode"] = Base.shred!(token) do t
            read(t, String)
        end
    elseif mfa_serial === nothing && token !== nothing
        throw(ArgumentError("Keyword `token` cannot be be specified when `mfa_serial` is not set"))
    end

    response = AWSServices.sts(
        "AssumeRole",
        params;
        aws_config,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    body = parse(response)
    role_creds = body["AssumeRoleResult"]["Credentials"]
    role_user = body["AssumeRoleResult"]["AssumedRoleUser"]
    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"],
        role_user["Arn"],
        account_id;  # May as well populate "account_number" field when we have it
        expiry=DateTime(rstrip(role_creds["Expiration"], 'Z')),
        # Avoid passing the `token` into the credential renew function as it will be expired
        renew=() -> assume_role(AWSCredentials, role_arn; aws_config, duration, mfa_serial, session_name),
    )
end
