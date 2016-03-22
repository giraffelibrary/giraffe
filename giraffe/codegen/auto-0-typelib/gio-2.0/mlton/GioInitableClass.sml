structure GioInitableClass :>
  GIO_INITABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a initable = unit
    type 'a class = 'a initable class
  end
