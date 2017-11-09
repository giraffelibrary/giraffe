signature GTK_TEXT_TAG_CLASS =
  sig
    type 'a text_tag
    include
      CLASS
        where type 'a class = 'a text_tag GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
