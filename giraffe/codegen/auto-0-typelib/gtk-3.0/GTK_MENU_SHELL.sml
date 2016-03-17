signature GTK_MENU_SHELL =
  sig
    type 'a class
    type 'a buildable_class
    type direction_type_t
    type 'a widget_class
    type menu_direction_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val activateItem :
      'a class
       -> 'b widget_class
       -> bool
       -> unit
    val append :
      'a class
       -> 'b widget_class
       -> unit
    val cancel : 'a class -> unit
    val deactivate : 'a class -> unit
    val deselect : 'a class -> unit
    val getParentShell : 'a class -> base widget_class
    val getSelectedItem : 'a class -> base widget_class
    val getTakeFocus : 'a class -> bool
    val insert :
      'a class
       -> 'b widget_class
       -> LargeInt.int
       -> unit
    val prepend :
      'a class
       -> 'b widget_class
       -> unit
    val selectFirst :
      'a class
       -> bool
       -> unit
    val selectItem :
      'a class
       -> 'b widget_class
       -> unit
    val setTakeFocus :
      'a class
       -> bool
       -> unit
    val activateCurrentSig : (bool -> unit) -> 'a class Signal.signal
    val cancelSig : (unit -> unit) -> 'a class Signal.signal
    val cycleFocusSig : (direction_type_t -> unit) -> 'a class Signal.signal
    val deactivateSig : (unit -> unit) -> 'a class Signal.signal
    val insertSig :
      (base widget_class
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val moveCurrentSig : (menu_direction_type_t -> unit) -> 'a class Signal.signal
    val moveSelectedSig : (LargeInt.int -> bool) -> 'a class Signal.signal
    val selectionDoneSig : (unit -> unit) -> 'a class Signal.signal
    val takeFocusProp : ('a class, bool, bool) Property.readwrite
  end
