structure GtkRadioMenuItem :>
  GTK_RADIO_MENU_ITEM
    where type 'a class_t = 'a GtkRadioMenuItemClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_radio_menu_item_get_type" : unit -> GObjectType.C.val_;
    val newFromWidget_ = _import "gtk_radio_menu_item_new_from_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabelFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_menu_item_new_with_label_from_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
            _import "mlton_gtk_radio_menu_item_new_with_mnemonic_from_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkRadioMenuItemClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromWidget group = (GObjectObjectClass.C.withPtr ---> GtkRadioMenuItemClass.C.fromPtr false) newFromWidget_ group
    fun newWithLabelFromWidget group label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkRadioMenuItemClass.C.fromPtr false) newWithLabelFromWidget_ (group & label)
    fun newWithMnemonicFromWidget group label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkRadioMenuItemClass.C.fromPtr false) newWithMnemonicFromWidget_ (group & label)
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
