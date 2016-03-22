structure GioProxyClass :>
  GIO_PROXY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a proxy = unit
    type 'a class = 'a proxy class
  end
