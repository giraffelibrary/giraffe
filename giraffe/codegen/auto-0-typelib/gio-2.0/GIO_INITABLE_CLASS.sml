signature GIO_INITABLE_CLASS =
  sig
    type 'a initable
    include
      CLASS
        where type 'a class = 'a initable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
