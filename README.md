## AWS.jl

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)


## Overview
A Julia interface for [Amazon Web Services](https://aws.amazon.com).

This package is a simplification of both the low-level APIs from [AWSCore.jl](https://github.com/JuliaCloud/AWSCore.jl) and the high level APIs from [AWSSDK.jl](https://github.com/JuliaCloud/AWSSDK.jl).
It includes automated code generation to ensure all new AWS services are available, as well as keeping existing services up to date.  

To see an overview of the architecture see the [design document](https://github.com/JuliaCloud/AWS.jl/wiki/v1-Design-Document). 

## Installation
```julia
julia> Pkg.add("AWS")
```

## Usage
There are two ways to use `AWS.jl`, low-level and high-level API requests.
Please note when passing parameters for a request they must be a subtype of `AbstractDict{String, <:Any}`.

### Low-Level
To use the low-level API, you must know how to perform the request you are making.
If you do not know how to perform a request you can reference the [AWS Documentation](https://docs.aws.amazon.com/).
Alternatively you can look at `/src/services/{Service}.jl` to find a list of available requests, as well as their required and optional parameters.

For example, to list the objects in an S3 bucket you must pass in the request method (`"GET"`) and the endpoint (`"/${bucket}"`).

```julia
using AWS.AWSServices: s3

s3("GET", "/your-bucket")
```

### High-Level
To use the high-level API, you only need to know the name of the request you wish to make.
For example again, to list the objects in an S3 bucket:

```julia
using AWS: @service
@service S3

S3.ListObjects("/your-bucket")
```

Note: When calling the `@service` macro you **MUST** capitalize the first character and match the `/services/{service}.jl` filename.
If you do not the service will not be placed in your namespace and you will see an error.
This is due to the lowercase service name being a `constant`.

```julia
using AWS: @service
@service s3
WARNING: import of AWSServices.s3 into s3 conflicts with an existing identifier; ignored.
```

## Limitations
Currently there are a few limitations with the high-level APIs. 
For example, with S3's DeleteMultipleObjects call.
To remove multiple objects you must pass in an XML string (see below) in the body of the request.

Low-Level API Example:
```julia
using AWS.AWSServices: s3

body = """
    <Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
        <Object>
            <Key>test.txt</Key>
        </Object>
    </Delete>
    """
bucket_name = "example-bucket"

s3("POST", "/$bucket_name?delete", Dict("body" => body))  # Delete multiple objects
```

There is no-programatic way to see this from the [aws-sdk-js](https://github.com/aws/aws-sdk-js/blob/master/apis/s3-2006-03-01.normal.json), so the high-level function will not work.

High-Level API Example
```julia
using AWS: @service
@service S3

body = """
    <Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
        <Object>
            <Key>test.txt</Key>
        </Object>
    </Delete>
    """
bucket_name = "example-bucket"

S3.DeleteObjects(bucket_name, body)  # Delete multiple objects
> ERROR: AWS.AWSExceptions.AWSException("MissingRequestBodyError", "Request Body is empty")
```
There are most likely other similar functions which require more intricate details in how the requests are performed, both in the S3 definitions and in other services.


## Alternative Solutions
There are a few alternatives to this package, the two below are being deprecated in favour of this package:
* [AWSCore.jl](https://github.com/JuliaCloud/AWSCore.jl) - Low-level AWS interface
* [AWSSDK.jl](https://github.com/JuliaCloud/AWSSDK.jl) - High-level AWS interface

As well as some hand-written packages for specific AWS services:
* [AWSS3.jl](https://github.com/JuliaCloud/AWSS3.jl) - Julia 1.0+
* [AWSSQS.jl](https://github.com/JuliaCloud/AWSSQS.jl) - Julia 1.0+ 
* [AWSSNS.jl](https://github.com/samoconnor/AWSSNS.jl) - Julia 0.7
* [AWSIAM.jl](https://github.com/samoconnor/AWSIAM.jl) - Julia 0.6
* [AWSEC2.jl](https://github.com/samoconnor/AWSEC2.jl) - Julia 0.6
* [AWSLambda.jl](https://github.com/samoconnor/AWSLambda.jl) - Julia 0.6
* [AWSSES.jl](https://github.com/samoconnor/AWSSES.jl) - Julia 0.6
* [AWSSDB.jl](https://github.com/samoconnor/AWSSDB.jl) - Julia 0.6
