signature GIO_NETWORK_SERVICE_CLASS =
  sig
    type 'a network_service
    include
      CLASS
        where type 'a class = 'a network_service GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
