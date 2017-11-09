signature GTK_BUTTON_BOX_CLASS =
  sig
    type 'a button_box
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a button_box box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
