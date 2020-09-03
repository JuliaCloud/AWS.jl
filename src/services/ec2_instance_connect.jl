# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ec2_instance_connect
using AWS.Compat
using AWS.UUIDs
"""
    SendSSHPublicKey()

Pushes an SSH public key to a particular OS user on a given EC2 instance for 60 seconds.

# Required Parameters
- `AvailabilityZone`: The availability zone the EC2 instance was launched in.
- `InstanceId`: The EC2 instance you wish to publish the SSH key to.
- `InstanceOSUser`: The OS user on the EC2 instance whom the key may be used to authenticate as.
- `SSHPublicKey`: The public key to be published to the instance. To use it after publication you must have the matching private key.

"""

send_sshpublic_key(AvailabilityZone, InstanceId, InstanceOSUser, SSHPublicKey; aws_config::AWSConfig=global_aws_config()) = ec2_instance_connect("SendSSHPublicKey", Dict{String, Any}("AvailabilityZone"=>AvailabilityZone, "InstanceId"=>InstanceId, "InstanceOSUser"=>InstanceOSUser, "SSHPublicKey"=>SSHPublicKey); aws_config=aws_config)
send_sshpublic_key(AvailabilityZone, InstanceId, InstanceOSUser, SSHPublicKey, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ec2_instance_connect("SendSSHPublicKey", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AvailabilityZone"=>AvailabilityZone, "InstanceId"=>InstanceId, "InstanceOSUser"=>InstanceOSUser, "SSHPublicKey"=>SSHPublicKey), args)); aws_config=aws_config)
