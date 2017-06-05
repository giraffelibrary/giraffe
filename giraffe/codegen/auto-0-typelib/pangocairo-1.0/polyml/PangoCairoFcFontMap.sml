structure PangoCairoFcFontMap :>
  PANGO_CAIRO_FC_FONT_MAP
    where type 'a class = 'a PangoCairoFcFontMapClass.class
    where type 'a font_map_class = 'a PangoCairoFontMapClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_fc_font_map_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a PangoCairoFcFontMapClass.class
    type 'a font_map_class = 'a PangoCairoFontMapClass.class
    type t = base class
    fun asFontMap self = (GObjectObjectClass.FFI.withPtr ---> PangoCairoFontMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
