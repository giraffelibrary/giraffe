signature GTK_TREE_DRAG_DEST =
  sig
    type 'a class_t
    type selection_data_record_t
    type tree_path_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val dragDataReceived :
      'a class_t
       -> tree_path_record_t
       -> selection_data_record_t
       -> bool
    val rowDropPossible :
      'a class_t
       -> tree_path_record_t
       -> selection_data_record_t
       -> bool
  end
