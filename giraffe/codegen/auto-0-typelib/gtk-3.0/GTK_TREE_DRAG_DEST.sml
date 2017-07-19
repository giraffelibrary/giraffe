signature GTK_TREE_DRAG_DEST =
  sig
    type 'a class
    type selection_data_t
    type tree_path_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val dragDataReceived :
      'a class
       -> tree_path_t * selection_data_t
       -> bool
    val rowDropPossible :
      'a class
       -> tree_path_t * selection_data_t
       -> bool
  end
