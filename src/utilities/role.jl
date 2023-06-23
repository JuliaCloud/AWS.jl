"""
    assume_role(principal, role; kwargs...) -> AWSConfig
    assume_role(::Type{AWSConfig}, principal, role; kwargs...) -> AWSConfig
    assume_role(::Type{AWSCredentials}, principal, role; kwargs...) -> AWSCredentials

Assumes the IAM `role` via temporary credentials via the `principal` entity. The `principal`
entity must be included in the trust policy of the `role`.

[Role chaining](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-role-chaining)
must be manually specified by multiple `assume_role` calls (e.g. "role-a" has permissions to
assume "role-b": `assume_role(assume_role(AWSConfig(), "role-a"), "role-b")`).

# Arguments
- `principal::AbstractAWSConfig`: The AWS configuration and credentials of the principal
  entity (user or role) performing the `sts:AssumeRole` action.
- `role::AbstractString`: The AWS IAM role to assume. Either a full role ARN or just the
  role name. If only the role name is specified the role will be assumed to reside in the
  same account used in the `principal` argument.

# Keywords
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

function assume_role(principal, role; kwargs...)
    return assume_role(typeof(principal), principal, role; kwargs...)
end

function assume_role(::Type{AWSConfig}, principal::AWSConfig, role; kwargs...)
    creds = assume_role(AWSCredentials, principal, role; kwargs...)
    return AWSConfig(creds, principal.region, principal.output, principal.max_attempts)
end

function assume_role(
    ::Type{AWSCredentials},
    principal::AbstractAWSConfig,
    role::AbstractString;
    duration::Union{Integer,Nothing}=nothing,
    mfa_serial::Union{AbstractString,Nothing}=nothing,
    token::Union{AbstractString,Nothing}=nothing,
    session_name::Union{AbstractString,Nothing}=nothing,
)
    if startswith(role, "arn:aws:iam")
        # Avoiding unnecessary parsing the role ARN or performing an expensive API call
        account_id = ""
        role_arn = role
    else
        account_id = aws_account_number(principal)
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
        msg = "Keyword `token` cannot be be specified when `mfa_serial` is not set"
        throw(ArgumentError(msg))
    end

    response = AWSServices.sts(
        "AssumeRole",
        params;
        aws_config=principal,
        feature_set=AWS.FeatureSet(; use_response_type=true),
    )
    body = parse(response)
    role_creds = body["AssumeRoleResult"]["Credentials"]
    role_user = body["AssumeRoleResult"]["AssumedRoleUser"]
    renew = function ()
        # Avoid passing the `token` into the credential renew function as it will be expired
        return assume_role(
            AWSCredentials, principal, role_arn; duration, mfa_serial, session_name
        )
    end

    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"],
        role_user["Arn"],
        account_id;  # May as well populate "account_number" field when we have it
        expiry=DateTime(rstrip(role_creds["Expiration"], 'Z')),
        renew,
    )
end

"""
    assume_role(role; kwargs...) -> Function

Create a function that assumes the IAM `role` via a deferred principal entity, i.e. a
function equivalent to `principal -> assume_role(principal, role; kwargs...)`. Useful for
[role chaining](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-role-chaining).

# Examples

Assume "role-a" which in turn assumes "role-b":

```julia
AWSConfig() |> assume_role("role-a") |> assume_role("role-b")
```
"""
assume_role(role; kwargs...) = principal -> assume_role(principal, role; kwargs...)
