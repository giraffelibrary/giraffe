signature GTK_ACCEL_MAP =
  sig
    type 'a class
    type accel_key_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val addEntry :
      string
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> unit
    val addFilter : string -> unit
    val changeEntry :
      string
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
       -> bool
    val get : unit -> base class
    val load : string -> unit
    val loadFd : LargeInt.int -> unit
    val lockPath : string -> unit
    val lookupEntry : string -> accel_key_t option
    val save : string -> unit
    val saveFd : LargeInt.int -> unit
    val unlockPath : string -> unit
    val changedSig :
      (string
        -> LargeInt.int
        -> Gdk.ModifierType.t
        -> unit)
       -> 'a class Signal.signal
  end
