using Dates
using HTTP
using IniFile
using JSON
using Mocking

using ..AWSExceptions

export AWSCredentials,
    aws_account_number,
    aws_get_region,
    aws_get_profile_settings,
    aws_user_arn,
    check_credentials,
    dot_aws_config,
    dot_aws_credentials,
    dot_aws_credentials_file,
    dot_aws_config_file,
    ec2_instance_credentials,
    ecs_instance_credentials,
    env_var_credentials,
    localhost_is_ec2,
    localhost_maybe_ec2,
    localhost_is_lambda,
    credentials_from_webtoken

function localhost_maybe_ec2()
    return localhost_is_ec2() || isfile("/sys/devices/virtual/dmi/id/product_uuid")
end
localhost_is_lambda() = haskey(ENV, "LAMBDA_TASK_ROOT")

"""
    AWSCredentials

When you interact with AWS, you specify your [AWS Security Credentials](http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html)
to verify who you are and whether you have permission to access the resources that you are requesting.
AWS uses the security credentials to authenticate and authorize your requests.
The fields `access_key_id` and `secret_key` hold the access keys used to authenticate API requests
(see [Creating, Modifying, and Viewing Access Keys](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)).
[Temporary Security Credentials](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html) require the extra session `token` field.
The `user_arn` and `account_number` fields are used to cache the result of the [`aws_user_arn`](@ref) and [`aws_account_number`](@ref) functions.

AWS.jl searches for credentials in a series of possible locations and stops as soon as it finds credentials.
The order of precedence for this search is as follows:

1. Passing credentials directly to the `AWSCredentials` constructor
2. [Environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
3. Shared credential file [(~/.aws/credentials)](http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html)
4. AWS config file [(~/.aws/config)](http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html)
5. Assume Role provider via the aws config file
6. Instance metadata service on an Amazon EC2 instance that has an IAM role configured

Once the credentials are found, the method by which they were accessed is stored in the `renew` field
and the DateTime at which they will expire is stored in the `expiry` field.
This allows the credentials to be refreshed as needed using [`check_credentials`](@ref).
If `renew` is set to `nothing`, no attempt will be made to refresh the credentials.
Any renewal function is expected to return `nothing` on failure or a populated `AWSCredentials` object on success.
The `renew` field of the returned `AWSCredentials` will be discarded and does not need to be set.

To specify the profile to use from `~/.aws/credentials`, do, for example, `AWSCredentials(profile="profile-name")`.
"""
mutable struct AWSCredentials
    access_key_id::String
    secret_key::String
    token::String
    user_arn::String
    account_number::String
    expiry::DateTime
    renew::Union{Function,Nothing}  # Function which can be used to refresh credentials

    function AWSCredentials(
        access_key_id,
        secret_key,
        token="",
        user_arn="",
        account_number="";
        expiry=typemax(DateTime),
        renew=nothing,
    )
        return new(
            access_key_id, secret_key, token, user_arn, account_number, expiry, renew
        )
    end
end

# Needs to be included after struct AWSCredentials for compilation
include(joinpath("utilities", "credentials.jl"))

"""
    AWSCredentials(; profile=nothing) -> Union{AWSCredentials, Nothing}

Create an AWSCredentials object, given a provided profile (if not provided "default" will be
used).

Checks credential locations in the order:
    1. Environment Variables
    2. ~/.aws/credentials
    3. ~/.aws/config
    4. EC2 or ECS metadata

# Keywords
- `profile::AbstractString`: Specific profile used to search for AWSCredentials

# Throws
- `error("Can't find AWS Credentials")`: AWSCredentials could not be found
"""
function AWSCredentials(; profile=nothing, throw_cred_error=true)
    creds = nothing
    credential_function = () -> nothing
    profile = @something profile _aws_get_profile()

    # Define our search options, expected to be callable with no arguments.
    # Throw NoCredentials if none are found
    functions = [
        env_var_credentials,
        () -> dot_aws_credentials(profile),
        () -> dot_aws_config(profile),
        credentials_from_webtoken,
        ecs_instance_credentials,
        () -> ec2_instance_credentials(profile),
    ]

    # Loop through our search locations until we get credentials back
    for f in functions
        credential_function = f
        creds = credential_function()
        creds === nothing || break
    end

    # If credentials are nothing, default to throwing an error, otherwise return nothing
    if creds === nothing
        if throw_cred_error
            throw(NoCredentials("Can't find AWS credentials!"))
        else
            return nothing
        end
    end

    creds.renew = credential_function

    return creds
