structure GioSocketServiceClass :>
  GIO_SOCKET_SERVICE_CLASS
    where type 'a socket_listener_class = 'a GioSocketListenerClass.class
    where type C.notnull = GioSocketListenerClass.C.notnull
    where type 'a C.p = 'a GioSocketListenerClass.C.p =
  struct
    type 'a socket_listener_class = 'a GioSocketListenerClass.class
    open GioSocketListenerClass
    type 'a socket_service = unit
    type 'a class = 'a socket_service class
  end
