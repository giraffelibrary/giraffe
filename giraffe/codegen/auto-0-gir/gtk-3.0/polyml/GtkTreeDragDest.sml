structure GtkTreeDragDest :>
  GTK_TREE_DRAG_DEST
    where type 'a class = 'a GtkTreeDragDestClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_drag_dest_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val dragDataReceived_ =
        call (getSymbol "gtk_tree_drag_dest_drag_data_received")
          (
            GtkTreeDragDestClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkSelectionDataRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val rowDropPossible_ =
        call (getSymbol "gtk_tree_drag_dest_row_drop_possible")
          (
            GtkTreeDragDestClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkSelectionDataRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkTreeDragDestClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dragDataReceived self (dest, selectionData) =
      (
        GtkTreeDragDestClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkSelectionDataRecord.FFI.withPtr
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
        GtkTreeDragDestClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkSelectionDataRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        rowDropPossible_
        (
          self
           & destPath
           & selectionData
        )
  end
