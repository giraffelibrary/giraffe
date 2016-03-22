signature GIO_ICON_CLASS =
  sig
    type 'a icon
    include
      CLASS
        where type 'a class = 'a icon GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
