structure GioDBusObjectManagerClass :>
  GIO_D_BUS_OBJECT_MANAGER_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_object_manager = unit
    type 'a class = 'a d_bus_object_manager class
  end
