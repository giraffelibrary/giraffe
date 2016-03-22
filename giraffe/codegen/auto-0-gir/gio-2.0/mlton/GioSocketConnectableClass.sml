structure GioSocketConnectableClass :>
  GIO_SOCKET_CONNECTABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket_connectable = unit
    type 'a class = 'a socket_connectable class
  end
