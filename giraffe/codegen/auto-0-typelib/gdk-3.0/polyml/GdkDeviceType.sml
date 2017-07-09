structure GdkDeviceType :> GDK_DEVICE_TYPE =
  struct
    datatype enum =
      MASTER
    | SLAVE
    | FLOATING
    structure Enum =
      Enum(
        type enum = enum
        val null = MASTER
        val toInt =
          fn
            MASTER => 0
          | SLAVE => 1
          | FLOATING => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => MASTER
          | 1 => SLAVE
          | 2 => FLOATING
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
