structure GtkTreeViewClass :>
  GTK_TREE_VIEW_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a container_class = 'a GtkContainerClass.class
    open GtkContainerClass
    type 'a tree_view = unit
    type 'a class = 'a tree_view class
  end
