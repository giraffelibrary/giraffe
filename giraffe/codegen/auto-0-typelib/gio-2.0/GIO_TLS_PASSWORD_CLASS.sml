signature GIO_TLS_PASSWORD_CLASS =
  sig
    type 'a tls_password
    include
      CLASS
        where type 'a class = 'a tls_password GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
