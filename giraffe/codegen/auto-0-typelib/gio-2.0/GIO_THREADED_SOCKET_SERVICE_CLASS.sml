signature GIO_THREADED_SOCKET_SERVICE_CLASS =
  sig
    type 'a threaded_socket_service
    type 'a socket_service_class
    include
      CLASS
        where type 'a class = 'a threaded_socket_service socket_service_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
