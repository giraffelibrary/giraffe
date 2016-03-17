structure GioUnixConnectionClass :>
  GIO_UNIX_CONNECTION_CLASS
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a unix_connection = unit
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a class = 'a unix_connection socket_connection_class
    type t = base class
    fun toBase obj = obj
    val t = GioSocketConnectionClass.t
    val tOpt = GioSocketConnectionClass.tOpt
    structure C = GioSocketConnectionClass.C
  end
