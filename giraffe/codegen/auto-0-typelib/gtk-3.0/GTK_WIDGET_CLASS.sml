signature GTK_WIDGET_CLASS =
  sig
    type 'a widget
    include
      CLASS
        where type 'a class = 'a widget GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
