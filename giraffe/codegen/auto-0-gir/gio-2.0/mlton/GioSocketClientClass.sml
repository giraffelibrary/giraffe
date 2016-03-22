structure GioSocketClientClass :>
  GIO_SOCKET_CLIENT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket_client = unit
    type 'a class = 'a socket_client class
  end
