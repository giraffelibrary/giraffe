signature GIO_UNIX_MOUNT_MONITOR =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val setRateLimit :
      'a class_t
       -> LargeInt.int
       -> unit
    val mountpointsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val mountsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
