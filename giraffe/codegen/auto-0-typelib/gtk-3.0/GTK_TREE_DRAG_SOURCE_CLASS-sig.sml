signature GTK_TREE_DRAG_SOURCE_CLASS =
  sig
    type 'a tree_drag_source
    include
      CLASS
        where type 'a class = 'a tree_drag_source GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end