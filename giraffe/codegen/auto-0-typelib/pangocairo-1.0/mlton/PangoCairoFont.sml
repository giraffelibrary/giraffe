structure PangoCairoFont :>
  PANGO_CAIRO_FONT
    where type 'a class = 'a PangoCairoFontClass.class =
  struct
    val getType_ = _import "pango_cairo_font_get_type" : unit -> GObjectType.FFI.val_;
    val getScaledFont_ = _import "pango_cairo_font_get_scaled_font" : PangoCairoFontClass.FFI.notnull PangoCairoFontClass.FFI.p -> unit CairoScaledFontRecord.FFI.p;
    type 'a class = 'a PangoCairoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getScaledFont self = (PangoCairoFontClass.FFI.withPtr ---> CairoScaledFontRecord.FFI.fromOptPtr true) getScaledFont_ self
  end
