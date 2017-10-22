signature GTK_ICON_INFO_CLASS =
  sig
    type 'a icon_info
    include
      CLASS
        where type 'a class = 'a icon_info GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
