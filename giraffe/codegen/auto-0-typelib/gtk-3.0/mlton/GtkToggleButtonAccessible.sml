structure GtkToggleButtonAccessible :>
  GTK_TOGGLE_BUTTON_ACCESSIBLE
    where type 'a class = 'a GtkToggleButtonAccessibleClass.class =
  struct
    val getType_ = _import "gtk_toggle_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkToggleButtonAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr ---> AtkImageClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
