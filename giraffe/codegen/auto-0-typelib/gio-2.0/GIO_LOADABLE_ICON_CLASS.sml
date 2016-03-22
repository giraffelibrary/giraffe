signature GIO_LOADABLE_ICON_CLASS =
  sig
    type 'a loadable_icon
    include
      CLASS
        where type 'a class = 'a loadable_icon GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
