structure GtkToplevelAccessible :>
  GTK_TOPLEVEL_ACCESSIBLE
    where type 'a class = 'a GtkToplevelAccessibleClass.class =
  struct
    val getType_ = _import "gtk_toplevel_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkToplevelAccessibleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
