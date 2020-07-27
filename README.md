## AWS.jl

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)


## Overview
Julia interface for [Amazon Web Services](https://aws.amazon.com).

This package is a simplification of both the low-level APIs from [AWSCore.jl](https://github.com/JuliaCloud/AWSCore.jl) and the high level APIs from [AWSSDK.jl](https://github.com/JuliaCloud/AWSSDK.jl).
It includes automated code generation to ensure all new AWS services are available, as well as keeping existing services up to date.  

To see an overview of the architecture see the [wiki page](https://github.com/JuliaCloud/AWS.jl/wiki/v1-Design-Document). 

## Installation
```julia
julia> Pkg.add("AWS")
```

## Usage
There are two ways to use `AWS.jl`, low-level and high-level API requests.
Please note when passing parameters for a request they must be in the form `AbstractDict{String, <:Any}`.

### Low-Level
To use the low-level API, you must know how to perform the request you are making.
If you do not know how to perform a request you can reference the [AWS Documentation](https://docs.aws.amazon.com/).
Alternatively you can look at `/src/services/{Service}.jl` to find a list of available requests, as well as their required and optional parameters.

For example, to list the objects in an S3 bucket you must know the `request_method`(GET), and the endpoint `/${bucket}`.

```julia
using AWS.AWSServices: s3

s3("GET", "/your-bucket")
```

### High-Level
To use the high-level API, you only need to know the name of the request which you wish to make.
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
Currently there are a few limitations with the high-level APIs. For example, with S3's DeleteMultipleObjects call.
To remove multiple objects you must pass in an XML string (see below) in the body of the request.
There is no-programatic way to see this from the [aws-sdk-js](https://github.com/aws/aws-sdk-js/blob/master/apis/s3-2006-03-01.normal.json), so the high-level function will not work.
There are most likely other similar functions which require more intricate details in how the requests are performed, both in the S3 definitions and in other services.

```julia
body = """
    <Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
        <Object>
            <Key>$file_name</Key>
        </Object>
    </Delete>
    """
```

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


## License
```
MIT License

Copyright (c) 2020 JuliaCloud

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
