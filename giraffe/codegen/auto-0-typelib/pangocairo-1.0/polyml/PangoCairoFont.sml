structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class_t = 'a PangoCairoFontClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getScaledFont_ = call (load_sym libpangocairo "pango_cairo_font_get_scaled_font") (GObjectObjectClass.PolyML.PTR --> CairoScaledFontRecord.PolyML.PTR)
    end
    type 'a class_t = 'a PangoCairoFontClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getScaledFont self = (GObjectObjectClass.C.withPtr ---> CairoScaledFontRecord.C.fromPtr true) getScaledFont_ self
  end
