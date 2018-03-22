signature GIO_D_BUS_CONNECTION_CLASS =
  sig
    type 'a d_bus_connection
    include
      CLASS
        where type 'a class = 'a d_bus_connection GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
