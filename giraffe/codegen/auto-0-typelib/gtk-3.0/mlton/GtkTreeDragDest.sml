structure GtkTreeDragDest :>
  GTK_TREE_DRAG_DEST
    where type 'a class = 'a GtkTreeDragDestClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_drag_dest_get_type" : unit -> GObjectType.C.val_;
    val dragDataReceived_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_drag_dest_drag_data_received" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val rowDropPossible_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_drag_dest_row_drop_possible" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkTreeDragDestClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dragDataReceived self dest selectionData =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkSelectionDataRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        dragDataReceived_
        (
          self
           & dest
           & selectionData
        )
    fun rowDropPossible self destPath selectionData =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkSelectionDataRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        rowDropPossible_
        (
          self
           & destPath
           & selectionData
        )
  end
