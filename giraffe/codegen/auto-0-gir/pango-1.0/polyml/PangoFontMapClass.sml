structure PangoFontMapClass :>
  PANGO_FONT_MAP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font_map = unit
    type 'a class = 'a font_map class
  end
