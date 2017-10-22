structure GtkTreeViewAccessible :>
  GTK_TREE_VIEW_ACCESSIBLE
    where type 'a class = 'a GtkTreeViewAccessibleClass.class
    where type 'a cell_accessible_parent_class = 'a GtkCellAccessibleParentClass.class =
  struct
    val getType_ = _import "gtk_tree_view_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkTreeViewAccessibleClass.class
    type 'a cell_accessible_parent_class = 'a GtkCellAccessibleParentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr ---> AtkSelectionClass.FFI.fromPtr false) I self
    fun asTable self = (GObjectObjectClass.FFI.withPtr ---> AtkTableClass.FFI.fromPtr false) I self
    fun asCellAccessibleParent self = (GObjectObjectClass.FFI.withPtr ---> GtkCellAccessibleParentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
