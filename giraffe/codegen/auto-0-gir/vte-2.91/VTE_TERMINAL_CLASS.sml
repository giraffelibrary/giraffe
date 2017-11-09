signature VTE_TERMINAL_CLASS =
  sig
    type 'a terminal
    include
      CLASS
        where type 'a class = 'a terminal Gtk.WidgetClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
