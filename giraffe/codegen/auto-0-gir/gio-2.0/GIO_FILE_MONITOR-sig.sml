signature GIO_FILE_MONITOR =
  sig
    type 'a class
    type file_monitor_event_t
    type 'a file_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val cancel : 'a class -> bool
    val emitEvent :
      'a class
       -> 'b file_class
           * 'c file_class
           * file_monitor_event_t
       -> unit
    val isCancelled : 'a class -> bool
    val setRateLimit :
      'a class
       -> LargeInt.int
       -> unit
    val changedSig :
      (base file_class
        * base file_class option
        * file_monitor_event_t
        -> unit)
       -> 'a class Signal.t
    val cancelledProp : ('a class, unit -> bool, unit, unit) Property.t
    val rateLimitProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
