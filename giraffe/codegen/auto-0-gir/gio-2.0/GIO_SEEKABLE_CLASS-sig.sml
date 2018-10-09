signature GIO_SEEKABLE_CLASS =
  sig
    type 'a seekable
    include
      CLASS
        where type 'a class = 'a seekable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
