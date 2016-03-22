signature GTK_TREE_VIEW_COLUMN_CLASS =
  sig
    type 'a tree_view_column
    include
      CLASS
        where type 'a class = 'a tree_view_column GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
