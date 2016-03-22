structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class = 'a GtkRadioButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_button_get_type" : unit -> GObjectType.C.val_;
    val newFromWidget_ = _import "gtk_radio_button_new_from_widget" : unit GtkRadioButtonClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithLabelFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_button_new_with_label_from_widget" :
              unit GtkRadioButtonClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
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
              unit GtkRadioButtonClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_button_join_group" : GtkRadioButtonClass.C.notnull GtkRadioButtonClass.C.p * unit GtkRadioButtonClass.C.p -> unit;) (x1, x2)
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
