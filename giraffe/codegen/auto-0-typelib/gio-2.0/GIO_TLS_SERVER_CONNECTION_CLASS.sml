signature GIO_TLS_SERVER_CONNECTION_CLASS =
  sig
    type 'a tls_server_connection
    include
      CLASS
        where type 'a class = 'a tls_server_connection GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
