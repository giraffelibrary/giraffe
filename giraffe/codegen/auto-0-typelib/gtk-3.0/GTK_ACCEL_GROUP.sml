signature GTK_ACCEL_GROUP =
  sig
    type 'a class
    type accel_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val fromAccelClosure : GObject.ClosureRecord.t -> base class
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
    val unlock : 'a class -> unit
    val accelActivateSig :
      (base GObject.ObjectClass.class
        * LargeInt.int
        * Gdk.ModifierType.t
        -> bool)
       -> 'a class Signal.signal
    val accelChangedSig :
      (LargeInt.int
        * Gdk.ModifierType.t
        * GObject.ClosureRecord.t
        -> unit)
       -> 'a class Signal.signal
    val isLockedProp : ('a class, bool) Property.readonly
    val modifierMaskProp : ('a class, Gdk.ModifierType.t) Property.readonly
  end
