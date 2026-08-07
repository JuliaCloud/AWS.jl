# Determine if an exception is a HTTP connection failure. A connection-phase timeout surfaces
# as a `TimeoutError` with `operation` of "connect"/"tls_handshake".
is_connection_exception(e::HTTP.ConnectError) = true
is_connection_exception(e::HTTP.TimeoutError) = e.operation in ("connect", "tls_handshake")
is_connection_exception(e::Exception) = false

# https://github.com/JuliaCloud/AWS.jl/issues/654
# https://github.com/JuliaCloud/AWS.jl/issues/649
#
# A hop-limit rejection manifests as a read timeout. May surface as an `IOError` or
# a `HTTP.TimeoutError` whose `operation` is not "request_timeout", "read_idle_timeout"
# configured, as an `HTTP.TimeoutError` whose `operation` is not "connect"/"tls_handshake".
is_ttl_expired_exception(e::Base.IOError) = e == Base.IOError("read: connection timed out (ETIMEDOUT)", -110)
is_ttl_expired_exception(e::HTTP.TimeoutError) = !(e.operation in ("connect", "tls_handshake"))
is_ttl_expired_exception(e::Exception) = false
