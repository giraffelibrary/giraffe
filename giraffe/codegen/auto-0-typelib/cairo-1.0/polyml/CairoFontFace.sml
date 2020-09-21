structure CairoFontFace :>
  CAIRO_FONT_FACE
    where type t = CairoFontFaceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "cairo_gobject_font_face_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoFontFaceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
