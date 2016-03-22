structure GioEmblemClass :>
  GIO_EMBLEM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a emblem = unit
    type 'a class = 'a emblem class
  end
