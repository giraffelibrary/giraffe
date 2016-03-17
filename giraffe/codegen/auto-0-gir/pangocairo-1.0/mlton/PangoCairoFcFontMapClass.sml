structure PangoCairoFcFontMapClass :>
  PANGO_CAIRO_FC_FONT_MAP_CLASS
    where type C.notnull = PangoFontMapClass.C.notnull
    where type 'a C.p = 'a PangoFontMapClass.C.p =
  struct
    type 'a fc_font_map = unit
    type 'a class = 'a fc_font_map PangoFontMapClass.class
    type t = base class
    fun toBase obj = obj
    val t = PangoFontMapClass.t
    val tOpt = PangoFontMapClass.tOpt
    structure C = PangoFontMapClass.C
  end
