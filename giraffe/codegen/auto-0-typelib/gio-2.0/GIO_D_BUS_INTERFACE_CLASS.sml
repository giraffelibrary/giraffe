signature GIO_D_BUS_INTERFACE_CLASS =
  sig
    type 'a d_bus_interface
    include
      CLASS
        where type 'a class = 'a d_bus_interface GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
