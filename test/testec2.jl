using AWS.EC2
using AWS

#const ami_ubuntu_13_04_64_bit_US_east = "ami-77147f1e"


const ami_ubuntu_13_04_64_bit_US_east = "ami-59482230" # This is the Julia installed version of 13_04

env = AWSEnv(ENV["AWS_ID"], ENV["AWS_SECKEY"], EP_US_EAST_NORTHERN_VIRGINIA)

function terminate_instances (instances)
    req = TerminateInstancesType(instancesSet=instances)
    resp = TerminateInstances(env, req)
    if (resp.error == nothing)
        println(resp.error); error("Instances scheduled to terminate")
    else
        println(resp.error); error("Error get_instances_by_owner")
    end
    instances
end

function terminate_instances_by_owner (owner::String)
    instances = get_instances_by_owner (owner)
    println("$owner has the following [$instances] instances")
    terminate_instances (instances)
end


function get_instances_by_owner (owner::String)
    instances = ASCIIString[]
    req = DescribeInstancesType(filterSet=[FilterType(name="tag:Owner", valueSet=[owner])])
    resp = DescribeInstances(env, req)
    if (resp.error == nothing)
        reservs = resp.obj.reservationSet
        for reserv in reservs
            instancesSet = reserv.instancesSet
            for i in instancesSet
                push!(instances, i.instanceId)
            end
        end
    else
        println(resp.error); error("Error get_instances_by_owner")
    end
    instances
end

function check_running(env, chk_instances)
    new_chk_instances = ASCIIString[]
    req = DescribeInstanceStatusType(instancesSet=chk_instances, includeAllInstances=true)
    resp = DescribeInstanceStatus(env, req)
    if (resp.error == nothing)
        statuses = resp.obj.instanceStatusSet
        for status in statuses
            println("Status of $(status.instanceId) is $(status.instanceState.code):$(status.instanceState.name)")
            if status.instanceState.code != 16
                push!(new_chk_instances, status.instanceId)
            end
        end
    else
        println(resp.error); error("Error with DescribeInstanceStatusType!")
    end
    new_chk_instances
end

function get_hostnames(env, instances)
    names = NTuple[]
    req = DescribeInstancesType(instancesSet=instances)
    resp = DescribeInstances(env, req)
    if (resp.error == nothing)
        reservs = resp.obj.reservationSet
        for reserv in reservs
            instancesSet = reserv.instancesSet
            for i in instancesSet
                push!(names, (i.instanceId, i.dnsName))
            end
        end
    else
        println(resp.error); error("Error get_hostnames")
    end
    names
end



function launch_n_ec2(n::Int)
    resp = RunInstances(env, RunInstancesType(imageId=ami_ubuntu_13_04_64_bit_US_east, minCount=n, maxCount=n, keyName="jublr"))
    instances = ASCIIString[]
    if (resp.error == nothing)
        for inst in resp.obj.instancesSet
            push!(instances, inst.instanceId)
        end
    else
        println(resp.error)
        error("Error launching EC2 instances!")
    end
    println("Launched instances : $instances" )
    
    # Tag the instances....
    tags = [ResourceTagSetItemType(key="Name", value="AWSTest"), ResourceTagSetItemType(key="Owner", value="amitm")]
    tag_rqst = CreateTagsType(resourcesSet=instances, tagSet=tags)
    resp = CreateTags(env, tag_rqst)
    if (resp.error == nothing)
        if resp.obj._return == true
            println("Successfully added tags!")
        else
            error("error adding tags!")
        end
    else
        println(resp.error); error("Error with CreatTags!")
    end
    println("Tagged instances : $instances" )

    # Wait for the instances to come to a running state....
    start = time()
    chk_instances = check_running(env, instances)
    while (((time() - start) < 60.0) && (length(chk_instances) > 0))
        println("All instances not yet in a running state. Waiting and trying again....")
        sleep(5.0)
        
        chk_instances = check_running(env, chk_instances)
    end
    
    if (length(chk_instances) > 0)
        println("All instances not yet in a running state. Please check after some time.")
    end
    instances
end

instances = launch_n_ec2(1)

hostnames = get_hostnames(instances)

stop_instances(instances)




exit()

resp = EC2.DescribeInstances(env)
println(resp.obj)

resp = EC2.DescribeAvailabilityZones(env)
println(resp.obj)

exit()


exit()


msg = AssignPrivateIpAddressesType()
msg.networkInterfaceId = "NIC"
msg.privateIpAddressesSet = ["1.2.3.4", "5.6.7.8"]
msg.secondaryPrivateIpAddressCount = 42
msg.allowReassignment = true

EC2.AssignPrivateIpAddresses(env, msg) 


ugp1 = UserIdGroupPairType()
ugp2 = UserIdGroupPairType()
ugp21 = UserIdGroupPairType()
ugp22 = UserIdGroupPairType()

