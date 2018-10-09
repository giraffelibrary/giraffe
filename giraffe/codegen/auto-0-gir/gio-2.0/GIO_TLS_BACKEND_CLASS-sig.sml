signature GIO_TLS_BACKEND_CLASS =
  sig
    type 'a tls_backend
    include
      CLASS
        where type 'a class = 'a tls_backend GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
