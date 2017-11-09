structure GioSocketProtocol :> GIO_SOCKET_PROTOCOL =
  struct
    datatype enum =
      UNKNOWN
    | DEFAULT
    | TCP
    | UDP
    | SCTP
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => ~1
          | DEFAULT => 0
          | TCP => 6
          | UDP => 17
          | SCTP => 132
        exception Value of GInt32.t
        val fromInt =
          fn
            ~1 => UNKNOWN
          | 0 => DEFAULT
          | 6 => TCP
          | 17 => UDP
          | 132 => SCTP
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_socket_protocol_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
