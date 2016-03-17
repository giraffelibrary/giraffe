structure GtkTreeViewColumnClass :>
  GTK_TREE_VIEW_COLUMN_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a tree_view_column = unit
    type 'a class = 'a tree_view_column GObjectInitiallyUnownedClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
