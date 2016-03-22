signature GIO_ASYNC_INITABLE_CLASS =
  sig
    type 'a async_initable
    include
      CLASS
        where type 'a class = 'a async_initable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
