## AWS.jl

[![CI](https://github.com/JuliaCloud/AWS.jl/workflows/CI/badge.svg)](https://github.com/JuliaCloud/AWS.jl/actions?query=workflow%3ACI)
[![Bors: enabled](https://bors.tech/images/badge_small.svg)](https://app.bors.tech/repositories/6778)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)


[AWS.jl](https://github.com/JuliaCloud/AWS.jl) is a Julia interface for [Amazon Web Services](https://aws.amazon.com).

This package replaces [AWSCore.jl](https://github.com/JuliaCloud/AWSCore.jl) and [AWSSDK.jl](https://github.com/JuliaCloud/AWSSDK.jl) which previously provided low-level and high-level APIs respectively.
It includes automated code generation to ensure all new AWS services are available, as well as keeping existing services up to date.

To see an overview of the architecture see the [design document](https://github.com/JuliaCloud/AWS.jl/wiki/v1-Design-Document).

## Installation
```julia
julia> Pkg.add("AWS")
```

## Usage
`AWS.jl` can be used with low-level and high-level API requests.
Please note when passing parameters for a request they must be a subtype of `AbstractDict{String, <:Any}`.

### Low-Level
To use the low-level API, you must know how to perform the request you are making.
If you do not know how to perform a request you can reference the [AWS Documentation](https://docs.aws.amazon.com/).
Alternatively you can look at `/src/services/{Service}.jl` to find a list of available requests, as well as their required and optional parameters.

For example, to list the objects in an S3 bucket you must pass in the request method (`"GET"`) and the endpoint (`"/${bucket}"`):

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

S3.list_objects("/your-bucket")
```

#### Documentation for High-Level APIs
```@contents
Pages = readdir("services"; join=true)
```
