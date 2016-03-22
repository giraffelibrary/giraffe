structure GioDBusMessageClass :>
  GIO_D_BUS_MESSAGE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_message = unit
    type 'a class = 'a d_bus_message class
  end
