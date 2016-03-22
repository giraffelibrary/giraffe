structure GioSocketListenerClass :>
  GIO_SOCKET_LISTENER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket_listener = unit
    type 'a class = 'a socket_listener class
  end
