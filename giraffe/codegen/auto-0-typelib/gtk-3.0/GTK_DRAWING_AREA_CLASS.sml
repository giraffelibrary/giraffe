signature GTK_DRAWING_AREA_CLASS =
  sig
    type 'a drawing_area
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a drawing_area widget_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
