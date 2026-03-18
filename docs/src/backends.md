# Backends

AWS.jl supports two "backends" which serve as HTTP clients to reach the AWS REST API.

The backend can be specified in two ways: by setting the global [`AWS.DEFAULT_BACKEND`](@ref), or by setting the backend on a per-request basis by setting the `"backend"` key in `params` dictionaries:

```julia
using AWS
@service S3
result = S3.get_object(bucket, key, Dict("backend" => AWS.DownloadsBackend()))
```

```@docs
AWS.AbstractBackend
AWS.DEFAULT_BACKEND
AWS.HTTPBackend
AWS.DownloadsBackend
```
