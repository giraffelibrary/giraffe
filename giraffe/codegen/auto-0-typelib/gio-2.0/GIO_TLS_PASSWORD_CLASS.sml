signature GIO_TLS_PASSWORD_CLASS =
  sig
    type 'a tls_password
    include
      CLASS
        where type 'a class = 'a tls_password GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
