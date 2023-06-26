#!/usr/bin/env julia

# Using AWS.jl to bootstrap AWS.jl test resources.

using AWS
using AWS: AWSException
using JSON

@service CloudFormation use_response_type=true
@service IAM use_response_type=true
@service Secrets_Manager use_response_type=true  # TODO: Support PascalCase

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
        elseif e isa AWSException && e.code == "ValidationError" && contains(e.message, r"^Stack .* does not exist$")
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

# TODO: Add timeout
function wait_for_user_to_exist(user_name)
    while true
        try
            IAM.get_user(Dict("UserName" => user_name))
            break
        catch e
            if e isa AWSException && e.code == "NoSuchEntity"
                sleep(5)
                continue
            else
                rethrow()
            end
        end
    end

    return nothing
end

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
function create_or_update_mfa_devices(; user_name, secret_id, num_devices=8)
    # Assumes user exists
    # TODO: Should be `list_mfa_devices` instead of `list_mfadevices`
    r = IAM.list_mfadevices(Dict("UserName" => user_name))
    existing_mfa_devices = get(parse(r)["ListMFADevicesResult"]["MFADevices"], "member", [])

    # When only a single MFA device is associated with the `user_name` then an
    # `AbstractDict` will be returned instead of an `AbstractVector`.
    if existing_mfa_devices isa AbstractDict
        existing_mfa_devices = [existing_mfa_devices]
    end

    if !isempty(existing_mfa_devices)
        @info "Deleting MFA devices for $user_name"
        for mfa_device in existing_mfa_devices
            mfa_serial = mfa_device["SerialNumber"]
            IAM.deactivate_mfadevice(mfa_serial, user_name)
            IAM.delete_virtual_mfadevice(mfa_serial)
        end
    end

    # Under certain conditions (such as manually deleting a stack) the user may no longer
    # exist but the MFA devices we want to create
    mfa_device_names = ["$user_name-$i" for i in 1:8]
    account_id = aws_account_number(AWSConfig())
    for mfa_device_name in mfa_device_names
        mfa_serial = "arn:aws:iam::$account_id:mfa/$mfa_device_name"
        try
            IAM.delete_virtual_mfadevice(mfa_serial)
            @warn "Deleting orphaned MFA device: $mfa_serial"
        catch e
            if e isa AWSException && e.code == "NoSuchEntity"
                nothing
            else
                rethrow()
            end
        end
    end

    @info "Creating $num_devices MFA devices for $user_name"
    mfa_devices = NamedTuple{(:mfa_serial, :seed), Tuple{String, String}}[]
    for mfa_device_name in mfa_device_names
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
        IAM.enable_mfadevice(totp(seed, offset=-1), totp(seed), mfa_serial, user_name)

        push!(mfa_devices, (; mfa_serial, seed))
    end

    @info "Storing MFA device details"
    create_or_update_secret(
        secret_id,
        Dict("SecretString" => JSON.json(mfa_devices)),
    )
end

if @__FILE__() == abspath(PROGRAM_FILE)
    stack_name = "AWS-jl-test"
    prefix = "AWS.jl"
    cfn_params = Dict("GitHubRepo" => prefix)
    template_body = read("aws_jl_test.yaml", String)

    @info "Creating/updating stack: $stack_name"
    create_or_update_stack(
        stack_name,
        Dict(
            "Capabilities" => ["CAPABILITY_NAMED_IAM"],
            "TemplateBody" => template_body,
            "Parameters" => [
                Dict("ParameterKey" => k, "ParameterValue" => v) for (k, v) in cfn_params
            ],
        )
    )

    # When the stack is first created we need to wait for the user to be created
    mfa_user = "$prefix-mfa-user"
    @info "Waiting for $mfa_user"
    wait_for_user_to_exist(mfa_user)

    create_or_update_mfa_devices(;
        user_name=mfa_user,
        secret_id="$prefix-mfa-user-virtual-mfa-devices",
    )
end
