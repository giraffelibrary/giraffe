structure GdkPropertyState :> GDK_PROPERTY_STATE =
  struct
    datatype enum =
      NEW_VALUE
    | DELETE
    structure Enum =
      Enum(
        type enum = enum
        val null = NEW_VALUE
        val toInt =
          fn
            NEW_VALUE => 0
          | DELETE => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEW_VALUE
          | 1 => DELETE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_property_state_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
