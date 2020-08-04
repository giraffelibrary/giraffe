structure GtkBooleanCellAccessible :>
  GTK_BOOLEAN_CELL_ACCESSIBLE
    where type 'a class = 'a GtkBooleanCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_boolean_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkBooleanCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
