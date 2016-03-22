signature GTK_SCALE_BUTTON_CLASS =
  sig
    type 'a scale_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a scale_button button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
