signature GTK_NUMERABLE_ICON_CLASS =
  sig
    type 'a numerable_icon
    include
      CLASS
        where type 'a class = 'a numerable_icon Gio.EmblemedIconClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
