signature GTK_TREE_SORTABLE_CLASS =
  sig
    type 'a tree_sortable
    include
      CLASS
        where type 'a class = 'a tree_sortable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
