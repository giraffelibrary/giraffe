signature GIO_SOCKET_CONNECTABLE_CLASS =
  sig
    type 'a socket_connectable
    include
      CLASS
        where type 'a class = 'a socket_connectable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
