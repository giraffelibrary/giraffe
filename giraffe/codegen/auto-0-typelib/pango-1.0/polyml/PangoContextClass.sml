structure PangoContextClass :>
  PANGO_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a context = unit
    type 'a class = 'a context class
  end
