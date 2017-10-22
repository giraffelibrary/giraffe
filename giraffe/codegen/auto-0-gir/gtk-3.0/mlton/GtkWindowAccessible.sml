structure GtkWindowAccessible :>
  GTK_WINDOW_ACCESSIBLE
    where type 'a class = 'a GtkWindowAccessibleClass.class =
  struct
    val getType_ = _import "gtk_window_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkWindowAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asWindow self = (GObjectObjectClass.FFI.withPtr ---> AtkWindowClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
