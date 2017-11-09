structure PangoRenderPart :> PANGO_RENDER_PART =
  struct
    datatype enum =
      FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    structure Enum =
      Enum(
        type enum = enum
        val null = FOREGROUND
        val toInt =
          fn
            FOREGROUND => 0
          | BACKGROUND => 1
          | UNDERLINE => 2
          | STRIKETHROUGH => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => FOREGROUND
          | 1 => BACKGROUND
          | 2 => UNDERLINE
          | 3 => STRIKETHROUGH
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_render_part_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
