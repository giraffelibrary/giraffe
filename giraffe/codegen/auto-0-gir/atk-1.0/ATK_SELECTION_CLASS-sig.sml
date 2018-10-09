signature ATK_SELECTION_CLASS =
  sig
    type 'a selection
    include
      CLASS
        where type 'a class = 'a selection GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
