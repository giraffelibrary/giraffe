structure GtkTextCellAccessible :>
  GTK_TEXT_CELL_ACCESSIBLE
    where type 'a class = 'a GtkTextCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_text_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkTextCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
