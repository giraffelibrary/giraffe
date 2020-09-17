structure GtkRadioMenuItem :>
  GTK_RADIO_MENU_ITEM
    where type 'a class = 'a GtkRadioMenuItemClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_menu_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_from_widget") (GtkRadioMenuItemClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabelFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_with_label_from_widget") (GtkRadioMenuItemClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonicFromWidget_ = call (getSymbol "gtk_radio_menu_item_new_with_mnemonic_from_widget") (GtkRadioMenuItemClass.PolyML.cOptPtr &&> Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val joinGroup_ = call (getSymbol "gtk_radio_menu_item_join_group") (GtkRadioMenuItemClass.PolyML.cPtr &&> GtkRadioMenuItemClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkRadioMenuItemClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget group = (GtkRadioMenuItemClass.FFI.withOptPtr false ---> GtkRadioMenuItemClass.FFI.fromPtr false) newFromWidget_ group before GtkRadioMenuItemClass.FFI.touchOptPtr group
    fun newWithLabelFromWidget (group, label) = (GtkRadioMenuItemClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithLabelFromWidget_ (group & label) before GtkRadioMenuItemClass.FFI.touchOptPtr group before Utf8.FFI.touchOptPtr label
    fun newWithMnemonicFromWidget (group, label) = (GtkRadioMenuItemClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithMnemonicFromWidget_ (group & label) before GtkRadioMenuItemClass.FFI.touchOptPtr group before Utf8.FFI.touchOptPtr label
    fun joinGroup self groupSource = (GtkRadioMenuItemClass.FFI.withPtr false &&&> GtkRadioMenuItemClass.FFI.withOptPtr false ---> I) joinGroup_ (self & groupSource)
    local
      open ClosureMarshal Signal
    in
      fun groupChangedSig f = signal "group-changed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val groupProp =
        {
          name = "group",
          gtype = fn () => C.gtype GtkRadioMenuItemClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkRadioMenuItemClass.tOpt x,
          init = fn x => C.set GtkRadioMenuItemClass.tOpt x
        }
    end
  end
