signature GTK_TEXT_MARK_CLASS =
  sig
    type 'a text_mark
    include
      CLASS
        where type 'a class = 'a text_mark GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
