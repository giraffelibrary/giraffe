signature GTK_SHORTCUTS_SHORTCUT_CLASS =
  sig
    type 'a shortcuts_shortcut
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a shortcuts_shortcut box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
