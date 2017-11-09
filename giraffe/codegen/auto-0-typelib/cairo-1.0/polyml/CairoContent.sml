structure CairoContent :> CAIRO_CONTENT =
  struct
    datatype enum =
      COLOR
    | ALPHA
    | COLOR_ALPHA
    structure Enum =
      Enum(
        type enum = enum
        val null = COLOR
        val toInt =
          fn
            COLOR => 4096
          | ALPHA => 8192
          | COLOR_ALPHA => 12288
        exception Value of GInt32.t
        val fromInt =
          fn
            4096 => COLOR
          | 8192 => ALPHA
          | 12288 => COLOR_ALPHA
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_content_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
