include("../AWSServices.jl")
using .AWSServices: ec2_instance_connect

"""
    SendSSHPublicKey()

Pushes an SSH public key to a particular OS user on a given EC2 instance for 60 seconds.

Required Parameters
{
  "InstanceOSUser": "The OS user on the EC2 instance whom the key may be used to authenticate as.",
  "AvailabilityZone": "The availability zone the EC2 instance was launched in.",
  "InstanceId": "The EC2 instance you wish to publish the SSH key to.",
  "SSHPublicKey": "The public key to be published to the instance. To use it after publication you must have the matching private key."
}
"""
SendSSHPublicKey(args) = ec2_instance_connect("SendSSHPublicKey", args)