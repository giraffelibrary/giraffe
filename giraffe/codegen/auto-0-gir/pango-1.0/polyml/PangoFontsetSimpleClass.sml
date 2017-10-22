structure PangoFontsetSimpleClass :>
  PANGO_FONTSET_SIMPLE_CLASS
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type C.notnull = PangoFontsetClass.C.notnull
    where type 'a C.p = 'a PangoFontsetClass.C.p =
  struct
    type 'a fontset_class = 'a PangoFontsetClass.class
    open PangoFontsetClass
    type 'a fontset_simple = unit
    type 'a class = 'a fontset_simple class
  end
