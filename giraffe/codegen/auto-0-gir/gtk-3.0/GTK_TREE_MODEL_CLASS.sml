signature GTK_TREE_MODEL_CLASS =
  sig
    type 'a tree_model
    include
      CLASS
        where type 'a class = 'a tree_model GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
