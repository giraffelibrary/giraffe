structure GtkTreeViewColumnClass :>
  GTK_TREE_VIEW_COLUMN_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a tree_view_column = unit
    type 'a class = 'a tree_view_column class
  end
