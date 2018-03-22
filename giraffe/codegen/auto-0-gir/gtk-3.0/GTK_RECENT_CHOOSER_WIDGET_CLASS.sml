signature GTK_RECENT_CHOOSER_WIDGET_CLASS =
  sig
    type 'a recent_chooser_widget
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a recent_chooser_widget box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
