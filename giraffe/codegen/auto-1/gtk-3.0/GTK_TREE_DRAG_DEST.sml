signature GTK_TREE_DRAG_DEST =
  sig
    type 'a class_t
    type treepathrecord_t
    type selectiondatarecord_t
    val getType : unit -> GObject.Type.t
    val dragDataReceived :
      'a class_t
       -> treepathrecord_t
       -> selectiondatarecord_t
       -> bool
    val rowDropPossible :
      'a class_t
       -> treepathrecord_t
       -> selectiondatarecord_t
       -> bool
  end
