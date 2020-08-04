structure GtkRadioButton :>
  GTK_RADIO_BUTTON
    where type 'a class = 'a GtkRadioButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_button_get_type" : unit -> GObjectType.FFI.val_;
    val newFromWidget_ = _import "gtk_radio_button_new_from_widget" : GtkRadioButtonClass.FFI.opt GtkRadioButtonClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabelFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_button_new_with_label_from_widget" :
              GtkRadioButtonClass.FFI.opt GtkRadioButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkRadioButtonClass.FFI.opt GtkRadioButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_button_join_group" : GtkRadioButtonClass.FFI.non_opt GtkRadioButtonClass.FFI.p * GtkRadioButtonClass.FFI.opt GtkRadioButtonClass.FFI.p -> unit;) (x1, x2)
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
      open Property
    in
      val groupProp =
        {
          set = fn x => set "group" GtkRadioButtonClass.tOpt x,
          new = fn x => new "group" GtkRadioButtonClass.tOpt x
        }
    end
  end
