signature GTK_TEXT_CHILD_ANCHOR_CLASS =
  sig
    type 'a text_child_anchor
    include
      CLASS
        where type 'a class = 'a text_child_anchor GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
