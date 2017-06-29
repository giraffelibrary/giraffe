structure GdkByteOrder :> GDK_BYTE_ORDER =
  struct
    datatype enum =
      LSB_FIRST
    | MSB_FIRST
    structure Enum =
      Enum(
        type enum = enum
        val null = LSB_FIRST
        val toInt =
          fn
            LSB_FIRST => 0
          | MSB_FIRST => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LSB_FIRST
          | 1 => MSB_FIRST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_byte_order_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
