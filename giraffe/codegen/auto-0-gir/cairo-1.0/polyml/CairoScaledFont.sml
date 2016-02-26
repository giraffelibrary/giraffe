structure CairoScaledFont :>
  CAIRO_SCALED_FONT
    where type record_t = CairoScaledFontRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_scaled_font_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type record_t = CairoScaledFontRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
