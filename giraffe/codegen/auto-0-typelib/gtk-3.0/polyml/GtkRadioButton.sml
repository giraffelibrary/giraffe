structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class = 'a GtkRadioButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (getSymbol "gtk_radio_button_new_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabelFromWidget_ = call (getSymbol "gtk_radio_button_new_with_label_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonicFromWidget_ = call (getSymbol "gtk_radio_button_new_with_mnemonic_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val joinGroup_ = call (getSymbol "gtk_radio_button_join_group") (GtkRadioButtonClass.PolyML.cPtr &&> GtkRadioButtonClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkRadioButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget radioGroupMember = (GtkRadioButtonClass.FFI.withOptPtr false ---> GtkRadioButtonClass.FFI.fromPtr false) newFromWidget_ radioGroupMember
    fun newWithLabelFromWidget (radioGroupMember, label) = (GtkRadioButtonClass.FFI.withOptPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkRadioButtonClass.FFI.fromPtr false) newWithLabelFromWidget_ (radioGroupMember & label)
    fun newWithMnemonicFromWidget (radioGroupMember, label) = (GtkRadioButtonClass.FFI.withOptPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkRadioButtonClass.FFI.fromPtr false) newWithMnemonicFromWidget_ (radioGroupMember & label)
    fun joinGroup self groupSource = (GtkRadioButtonClass.FFI.withPtr false &&&> GtkRadioButtonClass.FFI.withOptPtr false ---> I) joinGroup_ (self & groupSource)
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
          gtype = fn () => C.gtype GtkRadioButtonClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkRadioButtonClass.tOpt x,
          init = fn x => C.set GtkRadioButtonClass.tOpt x
        }
    end
  end
