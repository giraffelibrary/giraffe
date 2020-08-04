structure GtkSpinButtonAccessible :>
  GTK_SPIN_BUTTON_ACCESSIBLE
    where type 'a class = 'a GtkSpinButtonAccessibleClass.class =
  struct
    val getType_ = _import "gtk_spin_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkSpinButtonAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr false ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr false ---> AtkTextClass.FFI.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.FFI.withPtr false ---> AtkValueClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
