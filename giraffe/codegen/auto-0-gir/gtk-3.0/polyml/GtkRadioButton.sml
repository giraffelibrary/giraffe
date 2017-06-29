structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class = 'a GtkRadioButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (getSymbol "gtk_radio_button_new_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabelFromWidget_ = call (getSymbol "gtk_radio_button_new_with_label_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonicFromWidget_ = call (getSymbol "gtk_radio_button_new_with_mnemonic_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val joinGroup_ = call (getSymbol "gtk_radio_button_join_group") (GtkRadioButtonClass.PolyML.cPtr &&> GtkRadioButtonClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkRadioButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget radioGroupMember = (GtkRadioButtonClass.FFI.withOptPtr ---> GtkRadioButtonClass.FFI.fromPtr false) newFromWidget_ radioGroupMember
    fun newWithLabelFromWidget radioGroupMember label = (GtkRadioButtonClass.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> GtkRadioButtonClass.FFI.fromPtr false) newWithLabelFromWidget_ (radioGroupMember & label)
    fun newWithMnemonicFromWidget radioGroupMember label = (GtkRadioButtonClass.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> GtkRadioButtonClass.FFI.fromPtr false) newWithMnemonicFromWidget_ (radioGroupMember & label)
    fun joinGroup self groupSource = (GtkRadioButtonClass.FFI.withPtr &&&> GtkRadioButtonClass.FFI.withOptPtr ---> I) joinGroup_ (self & groupSource)
    local
      open ClosureMarshal Signal
    in
      fun groupChangedSig f = signal "group-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val groupProp = {set = fn x => set "group" GtkRadioButtonClass.tOpt x}
    end
  end
