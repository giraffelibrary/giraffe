structure PangoFontClass :>
  PANGO_FONT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font = unit
    type 'a class = 'a font class
  end
