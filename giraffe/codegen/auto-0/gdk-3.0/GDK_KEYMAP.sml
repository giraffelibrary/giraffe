signature GDK_KEYMAP =
  sig
    type 'a class_t
    type modifiertype_t
    type keymapkeyrecord_t
    type 'a displayclass_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getForDisplay : 'a displayclass_t -> base class_t
    val addVirtualModifiers : 'a class_t -> modifiertype_t
    val getCapsLockState : 'a class_t -> bool
    val getDirection : 'a class_t -> Pango.Direction.t
    val getNumLockState : 'a class_t -> bool
    val haveBidiLayouts : 'a class_t -> bool
    val lookupKey :
      'a class_t
       -> keymapkeyrecord_t
       -> LargeInt.int
    val mapVirtualModifiers : 'a class_t -> modifiertype_t option
    val translateKeyboardState :
      'a class_t
       -> LargeInt.int
       -> modifiertype_t
       -> LargeInt.int
       -> (LargeInt.int
            * LargeInt.int
            * LargeInt.int
            * modifiertype_t)
            option
    val directionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val keysChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val stateChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
