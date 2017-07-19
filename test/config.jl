const config = Dict{String, Any}(
    # whether to debug AWS requests and responses
    "dbg" => false,

    # AWS credentials to connect with
    # If not set, they are taken from environment or .aws/* files
    #"id" => "",
    #"key" => "",
    #"region" => AWS.US_WEST_2,
    #"availability-zones" => ["us-west-2a", "us-west-2b"],

    # AMI and instance specifications to use for EC2 tests
    # a generic AMI to use to test ec2 operations
    # any linux AMI would do (e.g. ami-835b4efa - Ubuntu 16.04 64 bit us-west-2)
    # "ami-generic" => "ami-835b4efa",
    # the instance type to launch
    # "insttype" => "m3.medium",
    # tags to tag the instances with
    # "ownertag" => "awstest",
    # "nametag" => "awstest",
    # key to use to launch instances
    # "keyname" => "awstest",

    # AWS Account ID (required for SQS)
    #"awsAccountID" => ""
)
