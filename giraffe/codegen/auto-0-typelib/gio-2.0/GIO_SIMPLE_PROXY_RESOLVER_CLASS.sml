signature GIO_SIMPLE_PROXY_RESOLVER_CLASS =
  sig
    type 'a simple_proxy_resolver
    include
      CLASS
        where type 'a class = 'a simple_proxy_resolver GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
