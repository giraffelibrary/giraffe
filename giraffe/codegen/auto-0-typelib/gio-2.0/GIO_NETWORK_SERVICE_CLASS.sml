signature GIO_NETWORK_SERVICE_CLASS =
  sig
    type 'a network_service
    include
      CLASS
        where type 'a class = 'a network_service GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
