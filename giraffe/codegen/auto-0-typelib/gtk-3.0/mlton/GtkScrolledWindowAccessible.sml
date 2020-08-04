structure GtkScrolledWindowAccessible :>
  GTK_SCROLLED_WINDOW_ACCESSIBLE
    where type 'a class = 'a GtkScrolledWindowAccessibleClass.class =
  struct
    val getType_ = _import "gtk_scrolled_window_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkScrolledWindowAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
