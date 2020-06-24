structure GtkTreeDragSource :>
  GTK_TREE_DRAG_SOURCE
    where type 'a class = 'a GtkTreeDragSourceClass.class
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_drag_source_get_type" : unit -> GObjectType.FFI.val_;
    val dragDataDelete_ = fn x1 & x2 => (_import "gtk_tree_drag_source_drag_data_delete" : GtkTreeDragSourceClass.FFI.non_opt GtkTreeDragSourceClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val rowDraggable_ = fn x1 & x2 => (_import "gtk_tree_drag_source_row_draggable" : GtkTreeDragSourceClass.FFI.non_opt GtkTreeDragSourceClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GtkTreeDragSourceClass.class
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dragDataDelete self path = (GtkTreeDragSourceClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) dragDataDelete_ (self & path)
    fun rowDraggable self path = (GtkTreeDragSourceClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) rowDraggable_ (self & path)
  end
