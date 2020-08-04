structure PangoCairoFcFontMap :>
  PANGO_CAIRO_FC_FONT_MAP
    where type 'a class = 'a PangoCairoFcFontMapClass.class
    where type 'a font_map_class = 'a PangoCairoFontMapClass.class =
  struct
    val getType_ = _import "pango_cairo_fc_font_map_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a PangoCairoFcFontMapClass.class
    type 'a font_map_class = 'a PangoCairoFontMapClass.class
    type t = base class
    fun asFontMap self = (GObjectObjectClass.FFI.withPtr false ---> PangoCairoFontMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
