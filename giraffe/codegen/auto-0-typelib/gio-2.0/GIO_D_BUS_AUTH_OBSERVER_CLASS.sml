signature GIO_D_BUS_AUTH_OBSERVER_CLASS =
  sig
    type 'a d_bus_auth_observer
    include
      CLASS
        where type 'a class = 'a d_bus_auth_observer GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
