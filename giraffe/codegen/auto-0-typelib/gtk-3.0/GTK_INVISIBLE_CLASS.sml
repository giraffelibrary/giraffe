signature GTK_INVISIBLE_CLASS =
  sig
    type 'a invisible
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a invisible widget_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
