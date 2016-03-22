signature GIO_EMBLEM_CLASS =
  sig
    type 'a emblem
    include
      CLASS
        where type 'a class = 'a emblem GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
