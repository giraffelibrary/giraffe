signature GIO_PROXY_RESOLVER_CLASS =
  sig
    type 'a proxy_resolver
    include
      CLASS
        where type 'a class = 'a proxy_resolver GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
