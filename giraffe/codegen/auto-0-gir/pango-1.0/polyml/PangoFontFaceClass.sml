structure PangoFontFaceClass :>
  PANGO_FONT_FACE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font_face = unit
    type 'a class = 'a font_face class
  end
