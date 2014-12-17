signature GIO_FILE_MONITOR =
  sig
    type 'a class_t
    type filemonitorevent_t
    type 'a fileclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val cancel : 'a class_t -> bool
    val emitEvent :
      'a class_t
       -> 'b fileclass_t
       -> 'c fileclass_t
       -> filemonitorevent_t
       -> unit
    val isCancelled : 'a class_t -> bool
    val setRateLimit :
      'a class_t
       -> LargeInt.int
       -> unit
    val changedSig :
      (base fileclass_t
        -> base fileclass_t
        -> filemonitorevent_t
        -> unit)
       -> 'a class_t Signal.signal
    val cancelledProp : ('a class_t, bool) Property.readonly
    val rateLimitProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
