structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class = 'a PangoCairoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getScaledFont_ = call (load_sym libpangocairo "pango_cairo_font_get_scaled_font") (GObjectObjectClass.PolyML.cPtr --> CairoScaledFontRecord.PolyML.cPtr)
    end
    type 'a class = 'a PangoCairoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getScaledFont self = (GObjectObjectClass.C.withPtr ---> CairoScaledFontRecord.C.fromPtr true) getScaledFont_ self
  end
