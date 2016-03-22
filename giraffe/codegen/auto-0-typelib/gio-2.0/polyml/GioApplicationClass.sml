structure GioApplicationClass :>
  GIO_APPLICATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a application = unit
    type 'a class = 'a application class
  end
