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
        exception Value of GInt.t
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
    val getType_ = _import "g_socket_client_event_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
