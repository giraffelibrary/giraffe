structure GtkComboBoxAccessible :>
  GTK_COMBO_BOX_ACCESSIBLE
    where type 'a class = 'a GtkComboBoxAccessibleClass.class =
  struct
    val getType_ = _import "gtk_combo_box_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkComboBoxAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr false ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
