structure GtkSpinButtonAccessible :>
  GTK_SPIN_BUTTON_ACCESSIBLE
    where type 'a class = 'a GtkSpinButtonAccessibleClass.class =
  struct
    val getType_ = _import "gtk_spin_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkSpinButtonAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.FFI.withPtr ---> AtkValueClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
