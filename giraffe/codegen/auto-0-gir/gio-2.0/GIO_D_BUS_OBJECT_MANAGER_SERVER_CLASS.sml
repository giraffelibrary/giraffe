signature GIO_D_BUS_OBJECT_MANAGER_SERVER_CLASS =
  sig
    type 'a d_bus_object_manager_server
    include
      CLASS
        where type 'a class = 'a d_bus_object_manager_server GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
