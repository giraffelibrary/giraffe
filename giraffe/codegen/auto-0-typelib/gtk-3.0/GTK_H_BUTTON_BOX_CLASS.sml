signature GTK_H_BUTTON_BOX_CLASS =
  sig
    type 'a h_button_box
    type 'a button_box_class
    include
      CLASS
        where type 'a class = 'a h_button_box button_box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
