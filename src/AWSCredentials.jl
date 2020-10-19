using Dates
using HTTP
using IniFile
using JSON
using Mocking


export AWSCredentials,
       aws_account_number,
       aws_get_region,
       aws_get_role_details,
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
       localhost_is_lambda

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
    renew::Union{Function, Nothing}  # Function which can be used to refresh credentials

    function AWSCredentials(
        access_key_id,
        secret_key,
        token="",
        user_arn="",
        account_number="";
        expiry=typemax(DateTime),
        renew=nothing,
    )
        return new(access_key_id, secret_key, token, user_arn, account_number, expiry, renew)
    end
end


function Base.show(io::IO, c::AWSCredentials)
    println(io,
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
        ")"
    )
end


function Base.copyto!(dest::AWSCredentials, src::AWSCredentials)
    for f in fieldnames(typeof(dest))
        setfield!(dest, f, getfield(src, f))
    end
end


function dot_aws_config_file()
    get(ENV, "AWS_CONFIG_FILE") do
        joinpath(homedir(), ".aws", "config")
    end
end
function dot_aws_credentials_file()
    get(ENV, "AWS_SHARED_CREDENTIALS_FILE") do
        joinpath(homedir(), ".aws", "credentials")
    end
end
localhost_maybe_ec2() = localhost_is_ec2() || isfile("/sys/devices/virtual/dmi/id/product_uuid")
localhost_is_lambda() = haskey(ENV, "LAMBDA_TASK_ROOT")
function _aws_get_profile()
    get(ENV, "AWS_DEFAULT_PROFILE") do
        get(ENV, "AWS_PROFILE", "default")
    end
end


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
function AWSCredentials(; profile=nothing)
    creds = nothing
    credential_function = () -> nothing

    if profile === nothing
        profile = get(ENV, "AWS_PROFILE", get(ENV, "AWS_DEFAULT_PROFILE", nothing))
    end

    # Define our search options, expected to be callable with no arguments. Should return
    # `nothing` when credentials are not able to be located
    functions = [
        env_var_credentials,
        () -> dot_aws_credentials(profile),
        () -> dot_aws_config(profile),
        ecs_instance_credentials,
        ec2_instance_credentials
    ]

    # Loop through our search locations until we get credentials back
    for f in functions
        credential_function = f
        creds = credential_function()
        creds === nothing || break
    end

    creds.renew = credential_function

    return creds
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
        result = @mock Base.read(command, String)
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

_can_read_file(file_name::String) = return isfile(file_name) && try isreadable(open(file_name, "r")) catch e; false; end
_begins_with_ec2(file_name::String) = return uppercase(String(read(file_name, 3))) == "EC2"
_ends_with_ec2(file_name::String) = return endswith(strip(uppercase(read(file_name, String))), "EC2")


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

            new_aws_creds === nothing && error("Can't find AWS credentials!")
            copyto!(aws_creds, new_aws_creds)

            # Ensure credential_method is not overwritten by the new credentials
            aws_creds.renew = credential_method
        end
    end

    return aws_creds
end

check_credentials(aws_creds::Nothing) = aws_creds


function _will_expire(aws_creds::AWSCredentials)
    # Credentials will expire in <= 5 minutes from now
    return aws_creds.expiry - now(UTC) <= Minute(5)
end


"""
    _ec2_metadata(metadata_endpoint::String) -> Union{String, Nothing}

Retrieve the EC2 meta data from the local AWS endpoint. Return the EC2 metadata request
body, or `nothing` if not running on an EC2 instance.

# Arguments
- `metadata_endpoint::String`: AWS internal meta data endpoint to hit
    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html#instance-metadata-ex-1

# Throws
- `StatusError`: If the response status is >= 300, except for 404
- `ParsingError`: Invalid HTTP request target
"""
function _ec2_metadata(metadata_endpoint::String)
    try
        request = @mock HTTP.request("GET", "http://169.254.169.254/latest/meta-data/$metadata_endpoint")

        return request === nothing ? nothing : String(request.body)
    catch e
        e isa HTTP.IOError || e isa HTTP.StatusError && e.status == 404 || rethrow(e)
    end

    return nothing
end


