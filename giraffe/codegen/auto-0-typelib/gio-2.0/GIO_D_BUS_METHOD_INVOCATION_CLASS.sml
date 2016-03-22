signature GIO_D_BUS_METHOD_INVOCATION_CLASS =
  sig
    type 'a d_bus_method_invocation
    include
      CLASS
        where type 'a class = 'a d_bus_method_invocation GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
