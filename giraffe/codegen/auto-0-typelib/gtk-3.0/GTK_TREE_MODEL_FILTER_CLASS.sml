signature GTK_TREE_MODEL_FILTER_CLASS =
  sig
    type 'a tree_model_filter
    include
      CLASS
        where type 'a class = 'a tree_model_filter GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
