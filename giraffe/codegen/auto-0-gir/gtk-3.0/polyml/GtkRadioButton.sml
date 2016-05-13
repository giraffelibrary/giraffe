structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class = 'a GtkRadioButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabelFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_with_label_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonicFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_with_mnemonic_from_widget") (GtkRadioButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val joinGroup_ = call (load_sym libgtk "gtk_radio_button_join_group") (GtkRadioButtonClass.PolyML.cPtr &&> GtkRadioButtonClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkRadioButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromWidget radioGroupMember = (GtkRadioButtonClass.C.withOptPtr ---> GtkRadioButtonClass.C.fromPtr false) newFromWidget_ radioGroupMember
    fun newWithLabelFromWidget radioGroupMember label = (GtkRadioButtonClass.C.withOptPtr &&&> Utf8.C.withPtr ---> GtkRadioButtonClass.C.fromPtr false) newWithLabelFromWidget_ (radioGroupMember & label)
    fun newWithMnemonicFromWidget radioGroupMember label = (GtkRadioButtonClass.C.withOptPtr &&&> Utf8.C.withPtr ---> GtkRadioButtonClass.C.fromPtr false) newWithMnemonicFromWidget_ (radioGroupMember & label)
    fun joinGroup self groupSource = (GtkRadioButtonClass.C.withPtr &&&> GtkRadioButtonClass.C.withOptPtr ---> I) joinGroup_ (self & groupSource)
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
