structure PangoCairoFontClass :>
  PANGO_CAIRO_FONT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font = unit
    type 'a class = 'a font class
  end
