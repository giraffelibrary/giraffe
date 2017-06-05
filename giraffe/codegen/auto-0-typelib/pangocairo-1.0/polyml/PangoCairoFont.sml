structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class = 'a PangoCairoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getScaledFont_ = call (load_sym libpangocairo "pango_cairo_font_get_scaled_font") (PangoCairoFontClass.PolyML.cPtr --> CairoScaledFontRecord.PolyML.cPtr)
    end
    type 'a class = 'a PangoCairoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getScaledFont self = (PangoCairoFontClass.FFI.withPtr ---> CairoScaledFontRecord.FFI.fromPtr true) getScaledFont_ self
  end
