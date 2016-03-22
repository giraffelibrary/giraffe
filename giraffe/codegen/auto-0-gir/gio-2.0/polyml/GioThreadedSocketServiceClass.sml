structure GioThreadedSocketServiceClass :>
  GIO_THREADED_SOCKET_SERVICE_CLASS
    where type 'a socket_service_class = 'a GioSocketServiceClass.class
    where type C.notnull = GioSocketServiceClass.C.notnull
    where type 'a C.p = 'a GioSocketServiceClass.C.p =
  struct
    type 'a socket_service_class = 'a GioSocketServiceClass.class
    open GioSocketServiceClass
    type 'a threaded_socket_service = unit
    type 'a class = 'a threaded_socket_service class
  end
