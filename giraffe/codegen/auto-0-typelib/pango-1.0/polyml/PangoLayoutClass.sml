structure PangoLayoutClass :>
  PANGO_LAYOUT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a layout = unit
    type 'a class = 'a layout class
  end
