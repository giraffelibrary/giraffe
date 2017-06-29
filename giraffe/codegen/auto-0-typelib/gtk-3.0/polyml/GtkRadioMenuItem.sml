structure GtkRadioMenuItem :>
  GTK_RADIO_MENU_ITEM
    where type 'a class = 'a GtkRadioMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_menu_item_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_from_widget") (GtkRadioMenuItemClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabelFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_with_label_from_widget") (GtkRadioMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonicFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_with_mnemonic_from_widget") (GtkRadioMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkRadioMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget group = (GtkRadioMenuItemClass.FFI.withPtr ---> GtkRadioMenuItemClass.FFI.fromPtr false) newFromWidget_ group
    fun newWithLabelFromWidget group label = (GtkRadioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithLabelFromWidget_ (group & label)
    fun newWithMnemonicFromWidget group label = (GtkRadioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithMnemonicFromWidget_ (group & label)
    local
      open ClosureMarshal Signal
    in
      fun groupChangedSig f = signal "group-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val groupProp = {set = fn x => set "group" GtkRadioMenuItemClass.tOpt x}
    end
  end
