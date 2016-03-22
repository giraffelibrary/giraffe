structure PangoCairoFcFontMapClass :>
  PANGO_CAIRO_FC_FONT_MAP_CLASS
    where type C.notnull = PangoFontMapClass.C.notnull
    where type 'a C.p = 'a PangoFontMapClass.C.p =
  struct
    open PangoFontMapClass
    type 'a fc_font_map = unit
    type 'a class = 'a fc_font_map class
  end
