signature GTK_MENU_SHELL =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type directiontype_t
    type 'a widgetclass_t
    type menudirectiontype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val activateItem :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val append :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val cancel : 'a class_t -> unit
    val deactivate : 'a class_t -> unit
    val deselect : 'a class_t -> unit
    val getParentShell : 'a class_t -> base widgetclass_t
    val getSelectedItem : 'a class_t -> base widgetclass_t
    val getTakeFocus : 'a class_t -> bool
    val insert :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> unit
    val prepend :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val selectFirst :
      'a class_t
       -> bool
       -> unit
    val selectItem :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setTakeFocus :
      'a class_t
       -> bool
       -> unit
    val activateCurrentSig : (bool -> unit) -> 'a class_t Signal.signal
    val cancelSig : (unit -> unit) -> 'a class_t Signal.signal
    val cycleFocusSig : (directiontype_t -> unit) -> 'a class_t Signal.signal
    val deactivateSig : (unit -> unit) -> 'a class_t Signal.signal
    val insertSig :
      (base widgetclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val moveCurrentSig : (menudirectiontype_t -> unit) -> 'a class_t Signal.signal
    val moveSelectedSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val selectionDoneSig : (unit -> unit) -> 'a class_t Signal.signal
    val takeFocusProp : ('a class_t, bool, bool) Property.readwrite
  end
