signature GIO_UNIX_MOUNT_MONITOR =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val get : unit -> base class
    val setRateLimit :
      'a class
       -> LargeInt.int
       -> unit
    val mountpointsChangedSig : (unit -> unit) -> 'a class Signal.t
    val mountsChangedSig : (unit -> unit) -> 'a class Signal.t
  end
