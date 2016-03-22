signature GIO_TLS_CERTIFICATE_CLASS =
  sig
    type 'a tls_certificate
    include
      CLASS
        where type 'a class = 'a tls_certificate GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
