structure GioSocketType :> GIO_SOCKET_TYPE =
  struct
    datatype enum =
      INVALID
    | STREAM
    | DATAGRAM
    | SEQPACKET
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | STREAM => 1
          | DATAGRAM => 2
          | SEQPACKET => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => STREAM
          | 2 => DATAGRAM
          | 3 => SEQPACKET
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_socket_type_get_type" : unit -> GObjectType.FFI.val_;
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
