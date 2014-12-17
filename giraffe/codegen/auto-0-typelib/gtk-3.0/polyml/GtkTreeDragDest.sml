structure GtkTreeDragDest :>
  GTK_TREE_DRAG_DEST
    where type 'a class_t = 'a GtkTreeDragDestClass.t
    where type selectiondatarecord_t = GtkSelectionDataRecord.t
    where type treepathrecord_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_drag_dest_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val dragDataReceived_ =
        call (load_sym libgtk "gtk_tree_drag_dest_drag_data_received")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GtkSelectionDataRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val rowDropPossible_ =
        call (load_sym libgtk "gtk_tree_drag_dest_row_drop_possible")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GtkSelectionDataRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GtkTreeDragDestClass.t
    type selectiondatarecord_t = GtkSelectionDataRecord.t
    type treepathrecord_t = GtkTreePathRecord.t
    type t = base class_t
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
