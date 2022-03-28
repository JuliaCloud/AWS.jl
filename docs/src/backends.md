# Backends

AWS.jl supports two "backends" which serve as HTTP clients to reach the AWS REST API.

The backend can be specified in two ways: by setting the global [`AWS.DEFAULT_BACKEND`](@ref), or by setting the backend on a per-request basis by setting the `"backend"` key in `params` dictionaries:

```julia
using AWS
@service S3 use_response_type = true
result = S3.get_object(bucket, key, Dict("backend" => AWS.DownloadsBackend()))

```
Note: `use_response_type=true` is not needed here for the backend selection to work; it is just a recommended option in general. See [`@service`](@ref) for more.

```@docs
AWS.AbstractBackend
AWS.DEFAULT_BACKEND
AWS.HTTPBackend
AWS.DownloadsBackend
```
