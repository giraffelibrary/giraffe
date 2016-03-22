signature GTK_TREE_DRAG_DEST_CLASS =
  sig
    type 'a tree_drag_dest
    include
      CLASS
        where type 'a class = 'a tree_drag_dest GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
