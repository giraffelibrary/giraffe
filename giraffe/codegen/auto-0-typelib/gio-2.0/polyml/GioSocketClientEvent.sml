structure GioSocketClientEvent :> GIO_SOCKET_CLIENT_EVENT =
  struct
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
    structure Enum =
      Enum(
        type enum = enum
        val null = RESOLVING
        val toInt =
          fn
            RESOLVING => 0
          | RESOLVED => 1
          | CONNECTING => 2
          | CONNECTED => 3
          | PROXY_NEGOTIATING => 4
          | PROXY_NEGOTIATED => 5
          | TLS_HANDSHAKING => 6
          | TLS_HANDSHAKED => 7
          | COMPLETE => 8
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => RESOLVING
          | 1 => RESOLVED
          | 2 => CONNECTING
          | 3 => CONNECTED
          | 4 => PROXY_NEGOTIATING
          | 5 => PROXY_NEGOTIATED
          | 6 => TLS_HANDSHAKING
          | 7 => TLS_HANDSHAKED
          | 8 => COMPLETE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_client_event_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
