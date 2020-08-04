structure GtkTreeDragDest :>
  GTK_TREE_DRAG_DEST
    where type 'a class = 'a GtkTreeDragDestClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_drag_dest_get_type" : unit -> GObjectType.FFI.val_;
    val dragDataReceived_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_drag_dest_drag_data_received" :
              GtkTreeDragDestClass.FFI.non_opt GtkTreeDragDestClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkSelectionDataRecord.FFI.non_opt GtkSelectionDataRecord.FFI.p
               -> GBool.FFI.val_;
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
              GtkTreeDragDestClass.FFI.non_opt GtkTreeDragDestClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkSelectionDataRecord.FFI.non_opt GtkSelectionDataRecord.FFI.p
               -> GBool.FFI.val_;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dragDataReceived self (dest, selectionData) =
      (
        GtkTreeDragDestClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkSelectionDataRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        dragDataReceived_
        (
          self
           & dest
           & selectionData
        )
    fun rowDropPossible self (destPath, selectionData) =
      (
        GtkTreeDragDestClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkSelectionDataRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        rowDropPossible_
        (
          self
           & destPath
           & selectionData
        )
  end
