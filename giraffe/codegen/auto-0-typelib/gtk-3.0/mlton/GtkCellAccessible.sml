structure GtkCellAccessible :>
  GTK_CELL_ACCESSIBLE
    where type 'a class = 'a GtkCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
