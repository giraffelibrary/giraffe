structure GdkDevicePadFeature :> GDK_DEVICE_PAD_FEATURE =
  struct
    datatype enum =
      BUTTON
    | RING
    | STRIP
    structure Enum =
      Enum(
        type enum = enum
        val null = BUTTON
        val toInt =
          fn
            BUTTON => 0
          | RING => 1
          | STRIP => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BUTTON
          | 1 => RING
          | 2 => STRIP
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_pad_feature_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
