structure GtkTreeDragSource :>
  GTK_TREE_DRAG_SOURCE
    where type 'a class = 'a GtkTreeDragSourceClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_drag_source_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val dragDataDelete_ = call (load_sym libgtk "gtk_tree_drag_source_drag_data_delete") (GtkTreeDragSourceClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val rowDraggable_ = call (load_sym libgtk "gtk_tree_drag_source_row_draggable") (GtkTreeDragSourceClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GtkTreeDragSourceClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dragDataDelete self path = (GtkTreeDragSourceClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) dragDataDelete_ (self & path)
    fun rowDraggable self path = (GtkTreeDragSourceClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) rowDraggable_ (self & path)
  end
