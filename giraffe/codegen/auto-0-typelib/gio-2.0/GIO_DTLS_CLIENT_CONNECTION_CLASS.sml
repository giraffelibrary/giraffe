signature GIO_DTLS_CLIENT_CONNECTION_CLASS =
  sig
    type 'a dtls_client_connection
    include
      CLASS
        where type 'a class = 'a dtls_client_connection GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
