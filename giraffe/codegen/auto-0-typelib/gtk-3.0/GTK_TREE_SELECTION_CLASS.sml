signature GTK_TREE_SELECTION_CLASS =
  sig
    type 'a tree_selection
    include
      CLASS
        where type 'a class = 'a tree_selection GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
