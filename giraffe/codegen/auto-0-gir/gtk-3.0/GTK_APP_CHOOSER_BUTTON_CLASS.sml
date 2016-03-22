signature GTK_APP_CHOOSER_BUTTON_CLASS =
  sig
    type 'a app_chooser_button
    type 'a combo_box_class
    include
      CLASS
        where type 'a class = 'a app_chooser_button combo_box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
