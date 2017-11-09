signature GIO_D_BUS_AUTH_OBSERVER_CLASS =
  sig
    type 'a d_bus_auth_observer
    include
      CLASS
        where type 'a class = 'a d_bus_auth_observer GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
