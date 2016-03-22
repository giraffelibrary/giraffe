signature GIO_THEMED_ICON_CLASS =
  sig
    type 'a themed_icon
    include
      CLASS
        where type 'a class = 'a themed_icon GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
