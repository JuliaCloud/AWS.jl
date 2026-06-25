# Compatibility shims bridging HTTP.jl 1.x and 2.x.
#
# HTTP 2.0 is a breaking release which, among other changes relevant to AWS.jl:
# - deprecated the `HTTP.Exceptions` submodule (`StatusError`/`ConnectError` remain
#   available at the top level in both versions; note 2.x later re-added
#   `HTTP.Exceptions` as a deprecating compat shim — JuliaWeb/HTTP.jl#1315 — so it
#   can no longer be used to tell the two versions apart),
# - removed the `RequestError` type (transient request-path failures now surface
#   as the underlying exception),
# - removed the `iserror`, `isbytes`, and `resource` helpers,
# - changed the `StatusError` constructor from `(status, method, target, response)`
#   to `(status, response)`, and
# - buffers response bodies as `Vector{UInt8}` (1.x exposed a stream object when a
#   `response_stream` was supplied) and raises `TimeoutError` (not `ConnectError`)
#   when a connection attempt times out.
#
# Detect the HTTP 2.x line by package version (robust). Fall back to feature
# detection only when `pkgversion` is unavailable (Julia < 1.9, or some
# non-registry loads). Do NOT key off the `HTTP.Exceptions` submodule: 2.x
# re-adds it as a deprecating compat shim (JuliaWeb/HTTP.jl#1315), so its presence
# no longer distinguishes the versions. `HTTP.EmptyBody` is a genuine 2.x-only type.
@static if VERSION >= v"1.9"
    const _HTTP_V2 = let v = pkgversion(HTTP)
        v === nothing ? isdefined(HTTP, :EmptyBody) : v >= v"2"
    end
else
    const _HTTP_V2 = isdefined(HTTP, :EmptyBody)
end

@static if _HTTP_V2
    # `method`/`target` are accepted for call-site symmetry with 1.x; on 2.x they
    # are carried by `response.request`.
    _statuserror(status, method, target, response) = HTTP.StatusError(status, response)

    # `true` when the response status is not a 2xx success code.
    _http_iserror(r) = r.status < 200 || r.status >= 300

    # `true` when the response body itself carries the content. On 2.x the body is a
    # byte vector (or `nothing`); an empty/absent one means the content was streamed
    # elsewhere.
    _response_body_inline(x) = x !== nothing && !isempty(x)

    # `true` for transient transport/protocol failures that are safe to retry.
    # `HTTP.isrecoverable` is the documented 2.x replacement for 1.x's
    # `HTTP.RetryRequest.isrecoverable` / `RequestError` classification.
    _is_recoverable_request_error(e) = HTTP.isrecoverable(e)

    # `true` when an exception indicates the endpoint could not be reached. On 2.x a
    # connection timeout surfaces as `TimeoutError` rather than `ConnectError`.
    _is_connection_failure(e) = e isa HTTP.ConnectError || e isa HTTP.TimeoutError
else
    function _statuserror(status, method, target, response)
        return HTTP.StatusError(status, method, target, response)
    end
    _http_iserror(r) = HTTP.iserror(r)
    _response_body_inline(x) = HTTP.isbytes(x)
    _is_recoverable_request_error(e) = e isa HTTP.RequestError
    _is_connection_failure(e) = e isa HTTP.ConnectError
end
