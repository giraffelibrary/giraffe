signature GIO_TLS_CERTIFICATE_CLASS =
  sig
    type 'a tls_certificate
    include
      CLASS
        where type 'a class = 'a tls_certificate GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
