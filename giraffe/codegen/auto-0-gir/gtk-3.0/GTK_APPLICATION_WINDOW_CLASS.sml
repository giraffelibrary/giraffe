signature GTK_APPLICATION_WINDOW_CLASS =
  sig
    type 'a application_window
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a application_window window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
