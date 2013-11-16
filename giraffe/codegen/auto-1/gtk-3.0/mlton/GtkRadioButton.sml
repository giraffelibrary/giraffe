structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class_t = 'a GtkRadioButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_radio_button_get_type" : unit -> GObjectType.C.val_;
    val newFromWidget_ = _import "gtk_radio_button_new_from_widget" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabelFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_button_new_with_label_from_widget" :
              unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithMnemonicFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_button_new_with_mnemonic_from_widget" :
              unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_button_join_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkRadioButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
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
