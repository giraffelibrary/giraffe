signature GTK_OFFSCREEN_WINDOW_CLASS =
  sig
    type 'a offscreen_window
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a offscreen_window window_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
