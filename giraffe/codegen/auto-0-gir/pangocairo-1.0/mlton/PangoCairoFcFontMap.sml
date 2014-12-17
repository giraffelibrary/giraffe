structure PangoCairoFcFontMap :>
  PANGO_CAIRO_FC_FONT_MAP
    where type 'a class_t = 'a PangoCairoFcFontMapClass.t
    where type 'a fontmapclass_t = 'a PangoCairoFontMapClass.t =
  struct
    val getType_ = _import "pango_cairo_fc_font_map_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a PangoCairoFcFontMapClass.t
    type 'a fontmapclass_t = 'a PangoCairoFontMapClass.t
    type t = base class_t
    fun asFontMap self = (GObjectObjectClass.C.withPtr ---> PangoCairoFontMapClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
