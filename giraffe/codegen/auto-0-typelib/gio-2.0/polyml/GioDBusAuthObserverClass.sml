structure GioDBusAuthObserverClass :>
  GIO_D_BUS_AUTH_OBSERVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a d_bus_auth_observer = unit
    type 'a class = 'a d_bus_auth_observer class
  end
