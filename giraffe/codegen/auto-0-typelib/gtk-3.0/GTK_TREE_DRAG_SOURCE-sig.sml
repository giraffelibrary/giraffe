signature GTK_TREE_DRAG_SOURCE =
  sig
    type 'a class
    type tree_path_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val dragDataDelete :
      'a class
       -> tree_path_t
       -> bool
    val rowDraggable :
      'a class
       -> tree_path_t
       -> bool
  end
