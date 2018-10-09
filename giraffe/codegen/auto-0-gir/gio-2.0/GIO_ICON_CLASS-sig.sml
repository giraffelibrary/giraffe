signature GIO_ICON_CLASS =
  sig
    type 'a icon
    include
      CLASS
        where type 'a class = 'a icon GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
