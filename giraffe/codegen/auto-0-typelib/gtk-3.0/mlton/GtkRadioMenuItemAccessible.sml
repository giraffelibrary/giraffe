structure GtkRadioMenuItemAccessible :>
  GTK_RADIO_MENU_ITEM_ACCESSIBLE
    where type 'a class = 'a GtkRadioMenuItemAccessibleClass.class =
  struct
    val getType_ = _import "gtk_radio_menu_item_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkRadioMenuItemAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
