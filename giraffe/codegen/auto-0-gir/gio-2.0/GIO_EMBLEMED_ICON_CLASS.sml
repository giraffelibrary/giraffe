signature GIO_EMBLEMED_ICON_CLASS =
  sig
    type 'a emblemed_icon
    include
      CLASS
        where type 'a class = 'a emblemed_icon GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
