signature GIO_SOCKET_CLIENT_EVENT =
  sig
    datatype enum =
      RESOLVING
    | RESOLVED
    | CONNECTING
    | CONNECTED
    | PROXY_NEGOTIATING
    | PROXY_NEGOTIATED
    | TLS_HANDSHAKING
    | TLS_HANDSHAKED
    | COMPLETE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
