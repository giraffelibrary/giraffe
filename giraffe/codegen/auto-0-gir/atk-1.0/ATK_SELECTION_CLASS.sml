signature ATK_SELECTION_CLASS =
  sig
    type 'a selection
    include
      CLASS
        where type 'a class = 'a selection GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
