signature GTK_TREE_DRAG_SOURCE =
  sig
    type 'a class_t
    type treepathrecord_t
    val getType : unit -> GObject.Type.t
    val dragDataDelete :
      'a class_t
       -> treepathrecord_t
       -> bool
    val rowDraggable :
      'a class_t
       -> treepathrecord_t
       -> bool
  end
