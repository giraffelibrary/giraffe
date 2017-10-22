signature GTK_LEVEL_BAR_CLASS =
  sig
    type 'a level_bar
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a level_bar widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
