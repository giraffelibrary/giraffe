signature GTK_TREE_VIEW_COLUMN_CLASS =
  sig
    type 'a tree_view_column
    include
      CLASS
        where type 'a class = 'a tree_view_column GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
