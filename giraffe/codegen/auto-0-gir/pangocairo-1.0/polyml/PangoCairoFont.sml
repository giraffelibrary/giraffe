structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class = 'a PangoCairoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_cairo_font_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getScaledFont_ = call (getSymbol "pango_cairo_font_get_scaled_font") (PangoCairoFontClass.PolyML.cPtr --> CairoScaledFontRecord.PolyML.cOptPtr)
    end
    type 'a class = 'a PangoCairoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getScaledFont self = (PangoCairoFontClass.FFI.withPtr ---> CairoScaledFontRecord.FFI.fromOptPtr true) getScaledFont_ self
  end
