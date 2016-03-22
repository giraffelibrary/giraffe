signature GIO_UNIX_CONNECTION_CLASS =
  sig
    type 'a unix_connection
    type 'a socket_connection_class
    include
      CLASS
        where type 'a class = 'a unix_connection socket_connection_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
