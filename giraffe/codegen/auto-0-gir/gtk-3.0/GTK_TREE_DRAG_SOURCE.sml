signature GTK_TREE_DRAG_SOURCE =
  sig
    type 'a class_t
    type tree_path_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val dragDataDelete :
      'a class_t
       -> tree_path_record_t
       -> bool
    val rowDraggable :
      'a class_t
       -> tree_path_record_t
       -> bool
  end
