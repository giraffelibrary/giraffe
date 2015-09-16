signature GTK_MENU_SHELL =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type direction_type_t
    type 'a widget_class_t
    type menu_direction_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val activateItem :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> unit
    val append :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val cancel : 'a class_t -> unit
    val deactivate : 'a class_t -> unit
    val deselect : 'a class_t -> unit
    val getParentShell : 'a class_t -> base widget_class_t
    val getSelectedItem : 'a class_t -> base widget_class_t
    val getTakeFocus : 'a class_t -> bool
    val insert :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> unit
    val prepend :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val selectFirst :
      'a class_t
       -> bool
       -> unit
    val selectItem :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val setTakeFocus :
      'a class_t
       -> bool
       -> unit
    val activateCurrentSig : (bool -> unit) -> 'a class_t Signal.signal
    val cancelSig : (unit -> unit) -> 'a class_t Signal.signal
    val cycleFocusSig : (direction_type_t -> unit) -> 'a class_t Signal.signal
    val deactivateSig : (unit -> unit) -> 'a class_t Signal.signal
    val insertSig :
      (base widget_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val moveCurrentSig : (menu_direction_type_t -> unit) -> 'a class_t Signal.signal
    val moveSelectedSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val selectionDoneSig : (unit -> unit) -> 'a class_t Signal.signal
    val takeFocusProp : ('a class_t, bool, bool) Property.readwrite
  end
