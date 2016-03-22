signature ATK_TEXT_CLASS =
  sig
    type 'a text
    include
      CLASS
        where type 'a class = 'a text GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
