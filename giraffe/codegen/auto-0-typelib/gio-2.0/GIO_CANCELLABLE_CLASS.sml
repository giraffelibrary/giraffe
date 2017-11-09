signature GIO_CANCELLABLE_CLASS =
  sig
    type 'a cancellable
    include
      CLASS
        where type 'a class = 'a cancellable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
