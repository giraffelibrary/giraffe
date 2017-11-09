signature GTK_PROGRESS_BAR_CLASS =
  sig
    type 'a progress_bar
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a progress_bar widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
