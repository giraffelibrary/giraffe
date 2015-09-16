structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class_t = 'a GtkRadioButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_from_widget") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithLabelFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_with_label_from_widget") (GObjectObjectClass.PolyML.OPTPTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMnemonicFromWidget_ = call (load_sym libgtk "gtk_radio_button_new_with_mnemonic_from_widget") (GObjectObjectClass.PolyML.OPTPTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val joinGroup_ = call (load_sym libgtk "gtk_radio_button_join_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkRadioButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromWidget radioGroupMember = (GObjectObjectClass.C.withOptPtr ---> GtkRadioButtonClass.C.fromPtr false) newFromWidget_ radioGroupMember
    fun newWithLabelFromWidget radioGroupMember label = (GObjectObjectClass.C.withOptPtr &&&> FFI.String.C.withConstPtr ---> GtkRadioButtonClass.C.fromPtr false) newWithLabelFromWidget_ (radioGroupMember & label)
    fun newWithMnemonicFromWidget radioGroupMember label = (GObjectObjectClass.C.withOptPtr &&&> FFI.String.C.withConstPtr ---> GtkRadioButtonClass.C.fromPtr false) newWithMnemonicFromWidget_ (radioGroupMember & label)
    fun joinGroup self groupSource = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) joinGroup_ (self & groupSource)
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
