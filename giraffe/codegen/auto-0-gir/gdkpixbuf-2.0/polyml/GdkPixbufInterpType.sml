structure GdkPixbufInterpType :> GDK_PIXBUF_INTERP_TYPE =
  struct
    datatype enum =
      NEAREST
    | TILES
    | BILINEAR
    | HYPER
    structure Enum =
      Enum(
        type enum = enum
        val null = NEAREST
        val toInt =
          fn
            NEAREST => 0
          | TILES => 1
          | BILINEAR => 2
          | HYPER => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEAREST
          | 1 => TILES
          | 2 => BILINEAR
          | 3 => HYPER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_interp_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
