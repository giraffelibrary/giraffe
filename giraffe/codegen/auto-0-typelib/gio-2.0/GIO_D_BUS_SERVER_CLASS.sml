signature GIO_D_BUS_SERVER_CLASS =
  sig
    type 'a d_bus_server
    include
      CLASS
        where type 'a class = 'a d_bus_server GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
