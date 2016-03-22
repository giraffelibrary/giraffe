structure GtkTreeDragSourceClass :>
  GTK_TREE_DRAG_SOURCE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_drag_source = unit
    type 'a class = 'a tree_drag_source class
  end
