signature GIO_RESOLVER_CLASS =
  sig
    type 'a resolver
    include
      CLASS
        where type 'a class = 'a resolver GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
