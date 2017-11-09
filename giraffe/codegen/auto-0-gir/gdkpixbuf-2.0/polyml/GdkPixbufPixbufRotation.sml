structure GdkPixbufPixbufRotation :> GDK_PIXBUF_PIXBUF_ROTATION =
  struct
    datatype enum =
      NONE
    | COUNTERCLOCKWISE
    | UPSIDEDOWN
    | CLOCKWISE
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | COUNTERCLOCKWISE => 90
          | UPSIDEDOWN => 180
          | CLOCKWISE => 270
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 90 => COUNTERCLOCKWISE
          | 180 => UPSIDEDOWN
          | 270 => CLOCKWISE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_rotation_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
