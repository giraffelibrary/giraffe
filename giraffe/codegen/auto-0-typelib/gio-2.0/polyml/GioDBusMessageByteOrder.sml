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
        exception Value of GInt32.t
        val fromInt =
          fn
            66 => BIG_ENDIAN
          | 108 => LITTLE_ENDIAN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_message_byte_order_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
