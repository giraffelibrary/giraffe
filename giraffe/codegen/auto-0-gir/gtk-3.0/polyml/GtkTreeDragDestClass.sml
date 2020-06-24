structure GtkTreeDragDestClass :>
  GTK_TREE_DRAG_DEST_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_drag_dest = unit
    type 'a class = 'a tree_drag_dest class
  end
