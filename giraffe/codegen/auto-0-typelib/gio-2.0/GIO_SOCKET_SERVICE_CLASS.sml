signature GIO_SOCKET_SERVICE_CLASS =
  sig
    type 'a socket_service
    type 'a socket_listener_class
    include
      CLASS
        where type 'a class = 'a socket_service socket_listener_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
