structure GtkTreeViewClass :>
  GTK_TREE_VIEW_CLASS
    where type 'a container_class_t = 'a GtkContainerClass.t
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a tree_view = unit
    type 'a container_class_t = 'a GtkContainerClass.t
    type 'a t = 'a tree_view container_class_t
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