end

function Base.show(io::IO, c::AWSCredentials)
    return print(
        io,
        c.user_arn,
        isempty(c.user_arn) ? "" : " ",
        "(",
        c.account_number,
        isempty(c.account_number) ? "" : ", ",
        c.access_key_id,
        isempty(c.secret_key) ? "" : ", $(c.secret_key[1:3])...",
        isempty(c.token) ? "" : ", $(c.token[1:3])...",
        ", ",
        c.expiry,
        ")",
    )
end

function Base.copyto!(dest::AWSCredentials, src::AWSCredentials)
    for f in fieldnames(typeof(dest))
        setfield!(dest, f, getfield(src, f))
    end
end

"""
    check_credentials(
        aws_creds::AWSCredentials, force_refresh::Bool=false
    ) -> AWSCredentials

Checks current AWSCredentials, refreshing them if they are soon to expire. If
`force_refresh` is `true` the credentials will be renewed immediately

# Arguments
- `aws_creds::AWSCredentials`: AWSCredentials to be checked / refreshed

# Keywords
- `force_refresh::Bool=false`: `true` to refresh the credentials

# Throws
- `error("Can't find AWS credentials!")`: If no credentials can be found
"""
function check_credentials(aws_creds::AWSCredentials; force_refresh::Bool=false)
    if force_refresh || _will_expire(aws_creds)
        credential_method = aws_creds.renew

        if credential_method !== nothing
            new_aws_creds = credential_method()

            new_aws_creds === nothing && throw(NoCredentials("Can't find AWS credentials!"))
            copyto!(aws_creds, new_aws_creds)

            # Ensure credential_method is not overwritten by the new credentials
            aws_creds.renew = credential_method
        end
    end

    return aws_creds
end
check_credentials(aws_creds::Nothing) = aws_creds

"""
    ec2_instance_metadata(path::AbstractString) -> Union{String, Nothing}

Retrieve the AWS EC2 instance metadata as a string using the provided `path`. If no instance
metadata is available (typically due to not running within an EC2 instance) then `nothing`
will be returned. See the AWS documentation for details on what metadata is available:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html

# Arguments
- `path`: The URI path to used to specify that metadata to return
"""
function ec2_instance_metadata(path::AbstractString)
    uri = HTTP.URI(; scheme="http", host="169.254.169.254", path=path)
    request = try
        @mock HTTP.request("GET", uri; connect_timeout=1)
    catch e
        if e isa HTTP.ConnectionPool.ConnectTimeout
            nothing
        else
            rethrow()
        end
    end

    return request !== nothing ? String(request.body) : nothing
end

"""
    ec2_instance_region() -> Union{String, Nothing}

Determine the AWS region of the machine executing this code if running inside of an EC2
instance, otherwise `nothing` is returned.
"""
ec2_instance_region() = ec2_instance_metadata("/latest/meta-data/placement/region")

