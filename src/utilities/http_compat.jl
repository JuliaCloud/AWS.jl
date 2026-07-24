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
# Select the API era by HTTP's major version. HTTP.jl only defines its own
# `VERSION` constant in 2.x; in 1.x `HTTP.VERSION` is the binding re-exported from
# `Base` (Julia's version), so check that `VERSION` is actually owned by the `HTTP`
# module before trusting it — if it is not, we are on 1.x. (Don't key off the
# `HTTP.Exceptions` submodule either: 2.x re-adds it as a deprecating compat shim,
# JuliaWeb/HTTP.jl#1315, so its presence no longer distinguishes the versions.)
const _HTTP_V2 = Base.binding_module(HTTP, :VERSION) === HTTP && v"2" <= HTTP.VERSION < v"3"

@static if _HTTP_V2
    # `method`/`target` mirror the 1.x constructor arguments. On 2.x they are normally
    # carried by `response.request`, but 2.x's `Base.showerror(::StatusError)`
    # dereferences `response.request.method` unconditionally — so when the response
    # carries no request (e.g. one synthesized by the Downloads backend) attach a
    # minimal one to keep the error displayable.
    function _statuserror(status, method, target, response)
        if response.request === nothing
            response.request = HTTP.Request(
                isempty(method) ? "UNKNOWN" : String(method),
                isempty(target) ? "/" : String(target),
            )
        end
        return HTTP.StatusError(status, response)
    end

    # `true` when the response status is an error, mirroring 1.x's `HTTP.iserror`:
    # informational (100/101) and redirect statuses are not errors (AWS.jl follows
    # redirects itself in `submit_request`).
    function _http_iserror(r)
        status = r.status
        return status != 0 &&
               status != 100 &&
               status != 101 &&
               (status < 200 || status >= 300) &&
               !(status in (301, 302, 303, 307, 308))
    end

    # `true` when the response body itself carries the content. On 2.x the body is a
    # byte vector (or `nothing`); an empty/absent one means the content was streamed
    # elsewhere.
    _response_body_inline(x) = x !== nothing && !isempty(x)

    # Placeholder body for a response whose content was streamed elsewhere, such that
    # `_response_body_inline` classifies it as streamed.
    _streamed_body_placeholder() = UInt8[]

    # `true` when an exception indicates the endpoint could not be reached. On 2.x a
    # connection-phase timeout surfaces as `TimeoutError` (with `operation` of
    # "connect"/"tls_handshake") rather than `ConnectError`; read-phase timeouts
    # ("request", "response_header", "read_idle", ...) mean the endpoint was reached
    # and must not be classified as a connection failure.
    function _is_connection_failure(e)
        return e isa HTTP.ConnectError ||
               (e isa HTTP.TimeoutError && e.operation in ("connect", "tls_handshake"))
    end

    # `true` for transient transport/protocol failures that are safe to retry.
    # `HTTP.isrecoverable` is the documented 2.x replacement for 1.x's
    # `HTTP.RetryRequest.isrecoverable` / `RequestError` classification, but it
    # excludes `TimeoutError`; read-phase timeouts correspond to 1.x's
    # `RequestError(ReadTimeoutError)` and are equally transient.
    function _is_recoverable_request_error(e)
        return HTTP.isrecoverable(e) ||
               (e isa HTTP.TimeoutError && !_is_connection_failure(e))
    end

    # 1.x's `HTTP.resource`: the path/query/fragment portion of a URI, never empty.
    function _resource(uri)
        return string(
            isempty(uri.path) ? "/" : uri.path,
            isempty(uri.query) ? "" : "?",
            uri.query,
            isempty(uri.fragment) ? "" : "#",
            uri.fragment,
        )
    end
else
    function _statuserror(status, method, target, response)
        return HTTP.StatusError(status, method, target, response)
    end
    _http_iserror(r) = HTTP.iserror(r)
    _response_body_inline(x) = HTTP.isbytes(x)
    _streamed_body_placeholder() = IOBuffer()
    _is_connection_failure(e) = e isa HTTP.ConnectError
    _is_recoverable_request_error(e) = e isa HTTP.RequestError
    _resource(uri) = HTTP.resource(uri)
end
