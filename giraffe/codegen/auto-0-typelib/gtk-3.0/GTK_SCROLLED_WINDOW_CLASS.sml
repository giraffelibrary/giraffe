signature GTK_SCROLLED_WINDOW_CLASS =
  sig
    type 'a scrolled_window
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a scrolled_window bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
