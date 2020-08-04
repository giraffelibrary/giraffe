structure GtkArrowAccessible :>
  GTK_ARROW_ACCESSIBLE
    where type 'a class = 'a GtkArrowAccessibleClass.class =
  struct
    val getType_ = _import "gtk_arrow_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkArrowAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr false ---> AtkImageClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
