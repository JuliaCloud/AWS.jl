## AWS - Julia interface to Amazon Web Services

This package provides a native Julia interface to the Amazon Web Services API

The following services are supported as of now:

- EC2
- S3
- SQS


### Current status
- The basic APIs of EC2, S3 and SQS are tested
- The advanced APIs (e.g. VPC related APIs, etc) of EC2 are yet untested. Any testing will be helpful. 
- The REST API does not match exactly in certain cases
  with the WSDL. For the EC2 API, the bulk of the code is generated from the WSDL while it has been translated by hand for the
  S3 API.

  Please file issues on GitHub with the output from running the request in debug mode, i.e., with env.dbg = true.


### Usage
- Each of the functions takes in an AWSEnv as the first parameter

```
type AWSEnv
    aws_id::String         # AWS Access Key id
    aws_seckey::String     # AWS Secret key for signing requests
    aws_token::String      # AWS Security Token for temporary credentials
    region::String      # region name
    ep_scheme::String      # URL scheme: http or https
    ep_host::String     # region endpoint (host)
    ep_path::String     # region endpoint (path)
    sig_ver::Int                # AWS signature version (2 or 4)
    timeout::Float64            # request timeout in seconds, if set to 0.0, request will never time out. Default is 0.0
    dry_run::Bool               # If true, no actual request will be made - implies dbg flag below
    dbg::Bool                   # print request and raw response to screen

end
```
Constructors:

```
AWSEnv(; id=AWS_ID, key=AWS_SECKEY, token=AWS_TOKEN, ec2_creds=false, scheme="https", region=AWS_REGION, ep="", sig_ver=4, timeout=0.0, dr=false, dbg=false)
```

- The ```AWS_ID``` and ```AWS_SECKEY``` are initialized from env if available. Else a file ~/.awssecret is read (if available) for the same.
- The ```AWS_TOKEN``` is an empty string by default. Override ```token``` if the ```id``` and ```key``` are temporary security credentials.
- Set ```ec2_creds``` to true to automatically retrieve temporary security credentials if running on an EC2 instance that has such credentials.
- Set ```region``` to one of the AWS region name strings, e.g., "us-east-1". Not needed if setting ```ep```.
- ```ep``` can contain both a hostname and a pathname for an AWS endpoint. It is generally not needed when using native AWS services; use ```region``` instead. If using a service that emulates AWS, set ```ep``` to the hostname of the endpoint to be used. If both ```region``` and ```ep``` are set, the host portion of ```ep``` will override region, and the path portion of ```ep``` will be used in conjunction with ```region```.
- ```sig_ver``` must be set to 2 or 4. Some AWS services require one signature version or the other, in which case this value will be ignored.


APIs:

- [EC2 API](EC2.md)
- [S3 API](S3.md)
- [SQS API](SQS.md)


### Julia Dependencies

Calendar

Requests

LightXML


### Binary dependencies

libz must be installed

libxml2 must be installed
