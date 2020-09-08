signature GTK_ACCEL_GROUP =
  sig
    type 'a class
    type accel_flags_t
    type accel_group_entry_record_c_array_n_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val fromAccelClosure : GObject.ClosureRecord.t -> base class option
    val activate :
      'a class
       -> LargeInt.int
           * 'b GObject.ObjectClass.class
           * LargeInt.int
           * Gdk.ModifierType.t
       -> bool
    val connect :
      'a class
       -> LargeInt.int
           * Gdk.ModifierType.t
           * accel_flags_t
           * GObject.ClosureRecord.t
       -> unit
    val connectByPath :
      'a class
       -> string * GObject.ClosureRecord.t
       -> unit
    val disconnect :
      'a class
       -> GObject.ClosureRecord.t option
       -> bool
    val disconnectKey :
      'a class
       -> LargeInt.int * Gdk.ModifierType.t
       -> bool
    val getIsLocked : 'a class -> bool
    val getModifierMask : 'a class -> Gdk.ModifierType.t
    val lock : 'a class -> unit
    val query :
      'a class
       -> LargeInt.int * Gdk.ModifierType.t
       -> accel_group_entry_record_c_array_n_t option
    val unlock : 'a class -> unit
    val accelActivateSig :
      (base GObject.ObjectClass.class
        * LargeInt.int
        * Gdk.ModifierType.t
        -> bool)
       -> 'a class Signal.t
    val accelChangedSig :
      (LargeInt.int
        * Gdk.ModifierType.t
        * GObject.ClosureRecord.t
        -> unit)
       -> 'a class Signal.t
    val isLockedProp : ('a class, unit -> bool, unit, unit) Property.t
    val modifierMaskProp : ('a class, unit -> Gdk.ModifierType.t, unit, unit) Property.t
  end
