signature GTK_HSV_CLASS =
  sig
    type 'a hsv
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a hsv widget_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
