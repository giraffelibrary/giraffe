signature GTK_V_BUTTON_BOX_CLASS =
  sig
    type 'a v_button_box
    type 'a button_box_class
    include
      CLASS
        where type 'a class = 'a v_button_box button_box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
