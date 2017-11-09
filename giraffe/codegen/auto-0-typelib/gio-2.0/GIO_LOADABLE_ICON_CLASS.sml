signature GIO_LOADABLE_ICON_CLASS =
  sig
    type 'a loadable_icon
    include
      CLASS
        where type 'a class = 'a loadable_icon GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
