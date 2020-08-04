structure GtkMenuAccessible :>
  GTK_MENU_ACCESSIBLE
    where type 'a class = 'a GtkMenuAccessibleClass.class =
  struct
    val getType_ = _import "gtk_menu_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkMenuAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr false ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
