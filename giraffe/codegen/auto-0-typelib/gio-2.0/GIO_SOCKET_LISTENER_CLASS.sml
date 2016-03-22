signature GIO_SOCKET_LISTENER_CLASS =
  sig
    type 'a socket_listener
    include
      CLASS
        where type 'a class = 'a socket_listener GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
