structure GioDBusInterfaceClass :>
  GIO_D_BUS_INTERFACE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_interface = unit
    type 'a class = 'a d_bus_interface class
  end
