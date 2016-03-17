signature GDK_KEYMAP =
  sig
    type 'a class
    type 'a display_class
    type keymap_key_t
    type modifier_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getForDisplay : 'a display_class -> base class
    val addVirtualModifiers : 'a class -> modifier_type_t
    val getCapsLockState : 'a class -> bool
    val getDirection : 'a class -> Pango.Direction.t
    val getNumLockState : 'a class -> bool
    val haveBidiLayouts : 'a class -> bool
    val lookupKey :
      'a class
       -> keymap_key_t
       -> LargeInt.int
    val mapVirtualModifiers : 'a class -> modifier_type_t option
    val translateKeyboardState :
      'a class
       -> LargeInt.int
       -> modifier_type_t
       -> LargeInt.int
       -> (LargeInt.int
            * LargeInt.int
            * LargeInt.int
            * modifier_type_t)
            option
    val directionChangedSig : (unit -> unit) -> 'a class Signal.signal
    val keysChangedSig : (unit -> unit) -> 'a class Signal.signal
    val stateChangedSig : (unit -> unit) -> 'a class Signal.signal
  end
