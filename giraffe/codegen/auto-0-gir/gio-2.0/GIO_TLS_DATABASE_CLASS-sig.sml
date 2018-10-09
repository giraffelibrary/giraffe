signature GIO_TLS_DATABASE_CLASS =
  sig
    type 'a tls_database
    include
      CLASS
        where type 'a class = 'a tls_database GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
