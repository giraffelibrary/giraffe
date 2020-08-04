structure GtkTreeDragSource :>
  GTK_TREE_DRAG_SOURCE
    where type 'a class = 'a GtkTreeDragSourceClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_drag_source_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val dragDataDelete_ = call (getSymbol "gtk_tree_drag_source_drag_data_delete") (GtkTreeDragSourceClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val rowDraggable_ = call (getSymbol "gtk_tree_drag_source_row_draggable") (GtkTreeDragSourceClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GtkTreeDragSourceClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dragDataDelete self path = (GtkTreeDragSourceClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) dragDataDelete_ (self & path)
    fun rowDraggable self path = (GtkTreeDragSourceClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) rowDraggable_ (self & path)
  end
