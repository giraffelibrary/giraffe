signature GTK_COMBO_BOX_TEXT_CLASS =
  sig
    type 'a combo_box_text
    type 'a combo_box_class
    include
      CLASS
        where type 'a class = 'a combo_box_text combo_box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