ugp1.userId = "ugp1.userId"
ugp1.groupId = "ugp1.groupId"
ugp1.groupName = "ugp1.groupName"

ugp2.userId = "ugp2.userId"
ugp2.groupId = "ugp2.groupId"
ugp2.groupName = "ugp2.groupName"

ugp21.userId = "ugp21.userId"
ugp21.groupId = "ugp21.groupId"
ugp21.groupName = "ugp21.groupName"

ugp22.userId = "ugp22.userId"
ugp22.groupId = "ugp22.groupId"
ugp22.groupName = "ugp22.groupName"

ip1 = IpPermissionType()
ip2 = IpPermissionType()

ip1.ipProtocol="ipproto1"
ip1.fromPort = 20
ip1.toPort = 22
ip1.groups = [ugp1, ugp2]
ip1.ipRanges = ["range1", "range2"]

ip2.ipProtocol="ipproto2"
ip2.fromPort = 78
ip2.toPort = 100
ip2.groups = [ugp21, ugp22]
ip2.ipRanges = ["range21", "range22"]


msg = AuthorizeSecurityGroupEgressType
()
msg.groupId = "ASGroupId"
msg.ipPermissions = [ip1, ip2]

EC2.AuthorizeSecurityGroupEgress(env, msg)

msg = CreateNetworkAclEntryType
("netaclid", 42, "Myproto", "Myaction", true, "CIDRBlock-127.0.0.0/24", IcmpTypeCodeType(42,43), PortRangeType(78,79))
EC2.CreateNetworkAclEntry(env, msg)


EC2.ec2_generic(env, "MyAction", [("k1", "v1"),("k2", 42),("k3", 4.2)])


exit()


using Sodium
using Codecs

#tstr = "GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
#"GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
tstr1 = "GET\nwebservices.amazon.com\n/onca/xml\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&ItemId=0679722769&Operation=ItemLookup&ResponseGroup=ItemAttributes%2COffers%2CImages%2CReviews&Service=AWSECommerceService&Timestamp=2009-01-01T12%3A00%3A00Z&Version=2009-01-06"
key1 = "1234567890"
signature_bytes1 = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(signature_bytes1, tstr1, length(tstr1), key1)
signature_b641 = Codecs.encode(Base64, signature_bytes1)
bytestring(signature_b641)

#tstr2 = "GET\nwebservices.amazon.com\n/onca/xml\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&ItemId=0679722769&Operation=ItemLookup&ResponseGroup=ItemAttributes%2COffers%2CImages%2CReviews&Service=AWSECommerceService&Timestamp=2009-01-01T12%3A00%3A00Z&Version=2009-01-06"
#key2 = "1234567890"
tstr2 = "GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
key2 = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" 
key_bytes2 = zeros(Uint8, 32)

if length(key2) <= 32
    copy!(key_bytes2, convert(Array{Uint8,1}, key2))
elseif length(key2) > 32
#    Sodium.crypto_hash_sha256(key_bytes2, key2, length(key2));
end

copy!(key_bytes2, hex2bytes("4da066d4246eea70c1b2554a28c5626b"))

println(Codecs.encode(Base64, key_bytes2))

signature_bytes2 = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(signature_bytes2, tstr2, length(tstr2), key_bytes2)
signature_b642 = Codecs.encode(Base64, signature_bytes2)
bytestring(signature_b642)



k=hex2bytes(fill(uint8('a'), 131))
kb = zeros(Uint8, 32)
if length(k) <= 32
    copy!(kb, k)
elseif length(k) > 32
    Sodium.crypto_hash_sha256(kb, k, length(k));
end

sb = zeros(Uint8, 32)

d = "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374"
d = hex2bytes(d)
rc = Sodium.crypto_auth_hmacsha256(sb, d, length(d), kb)
bytes2hex(sb)




s = "GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
k = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" 
kb = zeros(Uint8, 32)

copy!(kb, 1, convert(Array{Uint8,1}, k), 1, 32)
sb = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(sb, s, length(s), kb)
bytestring(Codecs.encode(Base64, sb))


s = "GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
k = Codecs.decode(Base64, "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY")  
kb = zeros(Uint8, 32)

copy!(kb, convert(Array{Uint8,1}, k))
sb = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(sb, s, length(s), kb)
bytestring(Codecs.encode(Base64, sb))


s = hex2bytes("4869205468657265")
k = hex2bytes("0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b") 
kb = zeros(Uint8, 64)

copy!(kb, convert(Array{Uint8,1}, k))
sb = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(sb, s, length(s), kb)
bytestring(Codecs.encode(Base64, sb))


s = "GET\nelasticmapreduce.amazonaws.com\n/\nAWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31"
k = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" 
kb = zeros(Uint8, 64)

copy!(kb, convert(Array{Uint8,1}, k))
sb = zeros(Uint8, 32)
rc = Sodium.crypto_auth_hmacsha256(sb, s, length(s), kb)
bytes2hex(sb)


