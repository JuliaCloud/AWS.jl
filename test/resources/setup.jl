#!/usr/bin/env julia

# Use AWS.jl to bootstrap AWS.jl tests

# In order to properly test MFA support we needed to attach a virtual MFA device to a AWS user

# Bad options:
# - Attach an MFA to the user while testing
#    - Limit of 8 MFA devices per user limits concurrent tests
#    - Delay between when an MFA token is attached to a user and its first use

using AWS
using AWS: AWSException
using JSON

@service CloudFormation use_response_type=true
@service IAM use_response_type=true

# TODO: Support PascalCase
@service Secrets_Manager use_response_type=true

global_aws_config(; region="us-east-1")

include("totp.jl")

function create_or_update_stack(args...; kwargs...)
    response = nothing
    result_key = nothing
    try
        response = CloudFormation.update_stack(args...; kwargs...)
        result_key = "UpdateStackResult"
    catch e
        if e isa AWSException && e.code == "ValidationError" && e.message == "No updates are to be performed."
            nothing
        elseif e isa AWSException && e.code == "ResourceNotFoundException"
            response = CloudFormation.create_stack(args...; kwargs...)
            result_key = "CreateStackResult"
        else
            rethrow()
        end
    end

    return response, result_key
end

function create_or_update_secret(secret_id, params)
    secret_exists = try
        Secrets_Manager.get_secret_value(secret_id)
        true
    catch e
        if e isa AWSException && e.code == "ResourceNotFoundException"
            false
        else
            rethrow()
        end
    end

    r = if !secret_exists
        Secrets_Manager.create_secret(secret_id, params)
    else
        Secrets_Manager.update_secret(secret_id, params)
    end

    return r
end

template_body = read("aws_jl_test.yaml", String)
create_or_update_stack(
    "AWS-jl-test",
    Dict(
        "Capabilities" => ["CAPABILITY_NAMED_IAM"],
        "TemplateBody" => template_body,
    )
)

# Create multiple MFA devices for the `MFAUser`. Utilizing virtual MFA devices for our AWS.jl
# integration tests proved challenging for the following reasons:
#
# 1. A TOTP code can only be used once.
# 2. MFA devices can only be associated with users. See `iam:EnableMFADevice`: https://docs.aws.amazon.com/IAM/latest/APIReference/API_EnableMFADevice.html
# 3. Up to 8 MFA devices can be associated win a single user: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html#replace-virt-mfa
# 4. AWS CloudFormation supports creating MFA devices and even assocaiting the device with a
#    user but doesn't provide access to the seed. See `AWS::IAM::VirtualMFADevice`: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html#aws-resource-iam-role-return-values
# 5. There is a lag between when you associating an MFA device with a user and when you can first use it (~10 seconds)
#
# When running integration tests in parallel having TOTP codes be consumed or having a
# limited amount of MFA devices per user can cause unwanted throttling when running tests.
# To mitigate this issue the following algorithm is employed:
#
# As part of our resource setup we'll create and associate 8 virtual MFA devices with our
# AWS user. When running a test that requires the MFA user iterate through a randomized list
# of the MFA devices and attempt the API call with the associated TOTP. If the TOTP has been
# consumed we'll try the next MFA device in the list until all MFA devices have been
# attempted. If all TOTPs have been consumed we'll wait until th next time window and try
# again with a new randomized list of MFA devices.
#
# The primary advantage of this approach is that it allows up to 8 API calls to occur
# concurrently during the same time window. Concurrent integration tests will only be
# throttled if all TOTP tokens have been consumed.

username = "aws-jl-mfa-user"


existing_mfa_devices = let r
    # TODO: Should be `list_mfa_devices` instead of `list_mfadevices`
    r = IAM.list_mfadevices(Dict("UserName" => username))
    parse(r)["ListMFADevicesResult"]["MFADevices"]["member"]
end

# When only a single MFA device is associated with the `username` then an `AbstractDict`
# will be returned instead of an `AbstractVector`.
if existing_mfa_devices isa AbstractDict
    existing_mfa_devices = [existing_mfa_devices]
end

if !isempty(existing_mfa_devices)
    @info "Deleting existing MFA devices for $username"
    for mfa_device in existing_mfa_devices
        mfa_serial = mfa_device["SerialNumber"]
        IAM.deactivate_mfadevice(mfa_serial, username)
        IAM.delete_virtual_mfadevice(mfa_serial)
    end
end

@info "Creating MFA devices for $username"
mfa_devices = NamedTuple{(:mfa_serial, :seed), Tuple{String, String}}[]
for i in 1:8
    mfa_device_name = "aws-jl-mfa-device-$i"
    r = IAM.create_virtual_mfadevice(mfa_device_name)
    mfa_device = parse(r)["CreateVirtualMFADeviceResult"]["VirtualMFADevice"]
    mfa_serial = mfa_device["SerialNumber"]
    seed = String(transcode(Base64Decoder(), mfa_device["Base32StringSeed"]))

    # When a human sets up an virtual MFA device they prompted to enter "two consecutive
    # authentication codes". Usually one would enter the currency OTP code and wait for
    # next code to be generated. Entering the current and future OTP codes could result in
    # issues.
    # https://aws.amazon.com/blogs/security/how-to-enable-mfa-protection-on-your-aws-api-calls/
    # TODO: Argument ordering here is horrible
    IAM.enable_mfadevice(totp(seed, offset=-1), totp(seed), mfa_serial, username)

    push!(mfa_devices, (; mfa_serial, seed))
end

@show mfa_devices

@info "Storing MFA device details"
mfa_device_secret = "aws-jl-mfa-user-virtual-mfa-devices"
create_or_update_secret(
    mfa_device_secret,
    Dict("SecretString" => JSON.json(mfa_devices)),
)
