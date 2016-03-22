signature GTK_SPIN_BUTTON_CLASS =
  sig
    type 'a spin_button
    type 'a entry_class
    include
      CLASS
        where type 'a class = 'a spin_button entry_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
