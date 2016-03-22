signature GIO_TLS_CLIENT_CONNECTION_CLASS =
  sig
    type 'a tls_client_connection
    include
      CLASS
        where type 'a class = 'a tls_client_connection GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
