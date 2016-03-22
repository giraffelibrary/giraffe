structure GtkTreeSortableClass :>
  GTK_TREE_SORTABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_sortable = unit
    type 'a class = 'a tree_sortable class
  end
