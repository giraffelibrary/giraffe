structure GioDBusMessageByteOrder :>
  sig
    include GIO_D_BUS_MESSAGE_BYTE_ORDER
  end =
  struct
    datatype t =
      BIGENDIAN
    | LITTLEENDIAN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            BIGENDIAN => f 66
          | LITTLEENDIAN => f 108
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            66 => BIGENDIAN
          | 108 => LITTLEENDIAN
          | n => raise Value n
      end
    val getType_ = _import "g_dbus_message_byte_order_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = BIGENDIAN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
