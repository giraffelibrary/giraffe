structure GtkPopoverAccessible :>
  GTK_POPOVER_ACCESSIBLE
    where type 'a class = 'a GtkPopoverAccessibleClass.class =
  struct
    val getType_ = _import "gtk_popover_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkPopoverAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
