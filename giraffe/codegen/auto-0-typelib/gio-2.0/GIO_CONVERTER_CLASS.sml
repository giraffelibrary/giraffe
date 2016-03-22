signature GIO_CONVERTER_CLASS =
  sig
    type 'a converter
    include
      CLASS
        where type 'a class = 'a converter GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
