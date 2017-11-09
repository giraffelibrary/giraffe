structure PangoDirection :> PANGO_DIRECTION =
  struct
    datatype enum =
      LTR
    | RTL
    | TTB_LTR
    | TTB_RTL
    | WEAK_LTR
    | WEAK_RTL
    | NEUTRAL
    structure Enum =
      Enum(
        type enum = enum
        val null = LTR
        val toInt =
          fn
            LTR => 0
          | RTL => 1
          | TTB_LTR => 2
          | TTB_RTL => 3
          | WEAK_LTR => 4
          | WEAK_RTL => 5
          | NEUTRAL => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTB_LTR
          | 3 => TTB_RTL
          | 4 => WEAK_LTR
          | 5 => WEAK_RTL
          | 6 => NEUTRAL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_direction_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
