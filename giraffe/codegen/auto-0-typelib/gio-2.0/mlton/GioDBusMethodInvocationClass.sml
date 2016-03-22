structure GioDBusMethodInvocationClass :>
  GIO_D_BUS_METHOD_INVOCATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_method_invocation = unit
    type 'a class = 'a d_bus_method_invocation class
  end
