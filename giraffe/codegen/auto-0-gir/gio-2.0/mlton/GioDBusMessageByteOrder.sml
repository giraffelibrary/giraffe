structure GioDBusMessageByteOrder :> GIO_D_BUS_MESSAGE_BYTE_ORDER =
  struct
    datatype enum =
      BIG_ENDIAN
    | LITTLE_ENDIAN
    structure Enum =
      Enum(
        type enum = enum
        val null = BIG_ENDIAN
        val toInt =
          fn
            BIG_ENDIAN => 66
          | LITTLE_ENDIAN => 108
        exception Value of GInt.t
        val fromInt =
          fn
            66 => BIG_ENDIAN
          | 108 => LITTLE_ENDIAN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_dbus_message_byte_order_get_type" : unit -> GObjectType.FFI.val_;
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
