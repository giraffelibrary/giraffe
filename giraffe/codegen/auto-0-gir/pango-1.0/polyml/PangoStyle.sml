structure PangoStyle :> PANGO_STYLE =
  struct
    datatype enum =
      NORMAL
    | OBLIQUE
    | ITALIC
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | OBLIQUE => 1
          | ITALIC => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => OBLIQUE
          | 2 => ITALIC
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
