signature ATK_EDITABLE_TEXT_CLASS =
  sig
    type 'a editable_text
    include
      CLASS
        where type 'a class = 'a editable_text GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
