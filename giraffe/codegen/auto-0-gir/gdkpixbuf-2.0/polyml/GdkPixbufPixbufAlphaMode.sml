structure GdkPixbufPixbufAlphaMode :> GDK_PIXBUF_PIXBUF_ALPHA_MODE =
  struct
    datatype enum =
      BILEVEL
    | FULL
    structure Enum =
      Enum(
        type enum = enum
        val null = BILEVEL
        val toInt =
          fn
            BILEVEL => 0
          | FULL => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => BILEVEL
          | 1 => FULL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_alpha_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
