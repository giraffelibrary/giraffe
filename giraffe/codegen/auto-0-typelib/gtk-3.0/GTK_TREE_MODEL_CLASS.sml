signature GTK_TREE_MODEL_CLASS =
  sig
    type 'a tree_model
    include
      CLASS
        where type 'a class = 'a tree_model GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
