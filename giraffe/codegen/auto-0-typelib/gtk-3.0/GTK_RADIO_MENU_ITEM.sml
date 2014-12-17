signature GTK_RADIO_MENU_ITEM =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val newFromWidget : 'a class_t -> base class_t
    val newWithLabelFromWidget :
      'a class_t
       -> string
       -> base class_t
    val newWithMnemonicFromWidget :
      'a class_t
       -> string
       -> base class_t
    val groupChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val groupProp : ('a class_t, 'b class_t option) Property.writeonly
  end
