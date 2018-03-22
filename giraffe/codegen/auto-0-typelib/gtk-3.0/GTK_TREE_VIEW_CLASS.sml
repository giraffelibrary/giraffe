signature GTK_TREE_VIEW_CLASS =
  sig
    type 'a tree_view
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a tree_view container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
