structure GdkAxisUse :> GDK_AXIS_USE =
  struct
    datatype enum =
      IGNORE
    | X
    | Y
    | PRESSURE
    | XTILT
    | YTILT
    | WHEEL
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = IGNORE
        val toInt =
          fn
            IGNORE => 0
          | X => 1
          | Y => 2
          | PRESSURE => 3
          | XTILT => 4
          | YTILT => 5
          | WHEEL => 6
          | LAST => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => IGNORE
          | 1 => X
          | 2 => Y
          | 3 => PRESSURE
          | 4 => XTILT
          | 5 => YTILT
          | 6 => WHEEL
          | 7 => LAST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_axis_use_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
