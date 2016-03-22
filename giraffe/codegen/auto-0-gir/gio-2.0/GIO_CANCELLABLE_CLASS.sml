signature GIO_CANCELLABLE_CLASS =
  sig
    type 'a cancellable
    include
      CLASS
        where type 'a class = 'a cancellable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
