structure GtkListBoxRowAccessible :>
  GTK_LIST_BOX_ROW_ACCESSIBLE
    where type 'a class = 'a GtkListBoxRowAccessibleClass.class =
  struct
    val getType_ = _import "gtk_list_box_row_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkListBoxRowAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
