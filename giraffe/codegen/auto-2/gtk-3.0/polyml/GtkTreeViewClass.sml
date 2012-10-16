structure GtkTreeViewClass :>
  GTK_TREE_VIEW_CLASS
    where type 'a containerclass_t = 'a GtkContainerClass.t
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a treeview = unit
    type 'a containerclass_t = 'a GtkContainerClass.t
    type 'a t = 'a treeview containerclass_t
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
