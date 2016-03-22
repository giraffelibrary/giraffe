signature GTK_RANGE_CLASS =
  sig
    type 'a range
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a range widget_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
