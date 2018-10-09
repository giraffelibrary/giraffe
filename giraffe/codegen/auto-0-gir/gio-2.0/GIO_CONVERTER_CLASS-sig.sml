signature GIO_CONVERTER_CLASS =
  sig
    type 'a converter
    include
      CLASS
        where type 'a class = 'a converter GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