"""
    ec2_instance_credentials(profile::AbstractString) -> AWSCredentials

Parse the EC2 metadata to retrieve AWSCredentials.
"""
function ec2_instance_credentials(profile::AbstractString)
    path = dot_aws_config_file()
    ini = Inifile()
    if isfile(path)
        ini = read(ini, path)
    end

    # Any profile except default must specify the credential_source as Ec2InstanceMetadata.
    if profile != "default"
        source = _get_ini_value(ini, profile, "credential_source")
        source == "Ec2InstanceMetadata" || return nothing
    end

    info = ec2_instance_metadata("/latest/meta-data/iam/info")
    info === nothing && return nothing
    info = JSON.parse(info)

    # Get credentials for the role associated to the instance via instance profile.
    name = ec2_instance_metadata("/latest/meta-data/iam/security-credentials/")
    creds = ec2_instance_metadata("/latest/meta-data/iam/security-credentials/$name")
    parsed = JSON.parse(creds)
    instance_profile_creds = AWSCredentials(
        parsed["AccessKeyId"],
        parsed["SecretAccessKey"],
        parsed["Token"],
        info["InstanceProfileArn"];
        expiry=DateTime(rstrip(parsed["Expiration"], 'Z')),
        renew=() -> ec2_instance_credentials(profile),
    )

    # Look for a role to assume and return instance profile credentials if there is none.
    role_arn = _get_ini_value(ini, profile, "role_arn")
    role_arn === nothing && return instance_profile_creds

    # Assume the role.
    role_session = get(ENV, "AWS_ROLE_SESSION_NAME") do
        _role_session_name(
            "AWS.jl-role-",
            basename(role_arn),
            "-" * Dates.format(@mock(now(UTC)), dateformat"yyyymmdd\THHMMSS\Z"),
        )
    end
    params = Dict{String,Any}("RoleArn" => role_arn, "RoleSessionName" => role_session)
    duration = _get_ini_value(ini, profile, "duration_seconds")
    if duration !== nothing
        params["DurationSeconds"] = parse(Int, duration)
    end
    response = @mock AWSServices.sts(
        "AssumeRole",
        params;
        aws_config=AWSConfig(; creds=instance_profile_creds),
        feature_set=FeatureSet(; use_response_type=true),
    )
    dict = parse(response)
    role_creds = dict["AssumeRoleResult"]["Credentials"]
    role_user = dict["AssumeRoleResult"]["AssumedRoleUser"]
    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"],
        role_user["Arn"];
        expiry=DateTime(rstrip(role_creds["Expiration"], 'Z')),
        renew=() -> ec2_instance_credentials(profile),
    )
end

"""
    ecs_instance_credentials() -> Union{AWSCredential, Nothing}

Retrieve credentials from the local endpoint. Return `nothing` if not running on an ECS
instance.

More information can be found at:
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html

# Returns
- `AWSCredentials`: AWSCredentials from `ECS` credentials URI, `nothing` if the Env Var is
    not set (not running on an ECS container instance)

# Throws
- `StatusError`: If the response status is >= 300
- `ParsingError`: Invalid HTTP request target
"""
function ecs_instance_credentials()
    if !haskey(ENV, "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI")
        return nothing
    end

    uri = ENV["AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"]

    response = @mock HTTP.request("GET", "http://169.254.170.2$uri")
    new_creds = String(response.body)
    new_creds = JSON.parse(new_creds)

    expiry = DateTime(rstrip(new_creds["Expiration"], 'Z'))

    return AWSCredentials(
        new_creds["AccessKeyId"],
        new_creds["SecretAccessKey"],
        new_creds["Token"],
        new_creds["RoleArn"];
        expiry=expiry,
        renew=ecs_instance_credentials,
    )
end

"""
    env_var_credentials() -> Union{AWSCredential, Nothing}

Use AWS environmental variables (e.g. AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, etc.)
to create AWSCredentials.
"""
function env_var_credentials()
    if haskey(ENV, "AWS_ACCESS_KEY_ID") && haskey(ENV, "AWS_SECRET_ACCESS_KEY")
        return AWSCredentials(
            ENV["AWS_ACCESS_KEY_ID"],
            ENV["AWS_SECRET_ACCESS_KEY"],
            get(ENV, "AWS_SESSION_TOKEN", ""),
            get(ENV, "AWS_USER_ARN", "");
            renew=env_var_credentials,
        )
    end

    return nothing
end

"""
    dot_aws_credentials(profile=nothing) -> Union{AWSCredential, Nothing}

Retrieve AWSCredentials from the `~/.aws/credentials` file

# Arguments
- `profile`: Specific profile used to get AWSCredentials, default is `nothing`
"""
function dot_aws_credentials(profile=nothing)
    credential_file = @mock dot_aws_credentials_file()

    if isfile(credential_file)
        ini = read(Inifile(), credential_file)
        p = @something profile _aws_get_profile()
        access_key, secret_key, token = _aws_get_credential_details(p, ini)

        if access_key !== nothing
            return AWSCredentials(access_key, secret_key, token)
        end
    end

    return nothing
