structure GioDBusActionGroupClass :>
  GIO_D_BUS_ACTION_GROUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_action_group = unit
    type 'a class = 'a d_bus_action_group class
  end
