signature GIO_CHARSET_CONVERTER_CLASS =
  sig
    type 'a charset_converter
    include
      CLASS
        where type 'a class = 'a charset_converter GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
