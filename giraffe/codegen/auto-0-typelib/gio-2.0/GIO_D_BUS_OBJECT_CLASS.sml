signature GIO_D_BUS_OBJECT_CLASS =
  sig
    type 'a d_bus_object
    include
      CLASS
        where type 'a class = 'a d_bus_object GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
