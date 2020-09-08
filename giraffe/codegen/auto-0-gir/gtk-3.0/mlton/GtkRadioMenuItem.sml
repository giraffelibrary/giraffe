structure GtkRadioMenuItem :>
  GTK_RADIO_MENU_ITEM
    where type 'a class = 'a GtkRadioMenuItemClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_menu_item_get_type" : unit -> GObjectType.FFI.val_;
    val newFromWidget_ = _import "gtk_radio_menu_item_new_from_widget" : GtkRadioMenuItemClass.FFI.opt GtkRadioMenuItemClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabelFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_menu_item_new_with_label_from_widget" :
              GtkRadioMenuItemClass.FFI.opt GtkRadioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
            _import "mlton_gtk_radio_menu_item_new_with_mnemonic_from_widget" :
              GtkRadioMenuItemClass.FFI.opt GtkRadioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_menu_item_join_group" : GtkRadioMenuItemClass.FFI.non_opt GtkRadioMenuItemClass.FFI.p * GtkRadioMenuItemClass.FFI.opt GtkRadioMenuItemClass.FFI.p -> unit;) (x1, x2)
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
    fun newFromWidget group = (GtkRadioMenuItemClass.FFI.withOptPtr false ---> GtkRadioMenuItemClass.FFI.fromPtr false) newFromWidget_ group
    fun newWithLabelFromWidget (group, label) = (GtkRadioMenuItemClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithLabelFromWidget_ (group & label)
    fun newWithMnemonicFromWidget (group, label) = (GtkRadioMenuItemClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkRadioMenuItemClass.FFI.fromPtr false) newWithMnemonicFromWidget_ (group & label)
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
