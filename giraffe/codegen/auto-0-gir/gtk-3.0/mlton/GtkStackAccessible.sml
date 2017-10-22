structure GtkStackAccessible :>
  GTK_STACK_ACCESSIBLE
    where type 'a class = 'a GtkStackAccessibleClass.class =
  struct
    val getType_ = _import "gtk_stack_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkStackAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
