signature GIO_TLS_BACKEND_CLASS =
  sig
    type 'a tls_backend
    include
      CLASS
        where type 'a class = 'a tls_backend GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
