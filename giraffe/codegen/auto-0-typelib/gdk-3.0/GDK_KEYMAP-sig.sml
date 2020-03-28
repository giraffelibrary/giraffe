signature GDK_KEYMAP =
  sig
    type 'a class
    type 'a display_class
    type keymap_key_record_c_array_n_t
    type modifier_intent_t
    type keymap_key_t
    type modifier_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getForDisplay : 'a display_class -> base class
    val addVirtualModifiers :
      'a class
       -> modifier_type_t
       -> modifier_type_t
    val getCapsLockState : 'a class -> bool
    val getDirection : 'a class -> Pango.Direction.t
    val getEntriesForKeycode :
      'a class
       -> LargeInt.int
       -> (keymap_key_record_c_array_n_t * GUInt32CArrayN.t) option
    val getEntriesForKeyval :
      'a class
       -> LargeInt.int
       -> keymap_key_record_c_array_n_t option
    val getModifierMask :
      'a class
       -> modifier_intent_t
       -> modifier_type_t
    val getModifierState : 'a class -> LargeInt.int
    val getNumLockState : 'a class -> bool
    val getScrollLockState : 'a class -> bool
    val haveBidiLayouts : 'a class -> bool
    val lookupKey :
      'a class
       -> keymap_key_t
       -> LargeInt.int
    val mapVirtualModifiers :
      'a class
       -> modifier_type_t
       -> bool * modifier_type_t
    val translateKeyboardState :
      'a class
       -> LargeInt.int
           * modifier_type_t
           * LargeInt.int
       -> (LargeInt.int
            * LargeInt.int
            * LargeInt.int
            * modifier_type_t)
            option
    val directionChangedSig : (unit -> unit) -> 'a class Signal.t
    val keysChangedSig : (unit -> unit) -> 'a class Signal.t
    val stateChangedSig : (unit -> unit) -> 'a class Signal.t
  end
