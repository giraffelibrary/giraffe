structure PangoEngineClass :>
  PANGO_ENGINE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a engine = unit
    type 'a class = 'a engine class
  end