end

function dot_aws_credentials_file()
    get(ENV, "AWS_SHARED_CREDENTIALS_FILE") do
        joinpath(homedir(), ".aws", "credentials")
    end
end

"""
    dot_aws_config(profile=nothing) -> Union{AWSCredential, Nothing}

Retrieve AWSCredentials for the default or specified profile from the `~/.aws/config` file.
If this fails try to retrieve credentials from `_aws_get_role()`, otherwise return `nothing`

# Arguments
- `profile`: Specific profile used to get AWSCredentials, default is `nothing`
"""
function dot_aws_config(profile=nothing)
    config_file = @mock dot_aws_config_file()

    if isfile(config_file)
        ini = read(Inifile(), config_file)
        p = @something profile _aws_get_profile()
        access_key, secret_key, token = _aws_get_credential_details(p, ini)

        if access_key !== nothing
            return AWSCredentials(access_key, secret_key, token)
        else
            return _aws_get_role(p, ini)
        end
    end

    return nothing
end

function dot_aws_config_file()
    get(ENV, "AWS_CONFIG_FILE") do
        joinpath(homedir(), ".aws", "config")
    end
end

"""
    localhost_is_ec2() -> Bool

Determine if the machine executing this code is running on an EC2 instance.
"""
function localhost_is_ec2()
    # Checking to see if you are running on an EC2 instance is a complicated problem due to
    # a large amount of caveats. Below is a list of methods to implement to work through
    # most of these problems:
    #
    # 1. Check the `hostname -d`; this will not work if using non-Amazon DNS
    # 2. Check metadata with EC2 internal domain name `curl -s
    # http://instance-data.ec2.internal`; this will not work with a VPC (legacy EC2 only)
    # 3. Check `sudo dmidecode -s bios-version`; this requires `dmidecode` on the instance
    # 4. Check `/sys/devices/virtual/dmi/id/bios_version`; this may not work depending on
    # the instance, Amazon does not document this file however so it's quite unreliable
    # 5. Check `http://169.254.169.254`; This is a link-local address for metadata,
    # apparently other cloud providers make this metadata URL available now as well so it's
    # not guaranteed that you're on an EC2 instance
    #    Or check a specific endpoint of the instance metadata such as:
    #         ims_local_hostname = String(HTTP.get("http://169.254.169.254/latest/meta-data/local-hostname").body)
    #    but with a fast timeout and cache the result.
    #    See https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
    # 6. When checking the UUID, check for little-endian representation,
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/identify_ec2_instances.html

    # This is not guarenteed to work on Windows as RNG can make the UUID begin with EC2 on a
    # non-EC2 instance
    if @mock Sys.iswindows()
        command = `wmic path win32_computersystemproduct get uuid`
        result = @mock read(command, String)
        instance_uuid = strip(split(result, "\n")[2])

        return instance_uuid[1:3] == "EC2"
    end

    # Note: try catch required for open calls on files of mode 400 (-r--------)
    # Note: This will not work on new m5 and c5 instances because they use a new hypervisor
    # stack and the kernel does not create files in sysfs
    hypervisor_uuid = "/sys/hypervisor/uuid"
    if _can_read_file(hypervisor_uuid)
        return true
    end

    # Note: Works if you are running as root
    product_uuid = "/sys/devices/virtual/dmi/id/product_uuid"
    if _can_read_file(product_uuid) && _begins_with_ec2(product_uuid)
        return true
    end

    # Check additional values under /sys/devices/virtual/dmi/id for the key "EC2"
    # These work for the new m5 and c5 (nitro hypervisor) when root isn't available
    # filenames = ["bios_vendor", "board_vendor", "chassis_asset_tag", "chassis_version", "sys_vendor", "uevent", "modalias"]
    # all return "Amazon EC2" except the last two
    sys_vendor = "/sys/devices/virtual/dmi/id/sys_vendor"
    if _can_read_file(sys_vendor) && _ends_with_ec2(sys_vendor)
        return true
    end

    return false
