structure PangoFontsetClass :>
  PANGO_FONTSET_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a fontset = unit
    type 'a class = 'a fontset class
  end
