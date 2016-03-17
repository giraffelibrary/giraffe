structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class = 'a PangoCairoFontClass.class =
  struct
    val getType_ = _import "pango_cairo_font_get_type" : unit -> GObjectType.C.val_;
    val getScaledFont_ = _import "pango_cairo_font_get_scaled_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoScaledFontRecord.C.notnull CairoScaledFontRecord.C.p;
    type 'a class = 'a PangoCairoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getScaledFont self = (GObjectObjectClass.C.withPtr ---> CairoScaledFontRecord.C.fromPtr true) getScaledFont_ self
  end
