signature GTK_VOLUME_BUTTON_CLASS =
  sig
    type 'a volume_button
    type 'a scale_button_class
    include
      CLASS
        where type 'a class = 'a volume_button scale_button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
