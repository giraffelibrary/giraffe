signature GIO_PROXY_CLASS =
  sig
    type 'a proxy
    include
      CLASS
        where type 'a class = 'a proxy GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