end

"""
    credentials_from_webtoken()

Assume role via web identity.
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc
"""
function credentials_from_webtoken()
    token_role_arn = "AWS_ROLE_ARN"
    token_web_identity_file = "AWS_WEB_IDENTITY_TOKEN_FILE"
    token_role_session = "AWS_ROLE_SESSION_NAME"  # Optional session name

    if !(haskey(ENV, token_role_arn) && haskey(ENV, token_web_identity_file))
        return nothing
    end

    role_arn = ENV[token_role_arn]
    web_identity = read(ENV["AWS_WEB_IDENTITY_TOKEN_FILE"], String)
    role_session = get(ENV, token_role_session) do
        _role_session_name(
            "AWS.jl-role-",
            basename(role_arn),
            "-" * Dates.format(@mock(now(UTC)), dateformat"yyyymmdd\THHMMSS\Z"),
        )
    end

    response = @mock AWSServices.sts(
        "AssumeRoleWithWebIdentity",
        Dict(
            "RoleArn" => role_arn,
            "RoleSessionName" => role_session,  # Required by AssumeRoleWithWebIdentity
            "WebIdentityToken" => web_identity,
        );
        aws_config=AWSConfig(; creds=nothing),
        feature_set=FeatureSet(; use_response_type=true),
    )
    dict = parse(response)

    role_creds = dict["AssumeRoleWithWebIdentityResult"]["Credentials"]
    assumed_role_user = dict["AssumeRoleWithWebIdentityResult"]["AssumedRoleUser"]

    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"],
        assumed_role_user["Arn"];
        expiry=DateTime(rstrip(role_creds["Expiration"], 'Z')),
        renew=credentials_from_webtoken,
    )
end

"""
    aws_get_region(; profile=nothing, config=nothing, default="$DEFAULT_REGION")

Determine the current AWS region that should be used for AWS requests. The order of
precedence mirrors what is [used by the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence):

1. Environmental variable: as specified by the `AWS_DEFAULT_REGION` environmental variable.
2. AWS configuration file: `region` as specified by the `profile` in the configuration
   file, typically "~/.aws/config".
3. Default region: use the specified `default`, typically "$DEFAULT_REGION".

# Keywords
- `profile`: Name of the AWS configuration profile, if any. Defaults to `nothing` which
  falls back to using `AWS._aws_get_profile()`
- `config`: AWS configuration loaded as an `Inifile` or a path to a configuration file.
  Defaults to `nothing` which falls back to using `dot_aws_config_file()`
- `default`: The region to return if no high-precedence was found. Can be useful to set
  this to `nothing` if you want to know that no current AWS region was defined.
"""
function aws_get_region(; profile=nothing, config=nothing, default=DEFAULT_REGION)
    @something(
        get(ENV, "AWS_DEFAULT_REGION", nothing),
        get(_aws_profile_config(config, profile), "region", nothing),
        Some(default),
    )
end

@deprecate aws_get_region(profile::AbstractString, ini::Inifile) aws_get_region(;
    profile=profile, config=ini
)

"""
    aws_get_profile_settings(profile::AbstractString, ini::Inifile) -> Dict

Return a `Dict` containing all of the settings for the specified profile.

# Arguments
- `profile::AbstractString`: Profile to retrieve settings from
- `ini::Inifile`: Configuration file read the settings from
"""
function aws_get_profile_settings(profile::AbstractString, ini::Inifile)
    section = get(sections(ini), "profile $profile", nothing)

    # Internals of IniFile.jl always return strings for keys/values even though the returned
    # Dict uses more generic type parameters
    return section !== nothing ? Dict{String,String}(section) : nothing
end

@deprecate(
    aws_get_role_details(profile::AbstractString, ini::Inifile),
    get.(
        Ref(aws_get_profile_settings(profile, ini)), ("source_profile", "role_arn"), nothing
    ),
)
