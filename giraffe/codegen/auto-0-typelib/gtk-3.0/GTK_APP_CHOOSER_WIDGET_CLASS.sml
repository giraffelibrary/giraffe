signature GTK_APP_CHOOSER_WIDGET_CLASS =
  sig
    type 'a app_chooser_widget
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a app_chooser_widget box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
