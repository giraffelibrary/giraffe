structure GioDBusProxyClass :>
  GIO_D_BUS_PROXY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_proxy = unit
    type 'a class = 'a d_bus_proxy class
  end
