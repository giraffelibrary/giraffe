signature GTK_ACCEL_GROUP =
  sig
    type 'a class_t
    type accel_flags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val fromAccelClosure : GObject.ClosureRecord.t -> base class_t
    val activate :
      'a class_t
       -> GLib.Quark.t
       -> 'b GObject.ObjectClass.t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val connect :
      'a class_t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> accel_flags_t
       -> GObject.ClosureRecord.t
       -> unit
    val connectByPath :
      'a class_t
       -> string
       -> GObject.ClosureRecord.t
       -> unit
    val disconnect :
      'a class_t
       -> GObject.ClosureRecord.t option
       -> bool
    val disconnectKey :
      'a class_t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val getIsLocked : 'a class_t -> bool
    val getModifierMask : 'a class_t -> Gdk.ModifierType.t
    val lock : 'a class_t -> unit
    val unlock : 'a class_t -> unit
    val accelActivateSig :
      (base GObject.ObjectClass.t
        -> LargeInt.int
        -> Gdk.ModifierType.t
        -> bool)
       -> 'a class_t Signal.signal
    val accelChangedSig :
      (LargeInt.int
        -> Gdk.ModifierType.t
        -> GObject.ClosureRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val isLockedProp : ('a class_t, bool) Property.readonly
    val modifierMaskProp : ('a class_t, Gdk.ModifierType.t) Property.readonly
  end
