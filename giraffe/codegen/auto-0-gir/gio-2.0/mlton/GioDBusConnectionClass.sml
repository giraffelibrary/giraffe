structure GioDBusConnectionClass :>
  GIO_D_BUS_CONNECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_connection = unit
    type 'a class = 'a d_bus_connection class
  end
