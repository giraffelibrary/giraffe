structure PangoUnderline :> PANGO_UNDERLINE =
  struct
    datatype enum =
      NONE
    | SINGLE
    | DOUBLE
    | LOW
    | ERROR
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | SINGLE => 1
          | DOUBLE => 2
          | LOW => 3
          | ERROR => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => SINGLE
          | 2 => DOUBLE
          | 3 => LOW
          | 4 => ERROR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_underline_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
