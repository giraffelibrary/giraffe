structure GtkRadioButtonAccessible :>
  GTK_RADIO_BUTTON_ACCESSIBLE
    where type 'a class = 'a GtkRadioButtonAccessibleClass.class =
  struct
    val getType_ = _import "gtk_radio_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkRadioButtonAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr false ---> AtkImageClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
