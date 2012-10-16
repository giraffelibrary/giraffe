structure GtkTreeDragSource :>
  GTK_TREE_DRAG_SOURCE
    where type 'a class_t = 'a GtkTreeDragSourceClass.t
    where type treepathrecord_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_drag_source_get_type" : unit -> GObjectType.C.val_;
    val dragDataDelete_ = fn x1 & x2 => (_import "gtk_tree_drag_source_drag_data_delete" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.val_;) (x1, x2)
    val rowDraggable_ = fn x1 & x2 => (_import "gtk_tree_drag_source_row_draggable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.val_;) (x1, x2)
    type 'a class_t = 'a GtkTreeDragSourceClass.t
    type treepathrecord_t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun dragDataDelete self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) dragDataDelete_ (self & path)
    fun rowDraggable self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) rowDraggable_ (self & path)
  end
