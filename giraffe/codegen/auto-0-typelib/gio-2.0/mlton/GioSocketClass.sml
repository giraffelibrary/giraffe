structure GioSocketClass :>
  GIO_SOCKET_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket = unit
    type 'a class = 'a socket class
  end
