signature GTK_PLACES_SIDEBAR_CLASS =
  sig
    type 'a places_sidebar
    type 'a scrolled_window_class
    include
      CLASS
        where type 'a class = 'a places_sidebar scrolled_window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
