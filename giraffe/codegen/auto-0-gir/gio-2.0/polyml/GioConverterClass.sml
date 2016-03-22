structure GioConverterClass :>
  GIO_CONVERTER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a converter = unit
    type 'a class = 'a converter class
  end
