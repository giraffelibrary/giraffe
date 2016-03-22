structure GioDBusObjectManagerServerClass :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_object_manager_server = unit
    type 'a class = 'a d_bus_object_manager_server class
  end
