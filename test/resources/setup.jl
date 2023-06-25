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

# Create a new MFA device and associate it with the MFA user. There are many reasons why
# this setup is performed here:
#
# - AWS CloudFormation's `AWS::IAM::VirtualMFADevice` doesn't allow us to access the seed
# - Limitations with creating MFA devices during running the test including:
#     - A maximum of 8 MFA devices per user limiting test concurrency
#     - A lag between when an MFA device is associated with a user and when we can use it


username = "aws-jl-mfa-user"

# TODO: Should be `list_mfa_devices`
existing_mfa_devices = let r
    r = IAM.list_mfadevices(Dict("UserName" => username))
    parse(r)["ListMFADevicesResult"]["MFADevices"]["member"]
end

# When only a single MFA device is associated with the `username` then a `AbstractDict` will
# be returned instead of a `AbstractVector`.
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

mfa_devices = NamedTuple{(:mfa_serial, :seed), Tuple{String, String}}[]

@info "Creating MFA devices for $username"
for i in 1:2
    mfa_device_name = "aws-jl-mfa-device-$i"
    r = IAM.create_virtual_mfadevice(mfa_device_name)
    mfa_device = parse(r)["CreateVirtualMFADeviceResult"]["VirtualMFADevice"]
    mfa_serial = mfa_device["SerialNumber"]
    seed = String(transcode(Base64Decoder(), mfa_device["Base32StringSeed"]))

    # TODO: Interface is horrible
    # `AccessDenied -- MultiFactorAuthentication failed with invalid MFA one time pass code.`
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
