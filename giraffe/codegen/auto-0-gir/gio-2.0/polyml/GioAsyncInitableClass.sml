structure GioAsyncInitableClass :>
  GIO_ASYNC_INITABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a async_initable = unit
    type 'a class = 'a async_initable class
  end
