signature GTK_TREE_SORTABLE_CLASS =
  sig
    type 'a tree_sortable
    include
      CLASS
        where type 'a class = 'a tree_sortable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
