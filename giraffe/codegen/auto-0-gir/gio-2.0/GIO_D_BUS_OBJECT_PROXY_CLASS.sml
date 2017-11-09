signature GIO_D_BUS_OBJECT_PROXY_CLASS =
  sig
    type 'a d_bus_object_proxy
    include
      CLASS
        where type 'a class = 'a d_bus_object_proxy GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
