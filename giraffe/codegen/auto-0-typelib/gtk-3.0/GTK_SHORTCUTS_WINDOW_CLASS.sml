signature GTK_SHORTCUTS_WINDOW_CLASS =
  sig
    type 'a shortcuts_window
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a shortcuts_window window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
