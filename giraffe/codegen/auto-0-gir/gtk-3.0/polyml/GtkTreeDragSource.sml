structure GtkTreeDragSource :>
  GTK_TREE_DRAG_SOURCE
    where type 'a class_t = 'a GtkTreeDragSourceClass.t
    where type treepathrecord_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_drag_source_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val dragDataDelete_ = call (load_sym libgtk "gtk_tree_drag_source_drag_data_delete") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val rowDraggable_ = call (load_sym libgtk "gtk_tree_drag_source_row_draggable") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GtkTreeDragSourceClass.t
    type treepathrecord_t = GtkTreePathRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dragDataDelete self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) dragDataDelete_ (self & path)
    fun rowDraggable self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) rowDraggable_ (self & path)
  end