"""
    ec2_instance_credentials() -> AWSCredentials

Parse the EC2 metadata to retrieve AWSCredentials.
"""
function ec2_instance_credentials()
    info = _ec2_metadata("iam/info")

    if info === nothing
        return nothing
    end

    info = JSON.parse(info)

    name = _ec2_metadata("iam/security-credentials/")
    creds = _ec2_metadata("iam/security-credentials/$name")
    new_creds = JSON.parse(creds)

    expiry = DateTime(rstrip(new_creds["Expiration"], 'Z'))

    return AWSCredentials(
        new_creds["AccessKeyId"],
        new_creds["SecretAccessKey"],
        new_creds["Token"],
        info["InstanceProfileArn"];
        expiry=expiry,
        renew=ec2_instance_credentials
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
        renew=ecs_instance_credentials
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
            renew=env_var_credentials
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
        p = profile === nothing ? _aws_get_profile() : profile
        access_key, secret_key, token = _aws_get_credential_details(p, ini)

        if access_key !== nothing
            return AWSCredentials(access_key, secret_key, token)
        end
    end

    return nothing
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
        p = profile === nothing ? _aws_get_profile() : profile
        access_key, secret_key, token = _aws_get_credential_details(p, ini)

        if access_key !== nothing
            return AWSCredentials(access_key, secret_key, token)
        else
            return _aws_get_role(p, ini)
        end
    end

    return nothing
end


"""
    _aws_get_credential_details(profile::AbstractString, ini::Inifile) -> Tuple

Get `AWSCredentials` for the specified `profile` from the `inifile`. If targeting the
`~/.aws/config` file, with a non-default `profile`, you must specify `config=true` otherwise
the default credentials will be returned.

# Arguments
- `profile::AbstractString`: Specific profile used to get AWSCredentials
- `ini::Inifile`: Inifile to look into for the `profile` credentials
"""
function _aws_get_credential_details(profile::AbstractString, ini::Inifile)
    access_key = _get_ini_value(ini, profile, "aws_access_key_id")
    secret_key = _get_ini_value(ini, profile, "aws_secret_access_key")
    token = _get_ini_value(ini, profile, "aws_session_token"; default_value="")

    return (access_key, secret_key, token)
end


"""
    aws_get_region(profile::AbstractString, ini::Inifile) -> String

Retrieve the AWS Region for a given profile, returns `us-east-1` as a default.

# Arguments
- `profile::AbstractString`: Specific profile used to get the region
- `ini::Inifile`: Inifile to look in for the region
"""
function aws_get_region(profile::AbstractString, ini::Inifile)
    region = get(ENV, "AWS_DEFAULT_REGION") do
        _get_ini_value(ini, profile, "region"; default_value="us-east-1")
    end

    return region
end


"""
    _aws_get_role(role::AbstractString, ini::Inifile) -> Union{AWSCredentials, Nothing}

Retrieve the `AWSCredentials` for a given role from Security Token Services (STS).

# Arguments
- `role::AbstractString`: Name of the `role`
- `ini::Inifile`: Inifile to look into to find the `role`
"""
function _aws_get_role(role::AbstractString, ini::Inifile)
    source_profile, role_arn = aws_get_role_details(role, ini)
    source_profile === nothing && return nothing
    credentials = nothing

    for f in (dot_aws_credentials, dot_aws_config)
        credentials = f(source_profile)
        credentials === nothing || break
    end

    credentials === nothing && return nothing
    config = AWSConfig(creds=credentials, region=aws_get_region(source_profile, ini))

    # RoleSessionName Documentation
    # https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html
    role = AWSServices.sts(
        "AssumeRole",
        LittleDict("RoleArn" => role_arn, "RoleSessionName" => replace(role, r"[^\w+=,.@-]" => s"-"));
        aws_config=config
    )

    role_creds = role["Credentials"]

    return AWSCredentials(
        role_creds["AccessKeyId"],
        role_creds["SecretAccessKey"],
        role_creds["SessionToken"];
        expiry=unix2datetime(role_creds["Expiration"])
    )
end


"""
    aws_get_role_details(profile::AbstractString, ini::Inifile) -> Tuple

Return a tuple of `profile` details and the `role arn`.

# Arguments
- `profile::AbstractString`: Specific profile to get role details about
- `ini::Inifile`: Inifile to look into to find the role details
"""
function aws_get_role_details(profile::AbstractString, ini::Inifile)
    role_arn = _get_ini_value(ini, profile, "role_arn")
    source_profile = _get_ini_value(ini, profile, "source_profile")

    return (source_profile, role_arn)
end


"""
    _get_ini_value(
        ini::Inifile, profile::AbstractString, key::AbstractString;
        default_value=nothing
    ) -> String

Get the value for `key` in the `ini` file for a given `profile`.

# Arguments
- `ini::Inifile`: Inifile to look for `key` in
- `profile::AbstractString`: Given profile to find the `key` for
- `key::AbstractString`: Name of the `key` to get

# Keywords
- `default_value`: If the `key` is not found, default to this value
"""
function _get_ini_value(
    ini::Inifile, profile::AbstractString, key::AbstractString;
    default_value=nothing
)
    value = get(ini, "profile $profile", key)
    value === :notfound && (value = get(ini, profile, key))
    value === :notfound && (value = default_value)

    return value
end
