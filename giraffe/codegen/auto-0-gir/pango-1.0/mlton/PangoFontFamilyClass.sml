structure PangoFontFamilyClass :>
  PANGO_FONT_FAMILY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font_family = unit
    type 'a class = 'a font_family class
  end
