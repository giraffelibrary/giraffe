structure PangoCairoFcFontMap :>
  PANGO_CAIRO_FC_FONT_MAP
    where type 'a class_t = 'a PangoCairoFcFontMapClass.t
    where type 'a font_map_class_t = 'a PangoCairoFontMapClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_fc_font_map_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a PangoCairoFcFontMapClass.t
    type 'a font_map_class_t = 'a PangoCairoFontMapClass.t
    type t = base class_t
    fun asFontMap self = (GObjectObjectClass.C.withPtr ---> PangoCairoFontMapClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
