signature GTK_CALENDAR_CLASS =
  sig
    type 'a calendar
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a calendar widget_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
