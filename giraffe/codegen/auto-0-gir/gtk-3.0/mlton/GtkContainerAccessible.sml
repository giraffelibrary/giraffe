structure GtkContainerAccessible :>
  GTK_CONTAINER_ACCESSIBLE
    where type 'a class = 'a GtkContainerAccessibleClass.class =
  struct
    val getType_ = _import "gtk_container_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkContainerAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
