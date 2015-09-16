signature GDK_KEYMAP =
  sig
    type 'a class_t
    type 'a display_class_t
    type keymap_key_record_t
    type modifier_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getForDisplay : 'a display_class_t -> base class_t
    val addVirtualModifiers : 'a class_t -> modifier_type_t
    val getCapsLockState : 'a class_t -> bool
    val getDirection : 'a class_t -> Pango.Direction.t
    val getNumLockState : 'a class_t -> bool
    val haveBidiLayouts : 'a class_t -> bool
    val lookupKey :
      'a class_t
       -> keymap_key_record_t
       -> LargeInt.int
    val mapVirtualModifiers : 'a class_t -> modifier_type_t option
    val translateKeyboardState :
      'a class_t
       -> LargeInt.int
       -> modifier_type_t
       -> LargeInt.int
       -> (LargeInt.int
            * LargeInt.int
            * LargeInt.int
            * modifier_type_t)
            option
    val directionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val keysChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val stateChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
