signature GTK_TREE_STORE_CLASS =
  sig
    type 'a tree_store
    include
      CLASS
        where type 'a class = 'a tree_store GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
