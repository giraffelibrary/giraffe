structure GtkScaleAccessible :>
  GTK_SCALE_ACCESSIBLE
    where type 'a class = 'a GtkScaleAccessibleClass.class =
  struct
    val getType_ = _import "gtk_scale_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkScaleAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.FFI.withPtr ---> AtkValueClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
