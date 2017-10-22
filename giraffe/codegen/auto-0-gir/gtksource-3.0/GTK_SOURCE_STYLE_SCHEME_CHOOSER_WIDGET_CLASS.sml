signature GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS =
  sig
    type 'a style_scheme_chooser_widget
    include
      CLASS
        where type 'a class = 'a style_scheme_chooser_widget Gtk.BinClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
